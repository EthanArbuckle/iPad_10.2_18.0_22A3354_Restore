@implementation DUDocumentUpdate

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static DUDocumentUpdate.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static DUDocumentUpdate.supportsSecureCoding = a3;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding16DUDocumentUpdate *v8;
  id v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_DocumentUnderstandingServiceClient_DocumentUpdate();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x140);
  v8 = self;
  v7();
  v9 = specialized DUDocumentUpdate.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUDocumentUpdate?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC21DocumentUnderstanding16DUDocumentUpdate *v6;
  void *v7;
  id v8;
  uint64_t v9;

  type metadata accessor for DUDocumentUpdate();
  lazy protocol witness table accessor for type DocumentUnderstanding_ClientInterface_StructuredEntity and conformance DocumentUnderstanding_ClientInterface_StructuredEntity(&lazy protocol witness table cache variable for type DUDocumentUpdate and conformance DUDocumentUpdate, (uint64_t (*)(uint64_t))type metadata accessor for DUDocumentUpdate, (uint64_t)&protocol conformance descriptor for DUDocumentUpdate);
  v5 = a3;
  v6 = self;
  v7 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v7)
  {
    v8 = v7;
    v9 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v5, sel_encodeObject_forKey_, v8, v9);

    v5 = v8;
    v6 = (_TtC21DocumentUnderstanding16DUDocumentUpdate *)v9;
  }

}

- (_TtC21DocumentUnderstanding16DUDocumentUpdate)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding16DUDocumentUpdate *)DUDocumentUpdate.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding16DUDocumentUpdate)init
{
  _TtC21DocumentUnderstanding16DUDocumentUpdate *result;

  result = (_TtC21DocumentUnderstanding16DUDocumentUpdate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding16DUDocumentUpdate_associatedFileURL, &demangling cache variable for type metadata for URL?);
  swift_bridgeObjectRelease();
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding16DUDocumentUpdate_updateTimestamp, &demangling cache variable for type metadata for Date?);
  swift_bridgeObjectRelease();
}

@end
