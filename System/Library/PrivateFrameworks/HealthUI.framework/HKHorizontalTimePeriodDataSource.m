@implementation HKHorizontalTimePeriodDataSource

- (id)queryDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localization");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKHorizontalTimePeriod(%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  HKSampleType *sampleType;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB6A78];
  v8 = a3;
  objc_msgSend(v8, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predicateForSamplesWithStartDate:endDate:options:", v9, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E60], 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  sampleType = self->_sampleType;
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __72__HKHorizontalTimePeriodDataSource_queriesForRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E9C410B8;
  v20[4] = self;
  v21 = v6;
  v16 = v6;
  v17 = (void *)objc_msgSend(v13, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", sampleType, v11, 0, v15, v20);

  objc_msgSend(v17, "setDebugIdentifier:", CFSTR("charting (horizontal time period)"));
  v22 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __72__HKHorizontalTimePeriodDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  void *v14;

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
  objc_msgSend(*(id *)(a1 + 32), "_codableQueryDataWithSamples:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_chartPointsWithDateIntervalsByValue:(id)a3 sourceTimeZone:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void (**v14)(_QWORD, _QWORD, _QWORD, _QWORD);
  NSArray *valueOrder;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  NSArray *v27;
  HKGraphSeriesDataBlock *v28;
  id v30;
  id v31;
  NSArray *obj;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  id v39;
  NSArray *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD aBlock[4];
  id v50;
  id v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKHorizontalTimePeriodDataSource userInfoCreationBlock](self, "userInfoCreationBlock");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HKHorizontalTimePeriodDataSource__chartPointsWithDateIntervalsByValue_sourceTimeZone___block_invoke;
  aBlock[3] = &unk_1E9C45968;
  v11 = v7;
  v50 = v11;
  v12 = v9;
  v51 = v12;
  v13 = _Block_copy(aBlock);
  v14 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))v13;
  valueOrder = self->_valueOrder;
  if (valueOrder)
  {
    v47 = 0u;
    v48 = 0u;
    v46 = 0u;
    v45 = 0u;
    obj = valueOrder;
    v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    if (v35)
    {
      v30 = v12;
      v31 = v11;
      v16 = 0;
      v33 = *(_QWORD *)v46;
      v34 = v6;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v46 != v33)
            objc_enumerationMutation(obj);
          v36 = v17;
          v18 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v17);
          objc_msgSend(v6, "objectForKeyedSubscript:", v18, v30, v31);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = 0u;
          v42 = 0u;
          v43 = 0u;
          v44 = 0u;
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v42;
            do
            {
              for (i = 0; i != v21; ++i)
              {
                if (*(_QWORD *)v42 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v16);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                ((void (**)(_QWORD, uint64_t, void *, uint64_t))v14)[2](v14, v24, v25, objc_msgSend(v18, "integerValue"));
                v26 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v8, "addObject:", v26);
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
            }
            while (v21);
          }
          ++v16;

          v17 = v36 + 1;
          v6 = v34;
        }
        while (v36 + 1 != v35);
        v35 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
      }
      while (v35);
      v12 = v30;
      v11 = v31;
    }
    v27 = obj;
  }
  else
  {
    v37[0] = v10;
    v37[1] = 3221225472;
    v37[2] = __88__HKHorizontalTimePeriodDataSource__chartPointsWithDateIntervalsByValue_sourceTimeZone___block_invoke_197;
    v37[3] = &unk_1E9C45990;
    v40 = v13;
    v38 = &unk_1E9CED208;
    v39 = v8;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v37);

    v27 = v40;
  }

  v28 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v28, "setChartPoints:", v8);

  return v28;
}

HKHorizontalTimePeriodChartPoint *__88__HKHorizontalTimePeriodDataSource__chartPointsWithDateIntervalsByValue_sourceTimeZone___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  HKHorizontalTimePeriodChartPoint *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v7 = a3;
  v8 = a2;
  v9 = objc_alloc_init(HKHorizontalTimePeriodChartPoint);
  objc_msgSend(v8, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_dateFromSourceTimeZone:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "hk_dateFromSourceTimeZone:", *(_QWORD *)(a1 + 32));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHorizontalTimePeriodChartPoint setXStart:](v9, "setXStart:", v11);
  -[HKHorizontalTimePeriodChartPoint setXEnd:](v9, "setXEnd:", v13);
  -[HKHorizontalTimePeriodChartPoint setYValue:](v9, "setYValue:", v7);

  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
  {
    (*(void (**)(uint64_t, uint64_t, void *, void *))(v14 + 16))(v14, a4, v11, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHorizontalTimePeriodChartPoint setUserInfo:](v9, "setUserInfo:", v15);

  }
  return v9;
}

