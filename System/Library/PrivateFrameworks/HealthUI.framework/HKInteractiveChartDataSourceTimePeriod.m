@implementation HKInteractiveChartDataSourceTimePeriod

HKInteractiveChartTimePeriodData *__HKInteractiveChartDataSourceTimePeriod_block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  HKInteractiveChartTimePeriodData *v9;
  double v10;
  double v11;

  v7 = a4;
  v8 = a2;
  v9 = objc_alloc_init(HKInteractiveChartTimePeriodData);
  objc_msgSend(v8, "doubleValue");
  v11 = v10;

  -[HKInteractiveChartTimePeriodData setTimePeriod:](v9, "setTimePeriod:", v11);
  -[HKInteractiveChartTimePeriodData setTimePeriodPrefix:](v9, "setTimePeriodPrefix:", *(_QWORD *)(a1 + 32));
  -[HKInteractiveChartTimePeriodData setRecordCount:](v9, "setRecordCount:", a3);
  -[HKInteractiveChartTimePeriodData setStatisticsInterval:](v9, "setStatisticsInterval:", v7);

  return v9;
}

@end
