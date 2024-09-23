@implementation SOSCircleForEachPeer

BOOL __SOSCircleForEachPeer_block_invoke(uint64_t a1, uint64_t a2)
{
  const __CFDictionary *v3;

  return (!a2 || (v3 = *(const __CFDictionary **)(a2 + 16)) == 0 || !CFDictionaryGetValue(v3, CFSTR("RetirementDate")))
      && !SOSPeerInfoIsCloudIdentity(a2);
}

@end
