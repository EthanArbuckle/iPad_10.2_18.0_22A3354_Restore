@implementation HKMCViewModelProvider

- (void)setActiveCycles:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  HKMCViewModelProvider *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKMCViewModelProvider+HKMCCycle.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activeCycles.count > 0"));

  }
  v23 = self;
  -[HKMCViewModelProvider calendarCache](self, "calendarCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = HKMCTodayIndex(v7);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    v13 = 0xFFFFFFFF80000000;
    v14 = 0x7FFFFFFFLL;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v16, "menstruationSegment");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "days");

        if (v18 < v14)
          v14 = v18;
        objc_msgSend(v16, "lastDayIndex");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "integerValue");
        if (v20)
          v21 = v20;
        else
          v21 = v8;

        if (v21 > v13)
          v13 = v21;
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v11);
  }
  else
  {
    v13 = 0xFFFFFFFF80000000;
    v14 = 0x7FFFFFFFLL;
  }

  -[HKMCViewModelProvider setMaximumActiveDuration:](v23, "setMaximumActiveDuration:", v13 - v14 + 1);
  -[HKMCViewModelProvider setActiveDayRange:](v23, "setActiveDayRange:", v14, v13 - v14 + 1);

}

- (HKMCViewModelProvider)initWithHealthStore:(id)a3 analysisProvider:(id)a4 pregnancyModelProvider:(id)a5 maximumActiveDuration:(int64_t)a6 minimumBufferDuration:(int64_t)a7 shouldFetchCycleFactors:(BOOL)a8 calendarCache:(id)a9
{
  return -[HKMCViewModelProvider initWithHealthStore:analysisProvider:pregnancyModelProvider:maximumActiveDuration:minimumBufferDuration:shouldFetchCycleFactors:calendarCache:queue:](self, "initWithHealthStore:analysisProvider:pregnancyModelProvider:maximumActiveDuration:minimumBufferDuration:shouldFetchCycleFactors:calendarCache:queue:", a3, a4, a5, a6, a7, a8, a9, MEMORY[0x24BDAC9B8]);
}

- (HKMCViewModelProvider)initWithHealthStore:(id)a3 analysisProvider:(id)a4 pregnancyModelProvider:(id)a5 maximumActiveDuration:(int64_t)a6 minimumBufferDuration:(int64_t)a7 shouldFetchCycleFactors:(BOOL)a8 calendarCache:(id)a9 queue:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HKMCViewModelProviderDataSource *v21;
  HKMCCycleFactorsDataSource *v22;
  HKMCViewModelProvider *v23;
  uint64_t v25;

  v16 = a10;
  v17 = a9;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[HKMCViewModelProviderDataSource initWithHealthStore:calendarCache:queue:]([HKMCViewModelProviderDataSource alloc], "initWithHealthStore:calendarCache:queue:", v20, v17, v16);
  v22 = -[HKMCCycleFactorsDataSource initWithHealthStore:pregnancyModelProvider:queue:]([HKMCCycleFactorsDataSource alloc], "initWithHealthStore:pregnancyModelProvider:queue:", v20, v18, v16);

  LOBYTE(v25) = a8;
  v23 = -[HKMCViewModelProvider _initWithDataSource:cycleFactorsDataSource:analysisProvider:maximumActiveDuration:minimumBufferDuration:prefetchDuration:shouldFetchCycleFactors:calendarCache:queue:](self, "_initWithDataSource:cycleFactorsDataSource:analysisProvider:maximumActiveDuration:minimumBufferDuration:prefetchDuration:shouldFetchCycleFactors:calendarCache:queue:", v21, v22, v19, a6, a7, 5 * a7, v25, v17, v16);

  return v23;
}

