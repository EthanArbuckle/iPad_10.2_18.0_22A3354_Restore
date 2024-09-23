@implementation HKSleepDurationAverageSeries

void __75___HKSleepDurationAverageSeries_coordinatesForBlock_blockPath_xAxis_yAxis___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "averageValueType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAnnotationOptions:", HKSleepChartPointFormatterOptionsForSleepAnalysis(v6));

  }
}

@end
