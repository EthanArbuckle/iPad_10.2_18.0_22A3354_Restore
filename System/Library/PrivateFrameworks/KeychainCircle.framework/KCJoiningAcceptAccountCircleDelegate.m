@implementation KCJoiningAcceptAccountCircleDelegate

- (id)circleJoinDataFor:(__OpaqueSOSPeerInfo *)a3 error:(id *)a4
{
  return (id)SOSCCCopyCircleJoiningBlob();
}

- (id)circleGetInitialSyncViews:(unsigned int)a3 error:(id *)a4
{
  return (id)SOSCCCopyInitialSyncData();
}

+ (id)delegate
{
  return objc_alloc_init(KCJoiningAcceptAccountCircleDelegate);
}

@end