- (id)_initWithDataSource:(id)a3 cycleFactorsDataSource:(id)a4 analysisProvider:(id)a5 maximumActiveDuration:(int64_t)a6 minimumBufferDuration:(int64_t)a7 prefetchDuration:(int64_t)a8 shouldFetchCycleFactors:(BOOL)a9 calendarCache:(id)a10 queue:(id)a11
{
  id v17;
  id v18;
  HKMCViewModelProvider *v19;
  HKMCViewModelProvider *v20;
  id v21;
  uint64_t v22;
  NSHashTable *observers;
  uint64_t v24;
  NSMutableIndexSet *fetchStartedDayIndexes;
  uint64_t v26;
  NSMutableIndexSet *fetchCompletedDayIndexes;
  uint64_t v28;
  NSMutableDictionary *daySummariesByDayIndex;
  void *v30;
  id v31;
  void *v32;
  OS_dispatch_queue *queue;
  uint64_t v34;
  _HKDelayedOperation *notifyObserversOperation;
  void *v37;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id location;
  objc_super v46;

  v17 = a3;
  v41 = a4;
  v40 = a5;
  v42 = a10;
  v18 = a11;
  v46.receiver = self;
  v46.super_class = (Class)HKMCViewModelProvider;
  v19 = -[HKMCViewModelProvider init](&v46, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_queue, a11);
    objc_storeStrong((id *)&v20->_dataSource, a3);
    -[HKMCViewModelProviderDataSource setDelegate:](v20->_dataSource, "setDelegate:", v20);
    objc_storeStrong((id *)&v20->_cycleFactorsDataSource, a4);
    objc_storeStrong((id *)&v20->_analysisProvider, a5);
    -[HKMCAnalysisProvider addObserver:queue:](v20->_analysisProvider, "addObserver:queue:", v20, v18);
    v21 = v18;
    if (a9)
      -[HKMCCycleFactorsDataSourceProviding setDelegate:](v20->_cycleFactorsDataSource, "setDelegate:", v20);
    if (a7 > a8)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("HKMCViewModelProvider.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("minimumBufferDuration <= prefetchDuration"));

    }
    v20->_maximumActiveDuration = a6;
    v20->_minimumBufferDuration = a7;
    v20->_prefetchDuration = a8;
    v20->_shouldFetchCycleFactors = a9;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v22 = objc_claimAutoreleasedReturnValue();
    observers = v20->_observers;
    v20->_observers = (NSHashTable *)v22;

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v24 = objc_claimAutoreleasedReturnValue();
    fetchStartedDayIndexes = v20->_fetchStartedDayIndexes;
    v20->_fetchStartedDayIndexes = (NSMutableIndexSet *)v24;

    objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    v26 = objc_claimAutoreleasedReturnValue();
    fetchCompletedDayIndexes = v20->_fetchCompletedDayIndexes;
    v20->_fetchCompletedDayIndexes = (NSMutableIndexSet *)v26;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v28 = objc_claimAutoreleasedReturnValue();
    daySummariesByDayIndex = v20->_daySummariesByDayIndex;
    v20->_daySummariesByDayIndex = (NSMutableDictionary *)v28;

    objc_storeStrong((id *)&v20->_calendarCache, a10);
    objc_msgSend(v42, "currentCalendar");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v20->_todayDayIndex = HKMCTodayIndex(v30);

    objc_initWeak(&location, v20);
    v31 = objc_alloc(MEMORY[0x24BDD41D0]);
    v32 = v21;
    queue = v20->_queue;
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __190__HKMCViewModelProvider__initWithDataSource_cycleFactorsDataSource_analysisProvider_maximumActiveDuration_minimumBufferDuration_prefetchDuration_shouldFetchCycleFactors_calendarCache_queue___block_invoke;
    v43[3] = &unk_24D99DB10;
    objc_copyWeak(&v44, &location);
    v34 = objc_msgSend(v31, "initWithQueue:delay:block:", queue, v43, 1.0);
    notifyObserversOperation = v20->_notifyObserversOperation;
    v20->_notifyObserversOperation = (_HKDelayedOperation *)v34;

    objc_destroyWeak(&v44);
    objc_destroyWeak(&location);
    v18 = v32;
  }

  return v20;
}

void __190__HKMCViewModelProvider__initWithDataSource_cycleFactorsDataSource_analysisProvider_maximumActiveDuration_minimumBufferDuration_prefetchDuration_shouldFetchCycleFactors_calendarCache_queue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_runNotifyObserversOperationNow");

}

- (id)copyWithMinimumBufferDuration:(int64_t)a3
{
  HKMCViewModelProviderDataSource *v5;
  void *v6;
  HKMCViewModelProviderDataSource *v7;
  HKMCCycleFactorsDataSource *v8;
  void *v9;
  HKMCCycleFactorsDataSource *v10;
  id v11;

  v5 = [HKMCViewModelProviderDataSource alloc];
  -[HKMCAnalysisProvider healthStore](self->_analysisProvider, "healthStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKMCViewModelProviderDataSource initWithHealthStore:calendarCache:queue:](v5, "initWithHealthStore:calendarCache:queue:", v6, self->_calendarCache, self->_queue);

  v8 = [HKMCCycleFactorsDataSource alloc];
  -[HKMCAnalysisProvider healthStore](self->_analysisProvider, "healthStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKMCCycleFactorsDataSource initWithHealthStore:pregnancyModelProvider:queue:](v8, "initWithHealthStore:pregnancyModelProvider:queue:", v9, 0, self->_queue);

  v11 = -[HKMCViewModelProvider _copyWithDataSource:cycleFactorsDataSource:minimumBufferDuration:](self, "_copyWithDataSource:cycleFactorsDataSource:minimumBufferDuration:", v7, v10, a3);
  return v11;
}

- (id)_copyWithDataSource:(id)a3 cycleFactorsDataSource:(id)a4 minimumBufferDuration:(int64_t)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t v12;
  void *v13;
  NSMutableIndexSet *fetchCompletedDayIndexes;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v28;
  _QWORD v29[4];
  id v30;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v28) = self->_shouldFetchCycleFactors;
  v11 = (_QWORD *)objc_msgSend(v10, "_initWithDataSource:cycleFactorsDataSource:analysisProvider:maximumActiveDuration:minimumBufferDuration:prefetchDuration:shouldFetchCycleFactors:calendarCache:queue:", v9, v8, self->_analysisProvider, self->_maximumActiveDuration, a5, 5 * a5, v28, self->_calendarCache, self->_queue);

  v12 = -[NSMutableIndexSet mutableCopy](self->_fetchCompletedDayIndexes, "mutableCopy");
  v13 = (void *)v11[12];
  v11[12] = v12;

  fetchCompletedDayIndexes = self->_fetchCompletedDayIndexes;
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __90__HKMCViewModelProvider__copyWithDataSource_cycleFactorsDataSource_minimumBufferDuration___block_invoke;
  v29[3] = &unk_24D99DB38;
  v15 = v11;
  v30 = v15;
  -[NSMutableIndexSet hk_enumerateDayIndexRangesUsingBlock:](fetchCompletedDayIndexes, "hk_enumerateDayIndexRangesUsingBlock:", v29);
  v16 = -[NSMutableDictionary mutableCopy](self->_daySummariesByDayIndex, "mutableCopy");
  v17 = (void *)v15[13];
  v15[13] = v16;

  v18 = -[NSArray copy](self->_cycleFactors, "copy");
  v19 = (void *)v15[14];
  v15[14] = v18;

  v20 = -[HKMCAnalysis copy](self->_analysis, "copy");
  v21 = (void *)v15[16];
  v15[16] = v20;

  v22 = -[HKMCPregnancyModel copy](self->_lastPregnancyModel, "copy");
  v23 = (void *)v15[17];
  v15[17] = v22;

  v24 = -[NSNumber copy](self->_minimumAnalysisAnchor, "copy");
  v25 = (void *)v15[15];
  v15[15] = v24;

  objc_msgSend(v15, "setActiveDayRange:", self->_activeDayRange.start, self->_activeDayRange.duration);
  _HKInitializeLogging();
  v26 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEBUG))
    -[HKMCViewModelProvider _copyWithDataSource:cycleFactorsDataSource:minimumBufferDuration:].cold.1(v26, (uint64_t)self, (uint64_t)v15);

  return v15;
}

