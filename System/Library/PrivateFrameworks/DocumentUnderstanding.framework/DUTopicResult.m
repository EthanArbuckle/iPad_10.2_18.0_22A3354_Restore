@implementation DUTopicResult

- (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier)topicSet
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicSet);
  swift_beginAccess();
  return (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier *)*v2;
}

- (void)setTopicSet:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicSet);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (NSString)topicIdentifier
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicIdentifier);
  swift_beginAccess();
  v4 = *v2;
  v3 = v2[1];
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x22E2AF8EC](v4, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setTopicIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (double)topicConfidence
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicConfidence);
  swift_beginAccess();
  return *v2;
}

- (void)setTopicConfidence:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicConfidence);
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)topicNames
{
  Class isa;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setTopicNames:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicNames);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding13DUTopicResult *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_ClientInterface_TopicResult();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xD8);
  v8 = self;
  v7();
  v9 = specialized DUTopicResult.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUTopicResult?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  @objc DUGlobalTopicSetIdentifier.encode(with:)(self, (uint64_t)a2, a3, (void (*)(void))type metadata accessor for DUTopicResult, &lazy protocol witness table cache variable for type DUTopicResult and conformance DUTopicResult, (uint64_t)&protocol conformance descriptor for DUTopicResult);
}

- (_TtC21DocumentUnderstanding13DUTopicResult)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding13DUTopicResult *)DUTopicResult.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding13DUTopicResult)init
{
  uint64_t v3;
  id v4;
  _TtC21DocumentUnderstanding13DUTopicResult *v5;
  _QWORD *v6;
  objc_super v8;

  v3 = OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicSet;
  v4 = objc_allocWithZone((Class)type metadata accessor for DUGlobalTopicSetIdentifier());
  v5 = self;
  *(Class *)((char *)&self->super.isa + v3) = (Class)objc_msgSend(v4, sel_init);
  v6 = (Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicIdentifier);
  *v6 = 0;
  v6[1] = 0xE000000000000000;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicConfidence) = 0;
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DUTopicResult_topicNames) = (Class)MEMORY[0x24BEE4AF8];

  v8.receiver = v5;
  v8.super_class = (Class)type metadata accessor for DUTopicResult();
  return -[DUTopicResult init](&v8, sel_init);
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
