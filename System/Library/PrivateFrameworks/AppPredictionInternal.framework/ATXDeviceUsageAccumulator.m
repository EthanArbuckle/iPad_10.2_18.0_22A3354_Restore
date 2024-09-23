@implementation ATXDeviceUsageAccumulator

- (ATXDeviceUsageAccumulator)init
{
  ATXDeviceUsageAccumulator *v2;
  uint64_t v3;
  NSMutableDictionary *summaryMetrics;
  ATXModeDimensionSet *lastDimensionSet;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ATXDeviceUsageAccumulator;
  v2 = -[ATXDeviceUsageAccumulator init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    summaryMetrics = v2->_summaryMetrics;
    v2->_summaryMetrics = (NSMutableDictionary *)v3;

    lastDimensionSet = v2->_lastDimensionSet;
    v2->_lastDimensionSet = 0;

  }
  return v2;
}

- (void)handleEndOfStream:(id)a3
{
  ATXModeDimensionSet *lastDimensionSet;
  id v5;
  id v6;

  lastDimensionSet = self->_lastDimensionSet;
  if (lastDimensionSet)
  {
    v5 = a3;
    -[ATXDeviceUsageAccumulator _getSummaryMetricForDimensions:](self, "_getSummaryMetricForDimensions:", lastDimensionSet);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleConfigurationExit:", v5);

  }
}

- (void)handleModeDimensionSetChange:(id)a3 changeTime:(id)a4
{
  ATXModeDimensionSet *v6;
  void *v7;
  void *v8;
  ATXModeDimensionSet *lastDimensionSet;
  id v10;

  v6 = (ATXModeDimensionSet *)a3;
  v10 = a4;
  if (self->_lastDimensionSet)
  {
    -[ATXDeviceUsageAccumulator _getSummaryMetricForDimensions:](self, "_getSummaryMetricForDimensions:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleConfigurationExit:", v10);

  }
  -[ATXDeviceUsageAccumulator _getSummaryMetricForDimensions:](self, "_getSummaryMetricForDimensions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleConfigurationEntry:", v10);
  lastDimensionSet = self->_lastDimensionSet;
  self->_lastDimensionSet = v6;

}

- (void)handleNextOnInterval:(id)a3 dimensionSet:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ATXDeviceUsageAccumulator _getSummaryMetricForDimensions:](self, "_getSummaryMetricForDimensions:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleOnInterval:", v6);

}

- (id)_getSummaryMetricForDimensions:(id)a3
{
  id v4;
  void *v5;
  ATXDeviceUsageSummaryMetrics *v6;
  void *v7;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = -[ATXDeviceUsageSummaryMetrics initWithDimensions:]([ATXDeviceUsageSummaryMetrics alloc], "initWithDimensions:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_summaryMetrics, "setObject:forKeyedSubscript:", v6, v4);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)logToCoreAnalytics
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_summaryMetrics;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_summaryMetrics, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7), (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "logToCoreAnalytics");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDimensionSet, 0);
  objc_storeStrong((id *)&self->_summaryMetrics, 0);
}

@end
