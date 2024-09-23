@implementation DUDocumentAttribute

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static DUDocumentAttribute.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static DUDocumentAttribute.supportsSecureCoding = a3;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding19DUDocumentAttribute *v8;
  id v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_DocumentUnderstandingServiceClient_DocumentAttribute();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xE0);
  v8 = self;
  v7();
  v9 = specialized DUDocumentAttribute.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUDocumentAttribute?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding19DUDocumentAttribute *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DUDocumentAttribute();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUDocumentAttribute and conformance DUDocumentAttribute, v5, (uint64_t (*)(uint64_t))type metadata accessor for DUDocumentAttribute, (uint64_t)&protocol conformance descriptor for DUDocumentAttribute);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding19DUDocumentAttribute *)v10;
  }

}

- (_TtC21DocumentUnderstanding19DUDocumentAttribute)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding19DUDocumentAttribute *)DUDocumentAttribute.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding19DUDocumentAttribute)init
{
  _TtC21DocumentUnderstanding19DUDocumentAttribute *result;

  result = (_TtC21DocumentUnderstanding19DUDocumentAttribute *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
