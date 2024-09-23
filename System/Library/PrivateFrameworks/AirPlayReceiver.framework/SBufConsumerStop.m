@implementation SBufConsumerStop

void ___SBufConsumerStop_block_invoke(uint64_t a1)
{
  uint64_t v2;

  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 144), 0xFFFFFFFFFFFFFFFFLL, 0, 0);
  v2 = *(_QWORD *)(a1 + 32);
  *(_QWORD *)(v2 + 152) = 0;
  *(_QWORD *)(v2 + 160) = 0;
}

@end
