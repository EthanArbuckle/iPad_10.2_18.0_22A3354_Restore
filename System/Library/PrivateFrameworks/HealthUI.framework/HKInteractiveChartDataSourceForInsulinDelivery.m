@implementation HKInteractiveChartDataSourceForInsulinDelivery

HKInteractiveChartInsulinData *__HKInteractiveChartDataSourceForInsulinDelivery_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKInteractiveChartInsulinData *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  v5 = a2;
  v6 = objc_alloc_init(HKInteractiveChartInsulinData);
  objc_msgSend(v5, "doubleValue");
  v8 = v7;

  -[HKInteractiveChartInsulinData setBasalValue:](v6, "setBasalValue:", v8);
  objc_msgSend(v4, "doubleValue");
  v10 = v9;

  -[HKInteractiveChartInsulinData setTotalValue:](v6, "setTotalValue:", v10);
  return v6;
}

@end
