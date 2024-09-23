@implementation HKLevelCategoryDataSource

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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKLevelCategory(%@)"), v5);
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
  v20[2] = __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E9C410B8;
  v20[4] = self;
  v21 = v6;
  v16 = v6;
  v17 = (void *)objc_msgSend(v13, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", sampleType, v11, 0, v15, v20);

  objc_msgSend(v17, "setDebugIdentifier:", CFSTR("charting (level category)"));
  v22 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  HKCodableSampleDataSourceQueryData *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = objc_alloc_init(HKCodableSampleDataSourceQueryData);
    objc_msgSend(v6, "hk_map:", &__block_literal_global_80);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");
    -[HKCodableSampleDataSourceQueryData setSamples:](v8, "setSamples:", v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
      __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v11, (uint64_t)v7);
  }

}

id __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke_190(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_filter:", &__block_literal_global_193_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_setMetadata:", v4);

  objc_msgSend(v2, "codableSampleChartData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *MEMORY[0x1E0CB5588]);
}

- (id)_chartPointsWithSamples:(id)a3 sourceTimeZone:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  HKLevelCategoryChartPoint *v13;
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
  uint64_t (**v25)(_QWORD, _QWORD);
  void *v26;
  void *v27;
  unsigned int v28;
  uint64_t v29;
  void (**v30)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  void *v31;
  void *v32;
  void *v33;
  HKGraphSeriesDataBlock *v34;
  id obj;
  uint64_t v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v39 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v8)
  {
    v9 = v8;
    v38 = *(_QWORD *)v41;
    v37 = *MEMORY[0x1E0CB5588];
    v10 = 0x1E0CB3000uLL;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v41 != v38)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        v13 = objc_alloc_init(HKLevelCategoryChartPoint);
        v14 = objc_msgSend(v12, "hk_integerValue");
        objc_msgSend(v12, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "hk_dateFromSourceTimeZone:", v7);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLevelCategoryChartPoint setStartDate:](v13, "setStartDate:", v16);

        objc_msgSend(v12, "endDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "hk_dateFromSourceTimeZone:", v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLevelCategoryChartPoint setEndDate:](v13, "setEndDate:", v18);

        -[HKLevelCategoryDataSource valueOrder](self, "valueOrder");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        v20 = *(void **)(v10 + 2024);
        if (v19)
        {
          -[HKLevelCategoryDataSource valueOrder](self, "valueOrder");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(v10 + 2024), "numberWithInteger:", v14);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "indexOfObject:", v22));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKLevelCategoryChartPoint setYValue:](v13, "setYValue:", v23);

        }
        else
        {
          objc_msgSend(*(id *)(v10 + 2024), "numberWithInteger:", v14);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKLevelCategoryChartPoint setYValue:](v13, "setYValue:", v21);
        }

        -[HKLevelCategoryChartPoint setPointStyle:](v13, "setPointStyle:", 0);
        -[HKLevelCategoryDataSource pointStyleBlock](self, "pointStyleBlock");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          -[HKLevelCategoryDataSource pointStyleBlock](self, "pointStyleBlock");
          v25 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
          -[HKLevelCategoryChartPoint setPointStyle:](v13, "setPointStyle:", ((uint64_t (**)(_QWORD, void *))v25)[2](v25, v12));

        }
        objc_msgSend(v12, "metadata");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "valueForKey:", v37);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "BOOLValue");

        v29 = v28;
        -[HKLevelCategoryDataSource userInfoCreationBlock](self, "userInfoCreationBlock");
        v30 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "startDate");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "endDate");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, uint64_t, void *, void *, uint64_t))v30)[2](v30, v14, v31, v32, v29);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKLevelCategoryChartPoint setUserInfo:](v13, "setUserInfo:", v33);

        objc_msgSend(v39, "addObject:", v13);
        ++v11;
        v10 = 0x1E0CB3000;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v9);
  }

  v34 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v34, "setChartPoints:", v39);

  return v34;
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
  HKLevelCategoryDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C410E0;
  v27 = v8;
  v28 = self;
  v29 = v10;
  v12 = v10;
  v13 = v8;
  -[HKLevelCategoryDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_202;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
      __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v20, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_202(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
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
  objc_msgSend(v12, "hk_map:", &__block_literal_global_207_0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  -[HKLevelCategoryDataSource _chartPointsWithSamples:sourceTimeZone:](self, "_chartPointsWithSamples:sourceTimeZone:", v14, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __77__HKLevelCategoryDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
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

- (id)pointStyleBlock
{
  return self->_pointStyleBlock;
}

- (void)setPointStyleBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
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
  objc_storeStrong(&self->_pointStyleBlock, 0);
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_sampleType, 0);
}

void __65__HKLevelCategoryDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "sampleType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_1D7813000, v5, OS_LOG_TYPE_ERROR, "Query failed for %@: %@", (uint8_t *)&v7, 0x16u);

}

void __95__HKLevelCategoryDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
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
