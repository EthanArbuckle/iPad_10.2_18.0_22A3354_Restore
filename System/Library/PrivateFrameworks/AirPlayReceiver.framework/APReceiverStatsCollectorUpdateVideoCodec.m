@implementation APReceiverStatsCollectorUpdateVideoCodec

uint64_t __APReceiverStatsCollectorUpdateVideoCodec_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 192) = *(_DWORD *)(result + 40);
  return result;
}

@end
