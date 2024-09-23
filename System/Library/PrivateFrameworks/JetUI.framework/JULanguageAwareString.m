@implementation JULanguageAwareString

- (NSAttributedString)attributedString
{
  JULanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1AC710F64();

  return (NSAttributedString *)v3;
}

- (void)setAttributedString:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___attributedString) = (Class)a3;
  v3 = a3;

}

- (NSString)string
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AC726208();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (JULanguageAwareString)localizedLowercase
{
  JULanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1AC711604();

  return (JULanguageAwareString *)v3;
}

- (void)setLocalizedLowercase:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedLowercase) = (Class)a3;
  v3 = a3;

}

- (JULanguageAwareString)localizedUppercase
{
  JULanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1AC7116E8();

  return (JULanguageAwareString *)v3;
}

- (void)setLocalizedUppercase:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___localizedUppercase) = (Class)a3;
  v3 = a3;

}

- (JULanguageAwareString)newlinesCollapsedToSpace
{
  JULanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1AC711868();

  return (JULanguageAwareString *)v3;
}

- (void)setNewlinesCollapsedToSpace:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace) = (Class)a3;
  v3 = a3;

}

- (JULanguageAwareString)trimmed
{
  JULanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1AC711A18();

  return (JULanguageAwareString *)v3;
}

- (void)setTrimmed:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___trimmed) = (Class)a3;
  v3 = a3;

}

- (NSArray)numbers
{
  void *v2;

  type metadata accessor for _NSRange(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1AC726394();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSArray)paragraphs
{
  return (NSArray *)sub_1AC711C28();
}

- (NSArray)words
{
  return (NSArray *)sub_1AC711C28();
}

- (_NSRange)juFullRange
{
  JULanguageAwareString *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = sub_1AC711CF0();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setJuFullRange:(_NSRange)a3
{
  _NSRange *v3;

  v3 = (_NSRange *)((char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___juFullRange);
  *v3 = a3;
  LOBYTE(v3[1].location) = 0;
}

- (BOOL)isEmpty
{
  return sub_1AC711D78();
}

- (void)setIsEmpty:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___JULanguageAwareString____lazy_storage___isEmpty) = a3;
}

- (int64_t)length
{
  JULanguageAwareString *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1AC711E04();

  return v3;
}

- (void)setLength:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf16Count;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (int64_t)utf32Length
{
  return sub_1AC711EB8();
}

- (void)setUtf32Length:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___utf32Count;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (int64_t)numberOfCharacters
{
  JULanguageAwareString *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1AC711F84();

  return v3;
}

- (void)setNumberOfCharacters:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___characterCount;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

+ (BOOL)alwaysGenerateAttributedString
{
  swift_beginAccess();
  return byte_1EEC8B790;
}

+ (void)setAlwaysGenerateAttributedString:(BOOL)a3
{
  swift_beginAccess();
  byte_1EEC8B790 = a3;
}

+ (BOOL)keepStatisticsOnLanguageComponents
{
  swift_beginAccess();
  return byte_1EEC8B791;
}

+ (void)setKeepStatisticsOnLanguageComponents:(BOOL)a3
{
  swift_beginAccess();
  byte_1EEC8B791 = a3;
}

+ (JULanguageAwareStringPreprocessor)delegate
{
  swift_beginAccess();
  return (JULanguageAwareStringPreprocessor *)(id)swift_unknownObjectRetain();
}

+ (void)setDelegate:(id)a3
{
  swift_beginAccess();
  qword_1EEC8B798 = (uint64_t)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

+ (JULanguageAwareString)JULanguageAwareStringEmpty
{
  if (qword_1EEC8A250 != -1)
    swift_once();
  return (JULanguageAwareString *)(id)qword_1EEC8B7A0;
}

- (JULanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  id v7;
  id v8;
  JULanguageAwareString *v9;

  v7 = a3;
  v8 = a4;
  v9 = (JULanguageAwareString *)sub_1AC714EE0(v7, a4, a5);

  return v9;
}

- (JULanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  JULanguageAwareString *v13;

  v9 = sub_1AC72622C();
  v11 = v10;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1AC690AA0();
    a4 = (id)sub_1AC726184();
  }
  v12 = a5;
  v13 = (JULanguageAwareString *)sub_1AC7152E0(v9, v11, (uint64_t)a4, a5, a6);

  return v13;
}

- (JULanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, id, _BOOL8, uint64_t);
  id v14;
  JULanguageAwareString *v15;

  if (a3)
  {
    v6 = a5;
    v8 = sub_1AC72622C();
    v10 = v9;
    ObjectType = swift_getObjectType();
    swift_beginAccess();
    v12 = byte_1EEC8B791;
    v13 = *(uint64_t (**)(uint64_t, uint64_t, id, _BOOL8, uint64_t))(ObjectType + 504);
    v14 = a4;
    v15 = (JULanguageAwareString *)v13(v8, v10, a4, v6, v12);
    swift_deallocPartialClassInstance();
  }
  else
  {
    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v15;
}

- (JULanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  uint64_t v6;
  id v8;
  JULanguageAwareString *v9;

  v6 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1AC690AA0();
    v6 = sub_1AC726184();
  }
  v8 = a3;
  v9 = (JULanguageAwareString *)sub_1AC715768((uint64_t)v8, v6, a5);

  return v9;
}

- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3
{
  JULanguageAwareString *v4;
  id v5;
  id v6;
  char v7;
  char v8;

  v4 = self;
  v5 = sub_1AC710F64();
  v6 = NSAttributedString.baseWritingDirection(forCharacterAt:)(a3);
  v8 = v7;

  if ((v8 & 1) != 0)
    return -1;
  else
    return (int64_t)v6;
}

- (int64_t)thresholdBaseWritingDirection
{
  return sub_1AC71360C();
}

- (void)setThresholdBaseWritingDirection:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___JULanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7
{
  JULanguageAwareString *v12;
  int64_t v13;
  int64_t v14;

  v12 = self;
  sub_1AC71368C(a3, (id)a4, (id)a6, a7, a5);
  v14 = v13;

  return v14;
}

- (id)writingDirectionsQuantities
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___JULanguageAwareString_knownBaseWritingDirections));
}

- (JULanguageAwareString)init
{
  JULanguageAwareString *result;

  result = (JULanguageAwareString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___JULanguageAwareString____lazy_storage___newlinesCollapsedToSpace));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
