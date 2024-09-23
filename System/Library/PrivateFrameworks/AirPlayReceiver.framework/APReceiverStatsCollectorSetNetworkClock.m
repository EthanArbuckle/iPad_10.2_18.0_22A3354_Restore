@implementation APReceiverStatsCollectorSetNetworkClock

void __APReceiverStatsCollectorSetNetworkClock_block_invoke(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  v3 = *(const void **)(v2 + 272);
  *(_QWORD *)(v2 + 272) = v1;
  if (v1)
    CFRetain(v1);
  if (v3)
    CFRelease(v3);
}

@end
