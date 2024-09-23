@implementation PosTaggingResult

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding16PosTaggingResult *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_PosTaggingResult();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xD8);
  v8 = self;
  v7();
  v9 = specialized PosTaggingResult.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PosTaggingResult?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding16PosTaggingResult *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for PosTaggingResult();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type PosTaggingResult and conformance PosTaggingResult, v5, (uint64_t (*)(uint64_t))type metadata accessor for PosTaggingResult, (uint64_t)&protocol conformance descriptor for PosTaggingResult);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding16PosTaggingResult *)v10;
  }

}

- (_TtC21DocumentUnderstanding16PosTaggingResult)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding16PosTaggingResult *)PosTaggingResult.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding16PosTaggingResult)init
{
  _QWORD *v2;
  _QWORD *v3;
  objc_super v5;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding16PosTaggingResult_tag);
  *v2 = 0;
  v2[1] = 0xE000000000000000;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding16PosTaggingResult_text);
  *v3 = 0;
  v3[1] = 0xE000000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding16PosTaggingResult_start) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding16PosTaggingResult_len) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PosTaggingResult();
  return -[PosTaggingResult init](&v5, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
