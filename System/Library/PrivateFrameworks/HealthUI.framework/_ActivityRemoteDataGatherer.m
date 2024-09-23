@implementation _ActivityRemoteDataGatherer

- (void)gatherData
{
  os_log_t *v4;
  NSObject *v5;
  _ActivityRemoteDataGatherer *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  HKCodableChartSharableModel *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void (**v33)(_QWORD, _QWORD, _QWORD);
  NSObject *v34;
  NSObject *v35;
  void *v36;
  int v37;
  _ActivityRemoteDataGatherer *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInteractiveChartActivityController.m"), 2657, CFSTR("Gathering remote data must be done from the main thread due to restrictions imposed by HKActivitySummaryDataProvider"));

  }
  _HKInitializeLogging();
  v4 = (os_log_t *)MEMORY[0x1E0CB5378];
  v5 = *MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_INFO))
  {
    v37 = 134217984;
    v38 = self;
    _os_log_impl(&dword_1D7813000, v5, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] gatherData called", (uint8_t *)&v37, 0xCu);
  }
  v6 = self;
  -[_ActivityRemoteDataGatherer monthActivitySummaries](v6, "monthActivitySummaries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _HKInitializeLogging();
    v8 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      v37 = 134217984;
      v38 = v6;
      _os_log_impl(&dword_1D7813000, v8, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] gatherData monthActivitySummaries", (uint8_t *)&v37, 0xCu);
    }
    -[_ActivityRemoteDataGatherer activitySummaryProvider](v6, "activitySummaryProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivityRemoteDataGatherer monthDateInterval](v6, "monthDateInterval");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivityRemoteDataGatherer _dateRangeFromInterval:](v6, "_dateRangeFromInterval:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activitySummariesForDateRange:timeScope:", v11, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivityRemoteDataGatherer setMonthActivitySummaries:](v6, "setMonthActivitySummaries:", v12);

  }
  -[_ActivityRemoteDataGatherer sixMonthActivitySummaries](v6, "sixMonthActivitySummaries");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    _HKInitializeLogging();
    v14 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
    {
      v37 = 134217984;
      v38 = v6;
      _os_log_impl(&dword_1D7813000, v14, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] gatherData sixMonthActivitySummaries", (uint8_t *)&v37, 0xCu);
    }
    -[_ActivityRemoteDataGatherer activitySummaryProvider](v6, "activitySummaryProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivityRemoteDataGatherer sixMonthDateInterval](v6, "sixMonthDateInterval");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivityRemoteDataGatherer _dateRangeFromInterval:](v6, "_dateRangeFromInterval:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activitySummariesForDateRange:timeScope:", v17, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivityRemoteDataGatherer setSixMonthActivitySummaries:](v6, "setSixMonthActivitySummaries:", v18);

  }
  -[_ActivityRemoteDataGatherer monthActivitySummaries](v6, "monthActivitySummaries");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    -[_ActivityRemoteDataGatherer sixMonthActivitySummaries](v6, "sixMonthActivitySummaries");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      _HKInitializeLogging();
      v22 = *v4;
      if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
      {
        v37 = 134217984;
        v38 = v6;
        _os_log_impl(&dword_1D7813000, v22, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] gatherData sixMonthActivitySummaries && monthActivitySummaries", (uint8_t *)&v37, 0xCu);
      }
      -[HKActivitySummaryDataProvider removeObserver:](v6->_activitySummaryProvider, "removeObserver:", v6);
      v23 = objc_alloc_init(HKCodableChartSharableModel);
      -[_ActivityRemoteDataGatherer monthDateInterval](v6, "monthDateInterval");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hk_codableDateInterval");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableChartSharableModel setMonthDateInterval:](v23, "setMonthDateInterval:", v25);

      -[_ActivityRemoteDataGatherer monthActivitySummaries](v6, "monthActivitySummaries");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityRemoteDataGatherer _chartDataSourceQueryDataFromSummaries:](v6, "_chartDataSourceQueryDataFromSummaries:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableChartSharableModel setMonthData:](v23, "setMonthData:", v27);

      -[_ActivityRemoteDataGatherer sixMonthDateInterval](v6, "sixMonthDateInterval");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hk_codableDateInterval");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableChartSharableModel setSixMonthDateInterval:](v23, "setSixMonthDateInterval:", v29);

      -[_ActivityRemoteDataGatherer sixMonthActivitySummaries](v6, "sixMonthActivitySummaries");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivityRemoteDataGatherer _chartDataSourceQueryDataFromSummaries:](v6, "_chartDataSourceQueryDataFromSummaries:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableChartSharableModel setSixMonthData:](v23, "setSixMonthData:", v31);

      -[_ActivityRemoteDataGatherer completion](v6, "completion");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void (**)(_QWORD, _QWORD, _QWORD))objc_msgSend(v32, "copy");

      -[_ActivityRemoteDataGatherer setCompletion:](v6, "setCompletion:", 0);
      if (v33)
      {
        _HKInitializeLogging();
        v34 = *v4;
        if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
        {
          v37 = 134217984;
          v38 = v6;
          _os_log_impl(&dword_1D7813000, v34, OS_LOG_TYPE_INFO, "[%p] gatherData calling completion", (uint8_t *)&v37, 0xCu);
        }
        ((void (**)(_QWORD, HKCodableChartSharableModel *, _QWORD))v33)[2](v33, v23, 0);
      }

    }
  }
  _HKInitializeLogging();
  v35 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_INFO))
  {
    v37 = 134217984;
    v38 = v6;
    _os_log_impl(&dword_1D7813000, v35, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] finishing", (uint8_t *)&v37, 0xCu);
  }

}

