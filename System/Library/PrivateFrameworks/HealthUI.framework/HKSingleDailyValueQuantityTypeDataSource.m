@implementation HKSingleDailyValueQuantityTypeDataSource

- (id)queryDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKQuantityTypeDataSource quantityType](self, "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKSingleDailyValueQuantity(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  objc_super v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "statisticsInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKSingleDailyValueQuantityTypeDataSource _matchesDailyValues:](self, "_matchesDailyValues:", v8);

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_oneDay");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "startOfDayForDate:", v12);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingUnit:value:toDate:options:", 16, 1, v13, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "startOfDayForDate:", v26);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesWithStartDate:endDate:options:", v25, v24, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc(MEMORY[0x1E0CB6C80]);
    -[HKQuantityTypeDataSource quantityType](self, "quantityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[HKQuantityTypeDataSource statisticsOptions](self, "statisticsOptions");
    objc_msgSend(v6, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v15, "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v16, v14, v17, v18, v10);

    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __80__HKSingleDailyValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke;
    v27[3] = &unk_1E9C44718;
    v27[4] = self;
    v28 = v10;
    v29 = v11;
    v30 = v7;
    v20 = v11;
    v21 = v10;
    objc_msgSend(v19, "setInitialResultsHandler:", v27);
    objc_msgSend(v19, "setDebugIdentifier:", CFSTR("charting (single daily value)"));
    v32[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)HKSingleDailyValueQuantityTypeDataSource;
    -[HKQuantityTypeDataSource queriesForRequest:completionHandler:](&v31, sel_queriesForRequest_completionHandler_, v6, v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v22;
}

void __80__HKSingleDailyValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v13 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "statistics");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__HKSingleDailyValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_2;
  v14[3] = &unk_1E9C446F0;
  v10 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v15 = v10;
  v11 = v8;
  v16 = v11;
  v17 = *(id *)(a1 + 48);
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v14);

  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    (*(void (**)(uint64_t, id, id))(v12 + 16))(v12, v11, v13);

}

void __80__HKSingleDailyValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_shouldEmitOnlySinglePointForStatistics:", v3))
  {
    objc_msgSend(v3, "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIMidDate(v4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_quantityValueFromStatistics:statisticsInterval:date:", v3, *(_QWORD *)(a1 + 40), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

  }
  else
  {
    v8 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v3, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithStartDate:endDate:", v9, v10);

    v12 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v12, "setHour:", 1);
    objc_msgSend(v3, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateByAddingTimeInterval:", 180.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_quantityValueFromStatistics:statisticsInterval:date:", v3, *(_QWORD *)(a1 + 40), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
    v16 = *(void **)(a1 + 56);
    v21 = MEMORY[0x1E0C809B0];
    v22 = 3221225472;
    v23 = __80__HKSingleDailyValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_3;
    v24 = &unk_1E9C446C8;
    v25 = *(_QWORD *)(a1 + 32);
    v17 = v3;
    v26 = v17;
    v27 = *(id *)(a1 + 40);
    v28 = *(id *)(a1 + 48);
    objc_msgSend(v16, "hk_enumerateDateInterval:byDateComponents:block:", v11, v12, &v21);
    objc_msgSend(v17, "endDate", v21, v22, v23, v24, v25);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "dateByAddingTimeInterval:", -60.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_quantityValueFromStatistics:statisticsInterval:date:", v17, *(_QWORD *)(a1 + 40), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v20);

  }
}

void __80__HKSingleDailyValueQuantityTypeDataSource_queriesForRequest_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateByAddingTimeInterval:", 1800.0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_quantityValueFromStatistics:statisticsInterval:date:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addObject:", v4);

}

- (BOOL)_shouldEmitOnlySinglePointForStatistics:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(a3, "baselineRelativeValueState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue") != 3;
  else
    v5 = 0;

  return v5;
}

