@implementation DecoderByNSCoding

- (void)dealloc
{
  _TtC13SoundAnalysis17DecoderByNSCoding *v2;

  v2 = self;
  sub_1D4427FE0();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC13SoundAnalysis17DecoderByNSCoding_decoder;
  v3 = sub_1D42B28FC(&qword_1EFE51700);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (BOOL)containsValueForKey:(id)a3
{
  BOOL result;

  sub_1D4429150((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1D4428B90);
  return result;
}

- (const)decodeBytesForKey:(id)a3 returnedLength:(int64_t *)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _TtC13SoundAnalysis17DecoderByNSCoding *v9;
  const char *v10;

  v6 = sub_1D451A6EC();
  v8 = v7;
  v9 = self;
  v10 = (const char *)sub_1D4428C48(v6, v8, a4);

  swift_bridgeObjectRelease();
  return v10;
}

- (id)decodeObjectForKey:(id)a3
{
  _TtC13SoundAnalysis17DecoderByNSCoding *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;

  sub_1D451A6EC();
  v4 = self;
  sub_1D4428F6C();

  swift_bridgeObjectRelease();
  v5 = v13;
  if (!v13)
    return 0;
  v6 = sub_1D42B5528(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1D451B814();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_1D42B5400((uint64_t)v12);
  return v10;
}

- (BOOL)decodeBoolForKey:(id)a3
{
  BOOL result;

  sub_1D4429150((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1D44290F4);
  return result;
}

- (int)decodeInt32ForKey:(id)a3
{
  int result;

  sub_1D44292E4();
  return result;
}

- (int64_t)decodeInt64ForKey:(id)a3
{
  return sub_1D4429220((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1D44285F8);
}

- (int64_t)decodeIntegerForKey:(id)a3
{
  return sub_1D4429220((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1D44286E8);
}

- (int)decodeIntForKey:(id)a3
{
  int result;

  sub_1D44292E4();
  return result;
}

- (double)decodeDoubleForKey:(id)a3
{
  _TtC13SoundAnalysis17DecoderByNSCoding *v4;
  double v5;
  double v6;

  sub_1D451A6EC();
  v4 = self;
  sub_1D442932C();
  v6 = v5;

  swift_bridgeObjectRelease();
  return v6;
}

- (float)decodeFloatForKey:(id)a3
{
  _TtC13SoundAnalysis17DecoderByNSCoding *v4;
  float v5;
  float v6;

  sub_1D451A6EC();
  v4 = self;
  sub_1D44293EC();
  v6 = v5;

  swift_bridgeObjectRelease();
  return v6;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)decodeCMTimeForKey:(SEL)a3
{
  _TtC13SoundAnalysis17DecoderByNSCoding *v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;

  sub_1D451A6EC();
  v6 = self;
  v7 = sub_1D44294AC();
  v9 = v8;
  v11 = v10;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)swift_bridgeObjectRelease();
  retstr->var0 = v7;
  *(_QWORD *)&retstr->var1 = v9;
  retstr->var3 = v11;
  return result;
}

- ($A0D62BC7BB322857EA05296DE7D5C3FF)decodeCMTimeRangeForKey:(SEL)a3
{
  _TtC13SoundAnalysis17DecoderByNSCoding *v6;
  $A0D62BC7BB322857EA05296DE7D5C3FF *result;
  $A0D62BC7BB322857EA05296DE7D5C3FF v8;

  sub_1D451A6EC();
  v6 = self;
  sub_1D44295B0();

  result = ($A0D62BC7BB322857EA05296DE7D5C3FF *)swift_bridgeObjectRelease();
  *retstr = v8;
  return result;
}

- ($7BC788A1DE0CAC9D3789EC862BAE0D3E)decodeCMTimeMappingForKey:(SEL)a3
{
  sub_1D451A6EC();
  sub_1D44296E4();
}

- (_TtC13SoundAnalysis17DecoderByNSCoding)init
{
  sub_1D4429728();
}

@end