uint64_t __90__HKMCViewModelProvider__copyWithDataSource_cycleFactorsDataSource_minimumBufferDuration___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(result + 32);
  *(_QWORD *)(v3 + 72) = a2;
  *(_QWORD *)(v3 + 80) = a3;
  return result;
}

- (id)dayViewModelAtIndex:(int64_t)a3
{
  NSMutableDictionary *daySummariesByDayIndex;
  void *v6;
  void *v7;
  void *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (-[HKMCViewModelProvider _fetchStateForDayIndex:](self, "_fetchStateForDayIndex:", a3) == 2)
  {
    daySummariesByDayIndex = self->_daySummariesByDayIndex;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](daySummariesByDayIndex, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKMCViewModelProvider _viewModelWithDayIndex:fetchedDaySummary:](self, "_viewModelWithDayIndex:fetchedDaySummary:", a3, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[HKMCDayViewModel unfetchedDayViewModel](HKMCDayViewModel, "unfetchedDayViewModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)setActiveDayRange:(id)a3
{
  int64_t var1;
  int64_t var0;
  void *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  HKMCViewModelProvider *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  var1 = a3.var1;
  var0 = a3.var0;
  v22 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (var1 <= self->_maximumActiveDuration)
  {
    if (self->_activeDayRange.start != var0 || self->_activeDayRange.duration != var1)
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEBUG))
        -[HKMCViewModelProvider setActiveDayRange:].cold.1(v13, (uint64_t)self);
      self->_activeDayRange.start = var0;
      self->_activeDayRange.duration = var1;
      -[HKMCViewModelProvider _updateManagedDayRangeIfNeeded](self, "_updateManagedDayRangeIfNeeded");
    }
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_ERROR))
    {
      v7 = v6;
      v8 = (void *)objc_opt_class();
      v9 = v8;
      NSStringFromHKDayIndexRange();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_maximumActiveDuration);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v8;
      v16 = 2048;
      v17 = self;
      v18 = 2114;
      v19 = v10;
      v20 = 2114;
      v21 = v11;
      _os_log_error_impl(&dword_218A9C000, v7, OS_LOG_TYPE_ERROR, "[%{public}@:%p] Ignoring invalid active day range: %{public}@, maximum duration is %{public}@", (uint8_t *)&v14, 0x2Au);

    }
  }
}

- (id)_viewModelWithDayIndex:(int64_t)a3 fetchedDaySummary:(id)a4
{
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  void *cycleFactors;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char v17;
  uint64_t v18;
  void *v19;
  uint64_t v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  int64_t v25;
  char v26;

  v6 = a4;
  v26 = 0;
  v7 = -[HKMCViewModelProvider _menstruationLevelWithDayIndex:menstrualFlow:partiallyLoggedPeriod:](self, "_menstruationLevelWithDayIndex:menstrualFlow:partiallyLoggedPeriod:", a3, objc_msgSend(v6, "menstrualFlow"), &v26);
  v8 = -[HKMCViewModelProvider _fertileWindowLevelWithDayIndex:](self, "_fertileWindowLevelWithDayIndex:", a3);
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  cycleFactors = self->_cycleFactors;
  v22 = v9;
  if (cycleFactors)
  {
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __66__HKMCViewModelProvider__viewModelWithDayIndex_fetchedDaySummary___block_invoke;
    v23[3] = &unk_24D99DB60;
    v24 = v9;
    v25 = a3;
    objc_msgSend(cycleFactors, "hk_filter:", v23);
    cycleFactors = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "features");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "seahorse");

    if (v13)
    {
      v14 = -[HKMCViewModelProvider _pregnancyStateWithDayIndex:cycleFactors:](self, "_pregnancyStateWithDayIndex:cycleFactors:", a3, self->_cycleFactors);
      v15 = -[HKMCViewModelProvider _bleedingInPregnancyLevel:](self, "_bleedingInPregnancyLevel:", objc_msgSend(v6, "bleedingInPregnancyFlow"));
      v16 = -[HKMCViewModelProvider _bleedingAfterPregnancyLevel:](self, "_bleedingAfterPregnancyLevel:", objc_msgSend(v6, "bleedingAfterPregnancyFlow"));
    }
    else
    {
      v14 = 0;
      v15 = 0;
      v16 = 0;
    }

    if (v6)
      goto LABEL_14;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    v16 = 0;
    if (v6)
    {
LABEL_14:
      v17 = v26;
      BYTE1(v21) = -[HKMCViewModelProvider _didFetchInitialAnalysis](self, "_didFetchInitialAnalysis");
      LOBYTE(v21) = v17;
      +[HKMCDayViewModel dayViewModelWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:](HKMCDayViewModel, "dayViewModelWithMenstruationLevel:fertileWindowLevel:pregnancyState:bleedingInPregnancyLevel:bleedingAfterPregnancyLevel:daySummary:cycleFactors:partiallyLoggedPeriod:fetched:", v7, v8, v14, v15, v16, v6, cycleFactors, v21, v22);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
  }
  if (v7 || v8 || v14 || v15 || v16 || objc_msgSend(cycleFactors, "count"))
    goto LABEL_14;
  if (-[HKMCViewModelProvider _didFetchInitialAnalysis](self, "_didFetchInitialAnalysis"))
    +[HKMCDayViewModel emptyDayViewModel](HKMCDayViewModel, "emptyDayViewModel");
  else
    +[HKMCDayViewModel unfetchedDayViewModel](HKMCDayViewModel, "unfetchedDayViewModel");
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v19 = (void *)v18;

  return v19;
}

