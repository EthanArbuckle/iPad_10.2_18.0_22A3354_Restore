@implementation SNPropertyStripInfo

- (BOOL)isEqual:(id)a3
{
  return sub_1D43317D4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1D43A0E88);
}

- (int64_t)hash
{
  _TtC13SoundAnalysis19SNPropertyStripInfo *v2;
  int64_t v3;
  int64_t v4;

  v2 = self;
  sub_1D43A1054();
  v4 = v3;

  return v4;
}

- (_TtC13SoundAnalysis19SNPropertyStripInfo)init
{
  sub_1D43A114C();
}

- (void).cxx_destruct
{
  sub_1D43A18E4();
  swift_bridgeObjectRelease();
  sub_1D4334130();
}

@end
