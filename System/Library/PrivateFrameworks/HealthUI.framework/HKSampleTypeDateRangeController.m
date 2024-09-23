@implementation HKSampleTypeDateRangeController

void __53__HKSampleTypeDateRangeController__resultsDidUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v5, "startDate");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v6);

}

void __48__HKSampleTypeDateRangeController__beginUpdates__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__HKSampleTypeDateRangeController__beginUpdates__block_invoke_2;
  block[3] = &unk_1E9C42438;
  v11 = v7;
  v8 = v7;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  v12 = v6;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v13);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRangesBySampleType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dateRangeQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (HKSampleTypeDateRangeController)initWithHealthStore:(id)a3
{
  id v5;
  HKSampleTypeDateRangeController *v6;
  HKSampleTypeDateRangeController *v7;
  uint64_t v8;
  NSHashTable *observers;
  void *v10;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSampleTypeDateRangeController;
  v6 = -[HKSampleTypeDateRangeController init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    *(_WORD *)&v7->_applicationIsInForeground = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__applicationMovingToForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel__applicationMovingToBackground_, *MEMORY[0x1E0DC4768], 0);

    -[HKSampleTypeDateRangeController _beginUpdates](v7, "_beginUpdates");
  }

  return v7;
}

- (void)_beginUpdates
{
  id v3;
  _HKDateRangeQuery *v4;
  _HKDateRangeQuery *dateRangeQuery;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_alloc(MEMORY[0x1E0CB6F68]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __48__HKSampleTypeDateRangeController__beginUpdates__block_invoke;
  v10 = &unk_1E9C42460;
  objc_copyWeak(&v11, &location);
  v4 = (_HKDateRangeQuery *)objc_msgSend(v3, "initWithDateIntervalHandler:", &v7);
  dateRangeQuery = self->_dateRangeQuery;
  self->_dateRangeQuery = v4;

  -[HKSampleTypeDateRangeController name](self, "name", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKDateRangeQuery setDebugIdentifier:](self->_dateRangeQuery, "setDebugIdentifier:", v6);

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_dateRangeQuery);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (NSString)name
{
  return self->_name;
}

void __48__HKSampleTypeDateRangeController__beginUpdates__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = WeakRetained;
  if (v2)
    objc_msgSend(WeakRetained, "_updateHandlerDidReceiveError:", *(_QWORD *)(a1 + 32));
  else
    objc_msgSend(WeakRetained, "_resultsDidUpdate:", *(_QWORD *)(a1 + 40));

}

- (void)_resultsDidUpdate:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  NSDictionary *v7;
  NSDictionary *dateRangesBySampleType;
  NSDictionary *v9;
  _QWORD v10[4];
  NSDictionary *v11;

  self->_lastQuerySufferedError = 0;
  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__HKSampleTypeDateRangeController__resultsDidUpdate___block_invoke;
  v10[3] = &unk_1E9C42488;
  v7 = (NSDictionary *)v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v10);

  dateRangesBySampleType = self->_dateRangesBySampleType;
  self->_dateRangesBySampleType = v7;
  v9 = v7;

  -[HKSampleTypeDateRangeController _alertObserversDidUpdateDateRanges](self, "_alertObserversDidUpdateDateRanges");
}

- (void)_alertObserversDidUpdateDateRanges
{
  void *v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 24);
  v4 = a2;
  v5 = 134218240;
  v6 = a1;
  v7 = 2048;
  v8 = objc_msgSend(v3, "count");
  _os_log_debug_impl(&dword_1D7813000, v4, OS_LOG_TYPE_DEBUG, "HKSampleTypeDateRangeController(%p): ChartDataUpdate: Alerting %ld observers of new date ranges", (uint8_t *)&v5, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

- (void)dealloc
{
  objc_super v3;

  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_dateRangeQuery);
  v3.receiver = self;
  v3.super_class = (Class)HKSampleTypeDateRangeController;
  -[HKSampleTypeDateRangeController dealloc](&v3, sel_dealloc);
}

