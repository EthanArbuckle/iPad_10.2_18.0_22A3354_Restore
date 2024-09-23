@implementation HKTimePeriodSeriesDataSource

- (id)_startOfDayTransform
{
  void *v2;
  void *v3;

  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_startOfDayTransform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)queryDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKTimePeriodSeriesDataSource sampleType](self, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKTimePeriodSeries(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v26;
  id v27;
  _QWORD v28[5];
  id v29;
  id v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKTimePeriodSeriesDataSource _startOfDayTransform](self, "_startOfDayTransform");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v9)[2](v9, v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v9)[2](v9, v10, v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v14;
    v7 = (void *)v12;
  }
  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForSamplesWithStartDate:endDate:options:", v7, v8, 0, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E60], 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  -[HKTimePeriodSeriesDataSource sampleType](self, "sampleType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIPredicateMatchingPredicates(v15, self->_queryPredicate);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __68__HKTimePeriodSeriesDataSource_queriesForRequest_completionHandler___block_invoke;
  v28[3] = &unk_1E9C3FC08;
  v28[4] = self;
  v29 = v6;
  v30 = v27;
  v21 = v27;
  v22 = v6;
  v23 = (void *)objc_msgSend(v17, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v18, v19, 0, v20, v28);

  objc_msgSend(v23, "setDebugIdentifier:", CFSTR("charting (time period)"));
  v31 = v23;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

void __68__HKTimePeriodSeriesDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11 = objc_msgSend(v9, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v12 = (void *)*MEMORY[0x1E0CB5378];
    v13 = *MEMORY[0x1E0CB5378];
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v12);
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(a1, v12);
    }
  }
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "endDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "statisticsInterval");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_codableDataWithSamples:blockStart:blockEnd:intervalComponents:", v8, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (id)_chartPointsWithStatisticsInterval:(id)a3 dateIntervalsToTotals:(id)a4 intervalCounts:(id)a5 sourceTimeZone:(id)a6
{
  id v10;
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  HKGraphSeriesDataBlock *v20;
  _QWORD v22[4];
  id v23;
  HKTimePeriodSeriesDataSource *v24;
  id v25;
  id v26;
  id v27;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E0C99DE8];
  v14 = a4;
  v15 = objc_alloc_init(v13);
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __119__HKTimePeriodSeriesDataSource__chartPointsWithStatisticsInterval_dateIntervalsToTotals_intervalCounts_sourceTimeZone___block_invoke;
  v22[3] = &unk_1E9C42B40;
  v23 = v12;
  v24 = self;
  v25 = v11;
  v26 = v10;
  v27 = v15;
  v16 = v15;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v22);

  objc_msgSend(v16, "sortUsingComparator:", &__block_literal_global_40);
  v20 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v20, "setChartPoints:", v16);

  return v20;
}

void __119__HKTimePeriodSeriesDataSource__chartPointsWithStatisticsInterval_dateIntervalsToTotals_intervalCounts_sourceTimeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  _HKTimePeriodChartPoint *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = objc_alloc_init(_HKTimePeriodChartPoint);
  objc_msgSend(v15, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_dateFromSourceTimeZone:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_dateFromSourceTimeZone:", *(_QWORD *)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIMidDate(v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKTimePeriodChartPoint setXValue:](v6, "setXValue:", v11);
  -[_HKTimePeriodChartPoint setYValue:](v6, "setYValue:", v5);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, uint64_t, _QWORD))(v12 + 16))(v12, v5, objc_msgSend(v13, "integerValue"), *(_QWORD *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKTimePeriodChartPoint setUserInfo:](v6, "setUserInfo:", v14);

  }
  objc_msgSend(*(id *)(a1 + 64), "addObject:", v6);

}