BOOL __66__HKMCViewModelProvider__viewModelWithDayIndex_fetchedDaySummary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  v3 = objc_msgSend(a2, "hk_dayIndexRangeWithCalendar:", *(_QWORD *)(a1 + 32));
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v5 < v3;
  v6 = v5 - v3;
  return !v7 && v6 < v4;
}

- (unint64_t)_pregnancyStateWithDayIndex:(int64_t)a3 cycleFactors:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  int64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  BOOL v36;
  BOOL v37;
  id v39;
  uint64_t v40;
  HKMCViewModelProvider *v41;
  uint64_t v42;
  uint64_t v43;
  int64_t v44;
  uint64_t v45;
  id obj;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[HKCalendarCache currentCalendar](self->_calendarCache, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(MEMORY[0x24BDD3CA8], "recentPregnancyStartThresholdInDays");
  v42 = objc_msgSend(MEMORY[0x24BDD3CA8], "recentPregnancyEndThresholdInDays");
  v9 = objc_msgSend(MEMORY[0x24BDD3CA8], "maximumNumberOfWeeksPregnant");
  -[HKMCPregnancyModel estimatedDueDate](self->_lastPregnancyModel, "estimatedDueDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = a3;
  if (!v10)
    goto LABEL_5;
  -[HKMCPregnancyModel estimatedDueDate](self->_lastPregnancyModel, "estimatedDueDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hk_dayIndexWithCalendar:", v7);

  if (v12 != a3)
    goto LABEL_5;
  -[HKMCPregnancyModel pregnancyEndDate](self->_lastPregnancyModel, "pregnancyEndDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKMCPregnancyModel pregnancyEndDate](self->_lastPregnancyModel, "pregnancyEndDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "hk_dayIndexWithCalendar:", v7);

  v16 = 3;
  if (v13)
  {
    if (v15 < v44)
    {
LABEL_5:
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v39 = v6;
      obj = v6;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
      if (v17)
      {
        v18 = v17;
        v19 = 0;
        v45 = 0;
        v40 = 7 * v9;
        v41 = self;
        v20 = *(_QWORD *)v48;
        v21 = (void *)*MEMORY[0x24BDD29D8];
        v43 = v8 + 1;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v48 != v20)
              objc_enumerationMutation(obj);
            v23 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v23, "categoryType", v39);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25 == v21)
            {
              objc_msgSend(v23, "startDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "hk_dayIndexWithCalendar:", v7);

              if (v27 > v19)
              {
                v28 = objc_msgSend(v23, "hk_dayIndexRangeWithCalendar:", v7);
                v30 = v29;
                objc_msgSend(v23, "startDate");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v19 = objc_msgSend(v31, "hk_dayIndexWithCalendar:", v7);

                objc_msgSend(v23, "endDate");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "hk_dayIndexWithCalendar:", v7);

                if (v43 + v19 >= v33)
                  v34 = v33 - v19;
                else
                  v34 = v43;
                if (v44 < v28 || v44 - v28 >= v30)
                {
                  v36 = v44 - v33 > v42 || v44 < v33;
                  v35 = v45;
                  if (!v36)
                    v35 = 1;
                }
                else if (v41->_todayDayIndex >= v44)
                {
                  v37 = v44 - v19 >= v34 || v44 < v19;
                  v35 = 4;
                  if (v37)
                    v35 = 5;
                }
                else
                {
                  v35 = 2 * (v44 - v19 < v40);
                }
                v45 = v35;
              }
            }
            else
            {

            }
          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v51, 16);
        }
        while (v18);
      }
      else
      {
        v45 = 0;
      }

      v6 = v39;
      v16 = v45;
    }
  }

  return v16;
}

- (unint64_t)_bleedingInPregnancyLevel:(int64_t)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3 == 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (unint64_t)_bleedingAfterPregnancyLevel:(int64_t)a3
{
  unint64_t v3;

  v3 = 1;
  if (a3 == 1)
    v3 = 2;
  if (a3)
    return v3;
  else
    return 0;
}

- (unint64_t)_menstruationLevelWithDayIndex:(int64_t)a3 menstrualFlow:(int64_t)a4 partiallyLoggedPeriod:(BOOL *)a5
{
  unint64_t v5;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  int64_t v15;
  int64_t v16;
  int64_t v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  int64_t v25;
  int64_t v26;
  int64_t v28;
  int64_t v29;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  if ((unint64_t)(a4 - 1) < 5)
    return qword_218AC7D70[a4 - 1];
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[HKMCAnalysis cycles](self->_analysis, "cycles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v37;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v37 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "menstruationSegment");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "days");
        v17 = v16;

        if (a3 >= v15 && a3 - v15 < v17)
        {

          return 3;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v11)
        continue;
      break;
    }
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HKMCAnalysis menstruationProjections](self->_analysis, "menstruationProjections", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v33;
    v5 = 2;
    while (2)
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v19);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * j);
        v25 = objc_msgSend(v24, "mostLikelyDays");
        if (a3 >= v25 && a3 - v25 < v26)
          goto LABEL_32;
        v28 = objc_msgSend(v24, "allDays");
        if (a3 >= v28 && a3 - v28 < v29)
        {
          v5 = 1;
LABEL_32:
          *a5 = objc_msgSend(v24, "isPartiallyLogged");

          return v5;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v21)
        continue;
      break;
    }
  }

  return 0;
}

