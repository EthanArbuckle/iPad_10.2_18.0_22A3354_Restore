@implementation HKEnumeratedValueDataSource

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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKEnumeratedValue(%@)"), v5);
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
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v23[4];
  id v24;
  HKEnumeratedValueDataSource *v25;
  id v26;
  id v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB6A78];
  objc_msgSend(v6, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateForSamplesWithStartDate:endDate:options:", v9, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E60], 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sampleType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  v29[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __67__HKEnumeratedValueDataSource_queriesForRequest_completionHandler___block_invoke;
  v23[3] = &unk_1E9C45918;
  v24 = v14;
  v25 = self;
  v26 = v6;
  v27 = v7;
  v17 = v7;
  v18 = v6;
  v19 = v14;
  v20 = (void *)objc_msgSend(v15, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v19, v11, 0, v16, v23);

  objc_msgSend(v20, "setDebugIdentifier:", CFSTR("charting (enumerated value)"));
  v28 = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

void __67__HKEnumeratedValueDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
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
  v13 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "startDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "statisticsInterval");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_handleSamples:blockStart:blockEnd:intervalComponents:completion:", v8, v14, v15, v16, *(_QWORD *)(a1 + 56));

}

- (void)_handleSamples:(id)a3 blockStart:(id)a4 blockEnd:(id)a5 intervalComponents:(id)a6 completion:(id)a7
{
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  HKGraphSeriesDataBlock *v17;
  void (**v18)(id, HKGraphSeriesDataBlock *, _QWORD);
  _QWORD v19[5];
  id v20;
  id v21;

  v18 = (void (**)(id, HKGraphSeriesDataBlock *, _QWORD))a7;
  objc_msgSend(MEMORY[0x1E0CB7010], "calculateIncludedValuesWithSamples:startDate:endDate:intervalComponents:", a3, a4, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEnumeratedValueDataSource _enumeratedValueOrderMapping](self, "_enumeratedValueOrderMapping");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __96__HKEnumeratedValueDataSource__handleSamples_blockStart_blockEnd_intervalComponents_completion___block_invoke;
  v19[3] = &unk_1E9C45940;
  v19[4] = self;
  v15 = v14;
  v20 = v15;
  v16 = v13;
  v21 = v16;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v19);
  v17 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v17, "setChartPoints:", v16);
  if (v18)
    v18[2](v18, v17, 0);

}

void __96__HKEnumeratedValueDataSource__handleSamples_blockStart_blockEnd_intervalComponents_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HKEnumeratedValueChartPoint *v13;

  v5 = a3;
  v6 = a2;
  v13 = objc_alloc_init(HKEnumeratedValueChartPoint);
  objc_msgSend(*(id *)(a1 + 32), "_enumeratedValuesToIndices:mapping:", v5, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  HKUIMidDate(v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKEnumeratedValueChartPoint setXValue:](v13, "setXValue:", v10);

  -[HKEnumeratedValueChartPoint setIndices:](v13, "setIndices:", v7);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v11)
  {
    (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKEnumeratedValueChartPoint setUserInfo:](v13, "setUserInfo:", v12);

  }
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v13);

}

- (id)_enumeratedValueOrderMapping
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_enumeratedValueOrder;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7 + v9, (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);

        ++v9;
      }
      while (v6 != v9);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v7 += v9;
    }
    while (v6);
  }

  return v3;
}

- (id)_enumeratedValuesToIndices:(id)a3 mapping:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSArray)enumeratedValueOrder
{
  return self->_enumeratedValueOrder;
}

- (void)setEnumeratedValueOrder:(id)a3
{
  objc_storeStrong((id *)&self->_enumeratedValueOrder, a3);
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
  objc_storeStrong((id *)&self->_enumeratedValueOrder, 0);
}

@end
