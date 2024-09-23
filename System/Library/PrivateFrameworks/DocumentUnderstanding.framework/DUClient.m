@implementation DUClient

- (NSString)identifier
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding8DUClient_identifier);
  v3 = *(_QWORD *)&self->identifier[OBJC_IVAR____TtC21DocumentUnderstanding8DUClient_identifier];
  swift_bridgeObjectRetain();
  v4 = (void *)MEMORY[0x22E2AF8EC](v2, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (_TtC21DocumentUnderstanding8DUClient)initWithIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (_TtC21DocumentUnderstanding8DUClient *)DUClient.init(identifier:)(v3, v4);
}

- (_TtC21DocumentUnderstanding8DUClient)init
{
  _TtC21DocumentUnderstanding8DUClient *result;

  result = (_TtC21DocumentUnderstanding8DUClient *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
}

@end
