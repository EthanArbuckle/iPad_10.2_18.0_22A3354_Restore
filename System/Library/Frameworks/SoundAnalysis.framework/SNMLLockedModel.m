@implementation SNMLLockedModel

- (MLModelDescription)modelDescription
{
  _TtC13SoundAnalysis15SNMLLockedModel *v2;
  id v3;

  v2 = self;
  v3 = sub_1D4371864();

  return (MLModelDescription *)v3;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  return sub_1D43719EC(self, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, id))sub_1D43718DC);
}

- (_TtC13SoundAnalysis15SNMLLockedModel)init
{
  sub_1D4371AB8();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_release();
}

@end
