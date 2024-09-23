@implementation HKInsulinDataSource

- (id)queryDescription
{
  return CFSTR("HKInsulin");
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
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
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  id v31;
  id v32;
  void *v33;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  _QWORD block[5];
  id v41;
  id v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD v46[4];
  NSObject *v47;
  _QWORD *v48;
  _QWORD *v49;
  _QWORD v50[4];
  NSObject *v51;
  _QWORD *v52;
  _QWORD *v53;
  _QWORD v54[5];
  id v55;
  _QWORD v56[5];
  id v57;
  _QWORD v58[5];
  id v59;
  _QWORD v60[2];
  _QWORD v61[4];

  v61[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v35 = a4;
  v7 = (void *)MEMORY[0x1E0CB7010];
  objc_msgSend(v6, "statisticsInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sampleType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v7, "shouldUseDailyAverageWithDateComponents:sampleType:", v8, v10);

  if ((v7 & 1) != 0)
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_oneDay");
  else
    objc_msgSend(v6, "statisticsInterval");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB6A78];
  objc_msgSend(v6, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForSamplesWithStartDate:endDate:options:", v12, v13, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A78], "predicateForObjectsWithMetadataKey:allowedValues:", *MEMORY[0x1E0CB5560], &unk_1E9CEA508);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v14;
  v61[1] = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CD0]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = __Block_byref_object_copy__19;
  v58[4] = __Block_byref_object_dispose__19;
  v59 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x3032000000;
  v56[3] = __Block_byref_object_copy__19;
  v56[4] = __Block_byref_object_dispose__19;
  v57 = 0;
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x3032000000;
  v54[3] = __Block_byref_object_copy__19;
  v54[4] = __Block_byref_object_dispose__19;
  v55 = 0;
  v16 = dispatch_group_create();
  dispatch_group_enter(v16);
  v17 = objc_alloc(MEMORY[0x1E0CB6C80]);
  objc_msgSend(v6, "startDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v15, v36, 16, v18, v38);

  v20 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke;
  v50[3] = &unk_1E9C44850;
  v52 = v58;
  v53 = v54;
  v21 = v16;
  v51 = v21;
  objc_msgSend(v19, "setInitialResultsHandler:", v50);
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "behavior");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setMergeStrategy:", objc_msgSend(v23, "statisticsMergeStrategy"));

  objc_msgSend(v19, "setDebugIdentifier:", CFSTR("charting (insulin basal)"));
  dispatch_group_enter(v21);
  v24 = objc_alloc(MEMORY[0x1E0CB6C80]);
  objc_msgSend(v6, "startDate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithQuantityType:quantitySamplePredicate:options:anchorDate:intervalComponents:", v15, v39, 16, v25, v38);

  v46[0] = v20;
  v46[1] = 3221225472;
  v46[2] = __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke_2;
  v46[3] = &unk_1E9C44850;
  v48 = v56;
  v49 = v54;
  v27 = v21;
  v47 = v27;
  objc_msgSend(v26, "setInitialResultsHandler:", v46);
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "behavior");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setMergeStrategy:", objc_msgSend(v29, "statisticsMergeStrategy"));

  objc_msgSend(v26, "setDebugIdentifier:", CFSTR("charting (insulin total)"));
  dispatch_get_global_queue(0, 0);
  v30 = objc_claimAutoreleasedReturnValue();
  block[0] = v20;
  block[1] = 3221225472;
  block[2] = __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke_3;
  block[3] = &unk_1E9C44878;
  v43 = v58;
  v44 = v56;
  block[4] = self;
  v31 = v6;
  v41 = v31;
  v32 = v35;
  v42 = v32;
  v45 = v54;
  dispatch_group_notify(v27, v30, block);
  v60[0] = v19;
  v60[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v54, 8);
  _Block_object_dispose(v56, 8);

  _Block_object_dispose(v58, 8);
  return v33;
}

