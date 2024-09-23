@implementation SfntVectorFont

- (BOOL)isSFNT
{
  return 1;
}

- (NSData)sfntData
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B08DB6EC();

  return (NSData *)v3;
}

- (NSArray)tableTags
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v2;
  uint64_t v3;
  void *v4;

  v2 = self;
  v3 = swift_bridgeObjectRetain();
  sub_1B08D7660(v3);

  swift_bridgeObjectRelease();
  v4 = (void *)sub_1B0A1D480();
  swift_bridgeObjectRelease();
  return (NSArray *)v4;
}

- (id)copyTableDataWithTag:(unsigned int)a3
{
  uint64_t v3;
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  v4 = self;
  v5 = (void *)sub_1B08DB930(v3);

  return v5;
}

- (NSDictionary)metadata
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B08DBA14();

  return (NSDictionary *)v3;
}

- (NSString)postScriptName
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B08DBD58();

  return (NSString *)v3;
}

- (NSString)nameTablePostScriptName
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B08DBD58();

  return (NSString *)v3;
}

- (NSArray)additionalPostScriptNames
{
  return (NSArray *)sub_1B08DC05C(self, (uint64_t)a2, (void (*)(void))sub_1B08DBFA0, &qword_1EEEBACF8);
}

- (NSArray)allNames
{
  return (NSArray *)sub_1B08DC05C(self, (uint64_t)a2, (void (*)(void))sub_1B08DC0C8, &qword_1EEEBACF0);
}

- (NSString)fullName
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B08DC5AC();

  return (NSString *)v3;
}

- (NSString)familyName
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B08DC6E8();

  return (NSString *)v3;
}

- (const)names
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B08DC824();

  return (const __CFDictionary *)v3;
}

- (BOOL)isBitmapOnly
{
  return 0;
}

- (BOOL)isSuitcase
{
  return 0;
}

- (const)characterSet
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1B08DCF44();

  return (const __CFCharacterSet *)v3;
}

- (OS2UnicodeRanges)getOS2UnicodeRangesWithMinCoveragePercent:(float)a3
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  OS2UnicodeRanges result;

  v3 = self;
  v4 = sub_1B08E2644();
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.var2 = v8;
  result.var3 = HIDWORD(v8);
  result.var0 = v7;
  result.var1 = HIDWORD(v7);
  return result;
}

- (unsigned)protectionInfo
{
  return 0;
}

- (NSArray)type1Encoding
{
  return (NSArray *)(id)sub_1B0A1D480();
}

- (BOOL)getTrueTypeEncodingWithPlatform:(unsigned __int16)a3 script:(unsigned __int16)a4 indexMap:(void *)a5
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v7;
  char v8;

  v7 = self;
  v8 = sub_1B08DD100(a3, a4);

  return v8 & 1;
}

- (id)glyphNameWithGlyph:(unsigned __int16)a3
{
  return 0;
}

- (CGFloat2)getIdealAdvanceAndSideBearingWithGlyph:(unsigned int)a3 vertical:(BOOL)a4
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat2 result;

  v6 = self;
  v7 = sub_1B08DEC70(a3, a4);
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.var1 = v11;
  result.var0 = v10;
  return result;
}

