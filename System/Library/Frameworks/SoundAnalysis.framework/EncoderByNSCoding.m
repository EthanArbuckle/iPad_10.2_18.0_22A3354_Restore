@implementation EncoderByNSCoding

- (BOOL)allowsKeyedCoding
{
  return 1;
}

- (void)encodeCMTime:(id *)a3 forKey:(id)a4
{
  _TtC13SoundAnalysis17EncoderByNSCoding *v5;

  sub_1D451A6EC();
  v5 = self;
  sub_1D442777C();

  swift_bridgeObjectRelease();
}

- (void)encodeCMTimeRange:(id *)a3 forKey:(id)a4
{
  _TtC13SoundAnalysis17EncoderByNSCoding *v5;

  sub_1D451A6EC();
  v5 = self;
  sub_1D44277F0();

  swift_bridgeObjectRelease();
}

- (void)encodeCMTimeMapping:(id *)a3 forKey:(id)a4
{
  sub_1D451A6EC();
  sub_1D44278C0();
}

- (void)encodeObject:(id)a3 forKey:(id)a4
{
  id v6;
  _TtC13SoundAnalysis17EncoderByNSCoding *v7;
  id v8;
  _TtC13SoundAnalysis17EncoderByNSCoding *v9;
  _OWORD v10[2];

  if (a3)
  {
    v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v8 = a4;
    v9 = self;
  }
  sub_1D451A6EC();

  sub_1D4427904((uint64_t)v10);
  swift_bridgeObjectRelease();
  sub_1D42B5464((uint64_t)v10);
}

- (void)encodeBool:(BOOL)a3 forKey:(id)a4
{
  _TtC13SoundAnalysis17EncoderByNSCoding *v5;

  sub_1D451A6EC();
  v5 = self;
  sub_1D4427A68();

  swift_bridgeObjectRelease();
}

- (void)encodeInteger:(int64_t)a3 forKey:(id)a4
{
  sub_1D4427B30((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1D4427AC4);
}

- (void)encodeInt32:(int)a3 forKey:(id)a4
{
  sub_1D4427B30((uint64_t)self, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1D4429D98);
}

- (void)encodeInt64:(int64_t)a3 forKey:(id)a4
{
  sub_1D4427B30((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1D4427B00);
}

- (void)encodeFloat:(float)a3 forKey:(id)a4
{
  _TtC13SoundAnalysis17EncoderByNSCoding *v5;

  sub_1D451A6EC();
  v5 = self;
  sub_1D4427B7C();

  swift_bridgeObjectRelease();
}

- (void)encodeDouble:(double)a3 forKey:(id)a4
{
  _TtC13SoundAnalysis17EncoderByNSCoding *v5;

  sub_1D451A6EC();
  v5 = self;
  sub_1D4427BE4();

  swift_bridgeObjectRelease();
}

- (void)encodeBytes:(const char *)a3 length:(int64_t)a4 forKey:(id)a5
{
  _TtC13SoundAnalysis17EncoderByNSCoding *v8;

  sub_1D451A6EC();
  v8 = self;
  sub_1D4427C4C((uint64_t)a3, a4);

  swift_bridgeObjectRelease();
}

- (void)encodeInt:(int)a3 forKey:(id)a4
{
  sub_1D4427B30((uint64_t)self, (uint64_t)a2, *(uint64_t *)&a3, (uint64_t)a4, (void (*)(uint64_t, uint64_t, uint64_t))sub_1D4427D08);
}

- (void)encodeConditionalObject:(id)a3 forKey:(id)a4
{
  id v6;
  _TtC13SoundAnalysis17EncoderByNSCoding *v7;
  id v8;
  _TtC13SoundAnalysis17EncoderByNSCoding *v9;

  if (a3)
  {
    v8 = a4;
    v9 = self;
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    v6 = a4;
    v7 = self;
  }
  sub_1D451A6EC();

  sub_1D4427D18();
}

- (_TtC13SoundAnalysis17EncoderByNSCoding)init
{
  sub_1D4427DA8();
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC13SoundAnalysis17EncoderByNSCoding_encoder;
  v3 = sub_1D42B28FC(&qword_1EFE51720);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