- (unint64_t)_fertileWindowLevelWithDayIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int64_t v18;
  int64_t v19;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  int64_t v32;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  -[HKMCAnalysis cycles](self->_analysis, "cycles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        objc_msgSend(v10, "fertileWindowSegment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "fertileWindowSegment");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "days");
          v15 = v14 + v13 - 1;
          if (v14 <= 0)
            v15 = 0x7FFFFFFFFFFFFFFFLL;
          if (v15 == a3)
          {
            if (objc_msgSend(v10, "ovulationConfirmationType") == 1)
            {

LABEL_39:
              v25 = 3;
              goto LABEL_41;
            }
            v16 = objc_msgSend(v10, "ovulationConfirmationType");

            if (v16 == 2)
              goto LABEL_39;
          }
          else
          {

          }
          objc_msgSend(v10, "fertileWindowSegment");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "days");
          v20 = v19;

          if (a3 >= v18 && a3 - v18 < v20)
          {
            v25 = 2;
            goto LABEL_41;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v7)
        continue;
      break;
    }
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  -[HKMCAnalysis fertileWindowProjections](self->_analysis, "fertileWindowProjections", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    v25 = 3;
LABEL_22:
    v26 = 0;
    while (1)
    {
      if (*(_QWORD *)v36 != v24)
        objc_enumerationMutation(v5);
      v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v26);
      if (objc_msgSend(v27, "predictionPrimarySource") == 3 || objc_msgSend(v27, "predictionPrimarySource") == 4)
      {
        v28 = objc_msgSend(v27, "allDays");
        v30 = v29 + v28 - 1;
        if (v29 <= 0)
          v30 = 0x7FFFFFFFFFFFFFFFLL;
        if (v30 == a3)
          break;
      }
      v31 = objc_msgSend(v27, "allDays");
      if (a3 >= v31 && a3 - v31 < v32)
      {
        v25 = 1;
        break;
      }
      if (v23 == ++v26)
      {
        v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v23)
          goto LABEL_22;
        goto LABEL_36;
      }
    }
  }
  else
  {
LABEL_36:
    v25 = 0;
  }
LABEL_41:

  return v25;
}

- (void)_updateManagedDayRangeIfNeeded
{
  uint64_t start;
  uint64_t duration;
  int64_t v5;
  uint64_t v6;
  int64_t prefetchDuration;
  int64_t minimumBufferDuration;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int64_t v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int64_t v22;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _QWORD v34[5];
  _QWORD v35[5];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  HKMCViewModelProvider *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  start = self->_managedDayRange.start;
  duration = self->_managedDayRange.duration;
  HKIntersectionDayIndexRange();
  v5 = self->_managedDayRange.start;
  if (v6)
  {
    minimumBufferDuration = self->_minimumBufferDuration;
    prefetchDuration = self->_prefetchDuration;
    v9 = self->_maximumActiveDuration + 2 * prefetchDuration;
    v10 = self->_activeDayRange.start;
    if (v10 < minimumBufferDuration + v5)
    {
      if (v5 >= v10)
        v11 = self->_activeDayRange.start;
      else
        v11 = self->_managedDayRange.start;
      start = v11 - prefetchDuration;
      v12 = self->_managedDayRange.duration;
      v13 = v5 + v12 - 1;
      v14 = v12 <= 0;
      v15 = 0x7FFFFFFFFFFFFFFFLL;
      if (!v14)
        v15 = v13;
      v16 = v15 - start;
      if (v9 >= v16 + 1)
        duration = v16 + 1;
      else
        duration = self->_maximumActiveDuration + 2 * prefetchDuration;
    }
    v17 = self->_activeDayRange.duration;
    v18 = v10 + v17 - 1;
    v14 = v17 <= 0;
    v19 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14)
      v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (duration > 0)
      v19 = duration + start - 1;
    if (v18 > v19 - minimumBufferDuration)
    {
      if (v19 <= v18)
        v20 = v18;
      else
        v20 = v19;
      v21 = v20 + prefetchDuration;
      if (v9 >= v21 - start + 1)
        duration = v21 - start + 1;
      else
        duration = v9;
      start = v21 - duration + 1;
    }
  }
  else
  {
    v22 = self->_prefetchDuration;
    start = self->_activeDayRange.start - v22;
    duration = self->_activeDayRange.duration + 2 * v22;
  }
  if (v5 != start || self->_managedDayRange.duration != duration)
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "hk_indexSetWithDayIndexRange:");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "hk_indexSetWithDayIndexRange:", start, duration);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    self->_managedDayRange.start = start;
    self->_managedDayRange.duration = duration;
    _HKInitializeLogging();
    v26 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v27 = v26;
      v28 = (void *)objc_opt_class();
      v29 = v28;
      NSStringFromHKDayIndexRange();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v37 = v28;
      v38 = 2048;
      v39 = self;
      v40 = 2114;
      v41 = v30;
      _os_log_impl(&dword_218A9C000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Updated managed day range: %{public}@", buf, 0x20u);

    }
    objc_msgSend(v24, "hk_indexSetSubtractingIndexes:", v25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = MEMORY[0x24BDAC760];
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __55__HKMCViewModelProvider__updateManagedDayRangeIfNeeded__block_invoke;
    v35[3] = &unk_24D99DB38;
    v35[4] = self;
    objc_msgSend(v31, "hk_enumerateDayIndexRangesUsingBlock:", v35);
    objc_msgSend(v25, "hk_indexSetSubtractingIndexes:", v24);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v32;
    v34[1] = 3221225472;
    v34[2] = __55__HKMCViewModelProvider__updateManagedDayRangeIfNeeded__block_invoke_2;
    v34[3] = &unk_24D99DB38;
    v34[4] = self;
    objc_msgSend(v33, "hk_enumerateDayIndexRangesUsingBlock:", v34);
    if (self->_shouldFetchCycleFactors)
      -[HKMCCycleFactorsDataSourceProviding startObservingCycleFactorsInDayIndexRange:](self->_cycleFactorsDataSource, "startObservingCycleFactorsInDayIndexRange:", start, duration);

  }
}

