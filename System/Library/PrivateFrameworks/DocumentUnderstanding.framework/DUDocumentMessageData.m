@implementation DUDocumentMessageData

- (NSString)conversationIdentifier
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_conversationIdentifier);
}

- (void)setConversationIdentifier:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_conversationIdentifier);
}

- (NSString)creatorHandle
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_creatorHandle);
}

- (void)setCreatorHandle:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_creatorHandle);
}

- (NSArray)recipientHandles
{
  return (NSArray *)@objc DUDocumentMessageData.recipientHandles.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_recipientHandles);
}

- (void)setRecipientHandles:(id)a3
{
  @objc DUDocumentMessageData.recipientHandles.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_recipientHandles);
}

- (NSArray)recipientNames
{
  return (NSArray *)@objc DUDocumentMessageData.recipientHandles.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_recipientNames);
}

- (void)setRecipientNames:(id)a3
{
  @objc DUDocumentMessageData.recipientHandles.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_recipientNames);
}

- (NSString)attachmentFileName
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_attachmentFileName);
}

- (void)setAttachmentFileName:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_attachmentFileName);
}

- (NSString)attachmentFilePath
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_attachmentFilePath);
}

- (void)setAttachmentFilePath:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_attachmentFilePath);
}

- (_TtC21DocumentUnderstanding21DUDocumentMessageData)init
{
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_class *v7;
  objc_super v9;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_conversationIdentifier);
  *v3 = 0;
  v3[1] = 0;
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_creatorHandle);
  *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_recipientHandles) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_recipientNames) = 0;
  v5 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_attachmentFileName);
  *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC21DocumentUnderstanding21DUDocumentMessageData_attachmentFilePath);
  v7 = (objc_class *)type metadata accessor for DUDocumentMessageData();
  *v6 = 0;
  v6[1] = 0;
  v9.receiver = self;
  v9.super_class = v7;
  return -[DUDocumentMessageData init](&v9, sel_init);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding21DUDocumentMessageData *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DUDocumentMessageData();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUDocumentMessageData and conformance DUDocumentMessageData, v5, (uint64_t (*)(uint64_t))type metadata accessor for DUDocumentMessageData, (uint64_t)&protocol conformance descriptor for DUDocumentMessageData);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding21DUDocumentMessageData *)v10;
  }

}

- (_TtC21DocumentUnderstanding21DUDocumentMessageData)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding21DUDocumentMessageData *)DUDocumentMessageData.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding21DUDocumentMessageData *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_DocumentRepresentation_DocumentMessageData();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x130);
  v8 = self;
  v7();
  v9 = specialized DUDocumentMessageData.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUDocumentMessageData?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (BOOL)isEqual:(id)a3
{
  _TtC21DocumentUnderstanding21DUDocumentMessageData *v4;
  _TtC21DocumentUnderstanding21DUDocumentMessageData *v5;
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
  v6 = DUDocumentMessageData.isEqual(_:)((uint64_t)v8);

  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)v8, &demangling cache variable for type metadata for Any?);
  return v6 & 1;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
