@implementation HKInteractiveChartDataSourceForWorkouts

HKInteractiveChartTimePeriodData *__HKInteractiveChartDataSourceForWorkouts_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  HKInteractiveChartTimePeriodData *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HKInteractiveChartTimePeriodData);
  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  -[HKInteractiveChartTimePeriodData setTimePeriod:](v7, "setTimePeriod:");
  -[HKInteractiveChartTimePeriodData setStartDate:](v7, "setStartDate:", v6);

  -[HKInteractiveChartTimePeriodData setEndDate:](v7, "setEndDate:", v5);
  -[HKInteractiveChartTimePeriodData setRecordCount:](v7, "setRecordCount:", 1);
  return v7;
}

@end
