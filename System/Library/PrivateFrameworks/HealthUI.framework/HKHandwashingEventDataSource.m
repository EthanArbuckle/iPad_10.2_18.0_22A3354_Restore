@implementation HKHandwashingEventDataSource

- (HKHandwashingEventDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  HKHandwashingEventDataSource *v4;
  HKHandwashingEventDataSource *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKHandwashingEventDataSource;
  v4 = -[HKHealthQueryChartCacheDataSource initWithDisplayType:healthStore:](&v7, sel_initWithDisplayType_healthStore_, a3, a4);
  v5 = v4;
  if (v4)
    -[HKHandwashingEventDataSource setUserInfoCreationBlock:](v4, "setUserInfoCreationBlock:", &__block_literal_global_65);
  return v5;
}

HKInteractiveChartHandwashingEventData *__64__HKHandwashingEventDataSource_initWithDisplayType_healthStore___block_invoke(double a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  id v8;
  HKInteractiveChartHandwashingEventData *v9;

  v8 = a4;
  v9 = -[HKInteractiveChartHandwashingEventData initWithTimePeriod:meetsGoal:]([HKInteractiveChartHandwashingEventData alloc], "initWithTimePeriod:meetsGoal:", a3, a1);
  -[HKInteractiveChartTimePeriodData setStatisticsInterval:](v9, "setStatisticsInterval:", v8);

  -[HKInteractiveChartTimePeriodData setRecordCount:](v9, "setRecordCount:", a5);
  return v9;
}

+ (double)durationForCompleteSample
{
  return 20.0;
}

- (double)durationForObject:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;

  v3 = a3;
  objc_msgSend(v3, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;
  objc_msgSend(v3, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v6 - v8;

  return v9;
}

- (BOOL)doesDurationMeetGoal:(double)a3
{
  double v4;

  objc_msgSend((id)objc_opt_class(), "durationForCompleteSample");
  return v4 <= a3;
}

- (id)queryDescription
{
  return CFSTR("HKHandwashingEvent");
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *, void *);
  void *v21;
  id v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB6A78];
  v7 = a3;
  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "predicateForSamplesWithStartDate:endDate:options:", v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB48C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke;
  v21 = &unk_1E9C410B8;
  v22 = v11;
  v23 = v5;
  v13 = v5;
  v14 = v11;
  v15 = (void *)objc_msgSend(v12, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v14, v10, 0, 0, &v18);
  objc_msgSend(v15, "setDebugIdentifier:", CFSTR("charting (handwashing)"), v18, v19, v20, v21);
  v24[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5378];
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_1();
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_2();
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)chartPointsForSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 statisticsInterval:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  -[HKHandwashingEventDataSource chartModelsForSamples:startDate:endDate:statisticsInterval:](self, "chartModelsForSamples:startDate:endDate:statisticsInterval:", a3, v12, v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "data");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryChartCacheDataSource codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:](self, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 5, v12, v11, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHandwashingEventDataSource chartPointsFromQueryData:dataIsFromRemoteSource:](self, "chartPointsFromQueryData:dataIsFromRemoteSource:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "chartPoints");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)chartModelsForSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 statisticsInterval:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKCodableChartHandwashingEventDataSourceData *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;

  v9 = a6;
  v10 = a4;
  v11 = a3;
  if (objc_msgSend(v9, "day") == 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v9, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v22 = MEMORY[0x1E0C809B0];
    v12 = __91__HKHandwashingEventDataSource_chartModelsForSamples_startDate_endDate_statisticsInterval___block_invoke;
    v13 = &v22;
  }
  else
  {
    v21 = MEMORY[0x1E0C809B0];
    v12 = __91__HKHandwashingEventDataSource_chartModelsForSamples_startDate_endDate_statisticsInterval___block_invoke_2;
    v13 = &v21;
  }
  v13[1] = 3221225472;
  v13[2] = (uint64_t)v12;
  v13[3] = (uint64_t)&unk_1E9C445B0;
  v13[4] = (uint64_t)self;
  v14 = _Block_copy(v13);
  v15 = (void *)MEMORY[0x1E0CB7010];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "arrayByCoalescingObjects:startDate:intervalComponents:calendar:combiningBlock:", v11, v10, v9, v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc_init(HKCodableChartHandwashingEventDataSourceData);
  v19 = (void *)objc_msgSend(v17, "mutableCopy");
  -[HKCodableChartHandwashingEventDataSourceData setEvents:](v18, "setEvents:", v19);

  return v18;
}

