@implementation HKSleepAnalysisDataSourceContext

+ (id)sleepAnalysisDataSourceContextWithChartType:(int64_t)a3 timeScope:(int64_t)a4
{
  HKSleepAnalysisDataSourceContext *v6;

  v6 = objc_alloc_init(HKSleepAnalysisDataSourceContext);
  -[HKSleepAnalysisDataSourceContext setChartType:](v6, "setChartType:", a3);
  -[HKSleepAnalysisDataSourceContext setTimeScope:](v6, "setTimeScope:", a4);
  return v6;
}

- (int64_t)chartType
{
  return self->_chartType;
}

- (void)setChartType:(int64_t)a3
{
  self->_chartType = a3;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

@end
