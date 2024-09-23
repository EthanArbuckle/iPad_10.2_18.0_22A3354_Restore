@implementation AXXMIGPerformAction

uint64_t ___AXXMIGPerformAction_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = xmmword_1ECEBEB20(*(_QWORD *)(a1 + 44), *(_QWORD *)(a1 + 52), *(unsigned int *)(a1 + 40), gUserData);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
