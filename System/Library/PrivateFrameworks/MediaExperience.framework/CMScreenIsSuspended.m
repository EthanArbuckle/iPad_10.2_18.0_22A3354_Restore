@implementation CMScreenIsSuspended

uint64_t __CMScreenIsSuspended_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigCFEqual();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
