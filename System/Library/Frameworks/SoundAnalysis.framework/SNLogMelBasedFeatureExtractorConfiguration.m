@implementation SNLogMelBasedFeatureExtractorConfiguration

- (int64_t)hash
{
  _TtC13SoundAnalysis42SNLogMelBasedFeatureExtractorConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1D4342B5C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC13SoundAnalysis42SNLogMelBasedFeatureExtractorConfiguration *v4;
  _TtC13SoundAnalysis42SNLogMelBasedFeatureExtractorConfiguration *v5;
  BOOL v6;
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
  v6 = sub_1D4342BA4((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6;
}

- (_TtC13SoundAnalysis42SNLogMelBasedFeatureExtractorConfiguration)init
{
  sub_1D4342CDC();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
