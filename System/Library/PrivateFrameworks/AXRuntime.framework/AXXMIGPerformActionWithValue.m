@implementation AXXMIGPerformActionWithValue

uint64_t ___AXXMIGPerformActionWithValue_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = ((uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, uint64_t, _QWORD))*(&xmmword_1ECEBEB20 + 1))(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), gUserData, *(unsigned int *)(a1 + 52));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
