@implementation DUDocumentEmailData

- (NSString)subject
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_subject);
}

- (void)setSubject:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_subject);
}

- (NSString)senderName
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_senderName);
}

- (void)setSenderName:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_senderName);
}

- (NSString)senderEmail
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_senderEmail);
}

- (void)setSenderEmail:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_senderEmail);
}

- (NSString)senderDomain
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_senderDomain);
}

- (void)setSenderDomain:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_senderDomain);
}

- (NSArray)recipientNames
{
  return (NSArray *)@objc DUDocumentMessageData.recipientHandles.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_recipientNames);
}

- (void)setRecipientNames:(id)a3
{
  @objc DUDocumentMessageData.recipientHandles.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_recipientNames);
}

- (NSArray)recipientEmails
{
  return (NSArray *)@objc DUDocumentMessageData.recipientHandles.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_recipientEmails);
}

- (void)setRecipientEmails:(id)a3
{
  @objc DUDocumentMessageData.recipientHandles.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_recipientEmails);
}

- (NSArray)ccNames
{
  return (NSArray *)@objc DUDocumentMessageData.recipientHandles.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_ccNames);
}

- (void)setCcNames:(id)a3
{
  @objc DUDocumentMessageData.recipientHandles.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_ccNames);
}

- (NSArray)ccEmails
{
  return (NSArray *)@objc DUDocumentMessageData.recipientHandles.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_ccEmails);
}

- (void)setCcEmails:(id)a3
{
  @objc DUDocumentMessageData.recipientHandles.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_ccEmails);
}

- (NSArray)bccNames
{
  return (NSArray *)@objc DUDocumentMessageData.recipientHandles.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_bccNames);
}

- (void)setBccNames:(id)a3
{
  @objc DUDocumentMessageData.recipientHandles.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_bccNames);
}

- (NSArray)bccEmails
{
  return (NSArray *)@objc DUDocumentMessageData.recipientHandles.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_bccEmails);
}

- (void)setBccEmails:(id)a3
{
  @objc DUDocumentMessageData.recipientHandles.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_bccEmails);
}

- (NSDate)dateReceived
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  Class isa;
  uint64_t v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_dateReceived;
  swift_beginAccess();
  outlined init with copy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)v6, (uint64_t)v5, &demangling cache variable for type metadata for Date?);
  v7 = type metadata accessor for Date();
  v8 = *(_QWORD *)(v7 - 8);
  isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSDate *)isa;
}

- (void)setDateReceived:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC21DocumentUnderstanding19DUDocumentEmailData *v11;
  uint64_t v12;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    v8 = type metadata accessor for Date();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_dateReceived;
  swift_beginAccess();
  v11 = self;
  outlined assign with take of Date?((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();

}

- (_TtC21DocumentUnderstanding19DUDocumentEmailData)init
{
  return (_TtC21DocumentUnderstanding19DUDocumentEmailData *)DUDocumentEmailData.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC21DocumentUnderstanding19DUDocumentEmailData *v6;
  void *v7;
  id v8;
  uint64_t v9;

  type metadata accessor for DUDocumentEmailData();
  lazy protocol witness table accessor for type DocumentUnderstanding_ClientInterface_StructuredEntity and conformance DocumentUnderstanding_ClientInterface_StructuredEntity(&lazy protocol witness table cache variable for type DUDocumentEmailData and conformance DUDocumentEmailData, (uint64_t (*)(uint64_t))type metadata accessor for DUDocumentEmailData, (uint64_t)&protocol conformance descriptor for DUDocumentEmailData);
  v5 = a3;
  v6 = self;
  v7 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v7)
  {
    v8 = v7;
    v9 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v5, sel_encodeObject_forKey_, v8, v9);

    v5 = v8;
    v6 = (_TtC21DocumentUnderstanding19DUDocumentEmailData *)v9;
  }

}

- (_TtC21DocumentUnderstanding19DUDocumentEmailData)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding19DUDocumentEmailData *)DUDocumentEmailData.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding19DUDocumentEmailData *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_DocumentRepresentation_DocumentEmailData();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x1D0);
  v8 = self;
  v7();
  v9 = specialized DUDocumentEmailData.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUDocumentEmailData?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (BOOL)isEqual:(id)a3
{
  _TtC21DocumentUnderstanding19DUDocumentEmailData *v4;
  _TtC21DocumentUnderstanding19DUDocumentEmailData *v5;
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
  v6 = DUDocumentEmailData.isEqual(_:)((uint64_t)v8);

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
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentEmailData_dateReceived, &demangling cache variable for type metadata for Date?);
}

@end
