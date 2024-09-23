@implementation AnyVectorFont

+ (id)anyVectorFontsWithData:(id)a3 path:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  sub_1B08E2298((uint64_t)v5, (uint64_t)a4);

  type metadata accessor for AnyVectorFont();
  v7 = (void *)sub_1B0A1D480();
  swift_bridgeObjectRelease();
  return v7;
}

- (id)variationWithPostScriptNameSuffix:(id)a3
{
  id result;

  result = (id)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (BOOL)isSFNT
{
  BOOL result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSData)sfntData
{
  NSData *result;

  result = (NSData *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSArray)tableTags
{
  NSArray *result;

  result = (NSArray *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (id)copyTableDataWithTag:(unsigned int)a3
{
  id result;

  result = (id)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSDictionary)metadata
{
  NSDictionary *result;

  result = (NSDictionary *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSString)postScriptName
{
  NSString *result;

  result = (NSString *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSString)nameTablePostScriptName
{
  NSString *result;

  result = (NSString *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSString)variationPostScriptNamePrefix
{
  NSString *result;

  result = (NSString *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSArray)additionalPostScriptNames
{
  NSArray *result;

  result = (NSArray *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSArray)allNames
{
  NSArray *result;

  result = (NSArray *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSString)fullName
{
  NSString *result;

  result = (NSString *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSString)familyName
{
  NSString *result;

  result = (NSString *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (const)names
{
  const __CFDictionary *result;

  result = (const __CFDictionary *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (_TtC10FontParser13AnyVectorFont)defaultInstance
{
  _TtC10FontParser13AnyVectorFont *result;

  result = (_TtC10FontParser13AnyVectorFont *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (BOOL)isNamedInstance
{
  BOOL result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSString)instanceName
{
  NSString *result;

  result = (NSString *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (unsigned)instanceNameID
{
  unsigned __int16 result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (BOOL)hasNamedInstanceWithOpticalSize
{
  BOOL result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (unsigned)variationAxisFlagsWithTag:(unsigned int)a3
{
  unsigned __int16 result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (unsigned)variationAxisNameIDWithTag:(unsigned int)a3
{
  unsigned __int16 result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (BOOL)isBitmapOnly
{
  BOOL result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (BOOL)isSuitcase
{
  BOOL result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (const)characterSet
{
  const __CFCharacterSet *result;

  result = (const __CFCharacterSet *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (OS2UnicodeRanges)getOS2UnicodeRangesWithMinCoveragePercent:(float)a3
{
  uint64_t v3;
  uint64_t v4;
  OS2UnicodeRanges result;

  v3 = sub_1B0A1D984();
  __break(1u);
  result.var2 = v4;
  result.var3 = HIDWORD(v4);
  result.var0 = v3;
  result.var1 = HIDWORD(v3);
  return result;
}

- (unsigned)protectionInfo
{
  unsigned int result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSArray)type1Encoding
{
  NSArray *result;

  result = (NSArray *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (BOOL)getTrueTypeEncodingWithPlatform:(unsigned __int16)a3 script:(unsigned __int16)a4 indexMap:(void *)a5
{
  BOOL result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (id)glyphNameWithGlyph:(unsigned __int16)a3
{
  id result;

  result = (id)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (CGFloat2)getIdealAdvanceAndSideBearingWithGlyph:(unsigned int)a3 vertical:(BOOL)a4
{
  double v4;
  double v5;
  CGFloat2 result;

  sub_1B0A1D984();
  __break(1u);
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- (CGRect)getIdealBoundsWithGlyph:(unsigned int)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  sub_1B0A1D984();
  __break(1u);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)getIdealVerticalBoundsWithGlyph:(unsigned int)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  sub_1B0A1D984();
  __break(1u);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGSize)getDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  double v4;
  double v5;
  CGSize result;

  sub_1B0A1D984();
  __break(1u);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)getVerticalDeviceAdvanceWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  double v4;
  double v5;
  CGSize result;

  sub_1B0A1D984();
  __break(1u);
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGRect)getDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  sub_1B0A1D984();
  __break(1u);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)getVerticalDeviceBoundsWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  sub_1B0A1D984();
  __break(1u);
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (id)copyBitmapWithGlyph:(unsigned int)a3 transform:(const CGAffineTransform *)a4 options:(unsigned int)a5 bounds:(CGRect *)a6 bytesPerRow:(int64_t *)a7
{
  id result;

  result = (id)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (CGSize)getVerticalTranslateWithGlyph:(unsigned int)a3
{
  double v3;
  double v4;
  CGSize result;

  sub_1B0A1D984();
  __break(1u);
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)copyOriginalPathWithGlyph:(unsigned int)a3
{
  id result;

  result = (id)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (int64_t)dataResidence
{
  int64_t result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (int64_t)encodingType
{
  int64_t result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSDictionary)splicedStash
{
  NSDictionary *result;

  result = (NSDictionary *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (double)variationScalarWithTupleIndex:(int64_t)a3
{
  double result;

  sub_1B0A1D984();
  __break(1u);
  return result;
}

- (NSArray)variationScalars
{
  NSArray *result;

  result = (NSArray *)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (id)controlPointsWithGlyph:(unsigned int)a3
{
  id result;

  result = (id)sub_1B0A1D984();
  __break(1u);
  return result;
}

- (BOOL)canCreatePostScriptSubsetWithFormat:(int64_t)a3
{
  BOOL result;

  result = sub_1B0A1D984();
  __break(1u);
  return result;
}

- (_TtC10FontParser13AnyVectorFont)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AnyVectorFont();
  return -[AnyVectorFont init](&v3, sel_init);
}

- (int64_t)getUnicharsWithGlyph:(unsigned __int16)a3 unicodes:(unsigned __int16 *)a4 count:(int64_t)a5
{
  uint64_t v5;
  _TtC10FontParser13AnyVectorFont *v6;
  int64_t v7;
  __int128 v9;

  v5 = a3;
  *(_QWORD *)&v9 = a4;
  *((_QWORD *)&v9 + 1) = a5;
  v6 = self;
  v7 = sub_1B090B354(&v9, v6, v5);

  return v7;
}

- (int64_t)getGlyphsWithEncoding:(FPEncoding)a3 text:(const char *)a4 glyphs:(unsigned __int16 *)a5 count:(int64_t)a6
{
  _QWORD v7[5];
  FPEncoding v8;
  _QWORD v9[2];

  v7[2] = a5;
  v7[3] = a6;
  v7[4] = self;
  v8 = a3;
  v9[0] = a4;
  v9[1] = a6;
  return sub_1B090B448((uint64_t)v9, (void (*)(uint64_t *__return_ptr))sub_1B08E2C84, (uint64_t)v7);
}

- (int64_t)getGlyphsWithCharacters:(const unsigned __int16 *)a3 glyphs:(unsigned __int16 *)a4 count:(int64_t)a5
{
  _QWORD v6[6];
  _QWORD v7[2];

  v6[2] = a4;
  v6[3] = a5;
  v6[4] = self;
  v7[0] = a3;
  v7[1] = a5;
  return sub_1B090B448((uint64_t)v7, (void (*)(uint64_t *__return_ptr))sub_1B08E2C68, (uint64_t)v6);
}

- (int64_t)getGlyphsWithCharacters:(const unsigned __int16 *)a3 longGlyphs:(unsigned int *)a4 count:(int64_t)a5
{
  _QWORD v6[6];
  _QWORD v7[2];

  v6[2] = a4;
  v6[3] = a5;
  v6[4] = self;
  v7[0] = a3;
  v7[1] = a5;
  return sub_1B090B448((uint64_t)v7, (void (*)(uint64_t *__return_ptr))sub_1B08E2C4C, (uint64_t)v6);
}

- (BOOL)getGlyphsWithCharacterRange:(id)a3 glyphs:(unsigned __int16 *)a4
{
  int64_t var1;
  unint64_t var0;
  _TtC10FontParser13AnyVectorFont *v7;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = self;
  sub_1B08D94B0(var0, var1, (uint64_t)a4);

  return 1;
}

- (BOOL)getGlyphsWithCharacterRange:(id)a3 longGlyphs:(unsigned int *)a4
{
  int64_t var1;
  unint64_t var0;
  _TtC10FontParser13AnyVectorFont *v7;

  var1 = a3.var1;
  var0 = a3.var0;
  v7 = self;
  sub_1B08D960C(var0, var1, (uint64_t)a4);

  return 1;
}

- (BOOL)getGlyphsWithCids:(const unsigned __int16 *)a3 glyphs:(unsigned __int16 *)a4 count:(int64_t)a5
{
  _QWORD v6[6];
  _QWORD v7[2];

  v6[2] = a4;
  v6[3] = a5;
  v6[4] = self;
  v7[0] = a3;
  v7[1] = a5;
  return sub_1B090B554((uint64_t)v7, (void (*)(uint64_t *__return_ptr))sub_1B08E2C30, (char)v6) & 1;
}

- (BOOL)getCIDsWithGlyphs:(const unsigned __int16 *)a3 cids:(unsigned __int16 *)a4 count:(int64_t)a5
{
  _QWORD v6[6];
  _QWORD v7[2];

  v6[2] = a4;
  v6[3] = a5;
  v6[4] = self;
  v7[0] = a3;
  v7[1] = a5;
  return sub_1B090B554((uint64_t)v7, (void (*)(uint64_t *__return_ptr))sub_1B08E2C14, (char)v6) & 1;
}

- (id)createPostScriptEncoding:(const unsigned __int16 *)a3
{
  _QWORD v4[4];
  _QWORD v5[2];

  v4[2] = self;
  v5[0] = a3;
  v5[1] = (unint64_t)(a3 != 0) << 8;
  return (id)sub_1B090B45C((uint64_t)v5, (void (*)(uint64_t *__return_ptr))sub_1B08E2BFC, (uint64_t)v4);
}

- (void)getGlyphX:(unsigned __int16 *)a3 o:(unsigned __int16 *)a4
{
  uint64_t (*v6)(void);
  int v7;
  _TtC10FontParser13AnyVectorFont *v8;

  v6 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x188);
  v8 = self;
  v7 = v6();
  if (a3)
    *a3 = v7;
  if (a4)
    *a4 = HIWORD(v7);

}

- (void)getGlyphsWithGlyphNames:(const char *)a3 glyphs:(unsigned __int16 *)a4 count:(int64_t)a5
{
  sub_1B0909460((uint64_t)a3, a5, (void (*)(void))sub_1B08E2B74);
}

- (void)getGlyphIdealAdvanceWidthsWithGlyphs:(const unsigned __int16 *)a3 advances:(double *)a4 count:(int64_t)a5
{
  sub_1B0909460((uint64_t)a3, a5, (void (*)(void))sub_1B08E2AEC);
}

- (unsigned)numberOfGlyphs
{
  unsigned int result;
  _QWORD v3[48];

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x50))(v3);
  sub_1B08E252C(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  result = v3[0];
  if ((v3[0] & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_5;
  }
  if (HIDWORD(v3[0]))
LABEL_5:
    __break(1u);
  return result;
}

- (unsigned)unitsPerEm
{
  unsigned __int16 result;
  uint64_t v3;
  unint64_t v4;

  (*(void (**)(uint64_t *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x50))(&v3);
  result = (unsigned __int16)sub_1B08E252C(&v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  if ((v4 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (!(v4 >> 16))
  {
    return v4;
  }
  __break(1u);
  return result;
}

- (FPFontVMetrics)vMetrics
{
  _TtC10FontParser13AnyVectorFont *v4;
  FPFontVMetrics *result;
  __int128 v6;
  CGPoint v7;
  CGSize v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  CGPoint v13;
  CGSize v14;

  v4 = self;
  sub_1B08D9DA8((uint64_t)&v10);

  v6 = v12;
  v7 = v13;
  v8 = v14;
  v9 = v11;
  *(_OWORD *)&retstr->var0 = v10;
  *(_QWORD *)&retstr->var4 = v9;
  *(_OWORD *)&retstr->var6 = v6;
  retstr->var8.origin = v7;
  retstr->var8.size = v8;
  return result;
}

- (FPFontInfo)fontInfo
{
  _TtC10FontParser13AnyVectorFont *v4;
  FPFontInfo *result;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  char v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGFloat v16;
  char v17;

  v4 = self;
  sub_1B08DA0A0((uint64_t)v4);

  retstr->var0 = v6;
  *(_OWORD *)&retstr->var1 = v7;
  *(_OWORD *)&retstr->var5 = v8;
  *(_QWORD *)&retstr->var9 = v9;
  retstr->var11 = v10 & 1;
  retstr->var12 = v11 & 1;
  *(_OWORD *)&retstr->var13 = v12;
  *(_OWORD *)&retstr->var15 = v13;
  *(_OWORD *)&retstr->var17 = v14;
  *(_OWORD *)&retstr->var18.origin.y = v15;
  retstr->var18.size.height = v16;
  retstr->var19 = v17 & 1;
  return result;
}

- (BOOL)getTypoMetricsInto:(CGFloat3 *)a3
{
  _TtC10FontParser13AnyVectorFont *v5;
  char v6;
  double v7;
  _QWORD v9[5];
  uint64_t v10;
  _BYTE v11[32];
  int64x2_t v12;
  uint64_t v13;
  char v14;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x50))(v9);
  v5 = self;
  sub_1B08E252C(v9, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  sub_1B08CE970((uint64_t)&v10, (uint64_t)v11, &qword_1EEEBAD18);
  sub_1B08CE970((uint64_t)v11, (uint64_t)&v12, &qword_1EEEBAD18);
  v6 = v14;
  if ((v14 & 1) == 0)
  {
    v7 = (double)v13;
    *(float64x2_t *)&a3->var0 = vcvtq_f64_s64(v12);
    a3->var2 = v7;
  }

  return v6 ^ 1;
}

- (BOOL)getWindowsMetricsInto:(CGFloat2 *)a3
{
  _TtC10FontParser13AnyVectorFont *v5;
  char v6;
  _QWORD v8[9];
  uint64_t v9;
  _BYTE v10[24];
  int64x2_t v11;
  char v12;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x50))(v8);
  v5 = self;
  sub_1B08E252C(v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  sub_1B08CE970((uint64_t)&v9, (uint64_t)v10, &qword_1EEEBAD10);
  sub_1B08CE970((uint64_t)v10, (uint64_t)&v11, &qword_1EEEBAD10);
  v6 = v12;
  if ((v12 & 1) == 0)
    *(float64x2_t *)a3 = vcvtq_f64_s64(v11);

  return v6 ^ 1;
}

- (BOOL)getSubscriptInto:(CGRect *)a3
{
  _TtC10FontParser13AnyVectorFont *v5;
  char v6;
  CGSize v7;
  _QWORD v9[12];
  uint64_t v10;
  _BYTE v11[40];
  _OWORD v12[2];
  char v13;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x50))(v9);
  v5 = self;
  sub_1B08E252C(v9, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  sub_1B08CE970((uint64_t)&v10, (uint64_t)v11, &qword_1EEEBAC80);
  sub_1B08CE970((uint64_t)v11, (uint64_t)v12, &qword_1EEEBAC80);
  v6 = v13;
  if ((v13 & 1) == 0)
  {
    v7 = (CGSize)v12[1];
    a3->origin = (CGPoint)v12[0];
    a3->size = v7;
  }

  return v6 ^ 1;
}

- (BOOL)getSuperscriptInto:(CGRect *)a3
{
  _TtC10FontParser13AnyVectorFont *v5;
  char v6;
  CGSize v7;
  _QWORD v9[17];
  uint64_t v10;
  _BYTE v11[40];
  _OWORD v12[2];
  char v13;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x50))(v9);
  v5 = self;
  sub_1B08E252C(v9, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  sub_1B08CE970((uint64_t)&v10, (uint64_t)v11, &qword_1EEEBAC80);
  sub_1B08CE970((uint64_t)v11, (uint64_t)v12, &qword_1EEEBAC80);
  v6 = v13;
  if ((v13 & 1) == 0)
  {
    v7 = (CGSize)v12[1];
    a3->origin = (CGPoint)v12[0];
    a3->size = v7;
  }

  return v6 ^ 1;
}

- (BOOL)getStrikeoutInto:(CGFloat2 *)a3
{
  _TtC10FontParser13AnyVectorFont *v5;
  char v6;
  _QWORD v8[22];
  uint64_t v9;
  _BYTE v10[24];
  CGFloat2 v11;
  char v12;

  (*(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x50))(v8);
  v5 = self;
  sub_1B08E252C(v8, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  sub_1B08CE970((uint64_t)&v9, (uint64_t)v10, &qword_1EEEBAD08);
  sub_1B08CE970((uint64_t)v10, (uint64_t)&v11, &qword_1EEEBAD08);
  v6 = v12;
  if ((v12 & 1) == 0)
    *a3 = v11;

  return v6 ^ 1;
}

- (BOOL)getStemsInto:(CGFloat2 *)a3
{
  void (*v5)(_QWORD *__return_ptr);
  _TtC10FontParser13AnyVectorFont *v6;
  _QWORD *v7;
  double v8;
  double v9;
  _QWORD v11[48];
  _QWORD v12[48];

  v5 = *(void (**)(_QWORD *__return_ptr))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x50);
  v5(v11);
  v6 = self;
  v7 = sub_1B08E252C(v11, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  v8 = *(double *)&v11[46];
  ((void (*)(_QWORD *__return_ptr, _QWORD *))v5)(v12, v7);
  sub_1B08E252C(v12, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1B08ABC08);
  v9 = *(double *)&v12[45];
  a3->var0 = v8;
  a3->var1 = v9;

  return 1;
}

- (BOOL)getRegistryOrderingSupplement:(id *)a3 :(id *)a4 :(int *)a5
{
  _TtC10FontParser13AnyVectorFont *v8;

  v8 = self;
  LOBYTE(a5) = sub_1B08DA9E0(a3, a4, a5);

  return a5 & 1;
}

- (id)createPostScriptSubsetWithFormat:(int64_t)a3 name:(id)a4 glyphs:(const unsigned __int16 *)a5 glyphCount:(int64_t)a6 encoding:(const unsigned __int16 *)a7
{
  _QWORD v8[8];
  _QWORD v9[2];

  v8[2] = a7;
  v8[3] = self;
  v8[4] = a3;
  v8[5] = a4;
  v8[6] = a5;
  v9[0] = a5;
  v9[1] = a6;
  return (id)sub_1B090B45C((uint64_t)v9, (void (*)(uint64_t *__return_ptr))sub_1B08E2AC0, (uint64_t)v8);
}

- (void)createSubsetWithName:(const char *)a3 glyphBits:(unsigned int *)a4 glyphBitsSize:(int64_t)a5 cmap_1_0:(const unsigned __int16 *)a6 remapArray:(id *)a7 data:(id *)a8
{
  _TtC10FontParser13AnyVectorFont *v12;

  v12 = self;
  sub_1B08DAD20((uint64_t)a3, (uint64_t)a4, a5, (uint64_t)a6);

}

@end
