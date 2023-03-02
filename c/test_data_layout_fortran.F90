
#define N 3
#define M 4

! ----------------------------------------------------------------------
program main
! ----------------------------------------------------------------------
  implicit none

  interface
    subroutine print_matrix_fortran(A) bind(C)
      use iso_c_binding
      implicit none

      real(C_DOUBLE) A(N, M)
    end subroutine print_matrix_fortran
  end interface

  real*8 A(N, M)
  integer i, j

  do i = 1, N
     do j = 1, M
        A(i, j) = i * 10 + j
     end do
  end do

  print *, 'print_matrix_fortran'
  call print_matrix_fortran(A)

end program main
