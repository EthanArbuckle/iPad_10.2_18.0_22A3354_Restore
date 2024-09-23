@implementation HKDefaultSleepDataSourceProvider

- (HKDefaultSleepDataSourceProvider)initWithCalendar:(id)a3 queryIdentifier:(id)a4
{
  id v7;
  id v8;
  HKDefaultSleepDataSourceProvider *v9;
  HKDefaultSleepDataSourceProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKDefaultSleepDataSourceProvider;
  v9 = -[HKDefaultSleepDataSourceProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendar, a3);
    objc_storeStrong((id *)&v10->_queryIdentifier, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (id)makeSleepDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4
{
  id v6;
  id v7;
  HKSleepChartDataSource *v8;
  void *v9;
  void *v10;
  HKSleepChartDataSource *v11;

  v6 = a4;
  v7 = a3;
  v8 = [HKSleepChartDataSource alloc];
  -[HKDefaultSleepDataSourceProvider queryIdentifier](self, "queryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDefaultSleepDataSourceProvider calendar](self, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKSleepChartDataSource initWithHealthStore:representativeDisplayType:queryOptions:cacheIdentifier:queryIdentifier:calendar:](v8, "initWithHealthStore:representativeDisplayType:queryOptions:cacheIdentifier:queryIdentifier:calendar:", v7, v6, 2, CFSTR("HKSleepChartCacheIdentifierSleepConsistency"), v9, v10);

  return v11;
}

- (id)makeSleepStagesDataSourceFromHealthStore:(id)a3 representativeDisplayType:(id)a4
{
  id v6;
  id v7;
  HKSleepChartDataSource *v8;
  void *v9;
  void *v10;
  HKSleepChartDataSource *v11;

  v6 = a4;
  v7 = a3;
  v8 = [HKSleepChartDataSource alloc];
  -[HKDefaultSleepDataSourceProvider queryIdentifier](self, "queryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDefaultSleepDataSourceProvider calendar](self, "calendar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKSleepChartDataSource initWithHealthStore:representativeDisplayType:queryOptions:cacheIdentifier:queryIdentifier:calendar:](v8, "initWithHealthStore:representativeDisplayType:queryOptions:cacheIdentifier:queryIdentifier:calendar:", v7, v6, 6, CFSTR("HKSleepChartCacheIdentifierSleepStages"), v9, v10);

  return v11;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

@end
