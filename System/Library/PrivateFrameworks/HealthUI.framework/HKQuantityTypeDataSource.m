@implementation HKQuantityTypeDataSource

- (HKQuantityTypeDataSource)initWithUnitController:(id)a3 options:(unint64_t)a4 displayType:(id)a5 healthStore:(id)a6
{
  id v11;
  HKQuantityTypeDataSource *v12;
  HKQuantityTypeDataSource *v13;
  _HKQuantityTypeDataSourceMapping *v14;
  _HKQuantityTypeDataSourceMapping *mappingState;
  uint64_t v16;
  id mappingFunction;
  objc_super v19;

  v11 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKQuantityTypeDataSource;
  v12 = -[HKHealthQueryChartCacheDataSource initWithDisplayType:healthStore:](&v19, sel_initWithDisplayType_healthStore_, a5, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_unitController, a3);
    v13->_statisticsOptions = a4;
    v14 = -[_HKQuantityTypeDataSourceMapping initWithQuantityTypeDataSource:]([_HKQuantityTypeDataSourceMapping alloc], "initWithQuantityTypeDataSource:", v13);
    mappingState = v13->_mappingState;
    v13->_mappingState = v14;

    -[HKQuantityTypeDataSource _createMappingFunction:](v13, "_createMappingFunction:", v13->_mappingState);
    v16 = objc_claimAutoreleasedReturnValue();
    mappingFunction = v13->_mappingFunction;
    v13->_mappingFunction = (id)v16;

  }
  return v13;
}

- (HKQuantityType)quantityType
{
  void *v2;
  void *v3;

  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQuantityType *)v3;
}

- (id)mappingFunctionForContext:(id)a3
{
  return _Block_copy(self->_mappingFunction);
}

- (id)_createMappingFunction:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HKQuantityTypeDataSource__createMappingFunction___block_invoke;
  aBlock[3] = &unk_1E9C43B68;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

uint64_t __51__HKQuantityTypeDataSource__createMappingFunction___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "map:", a2);
}

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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKQuantityType(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = (void *)MEMORY[0x1E0CB7010];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "statisticsInterval");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sampleType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v6, "shouldUseDailyAverageWithDateComponents:sampleType:", v9, v11);

  objc_msgSend(v8, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "statisticsInterval");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    -[HKQuantityTypeDataSource _dailyAverageQueriesWithStartDate:endDate:statisticsInterval:completion:](self, "_dailyAverageQueriesWithStartDate:endDate:statisticsInterval:completion:", v13, v14, v15, v7);
  else
    -[HKQuantityTypeDataSource _defaultQueriesForStartDate:endDate:statisticsInterval:completionHandler:](self, "_defaultQueriesForStartDate:endDate:statisticsInterval:completionHandler:", v13, v14, v15, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_dailyAverageQueriesWithStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0C99D78];
  v14 = a4;
  objc_msgSend(v13, "hk_oneDay");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __100__HKQuantityTypeDataSource__dailyAverageQueriesWithStartDate_endDate_statisticsInterval_completion___block_invoke;
  v21[3] = &unk_1E9C43B90;
  v21[4] = self;
  v22 = v11;
  v23 = v10;
  v24 = v12;
  v16 = v10;
  v17 = v11;
  v18 = v12;
  -[HKQuantityTypeDataSource _defaultQueriesForStartDate:endDate:statisticsInterval:completionHandler:](self, "_defaultQueriesForStartDate:endDate:statisticsInterval:completionHandler:", v16, v14, v15, v21);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void __100__HKQuantityTypeDataSource__dailyAverageQueriesWithStartDate_endDate_statisticsInterval_completion___block_invoke(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = a1[6];
  v6 = a1[7];
  v8 = a3;
  objc_msgSend(v4, "_averageByInterval:startDate:statistics:", v5, v7, a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v9, v8);

}

