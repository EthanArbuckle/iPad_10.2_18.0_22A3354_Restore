@implementation HKRemoteChartConfiguration

- (HKRemoteChartConfiguration)initWithStatisticIntervalComponentsByTimeScope:(id)a3
{
  id v5;
  HKRemoteChartConfiguration *v6;
  HKRemoteChartConfiguration *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRemoteChartConfiguration;
  v6 = -[HKRemoteChartConfiguration init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_statisticIntervalComponentsByTimeScope, a3);

  return v7;
}

- (id)statisticIntervalComponentsForTimeScope:(int64_t)a3
{
  NSDictionary *statisticIntervalComponentsByTimeScope;
  void *v4;
  void *v5;

  statisticIntervalComponentsByTimeScope = self->_statisticIntervalComponentsByTimeScope;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](statisticIntervalComponentsByTimeScope, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticIntervalComponentsByTimeScope, 0);
}

@end
