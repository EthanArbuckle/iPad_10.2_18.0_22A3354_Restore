@implementation HKQuantityDistributionDataSource

- (HKQuantityDistributionDataSource)initWithQuantityType:(id)a3 unitController:(id)a4 healthStore:(id)a5 contextStyle:(int64_t)a6 predicate:(id)a7 options:(unint64_t)a8 baseDisplayType:(id)a9 specificStartDate:(id)a10 specificEndDate:(id)a11 userInfoCreationBlock:(id)a12
{
  id v17;
  id v18;
  id v19;
  HKQuantityDistributionDataSource *v20;
  HKQuantityDistributionDataSource *v21;
  HKUnit *v22;
  void *v23;
  double v24;
  HKUnit *preferredUnit;
  HKUnit *v26;
  void *v27;
  id userInfoCreationBlock;
  id v32;
  id v33;
  id v34;
  id v35;
  objc_super v36;

  v35 = a3;
  v17 = a4;
  v34 = a7;
  v18 = a9;
  v33 = a10;
  v32 = a11;
  v19 = a12;
  v36.receiver = self;
  v36.super_class = (Class)HKQuantityDistributionDataSource;
  v20 = -[HKHealthQueryChartCacheDataSource initWithDisplayType:healthStore:](&v36, sel_initWithDisplayType_healthStore_, v18, a5);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_quantityType, a3);
    objc_storeStrong((id *)&v21->_unitController, a4);
    objc_msgSend(v17, "unitForDisplayType:", v18);
    v22 = (HKUnit *)objc_claimAutoreleasedReturnValue();
    +[HKQuantityDistributionDataSource bucketSizeForQuantityType:preferredUnit:](HKQuantityDistributionDataSource, "bucketSizeForQuantityType:preferredUnit:", v35, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v21->_bucketSize = v24;

    v21->_bucketAnchor = 0.0;
    v21->_contextStyle = a6;
    objc_storeStrong((id *)&v21->_predicate, a7);
    v21->_options = a8;
    objc_storeStrong((id *)&v21->_specificStartDate, a10);
    objc_storeStrong((id *)&v21->_specificEndDate, a11);
    preferredUnit = v21->_preferredUnit;
    v21->_preferredUnit = v22;
    v26 = v22;

    v27 = _Block_copy(v19);
    userInfoCreationBlock = v21->_userInfoCreationBlock;
    v21->_userInfoCreationBlock = v27;

  }
  return v21;
}

