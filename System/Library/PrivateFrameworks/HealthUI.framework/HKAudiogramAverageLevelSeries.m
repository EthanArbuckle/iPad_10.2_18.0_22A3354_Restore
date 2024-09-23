@implementation HKAudiogramAverageLevelSeries

- (HKAudiogramAverageLevelSeries)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[HKLineSeries init](&v3, sel_init);
}

- (BOOL)supportsMultiTouchSelection
{
  return 0;
}

+ (id)audiogramAverageLevelSeriesWithColor:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = _s8HealthUI27AudiogramAverageLevelSeriesC04makecdeF012primaryColorACSo7UIColorC_tFZ_0(v3);

  return v4;
}

@end
