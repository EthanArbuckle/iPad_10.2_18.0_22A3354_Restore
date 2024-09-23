@implementation HKSleepChartDataSource

- (HKSleepChartDataSource)initWithHealthStore:(id)a3 representativeDisplayType:(id)a4 queryOptions:(unint64_t)a5 cacheIdentifier:(id)a6 queryIdentifier:(id)a7 calendar:(id)a8
{
  id v15;
  id v16;
  id v17;
  HKSleepChartDataSource *v18;
  HKSleepChartDataSource *v19;
  objc_super v21;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)HKSleepChartDataSource;
  v18 = -[HKHealthQueryChartCacheDataSource initWithDisplayType:healthStore:](&v21, sel_initWithDisplayType_healthStore_, a4, a3);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_calendar, a8);
    v19->_queryOptions = a5;
    objc_storeStrong((id *)&v19->_cacheIdentifier, a6);
    objc_storeStrong((id *)&v19->_queryIdentifier, a7);
  }

  return v19;
}

- (id)queryDescription
{
  return CFSTR("HKSleepDaySummaryQuery");
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  uint64_t v47;
  id v48;
  _QWORD v49[5];
  id v50;
  id v51;
  void *v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hk_isAfterDate:", v8);

  if (v10)
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB5368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = (void *)objc_opt_class();
      v14 = v13;
      -[HKSleepChartDataSource queryIdentifier](self, "queryIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v54 = v13;
      v55 = 2114;
      v56 = v15;
      v57 = 2114;
      v58 = (uint64_t)v16;
      _os_log_impl(&dword_1D7813000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@.%{public}@] start date in the future %{public}@", buf, 0x20u);

    }
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    objc_msgSend(v6, "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepChartDataSource calendar](self, "calendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "hk_morningIndexWithCalendar:", v19);

    objc_msgSend(v6, "endDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepChartDataSource calendar](self, "calendar");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "hk_morningIndexWithCalendar:", v22);

    v24 = v23 - v20;
    _HKInitializeLogging();
    v25 = (void *)*MEMORY[0x1E0CB5368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
    {
      v47 = v23 - v20;
      v26 = v23 - 1;
      v27 = v25;
      v28 = v20;
      v29 = (void *)objc_opt_class();
      v46 = v29;
      -[HKSleepChartDataSource queryIdentifier](self, "queryIdentifier");
      v48 = v7;
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endDate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544642;
      v54 = v29;
      v20 = v28;
      v55 = 2114;
      v56 = v30;
      v57 = 2048;
      v58 = v28;
      v59 = 2048;
      v60 = v26;
      v24 = v47;
      v61 = 2114;
      v62 = v31;
      v63 = 2114;
      v64 = v32;
      _os_log_impl(&dword_1D7813000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@.%{public}@] creating query for day indeces: %ld-%ld dates: %{public}@-%{public}@", buf, 0x3Eu);

      v7 = v48;
    }
    v33 = -[HKSleepChartDataSource queryOptions](self, "queryOptions");
    objc_msgSend(v6, "statisticsInterval");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "month");

    if (v35 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "statisticsInterval");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "weekOfYear");

      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
        v33 |= 8uLL;
    }
    else
    {
      v33 |= 0x10uLL;
    }
    v38 = objc_alloc(MEMORY[0x1E0CB6BF0]);
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke;
    v49[3] = &unk_1E9C41DB8;
    v49[4] = self;
    v50 = v8;
    v51 = v7;
    v39 = (void *)objc_msgSend(v38, "initWithMorningIndexRange:ascending:limit:options:resultsHandler:", v20, v24, 1, 0, v33, v49);
    v40 = objc_alloc(MEMORY[0x1E0CB6BE8]);
    -[HKSleepChartDataSource queryIdentifier](self, "queryIdentifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (void *)objc_msgSend(v40, "initWithIdentifier:mode:", v41, 1);
    objc_msgSend(v39, "setCacheSettings:", v42);

    -[HKSleepChartDataSource queryIdentifier](self, "queryIdentifier");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setDebugIdentifier:", v43);

    -[HKSleepChartDataSource calendar](self, "calendar");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setCalendarOverrides:", v44);

    v52 = v39;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v52, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v17;
}

