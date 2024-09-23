@implementation AnyHashable:

- (Class)Any
{
  uint64_t (*v1)(uint64_t);
  uint64_t v2;
  uint64_t v3;
  NSDictionary v4;

  v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v3 = v1(v2);
  swift_release();
  if (v3)
  {
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

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

- (void)Any
{
  unint64_t v0;
  uint64_t v1;

  if (!lazy cache variable for type metadata for [AnyHashable : Any])
  {
    v0 = type metadata accessor for Dictionary();
    if (!v1)
      atomic_store(v0, (unint64_t *)&lazy cache variable for type metadata for [AnyHashable : Any]);
  }
}

@end
