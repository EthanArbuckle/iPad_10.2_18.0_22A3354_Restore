@implementation HKHorizontalSingleLineDataSource

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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKHorizontalSingleLine(%@)"), v5);
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

  objc_msgSend(v7, "predicateForSamplesWithStartDate:endDate:options:", v9, v10, 0);
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
  v20[2] = __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E9C410B8;
  v20[4] = self;
  v21 = v6;
  v16 = v6;
  v17 = (void *)objc_msgSend(v13, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", sampleType, v11, 0, v15, v20);

  objc_msgSend(v17, "setDebugIdentifier:", CFSTR("charting (horizontal single line)"));
  v22 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  HKCodableSampleDataSourceQueryData *v14;
  void *v15;
  void *v16;

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
  v14 = objc_alloc_init(HKCodableSampleDataSourceQueryData);
  objc_msgSend(v8, "hk_map:", &__block_literal_global_17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  -[HKCodableSampleDataSourceQueryData setSamples:](v14, "setSamples:", v16);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_190(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_filter:", &__block_literal_global_193);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setMetadata:", v4);

  objc_msgSend(v2, "codableSampleChartData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0CB5588]);
}

- (id)_chartPointsWithSamples:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 sourceTimeZone:(id)a6
{
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HKHorizontalSingleLineChartPoint *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  _BOOL8 v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  HKGraphSeriesDataBlock *v26;
  id obj;
  uint64_t v29;
  uint64_t v30;
  HKHorizontalSingleLineDataSource *v31;
  id v32;
  id v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v33 = a6;
  v31 = self;
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKHorizontalSingleLineDataSource userInfoCreationBlock](self, "userInfoCreationBlock");
  v9 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v8;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v34)
  {
    v10 = 0;
    v30 = *(_QWORD *)v36;
    v29 = *MEMORY[0x1E0CB5588];
    do
    {
      v11 = 0;
      v12 = v10;
      do
      {
        if (*(_QWORD *)v36 != v30)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v11);
        v14 = objc_alloc_init(HKHorizontalSingleLineChartPoint);
        objc_msgSend(v13, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hk_dateFromSourceTimeZone:", v33);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hk_dateFromSourceTimeZone:", v33);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v13, "hk_integerValue"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v16, "timeIntervalSinceDate:", v12);
          v21 = v20 < 172800.0;
        }
        else
        {
          v21 = 0;
        }
        v10 = v16;

        -[HKHorizontalSingleLineChartPoint setXValue:](v14, "setXValue:", v10);
        -[HKHorizontalSingleLineChartPoint setYValue:](v14, "setYValue:", v19);
        -[HKHorizontalSingleLineChartPoint setGroupToPrevious:](v14, "setGroupToPrevious:", v21);
        if (v9)
        {
          objc_msgSend(v13, "metadata");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "valueForKey:", v29);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "BOOLValue");

          ((void (**)(_QWORD, uint64_t, id, void *, _QWORD))v9)[2](v9, objc_msgSend(v19, "integerValue"), v10, v18, v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKHorizontalSingleLineChartPoint setUserInfo:](v14, "setUserInfo:", v25);

        }
        -[HKHorizontalSingleLineChartPoint setMarkStyle:](v14, "setMarkStyle:", 0);
        -[HKHorizontalSingleLineDataSource applyMarkStyleToPoint:sample:](v31, "applyMarkStyleToPoint:sample:", v14, v13);
        objc_msgSend(v32, "addObject:", v14);

        ++v11;
        v12 = v10;
      }
      while (v34 != v11);
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v34);

  }
  v26 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v26, "setChartPoints:", v32);

  return v26;
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
  HKHorizontalSingleLineDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C410E0;
  v27 = v8;
  v28 = self;
  v29 = v10;
  v12 = v10;
  v13 = v8;
  -[HKHorizontalSingleLineDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_202;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v14, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 8, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_202(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKCodableSampleDataSourceQueryData *v9;
  void *v10;
  HKCodableSampleDataSourceQueryData *v11;
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
  v9 = [HKCodableSampleDataSourceQueryData alloc];
  objc_msgSend(v5, "queryDataObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HKCodableSampleDataSourceQueryData initWithData:](v9, "initWithData:", v10);

  -[HKCodableSampleDataSourceQueryData samples](v11, "samples");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_map:", &__block_literal_global_207);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v15 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "startDate");
  objc_msgSend(v15, "dateWithTimeIntervalSinceReferenceDate:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "endDate");
  objc_msgSend(v17, "dateWithTimeIntervalSinceReferenceDate:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHorizontalSingleLineDataSource _chartPointsWithSamples:blockStart:blockEnd:sourceTimeZone:](self, "_chartPointsWithSamples:blockStart:blockEnd:sourceTimeZone:", v14, v16, v18, v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __84__HKHorizontalSingleLineDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6AD8], "createWithCodableChartData:", a2);
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

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

void __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v2, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_1D7813000, v3, OS_LOG_TYPE_DEBUG, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

void __72__HKHorizontalSingleLineDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend(v2, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1D7813000, v3, OS_LOG_TYPE_ERROR, "Encountered error querying for %{public}@: %{public}@", v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

void __102__HKHorizontalSingleLineDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
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