- (id)_quantityValueFromStatistics:(id)a3 statisticsInterval:(id)a4 date:(id)a5
{
  id v7;
  id v8;
  id v9;
  HKQuantityTypeDataSourceValue *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(HKQuantityTypeDataSourceValue);
  -[HKQuantityTypeDataSourceValue setStartDate:](v10, "setStartDate:", v7);
  -[HKQuantityTypeDataSourceValue setEndDate:](v10, "setEndDate:", v7);

  objc_msgSend(v9, "quantityType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityTypeDataSourceValue setQuantityType:](v10, "setQuantityType:", v11);

  objc_msgSend(v9, "averageQuantity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityTypeDataSourceValue setAverageQuantity:](v10, "setAverageQuantity:", v12);

  objc_msgSend(v9, "duration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityTypeDataSourceValue setDurationQuantity:](v10, "setDurationQuantity:", v13);

  objc_msgSend(v9, "sumQuantity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityTypeDataSourceValue setSumQuantity:](v10, "setSumQuantity:", v14);

  objc_msgSend(v9, "minimumQuantity");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityTypeDataSourceValue setMinQuantity:](v10, "setMinQuantity:", v15);

  objc_msgSend(v9, "maximumQuantity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityTypeDataSourceValue setMaxQuantity:](v10, "setMaxQuantity:", v16);

  objc_msgSend(v9, "mostRecentQuantity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityTypeDataSourceValue setMostRecentQuantity:](v10, "setMostRecentQuantity:", v17);

  -[HKQuantityTypeDataSourceValue setRecordCount:](v10, "setRecordCount:", 1);
  -[HKQuantityTypeDataSourceValue setStatisticsInterval:](v10, "setStatisticsInterval:", v8);

  objc_msgSend(v9, "baselineRelativeValueState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKQuantityTypeDataSourceValue setBaselineRelativeValueState:](v10, "setBaselineRelativeValueState:", v18);
  return v10;
}

- (id)_componentsForDailyValues
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setDay:", 0x7FFFFFFFFFFFFFFELL);
  return v2;
}

- (BOOL)_matchesDailyValues:(id)a3
{
  return objc_msgSend(a3, "day") == 0x7FFFFFFFFFFFFFFELL;
}

- (id)statisticsIntervalForTimeScope:(int64_t)a3 resolution:(int64_t)a4 displayType:(id)a5
{
  id v8;
  int64_t v9;
  objc_super v11;

  v8 = a5;
  if ((unint64_t)a3 <= 8)
  {
    if (((1 << a3) & 0x13F) != 0)
    {
      v11.receiver = self;
      v11.super_class = (Class)HKSingleDailyValueQuantityTypeDataSource;
      -[HKHealthQueryChartCacheDataSource statisticsIntervalForTimeScope:resolution:displayType:](&v11, sel_statisticsIntervalForTimeScope_resolution_displayType_, a3, a4, v8);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HKSingleDailyValueQuantityTypeDataSource _componentsForDailyValues](self, "_componentsForDailyValues");
      v9 = objc_claimAutoreleasedReturnValue();
    }
    a4 = v9;
  }

  return (id)a4;
}

- (unint64_t)calendarUnitForTimeScope:(int64_t)a3 displayType:(id)a4
{
  id v6;
  unint64_t v7;
  objc_super v9;

  v6 = a4;
  if ((unint64_t)a3 < 6 || a3 == 8)
  {
    v9.receiver = self;
    v9.super_class = (Class)HKSingleDailyValueQuantityTypeDataSource;
    v7 = -[HKHealthQueryChartCacheDataSource calendarUnitForTimeScope:displayType:](&v9, sel_calendarUnitForTimeScope_displayType_, a3, v6);
  }
  else
  {
    v7 = 16;
  }

  return v7;
}

- (BOOL)requiresPointRealignmentToMidnightForStatisticsInterval:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if (-[HKSingleDailyValueQuantityTypeDataSource _matchesDailyValues:](self, "_matchesDailyValues:", v4))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)HKSingleDailyValueQuantityTypeDataSource;
    v5 = -[HKQuantityTypeDataSource requiresPointRealignmentToMidnightForStatisticsInterval:](&v7, sel_requiresPointRealignmentToMidnightForStatisticsInterval_, v4);
  }

  return v5;
}

@end
