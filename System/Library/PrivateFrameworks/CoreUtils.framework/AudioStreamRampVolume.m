@implementation AudioStreamRampVolume

void __AudioStreamRampVolume_block_invoke(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(NSObject **)(v1 + 136);
  if (v2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)(v1 + 136));
    dispatch_release(v2);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136) = 0;
  }
}

@end
