@implementation DUCategoryResult

- (NSString)categoryIdentifier
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding16DUCategoryResult_categoryIdentifier);
  swift_beginAccess();
  v4 = *v2;
  v3 = v2[1];
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x22E2AF8EC](v4, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setCategoryIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v6 = v5;
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding16DUCategoryResult_categoryIdentifier);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (double)categoryConfidence
{
  double *v2;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding16DUCategoryResult_categoryConfidence);
  swift_beginAccess();
  return *v2;
}

- (void)setCategoryConfidence:(double)a3
{
  double *v4;

  v4 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding16DUCategoryResult_categoryConfidence);
  swift_beginAccess();
  *v4 = a3;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding16DUCategoryResult *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_ClientInterface_CategoryResult();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x98);
  v8 = self;
  v7();
  v9 = specialized DUCategoryResult.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUCategoryResult?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding16DUCategoryResult *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DUCategoryResult();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUCategoryResult and conformance DUCategoryResult, v5, (uint64_t (*)(uint64_t))type metadata accessor for DUCategoryResult, (uint64_t)&protocol conformance descriptor for DUCategoryResult);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding16DUCategoryResult *)v10;
  }

}

- (_TtC21DocumentUnderstanding16DUCategoryResult)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding16DUCategoryResult *)DUCategoryResult.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding16DUCategoryResult)init
{
  _QWORD *v2;
  objc_super v4;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding16DUCategoryResult_categoryIdentifier);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding16DUCategoryResult_categoryConfidence) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DUCategoryResult();
  return -[DUCategoryResult init](&v4, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