void __55__HKMCViewModelProvider__updateManagedDayRangeIfNeeded__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "cancelFetchForDaySummariesInDayIndexRange:", a2, a3);
  objc_msgSend(*(id *)(a1 + 32), "_setFetchState:forDayIndexRange:", 0, v4, a3);
  v6 = v4 + a3;
  do
  {
    do
    {
      v7 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v8);

      ++v4;
    }
    while (a3 < 1);
  }
  while (v6 > v4);
}

uint64_t __55__HKMCViewModelProvider__updateManagedDayRangeIfNeeded__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(a1 + 32), "_setFetchState:forDayIndexRange:", 1, a2, a3);
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "fetchDaySummariesInDayIndexRange:", a2, a3);
}

- (int64_t)_fetchStateForDayIndex:(int64_t)a3
{
  if ((-[NSMutableIndexSet containsIndex:](self->_fetchCompletedDayIndexes, "containsIndex:") & 1) != 0)
    return 2;
  else
    return -[NSMutableIndexSet containsIndex:](self->_fetchStartedDayIndexes, "containsIndex:", a3);
}

- (void)_setFetchState:(int64_t)a3 forDayIndexRange:(id)a4
{
  int64_t var1;
  int64_t var0;
  NSMutableIndexSet **p_fetchStartedDayIndexes;
  NSMutableIndexSet **p_fetchCompletedDayIndexes;
  NSMutableIndexSet *fetchCompletedDayIndexes;
  void *v11;
  void *v12;

  var1 = a4.var1;
  var0 = a4.var0;
  if (a4.var0 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSRange NSRangeFromHKDayIndexRange(HKDayIndexRange)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("HKDayIndexRange.h"), 46, CFSTR("Cannot convert day index ranges less than 0 to NSRange"));

  }
  p_fetchStartedDayIndexes = &self->_fetchStartedDayIndexes;
  -[NSMutableIndexSet removeIndexesInRange:](self->_fetchStartedDayIndexes, "removeIndexesInRange:", var0, var1);
  fetchCompletedDayIndexes = self->_fetchCompletedDayIndexes;
  p_fetchCompletedDayIndexes = &self->_fetchCompletedDayIndexes;
  -[NSMutableIndexSet removeIndexesInRange:](fetchCompletedDayIndexes, "removeIndexesInRange:", var0, var1);
  if (a3 != 1)
  {
    if (a3 != 2)
      return;
    p_fetchStartedDayIndexes = p_fetchCompletedDayIndexes;
  }
  -[NSMutableIndexSet addIndexesInRange:](*p_fetchStartedDayIndexes, "addIndexesInRange:", var0, var1);
}

- (BOOL)_didFetchInitialAnalysis
{
  return self->_analysis != 0;
}

- (BOOL)_didFetchMinimumAnalysis
{
  HKMCViewModelProvider *v2;
  void *v3;
  uint64_t v4;

  v2 = self;
  -[HKMCAnalysis latestSampleInfo](self->_analysis, "latestSampleInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "anchor");
  LOBYTE(v2) = v4 >= -[NSNumber longLongValue](v2->_minimumAnalysisAnchor, "longLongValue");

  return (char)v2;
}

- (void)cycleFactorsDataSource:(id)a3 didFetchCycleFactors:(id)a4
{
  id v5;
  os_log_t *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  os_log_t v16;
  void *v17;
  void *v18;
  NSArray *v19;
  NSArray *cycleFactors;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  HKMCViewModelProvider *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _HKInitializeLogging();
  v6 = (os_log_t *)MEMORY[0x24BDD3030];
  v7 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_opt_class();
    v10 = (void *)MEMORY[0x24BDD16E0];
    v11 = v9;
    objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v9;
    v24 = 2048;
    v25 = self;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_218A9C000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Fetched %@ cycle factors", buf, 0x20u);

  }
  if (-[NSArray isEqualToArray:](self->_cycleFactors, "isEqualToArray:", v5))
  {
    objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "showSensitiveLogItems");

    if (v15)
    {
      _HKInitializeLogging();
      v16 = *v6;
      if (os_log_type_enabled(*v6, OS_LOG_TYPE_DEBUG))
        -[HKMCViewModelProvider cycleFactorsDataSource:didFetchCycleFactors:].cold.1(v16, (uint64_t)self);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", *MEMORY[0x24BDD3718], 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v17;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingDescriptors:", v18);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cycleFactors = self->_cycleFactors;
    self->_cycleFactors = v19;

    -[HKMCViewModelProvider _queue_notifyObserversDidUpdate](self, "_queue_notifyObserversDidUpdate");
  }

}

