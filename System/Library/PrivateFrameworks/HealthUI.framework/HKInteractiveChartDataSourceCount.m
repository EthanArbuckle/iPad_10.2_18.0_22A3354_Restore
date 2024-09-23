@implementation HKInteractiveChartDataSourceCount

HKInteractiveChartNumberData *__HKInteractiveChartDataSourceCount_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKInteractiveChartNumberData *v3;
  void *v4;

  v2 = a2;
  v3 = objc_alloc_init(HKInteractiveChartNumberData);
  -[HKInteractiveChartNumberData setValue:](v3, "setValue:", v2);

  HKIntegerFormatter();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartNumberData setNumberFormatter:](v3, "setNumberFormatter:", v4);

  return v3;
}

@end