- (id)_averageByInterval:(id)a3 startDate:(id)a4 statistics:(id)a5
{
  id v8;
  HKUnitPreferenceController *unitController;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  _QWORD v25[4];
  id v26;
  HKQuantityTypeDataSource *v27;
  id v28;
  id v29;
  id v30;

  v8 = a3;
  unitController = self->_unitController;
  v10 = a5;
  v11 = a4;
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController unitForDisplayType:](unitController, "unitForDisplayType:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sampleType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB7010];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __68__HKQuantityTypeDataSource__averageByInterval_startDate_statistics___block_invoke;
  v25[3] = &unk_1E9C43BB8;
  v26 = v13;
  v27 = self;
  v28 = v8;
  v29 = v17;
  v30 = v15;
  v19 = v15;
  v20 = v17;
  v21 = v8;
  v22 = v13;
  objc_msgSend(v18, "arrayByCoalescingObjects:startDate:intervalComponents:calendar:combiningBlock:", v10, v11, v21, v16, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

HKQuantityTypeDataSourceValue *__68__HKQuantityTypeDataSource__averageByInterval_startDate_statistics___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  HKQuantityTypeDataSourceValue *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v15), "sumQuantity");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v13);
  }

  objc_msgSend(MEMORY[0x1E0CB7010], "averageSumFromQuantities:unit:", v10, *(_QWORD *)(a1 + 32));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB7010], "minimumFromQuantities:unit:", v10, *(_QWORD *)(a1 + 32));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB7010], "maximumFromQuantities:unit:", v10, *(_QWORD *)(a1 + 32));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = 0;
  if (v17 && v18 && v19)
  {
    v21 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    objc_msgSend(*(id *)(a1 + 40), "_unshiftedDateIntervalIfNecessaryForStatisticsInterval:startDate:endDate:gregorianCalendar:", *(_QWORD *)(a1 + 48), v8, v9, *(_QWORD *)(a1 + 56));
    v30 = v9;
    v22 = v8;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setStartDate:](v21, "setStartDate:", v24);

    objc_msgSend(v23, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setEndDate:](v21, "setEndDate:", v25);

    -[HKQuantityTypeDataSourceValue setQuantityType:](v21, "setQuantityType:", *(_QWORD *)(a1 + 64));
    -[HKQuantityTypeDataSourceValue setSumQuantity:](v21, "setSumQuantity:", v17);
    -[HKQuantityTypeDataSourceValue setMinQuantity:](v21, "setMinQuantity:", v18);
    -[HKQuantityTypeDataSourceValue setMaxQuantity:](v21, "setMaxQuantity:", v20);
    -[HKQuantityTypeDataSourceValue setRecordCount:](v21, "setRecordCount:", objc_msgSend(v11, "count"));
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_oneDay");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setStatisticsInterval:](v21, "setStatisticsInterval:", v26);

    v8 = v22;
    v9 = v30;
  }
  objc_msgSend(v11, "lastObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "mostRecentQuantity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    -[HKQuantityTypeDataSourceValue setMostRecentQuantity:](v21, "setMostRecentQuantity:", v28);

  return v21;
}

- (id)_defaultQueriesForStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  HKQuantityTypeDataSource *v27;
  id v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesWithStartDate:endDate:options:", v10, v11, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_alloc(MEMORY[0x1E0CB6C80]);
  -[HKQuantityTypeDataSource quantityType](self, "quantityType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v16, v14, self->_statisticsOptions, v10, v12);

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __101__HKQuantityTypeDataSource__defaultQueriesForStartDate_endDate_statisticsInterval_completionHandler___block_invoke;
  v24[3] = &unk_1E9C43C08;
  v25 = v10;
  v26 = v11;
  v27 = self;
  v28 = v12;
  v29 = v13;
  v18 = v13;
  v19 = v12;
  v20 = v11;
  v21 = v10;
  objc_msgSend(v17, "setInitialResultsHandler:", v24);
  objc_msgSend(v17, "setDebugIdentifier:", CFSTR("charting (quantity)"));
  v30[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __101__HKQuantityTypeDataSource__defaultQueriesForStartDate_endDate_statisticsInterval_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;

  v18 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceReferenceDate");
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statistics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __101__HKQuantityTypeDataSource__defaultQueriesForStartDate_endDate_statisticsInterval_completionHandler___block_invoke_2;
  v19[3] = &unk_1E9C43BE0;
  v23 = v9;
  v24 = v11;
  v14 = *(void **)(a1 + 56);
  v19[4] = *(_QWORD *)(a1 + 48);
  v20 = v14;
  v15 = v12;
  v21 = v15;
  v16 = v7;
  v22 = v16;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v19);

  v17 = *(_QWORD *)(a1 + 64);
  if (v17)
    (*(void (**)(uint64_t, id, id))(v17 + 16))(v17, v16, v18);

}