- (void)cycleFactorsDataSource:(id)a3 didUpdatePregnancyModel:(id)a4
{
  HKMCPregnancyModel *v6;
  HKMCPregnancyModel *lastPregnancyModel;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  int v16;
  id v17;
  __int16 v18;
  HKMCViewModelProvider *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = (HKMCPregnancyModel *)a4;
  lastPregnancyModel = self->_lastPregnancyModel;
  objc_msgSend(MEMORY[0x24BDD4198], "sharedBehavior");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "showSensitiveLogItems");

  if (lastPregnancyModel == v6)
  {
    if (v9)
    {
      _HKInitializeLogging();
      v13 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v14 = v13;
        v16 = 138543618;
        v17 = (id)objc_opt_class();
        v18 = 2048;
        v19 = self;
        v15 = v17;
        _os_log_impl(&dword_218A9C000, v14, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Skipping update due to identical pregnancy model", (uint8_t *)&v16, 0x16u);

      }
    }
  }
  else
  {
    if (v9)
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v16 = 138543618;
        v17 = (id)objc_opt_class();
        v18 = 2048;
        v19 = self;
        v12 = v17;
        _os_log_impl(&dword_218A9C000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Updated pregnancy model", (uint8_t *)&v16, 0x16u);

      }
    }
    objc_storeStrong((id *)&self->_lastPregnancyModel, a4);
    -[HKMCViewModelProvider _queue_notifyObserversDidUpdate](self, "_queue_notifyObserversDidUpdate");
  }

}

- (void)viewModelProviderDataSource:(id)a3 didFetchDaySummaries:(id)a4 forDayIndexRange:(id)a5 daySummaryAnchor:(id)a6
{
  int64_t var1;
  int64_t var0;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  void *v31;
  NSMutableDictionary *daySummariesByDayIndex;
  void *v33;
  NSNumber *minimumAnalysisAnchor;
  NSNumber *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint8_t v45[128];
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  HKMCViewModelProvider *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  var1 = a5.var1;
  var0 = a5.var0;
  v54 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  v35 = (NSNumber *)a6;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    v13 = (void *)objc_opt_class();
    v14 = (void *)MEMORY[0x24BDD16E0];
    v15 = v13;
    objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromHKDayIndexRange();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v47 = v13;
    v48 = 2048;
    v49 = self;
    v50 = 2112;
    v51 = v16;
    v52 = 2114;
    v53 = v17;
    _os_log_impl(&dword_218A9C000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Fetched %@ summaries in range: %{public}@", buf, 0x2Au);

  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[NSMutableDictionary allKeys](self->_daySummariesByDayIndex, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v41;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        v24 = objc_msgSend(v23, "integerValue");
        if (v24 >= var0 && v24 - var0 < var1)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_daySummariesByDayIndex, "setObject:forKeyedSubscript:", 0, v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v20);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v26 = v10;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v28; ++j)
      {
        if (*(_QWORD *)v37 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
        daySummariesByDayIndex = self->_daySummariesByDayIndex;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v31, "dayIndex"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](daySummariesByDayIndex, "setObject:forKeyedSubscript:", v31, v33);

      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v28);
  }

  -[HKMCViewModelProvider _setFetchState:forDayIndexRange:](self, "_setFetchState:forDayIndexRange:", 2, var0, var1);
  minimumAnalysisAnchor = self->_minimumAnalysisAnchor;
  self->_minimumAnalysisAnchor = v35;

  -[HKMCViewModelProvider _queue_notifyObserversDidUpdate](self, "_queue_notifyObserversDidUpdate");
}

- (void)viewModelProviderDataSourceDidUpdateDaySummaries:(id)a3
{
  void *v4;
  NSObject *v5;
  id v6;
  _BYTE v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)v7 = 138543618;
    *(_QWORD *)&v7[4] = objc_opt_class();
    *(_WORD *)&v7[12] = 2048;
    *(_QWORD *)&v7[14] = self;
    v6 = *(id *)&v7[4];
    _os_log_impl(&dword_218A9C000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Updated summaries", v7, 0x16u);

  }
  -[HKMCViewModelProviderDataSource fetchDaySummariesInDayIndexRange:](self->_dataSource, "fetchDaySummariesInDayIndexRange:", self->_managedDayRange.start, self->_managedDayRange.duration, *(_OWORD *)v7, *(_QWORD *)&v7[16], v8);
}

- (void)analysisProvider:(id)a3 didUpdateAnalysis:(id)a4
{
  HKMCAnalysis *v5;
  void *v6;
  NSObject *v7;
  id v8;
  HKMCAnalysis *analysis;
  int v10;
  id v11;
  __int16 v12;
  HKMCViewModelProvider *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = (HKMCAnalysis *)a4;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v6;
    v10 = 138543618;
    v11 = (id)objc_opt_class();
    v12 = 2048;
    v13 = self;
    v8 = v11;
    _os_log_impl(&dword_218A9C000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Updated analysis", (uint8_t *)&v10, 0x16u);

  }
  analysis = self->_analysis;
  self->_analysis = v5;

  -[HKMCViewModelProvider _queue_notifyObserversDidUpdate](self, "_queue_notifyObserversDidUpdate");
}

