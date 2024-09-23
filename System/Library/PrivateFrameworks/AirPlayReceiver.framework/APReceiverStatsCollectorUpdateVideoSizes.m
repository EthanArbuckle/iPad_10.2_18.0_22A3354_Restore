@implementation APReceiverStatsCollectorUpdateVideoSizes

__n128 __APReceiverStatsCollectorUpdateVideoSizes_block_invoke(uint64_t a1)
{
  __n128 result;

  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 144) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(*(_QWORD *)(a1 + 32) + 176) = *(_OWORD *)(a1 + 56);
  result = *(__n128 *)(a1 + 72);
  *(__n128 *)(*(_QWORD *)(a1 + 32) + 160) = result;
  return result;
}

@end
