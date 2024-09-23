@implementation SOSCircleForEachActiveValidPeer

uint64_t __SOSCircleForEachActiveValidPeer_block_invoke(uint64_t a1, uint64_t a2)
{
  return SOSPeerInfoApplicationVerify(a2, *(__SecKey **)(a1 + 32), 0);
}

@end