- (void)registerObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_queue_notifyObserversDidUpdate
{
  void *v3;
  NSObject *v4;
  void *v5;
  HKMCAnalysis *analysis;
  id v7;
  void *v8;
  void *v9;
  NSNumber *minimumAnalysisAnchor;
  int v11;
  void *v12;
  __int16 v13;
  HKMCViewModelProvider *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  NSNumber *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (-[HKMCViewModelProvider _didFetchInitialAnalysis](self, "_didFetchInitialAnalysis")
    && !-[HKMCViewModelProvider _didFetchMinimumAnalysis](self, "_didFetchMinimumAnalysis"))
  {
    _HKInitializeLogging();
    v3 = (void *)*MEMORY[0x24BDD3030];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
    {
      v4 = v3;
      v5 = (void *)objc_opt_class();
      analysis = self->_analysis;
      v7 = v5;
      -[HKMCAnalysis latestSampleInfo](analysis, "latestSampleInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      minimumAnalysisAnchor = self->_minimumAnalysisAnchor;
      v11 = 138544130;
      v12 = v5;
      v13 = 2048;
      v14 = self;
      v15 = 2114;
      v16 = v9;
      v17 = 2114;
      v18 = minimumAnalysisAnchor;
      _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Delaying notifying observers of updates due to outdated analysis: %{public}@ < %{public}@", (uint8_t *)&v11, 0x2Au);

    }
    -[_HKDelayedOperation execute](self->_notifyObserversOperation, "execute");
  }
  else
  {
    -[_HKDelayedOperation executeWithDelay:](self->_notifyObserversOperation, "executeWithDelay:", 0.0);
  }
}

- (void)_queue_runNotifyObserversOperationNow
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSHashTable *observers;
  id v8;
  void *v9;
  NSHashTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  HKMCViewModelProvider *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = (void *)objc_opt_class();
    v6 = (void *)MEMORY[0x24BDD16E0];
    observers = self->_observers;
    v8 = v5;
    objc_msgSend(v6, "numberWithUnsignedInteger:", -[NSHashTable count](observers, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v21 = v5;
    v22 = 2048;
    v23 = self;
    v24 = 2114;
    v25 = v9;
    _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Notifying %{public}@ observers of updates", buf, 0x20u);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_observers;
  v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "viewModelProviderDidUpdate:", self, (_QWORD)v15);
      }
      while (v12 != v14);
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)dealloc
{
  void *v3;
  NSObject *v4;
  id v5;
  objc_super v6;
  uint8_t buf[4];
  id v8;
  __int16 v9;
  HKMCViewModelProvider *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    *(_DWORD *)buf = 138543618;
    v8 = (id)objc_opt_class();
    v9 = 2048;
    v10 = self;
    v5 = v8;
    _os_log_impl(&dword_218A9C000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Dealloc", buf, 0x16u);

  }
  v6.receiver = self;
  v6.super_class = (Class)HKMCViewModelProvider;
  -[HKMCViewModelProvider dealloc](&v6, sel_dealloc);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)_test_managedDayRange
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_managedDayRange.duration;
  start = self->_managedDayRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (BOOL)_ppt_didFetchAnalysis
{
  return self->_analysis != 0;
}

- (BOOL)_ppt_didFetchDaySummaries
{
  return -[NSMutableIndexSet count](self->_fetchCompletedDayIndexes, "count") != 0;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)activeDayRange
{
  int64_t duration;
  int64_t start;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  duration = self->_activeDayRange.duration;
  start = self->_activeDayRange.start;
  result.var1 = duration;
  result.var0 = start;
  return result;
}

- (int64_t)minimumBufferDuration
{
  return self->_minimumBufferDuration;
}

- (int64_t)maximumActiveDuration
{
  return self->_maximumActiveDuration;
}

- (void)setMaximumActiveDuration:(int64_t)a3
{
  self->_maximumActiveDuration = a3;
}

- (HKCalendarCache)calendarCache
{
  return self->_calendarCache;
}

- (int64_t)todayDayIndex
{
  return self->_todayDayIndex;
}

- (void)setTodayDayIndex:(int64_t)a3
{
  self->_todayDayIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarCache, 0);
  objc_storeStrong((id *)&self->_notifyObserversOperation, 0);
  objc_storeStrong((id *)&self->_lastPregnancyModel, 0);
  objc_storeStrong((id *)&self->_analysis, 0);
  objc_storeStrong((id *)&self->_minimumAnalysisAnchor, 0);
  objc_storeStrong((id *)&self->_cycleFactors, 0);
  objc_storeStrong((id *)&self->_daySummariesByDayIndex, 0);
  objc_storeStrong((id *)&self->_fetchCompletedDayIndexes, 0);
  objc_storeStrong((id *)&self->_fetchStartedDayIndexes, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_analysisProvider, 0);
  objc_storeStrong((id *)&self->_cycleFactorsDataSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

- (void)_copyWithDataSource:(void *)a1 cycleFactorsDataSource:(uint64_t)a2 minimumBufferDuration:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  v8 = 138543874;
  v9 = (id)objc_opt_class();
  v10 = 2050;
  v11 = a2;
  v12 = 2050;
  v13 = a3;
  v6 = v9;
  OUTLINED_FUNCTION_0_0(&dword_218A9C000, v5, v7, "[%{public}@] Copying %{public}p to %{public}p", (uint8_t *)&v8);

}

- (void)setActiveDayRange:(void *)a1 .cold.1(void *a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = (void *)objc_opt_class();
  v5 = v4;
  NSStringFromHKDayIndexRange();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543874;
  v9 = v4;
  v10 = 2048;
  v11 = a2;
  v12 = 2114;
  v13 = v6;
  OUTLINED_FUNCTION_0_0(&dword_218A9C000, v3, v7, "[%{public}@:%p] Updated active day range: %{public}@", (uint8_t *)&v8);

}

- (void)cycleFactorsDataSource:(void *)a1 didFetchCycleFactors:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  NSObject *v3;
  id v4;
  int v5;
  id v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v5 = 138543618;
  v6 = (id)objc_opt_class();
  v7 = 2048;
  v8 = a2;
  v4 = v6;
  _os_log_debug_impl(&dword_218A9C000, v3, OS_LOG_TYPE_DEBUG, "[%{public}@:%p] No factors changed, skipping notifying observers", (uint8_t *)&v5, 0x16u);

}

@end
