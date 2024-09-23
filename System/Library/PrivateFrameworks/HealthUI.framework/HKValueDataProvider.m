@implementation HKValueDataProvider

- (HKValueDataProvider)initWithHealthStore:(id)a3 updateController:(id)a4 dateCache:(id)a5 displayType:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HKValueDataProvider *v15;
  HKValueDataProvider *v16;
  uint64_t v17;
  NSHashTable *observers;
  void *v19;
  void *v20;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKValueDataProvider;
  v15 = -[HKValueDataProvider init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_healthStore, a3);
    objc_storeStrong((id *)&v16->_dateCache, a5);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v17 = objc_claimAutoreleasedReturnValue();
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v17;

    if ((objc_msgSend(v14, "isActivitySummary") & 1) == 0)
    {
      objc_msgSend(v14, "sampleType");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addObserver:forType:", v16, v19);

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v16, sel__handleUnitPreferencesDidChangeNotification_, CFSTR("HKUnitPreferenceControllerUnitPreferencesDidChangeNotification"), 0);

    objc_storeStrong((id *)&v16->_displayType, a6);
    v16->_resultsLoaded = 0;
    -[HKDateCache registerObserver:](v16->_dateCache, "registerObserver:", v16);
  }

  return v16;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)HKValueDataProvider;
  -[HKValueDataProvider dealloc](&v4, sel_dealloc);
}

- (id)value
{
  -[HKValueDataProvider _refreshValueIfNecessary](self, "_refreshValueIfNecessary");
  return self->_value;
}

- (id)currentValue
{
  return 0;
}

- (id)secondaryValue
{
  return 0;
}

- (BOOL)hasLoadedData
{
  void *v3;
  BOOL resultsLoaded;

  -[HKValueDataProvider value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    resultsLoaded = 1;
  else
    resultsLoaded = self->_resultsLoaded;

  return resultsLoaded;
}

- (void)invalidateValue
{
  self->_resultsLoaded = 0;
  if (-[HKValueDataProvider _currentlyFetchingValue](self, "_currentlyFetchingValue"))
    -[HKValueDataProvider _setNeedsReFetchValue](self, "_setNeedsReFetchValue");
  -[HKValueDataProvider _alertObserversDidUpdateValues](self, "_alertObserversDidUpdateValues");
}

- (void)_setNeedsReFetchValue
{
  self->_needsToReFetchValue = 1;
}

- (BOOL)_currentlyFetchingValue
{
  return self->_outstandingFetchOperation != 0;
}

- (BOOL)_requiresValueFetch
{
  if (self->_resultsLoaded)
    return 0;
  else
    return !-[HKValueDataProvider _currentlyFetchingValue](self, "_currentlyFetchingValue");
}

- (void)_refreshValueIfNecessary
{
  if (-[HKValueDataProvider _requiresValueFetch](self, "_requiresValueFetch"))
    -[HKValueDataProvider _fetchValueWithRetryCount:](self, "_fetchValueWithRetryCount:", 3);
}

- (void)_fetchValueWithRetryCount:(int64_t)a3
{
  HKFetchOperation *v4;
  HKFetchOperation *outstandingFetchOperation;
  void *v6;
  _QWORD v7[6];

  if (a3)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke;
    v7[3] = &unk_1E9C41900;
    v7[4] = self;
    v7[5] = a3;
    -[HKValueDataProvider fetchOperationWithCompletion:](self, "fetchOperationWithCompletion:", v7);
    v4 = (HKFetchOperation *)objc_claimAutoreleasedReturnValue();
    outstandingFetchOperation = self->_outstandingFetchOperation;
    self->_outstandingFetchOperation = v4;

    -[HKFetchOperation setHighPriority:](self->_outstandingFetchOperation, "setHighPriority:", 1);
    +[HKOutstandingFetchOperationManager sharedOperationManager](HKOutstandingFetchOperationManager, "sharedOperationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addFetchOperation:", self->_outstandingFetchOperation);

  }
  else
  {
    -[HKValueDataProvider _transitionToFetchFailure](self, "_transitionToFetchFailure");
  }
}

void __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t v14;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke_2;
  v11[3] = &unk_1E9C418D8;
  v8 = *(_QWORD *)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v7;
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

uint64_t __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void **v3;
  void *v4;
  void *v5;

  v3 = (void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v2 + 24);
  *(_QWORD *)(v2 + 24) = 0;

  if (!*(_QWORD *)(a1 + 40))
    return objc_msgSend(*(id *)(a1 + 32), "_updateValueWithValue:", *(_QWORD *)(a1 + 48));
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
    __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke_2_cold_1(v3, v5, (uint64_t *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_fetchValueWithRetryCount:", *(_QWORD *)(a1 + 56) - 1);
}

- (void)_transitionToFetchFailure
{
  void *v3;
  NSObject *v4;
  void *v5;
  HKFetchOperation *outstandingFetchOperation;
  int v7;
  HKValueDataProvider *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    -[HKValueDataProvider displayType](self, "displayType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543618;
    v8 = self;
    v9 = 2112;
    v10 = v5;
    _os_log_impl(&dword_1D7813000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Reached max retry count for %@. Aborting", (uint8_t *)&v7, 0x16u);

  }
  outstandingFetchOperation = self->_outstandingFetchOperation;
  self->_outstandingFetchOperation = 0;

  self->_resultsLoaded = 0;
}

- (void)_updateValueWithValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
  self->_resultsLoaded = 1;
  if (self->_needsToReFetchValue)
  {
    *(_WORD *)&self->_resultsLoaded = 0;
    -[HKValueDataProvider _fetchValueWithRetryCount:](self, "_fetchValueWithRetryCount:", 3);
  }
  -[HKValueDataProvider didUpdateValue](self, "didUpdateValue");
  -[HKValueDataProvider _alertObserversDidUpdateValues](self, "_alertObserversDidUpdateValues");
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  _BOOL4 v7;
  id v10;

  v7 = a7;
  v10 = a6;
  if (objc_msgSend(a5, "count") || objc_msgSend(v10, "count") || v7)
    -[HKValueDataProvider invalidateValue](self, "invalidateValue");

}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_alertObserversDidUpdateValues
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = self->_observers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "dataProviderDidUpdateValues:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_handleUnitPreferencesDidChangeNotification:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HKValueDataProvider *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__HKValueDataProvider__handleUnitPreferencesDidChangeNotification___block_invoke;
  v6[3] = &unk_1E9C3FC50;
  v7 = v4;
  v8 = self;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __67__HKValueDataProvider__handleUnitPreferencesDidChangeNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  BOOL v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("HKUnitPreferenceControllerUnitPreferenceChangedKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "displayType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v7, "containsObject:", v4);
  else
    v5 = 0;
  if (objc_msgSend(v7, "count"))
    v6 = v5 == 0;
  else
    v6 = 0;
  if (!v6)
    objc_msgSend(*(id *)(a1 + 40), "unitPreferencesDidUpdate");

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_outstandingFetchOperation, 0);
  objc_storeStrong(&self->_value, 0);
}

- (id)fetchOperationWithCompletion:(id)a3
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

void __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke_2_cold_1(void **a1, void *a2, uint64_t *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = a2;
  objc_msgSend(v4, "displayType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a3;
  v8 = 138543874;
  v9 = v4;
  v10 = 2114;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  _os_log_error_impl(&dword_1D7813000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Received error fetching data for %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);

}

@end
