@implementation DURawDocument

- (NSString)headline
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_headline);
}

- (void)setHeadline:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_headline);
}

- (NSString)subHeadline
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_subHeadline);
}

- (void)setSubHeadline:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_subHeadline);
}

- (NSString)version
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_version);
}

- (void)setVersion:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_version);
}

- (NSString)creator
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_creator);
}

- (void)setCreator:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_creator);
}

- (NSString)abstract
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_abstract);
}

- (void)setAbstract:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_abstract);
}

- (NSString)comment
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_comment);
}

- (void)setComment:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_comment);
}

- (NSString)text
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_text);
}

- (void)setText:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_text);
}

- (NSString)inLanguage
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_inLanguage);
}

- (void)setInLanguage:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_inLanguage);
}

- (NSArray)keywords
{
  _QWORD *v2;
  Class isa;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_keywords);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setKeywords:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  if (a3)
    v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  else
    v4 = 0;
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_keywords);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)identifier
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_identifier);
}

- (void)setIdentifier:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_identifier);
}

- (NSURL)url
{
  return (NSURL *)@objc DUCalendarEvent.startDateComponents.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for URL?, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_url, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], (uint64_t (*)(void))MEMORY[0x24BDCD8D0]);
}

- (void)setUrl:(id)a3
{
  @objc DUCalendarEvent.startDateComponents.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCD9C0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_url);
}

- (NSURL)thumbnailUrl
{
  return (NSURL *)@objc DUCalendarEvent.startDateComponents.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for URL?, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_thumbnailUrl, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], (uint64_t (*)(void))MEMORY[0x24BDCD8D0]);
}

- (void)setThumbnailUrl:(id)a3
{
  @objc DUCalendarEvent.startDateComponents.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCD9C0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_thumbnailUrl);
}

- (NSURL)significantLink
{
  return (NSURL *)@objc DUCalendarEvent.startDateComponents.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for URL?, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_significantLink, (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], (uint64_t (*)(void))MEMORY[0x24BDCD8D0]);
}

- (void)setSignificantLink:(id)a3
{
  @objc DUCalendarEvent.startDateComponents.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for URL?, (void (*)(uint64_t))MEMORY[0x24BDCD9C0], (uint64_t (*)(_QWORD))MEMORY[0x24BDCDAC0], &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_significantLink);
}

- (NSDate)dateCreated
{
  return (NSDate *)@objc DUCalendarEvent.startDateComponents.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for Date?, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_dateCreated, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], MEMORY[0x24BDCE5D8]);
}

- (void)setDateCreated:(id)a3
{
  @objc DUCalendarEvent.startDateComponents.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE878], (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_dateCreated);
}

- (NSDate)dateModified
{
  return (NSDate *)@objc DUCalendarEvent.startDateComponents.getter((uint64_t)self, (uint64_t)a2, &demangling cache variable for type metadata for Date?, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_dateModified, (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], MEMORY[0x24BDCE5D8]);
}

- (void)setDateModified:(id)a3
{
  @objc DUCalendarEvent.startDateComponents.setter(self, (uint64_t)a2, (uint64_t)a3, &demangling cache variable for type metadata for Date?, (void (*)(uint64_t))MEMORY[0x24BDCE878], (uint64_t (*)(_QWORD))MEMORY[0x24BDCE900], &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_dateModified);
}

- (_TtC21DocumentUnderstanding21DUDocumentMessageData)documentMessageData
{
  return (_TtC21DocumentUnderstanding21DUDocumentMessageData *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_documentMessageData);
}

- (void)setDocumentMessageData:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_documentMessageData);
}

- (NSArray)documentUIElements
{
  _QWORD *v2;
  Class isa;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_documentUIElements);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  type metadata accessor for DUDocumentUIElement();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setDocumentUIElements:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for DUDocumentUIElement();
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_documentUIElements);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (_TtC21DocumentUnderstanding18DUDocumentHTMLData)documentHTMLData
{
  return (_TtC21DocumentUnderstanding18DUDocumentHTMLData *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_documentHTMLData);
}

- (void)setDocumentHTMLData:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_documentHTMLData);
}

- (_TtC21DocumentUnderstanding13DURawDocument)init
{
  return (_TtC21DocumentUnderstanding13DURawDocument *)DURawDocument.init()();
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  _TtC21DocumentUnderstanding13DURawDocument *v6;
  void *v7;
  id v8;
  uint64_t v9;

  type metadata accessor for DURawDocument();
  lazy protocol witness table accessor for type DocumentUnderstanding_ClientInterface_StructuredEntity and conformance DocumentUnderstanding_ClientInterface_StructuredEntity(&lazy protocol witness table cache variable for type DURawDocument and conformance DURawDocument, (uint64_t (*)(uint64_t))type metadata accessor for DURawDocument, (uint64_t)&protocol conformance descriptor for DURawDocument);
  v5 = a3;
  v6 = self;
  v7 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v7)
  {
    v8 = v7;
    v9 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v5, sel_encodeObject_forKey_, v8, v9);

    v5 = v8;
    v6 = (_TtC21DocumentUnderstanding13DURawDocument *)v9;
  }

}

- (_TtC21DocumentUnderstanding13DURawDocument)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding13DURawDocument *)DURawDocument.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding13DURawDocument *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_DocumentRepresentation_Document(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x2B0);
  v8 = self;
  v7();
  v9 = specialized DURawDocument.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DURawDocument?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (BOOL)isEqual:(id)a3
{
  _TtC21DocumentUnderstanding13DURawDocument *v4;
  _TtC21DocumentUnderstanding13DURawDocument *v5;
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
  v6 = DURawDocument.isEqual(_:)((uint64_t)v8);

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
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_url, &demangling cache variable for type metadata for URL?);
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_thumbnailUrl, &demangling cache variable for type metadata for URL?);
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_significantLink, &demangling cache variable for type metadata for URL?);
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_dateCreated, &demangling cache variable for type metadata for Date?);
  outlined destroy of DocumentUnderstanding_ClientInterface_CalendarEvent?((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_dateModified, &demangling cache variable for type metadata for Date?);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding13DURawDocument_documentMessageData));
  swift_bridgeObjectRelease();

}

@end
