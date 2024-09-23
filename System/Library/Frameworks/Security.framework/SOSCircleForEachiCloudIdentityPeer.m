@implementation SOSCircleForEachiCloudIdentityPeer

BOOL __SOSCircleForEachiCloudIdentityPeer_block_invoke(uint64_t a1, uint64_t a2)
{
  return SOSPeerInfoIsCloudIdentity(a2);
}

@end
