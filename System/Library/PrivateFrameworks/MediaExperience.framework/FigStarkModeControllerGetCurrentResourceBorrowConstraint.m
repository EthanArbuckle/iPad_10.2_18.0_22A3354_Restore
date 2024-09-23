@implementation FigStarkModeControllerGetCurrentResourceBorrowConstraint

uint64_t __FigStarkModeControllerGetCurrentResourceBorrowConstraint_block_invoke(uint64_t a1)
{
  uint64_t result;
  _DWORD *v3;

  result = FigCFEqual();
  if ((_DWORD)result)
  {
    v3 = (_DWORD *)(*(_QWORD *)(a1 + 48) + 72);
  }
  else
  {
    result = FigCFEqual();
    if (!(_DWORD)result)
      return result;
    v3 = (_DWORD *)(*(_QWORD *)(a1 + 48) + 40);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *v3;
  return result;
}

@end
