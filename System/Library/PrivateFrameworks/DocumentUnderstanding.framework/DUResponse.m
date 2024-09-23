@implementation DUResponse

- (_TtC21DocumentUnderstanding24DUTopicDetectionResponse)topics
{
  return (_TtC21DocumentUnderstanding24DUTopicDetectionResponse *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_topics);
}

- (void)setTopics:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_topics);
}

- (_TtC21DocumentUnderstanding26DUStructuredEntityResponse)structuredEntities
{
  return (_TtC21DocumentUnderstanding26DUStructuredEntityResponse *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_structuredEntities);
}

- (void)setStructuredEntities:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_structuredEntities);
}

- (_TtC21DocumentUnderstanding25DULanguageTaggingResponse)languageTags
{
  return (_TtC21DocumentUnderstanding25DULanguageTaggingResponse *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_languageTags);
}

- (void)setLanguageTags:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_languageTags);
}

- (_TtC21DocumentUnderstanding36DUUserInterfaceUnderstandingResponse)userInterfaceUnderstandingResults
{
  return (_TtC21DocumentUnderstanding36DUUserInterfaceUnderstandingResponse *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_userInterfaceUnderstandingResults);
}

- (void)setUserInterfaceUnderstandingResults:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_userInterfaceUnderstandingResults);
}

- (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse)documentCategories
{
  return (_TtC21DocumentUnderstanding32DUCategoryClassificationResponse *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_documentCategories);
}

- (void)setDocumentCategories:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_documentCategories);
}

- (_TtC21DocumentUnderstanding20DUFoundInEventResult)foundInEventResult
{
  return (_TtC21DocumentUnderstanding20DUFoundInEventResult *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_foundInEventResult);
}

- (void)setFoundInEventResult:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_foundInEventResult);
}

- (NSArray)poem
{
  _QWORD *v2;
  Class isa;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_poem);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  type metadata accessor for NSNumber(0, &lazy cache variable for type metadata for BMTextUnderstandingPoemBufferExtraction);
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setPoem:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for NSNumber(0, &lazy cache variable for type metadata for BMTextUnderstandingPoemBufferExtraction);
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_poem);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSArray)posTags
{
  _QWORD *v2;
  Class isa;

  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_posTags);
  swift_beginAccess();
  if (!*v2)
    return (NSArray *)0;
  type metadata accessor for PosTaggingResult();
  swift_bridgeObjectRetain();
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return (NSArray *)isa;
}

- (void)setPosTags:(id)a3
{
  uint64_t v3;
  uint64_t *v5;

  v3 = (uint64_t)a3;
  if (a3)
  {
    type metadata accessor for PosTaggingResult();
    v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_posTags);
  swift_beginAccess();
  *v5 = v3;
  swift_bridgeObjectRelease();
}

- (_TtC21DocumentUnderstanding11DUDebugInfo)responseDebugInfo
{
  return (_TtC21DocumentUnderstanding11DUDebugInfo *)@objc DUResponse.topics.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_responseDebugInfo);
}

- (void)setResponseDebugInfo:(id)a3
{
  @objc DUResponse.topics.setter((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_responseDebugInfo);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding10DUResponse *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_ClientInterface_Response();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x178);
  v8 = self;
  v7();
  v9 = specialized DUResponse.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUResponse?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding10DUResponse *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DUResponse();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUResponse and conformance DUResponse, v5, (uint64_t (*)(uint64_t))type metadata accessor for DUResponse, (uint64_t)&protocol conformance descriptor for DUResponse);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding10DUResponse *)v10;
  }

}

- (_TtC21DocumentUnderstanding10DUResponse)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding10DUResponse *)DUResponse.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding10DUResponse)init
{
  return (_TtC21DocumentUnderstanding10DUResponse *)DUResponse.init()();
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding10DUResponse_userInterfaceUnderstandingResults));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

@end
