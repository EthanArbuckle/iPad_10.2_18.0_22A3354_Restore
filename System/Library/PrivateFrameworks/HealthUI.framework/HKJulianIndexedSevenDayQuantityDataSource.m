@implementation HKJulianIndexedSevenDayQuantityDataSource

- (HKJulianIndexedSevenDayQuantityDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4 quantityType:(id)a5 unitController:(id)a6 intervalUserInfoCreationBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  HKJulianIndexedSevenDayQuantityDataSource *v16;
  HKJulianIndexedSevenDayQuantityDataSource *v17;
  void *v18;
  id intervalUserInfoCreationBlock;
  id singlePointUserInfoCreationBlock;
  HKCalendarCache *v21;
  HKCalendarCache *calendarCache;
  objc_super v24;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HKJulianIndexedSevenDayQuantityDataSource;
  v16 = -[HKHealthQueryChartCacheDataSource initWithDisplayType:healthStore:](&v24, sel_initWithDisplayType_healthStore_, a3, a4);
  v17 = v16;
  if (v16)
  {
    v16->_dataSourceType = 1;
    objc_storeStrong((id *)&v16->_unitController, a6);
    objc_storeStrong((id *)&v17->_quantityType, a5);
    v18 = _Block_copy(v15);
    intervalUserInfoCreationBlock = v17->_intervalUserInfoCreationBlock;
    v17->_intervalUserInfoCreationBlock = v18;

    singlePointUserInfoCreationBlock = v17->_singlePointUserInfoCreationBlock;
    v17->_singlePointUserInfoCreationBlock = 0;

    v21 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E0CB6360]);
    calendarCache = v17->_calendarCache;
    v17->_calendarCache = v21;

  }
  return v17;
}

- (HKJulianIndexedSevenDayQuantityDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4 quantityType:(id)a5 unitController:(id)a6 singlePointUserInfoCreationBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  HKJulianIndexedSevenDayQuantityDataSource *v16;
  HKJulianIndexedSevenDayQuantityDataSource *v17;
  id intervalUserInfoCreationBlock;
  void *v19;
  id singlePointUserInfoCreationBlock;
  HKCalendarCache *v21;
  HKCalendarCache *calendarCache;
  objc_super v24;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HKJulianIndexedSevenDayQuantityDataSource;
  v16 = -[HKHealthQueryChartCacheDataSource initWithDisplayType:healthStore:](&v24, sel_initWithDisplayType_healthStore_, a3, a4);
  v17 = v16;
  if (v16)
  {
    v16->_dataSourceType = 0;
    objc_storeStrong((id *)&v16->_unitController, a6);
    objc_storeStrong((id *)&v17->_quantityType, a5);
    intervalUserInfoCreationBlock = v17->_intervalUserInfoCreationBlock;
    v17->_intervalUserInfoCreationBlock = 0;

    v19 = _Block_copy(v15);
    singlePointUserInfoCreationBlock = v17->_singlePointUserInfoCreationBlock;
    v17->_singlePointUserInfoCreationBlock = v19;

    v21 = (HKCalendarCache *)objc_alloc_init(MEMORY[0x1E0CB6360]);
    calendarCache = v17->_calendarCache;
    v17->_calendarCache = v21;

  }
  return v17;
}

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
  objc_msgSend(v2, "stringWithFormat:", CFSTR("HKJulianIndexedSevenDayQuantity(%@)"), v5);
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
  void *v14;
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
  -[HKJulianIndexedSevenDayQuantityDataSource quantityType](self, "quantityType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke;
  v20[3] = &unk_1E9C410B8;
  v20[4] = self;
  v21 = v6;
  v16 = v6;
  v17 = (void *)objc_msgSend(v13, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v14, v11, 0, v15, v20);

  objc_msgSend(v17, "setDebugIdentifier:", CFSTR("charting (7-day julian)"));
  objc_msgSend(v17, "setIncludeAutomaticTimeZones:", 1);
  v22 = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
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
        __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(a1, v12);
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(a1, v12);
    }
  }
  v14 = objc_alloc_init(HKCodableSampleDataSourceQueryData);
  objc_msgSend(v8, "hk_map:", &__block_literal_global_72);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");
  -[HKCodableSampleDataSourceQueryData setSamples:](v14, "setSamples:", v16);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_191(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "codableSampleChartData");
}

