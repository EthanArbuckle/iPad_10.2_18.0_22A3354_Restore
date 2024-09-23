@implementation SNMLCustomModel

- (MLModelDescription)modelDescription
{
  return (MLModelDescription *)sub_1D4371670();
}

- (void)setModelDescription:(id)a3
{
  id v4;
  _TtC13SoundAnalysis15SNMLCustomModel *v5;

  v4 = a3;
  v5 = self;
  sub_1D43716C8((uint64_t)v4);

}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  return sub_1D43719EC(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, id))sub_1D43716DC);
}

- (_TtC13SoundAnalysis15SNMLCustomModel)init
{
  sub_1D43717AC();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

}

@end
