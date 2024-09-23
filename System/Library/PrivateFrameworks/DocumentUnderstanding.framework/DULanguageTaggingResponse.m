@implementation DULanguageTaggingResponse

- (NSArray)languageTags
{
  Class isa;

  swift_beginAccess();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setLanguageTags:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding25DULanguageTaggingResponse_languageTags);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa
            + OBJC_IVAR____TtC21DocumentUnderstanding25DULanguageTaggingResponse_responseDebugInfo);
  swift_beginAccess();
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)*v2;
}

- (void)setResponseDebugInfo:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa
               + OBJC_IVAR____TtC21DocumentUnderstanding25DULanguageTaggingResponse_responseDebugInfo);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding25DULanguageTaggingResponse *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_ClientInterface_LanguageTaggingResponse();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x98);
  v8 = self;
  v7();
  v9 = specialized DULanguageTaggingResponse.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DULanguageTaggingResponse?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding25DULanguageTaggingResponse *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DULanguageTaggingResponse();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DULanguageTaggingResponse and conformance DULanguageTaggingResponse, v5, (uint64_t (*)(uint64_t))type metadata accessor for DULanguageTaggingResponse, (uint64_t)&protocol conformance descriptor for DULanguageTaggingResponse);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding25DULanguageTaggingResponse *)v10;
  }

}

- (_TtC21DocumentUnderstanding25DULanguageTaggingResponse)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding25DULanguageTaggingResponse *)DULanguageTaggingResponse.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding25DULanguageTaggingResponse)init
{
  objc_super v3;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding25DULanguageTaggingResponse_languageTags) = (Class)MEMORY[0x24BEE4AF8];
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC21DocumentUnderstanding25DULanguageTaggingResponse_responseDebugInfo) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DULanguageTaggingResponse();
  return -[DULanguageTaggingResponse init](&v3, sel_init);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding25DULanguageTaggingResponse_responseDebugInfo));
}

@end
