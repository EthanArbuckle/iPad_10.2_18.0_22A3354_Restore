@implementation KCJoiningRequestAccountCircleDelegate

- (__OpaqueSOSPeerInfo)copyPeerInfoError:(id *)a3
{
  return (__OpaqueSOSPeerInfo *)SOSCCCopyApplication();
}

- (BOOL)processCircleJoinData:(id)a3 version:(int)a4 error:(id *)a5
{
  return SOSCCJoinWithCircleJoiningBlob();
}

+ (id)delegate
{
  return objc_alloc_init(KCJoiningRequestAccountCircleDelegate);
}

@end