uint64_t __91__HKHandwashingEventDataSource_chartModelsForSamples_startDate_endDate_statisticsInterval___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_dailyAverageChartModelForObjects:startDate:endDate:", a2, a3, a4);
}

uint64_t __91__HKHandwashingEventDataSource_chartModelsForSamples_startDate_endDate_statisticsInterval___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_averageDurationChartModelForObjects:startDate:endDate:", a2, a3, a4);
}

- (id)_averageDurationChartModelForObjects:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  HKCodableHandwashingEvent *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    v11 = objc_alloc_init(HKCodableHandwashingEvent);
    HKEncodeValueForDate(v9);
    -[HKCodableHandwashingEvent setStartDate:](v11, "setStartDate:");
    HKEncodeValueForDate(v10);
    -[HKCodableHandwashingEvent setEndDate:](v11, "setEndDate:");
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      v16 = 0.0;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          -[HKHandwashingEventDataSource durationForObject:](self, "durationForObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i), (_QWORD)v25);
          v16 = v16 + v18;
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v14);
    }
    else
    {
      v16 = 0.0;
    }

    v19 = v16 / (double)(unint64_t)objc_msgSend(v12, "count");
    v20 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "quantityWithUnit:doubleValue:", v21, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "codableRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableHandwashingEvent setAverageDuration:](v11, "setAverageDuration:", v23);

    -[HKCodableHandwashingEvent setMeetsGoal:](v11, "setMeetsGoal:", -[HKHandwashingEventDataSource doesDurationMeetGoal:](self, "doesDurationMeetGoal:", v19));
    -[HKCodableHandwashingEvent setCount:](v11, "setCount:", objc_msgSend(v12, "count"));
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_dailyAverageChartModelForObjects:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKCodableHandwashingEvent *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  uint64_t i;
  void *v23;
  void *v24;
  double v25;
  float v26;
  float v27;
  float v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  void *v33;
  HKHandwashingEventDataSource *v35;
  void *v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[5];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_dateComponentsForCalendarUnit:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0CB7010];
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __84__HKHandwashingEventDataSource__dailyAverageChartModelForObjects_startDate_endDate___block_invoke;
    v43[3] = &unk_1E9C445D8;
    v43[4] = self;
    objc_msgSend(v12, "arrayByCoalescingObjects:startDate:intervalComponents:calendar:combiningBlock:", v8, v9, v11, v13, v43);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      v15 = objc_alloc_init(HKCodableHandwashingEvent);
      HKEncodeValueForDate(v9);
      -[HKCodableHandwashingEvent setStartDate:](v15, "setStartDate:");
      HKEncodeValueForDate(v10);
      -[HKCodableHandwashingEvent setEndDate:](v15, "setEndDate:");
      v41 = 0u;
      v42 = 0u;
      v39 = 0u;
      v40 = 0u;
      v38 = v14;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v17)
      {
        v18 = v17;
        v35 = self;
        v36 = v11;
        v37 = v10;
        v19 = 0;
        v20 = *(_QWORD *)v40;
        v21 = 0.0;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v40 != v20)
              objc_enumerationMutation(v16);
            v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
            objc_msgSend(v23, "averageDuration", v35, v36, v37);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "value");
            v21 = v21 + v25;

            v19 += objc_msgSend(v23, "count");
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        }
        while (v18);
        v26 = v21;
        v27 = (float)v19;
        v11 = v36;
        v10 = v37;
        self = v35;
      }
      else
      {
        v26 = 0.0;
        v27 = 0.0;
      }

      v28 = v26 / (float)(unint64_t)objc_msgSend(v16, "count");
      v29 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v28;
      objc_msgSend(v29, "quantityWithUnit:doubleValue:", v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "codableRepresentation");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableHandwashingEvent setAverageDuration:](v15, "setAverageDuration:", v33);

      -[HKCodableHandwashingEvent setMeetsGoal:](v15, "setMeetsGoal:", -[HKHandwashingEventDataSource doesDurationMeetGoal:](self, "doesDurationMeetGoal:", v31));
      -[HKCodableHandwashingEvent setCount:](v15, "setCount:", objc_msgSend(v8, "count"));
      -[HKCodableHandwashingEvent setAverageDailyCount:](v15, "setAverageDailyCount:", (uint64_t)(float)(v27 / (float)(unint64_t)objc_msgSend(v16, "count")));
      v14 = v38;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __84__HKHandwashingEventDataSource__dailyAverageChartModelForObjects_startDate_endDate___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_averageDurationChartModelForObjects:startDate:endDate:", a2, a3, a4);
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
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  HKHandwashingEventDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C41E08;
  v28 = self;
  v29 = v10;
  v27 = v8;
  v12 = v10;
  v13 = v8;
  -[HKHandwashingEventDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_304;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
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
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
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
        v12 = *MEMORY[0x1E0CB48C8];
        objc_msgSend(v7, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412802;
        v27 = v11;
        v28 = 2112;
        v29 = v12;
        v30 = 2112;
        v31 = v13;
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v26, 0x20u);

      }
    }
    v14 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statisticsInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chartModelsForSamples:startDate:endDate:statisticsInterval:", v5, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statisticsInterval");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "data");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 5, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v25, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_304(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKGraphSeriesDataBlock *v9;
  HKCodableChartHandwashingEventDataSourceData *v10;
  void *v11;
  HKCodableChartHandwashingEventDataSourceData *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  HKHandwashingEventChartPoint *(*v21)(uint64_t, void *);
  void *v22;
  id v23;
  HKHandwashingEventDataSource *v24;

  v5 = a3;
  if (objc_msgSend(v5, "hasTimeZoneName"))
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E80]);
    objc_msgSend(v5, "timeZoneName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithName:", v7);

  }
  else
  {
    v8 = 0;
  }
  v9 = objc_alloc_init(HKGraphSeriesDataBlock);
  v10 = [HKCodableChartHandwashingEventDataSourceData alloc];
  objc_msgSend(v5, "queryDataObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKCodableChartHandwashingEventDataSourceData initWithData:](v10, "initWithData:", v11);

  -[HKCodableChartHandwashingEventDataSourceData events](v12, "events");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __80__HKHandwashingEventDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke;
  v22 = &unk_1E9C44600;
  v14 = v8;
  v23 = v14;
  v24 = self;
  objc_msgSend(v13, "hk_map:", &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeriesDataBlock setChartPoints:](v9, "setChartPoints:", v15, v19, v20, v21, v22);

  -[HKGraphSeriesDataBlock chartPoints](v9, "chartPoints");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeriesDataBlock setChartPoints:](v9, "setChartPoints:", v17);

  }
  return v9;
}

