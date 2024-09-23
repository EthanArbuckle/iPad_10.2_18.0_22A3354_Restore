@implementation DUDocumentUIElement

- (NSString)text
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_text);
}

- (void)setText:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_text);
}

- (NSString)version
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_version);
}

- (void)setVersion:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_version);
}

- (NSString)classDescriptor
{
  return (NSString *)@objc DUDocumentMessageData.conversationIdentifier.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_classDescriptor);
}

- (void)setClassDescriptor:(id)a3
{
  @objc DUDocumentMessageData.conversationIdentifier.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_classDescriptor);
}

- (float)fontSize
{
  float *v2;

  v2 = (float *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_fontSize);
  swift_beginAccess();
  return *v2;
}

- (void)setFontSize:(float)a3
{
  float *v4;

  v4 = (float *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_fontSize);
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)superviewClassNames
{
  return (NSArray *)@objc DUDocumentUIElement.superviewClassNames.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_superviewClassNames);
}

- (void)setSuperviewClassNames:(id)a3
{
  @objc DUDocumentUIElement.superviewClassNames.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BEE0D00], &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_superviewClassNames);
}

- (CGRect)frameInWindow
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_frameInWindow);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  v5 = v2[2];
  v6 = v2[3];
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)setFrameInWindow:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_frameInWindow);
  swift_beginAccess();
  *v7 = x;
  v7[1] = y;
  v7[2] = width;
  v7[3] = height;
}

- (CGPoint)absoluteOriginOnScreen
{
  double *v2;
  double v3;
  double v4;
  CGPoint result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_absoluteOriginOnScreen);
  swift_beginAccess();
  v3 = *v2;
  v4 = v2[1];
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setAbsoluteOriginOnScreen:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  CGFloat *v5;

  y = a3.y;
  x = a3.x;
  v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_absoluteOriginOnScreen);
  swift_beginAccess();
  *v5 = x;
  v5[1] = y;
}

- (BOOL)isOnScreen
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_isOnScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setIsOnScreen:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_isOnScreen;
  swift_beginAccess();
  *v4 = a3;
}

- (BOOL)isValidForContentExtraction
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_isValidForContentExtraction;
  swift_beginAccess();
  return *v2;
}

- (void)setIsValidForContentExtraction:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_isValidForContentExtraction;
  swift_beginAccess();
  *v4 = a3;
}

- (NSArray)superviewClassIndices
{
  return (NSArray *)@objc DUDocumentUIElement.superviewClassNames.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_superviewClassIndices);
}

- (void)setSuperviewClassIndices:(id)a3
{
  @objc DUDocumentUIElement.superviewClassNames.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BEE4008], &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_superviewClassIndices);
}

- (NSArray)range
{
  return (NSArray *)@objc DUDocumentUIElement.superviewClassNames.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_range);
}

- (void)setRange:(id)a3
{
  @objc DUDocumentUIElement.superviewClassNames.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BEE4008], &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_range);
}

- (NSArray)styleProperties
{
  return (NSArray *)@objc DUDocumentUIElement.superviewClassNames.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_styleProperties);
}

- (void)setStyleProperties:(id)a3
{
  @objc DUDocumentUIElement.superviewClassNames.setter((uint64_t)self, (uint64_t)a2, (uint64_t)a3, MEMORY[0x24BEE0D00], &OBJC_IVAR____TtC21DocumentUnderstanding19DUDocumentUIElement_styleProperties);
}

+ (BOOL)supportsSecureCoding
{
  swift_beginAccess();
  return static DUDocumentUIElement.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  swift_beginAccess();
  static DUDocumentUIElement.supportsSecureCoding = a3;
}

- (_TtC21DocumentUnderstanding19DUDocumentUIElement)init
{
  return (_TtC21DocumentUnderstanding19DUDocumentUIElement *)DUDocumentUIElement.init()();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding19DUDocumentUIElement *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DUDocumentUIElement();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUDocumentUIElement and conformance DUDocumentUIElement, v5, (uint64_t (*)(uint64_t))type metadata accessor for DUDocumentUIElement, (uint64_t)&protocol conformance descriptor for DUDocumentUIElement);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding19DUDocumentUIElement *)v10;
  }

}

- (_TtC21DocumentUnderstanding19DUDocumentUIElement)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding19DUDocumentUIElement *)DUDocumentUIElement.init(coder:)(a3);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding19DUDocumentUIElement *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_DocumentRepresentation_DocumentUIElement();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0x1F0);
  v8 = self;
  v7();
  v9 = specialized DUDocumentUIElement.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUDocumentUIElement?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (BOOL)isEqual:(id)a3
{
  _TtC21DocumentUnderstanding19DUDocumentUIElement *v4;
  _TtC21DocumentUnderstanding19DUDocumentUIElement *v5;
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
  v6 = DUDocumentUIElement.isEqual(_:)((uint64_t)v8);

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
}

@end
