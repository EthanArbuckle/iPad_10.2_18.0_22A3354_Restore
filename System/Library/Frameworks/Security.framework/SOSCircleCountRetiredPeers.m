@implementation SOSCircleCountRetiredPeers

uint64_t __SOSCircleCountRetiredPeers_block_invoke(uint64_t result)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

@end
