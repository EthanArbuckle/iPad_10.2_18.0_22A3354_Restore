@implementation HKInteractiveChartDataSourceQuantityType

HKInteractiveChartSinglePointData *__HKInteractiveChartDataSourceQuantityType_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  HKInteractiveChartSinglePointData *v11;
  HKInteractiveChartSinglePointData *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unitForDisplayType:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "minQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v4);
  v7 = v6;

  objc_msgSend(v3, "maxQuantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v4);
  v10 = v9;

  v11 = objc_alloc_init(HKInteractiveChartSinglePointData);
  v12 = v11;
  if (vabdd_f64(v10, v7) >= 0.00000011920929)
  {
    -[HKInteractiveChartSinglePointData setMinValue:](v11, "setMinValue:", v7);
    -[HKInteractiveChartSinglePointData setMaxValue:](v12, "setMaxValue:", v10);
    -[HKInteractiveChartSinglePointData setUnit:](v12, "setUnit:", v4);
    -[HKInteractiveChartSinglePointData setRecordCount:](v12, "setRecordCount:", objc_msgSend(v3, "recordCount"));
    objc_msgSend(v3, "statisticsInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartSinglePointData setStatisticsInterval:](v12, "setStatisticsInterval:", v14);

    -[HKInteractiveChartSinglePointData setRepresentsRange:](v12, "setRepresentsRange:", 1);
  }
  else
  {
    -[HKInteractiveChartSinglePointData setValue:](v11, "setValue:", v7);
    -[HKInteractiveChartSinglePointData setUnit:](v12, "setUnit:", v4);
    -[HKInteractiveChartSinglePointData setRecordCount:](v12, "setRecordCount:", objc_msgSend(v3, "recordCount"));
    objc_msgSend(v3, "statisticsInterval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartSinglePointData setStatisticsInterval:](v12, "setStatisticsInterval:", v13);

  }
  objc_msgSend(v3, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartSinglePointData setMetadata:](v12, "setMetadata:", v15);

  return v12;
}

@end
