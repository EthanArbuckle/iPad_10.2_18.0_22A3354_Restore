@implementation Invalidate

uint64_t __hoseSBARMock_Invalidate_block_invoke()
{
  return hoseSBARMock_invalidateInternal();
}

void __hoseSBAR_Invalidate_block_invoke(uint64_t a1)
{
  hoseSBAR_invalidateInternal(*(_QWORD *)(a1 + 32));
}

@end