void __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  const char *v23;
  double v24;
  double v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v32[5];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    _HKInitializeLogging();
    v10 = (void *)*MEMORY[0x1E0CB5368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_ERROR))
      __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v10, (uint64_t)v9);
  }
  v11 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "calendar");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "hk_morningIndexWithCalendar:", v12);

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke_186;
  v32[3] = &__block_descriptor_40_e27_B16__0__HKSleepDaySummary_8l;
  v32[4] = v13;
  objc_msgSend(v8, "hk_firstObjectPassingTest:", v32);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "sleepDuration");
    if (v16 <= 0.0)
    {
      objc_msgSend(v15, "inBedDuration");
      v25 = v24;
      _HKInitializeLogging();
      v26 = (void *)*MEMORY[0x1E0CB5368];
      v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT);
      if (v25 <= 0.0)
      {
        if (v27)
        {
          v18 = v26;
          v30 = (void *)objc_opt_class();
          v31 = *(void **)(a1 + 32);
          v21 = v30;
          objc_msgSend(v31, "queryIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v34 = v30;
          v35 = 2114;
          v36 = v22;
          v37 = 2048;
          v38 = v13;
          v23 = "[%{public}@.%{public}@]] chart has no data today %ld";
          goto LABEL_13;
        }
      }
      else if (v27)
      {
        v18 = v26;
        v28 = (void *)objc_opt_class();
        v29 = *(void **)(a1 + 32);
        v21 = v28;
        objc_msgSend(v29, "queryIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v28;
        v35 = 2114;
        v36 = v22;
        v37 = 2048;
        v38 = v13;
        v23 = "[%{public}@.%{public}@] chart has in bed today %ld";
        goto LABEL_13;
      }
    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x1E0CB5368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = (void *)objc_opt_class();
        v20 = *(void **)(a1 + 32);
        v21 = v19;
        objc_msgSend(v20, "queryIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v34 = v19;
        v35 = 2114;
        v36 = v22;
        v37 = 2048;
        v38 = v13;
        v23 = "[%{public}@.%{public}@]] chart has sleep data today %ld";
LABEL_13:
        _os_log_impl(&dword_1D7813000, v18, OS_LOG_TYPE_DEFAULT, v23, buf, 0x20u);

      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

BOOL __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke_186(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "morningIndex") == *(_QWORD *)(a1 + 32);
}

- (id)mappingFunctionForContext:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    switch(objc_msgSend(v4, "chartType"))
    {
      case 0:
      case 2:
        -[HKSleepChartDataSource _mappingFunctionForDurationChartWithContext:](self, "_mappingFunctionForDurationChartWithContext:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 1:
      case 3:
        -[HKSleepChartDataSource _mappingFunctionForConsistencyChartWithContext:](self, "_mappingFunctionForConsistencyChartWithContext:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 4:
        -[HKSleepChartDataSource _mappingFunctionForStagesChartWithContext:](self, "_mappingFunctionForStagesChartWithContext:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 5:
        -[HKSleepChartDataSource _mappingFunctionForStagesDurationChartWithContext:](self, "_mappingFunctionForStagesDurationChartWithContext:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      case 6:
        -[HKSleepChartDataSource _mappingFunctionForComparisonChartWithContext:](self, "_mappingFunctionForComparisonChartWithContext:", v4);
        v5 = objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_4;
    }
    v6 = (void *)v5;
  }
  else
  {
LABEL_4:
    v6 = 0;
  }

  return v6;
}

- (id)_mappingFunctionForDurationChartWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__HKSleepChartDataSource__mappingFunctionForDurationChartWithContext___block_invoke;
  aBlock[3] = &unk_1E9C41DE0;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__70__HKSleepChartDataSource__mappingFunctionForDurationChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  HKGraphSeriesDataBlock *v4;
  void *v5;

  if (a2)
  {
    _DaySummariesForMappingData(a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    +[HKSleepDurationChartPoint chartPointsForSummaries:context:](HKSleepDurationChartPoint, "chartPointsForSummaries:context:", v3, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeriesDataBlock setChartPoints:](v4, "setChartPoints:", v5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_mappingFunctionForComparisonChartWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __72__HKSleepChartDataSource__mappingFunctionForComparisonChartWithContext___block_invoke;
  aBlock[3] = &unk_1E9C41DE0;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__72__HKSleepChartDataSource__mappingFunctionForComparisonChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  HKGraphSeriesDataBlock *v4;
  uint64_t v5;
  __objc2_class **v6;
  void *v7;

  if (a2)
  {
    _DaySummariesForMappingData(a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    v5 = objc_msgSend(*(id *)(a1 + 32), "timeScope");
    v6 = &off_1E9C3D7D0;
    if (v5 != 6)
      v6 = off_1E9C3D810;
    -[__objc2_class chartPointsForSummaries:context:](*v6, "chartPointsForSummaries:context:", v3, *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeriesDataBlock setChartPoints:](v4, "setChartPoints:", v7);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_mappingFunctionForConsistencyChartWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__HKSleepChartDataSource__mappingFunctionForConsistencyChartWithContext___block_invoke;
  aBlock[3] = &unk_1E9C41DE0;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__73__HKSleepChartDataSource__mappingFunctionForConsistencyChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  HKGraphSeriesDataBlock *v4;
  void *v5;

  if (a2)
  {
    _DaySummariesForMappingData(a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    +[HKSleepPeriodChartPoint chartPointsForSummaries:context:](HKSleepPeriodChartPoint, "chartPointsForSummaries:context:", v3, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeriesDataBlock setChartPoints:](v4, "setChartPoints:", v5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_mappingFunctionForStagesChartWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__HKSleepChartDataSource__mappingFunctionForStagesChartWithContext___block_invoke;
  aBlock[3] = &unk_1E9C41DE0;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__68__HKSleepChartDataSource__mappingFunctionForStagesChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  HKGraphSeriesDataBlock *v4;
  uint64_t v5;
  __objc2_class **v6;
  void *v7;

  if (a2)
  {
    _DaySummariesForMappingData(a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    v5 = objc_msgSend(*(id *)(a1 + 32), "timeScope");
    v6 = off_1E9C3D848;
    if (v5 != 6)
      v6 = off_1E9C3D840;
    -[__objc2_class chartPointsForSummaries:context:](*v6, "chartPointsForSummaries:context:", v3, *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeriesDataBlock setChartPoints:](v4, "setChartPoints:", v7);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_mappingFunctionForStagesDurationChartWithContext:(id)a3
{
  id v3;
  id v4;
  void *v5;
  _QWORD aBlock[4];
  id v8;

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HKSleepChartDataSource__mappingFunctionForStagesDurationChartWithContext___block_invoke;
  aBlock[3] = &unk_1E9C41DE0;
  v8 = v3;
  v4 = v3;
  v5 = _Block_copy(aBlock);

  return v5;
}

HKGraphSeriesDataBlock *__76__HKSleepChartDataSource__mappingFunctionForStagesDurationChartWithContext___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  HKGraphSeriesDataBlock *v4;
  void *v5;

  if (a2)
  {
    _DaySummariesForMappingData(a2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_alloc_init(HKGraphSeriesDataBlock);
    +[HKSleepStageDurationChartPoint chartPointsForSummaries:context:](HKSleepStageDurationChartPoint, "chartPointsForSummaries:context:", v3, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeriesDataBlock setChartPoints:](v4, "setChartPoints:", v5);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 0;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  HKSleepChartDataSource *v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v31[3] = &unk_1E9C41E08;
  v12 = v8;
  v32 = v12;
  v13 = v10;
  v33 = self;
  v34 = v13;
  -[HKSleepChartDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v12, v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v28;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v28 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(v9, "executeQuery:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v16);
  }
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_202;
  v24[3] = &unk_1E9C3FC50;
  v25 = v14;
  v26 = v9;
  v19 = v9;
  v20 = v14;
  v21 = _Block_copy(v24);
  v22 = _Block_copy(v21);

  return v22;
}

void __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  int v22;
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
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
        v12 = *MEMORY[0x1E0CB4980];
        objc_msgSend(v7, "localizedDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138412802;
        v23 = v11;
        v24 = 2112;
        v25 = v12;
        v26 = 2112;
        v27 = v13;
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v22, 0x20u);

      }
    }
    +[HKCodableSleepSummaryCollection sleepSummaryCollectionFromDaySummaries:](HKCodableSleepSummaryCollection, "sleepSummaryCollectionFromDaySummaries:", v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statisticsInterval");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 9, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v21 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v21, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_202(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "stopQuery:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  HKCodableSleepSummaryCollection *v8;
  void *v9;
  HKCodableSleepSummaryCollection *v10;
  HKGraphSeriesDataBlock *v11;
  void *v12;

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
  v8 = [HKCodableSleepSummaryCollection alloc];
  objc_msgSend(v4, "queryDataObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKCodableSleepSummaryCollection initWithData:](v8, "initWithData:", v9);

  v11 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKCodableSleepSummaryCollection daySummariesWithSourceTimeZone:](v10, "daySummariesWithSourceTimeZone:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeriesDataBlock setChartPoints:](v11, "setChartPoints:", v12);

  return v11;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSString)queryIdentifier
{
  return self->_queryIdentifier;
}

- (unint64_t)queryOptions
{
  return self->_queryOptions;
}

- (NSString)cacheIdentifier
{
  return self->_cacheIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheIdentifier, 0);
  objc_storeStrong((id *)&self->_queryIdentifier, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

void __62__HKSleepChartDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;

  v5 = OUTLINED_FUNCTION_0_7(a1, a2);
  v6 = (void *)objc_opt_class();
  v7 = *(void **)(a1 + 32);
  v8 = v6;
  objc_msgSend(v7, "queryIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138543874;
  v12 = v6;
  v13 = 2114;
  v14 = v9;
  v15 = 2114;
  v16 = a3;
  OUTLINED_FUNCTION_1_4(&dword_1D7813000, v5, v10, "[%{public}@.%{public}@]: error fetching summaries %{public}@", (uint8_t *)&v11);

}

void __92__HKSleepChartDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v3;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;

  v5 = OUTLINED_FUNCTION_0_7(a1, a2);
  HKStringForChartDataSourceQueryRequestAudience(objc_msgSend(v3, "audience"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CB4980];
  objc_msgSend(a3, "localizedDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412802;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  v14 = 2112;
  v15 = v8;
  OUTLINED_FUNCTION_1_4(&dword_1D7813000, v5, v9, "[RemoteCharting]_%@_%@: no day summaries were returned from query with error: %@", (uint8_t *)&v10);

}

@end
