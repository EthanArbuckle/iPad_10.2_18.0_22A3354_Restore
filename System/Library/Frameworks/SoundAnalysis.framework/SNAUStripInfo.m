@implementation SNAUStripInfo

- (BOOL)isEqual:(id)a3
{
  return sub_1D43317D4(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1D43A09E0);
}

- (int64_t)hash
{
  _TtC13SoundAnalysis13SNAUStripInfo *v2;
  unint64_t v3;

  v2 = self;
  v3 = sub_1D43A0B7C();

  return v3;
}

- (_TtC13SoundAnalysis13SNAUStripInfo)init
{
  sub_1D43A0C64();
}

- (void).cxx_destruct
{
  sub_1D43A18E4();
  sub_1D4334130();
}

@end
