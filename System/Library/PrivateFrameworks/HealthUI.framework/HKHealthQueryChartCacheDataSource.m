@implementation HKHealthQueryChartCacheDataSource

- (HKHealthQueryChartCacheDataSource)initWithDisplayType:(id)a3 healthStore:(id)a4
{
  id v7;
  id v8;
  HKHealthQueryChartCacheDataSource *v9;
  HKHealthQueryChartCacheDataSource *v10;
  uint64_t v11;
  NSCalendar *calendar;
  NSCalendar *calendarOverride;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HKHealthQueryChartCacheDataSource;
  v9 = -[HKHealthQueryChartCacheDataSource init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayType, a3);
    objc_storeStrong((id *)&v10->_healthStore, a4);
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithFirstWeekdayFromRegion");
    v11 = objc_claimAutoreleasedReturnValue();
    calendar = v10->_calendar;
    v10->_calendar = (NSCalendar *)v11;

    calendarOverride = v10->_calendarOverride;
    v10->_calendarOverride = 0;

    objc_msgSend(v7, "behavior");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v10->_queryAlignment = objc_msgSend(v14, "preferredCalendarDayAlignment");

  }
  return v10;
}

- (id)operationForIdentifier:(id)a3 priorityDelegate:(id)a4 completion:(id)a5
{
  id v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  HKChartQueryDataGenerationOperation *v23;
  HKHealthQueryChartCacheQueryRequest *v24;
  void *v25;
  void *v26;
  id v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id location[2];
  uint64_t v34;
  __int128 v35;
  uint64_t v36;

  v8 = a3;
  v28 = a4;
  v29 = v8;
  v30 = a5;
  v35 = 0uLL;
  v36 = 0;
  if (v8)
  {
    objc_msgSend(v8, "HKGraphSeriesDataBlockPathValue");
    v9 = *((_QWORD *)&v35 + 1);
  }
  else
  {
    v9 = 0;
  }
  v10 = -[HKHealthQueryChartCacheDataSource calendarUnitForTimeScope:displayType:](self, "calendarUnitForTimeScope:displayType:", v9, self->_displayType);
  -[HKHealthQueryChartCacheDataSource queryCalendar](self, "queryCalendar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)location = v35;
  v34 = v36;
  HKGraphSeriesDataBlockPathMinimumX((uint64_t *)location);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_dateBeforeDateForCalendar:rangeUnit:", v11, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  *(_OWORD *)location = v35;
  v34 = v36;
  HKGraphSeriesDataBlockPathMaximumX((uint64_t)location);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_dateBeforeDateForCalendar:rangeUnit:", v11, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHealthQueryChartCacheDataSource _shiftedQueryIntervalIfNecessaryForStartDate:endDate:calendar:](self, "_shiftedQueryIntervalIfNecessaryForStartDate:endDate:calendar:", v13, v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "startDate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "endDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = v36;
  -[HKHealthQueryChartCacheDataSource statisticsIntervalForTimeScope:resolution:displayType:](self, "statisticsIntervalForTimeScope:resolution:displayType:", *((_QWORD *)&v35 + 1), v36, self->_displayType);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", *((_QWORD *)&v35 + 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "seriesPointIntervalComponentsAtResolution:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HKHealthQueryChartCacheDataSource _buildDescriptionFromStartDate:endDate:statisticsInterval:](self, "_buildDescriptionFromStartDate:endDate:statisticsInterval:", v17, v18, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HKHealthQueryChartCacheDataSource supportsChartQueryDataGeneration](self, "supportsChartQueryDataGeneration"))
  {
    v23 = -[HKChartQueryDataGenerationOperation initWithHealthStore:dataSource:startDate:endDate:statisticsInterval:operationDescription:completion:]([HKChartQueryDataGenerationOperation alloc], "initWithHealthStore:dataSource:startDate:endDate:statisticsInterval:operationDescription:completion:", self->_healthStore, self, v17, v18, v20, v22, v30);
  }
  else
  {
    v23 = -[HKHealthQueryFetchOperation initWithHealthStore:operationDescription:completion:]([HKHealthQueryFetchOperation alloc], "initWithHealthStore:operationDescription:completion:", self->_healthStore, v22, v30);
    objc_initWeak(location, v23);
    v24 = -[HKHealthQueryChartCacheQueryRequest initWithStartDate:endDate:statisticsInterval:]([HKHealthQueryChartCacheQueryRequest alloc], "initWithStartDate:endDate:statisticsInterval:", v17, v18, v20);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __88__HKHealthQueryChartCacheDataSource_operationForIdentifier_priorityDelegate_completion___block_invoke;
    v31[3] = &unk_1E9C438D8;
    objc_copyWeak(&v32, location);
    -[HKHealthQueryChartCacheDataSource queriesForRequest:completionHandler:](self, "queriesForRequest:completionHandler:", v24, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKChartQueryDataGenerationOperation setQueries:](v23, "setQueries:", v25);

    objc_destroyWeak(&v32);
    objc_destroyWeak(location);
  }
  if (v28)
  {
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v17, v18);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKFetchOperation setHighPriority:](v23, "setHighPriority:", objc_msgSend(v28, "isRangeHighPriority:", v26));

  }
  return v23;
}

