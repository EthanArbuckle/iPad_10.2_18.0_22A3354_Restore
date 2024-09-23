@implementation NSAttributedStringKey:

- (void)Any
{
  void (*v8)(id, uint64_t, id, uint64_t);
  uint64_t v9;
  id v10;
  id v11;

  v8 = *(void (**)(id, uint64_t, id, uint64_t))(a1 + 32);
  type metadata accessor for NSAttributedStringKey(0);
  lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
  v9 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v11 = a2;
  v10 = a4;
  v8(v11, v9, v10, a5);
  swift_bridgeObjectRelease();

}

- (uint64_t)Any
{
  uint64_t v3;
  void (*v5)(void *, uint64_t);
  id v6;

  v3 = a3;
  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3)
  {
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v6 = a2;
  v5(a2, v3);
  swift_release();

  return swift_bridgeObjectRelease();
}

- (Class)Any
{
  uint64_t v4;
  uint64_t (*v5)(uint64_t, uint64_t);
  uint64_t v6;
  NSDictionary v7;

  v4 = a2;
  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  if (a2)
  {
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
    v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_retain();
  v6 = v5(v4, a3);
  swift_release();
  swift_bridgeObjectRelease();
  if (v6)
  {
    type metadata accessor for NSAttributedStringKey(0);
    lazy protocol witness table accessor for type NSAttributedStringKey and conformance NSAttributedStringKey();
    v7.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v7.super.isa = 0;
  }
  return v7.super.isa;
}

@end