+ (id)bucketSizeForQuantityType:(id)a3 preferredUnit:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "code") == 15)
    objc_msgSend(a1, "bucketSizeForBloodGlucoseWithUnit:", v7);
  else
    HKQuantityDistributionBucketSizeForQuantityType(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)bucketSizeForDisplayType:(id)a3 preferredUnit:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a3, "objectType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bucketSizeForQuantityType:preferredUnit:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)bucketSizeForBloodGlucoseWithUnit:(id)a3
{
  id v5;
  void *v6;
  char v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB6CD0], "_milligramsPerDeciliterUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  v8 = 4.0;
  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "_millimolesBloodGlucosePerLiterUnit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "isEqual:", v9);

    if ((v10 & 1) != 0)
    {
      v8 = 0.2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unitString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKQuantityDistributionDataSource.m"), 113, CFSTR("Unsupported glucose unit: %@"), v12);

      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
        +[HKQuantityDistributionDataSource bucketSizeForBloodGlucoseWithUnit:].cold.1(v13, v5);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_quickDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0CB3578];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setDateFormat:", CFSTR("MM/dd/YYYY-HH:mm:ss"));
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v6);

  objc_msgSend(v5, "stringFromDate:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)queryDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[HKQuantityDistributionDataSource quantityType](self, "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_localizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKQuantityDistribution(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  NSDate *specificStartDate;
  NSDate *v8;
  NSDate *specificEndDate;
  NSDate *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  int64_t contextStyle;
  NSPredicate *predicate;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t options;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  NSDate *v39;
  NSDate *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[2];

  v43[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v37 = a4;
  specificStartDate = self->_specificStartDate;
  if (specificStartDate)
  {
    v8 = specificStartDate;
  }
  else
  {
    objc_msgSend(v6, "startDate");
    v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v40 = v8;
  specificEndDate = self->_specificEndDate;
  if (specificEndDate)
  {
    v10 = specificEndDate;
  }
  else
  {
    objc_msgSend(v6, "endDate");
    v10 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v39 = v10;
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "adjustedDoubleForClientDouble:", self->_bucketSize);
  v14 = v13;

  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "adjustedDoubleForClientDouble:", self->_bucketAnchor);
  v18 = v17;

  -[HKQuantityDistributionDataSource unitController](self, "unitController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unitForDisplayType:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v21, v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v21, v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc(MEMORY[0x1E0CB7008]);
  -[HKQuantityDistributionDataSource quantityType](self, "quantityType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  contextStyle = self->_contextStyle;
  predicate = self->_predicate;
  objc_msgSend(v6, "startDate");
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v6;
  v36 = v6;
  v30 = (void *)v28;
  objc_msgSend(v29, "statisticsInterval");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  options = self->_options;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __72__HKQuantityDistributionDataSource_queriesForRequest_completionHandler___block_invoke;
  v41[3] = &unk_1E9C41468;
  v42 = v37;
  v38 = v37;
  v33 = (void *)objc_msgSend(v24, "initWithQuantityType:startDate:endDate:contextStyle:predicate:anchorDate:intervalComponents:histogramAnchor:histogramBucketSize:options:completionHandler:", v25, v40, v39, contextStyle, predicate, v30, v31, v23, v22, options, v41);

  objc_msgSend(v33, "setDebugIdentifier:", CFSTR("charting (distribution)"));
  v43[0] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

uint64_t __72__HKQuantityDistributionDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_dataBlockFromHistograms:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  HKQuantityDistributionChartPoint *v14;
  void *v15;
  double bucketSize;
  void *v17;
  HKQuantityDistributionChartPoint *v18;
  void *v19;
  HKGraphSeriesDataBlock *v20;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKQuantityDistributionDataSource unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitForDisplayType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v4;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
        v14 = [HKQuantityDistributionChartPoint alloc];
        -[HKQuantityDistributionDataSource _bucketDateForHistogramData:](self, "_bucketDateForHistogramData:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        bucketSize = self->_bucketSize;
        -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[HKQuantityDistributionChartPoint initWithHistogramData:bucketDate:bucketIncrement:unit:displayType:](v14, "initWithHistogramData:bucketDate:bucketIncrement:unit:displayType:", v13, v15, v8, v17, bucketSize);

        (*((void (**)(void))self->_userInfoCreationBlock + 2))();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKQuantityDistributionChartPoint setUserInfo:](v18, "setUserInfo:", v19);

        objc_msgSend(v5, "addObject:", v18);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  v20 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v20, "setChartPoints:", v5);

  return v20;
}

- (id)_bucketDateForHistogramData:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = (objc_class *)MEMORY[0x1E0CB3588];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);
  if (-[HKHealthQueryChartCacheDataSource queryAlignment](self, "queryAlignment") == 1)
  {
    objc_msgSend(v9, "duration");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0C99D78], "hk_oneDay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_approximateDuration");
    v14 = v13;

    if (v11 >= v14)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hk_dateIntervalUnshiftedFromQueryAlignment:calendar:", 1, v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v16;
    }
  }
  objc_msgSend(v9, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIMidDate(v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
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
  HKQuantityDistributionDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C414D0;
  v27 = v8;
  v28 = self;
  v29 = v10;
  v12 = v10;
  v13 = v8;
  -[HKQuantityDistributionDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
  HKCodableChartQuantityDistributionDataSourceQueryData *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
        v24 = 138412802;
        v25 = v11;
        v26 = 2112;
        v27 = v12;
        v28 = 2112;
        v29 = v13;
        _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_INFO, "[RemoteCharting]_%@_%@: query returned successfully with error: %@", (uint8_t *)&v24, 0x20u);

      }
    }
    objc_msgSend(v5, "hk_map:", &__block_literal_global_215);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(HKCodableChartQuantityDistributionDataSourceQueryData);
    v16 = (void *)objc_msgSend(v14, "mutableCopy");
    -[HKCodableChartQuantityDistributionDataSourceQueryData setQuantityDistributionDatas:](v15, "setQuantityDistributionDatas:", v16);

    v17 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "startDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "statisticsInterval");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableChartQuantityDistributionDataSourceQueryData data](v15, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "codableQueryDataWithType:startDate:endDate:statisticsInterval:queryDataObject:", 1, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v23 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(a1, v23, v7);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_213(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableQuantityDistributionData");
}

uint64_t __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_4;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  HKUnit *v9;
  HKCodableChartQuantityDistributionDataSourceQueryData *v10;
  void *v11;
  HKCodableChartQuantityDistributionDataSourceQueryData *v12;
  void *v13;
  HKUnit *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void *v22;
  id v23;
  HKUnit *v24;

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
  v9 = self->_preferredUnit;
  v10 = [HKCodableChartQuantityDistributionDataSourceQueryData alloc];
  objc_msgSend(v5, "queryDataObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKCodableChartQuantityDistributionDataSourceQueryData initWithData:](v10, "initWithData:", v11);
  -[HKCodableChartQuantityDistributionDataSourceQueryData quantityDistributionDatas](v12, "quantityDistributionDatas");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __84__HKQuantityDistributionDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke;
  v22 = &unk_1E9C414F8;
  v23 = v8;
  v24 = v9;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v13, "hk_map:", &v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDistributionDataSource _dataBlockFromHistograms:](self, "_dataBlockFromHistograms:", v16, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

uint64_t __84__HKQuantityDistributionDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB7000], "quantityDistributionDataWithCodableQuantityDistributionData:sourceTimeZone:preferredUnit:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (double)bucketSize
{
  return self->_bucketSize;
}

- (double)bucketAnchor
{
  return self->_bucketAnchor;
}

- (int64_t)contextStyle
{
  return self->_contextStyle;
}

- (NSPredicate)predicate
{
  return self->_predicate;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSDate)specificStartDate
{
  return self->_specificStartDate;
}

- (NSDate)specificEndDate
{
  return self->_specificEndDate;
}

- (HKUnit)preferredUnit
{
  return self->_preferredUnit;
}

- (id)userInfoCreationBlock
{
  return self->_userInfoCreationBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_preferredUnit, 0);
  objc_storeStrong((id *)&self->_specificEndDate, 0);
  objc_storeStrong((id *)&self->_specificStartDate, 0);
  objc_storeStrong((id *)&self->_predicate, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

+ (void)bucketSizeForBloodGlucoseWithUnit:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "unitString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D7813000, v3, OS_LOG_TYPE_ERROR, "Unsupported glucose unit: %{public}@", (uint8_t *)&v5, 0xCu);

}

void __102__HKQuantityDistributionDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
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
