@implementation DUStructuredExtractionLabel

- (NSString)labelName
{
  return (NSString *)@objc DUStructuredEntity.title.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding27DUStructuredExtractionLabel_labelName);
}

- (void)setLabelName:(id)a3
{
  @objc DUStructuredEntity.title.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding27DUStructuredExtractionLabel_labelName);
}

- (double)confidenceScore
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding27DUStructuredExtractionLabel_confidenceScore);
  swift_beginAccess();
  return *v2;
}

- (void)setConfidenceScore:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding27DUStructuredExtractionLabel_confidenceScore);
  swift_beginAccess();
  *v4 = a3;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding27DUStructuredExtractionLabel *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_ClientInterface_StructuredEntityLabel(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x98);
  v8 = self;
  v7();
  v9 = specialized DUStructuredExtractionLabel.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUStructuredExtractionLabel?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  @objc DUGlobalTopicSetIdentifier.encode(with:)(self, (uint64_t)a2, a3, (void (*)(void))type metadata accessor for DUStructuredExtractionLabel, &lazy protocol witness table cache variable for type DUStructuredExtractionLabel and conformance DUStructuredExtractionLabel, (uint64_t)&protocol conformance descriptor for DUStructuredExtractionLabel);
}

- (_TtC21DocumentUnderstanding27DUStructuredExtractionLabel)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding27DUStructuredExtractionLabel *)DUStructuredExtractionLabel.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding27DUStructuredExtractionLabel)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21DocumentUnderstanding27DUStructuredExtractionLabel_labelName);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21DocumentUnderstanding27DUStructuredExtractionLabel_confidenceScore) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DUStructuredExtractionLabel();
  return -[DUStructuredExtractionLabel init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