void __101__HKQuantityTypeDataSource__defaultQueriesForStartDate_endDate_statisticsInterval_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  HKQuantityTypeDataSourceValue *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a2;
  objc_msgSend(v28, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;
  v6 = *(double *)(a1 + 64);

  objc_msgSend(v28, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;
  v10 = *(double *)(a1 + 72);

  if (v5 >= v6 && v9 <= v10)
  {
    v12 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v28, "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_unshiftedDateIntervalIfNecessaryForStatisticsInterval:startDate:endDate:gregorianCalendar:", v14, v15, v16, *(_QWORD *)(a1 + 48));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setStartDate:](v12, "setStartDate:", v18);

    objc_msgSend(v17, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setEndDate:](v12, "setEndDate:", v19);

    objc_msgSend(v28, "quantityType");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setQuantityType:](v12, "setQuantityType:", v20);

    objc_msgSend(v28, "averageQuantity");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setAverageQuantity:](v12, "setAverageQuantity:", v21);

    objc_msgSend(v28, "duration");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setDurationQuantity:](v12, "setDurationQuantity:", v22);

    objc_msgSend(v28, "sumQuantity");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setSumQuantity:](v12, "setSumQuantity:", v23);

    objc_msgSend(v28, "minimumQuantity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setMinQuantity:](v12, "setMinQuantity:", v24);

    objc_msgSend(v28, "maximumQuantity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setMaxQuantity:](v12, "setMaxQuantity:", v25);

    objc_msgSend(v28, "mostRecentQuantity");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setMostRecentQuantity:](v12, "setMostRecentQuantity:", v26);

    -[HKQuantityTypeDataSourceValue setRecordCount:](v12, "setRecordCount:", objc_msgSend(v28, "dataCount"));
    -[HKQuantityTypeDataSourceValue setStatisticsInterval:](v12, "setStatisticsInterval:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v28, "baselineRelativeValueState");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setBaselineRelativeValueState:](v12, "setBaselineRelativeValueState:", v27);

    objc_msgSend(*(id *)(a1 + 56), "addObject:", v12);
  }

}

- (BOOL)requiresPointRealignmentToMidnightForStatisticsInterval:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  BOOL v9;

  v4 = a3;
  if (-[HKHealthQueryChartCacheDataSource queryAlignment](self, "queryAlignment") == 1)
  {
    objc_msgSend(v4, "hk_approximateDuration");
    v6 = v5;
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_oneDay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_approximateDuration");
    v9 = v6 >= v8;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_unshiftedDateIntervalIfNecessaryForStatisticsInterval:(id)a3 startDate:(id)a4 endDate:(id)a5 gregorianCalendar:(id)a6
{
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;

  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0CB3588];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v11 alloc], "initWithStartDate:endDate:", v13, v12);

  LODWORD(v13) = -[HKQuantityTypeDataSource requiresPointRealignmentToMidnightForStatisticsInterval:](self, "requiresPointRealignmentToMidnightForStatisticsInterval:", v14);
  if ((_DWORD)v13)
  {
    objc_msgSend(v15, "hk_dateIntervalUnshiftedFromQueryAlignment:calendar:", 1, v10);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = v15;
  }
  v17 = v16;

  return v17;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 1;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD aBlock[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  HKQuantityTypeDataSource *v26;
  id v27;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v24[3] = &unk_1E9C414D0;
  v25 = v8;
  v26 = self;
  v27 = v10;
  v12 = v10;
  v13 = v8;
  -[HKQuantityTypeDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "executeQuery:", v15);

  aBlock[0] = v11;
  aBlock[1] = 3221225472;
  aBlock[2] = __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  aBlock[3] = &unk_1E9C3FC50;
  v22 = v9;
  v23 = v14;
  v16 = v14;
  v17 = v9;
  v18 = _Block_copy(aBlock);
  v19 = _Block_copy(v18);

  return v19;
}

