@implementation DisplayUpdateAAPState

uint64_t __DisplayUpdateAAPState_block_invoke(uint64_t a1)
{
  return __DisplayUpdateAAPStateInternal(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_BYTE *)(a1 + 48) & 1);
}

@end
