@implementation BoxedCKMergeable

- (id)mergeableDeltasForMetadata:(id)a3 error:(id *)a4
{
  id v5;
  _TtC12CloudKitCode16BoxedCKMergeable *v6;
  Class isa;

  v5 = a3;
  v6 = self;
  sub_1DE207D80();

  sub_1DE2084A0();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (BOOL)mergeDeltas:(id)a3 error:(id *)a4
{
  _TtC12CloudKitCode16BoxedCKMergeable *v5;

  sub_1DE2084A0();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1DE207EE8();
  swift_bridgeObjectRelease();

  return 1;
}

- (NSString)description
{
  _TtC12CloudKitCode16BoxedCKMergeable *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = self;
  v3 = sub_1DE208058();
  v5 = v4;

  v6 = (void *)MEMORY[0x1DF0E9E7C](v3, v5);
  swift_bridgeObjectRelease();
  return (NSString *)v6;
}

- (_TtC12CloudKitCode16BoxedCKMergeable)init
{
  BoxedCKMergeable.init()();
}

- (void).cxx_destruct
{
  sub_1DE20585C((uint64_t)self + OBJC_IVAR____TtC12CloudKitCode16BoxedCKMergeable_mergeable);
}

@end