- (void)_applicationMovingToForeground:(id)a3
{
  self->_applicationIsInForeground = 1;
  if (self->_lastQuerySufferedError)
    -[HKSampleTypeDateRangeController _beginUpdates](self, "_beginUpdates", a3);
}

- (id)dateRangeForSampleType:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  HKValueRange *v7;
  HKValueRange *v8;

  -[HKSampleTypeDateRangeController _dateRangeSampleTypeForSampleType:](self, "_dateRangeSampleTypeForSampleType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_dateRangesBySampleType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = objc_alloc_init(HKValueRange);
  v8 = v7;

  return v8;
}

- (id)_dateRangeSampleTypeForSampleType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0CB7148];

  if (v4 == v5)
  {
    objc_msgSend(MEMORY[0x1E0CB6380], "categoryTypeForIdentifier:", *MEMORY[0x1E0CB4980]);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = v3;
  }
  v7 = v6;

  return v7;
}

- (void)_applicationMovingToBackground:(id)a3
{
  self->_applicationIsInForeground = 0;
}

- (void)addObserver:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);
  if (self->_dateRangesBySampleType)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __47__HKSampleTypeDateRangeController_addObserver___block_invoke;
    v5[3] = &unk_1E9C3FC50;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

uint64_t __47__HKSampleTypeDateRangeController_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_alertObserverDidUpdateDateRanges:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_alertObserverDidUpdateDateRanges:(id)a3
{
  objc_msgSend(a3, "sampleTypeDateRangeController:didUpdateDateRanges:", self, self->_dateRangesBySampleType);
}

- (void)_updateHandlerDidReceiveError:(id)a3
{
  id v4;
  _HKDateRangeQuery *dateRangeQuery;
  void *v6;
  void *v7;
  dispatch_time_t v8;
  _QWORD block[5];

  v4 = a3;
  self->_lastQuerySufferedError = 1;
  -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", self->_dateRangeQuery);
  dateRangeQuery = self->_dateRangeQuery;
  self->_dateRangeQuery = 0;

  if (self->_applicationIsInForeground && (HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[HKSampleTypeDateRangeController _updateHandlerDidReceiveError:].cold.2(v7, (uint64_t)self, (uint64_t)v4);
    v8 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__HKSampleTypeDateRangeController__updateHandlerDidReceiveError___block_invoke;
    block[3] = &unk_1E9C3F0D0;
    block[4] = self;
    dispatch_after(v8, MEMORY[0x1E0C80D38], block);
  }
  else
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E0CB5378];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
      -[HKSampleTypeDateRangeController _updateHandlerDidReceiveError:].cold.1(v6, (uint64_t)self, (uint64_t)v4);
  }

}

uint64_t __65__HKSampleTypeDateRangeController__updateHandlerDidReceiveError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginUpdates");
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)dateRangesBySampleType
{
  return self->_dateRangesBySampleType;
}

- (void)_updateHandlerDidReceiveError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  id v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v7 = 138543618;
  v8 = (id)OUTLINED_FUNCTION_3_3();
  v9 = 2114;
  v10 = a3;
  v6 = v8;
  _os_log_error_impl(&dword_1D7813000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring background date range error: %{public}@", (uint8_t *)&v7, 0x16u);

  OUTLINED_FUNCTION_0_2();
}

- (void)_updateHandlerDidReceiveError:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  id v5;
  id v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v7 = 138543874;
  v8 = (id)OUTLINED_FUNCTION_3_3();
  v9 = 2048;
  v10 = 0x3FE0000000000000;
  v11 = 2114;
  v12 = a3;
  v6 = v8;
  _os_log_error_impl(&dword_1D7813000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Retrying after %lg seconds due to foreground date range error: %{public}@", (uint8_t *)&v7, 0x20u);

}

@end