void __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void (**v16)(void *, id);
  uint64_t v17;
  void *v18;
  int8x16_t v19;
  _QWORD aBlock[4];
  int8x16_t v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_INFO))
      {
        v9 = *(void **)(a1 + 32);
        v10 = v8;
        HKStringForChartDataSourceQueryRequestAudience(objc_msgSend(v9, "audience"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "quantityType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v11;
        v25 = 2112;
        v26 = v13;
        v27 = 2112;
        v28 = v14;
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", buf, 0x20u);

      }
    }
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_283;
    aBlock[3] = &unk_1E9C43C50;
    v19 = *(int8x16_t *)(a1 + 32);
    v15 = (id)v19.i64[0];
    v21 = vextq_s8(v19, v19, 8uLL);
    v22 = *(id *)(a1 + 48);
    v16 = (void (**)(void *, id))_Block_copy(aBlock);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 88);
    if (v17)
      (*(void (**)(uint64_t, id, void (**)(void *, id)))(v17 + 16))(v17, v5, v16);
    else
      v16[2](v16, v5);

  }
  else
  {
    _HKInitializeLogging();
    v18 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v18, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_283(uint64_t a1, void *a2)
{
  HKCodableChartQuantityDataSourceQueryData *v3;
  HKCodableStatisticsCollection *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  objc_msgSend(a2, "hk_map:", &__block_literal_global_59);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(HKCodableChartQuantityDataSourceQueryData);
  v4 = objc_alloc_init(HKCodableStatisticsCollection);
  -[HKCodableChartQuantityDataSourceQueryData setStatisticsCollection:](v3, "setStatisticsCollection:", v4);

  v5 = (void *)objc_msgSend(v13, "mutableCopy");
  -[HKCodableChartQuantityDataSourceQueryData statisticsCollection](v3, "statisticsCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStatistics:", v5);

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "statisticsInterval");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartQuantityDataSourceQueryData data](v3, "data");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 0, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

uint64_t __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableStatistics");
}

void __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stopQuery:", v2);

}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  HKCodableChartQuantityDataSourceQueryData *v8;
  void *v9;
  HKCodableChartQuantityDataSourceQueryData *v10;
  HKGraphSeriesDataBlock *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  if (objc_msgSend(v4, "hasTimeZoneName"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E80]);
    objc_msgSend(v4, "timeZoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithName:", v6);

  }
  else
  {
    v7 = 0;
  }
  v8 = [HKCodableChartQuantityDataSourceQueryData alloc];
  objc_msgSend(v4, "queryDataObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKCodableChartQuantityDataSourceQueryData initWithData:](v8, "initWithData:", v9);

  v11 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKCodableChartQuantityDataSourceQueryData statisticsCollection](v10, "statisticsCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "statistics");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__HKQuantityTypeDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke;
  v17[3] = &unk_1E9C40EF0;
  v18 = v7;
  v14 = v7;
  objc_msgSend(v13, "hk_map:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeriesDataBlock setChartPoints:](v11, "setChartPoints:", v15);

  return v11;
}

HKQuantityTypeDataSourceValue *__76__HKQuantityTypeDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[HKQuantityTypeDataSourceValue quantityTypeDataSourceValueWithCodableStatistics:sourceTimeZone:](HKQuantityTypeDataSourceValue, "quantityTypeDataSourceValueWithCodableStatistics:sourceTimeZone:", a2, *(_QWORD *)(a1 + 32));
}

- (unint64_t)statisticsOptions
{
  return self->_statisticsOptions;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)preprocessingHandler
{
  return self->_preprocessingHandler;
}

- (void)setPreprocessingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_preprocessingHandler, 0);
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong(&self->_mappingFunction, 0);
  objc_storeStrong((id *)&self->_mappingState, 0);
}

void __94__HKQuantityTypeDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  HKStringForChartDataSourceQueryRequestAudience(objc_msgSend(v5, "audience"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "quantityType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412802;
  v12 = v7;
  v13 = 2112;
  v14 = v9;
  v15 = 2112;
  v16 = v10;
  _os_log_error_impl(&dword_1D7813000, v6, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v11, 0x20u);

}

@end
