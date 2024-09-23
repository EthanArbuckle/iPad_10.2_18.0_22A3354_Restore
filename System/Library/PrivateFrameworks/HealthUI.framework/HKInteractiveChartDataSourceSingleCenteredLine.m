@implementation HKInteractiveChartDataSourceSingleCenteredLine

HKInteractiveChartCategoryValueData *__HKInteractiveChartDataSourceSingleCenteredLine_block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  HKInteractiveChartCategoryValueData *v8;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(HKInteractiveChartCategoryValueData);
  -[HKInteractiveChartCategoryValueData setValue:](v8, "setValue:", a2);
  -[HKInteractiveChartCategoryValueData setStartDate:](v8, "setStartDate:", v7);

  -[HKInteractiveChartCategoryValueData setEndDate:](v8, "setEndDate:", v6);
  return v8;
}

@end
