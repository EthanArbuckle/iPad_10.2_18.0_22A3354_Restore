@implementation HKAnalyticsEnvironmentDataSource

- (HKAnalyticsEnvironmentDataSource)init
{
  HKAnalyticsEnvironmentDataSource *v2;
  HKCalendarCache *v3;
  HKCalendarCache *calendarCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKAnalyticsEnvironmentDataSource;
  v2 = -[HKAnalyticsEnvironmentDataSource init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(HKCalendarCache);
    calendarCache = v2->_calendarCache;
    v2->_calendarCache = v3;

  }
  return v2;
}

- (NSDate)currentDate
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "now");
}

- (NSString)activePairedDeviceModelNumber
{
  return +[HKNanoRegistryDeviceUtility activePairedDeviceModelNumber](HKNanoRegistryDeviceUtility, "activePairedDeviceModelNumber");
}

- (NSString)activePairedDeviceOSBuildNumber
{
  return (NSString *)+[HKNanoRegistryDeviceUtility activePairedDeviceSystemBuildVersion](HKNanoRegistryDeviceUtility, "activePairedDeviceSystemBuildVersion");
}

- (NSString)activePairedDeviceProductType
{
  return (NSString *)+[HKNanoRegistryDeviceUtility activePairedDeviceProductType](HKNanoRegistryDeviceUtility, "activePairedDeviceProductType");
}

- (NSString)activePairedDeviceRegionInfo
{
  return +[HKNanoRegistryDeviceUtility activePairedDeviceRegionInfo](HKNanoRegistryDeviceUtility, "activePairedDeviceRegionInfo");
}

- (NSString)activePairedDeviceHousingColor
{
  return +[HKNanoRegistryDeviceUtility activePairedDeviceHousingColor](HKNanoRegistryDeviceUtility, "activePairedDeviceHousingColor");
}

- (id)bucketedNumberOfDaysSinceDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;

  if (!a3)
    return 0;
  v4 = a3;
  -[HKAnalyticsEnvironmentDataSource calendarCache](self, "calendarCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKAnalyticsEnvironmentDataSource currentDate](self, "currentDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:toDate:options:", 16, v4, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (v9 = objc_msgSend(v8, "day"), v9 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKAnalyticsSigFigBinnedValue(v12, 2, &unk_1E3896880);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)bucketedNumberOfWeeksSinceDate:(id)a3
{
  return -[HKAnalyticsEnvironmentDataSource bucketedNumberOfWeeksSinceDate:minimumBinningValue:](self, "bucketedNumberOfWeeksSinceDate:minimumBinningValue:", a3, 100);
}

- (id)bucketedNumberOfWeeksSinceDate:(id)a3 minimumBinningValue:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  void *v15;

  if (!a3)
    return 0;
  v6 = a3;
  -[HKAnalyticsEnvironmentDataSource calendarCache](self, "calendarCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentCalendar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKAnalyticsEnvironmentDataSource currentDate](self, "currentDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "components:fromDate:toDate:options:", 0x2000, v6, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 && (v11 = objc_msgSend(v10, "weekOfYear"), v11 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKAnalyticsSigFigBinnedValue(v14, 2, v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (HKCalendarCache)calendarCache
{
  return self->_calendarCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
}

@end