- (NSArray)monthActivitySummaries
{
  return self->_monthActivitySummaries;
}

- (HKActivitySummaryDataProvider)activitySummaryProvider
{
  return self->_activitySummaryProvider;
}

- (id)_dateRangeFromInterval:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)sixMonthActivitySummaries
{
  return self->_sixMonthActivitySummaries;
}

- (NSDateInterval)sixMonthDateInterval
{
  return self->_sixMonthDateInterval;
}

- (NSDateInterval)monthDateInterval
{
  return self->_monthDateInterval;
}

- (void)setSixMonthActivitySummaries:(id)a3
{
  objc_storeStrong((id *)&self->_sixMonthActivitySummaries, a3);
}

- (void)setMonthActivitySummaries:(id)a3
{
  objc_storeStrong((id *)&self->_monthActivitySummaries, a3);
}

- (id)_chartDataSourceQueryDataFromSummaries:(id)a3
{
  void *v3;
  HKCodableChartDataSourceQueryData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  +[HKInteractiveChartActivityController _codableActivitySummaryDataFromSummaries:](HKInteractiveChartActivityController, "_codableActivitySummaryDataFromSummaries:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(HKCodableChartDataSourceQueryData);
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartDataSourceQueryData setQueryDataObject:](v4, "setQueryDataObject:", v5);

  -[HKCodableChartDataSourceQueryData setType:](v4, "setType:", 10);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableChartDataSourceQueryData setTimeZoneName:](v4, "setTimeZoneName:", v7);

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", *MEMORY[0x1E0C99790]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[HKCodableChartDataSourceQueryData setFirstWeekday:](v4, "setFirstWeekday:", objc_msgSend(v9, "firstWeekday"));

  return v4;
}

- (_ActivityRemoteDataGatherer)initWithActivitySummaryDataProvider:(id)a3 monthDateInterval:(id)a4 sixMonthDateInterval:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _ActivityRemoteDataGatherer *v15;
  _ActivityRemoteDataGatherer *v16;
  uint64_t v17;
  id completion;
  NSArray *monthActivitySummaries;
  NSArray *sixMonthActivitySummaries;
  NSObject *v21;
  objc_super v23;
  uint8_t buf[4];
  _ActivityRemoteDataGatherer *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)_ActivityRemoteDataGatherer;
  v15 = -[_ActivityRemoteDataGatherer init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_monthDateInterval, a4);
    objc_storeStrong((id *)&v16->_sixMonthDateInterval, a5);
    v17 = objc_msgSend(v14, "copy");
    completion = v16->_completion;
    v16->_completion = (id)v17;

    objc_storeStrong((id *)&v16->_activitySummaryProvider, a3);
    -[HKActivitySummaryDataProvider addObserver:](v16->_activitySummaryProvider, "addObserver:", v16);
    monthActivitySummaries = v16->_monthActivitySummaries;
    v16->_monthActivitySummaries = 0;

    sixMonthActivitySummaries = v16->_sixMonthActivitySummaries;
    v16->_sixMonthActivitySummaries = 0;

  }
  _HKInitializeLogging();
  v21 = *MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v25 = v16;
    _os_log_impl(&dword_1D7813000, v21, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] init", buf, 0xCu);
  }

  return v16;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  _ActivityRemoteDataGatherer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v6 = self;
    _os_log_impl(&dword_1D7813000, v3, OS_LOG_TYPE_INFO, "[_ActivityRemoteDataGatherer:%p] dealloc", buf, 0xCu);
  }
  -[HKActivitySummaryDataProvider removeObserver:](self->_activitySummaryProvider, "removeObserver:", self);
  v4.receiver = self;
  v4.super_class = (Class)_ActivityRemoteDataGatherer;
  -[_ActivityRemoteDataGatherer dealloc](&v4, sel_dealloc);
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sixMonthActivitySummaries, 0);
  objc_storeStrong((id *)&self->_monthActivitySummaries, 0);
  objc_storeStrong((id *)&self->_activitySummaryProvider, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_sixMonthDateInterval, 0);
  objc_storeStrong((id *)&self->_monthDateInterval, 0);
}

- (void)setMonthDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_monthDateInterval, a3);
}

- (void)setSixMonthDateInterval:(id)a3
{
  objc_storeStrong((id *)&self->_sixMonthDateInterval, a3);
}

- (void)setActivitySummaryProvider:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummaryProvider, a3);
}

@end
