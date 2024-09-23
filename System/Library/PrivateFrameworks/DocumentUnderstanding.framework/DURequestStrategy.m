@implementation DURequestStrategy

- (_TtC21DocumentUnderstanding20DURequestContentType)contentType
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding17DURequestStrategy_contentType);
  swift_beginAccess();
  return (_TtC21DocumentUnderstanding20DURequestContentType *)*v2;
}

- (void)setContentType:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding17DURequestStrategy_contentType);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)modelIdentifier
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding17DURequestStrategy_modelIdentifier);
  swift_beginAccess();
  v4 = *v2;
  v3 = v2[1];
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x22E2AF8EC](v4, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setModelIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding17DURequestStrategy_modelIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (BOOL)preprocess
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding17DURequestStrategy_preprocess;
  swift_beginAccess();
  return *v2;
}

- (void)setPreprocess:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding17DURequestStrategy_preprocess;
  swift_beginAccess();
  *v4 = a3;
}

- (_TtC21DocumentUnderstanding17DURequestStrategy)initWithContentType:(id)a3 preferredModelIdentifier:(id)a4 preprocess:(BOOL)a5
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  _TtC21DocumentUnderstanding17DURequestStrategy *v11;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  v10 = a3;
  v11 = (_TtC21DocumentUnderstanding17DURequestStrategy *)specialized DURequestStrategy.init(contentType:preferredModelIdentifier:preprocess:)(v10, v7, v9, a5);

  return v11;
}

- (_TtC21DocumentUnderstanding17DURequestStrategy)init
{
  _TtC21DocumentUnderstanding17DURequestStrategy *result;

  result = (_TtC21DocumentUnderstanding17DURequestStrategy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
}

@end
