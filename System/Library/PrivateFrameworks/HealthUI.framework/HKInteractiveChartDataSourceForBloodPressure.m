@implementation HKInteractiveChartDataSourceForBloodPressure

HKInteractiveChartBloodPressureData *__HKInteractiveChartDataSourceForBloodPressure_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  HKInteractiveChartBloodPressureData *v22;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    v14 = 0;
    if (v6)
      goto LABEL_3;
LABEL_5:
    v21 = 0;
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "minimumQuantity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "maximumQuantity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_5;
LABEL_3:
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "minimumQuantity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v15, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "maximumQuantity");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v18, "numberWithDouble:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v17, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v22 = objc_alloc_init(HKInteractiveChartBloodPressureData);
  -[HKInteractiveChartBloodPressureData setSystolicRange:](v22, "setSystolicRange:", v14);
  -[HKInteractiveChartBloodPressureData setDiastolicRange:](v22, "setDiastolicRange:", v21);

  return v22;
}

@end
