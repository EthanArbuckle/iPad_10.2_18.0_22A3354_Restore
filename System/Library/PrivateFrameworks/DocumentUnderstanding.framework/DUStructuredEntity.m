@implementation DUStructuredEntity

- (NSString)title
{
  return (NSString *)@objc DUStructuredEntity.title.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_title);
}

- (void)setTitle:(id)a3
{
  @objc DUStructuredEntity.title.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_title);
}

- (NSString)type
{
  return (NSString *)@objc DUStructuredEntity.title.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_type);
}

- (void)setType:(id)a3
{
  @objc DUStructuredEntity.title.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_type);
}

- (NSArray)labels
{
  Class isa;

  swift_beginAccess();
  type metadata accessor for DUStructuredExtractionLabel();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setLabels:(id)a3
{
  uint64_t v4;
  uint64_t *v5;

  type metadata accessor for DUStructuredExtractionLabel();
  v4 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_labels);
  swift_beginAccess();
  *v5 = v4;
  swift_bridgeObjectRelease();
}

- (NSString)phoneNumber
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_phoneNumber);
}

- (void)setPhoneNumber:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_phoneNumber);
}

- (NSString)email
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_email);
}

- (void)setEmail:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_email);
}

- (NSString)url
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_url);
}

- (void)setUrl:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_url);
}

- (NSDictionary)addressComponents
{
  _QWORD *v2;
  Class isa;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_addressComponents);
  swift_beginAccess();
  if (!*v2)
    return (NSDictionary *)0;
  type metadata accessor for NSTextCheckingKey(0);
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult((unint64_t *)&lazy protocol witness table cache variable for type NSTextCheckingKey and conformance NSTextCheckingKey, 255, (uint64_t (*)(uint64_t))type metadata accessor for NSTextCheckingKey, (uint64_t)&protocol conformance descriptor for NSTextCheckingKey);
  swift_bridgeObjectRetain();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSDictionary *)isa;
}

- (void)setAddressComponents:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for NSTextCheckingKey(0);
    lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult((unint64_t *)&lazy protocol witness table cache variable for type NSTextCheckingKey and conformance NSTextCheckingKey, 255, (uint64_t (*)(uint64_t))type metadata accessor for NSTextCheckingKey, (uint64_t)&protocol conformance descriptor for NSTextCheckingKey);
    v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_addressComponents);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (_TtC21DocumentUnderstanding15DUCalendarEvent)calendarEvent
{
  return (_TtC21DocumentUnderstanding15DUCalendarEvent *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_calendarEvent);
}

- (void)setCalendarEvent:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_calendarEvent);
}

- (NSString)homeAutomationID
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_homeAutomationID);
}

- (void)setHomeAutomationID:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_homeAutomationID);
}

- (_TtC21DocumentUnderstanding13DUDisplayInfo)displayInfo
{
  return (_TtC21DocumentUnderstanding13DUDisplayInfo *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_displayInfo);
}

- (void)setDisplayInfo:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_displayInfo);
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo
{
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_responseDebugInfo);
}

- (void)setResponseDebugInfo:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_responseDebugInfo);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding18DUStructuredEntity *v8;
  uint64_t v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_ClientInterface_StructuredEntity(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x1B8);
  v8 = self;
  v7();
  v9 = specialized DUStructuredEntity.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUStructuredEntity?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  @objc DUGlobalTopicSetIdentifier.encode(with:)(self, (uint64_t)a2, a3, (void (*)(void))type metadata accessor for DUStructuredEntity, &lazy protocol witness table cache variable for type DUStructuredEntity and conformance DUStructuredEntity, (uint64_t)&protocol conformance descriptor for DUStructuredEntity);
}

- (_TtC21DocumentUnderstanding18DUStructuredEntity)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding18DUStructuredEntity *)DUStructuredEntity.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding18DUStructuredEntity)init
{
  return (_TtC21DocumentUnderstanding18DUStructuredEntity *)DUStructuredEntity.init()();
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
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_calendarEvent));
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding18DUStructuredEntity_responseDebugInfo));
}

@end
