@implementation HKInteractiveChartDataSourceForSleepingWristTemperature

HKInteractiveChartBaselineRelativeData *__HKInteractiveChartDataSourceForSleepingWristTemperature_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  HKInteractiveChartBaselineRelativeData *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v2, "unitForChartingDisplayType:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(HKInteractiveChartBaselineRelativeData);
  objc_msgSend(v4, "averageQuantity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v5);
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");

  -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v5);
  objc_msgSend(v4, "baselineRelativeValueState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartBaselineRelativeData setRelativeValueState:](v6, "setRelativeValueState:", v8);

  -[HKInteractiveChartSinglePointData setRecordCount:](v6, "setRecordCount:", objc_msgSend(v4, "recordCount"));
  objc_msgSend(v4, "statisticsInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v6, "setStatisticsInterval:", v9);
  return v6;
}

@end
