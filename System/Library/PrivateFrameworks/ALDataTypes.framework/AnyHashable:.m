@implementation AnyHashable:

- (uint64_t)Any
{
  void (*v2)(uint64_t);
  uint64_t v3;

  v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v3 = 0;
  swift_retain();
  v2(v3);
  swift_release();
  return swift_bridgeObjectRelease();
}

@end
