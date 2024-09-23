@implementation CycleFactorsDataSource

- (void)pregnancyModelDidUpdate:(id)a3
{
  id v3;

  v3 = a3;
  swift_retain();
  sub_231A1FDD0(v3);

  swift_release();
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = a4;
  swift_retain();
  sub_231A20298(v5, v6);

  swift_release();
}

@end