void __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, int a2, id obj, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v7 = obj;
  v8 = a4;
  v13 = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v9 + 40);
  v10 = (id *)(v9 + 40);
  v11 = v12;
  if (v12)
    v8 = v11;
  objc_storeStrong(v10, v8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke_2(uint64_t a1, int a2, id obj, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id *v10;
  void *v11;
  void *v12;
  id v13;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v7 = obj;
  v8 = a4;
  v13 = v8;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v9 + 40);
  v10 = (id *)(v9 + 40);
  v11 = v12;
  if (v12)
    v8 = v11;
  objc_storeStrong(v10, v8);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __59__HKInsulinDataSource_queriesForRequest_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (v2 && (v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40)) != 0)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "startDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "statisticsInterval");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_insulinDataSourceQueryDataFromBasalStatisticsCollection:totalStatisticsCollection:queryStartDate:statisticsInterval:", v2, v3, v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (id)_insulinDataSourceQueryDataFromBasalStatisticsCollection:(id)a3 totalStatisticsCollection:(id)a4 queryStartDate:(id)a5 statisticsInterval:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HKCodableChartInsulinDataSourceQueryData *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v10 = a5;
  v11 = a6;
  v12 = (void *)MEMORY[0x1E0CB7010];
  v13 = a4;
  v14 = a3;
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sampleType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v12, "shouldUseDailyAverageWithDateComponents:sampleType:", v11, v16);

  v17 = objc_alloc_init(HKCodableChartInsulinDataSourceQueryData);
  objc_msgSend(v14, "statistics");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_DWORD)v12)
  {
    -[HKInsulinDataSource _dailyAverageInsulinValuesFromStatistics:queryStartDate:statisticsInterval:](self, "_dailyAverageInsulinValuesFromStatistics:queryStartDate:statisticsInterval:", v18, v10, v11);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableChartInsulinDataSourceQueryData setBasalInsulinValues:](v17, "setBasalInsulinValues:", v19);

    objc_msgSend(v13, "statistics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKInsulinDataSource _dailyAverageInsulinValuesFromStatistics:queryStartDate:statisticsInterval:](self, "_dailyAverageInsulinValuesFromStatistics:queryStartDate:statisticsInterval:", v20, v10, v11);
  }
  else
  {
    -[HKInsulinDataSource _insulinValuesFromStatistics:](self, "_insulinValuesFromStatistics:", v18);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableChartInsulinDataSourceQueryData setBasalInsulinValues:](v17, "setBasalInsulinValues:", v21);

    objc_msgSend(v13, "statistics");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKInsulinDataSource _insulinValuesFromStatistics:](self, "_insulinValuesFromStatistics:", v20);
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartInsulinDataSourceQueryData setTotalInsulinValues:](v17, "setTotalInsulinValues:", v22);

  return v17;
}

