@implementation SNDSPGraphInfo

- (BOOL)isEqual:(id)a3
{
  return sub_1D43317D4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1D43A04B0);
}

- (int64_t)hash
{
  _TtC13SoundAnalysis14SNDSPGraphInfo *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1D43A065C();
  v4 = v3;

  return v4;
}

- (_TtC13SoundAnalysis14SNDSPGraphInfo)init
{
  sub_1D43A077C();
}

- (void).cxx_destruct
{
  sub_1D43A18E4();
  sub_1D43A18E4();
  swift_bridgeObjectRelease();
  sub_1D4334130();
}

@end