- (id)_createSinglePointChartPointFromDateInterval:(id)a3 statisticsInterval:(id)a4 timeZoneName:(id)a5 yValue:(id)a6 metadata:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  HKQuantityTypeDataSourceValue *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  void *v32;
  void *v33;
  void *v34;
  HKHealthChartPoint *v35;
  void *v36;
  HKHealthChartPoint *v37;
  void *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v48;
  id v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v55 = a6;
  v54 = a7;
  -[HKJulianIndexedSevenDayQuantityDataSource calendarCache](self, "calendarCache");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v14)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", v14);
    objc_msgSend(v16, "calendarForTimeZone:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v15, "currentCalendar");
    v18 = objc_claimAutoreleasedReturnValue();
  }

  -[HKJulianIndexedSevenDayQuantityDataSource calendarCache](self, "calendarCache");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentCalendar");
  v20 = objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v12, "startDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v21, "initWithStartDate:endDate:", v22, v23);

  v51 = (void *)v24;
  v52 = (void *)v20;
  v53 = (void *)v18;
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:sourceCalendar:localCalendar:", v24, v18, v20);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v48 = v14;
    v50 = v12;
    objc_msgSend(v25, "startDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "endDate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_alloc_init(HKQuantityTypeDataSourceValue);
    -[HKQuantityTypeDataSourceValue setStartDate:](v29, "setStartDate:", v27);
    -[HKQuantityTypeDataSourceValue setEndDate:](v29, "setEndDate:", v28);
    -[HKJulianIndexedSevenDayQuantityDataSource quantityType](self, "quantityType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setQuantityType:](v29, "setQuantityType:", v30);

    -[HKQuantityTypeDataSourceValue setAverageQuantity:](v29, "setAverageQuantity:", v55);
    -[HKQuantityTypeDataSourceValue setRecordCount:](v29, "setRecordCount:", 1);
    v49 = v13;
    -[HKQuantityTypeDataSourceValue setStatisticsInterval:](v29, "setStatisticsInterval:", v13);
    -[HKJulianIndexedSevenDayQuantityDataSource singlePointUserInfoCreationBlock](self, "singlePointUserInfoCreationBlock");
    v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKJulianIndexedSevenDayQuantityDataSource unitController](self, "unitController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "unitForDisplayType:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = [HKHealthChartPoint alloc];
    -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[HKHealthChartPoint initWithDataSourceValue:options:unit:displayType:](v35, "initWithDataSourceValue:options:unit:displayType:", v29, 2, v34, v36);

    if (v31)
    {
      ((void (**)(_QWORD, HKQuantityTypeDataSourceValue *, id))v31)[2](v31, v29, v54);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKHealthChartPoint setUserInfo:](v37, "setUserInfo:", v38);

    }
    v13 = v49;
    v12 = v50;
    v14 = v48;
  }
  else
  {
    _HKInitializeLogging();
    v39 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
      -[HKJulianIndexedSevenDayQuantityDataSource _createSinglePointChartPointFromDateInterval:statisticsInterval:timeZoneName:yValue:metadata:].cold.1(v39, v40, v41, v42, v43, v44, v45, v46);
    v37 = 0;
  }

  return v37;
}

- (id)_singlePointChartPointsWithSamples:(id)a3 statisticsInterval:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  HKGraphSeriesDataBlock *v12;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke;
  v14[3] = &unk_1E9C44F88;
  v14[4] = self;
  v15 = v6;
  v16 = v9;
  v10 = v9;
  v11 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);

  v12 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v12, "setChartPoints:", v10);

  return v12;
}

void __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);

    objc_msgSend(v4, "_timeZoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_copyNonEmptyString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      v12 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v4, "quantity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadata");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_createSinglePointChartPointFromDateInterval:statisticsInterval:timeZoneName:yValue:metadata:", v8, v12, v10, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);

    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
        __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_1(v17, v4);
    }

  }
  else
  {
    _HKInitializeLogging();
    v16 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_2(a1, v16);
  }

}

