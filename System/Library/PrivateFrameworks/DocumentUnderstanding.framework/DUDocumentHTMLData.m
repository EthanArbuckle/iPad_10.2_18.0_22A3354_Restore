@implementation DUDocumentHTMLData

- (NSString)htmlString
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding18DUDocumentHTMLData_htmlString);
  swift_beginAccess();
  v3 = v2[1];
  if (!v3)
    return (NSString *)0;
  v4 = *v2;
  swift_bridgeObjectRetain();
  v5 = (void *)MEMORY[0x22E2AF8EC](v4, v3);
  swift_bridgeObjectRelease();
  return (NSString *)v5;
}

- (void)setHtmlString:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  v7 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding18DUDocumentHTMLData_htmlString);
  swift_beginAccess();
  *v7 = v4;
  v7[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC21DocumentUnderstanding19DUDocumentEmailData)documentEmailData
{
  id *v2;

  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding18DUDocumentHTMLData_documentEmailData);
  swift_beginAccess();
  return (_TtC21DocumentUnderstanding19DUDocumentEmailData *)*v2;
}

- (void)setDocumentEmailData:(id)a3
{
  void **v4;
  void *v5;
  id v6;

  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding18DUDocumentHTMLData_documentEmailData);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  v6 = a3;

}

- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)init
{
  _QWORD *v3;
  objc_super v5;

  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding18DUDocumentHTMLData_htmlString);
  *v3 = 0;
  v3[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding18DUDocumentHTMLData_documentEmailData) = 0;
  swift_beginAccess();
  *(_OWORD *)v3 = xmmword_2284C52F0;
  swift_bridgeObjectRelease();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DUDocumentHTMLData();
  return -[DUDocumentHTMLData init](&v5, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding18DUDocumentHTMLData *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DUDocumentHTMLData();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUDocumentHTMLData and conformance DUDocumentHTMLData, v5, (uint64_t (*)(uint64_t))type metadata accessor for DUDocumentHTMLData, (uint64_t)&protocol conformance descriptor for DUDocumentHTMLData);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding18DUDocumentHTMLData *)v10;
  }

}

- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding18DUDocumentHTMLData *)DUDocumentHTMLData.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding18DUDocumentHTMLData *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_DocumentRepresentation_DocumentHTMLData();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xB0);
  v8 = self;
  v7();
  v9 = specialized DUDocumentHTMLData.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUDocumentHTMLData?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (BOOL)isEqual:(id)a3
{
  _TtC21DocumentUnderstanding18DUDocumentHTMLData *v4;
  _TtC21DocumentUnderstanding18DUDocumentHTMLData *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = DUDocumentHTMLData.isEqual(_:)((uint64_t)v8);

  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding18DUDocumentHTMLData_documentEmailData));
}

@end
