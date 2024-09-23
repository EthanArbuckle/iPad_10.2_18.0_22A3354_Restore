@implementation SNMLModelCacheKey

- (id)copyWithZone:(void *)a3
{
  _TtC13SoundAnalysis17SNMLModelCacheKey *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_1D437EFBC(v6);

  sub_1D42B5528(v6, v6[3]);
  v4 = (void *)sub_1D451B814();
  sub_1D42B5400((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  _TtC13SoundAnalysis17SNMLModelCacheKey *v2;
  id v3;

  v2 = self;
  v3 = sub_1D437F0B8();

  return (int64_t)v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC13SoundAnalysis17SNMLModelCacheKey *v4;
  _TtC13SoundAnalysis17SNMLModelCacheKey *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1D451B208();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_1D437F0D0((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6 & 1;
}

- (_TtC13SoundAnalysis17SNMLModelCacheKey)init
{
  sub_1D437F208();
}

- (void).cxx_destruct
{

}

@end
