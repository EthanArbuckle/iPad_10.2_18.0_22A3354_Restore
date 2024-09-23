@implementation CycleStatisticsDataSource

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = *(void **)&self->analysis[7];
  *(_QWORD *)&self->analysis[7] = a4;
  v7 = a4;
  v8 = a3;
  swift_retain();

  if ((self->sectionStyle[0] & 1) != 0)
    sub_231C8EC68(v7);
  else
    sub_231C8E7E8(v7);

  swift_release();
}

@end
