@implementation XPCSubscription

- (void)modelStatesDidUpdate:(id)a3
{
  uint64_t v3;

  v3 = sub_228866FCC();
  swift_retain();
  sub_22885AFA8(v3);
  swift_release();
  swift_bridgeObjectRelease();
}

@end
