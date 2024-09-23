@implementation HKSampleTypeCountDataSource

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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKSampleTypeCount(%@)"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, void *);
  void *v22;
  id v23;
  id v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sampleType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB7010];
  objc_msgSend(v7, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statisticsInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __67__HKSampleTypeCountDataSource_queriesForRequest_completionHandler___block_invoke;
  v22 = &unk_1E9C41CC0;
  v23 = v9;
  v24 = v6;
  v14 = v6;
  v15 = v9;
  objc_msgSend(v10, "countStatisticsQueryWithSampleType:startDate:endDate:intervalComponents:predicate:completion:", v15, v11, v12, v13, 0, &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setDebugIdentifier:", CFSTR("charting (sample count)"), v19, v20, v21, v22);
  v25[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

void __67__HKSampleTypeCountDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  HKCodableChartSampleTypeCountDataQueryData *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "hk_isDatabaseAccessibilityError");
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5378];
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_1();
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __68__HKHandwashingEventDataSource_queriesForRequest_completionHandler___block_invoke_cold_2();
    }
  }
  v10 = objc_alloc_init(HKCodableChartSampleTypeCountDataQueryData);
  objc_msgSend(v5, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HKSampleTypeCountDataSource_queriesForRequest_completionHandler___block_invoke_187;
  v15[3] = &unk_1E9C45DA8;
  v16 = v5;
  v12 = v5;
  objc_msgSend(v11, "hk_map:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");
  -[HKCodableChartSampleTypeCountDataQueryData setTimePeriodToCounts:](v10, "setTimePeriodToCounts:", v14);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

HKCodableSampleTypeCountData *__67__HKSampleTypeCountDataSource_queriesForRequest_completionHandler___block_invoke_187(uint64_t a1, void *a2)
{
  id v3;
  HKCodableSampleTypeCountData *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  v4 = objc_alloc_init(HKCodableSampleTypeCountData);
  objc_msgSend(v3, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[HKCodableSampleTypeCountData setStartDate:](v4, "setStartDate:");

  objc_msgSend(v3, "endDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  -[HKCodableSampleTypeCountData setEndDate:](v4, "setEndDate:");

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKCodableSampleTypeCountData setCount:](v4, "setCount:", objc_msgSend(v7, "integerValue"));
  return v4;
}

- (id)_chartPointsWithCounts:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 sourceTimeZone:(id)a6
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  HKGraphSeriesDataBlock *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v8 = a6;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = a3;
  v11 = objc_alloc_init(v9);
  -[HKSampleTypeCountDataSource userInfoCreationBlock](self, "userInfoCreationBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __89__HKSampleTypeCountDataSource__chartPointsWithCounts_blockStart_blockEnd_sourceTimeZone___block_invoke;
  v18[3] = &unk_1E9C45DD0;
  v20 = v11;
  v21 = v12;
  v19 = v8;
  v13 = v11;
  v14 = v8;
  v15 = v12;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v18);

  objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_79);
  v16 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v16, "setChartPoints:", v13);

  return v16;
}

void __89__HKSampleTypeCountDataSource__chartPointsWithCounts_blockStart_blockEnd_sourceTimeZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HKNumericChartPoint *v12;
  void *v13;
  HKNumericChartPoint *v14;
  id v15;

  v15 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v15, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_dateFromSourceTimeZone:", *(_QWORD *)(a1 + 32));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "hk_dateFromSourceTimeZone:", *(_QWORD *)(a1 + 32));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [HKNumericChartPoint alloc];
  HKUIMidDate(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[HKNumericChartPoint initWithXValue:yValue:userInfo:](v12, "initWithXValue:yValue:userInfo:", v13, v5, v7);

  objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);
}

uint64_t __89__HKSampleTypeCountDataSource__chartPointsWithCounts_blockStart_blockEnd_sourceTimeZone___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "xValueAsGenericType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "xValueAsGenericType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
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
  HKSampleTypeCountDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C45E38;
  v27 = v8;
  v28 = self;
  v29 = v10;
  v12 = v10;
  v13 = v8;
  -[HKSampleTypeCountDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_200;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  void *v21;
  void *v22;
  int v23;
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
        objc_msgSend(*(id *)(a1 + 40), "displayType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138412802;
        v24 = v11;
        v25 = 2112;
        v26 = v14;
        v27 = 2112;
        v28 = v15;
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v23, 0x20u);

      }
    }
    v16 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statisticsInterval");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 2, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v22 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v22, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_200(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v4;
  id v5;
  void *v6;
  HKCodableChartSampleTypeCountDataQueryData *v7;
  void *v8;
  HKCodableChartSampleTypeCountDataQueryData *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
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
  void *v28;
  HKCodableChartSampleTypeCountDataQueryData *v30;
  void *v31;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "hasTimeZoneName"))
  {
    v5 = objc_alloc(MEMORY[0x1E0C99E80]);
    objc_msgSend(v4, "timeZoneName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)objc_msgSend(v5, "initWithName:", v6);

  }
  else
  {
    v31 = 0;
  }
  v7 = [HKCodableChartSampleTypeCountDataQueryData alloc];
  v33 = v4;
  objc_msgSend(v4, "queryDataObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HKCodableChartSampleTypeCountDataQueryData initWithData:](v7, "initWithData:", v8);

  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v30 = v9;
  -[HKCodableChartSampleTypeCountDataQueryData timePeriodToCounts](v9, "timePeriodToCounts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v14);
        v16 = objc_alloc(MEMORY[0x1E0CB3588]);
        v17 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v15, "startDate");
        objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v15, "endDate");
        objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v18, v20);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v15, "count"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v22, v21);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v12);
  }

  v23 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v33, "startDate");
  objc_msgSend(v23, "dateWithTimeIntervalSinceReferenceDate:");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v33, "endDate");
  objc_msgSend(v25, "dateWithTimeIntervalSinceReferenceDate:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v10, "copy");
  -[HKSampleTypeCountDataSource _chartPointsWithCounts:blockStart:blockEnd:sourceTimeZone:](self, "_chartPointsWithCounts:blockStart:blockEnd:sourceTimeZone:", v27, v24, v26, v31);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
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

void __97__HKSampleTypeCountDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  HKStringForChartDataSourceQueryRequestAudience(objc_msgSend(v5, "audience"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "displayType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138412802;
  v13 = v7;
  v14 = 2112;
  v15 = v10;
  v16 = 2112;
  v17 = v11;
  _os_log_error_impl(&dword_1D7813000, v6, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v12, 0x20u);

}

@end