uint64_t __119__HKTimePeriodSeriesDataSource__chartPointsWithStatisticsInterval_dateIntervalsToTotals_intervalCounts_sourceTimeZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "xValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)_calculateTotalDurationFromSamples:(id)a3 startDate:(id)a4 endDate:(id)a5 interval:(id)a6 intervalOut:(id *)a7 intervalCountsOut:(id *)a8
{
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v13 = a6;
  v14 = (void *)MEMORY[0x1E0CB7010];
  v15 = a5;
  v16 = a4;
  objc_msgSend(v14, "coalesceTimePeriodsFromSamples:strictStartDate:strictEndDate:", a3, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x1E0CB7010];
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "sampleType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v18, "shouldUseDailyAverageWithDateComponents:sampleType:", v13, v20);

  if ((_DWORD)v18)
  {
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_oneDay");
    v21 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = v13;
  }
  v22 = v21;
  v23 = (void *)MEMORY[0x1E0CB7010];
  -[HKTimePeriodSeriesDataSource _startOfDayTransform](self, "_startOfDayTransform");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "calculateTotalDurationsWithTimePeriods:startDate:endDate:intervalComponents:startOfDayTransform:", v17, v16, v15, v22, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (a7)
    *a7 = objc_retainAutorelease(v22);
  objc_msgSend(MEMORY[0x1E0CB7010], "coalesceTotalDurations:startDate:intervalComponents:intervalRecordCountsOut:", v25, v16, v13, a8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)_codableDataWithSamples:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 intervalComponents:(id)a6
{
  void *v7;
  id v8;
  id v9;
  HKCodableChartTimePeriodSeriesDataSourceData *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  id v18;

  v17 = 0;
  v18 = 0;
  -[HKTimePeriodSeriesDataSource _calculateTotalDurationFromSamples:startDate:endDate:interval:intervalOut:intervalCountsOut:](self, "_calculateTotalDurationFromSamples:startDate:endDate:interval:intervalOut:intervalCountsOut:", a3, a4, a5, a6, &v18, &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  v9 = v17;
  v10 = objc_alloc_init(HKCodableChartTimePeriodSeriesDataSourceData);
  objc_msgSend(v8, "hkui_codableDateComponents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartTimePeriodSeriesDataSourceData setStatisticsInterval:](v10, "setStatisticsInterval:", v11);

  -[HKTimePeriodSeriesDataSource _codableTimePeriodDataWithDictionary:](self, "_codableTimePeriodDataWithDictionary:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  -[HKCodableChartTimePeriodSeriesDataSourceData setDateIntervalsToTotals:](v10, "setDateIntervalsToTotals:", v13);

  -[HKTimePeriodSeriesDataSource _codableTimePeriodDataWithDictionary:](self, "_codableTimePeriodDataWithDictionary:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v14, "mutableCopy");
  -[HKCodableChartTimePeriodSeriesDataSourceData setIntervalCounts:](v10, "setIntervalCounts:", v15);

  return v10;
}

- (id)_codableTimePeriodDataWithDictionary:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  HKTimePeriodSeriesDataSource *v11;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__HKTimePeriodSeriesDataSource__codableTimePeriodDataWithDictionary___block_invoke;
  v9[3] = &unk_1E9C42BA8;
  v10 = v4;
  v11 = self;
  v6 = v4;
  objc_msgSend(v5, "hk_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

HKCodableTimePeriodData *__69__HKTimePeriodSeriesDataSource__codableTimePeriodDataWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKCodableTimePeriodData *v4;
  HKCodableDateInterval *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  v3 = a2;
  v4 = objc_alloc_init(HKCodableTimePeriodData);
  v5 = objc_alloc_init(HKCodableDateInterval);
  -[HKCodableTimePeriodData setDateInterval:](v4, "setDateInterval:", v5);

  objc_msgSend(v3, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HKEncodeValueForDate();
  -[HKCodableTimePeriodData dateInterval](v4, "dateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setStartDate:", v7);

  objc_msgSend(v3, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = HKEncodeValueForDate();
  -[HKCodableTimePeriodData dateInterval](v4, "dateInterval");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setEndDate:", v10);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "displayType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "roundingMode");

  if (v14 == 1)
  {
    v15 = objc_msgSend(v12, "integerValue");
  }
  else
  {
    objc_msgSend(v12, "doubleValue");
    v15 = llround(v16);
  }
  -[HKCodableTimePeriodData setTotal:](v4, "setTotal:", v15);

  return v4;
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
  HKTimePeriodSeriesDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C42BD0;
  v27 = v8;
  v28 = self;
  v29 = v10;
  v12 = v10;
  v13 = v8;
  -[HKTimePeriodSeriesDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_205;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
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
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138412802;
        v22 = v11;
        v23 = 2112;
        v24 = v12;
        v25 = 2112;
        v26 = v13;
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v21, 0x20u);

      }
    }
    v14 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statisticsInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 7, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_205(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKCodableChartTimePeriodSeriesDataSourceData *v9;
  void *v10;
  HKCodableChartTimePeriodSeriesDataSourceData *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

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
  v9 = [HKCodableChartTimePeriodSeriesDataSourceData alloc];
  objc_msgSend(v5, "queryDataObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKCodableChartTimePeriodSeriesDataSourceData initWithData:](v9, "initWithData:", v10);

  v12 = (void *)MEMORY[0x1E0C99D78];
  -[HKCodableChartTimePeriodSeriesDataSourceData statisticsInterval](v11, "statisticsInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hkui_dateComponentsWithCodableDateComponents:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCodableChartTimePeriodSeriesDataSourceData dateIntervalsToTotals](v11, "dateIntervalsToTotals");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKCodableTimePeriodData timePeriodDataWithCodableData:](HKCodableTimePeriodData, "timePeriodDataWithCodableData:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCodableChartTimePeriodSeriesDataSourceData intervalCounts](v11, "intervalCounts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKCodableTimePeriodData timePeriodDataWithCodableData:](HKCodableTimePeriodData, "timePeriodDataWithCodableData:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKTimePeriodSeriesDataSource _chartPointsWithStatisticsInterval:dateIntervalsToTotals:intervalCounts:sourceTimeZone:](self, "_chartPointsWithStatisticsInterval:dateIntervalsToTotals:intervalCounts:sourceTimeZone:", v14, v16, v18, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (void)setSampleType:(id)a3
{
  objc_storeStrong((id *)&self->_sampleType, a3);
}

- (NSPredicate)queryPredicate
{
  return self->_queryPredicate;
}

- (void)setQueryPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_queryPredicate, a3);
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_queryPredicate, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

void __98__HKTimePeriodSeriesDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  HKStringForChartDataSourceQueryRequestAudience(objc_msgSend(v5, "audience"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 48), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v7;
  v12 = 2112;
  v13 = v8;
  v14 = 2112;
  v15 = v9;
  _os_log_error_impl(&dword_1D7813000, v6, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v10, 0x20u);

}

@end
