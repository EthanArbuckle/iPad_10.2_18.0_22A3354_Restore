@implementation DUGlobalTopicSetIdentifier

- (int64_t)topicSetName
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier_topicSetName);
  swift_beginAccess();
  return *v2;
}

- (void)setTopicSetName:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier_topicSetName);
  swift_beginAccess();
  *v4 = a3;
}

- (int64_t)topicSetVersion
{
  int64_t *v2;

  v2 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier_topicSetVersion);
  swift_beginAccess();
  return *v2;
}

- (void)setTopicSetVersion:(int64_t)a3
{
  int64_t *v4;

  v4 = (int64_t *)((char *)self
                        + OBJC_IVAR____TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier_topicSetVersion);
  swift_beginAccess();
  *v4 = a3;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_TopicSetIdentifier();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x98);
  v8 = self;
  v7();
  v9 = specialized DUGlobalTopicSetIdentifier.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUGlobalTopicSetIdentifier?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  @objc DUGlobalTopicSetIdentifier.encode(with:)(self, (uint64_t)a2, a3, (void (*)(void))type metadata accessor for DUGlobalTopicSetIdentifier, &lazy protocol witness table cache variable for type DUGlobalTopicSetIdentifier and conformance DUGlobalTopicSetIdentifier, (uint64_t)&protocol conformance descriptor for DUGlobalTopicSetIdentifier);
}

- (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier *)DUGlobalTopicSetIdentifier.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier_topicSetName) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21DocumentUnderstanding26DUGlobalTopicSetIdentifier_topicSetVersion) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DUGlobalTopicSetIdentifier();
  return -[DUGlobalTopicSetIdentifier init](&v3, sel_init);
}

@end