- (id)_createIntervalChartPointFromDateInterval:(id)a3 timeZoneName:(id)a4 yValue:(id)a5 metadata:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
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
  HKJulianIndexedSevenDayQuantityChartPoint *v29;
  void *v30;
  void *v31;
  HKJulianIndexedSevenDayQuantityChartPoint *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;

  v10 = a3;
  v11 = a4;
  v46 = a5;
  v49 = a6;
  -[HKJulianIndexedSevenDayQuantityDataSource calendarCache](self, "calendarCache");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", v11);
    objc_msgSend(v13, "calendarForTimeZone:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v12, "currentCalendar");
    v15 = objc_claimAutoreleasedReturnValue();
  }

  -[HKJulianIndexedSevenDayQuantityDataSource calendarCache](self, "calendarCache");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "currentCalendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v10, "startDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v18, "initWithStartDate:endDate:", v19, v20);

  v47 = (void *)v15;
  objc_msgSend(MEMORY[0x1E0CB3588], "hk_julianDayDateIntervalFromOpenUpperBoundDateInterval:sourceCalendar:localCalendar:", v21, v15, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  v48 = v10;
  if (v22)
  {
    v45 = v11;
    objc_msgSend(v22, "startDate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "endDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKJulianIndexedSevenDayQuantityDataSource unitController](self, "unitController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "unitForDisplayType:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = [HKJulianIndexedSevenDayQuantityChartPoint alloc];
    -[HKHealthQueryChartCacheDataSource displayType](self, "displayType");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v46;
    v32 = -[HKJulianIndexedSevenDayQuantityChartPoint initWithStartDate:endDate:displayType:unit:quantity:](v29, "initWithStartDate:endDate:displayType:unit:quantity:", v24, v25, v30, v28, v46);

    -[HKJulianIndexedSevenDayQuantityDataSource intervalUserInfoCreationBlock](self, "intervalUserInfoCreationBlock");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = (void *)v33;
    if (v33)
    {
      (*(void (**)(uint64_t, id, id, void *, void *))(v33 + 16))(v33, v46, v49, v24, v25);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKJulianIndexedSevenDayQuantityChartPoint setUserInfo:](v32, "setUserInfo:", v35);

    }
    v11 = v45;
  }
  else
  {
    _HKInitializeLogging();
    v36 = *MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
      -[HKJulianIndexedSevenDayQuantityDataSource _createSinglePointChartPointFromDateInterval:statisticsInterval:timeZoneName:yValue:metadata:].cold.1(v36, v37, v38, v39, v40, v41, v42, v43);
    v32 = 0;
    v31 = v46;
  }

  return v32;
}

- (id)_intervalChartPointsWithSamples:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id v7;
  HKGraphSeriesDataBlock *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  HKJulianIndexedSevenDayQuantityDataSource *v14;
  id v15;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __77__HKJulianIndexedSevenDayQuantityDataSource__intervalChartPointsWithSamples___block_invoke;
  v13 = &unk_1E9C44FB0;
  v14 = self;
  v15 = v6;
  v7 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v10);

  v8 = objc_alloc_init(HKGraphSeriesDataBlock);
  -[HKGraphSeriesDataBlock setChartPoints:](v8, "setChartPoints:", v7, v10, v11, v12, v13, v14);

  return v8;
}

void __77__HKJulianIndexedSevenDayQuantityDataSource__intervalChartPointsWithSamples___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = objc_alloc(MEMORY[0x1E0CB3588]);
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);

    objc_msgSend(v4, "_timeZoneName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_copyNonEmptyString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v4, "quantity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "_createIntervalChartPointFromDateInterval:timeZoneName:yValue:metadata:", v8, v10, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v14);

    }
    else
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x1E0CB5378];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_FAULT))
        __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_1(v16, v4);
    }

  }
  else
  {
    _HKInitializeLogging();
    v15 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_2(a1, v15);
  }

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
  HKJulianIndexedSevenDayQuantityDataSource *v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke;
  v26[3] = &unk_1E9C410E0;
  v27 = v8;
  v28 = self;
  v29 = v10;
  v12 = v10;
  v13 = v8;
  -[HKJulianIndexedSevenDayQuantityDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v13, v26);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_206;
  v24[3] = &unk_1E9C41108;
  v15 = v9;
  v25 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v24);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2;
  v21[3] = &unk_1E9C3FC50;
  v22 = v14;
  v23 = v15;
  v16 = v15;
  v17 = v14;
  v18 = _Block_copy(v21);
  v19 = _Block_copy(v18);

  return v19;
}

void __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
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
      __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1((_QWORD *)a1, v20);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_206(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "executeQuery:", a2);
}

void __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3;
  v2[3] = &unk_1E9C41108;
  v1 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  objc_msgSend(v1, "enumerateObjectsUsingBlock:", v2);

}

