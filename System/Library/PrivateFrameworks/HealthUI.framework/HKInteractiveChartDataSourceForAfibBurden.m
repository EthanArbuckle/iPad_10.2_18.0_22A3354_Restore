@implementation HKInteractiveChartDataSourceForAfibBurden

HKInteractiveChartAFibBurdenData *__HKInteractiveChartDataSourceForAfibBurden_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  HKInteractiveChartAFibBurdenData *v13;
  void *v14;
  void *v15;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v4, "unitForDisplayType:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "averageQuantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", v8);
  v11 = v10;

  v12 = objc_msgSend(v7, "recordCount");
  if (v11 < 0.02)
    v11 = 0.02;
  v13 = objc_alloc_init(HKInteractiveChartAFibBurdenData);
  -[HKInteractiveChartSinglePointData setValue:](v13, "setValue:", v11);
  -[HKInteractiveChartSinglePointData setUnit:](v13, "setUnit:", v8);
  -[HKInteractiveChartSinglePointData setRepresentsRange:](v13, "setRepresentsRange:", 1);
  -[HKInteractiveChartSinglePointData setMinValue:](v13, "setMinValue:", v11);
  -[HKInteractiveChartSinglePointData setMaxValue:](v13, "setMaxValue:", v11);
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0CB5598]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartAFibBurdenData setClampsLowerData:](v13, "setClampsLowerData:", objc_msgSend(v14, "BOOLValue"));
  -[HKInteractiveChartSinglePointData setRecordCount:](v13, "setRecordCount:", v12);
  objc_msgSend(v7, "statisticsInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartSinglePointData setStatisticsInterval:](v13, "setStatisticsInterval:", v15);
  return v13;
}

HKInteractiveChartAFibBurdenData *__HKInteractiveChartDataSourceForAfibBurden_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKInteractiveChartAFibBurdenData *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  v4 = a3;
  v5 = a2;
  v6 = objc_alloc_init(HKInteractiveChartAFibBurdenData);
  objc_msgSend(v5, "_unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v7);

  objc_msgSend(v5, "_unit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v8);
  v10 = v9;

  if (v10 < 0.02)
    v10 = 0.02;
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:", v10);
  -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:", v10);
  -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:", v10);
  -[HKInteractiveChartSinglePointData setRepresentsRange:](v6, "setRepresentsRange:", 1);
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB5598]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartAFibBurdenData setClampsLowerData:](v6, "setClampsLowerData:", objc_msgSend(v11, "BOOLValue"));
  return v6;
}

@end
