@implementation APReceiverStatsCollectorSetMirroringMode

uint64_t __APReceiverStatsCollectorSetMirroringMode_block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 260) = *(_DWORD *)(result + 40);
  return result;
}

@end
