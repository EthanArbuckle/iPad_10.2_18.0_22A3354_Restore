@implementation HKCardioFitnessLevelDataSourceDelegate

void __70___HKCardioFitnessLevelDataSourceDelegate_dataForDateRange_timeScope___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  HKInteractiveChartCardioFitnessData *v10;
  void *v11;
  HKQuantityTypeDataSourceValue *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  HKHealthChartPoint *v21;
  void *v22;
  void *v23;
  HKHealthChartPoint *v24;
  id v25;

  v25 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v25, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKCardioFitnessUtilities effectiveChartPointDateWithStatisticsInterval:startDate:endDate:](HKCardioFitnessUtilities, "effectiveChartPointDateWithStatisticsInterval:startDate:endDate:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "dateOfBirthComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hk_ageWithCurrentDate:", v6);

  +[HKCardioFitnessUtilities cardioFitnessDataForLevel:biologicalSex:age:](HKCardioFitnessUtilities, "cardioFitnessDataForLevel:biologicalSex:age:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8), objc_msgSend(*(id *)(a1 + 40), "biologicalSex"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(HKInteractiveChartCardioFitnessData);
    objc_msgSend(*(id *)(a1 + 40), "unit");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartSinglePointData setUnit:](v10, "setUnit:", v11);

    -[HKInteractiveChartSinglePointData setRepresentsRange:](v10, "setRepresentsRange:", 1);
    objc_msgSend(v9, "vo2MaxLowerBound");
    -[HKInteractiveChartSinglePointData setMinValue:](v10, "setMinValue:");
    objc_msgSend(v9, "vo2MaxUpperBound");
    -[HKInteractiveChartSinglePointData setMaxValue:](v10, "setMaxValue:");
    -[HKInteractiveChartSinglePointData setRecordCount:](v10, "setRecordCount:", 1);
    -[HKInteractiveChartSinglePointData setStatisticsInterval:](v10, "setStatisticsInterval:", *(_QWORD *)(a1 + 32));
    -[HKInteractiveChartCardioFitnessData setBiologicalSex:](v10, "setBiologicalSex:", objc_msgSend(v9, "biologicalSex"));
    -[HKInteractiveChartCardioFitnessData setAge:](v10, "setAge:", v8);
    -[HKInteractiveChartCardioFitnessData setClassification:](v10, "setClassification:", objc_msgSend(v9, "cardioFitnessLevel"));
    -[HKInteractiveChartCardioFitnessData setSampleCount:](v10, "setSampleCount:", -[HKInteractiveChartSinglePointData recordCount](v10, "recordCount"));
    v12 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    v13 = (void *)MEMORY[0x1E0CB6A28];
    -[HKInteractiveChartSinglePointData unit](v10, "unit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartSinglePointData maxValue](v10, "maxValue");
    objc_msgSend(v13, "quantityWithUnit:doubleValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setMaxQuantity:](v12, "setMaxQuantity:", v15);

    v16 = (void *)MEMORY[0x1E0CB6A28];
    -[HKInteractiveChartSinglePointData unit](v10, "unit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartSinglePointData minValue](v10, "minValue");
    objc_msgSend(v16, "quantityWithUnit:doubleValue:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setMinQuantity:](v12, "setMinQuantity:", v18);

    objc_msgSend(v25, "startDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setStartDate:](v12, "setStartDate:", v19);

    objc_msgSend(v25, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setEndDate:](v12, "setEndDate:", v20);

    v21 = [HKHealthChartPoint alloc];
    -[HKInteractiveChartSinglePointData unit](v10, "unit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "baseDisplayType");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[HKHealthChartPoint initWithDataSourceValue:options:unit:displayType:](v21, "initWithDataSourceValue:options:unit:displayType:", v12, 12, v22, v23);

    -[HKHealthChartPoint setUserInfo:](v24, "setUserInfo:", v10);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v24);

  }
}

@end
