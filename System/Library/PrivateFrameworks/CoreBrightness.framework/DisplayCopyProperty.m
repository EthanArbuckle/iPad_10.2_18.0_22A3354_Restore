@implementation DisplayCopyProperty

uint64_t __DisplayCopyProperty_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _DisplayCopyPropertyInternal(*(_QWORD *)(a1 + 40), *(const void **)(a1 + 48));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
