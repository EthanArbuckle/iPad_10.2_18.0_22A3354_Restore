@implementation AutonamingModelFeatures

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding23AutonamingModelFeatures *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_Autonaming_TrainingData(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xF8);
  v8 = self;
  v7();
  v9 = specialized AutonamingModelFeatures.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for AutonamingModelFeatures?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding23AutonamingModelFeatures *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for AutonamingModelFeatures();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type AutonamingModelFeatures and conformance AutonamingModelFeatures, v5, (uint64_t (*)(uint64_t))type metadata accessor for AutonamingModelFeatures, (uint64_t)&protocol conformance descriptor for AutonamingModelFeatures);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding23AutonamingModelFeatures *)v10;
  }

}

- (_TtC21DocumentUnderstanding23AutonamingModelFeatures)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding23AutonamingModelFeatures *)AutonamingModelFeatures.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding23AutonamingModelFeatures)init
{
  uint64_t v3;
  _TtC21DocumentUnderstanding23AutonamingModelFeatures *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  objc_super v9;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding23AutonamingModelFeatures_annotation) = (Class)-1;
  v3 = OBJC_IVAR____TtC21DocumentUnderstanding23AutonamingModelFeatures_featureMap;
  v4 = self;
  v5 = MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa + v3) = (Class)specialized Dictionary.init(dictionaryLiteral:)(MEMORY[0x24BEE4AF8]);
  v6 = OBJC_IVAR____TtC21DocumentUnderstanding23AutonamingModelFeatures_listFeatureMap;
  *(Class *)((char *)&v4->super.isa + v6) = (Class)specialized Dictionary.init(dictionaryLiteral:)(v5);
  *((_BYTE *)&v4->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding23AutonamingModelFeatures_groundTruthAvailable) = 0;
  v7 = (Class *)((char *)&v4->super.isa
               + OBJC_IVAR____TtC21DocumentUnderstanding23AutonamingModelFeatures_cooccurrenceKey);
  *v7 = 0;
  v7[1] = 0xE000000000000000;

  v9.receiver = v4;
  v9.super_class = (Class)type metadata accessor for AutonamingModelFeatures();
  return -[AutonamingModelFeatures init](&v9, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
