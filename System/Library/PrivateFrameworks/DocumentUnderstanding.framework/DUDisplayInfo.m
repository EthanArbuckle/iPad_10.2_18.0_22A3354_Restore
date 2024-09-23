@implementation DUDisplayInfo

- (CGRect)frameInWindow
{
  double *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v2 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUDisplayInfo_frameInWindow);
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
  v7 = (CGFloat *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUDisplayInfo_frameInWindow);
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

  v2 = (double *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUDisplayInfo_absoluteOriginOnScreen);
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
  v5 = (CGFloat *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUDisplayInfo_absoluteOriginOnScreen);
  swift_beginAccess();
  *v5 = x;
  v5[1] = y;
}

- (BOOL)isOnScreen
{
  BOOL *v2;

  v2 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUDisplayInfo_isOnScreen;
  swift_beginAccess();
  return *v2;
}

- (void)setIsOnScreen:(BOOL)a3
{
  BOOL *v4;

  v4 = (BOOL *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUDisplayInfo_isOnScreen;
  swift_beginAccess();
  *v4 = a3;
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(void);
  _TtC21DocumentUnderstanding13DUDisplayInfo *v8;
  char *v9;
  _QWORD v11[2];

  v4 = type metadata accessor for DocumentUnderstanding_ClientInterface_DisplayInfo(0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *(void (**)(void))((*MEMORY[0x24BEE4EA0] & (uint64_t)self->super.isa) + 0xB8);
  v8 = self;
  v7();
  v9 = specialized DUDisplayInfo.__allocating_init<A>(proto:)((uint64_t)v6);

  v11[1] = v9;
  __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for DUDisplayInfo?);
  return (id)_bridgeAnythingNonVerbatimToObjectiveC<A>(_:)();
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  _TtC21DocumentUnderstanding13DUDisplayInfo *v7;
  void *v8;
  id v9;
  uint64_t v10;

  type metadata accessor for DUDisplayInfo();
  lazy protocol witness table accessor for type DUCategoryResult and conformance DUCategoryResult(&lazy protocol witness table cache variable for type DUDisplayInfo and conformance DUDisplayInfo, v5, (uint64_t (*)(uint64_t))type metadata accessor for DUDisplayInfo, (uint64_t)&protocol conformance descriptor for DUDisplayInfo);
  v6 = a3;
  v7 = self;
  v8 = (void *)DUProtobufEncodableProtocol.serializedData()();
  if (v8)
  {
    v9 = v8;
    v10 = MEMORY[0x22E2AF8EC](0xD000000000000016, 0x80000002284DABA0);
    objc_msgSend(v6, sel_encodeObject_forKey_, v9, v10);

    v6 = v9;
    v7 = (_TtC21DocumentUnderstanding13DUDisplayInfo *)v10;
  }

}

- (_TtC21DocumentUnderstanding13DUDisplayInfo)initWithCoder:(id)a3
{
  return (_TtC21DocumentUnderstanding13DUDisplayInfo *)DUDisplayInfo.init(coder:)(a3);
}

- (_TtC21DocumentUnderstanding13DUDisplayInfo)init
{
  _OWORD *v2;
  _QWORD *v3;
  objc_super v5;

  v2 = (_OWORD *)((char *)self + OBJC_IVAR____TtC21DocumentUnderstanding13DUDisplayInfo_frameInWindow);
  *v2 = 0u;
  v2[1] = 0u;
  v3 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DUDisplayInfo_absoluteOriginOnScreen);
  *v3 = 0;
  v3[1] = 0;
  *((_BYTE *)&self->super.isa + OBJC_IVAR____TtC21DocumentUnderstanding13DUDisplayInfo_isOnScreen) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DUDisplayInfo();
  return -[DUDisplayInfo init](&v5, sel_init);
}

@end
