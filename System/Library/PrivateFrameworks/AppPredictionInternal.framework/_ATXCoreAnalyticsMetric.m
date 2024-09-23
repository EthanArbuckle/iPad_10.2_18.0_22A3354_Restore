@implementation _ATXCoreAnalyticsMetric

- (id)metricName
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  __atxlog_handle_metrics();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[_ATXCoreAnalyticsMetric metricName].cold.1();

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Attempted to call metricName on %@ without overriding in a subclass"), v6);

  return 0;
}

- (_ATXCoreAnalyticsMetric)init
{
  void *v3;
  _ATXCoreAnalyticsMetric *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[_ATXCoreAnalyticsMetric initWithDimensions:](self, "initWithDimensions:", v3);

  return v4;
}

- (_ATXCoreAnalyticsMetric)initWithDimensions:(id)a3
{
  id v5;
  _ATXCoreAnalyticsMetric *v6;
  _ATXCoreAnalyticsMetric *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_ATXCoreAnalyticsMetric;
  v6 = -[_ATXCoreAnalyticsMetric init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_dimensionSet, a3);

  return v7;
}

- (id)coreAnalyticsDictionary
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  void *v6;

  __atxlog_handle_metrics();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    -[_ATXCoreAnalyticsMetric coreAnalyticsDictionary].cold.1();

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("Attempted to call coreAnalyticsDictionary on %@ without overriding in a subclass"), v6);

  return (id)MEMORY[0x1E0C9AA70];
}

- (id)coreAnalyticsDictionaryWithDimensions
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[_ATXCoreAnalyticsDimensionSet coreAnalyticsDictionary](self->_dimensionSet, "coreAnalyticsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  -[_ATXCoreAnalyticsMetric coreAnalyticsDictionary](self, "coreAnalyticsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v5);

  return v3;
}

- (void)logToCoreAnalytics
{
  void *v3;
  id v4;

  -[_ATXCoreAnalyticsMetric metricName](self, "metricName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXCoreAnalyticsMetric coreAnalyticsDictionaryWithDimensions](self, "coreAnalyticsDictionaryWithDimensions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (_ATXCoreAnalyticsDimensionSet)dimensionSet
{
  return self->_dimensionSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimensionSet, 0);
}

- (void)metricName
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "Attempted to call metricName on %@ without overriding in a subclass", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)coreAnalyticsDictionary
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "Attempted to call coreAnalyticsDictionary on %@ without overriding in a subclass", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

@end
