@implementation LockScreenClient

- (void)setLockScreenState:(int64_t)a3 userInfo:(id)a4
{
  uint64_t v6;

  if (a4)
    v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String, &type metadata for Any[8], &protocol witness table for String);
  else
    v6 = 0;
  swift_retain(self);
  sub_10000DCCC(a3, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
}

@end