HKHandwashingEventChartPoint *__80__HKHandwashingEventDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HKHandwashingEventChartPoint *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD, double);
  void *v18;
  double v19;
  void *v20;

  v3 = a2;
  objc_msgSend(v3, "startDate");
  HKDecodeDateForValue();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_dateFromSourceTimeZone:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "endDate");
  HKDecodeDateForValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_dateFromSourceTimeZone:", *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HKHandwashingEventChartPoint initWithStartDate:endDate:]([HKHandwashingEventChartPoint alloc], "initWithStartDate:endDate:", v5, v7);
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "averageDuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "value");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHandwashingEventChartPoint setAverageDuration:](v8, "setAverageDuration:", v11);

  -[HKHandwashingEventChartPoint setMeetsGoal:](v8, "setMeetsGoal:", objc_msgSend(v3, "meetsGoal"));
  if (objc_msgSend(v3, "hasAverageDailyCount"))
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_dateComponentsForCalendarUnit:", 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = objc_msgSend(v3, "hasAverageDailyCount");
  v14 = (void *)MEMORY[0x1E0CB37E8];
  if ((v13 & 1) != 0)
    v15 = objc_msgSend(v3, "averageDailyCount");
  else
    v15 = objc_msgSend(v3, "count");
  objc_msgSend(v14, "numberWithLongLong:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "userInfoCreationBlock");
  v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, double))objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "averageDuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "value");
  ((void (**)(_QWORD, uint64_t, void *, _QWORD, double))v17)[2](v17, objc_msgSend(v3, "meetsGoal"), v12, (int)objc_msgSend(v16, "intValue"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHandwashingEventChartPoint setUserInfo:](v8, "setUserInfo:", v20);

  return v8;
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
}

void __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_7();
  _os_log_debug_impl(&dword_1D7813000, v0, OS_LOG_TYPE_DEBUG, "Encountered error querying for %{public}@: %{public}@", v1, 0x16u);
}

void __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_7();
  _os_log_error_impl(&dword_1D7813000, v0, OS_LOG_TYPE_ERROR, "Encountered error querying for %{public}@: %{public}@", v1, 0x16u);
}

void __98__HKHandwashingEventDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  HKStringForChartDataSourceQueryRequestAudience(objc_msgSend(v4, "audience"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB48C8];
  objc_msgSend(a3, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_1D7813000, v5, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v9, 0x20u);

}

@end