- (CGRect)getIdealBoundsWithGlyph:(unsigned int)a3
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v5;
  double x;
  double y;
  double width;
  double height;
  double v10;
  double v11;
  double v12;
  double v13;
  __C::CGRect_optional v14;
  _BYTE v15[32];
  char v16;
  _QWORD __dst[53];
  CGRect result;

  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  v5 = self;
  sub_1B08ABA58(__dst);
  SfntTrueTypeFont.getBoundingBox(glyphID:)(&v14, a3);
  x = v14.value.origin.x;
  y = v14.value.origin.y;
  width = v14.value.size.width;
  height = v14.value.size.height;
  sub_1B08ABB84(__dst);

  sub_1B08CE970((uint64_t)&v14, (uint64_t)v15, &qword_1EEEBAC80);
  v10 = 0.0;
  if ((v16 & 1) != 0)
    v11 = 0.0;
  else
    v11 = x;
  if ((v16 & 1) != 0)
    v12 = 0.0;
  else
    v12 = y;
  if ((v16 & 1) != 0)
    v13 = 0.0;
  else
    v13 = width;
  if ((v16 & 1) == 0)
    v10 = height;
  result.size.height = v10;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)getIdealVerticalBoundsWithGlyph:(unsigned int)a3
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v4;
  double v5;
  double v6;
  double v7;
  double x;
  double y;
  double width;
  double height;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __C::CGRect_optional v18;
  _BYTE v19[32];
  char v20;
  _QWORD __dst[53];
  CGRect result;

  v4 = self;
  v5 = sub_1B08DF1F8(a3);
  v7 = v6;
  memcpy(__dst, (char *)v4 + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  sub_1B08ABA58(__dst);
  SfntTrueTypeFont.getBoundingBox(glyphID:)(&v18, a3);
  x = v18.value.origin.x;
  y = v18.value.origin.y;
  width = v18.value.size.width;
  height = v18.value.size.height;
  sub_1B08ABB84(__dst);

  sub_1B08CE970((uint64_t)&v18, (uint64_t)v19, &qword_1EEEBAC80);
  if ((v20 & 1) != 0)
    v12 = 0.0;
  else
    v12 = x;
  if ((v20 & 1) != 0)
    v13 = 0.0;
  else
    v13 = y;
  if ((v20 & 1) != 0)
    v14 = 0.0;
  else
    v14 = width;
  if ((v20 & 1) != 0)
    v15 = 0.0;
  else
    v15 = height;
  v16 = v5 + v12;
  v17 = v7 + v13;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGSize)getDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD __dst[53];
  CGSize result;

  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  v6 = self;
  sub_1B08ABA58(__dst);
  sub_1B096C02C(a3, 0);
  LOBYTE(a3) = v7;
  v9 = v8;
  sub_1B08ABB84(__dst);

  v10 = v9;
  v11 = 0.0;
  if (a3 == 2)
    v10 = 0.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)getVerticalDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD __dst[53];
  CGSize result;

  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  v6 = self;
  sub_1B08ABA58(__dst);
  sub_1B096C02C(a3, 1);
  LOBYTE(a3) = v7;
  v9 = v8;
  sub_1B08ABB84(__dst);

  v10 = v9;
  v11 = 0.0;
  if (a3 == 2)
    v10 = 0.0;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGRect)getDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v6;
  double x;
  double y;
  double width;
  double height;
  double v11;
  double v12;
  double v13;
  double v14;
  __C::CGRect_optional v15;
  _BYTE v16[32];
  char v17;
  _QWORD __dst[53];
  CGRect result;

  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  v6 = self;
  sub_1B08ABA58(__dst);
  SfntTrueTypeFont.getBoundingBox(glyphID:)(&v15, a3);
  x = v15.value.origin.x;
  y = v15.value.origin.y;
  width = v15.value.size.width;
  height = v15.value.size.height;
  sub_1B08ABB84(__dst);

  sub_1B08CE970((uint64_t)&v15, (uint64_t)v16, &qword_1EEEBAC80);
  v11 = 0.0;
  if ((v17 & 1) != 0)
    v12 = 0.0;
  else
    v12 = x;
  if ((v17 & 1) != 0)
    v13 = 0.0;
  else
    v13 = y;
  if ((v17 & 1) != 0)
    v14 = 0.0;
  else
    v14 = width;
  if ((v17 & 1) == 0)
    v11 = height;
  result.size.height = v11;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)getVerticalDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v5;
  double v6;
  double v7;
  double v8;
  double x;
  double y;
  double width;
  double height;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __C::CGRect_optional v19;
  _BYTE v20[32];
  char v21;
  _QWORD __dst[53];
  CGRect result;

  v5 = self;
  v6 = sub_1B08DF1F8(a3);
  v8 = v7;
  memcpy(__dst, (char *)v5 + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  sub_1B08ABA58(__dst);
  SfntTrueTypeFont.getBoundingBox(glyphID:)(&v19, a3);
  x = v19.value.origin.x;
  y = v19.value.origin.y;
  width = v19.value.size.width;
  height = v19.value.size.height;
  sub_1B08ABB84(__dst);

  sub_1B08CE970((uint64_t)&v19, (uint64_t)v20, &qword_1EEEBAC80);
  if ((v21 & 1) != 0)
    v13 = 0.0;
  else
    v13 = x;
  if ((v21 & 1) != 0)
    v14 = 0.0;
  else
    v14 = y;
  if ((v21 & 1) != 0)
    v15 = 0.0;
  else
    v15 = width;
  if ((v21 & 1) != 0)
    v16 = 0.0;
  else
    v16 = height;
  v17 = v6 + v13;
  v18 = v8 + v14;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)copyBitmapWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4 options:(unsigned int)a5 bounds:(CGRect *)a6 bytesPerRow:(int64_t *)a7
{
  return 0;
}