void __88__HKHealthQueryChartCacheDataSource_operationForIdentifier_priorityDelegate_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __88__HKHealthQueryChartCacheDataSource_operationForIdentifier_priorityDelegate_completion___block_invoke_2;
  block[3] = &unk_1E9C438B0;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __88__HKHealthQueryChartCacheDataSource_operationForIdentifier_priorityDelegate_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "completedWithResults:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)_shiftedQueryIntervalIfNecessaryForStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  int64_t v11;
  void *v12;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HKHealthQueryChartCacheDataSource queryAlignment](self, "queryAlignment");
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v10, v9);

  if (v11 == 1)
  {
    objc_msgSend(v12, "hk_dateIntervalShiftedToQueryAlignment:calendar:", 1, v8);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }

  return v12;
}

- (id)mappingFunctionForContext:(id)a3
{
  return 0;
}

- (unint64_t)calendarUnitForTimeScope:(int64_t)a3 displayType:(id)a4
{
  unint64_t result;

  result = objc_msgSend(a4, "hk_chartCalendarUnitForTimeScope:", a3);
  if (!result)
    return 32;
  return result;
}

- (id)statisticsIntervalForTimeScope:(int64_t)a3 resolution:(int64_t)a4 displayType:(id)a5
{
  return (id)objc_msgSend(a5, "hk_customSeriesPointIntervalComponentsForTimeScope:resolution:", a3, a4);
}

- (id)queryCalendar
{
  NSCalendar *calendarOverride;

  calendarOverride = self->_calendarOverride;
  if (!calendarOverride)
    calendarOverride = self->_calendar;
  return calendarOverride;
}

- (BOOL)supportsChartQueryDataGeneration
{
  return 0;
}

- (id)_buildDescriptionFromStartDate:(id)a3 endDate:(id)a4 statisticsInterval:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  void *v24;

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB3940];
  v10 = a4;
  v11 = a3;
  -[HKHealthQueryChartCacheDataSource queryDescription](self, "queryDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  _DateForDescription(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  _DateForDescription(v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v8;
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v15, "year") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldy"), objc_msgSend(v15, "year"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

  }
  if (objc_msgSend(v15, "month") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldm"), objc_msgSend(v15, "month"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

  }
  if (objc_msgSend(v15, "day") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldd"), objc_msgSend(v15, "day"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

  }
  if (objc_msgSend(v15, "hour") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldh"), objc_msgSend(v15, "hour"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v20);

  }
  if (objc_msgSend(v15, "minute") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ldm"), objc_msgSend(v15, "minute"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v21);

  }
  if (objc_msgSend(v15, "second") != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lds"), objc_msgSend(v15, "second"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v22);

  }
  if (objc_msgSend(v16, "count"))
  {
    objc_msgSend(v16, "componentsJoinedByString:", CFSTR("_"));
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = CFSTR("NoDateComponents");
  }

  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@: %@ -> %@ interval %@"), v12, v13, v14, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)codableQueryDataWithType:(int)a3 startDate:(id)a4 endDate:(id)a5 statisticsInterval:(id)a6 queryDataObject:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  id v15;
  HKCodableChartDataSourceQueryData *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = *(_QWORD *)&a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(HKCodableChartDataSourceQueryData);
  -[HKCodableChartDataSourceQueryData setType:](v16, "setType:", v10);
  if (v12)
  {
    objc_msgSend(v12, "timeIntervalSinceReferenceDate");
    -[HKCodableChartDataSourceQueryData setStartDate:](v16, "setStartDate:");
  }
  if (v13)
  {
    objc_msgSend(v13, "timeIntervalSinceReferenceDate");
    -[HKCodableChartDataSourceQueryData setEndDate:](v16, "setEndDate:");
  }
  if (v14)
  {
    objc_msgSend(v14, "hkui_codableDateComponents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableChartDataSourceQueryData setStatisticsInterval:](v16, "setStatisticsInterval:", v17);

  }
  -[HKCodableChartDataSourceQueryData setQueryDataObject:](v16, "setQueryDataObject:", v15);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "name");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartDataSourceQueryData setTimeZoneName:](v16, "setTimeZoneName:", v19);

  -[HKHealthQueryChartCacheDataSource queryCalendar](self, "queryCalendar");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartDataSourceQueryData setFirstWeekday:](v16, "setFirstWeekday:", objc_msgSend(v20, "firstWeekday"));

  return v16;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (NSCalendar)calendarOverride
{
  return self->_calendarOverride;
}

- (void)setCalendarOverride:(id)a3
{
  objc_storeStrong((id *)&self->_calendarOverride, a3);
}

- (int64_t)queryAlignment
{
  return self->_queryAlignment;
}

- (void)setQueryAlignment:(int64_t)a3
{
  self->_queryAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarOverride, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (id)queryDescription
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (id)queriesForRequest:(id)a3 completionHandler:(id)a4
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (id)generateSharableQueryDataForRequest:(id)a3 healthStore:(id)a4 completionHandler:(id)a5
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

- (id)chartPointsFromQueryData:(id)a3 dataIsFromRemoteSource:(BOOL)a4
{
  id result;

  OUTLINED_FUNCTION_0_9();
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_2_3();
  return result;
}

@end