void __88__HKHorizontalTimePeriodDataSource__chartPointsWithDateIntervalsByValue_sourceTimeZone___block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10), *(_QWORD *)(a1 + 32), objc_msgSend(v5, "integerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (id)_organizeSamplesByValueAndDateInterval:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v10, "hk_integerValue"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__HKHorizontalTimePeriodDataSource__organizeSamplesByValueAndDateInterval___block_invoke;
  v16[3] = &unk_1E9C459B8;
  v14 = v13;
  v17 = v14;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v16);

  return v14;
}

void __75__HKHorizontalTimePeriodDataSource__organizeSamplesByValueAndDateInterval___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0CB7010];
  v6 = a2;
  objc_msgSend(v5, "coalesceTimePeriodsFromSamples:strictStartDate:strictEndDate:", a3, 0, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (id)_dateIntervalsByValueWithCodableQueryData:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v18;
  id obj;
  uint64_t v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v3;
  objc_msgSend(v3, "dateIntervalsByValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v4)
  {
    v5 = v4;
    v20 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v27 != v20)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v7, "value"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        objc_msgSend(v7, "dateIntervals");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v23 != v13)
                objc_enumerationMutation(v10);
              objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), 0);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v15);

            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v12);
        }

        v16 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v16, v8);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  return v21;
}

- (id)_codableQueryDataWithSamples:(id)a3
{
  void *v3;
  HKCodableChartHorizontalTimePeriodDataSourceData *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  -[HKHorizontalTimePeriodDataSource _organizeSamplesByValueAndDateInterval:](self, "_organizeSamplesByValueAndDateInterval:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(HKCodableChartHorizontalTimePeriodDataSourceData);
  objc_msgSend(v3, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HKHorizontalTimePeriodDataSource__codableQueryDataWithSamples___block_invoke;
  v10[3] = &unk_1E9C45A20;
  v11 = v3;
  v6 = v3;
  objc_msgSend(v5, "hk_map:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[HKCodableChartHorizontalTimePeriodDataSourceData setDateIntervalsByValues:](v4, "setDateIntervalsByValues:", v8);

  return v4;
}

HKCodableHorizontalTimePeriodData *__65__HKHorizontalTimePeriodDataSource__codableQueryDataWithSamples___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKCodableHorizontalTimePeriodData *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = objc_alloc_init(HKCodableHorizontalTimePeriodData);
  -[HKCodableHorizontalTimePeriodData setValue:](v4, "setValue:", objc_msgSend(v3, "integerValue"));
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "hk_map:", &__block_literal_global_77);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  -[HKCodableHorizontalTimePeriodData setDateIntervals:](v4, "setDateIntervals:", v7);

  return v4;
}

HKCodableDateInterval *__65__HKHorizontalTimePeriodDataSource__codableQueryDataWithSamples___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  HKCodableDateInterval *v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_alloc_init(HKCodableDateInterval);
  objc_msgSend(v2, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKEncodeValueForDate(v4);
  -[HKCodableDateInterval setStartDate:](v3, "setStartDate:");

  objc_msgSend(v2, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HKEncodeValueForDate(v5);
  -[HKCodableDateInterval setEndDate:](v3, "setEndDate:");

  return v3;
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
  HKHorizontalTimePeriodDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C45A48;
  v27 = v8;
  v28 = self;
  v29 = v10;
  v12 = v10;
  v13 = v8;
  -[HKHorizontalTimePeriodDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_209;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v14, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 6, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_209(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKCodableChartHorizontalTimePeriodDataSourceData *v9;
  void *v10;
  HKCodableChartHorizontalTimePeriodDataSourceData *v11;
  void *v12;
  void *v13;

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
  v9 = [HKCodableChartHorizontalTimePeriodDataSourceData alloc];
  objc_msgSend(v5, "queryDataObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKCodableChartHorizontalTimePeriodDataSourceData initWithData:](v9, "initWithData:", v10);

  -[HKHorizontalTimePeriodDataSource _dateIntervalsByValueWithCodableQueryData:](self, "_dateIntervalsByValueWithCodableQueryData:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHorizontalTimePeriodDataSource _chartPointsWithDateIntervalsByValue:sourceTimeZone:](self, "_chartPointsWithDateIntervalsByValue:sourceTimeZone:", v12, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HKSampleType)sampleType
{
  return self->_sampleType;
}

- (void)setSampleType:(id)a3
{
  objc_storeStrong((id *)&self->_sampleType, a3);
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void)setUserInfoCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)valueOrder
{
  return self->_valueOrder;
}

- (void)setValueOrder:(id)a3
{
  objc_storeStrong((id *)&self->_valueOrder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueOrder, 0);
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

void __102__HKHorizontalTimePeriodDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
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
