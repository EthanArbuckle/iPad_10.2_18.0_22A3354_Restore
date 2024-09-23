@implementation SOSCircleForEachValidPeer

uint64_t __SOSCircleForEachValidPeer_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v4;

  if (a2)
  {
    v4 = *(const __CFDictionary **)(a2 + 16);
    if (v4)
    {
      if (CFDictionaryGetValue(v4, CFSTR("RetirementDate")))
        return 0;
    }
  }
  if (SOSPeerInfoIsCloudIdentity(a2))
    return 0;
  else
    return SOSPeerInfoApplicationVerify(a2, *(__SecKey **)(a1 + 32), 0);
}

@end
