@implementation AMPLanguageAwareString

- (NSAttributedString)attributedString
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1D81F0EDC();

  return (NSAttributedString *)v3;
}

- (void)setAttributedString:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___attributedString) = (Class)a3;
  v3 = a3;

}

- (NSString)string
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D82156AC();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (AMPLanguageAwareString)localizedLowercase
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1D81F15D0();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedLowercase:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedLowercase) = (Class)a3;
  v3 = a3;

}

- (AMPLanguageAwareString)localizedUppercase
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1D81F1708();

  return (AMPLanguageAwareString *)v3;
}

- (void)setLocalizedUppercase:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___localizedUppercase) = (Class)a3;
  v3 = a3;

}

- (AMPLanguageAwareString)newlinesCollapsedToSpace
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1D81F18DC();

  return (AMPLanguageAwareString *)v3;
}

- (void)setNewlinesCollapsedToSpace:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace) = (Class)a3;
  v3 = a3;

}

- (AMPLanguageAwareString)trimmed
{
  AMPLanguageAwareString *v2;
  id v3;

  v2 = self;
  v3 = sub_1D81F1AE0();

  return (AMPLanguageAwareString *)v3;
}

- (void)setTrimmed:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___trimmed) = (Class)a3;
  v3 = a3;

}

- (NSArray)numbers
{
  void *v2;

  type metadata accessor for _NSRange(0);
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D821576C();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (NSArray)paragraphs
{
  return (NSArray *)sub_1D81F1D58();
}

- (NSArray)words
{
  return (NSArray *)sub_1D81F1D58();
}

- (_NSRange)fullRange
{
  AMPLanguageAwareString *v2;
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = self;
  v3 = sub_1D81F1E20();
  v5 = v4;

  v6 = v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)setFullRange:(_NSRange)a3
{
  _NSRange *v3;

  v3 = (_NSRange *)((char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___fullRange);
  *v3 = a3;
  LOBYTE(v3[1].location) = 0;
}

- (BOOL)isEmpty
{
  return sub_1D81F1F14();
}

- (void)setIsEmpty:(BOOL)a3
{
  *((_BYTE *)&self->super.isa + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___isEmpty) = a3;
}

- (int64_t)length
{
  AMPLanguageAwareString *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1D81F2000();

  return v3;
}

- (void)setLength:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf16Count;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (int64_t)utf32Length
{
  return sub_1D81F211C();
}

- (void)setUtf32Length:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___utf32Count;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (int64_t)numberOfCharacters
{
  AMPLanguageAwareString *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1D81F2250();

  return v3;
}

- (void)setNumberOfCharacters:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___characterCount;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

+ (BOOL)alwaysGenerateAttributedString
{
  swift_beginAccess();
  return byte_1F0167E20;
}

+ (void)setAlwaysGenerateAttributedString:(BOOL)a3
{
  swift_beginAccess();
  byte_1F0167E20 = a3;
}

+ (BOOL)keepStatisticsOnLanguageComponents
{
  swift_beginAccess();
  return byte_1F0167E21;
}

+ (void)setKeepStatisticsOnLanguageComponents:(BOOL)a3
{
  swift_beginAccess();
  byte_1F0167E21 = a3;
}

+ (AMPLanguageAwareStringPreprocessor)delegate
{
  swift_beginAccess();
  return (AMPLanguageAwareStringPreprocessor *)(id)swift_unknownObjectRetain();
}

+ (void)setDelegate:(id)a3
{
  swift_beginAccess();
  qword_1EDA1BAC8 = (uint64_t)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

+ (AMPLanguageAwareString)AMPLanguageAwareStringEmpty
{
  if (qword_1F0167CE0 != -1)
    swift_once();
  return (AMPLanguageAwareString *)(id)qword_1F0167E28;
}

- (AMPLanguageAwareString)initWithAttributedString:(id)a3 baseParagraphStyle:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  id v7;
  id v8;
  AMPLanguageAwareString *v9;

  v7 = a3;
  v8 = a4;
  v9 = (AMPLanguageAwareString *)sub_1D81F4DC8(v7, a4, a5);

  return v9;
}

- (AMPLanguageAwareString)initWithString:(id)a3 attributes:(id)a4 baseParagraphStyle:(id)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  AMPLanguageAwareString *v13;

  v9 = sub_1D82156D0();
  v11 = v10;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1D81F6204();
    a4 = (id)sub_1D821567C();
  }
  v12 = a5;
  v13 = (AMPLanguageAwareString *)sub_1D81F5120(v9, v11, (uint64_t)a4, a5, a6);

  return v13;
}

- (AMPLanguageAwareString)initWithString:(id)a3 baseParagraphStyle:(id)a4 generateAttributedString:(BOOL)a5 keepStatisticsOnLanguageComponents:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, id, _BOOL8, uint64_t);
  id v14;
  AMPLanguageAwareString *v15;

  if (a3)
  {
    v6 = a5;
    v8 = sub_1D82156D0();
    v10 = v9;
    ObjectType = swift_getObjectType();
    swift_beginAccess();
    v12 = byte_1F0167E21;
    v13 = *(uint64_t (**)(uint64_t, uint64_t, id, _BOOL8, uint64_t))(ObjectType + 504);
    v14 = a4;
    v15 = (AMPLanguageAwareString *)v13(v8, v10, a4, v6, v12);
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

- (AMPLanguageAwareString)initWithLanguageAwareString:(id)a3 attributes:(id)a4 keepStatisticsOnLanguageComponents:(BOOL)a5
{
  uint64_t v6;
  id v8;
  AMPLanguageAwareString *v9;

  v6 = (uint64_t)a4;
  if (a4)
  {
    type metadata accessor for Key(0);
    sub_1D81F6204();
    v6 = sub_1D821567C();
  }
  v8 = a3;
  v9 = (AMPLanguageAwareString *)sub_1D81F57FC((uint64_t)v8, v6, a5);

  return v9;
}

- (int64_t)baseWritingDirectionForCharacterAtLocation:(int64_t)a3
{
  AMPLanguageAwareString *v4;
  id v5;
  id v6;
  char v7;
  char v8;

  v4 = self;
  v5 = sub_1D81F0EDC();
  v6 = NSAttributedString.baseWritingDirection(forCharacterAt:)(a3);
  v8 = v7;

  if ((v8 & 1) != 0)
    return -1;
  else
    return (int64_t)v6;
}

- (int64_t)thresholdBaseWritingDirection
{
  return sub_1D81F3854();
}

- (void)setThresholdBaseWritingDirection:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___thresholdBaseWritingDirection;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (int64_t)writingDirectionOfLine:(int64_t)a3 maximumLinesShown:(int64_t)a4 withWidth:(double)a5 lineBreakMode:(int64_t)a6 cacheLayoutInfo:(BOOL)a7
{
  AMPLanguageAwareString *v12;
  int64_t v13;
  int64_t v14;

  v12 = self;
  sub_1D81F393C(a3, (id)a4, (id)a6, a7, a5);
  v14 = v13;

  return v14;
}

- (id)writingDirectionsQuantities
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR___AMPLanguageAwareString_knownBaseWritingDirections));
}

- (AMPLanguageAwareString)init
{
  AMPLanguageAwareString *result;

  result = (AMPLanguageAwareString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___AMPLanguageAwareString____lazy_storage___newlinesCollapsedToSpace));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
