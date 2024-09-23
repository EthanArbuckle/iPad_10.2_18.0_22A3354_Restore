@implementation HKAnalyticsDataSource

- (HKAnalyticsDataSource)initWithHealthDataSource:(id)a3
{
  id v4;
  HKAnalyticsDataSource *v5;
  char isKindOfClass;
  id *p_weakHealthDataSource;
  HKAnalyticsHealthDataSource *v8;
  HKAnalyticsHealthDataSource *strongHealthDataSource;
  HKAnalyticsEnvironmentDataSource *v10;
  HKAnalyticsEnvironmentDataSource *environmentDataSource;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKAnalyticsDataSource;
  v5 = -[HKAnalyticsDataSource init](&v13, sel_init);
  if (v5)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    p_weakHealthDataSource = (id *)&v5->_weakHealthDataSource;
    if ((isKindOfClass & 1) != 0)
    {
      objc_storeWeak(p_weakHealthDataSource, 0);
      v8 = (HKAnalyticsHealthDataSource *)v4;
    }
    else
    {
      objc_storeWeak(p_weakHealthDataSource, v4);
      v8 = 0;
    }
    strongHealthDataSource = v5->_strongHealthDataSource;
    v5->_strongHealthDataSource = v8;

    v10 = objc_alloc_init(HKAnalyticsEnvironmentDataSource);
    environmentDataSource = v5->_environmentDataSource;
    v5->_environmentDataSource = v10;

  }
  return v5;
}

- (HKAnalyticsHealthDataSource)healthDataSource
{
  HKAnalyticsHealthDataSource *WeakRetained;
  HKAnalyticsHealthDataSource *strongHealthDataSource;
  HKAnalyticsHealthDataSource *v5;
  NSObject *v7;

  WeakRetained = (HKAnalyticsHealthDataSource *)objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
  strongHealthDataSource = WeakRetained;
  if (WeakRetained || (strongHealthDataSource = self->_strongHealthDataSource) != 0)
  {
    v5 = strongHealthDataSource;
  }
  else
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[HKAnalyticsDataSource healthDataSource].cold.1((uint64_t)self, v7);

    v5 = 0;
  }

  return v5;
}

- (HKAnalyticsEnvironmentDataSource)environmentDataSource
{
  return self->_environmentDataSource;
}

- (HKAnalyticsHealthDataSource)weakHealthDataSource
{
  return (HKAnalyticsHealthDataSource *)objc_loadWeakRetained((id *)&self->_weakHealthDataSource);
}

- (HKAnalyticsHealthDataSource)strongHealthDataSource
{
  return self->_strongHealthDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongHealthDataSource, 0);
  objc_destroyWeak((id *)&self->_weakHealthDataSource);
  objc_storeStrong((id *)&self->_environmentDataSource, 0);
}

- (void)healthDataSource
{
  id v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 138543362;
  v5 = (id)objc_opt_class();
  v3 = v5;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@]: Health data source is nil", (uint8_t *)&v4, 0xCu);

}

@end