- (CGSize)getVerticalTranslateWithGlyph:(unsigned int)a3
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v4 = self;
  v5 = sub_1B08DF1F8(a3);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)copyOriginalPathWithGlyph:(unsigned int)a3
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *v4;
  id v5;

  v4 = self;
  v5 = sub_1B08DF3A0(a3);

  return v5;
}

- (int64_t)dataResidence
{
  return self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font + 410];
}

- (int64_t)encodingType
{
  return 0;
}

- (NSDictionary)splicedStash
{
  return (NSDictionary *)0;
}

- (id)controlPointsWithGlyph:(unsigned int)a3
{
  type metadata accessor for CGPoint(0);
  return (id)sub_1B0A1D480();
}

- (BOOL)canCreatePostScriptSubsetWithFormat:(int64_t)a3
{
  return a3 == 42;
}

- (id)variationWithPostScriptNameSuffix:(id)a3
{
  return 0;
}

- (NSString)variationPostScriptNamePrefix
{
  return (NSString *)0;
}

- (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont)defaultInstance
{
  return (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *)0;
}

- (BOOL)isNamedInstance
{
  return 0;
}

- (NSString)instanceName
{
  return (NSString *)0;
}

- (unsigned)instanceNameID
{
  return 0;
}

- (BOOL)hasNamedInstanceWithOpticalSize
{
  return 0;
}

- (unsigned)variationAxisFlagsWithTag:(unsigned int)a3
{
  return 0;
}

- (unsigned)variationAxisNameIDWithTag:(unsigned int)a3
{
  return 0;
}

- (double)variationScalarWithTupleIndex:(int64_t)a3
{
  return 0.0;
}

- (NSArray)variationScalars
{
  return (NSArray *)(id)sub_1B0A1D480();
}

- (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont)init
{
  _TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *result;

  result = (_TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _QWORD __dst[53];
  _QWORD v4[48];
  _BYTE v5[128];

  memcpy(__dst, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_font, 0x1A4uLL);
  sub_1B08ABB84(__dst);
  sub_1B08AE2EC((uint64_t)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_characterMap);
  memcpy(v4, (char *)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont__info, 0x179uLL);
  sub_1B08E252C(v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  sub_1B08CE970((uint64_t)self + OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_glyphMap, (uint64_t)v5, &qword_1EEEBAC60);
  sub_1B08E25D0((uint64_t)v5, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_1B08E0A78);
  sub_1B08E0AB0(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable), *(_QWORD *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable], *(_QWORD *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 8], *(_QWORD *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 16], *(_QWORD *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 24], *(_QWORD *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 32], *(_QWORD *)&self->font[OBJC_IVAR____TtC10FontParserP33_BB7825F4A323BA870200AEF0918A19DC14SfntVectorFont_postTable+ 40]);
}

@end