uint64_t __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopQuery:", a2);
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id v5;
  HKCodableSampleDataSourceQueryData *v6;
  void *v7;
  HKCodableSampleDataSourceQueryData *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int64_t v15;
  uint64_t v16;

  v5 = a3;
  v6 = [HKCodableSampleDataSourceQueryData alloc];
  objc_msgSend(v5, "queryDataObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKCodableSampleDataSourceQueryData initWithData:](v6, "initWithData:", v7);

  -[HKCodableSampleDataSourceQueryData samples](v8, "samples");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_map:", &__block_literal_global_210_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "copy");

  v12 = (void *)MEMORY[0x1E0C99D78];
  objc_msgSend(v5, "statisticsInterval");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "hkui_dateComponentsWithCodableDateComponents:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HKJulianIndexedSevenDayQuantityDataSource dataSourceType](self, "dataSourceType");
  if (!v15)
  {
    -[HKJulianIndexedSevenDayQuantityDataSource _singlePointChartPointsWithSamples:statisticsInterval:](self, "_singlePointChartPointsWithSamples:statisticsInterval:", v11, v14);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (v15 == 1)
  {
    -[HKJulianIndexedSevenDayQuantityDataSource _intervalChartPointsWithSamples:](self, "_intervalChartPointsWithSamples:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v12 = (void *)v16;
  }

  return v12;
}

uint64_t __93__HKJulianIndexedSevenDayQuantityDataSource_chartPointsFromQueryData_dataIsFromRemoteSource___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB6AD8], "createWithCodableChartData:", a2);
}

- (HKQuantityType)quantityType
{
  return self->_quantityType;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (id)intervalUserInfoCreationBlock
{
  return self->_intervalUserInfoCreationBlock;
}

- (id)singlePointUserInfoCreationBlock
{
  return self->_singlePointUserInfoCreationBlock;
}

- (HKCalendarCache)calendarCache
{
  return self->_calendarCache;
}

- (void)setCalendarCache:(id)a3
{
  objc_storeStrong((id *)&self->_calendarCache, a3);
}

- (int64_t)dataSourceType
{
  return self->_dataSourceType;
}

- (void)setDataSourceType:(int64_t)a3
{
  self->_dataSourceType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong(&self->_singlePointUserInfoCreationBlock, 0);
  objc_storeStrong(&self->_intervalUserInfoCreationBlock, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_quantityType, 0);
}

void __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  _os_log_debug_impl(&dword_1D7813000, v2, OS_LOG_TYPE_DEBUG, "Encountered error querying for %{public}@: %{public}@", v4, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

void __81__HKJulianIndexedSevenDayQuantityDataSource_queriesForRequest_completionHandler___block_invoke_cold_2(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2_2(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1D7813000, v2, OS_LOG_TYPE_ERROR, "Encountered error querying for %{public}@: %{public}@", v4, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

- (void)_createSinglePointChartPointFromDateInterval:(uint64_t)a3 statisticsInterval:(uint64_t)a4 timeZoneName:(uint64_t)a5 yValue:(uint64_t)a6 metadata:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1D7813000, a1, a3, "Sample with instantaneous duration detected", a5, a6, a7, a8, 0);
}

void __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_1(void *a1, void *a2)
{
  void *v2;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  v4 = a1;
  objc_msgSend(a2, "UUID");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "quantityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1_11(&dword_1D7813000, v7, v8, "TimeZone is missing for sample (uuid: %{public}@) in weekly report data source for quantity type %{public}@", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_0_2();
}

void __99__HKJulianIndexedSevenDayQuantityDataSource__singlePointChartPointsWithSamples_statisticsInterval___block_invoke_cold_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = OUTLINED_FUNCTION_8_1(a1, a2);
  objc_msgSend(v2, "quantityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_1(&dword_1D7813000, v5, v6, "Error enumerating over non-quantity %{public}@ in weekly report series", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1();
}

void __111__HKJulianIndexedSevenDayQuantityDataSource_generateSharableQueryDataForRequest_healthStore_completionHandler___block_invoke_cold_1(_QWORD *a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  _QWORD *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a2;
  HKStringForChartDataSourceQueryRequestAudience(objc_msgSend(v3, "audience"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1[5] + 48), "identifier");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_10(), "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412802;
  v8 = v5;
  v9 = 2112;
  v10 = a1;
  v11 = 2112;
  v12 = v6;
  _os_log_error_impl(&dword_1D7813000, v4, OS_LOG_TYPE_ERROR, "[RemoteCharting]_%@_%@: unable to fetch results from query with error: %@", (uint8_t *)&v7, 0x20u);

}

@end
