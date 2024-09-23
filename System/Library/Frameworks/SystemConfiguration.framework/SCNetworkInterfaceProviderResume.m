@implementation SCNetworkInterfaceProviderResume

uint64_t __SCNetworkInterfaceProviderResume_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(result + 72))
  {
    *(_BYTE *)(result + 72) = 1;
    return SCNetworkInterfaceProviderCheck(result);
  }
  return result;
}

@end