- (id)_insulinValuesFromStatistics:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HKCodableChartInsulinValue *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = objc_alloc_init(HKCodableChartInsulinValue);
        objc_msgSend(v10, "startDate", (_QWORD)v17);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceReferenceDate");
        -[HKCodableChartInsulinValue setStartDate:](v11, "setStartDate:");

        objc_msgSend(v10, "endDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceReferenceDate");
        -[HKCodableChartInsulinValue setEndDate:](v11, "setEndDate:");

        objc_msgSend(v10, "sumQuantity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "codableRepresentation");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKCodableChartInsulinValue setInsulinQuantity:](v11, "setInsulinQuantity:", v15);

        objc_msgSend(v4, "addObject:", v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_dailyAverageInsulinValuesFromStatistics:(id)a3 queryStartDate:(id)a4 statisticsInterval:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;

  v8 = (void *)MEMORY[0x1E0CB6CD0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "internationalUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryChartCacheDataSource calendarOverride](self, "calendarOverride");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  v17 = (void *)MEMORY[0x1E0CB7010];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __98__HKInsulinDataSource__dailyAverageInsulinValuesFromStatistics_queryStartDate_statisticsInterval___block_invoke;
  v22[3] = &unk_1E9C445D8;
  v23 = v12;
  v18 = v12;
  objc_msgSend(v17, "arrayByCoalescingObjects:startDate:intervalComponents:calendar:combiningBlock:", v11, v10, v9, v16, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

HKCodableChartInsulinValue *__98__HKInsulinDataSource__dailyAverageInsulinValuesFromStatistics_queryStartDate_statisticsInterval___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  HKCodableChartInsulinValue *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v10)
    goto LABEL_12;
  v11 = v10;
  v12 = *(_QWORD *)v24;
  v13 = 0.0;
  v14 = 0.0;
  do
  {
    for (i = 0; i != v11; ++i)
    {
      if (*(_QWORD *)v24 != v12)
        objc_enumerationMutation(v7);
      objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "sumQuantity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v16)
      {
        objc_msgSend(v16, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
        v14 = v14 + v18;
        v13 = v13 + 1.0;
      }

    }
    v11 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v11);
  if (v13 > 0.0)
  {
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", *(_QWORD *)(a1 + 32), v14 / v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc_init(HKCodableChartInsulinValue);
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    -[HKCodableChartInsulinValue setStartDate:](v20, "setStartDate:");
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    -[HKCodableChartInsulinValue setEndDate:](v20, "setEndDate:");
    objc_msgSend(v19, "codableRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableChartInsulinValue setInsulinQuantity:](v20, "setInsulinQuantity:", v21);

  }
  else
  {
LABEL_12:
    v20 = 0;
  }

  return v20;
}

- (id)_chartPointsWithBasalInsulinValues:(id)a3 withTotalInsulinValues:(id)a4 filterInterval:(id)a5 sourceTimeZone:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  HKInsulinChartPoint *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  void *v50;
  HKGraphSeriesDataBlock *v51;
  id v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  unint64_t v62;
  _QWORD v63[4];
  id v64;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v54 = a6;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "internationalUnit");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "count");
  v13 = objc_msgSend(v10, "count");
  v14 = v12 != 0;
  v15 = v13 != 0;
  if (v12 | v13)
  {
    v16 = 0;
    v17 = 0;
    v56 = v10;
    v57 = v9;
    v55 = v11;
    do
    {
      if (v14)
      {
        v18 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "startDate");
        objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v20 = 0;
      }
      v61 = v20;
      if (v15)
      {
        v21 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "startDate");
        objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
        v23 = objc_claimAutoreleasedReturnValue();

        v60 = (void *)v23;
        if (!v14 || objc_msgSend(v20, "compare:", v23) == 1)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v17);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0CB6A28];
          objc_msgSend(v24, "insulinQuantity");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "createWithCodableQuantity:", v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v27, "doubleValueForUnit:", v59);
          objc_msgSend(v28, "numberWithDouble:");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v17;
          v31 = 0;
          v62 = v30 + 1;
          goto LABEL_13;
        }
        v62 = v17;
      }
      else
      {
        v62 = v17;
        v60 = 0;
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v24, "insulinQuantity");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "createWithCodableQuantity:", v33);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v27, "doubleValueForUnit:", v59);
      objc_msgSend(v34, "numberWithDouble:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0;
      ++v16;
LABEL_13:

      v35 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v24, "startDate");
      objc_msgSend(v35, "dateWithTimeIntervalSinceReferenceDate:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v24, "endDate");
      objc_msgSend(v37, "dateWithTimeIntervalSinceReferenceDate:");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "containsDate:", v36)
        && objc_msgSend(v11, "containsDate:", v38))
      {
        objc_msgSend(v58, "lastObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (!v39
          || (objc_msgSend(v39, "startDate"),
              v41 = (void *)objc_claimAutoreleasedReturnValue(),
              v42 = objc_msgSend(v41, "compare:", v36),
              v41,
              v42 == -1))
        {
          v43 = [HKInsulinChartPoint alloc];
          objc_msgSend(v36, "hk_dateFromSourceTimeZone:", v54);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "hk_dateFromSourceTimeZone:", v54);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = -[HKInsulinChartPoint initWithStartDate:endDate:](v43, "initWithStartDate:endDate:", v44, v45);

          objc_msgSend(v58, "addObject:", v46);
          v40 = (void *)v46;
        }
        if (v31)
          objc_msgSend(v40, "setBasalSum:", v31);
        else
          objc_msgSend(v40, "setTotalSum:", v29);
        v10 = v56;
        v9 = v57;
        v11 = v55;

      }
      v47 = objc_msgSend(v9, "count");
      v48 = objc_msgSend(v10, "count");
      v17 = v62;
      v15 = v62 < v48;
      v14 = v16 < v47;
    }
    while (v16 < v47 || v62 < v48);
  }
  -[HKInsulinDataSource userInfoCreationBlock](self, "userInfoCreationBlock");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v49)
  {
    v63[0] = MEMORY[0x1E0C809B0];
    v63[1] = 3221225472;
    v63[2] = __111__HKInsulinDataSource__chartPointsWithBasalInsulinValues_withTotalInsulinValues_filterInterval_sourceTimeZone___block_invoke;
    v63[3] = &unk_1E9C448A0;
    v64 = v49;
    objc_msgSend(v58, "enumerateObjectsUsingBlock:", v63);

  }
  v51 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v51, "setChartPoints:", v58);

  return v51;
}

void __111__HKInsulinDataSource__chartPointsWithBasalInsulinValues_withTotalInsulinValues_filterInterval_sourceTimeZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "basalSum");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "totalSum");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInfo:", v5);

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
  HKInsulinDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C448C8;
  v28 = self;
  v29 = v10;
  v27 = v8;
  v12 = v10;
  v13 = v8;
  -[HKInsulinDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_301;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  int v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
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
        v12 = *MEMORY[0x1E0CB5CD0];
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
    objc_msgSend(v14, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 4, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_301(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKCodableChartInsulinDataSourceQueryData *v9;
  void *v10;
  HKCodableChartInsulinDataSourceQueryData *v11;
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
  v9 = [HKCodableChartInsulinDataSourceQueryData alloc];
  objc_msgSend(v5, "queryDataObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKCodableChartInsulinDataSourceQueryData initWithData:](v9, "initWithData:", v10);

  v12 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "startDate");
  objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "endDate");
  objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v15);
  -[HKCodableChartInsulinDataSourceQueryData basalInsulinValues](v11, "basalInsulinValues");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartInsulinDataSourceQueryData totalInsulinValues](v11, "totalInsulinValues");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInsulinDataSource _chartPointsWithBasalInsulinValues:withTotalInsulinValues:filterInterval:sourceTimeZone:](self, "_chartPointsWithBasalInsulinValues:withTotalInsulinValues:filterInterval:sourceTimeZone:", v17, v18, v16, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
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

void __89__HKInsulinDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
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
  v7 = *MEMORY[0x1E0CB5CD0];
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
