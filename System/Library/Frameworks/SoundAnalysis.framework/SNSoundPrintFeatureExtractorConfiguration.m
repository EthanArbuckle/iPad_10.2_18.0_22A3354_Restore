@implementation SNSoundPrintFeatureExtractorConfiguration

- (int64_t)hash
{
  _TtC13SoundAnalysis41SNSoundPrintFeatureExtractorConfiguration *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1D44BBB2C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC13SoundAnalysis41SNSoundPrintFeatureExtractorConfiguration *v4;
  _TtC13SoundAnalysis41SNSoundPrintFeatureExtractorConfiguration *v5;
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
  v6 = sub_1D44BBB88((uint64_t)v8);

  sub_1D42B5464((uint64_t)v8);
  return v6;
}

- (_TtC13SoundAnalysis41SNSoundPrintFeatureExtractorConfiguration)init
{
  sub_1D44BBCD4();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end
