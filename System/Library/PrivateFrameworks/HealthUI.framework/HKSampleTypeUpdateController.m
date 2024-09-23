@implementation HKSampleTypeUpdateController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlePollTimer, 0);
  objc_storeStrong((id *)&self->_throttledDataBySampleType, 0);
  objc_storeStrong((id *)&self->_observersByType, 0);
  objc_storeStrong((id *)&self->_queryStatesByType, 0);
  objc_storeStrong((id *)&self->_outstandingQueriesByType, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (HKSampleTypeUpdateController)initWithHealthStore:(id)a3
{
  id v5;
  HKSampleTypeUpdateController *v6;
  HKSampleTypeUpdateController *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *outstandingQueriesByType;
  NSMutableDictionary *v10;
  NSMutableDictionary *queryStatesByType;
  NSMutableDictionary *v12;
  NSMutableDictionary *observersByType;
  void *v14;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *throttledDataBySampleType;
  NSTimer *throttlePollTimer;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HKSampleTypeUpdateController;
  v6 = -[HKSampleTypeUpdateController init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    outstandingQueriesByType = v7->_outstandingQueriesByType;
    v7->_outstandingQueriesByType = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queryStatesByType = v7->_queryStatesByType;
    v7->_queryStatesByType = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByType = v7->_observersByType;
    v7->_observersByType = v12;

    v7->_applicationIsInBackground = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v7, sel__applicationMovingToForeground_, *MEMORY[0x1E0DC4860], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v7, sel__applicationMovingToBackground_, *MEMORY[0x1E0DC4768], 0);

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    throttledDataBySampleType = v7->_throttledDataBySampleType;
    v7->_throttledDataBySampleType = v16;

    throttlePollTimer = v7->_throttlePollTimer;
    v7->_throttlePollTimer = 0;

  }
  return v7;
}

- (void)_applicationMovingToForeground:(id)a3
{
  self->_applicationIsInBackground = 0;
  -[HKSampleTypeUpdateController _resumeFailedQueries](self, "_resumeFailedQueries", a3);
}

- (void)_resumeFailedQueries
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  os_log_t *v8;
  uint64_t v9;
  void *v10;
  os_log_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  __int128 v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HKSampleTypeUpdateController _failedQuerySampleTypes](self, "_failedQuerySampleTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v18;
    v8 = (os_log_t *)MEMORY[0x1E0CB5378];
    *(_QWORD *)&v5 = 138543619;
    v15 = v5;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        _HKInitializeLogging();
        v11 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          v12 = v11;
          v13 = (void *)objc_opt_class();
          v16 = v13;
          objc_msgSend(v10, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v15;
          v22 = v13;
          v23 = 2113;
          v24 = v14;
          _os_log_error_impl(&dword_1D7813000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Resuming failed query from background (%{private}@)", buf, 0x16u);

        }
        -[HKSampleTypeUpdateController _errorRecoveryCallbacksForType:](self, "_errorRecoveryCallbacksForType:", v10, v15);
        -[HKSampleTypeUpdateController _createQueryForType:](self, "_createQueryForType:", v10);
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v6);
  }

}

- (id)_failedQuerySampleTypes
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_queryStatesByType;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_queryStatesByType, "objectForKeyedSubscript:", v9, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && objc_msgSend(v10, "integerValue") == 3)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_installThrottlingTimer
{
  void *v3;
  NSTimer *v4;
  NSTimer *throttlePollTimer;
  _QWORD v6[4];
  id v7;
  id location;

  if (!self->_throttlePollTimer)
  {
    objc_initWeak(&location, self);
    v3 = (void *)MEMORY[0x1E0C99E88];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __55__HKSampleTypeUpdateController__installThrottlingTimer__block_invoke;
    v6[3] = &unk_1E9C40170;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 1, v6, 1.0);
    v4 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    throttlePollTimer = self->_throttlePollTimer;
    self->_throttlePollTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __55__HKSampleTypeUpdateController__installThrottlingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_drainAllThrottledDataIfNecessary");

}

- (void)_removeThrottlingTimer
{
  NSTimer *throttlePollTimer;
  NSTimer *v4;

  throttlePollTimer = self->_throttlePollTimer;
  if (throttlePollTimer)
  {
    -[NSTimer invalidate](throttlePollTimer, "invalidate");
    v4 = self->_throttlePollTimer;
    self->_throttlePollTimer = 0;

  }
}

- (void)_drainAllThrottledDataIfNecessary
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_throttledDataBySampleType;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (!v4)
  {

LABEL_11:
    -[HKSampleTypeUpdateController _removeThrottlingTimer](self, "_removeThrottlingTimer", (_QWORD)v10);
    return;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v11;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v11 != v7)
        objc_enumerationMutation(v3);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_throttledDataBySampleType, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSampleTypeUpdateController _drainThrottledDataIfNecessary:recoveringFromError:](self, "_drainThrottledDataIfNecessary:recoveringFromError:", v9, 0);
      v6 |= objc_msgSend(v9, "incomingUpdateCountSinceLastDrain") > 2;

    }
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  }
  while (v5);

  if ((v6 & 1) == 0)
    goto LABEL_11;
}

- (void)_sendThrottledUpdatesToObservers:(id)a3 recoveringFromError:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id obj;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "throttledObservers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_msgSend(v6, "throttledSampleType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "throttledSamplesAdded");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "throttledDeletedObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "updateController:didReceiveUpdateForType:samplesAdded:objectsRemoved:recoveringFromError:", self, v12, v13, v14, v4);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

}

- (void)_drainThrottledDataIfNecessary:(id)a3 recoveringFromError:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = a4;
  v11 = a3;
  if (objc_msgSend(v11, "incomingUpdateCountSinceLastDrain"))
  {
    objc_msgSend(v11, "throttledObservers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      if (objc_msgSend(v11, "incomingUpdateCountSinceLastDrain") > 2)
      {
        -[HKSampleTypeUpdateController _installThrottlingTimer](self, "_installThrottlingTimer");
        v8 = CACurrentMediaTime();
        if (v4 || (v9 = v8, objc_msgSend(v11, "lastDrainTime"), v8 = v9 - v10, v8 >= 1.0))
        {
          -[HKSampleTypeUpdateController _sendThrottledUpdatesToObservers:recoveringFromError:](self, "_sendThrottledUpdatesToObservers:recoveringFromError:", v11, v4, v8);
          objc_msgSend(v11, "clearThrottlingData");
          objc_msgSend(v11, "updateDrainTime");
        }
      }
      else
      {
        -[HKSampleTypeUpdateController _sendThrottledUpdatesToObservers:recoveringFromError:](self, "_sendThrottledUpdatesToObservers:recoveringFromError:", v11, v4);
        objc_msgSend(v11, "clearThrottlingData");
      }
    }
  }

}

- (void)addObserver:(id)a3 forType:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[HKSampleTypeUpdateController _observersForType:](self, "_observersForType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);
  if (-[HKSampleTypeUpdateController _typeRequiresNewQuery:](self, "_typeRequiresNewQuery:", v6))
    -[HKSampleTypeUpdateController _createQueryForType:](self, "_createQueryForType:", v6);
  else
    objc_msgSend(v8, "updateController:didReceiveUpdateForType:samplesAdded:objectsRemoved:recoveringFromError:", self, v6, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 0);

}

- (void)removeObserver:(id)a3 forType:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    v22[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKSampleTypeUpdateController _allObservedTypes](self, "_allObservedTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[HKSampleTypeUpdateController _observersForType:](self, "_observersForType:", v15, (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObject:", v6);
        if (!objc_msgSend(v16, "count"))
          -[HKSampleTypeUpdateController _removeQueryForType:queryState:](self, "_removeQueryForType:queryState:", v15, 0);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

}

- (id)_observersForType:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observersByType, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 5);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observersByType, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (id)_findThrottledUpdateData:(id)a3
{
  id v4;
  HKThrottledUpdateData *v5;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_throttledDataBySampleType, "objectForKeyedSubscript:", v4);
  v5 = (HKThrottledUpdateData *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[HKThrottledUpdateData initWithSampleType:]([HKThrottledUpdateData alloc], "initWithSampleType:", v4);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_throttledDataBySampleType, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (void)_callObservers:(id)a3 withType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  _BOOL8 v7;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;

  v7 = a7;
  v19 = a4;
  v13 = (void *)MEMORY[0x1E0CB3978];
  v14 = a6;
  v15 = a5;
  v16 = a3;
  if ((objc_msgSend(v13, "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKSampleTypeUpdateController.m"), 214, CFSTR("HKSampleTypeUpdateController _callObservers must be delivered on main thread"));

  }
  -[HKSampleTypeUpdateController _findThrottledUpdateData:](self, "_findThrottledUpdateData:", v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addThrottledObservers:samplesAdded:objectsRemoved:", v16, v15, v14);

  -[HKSampleTypeUpdateController _drainThrottledDataIfNecessary:recoveringFromError:](self, "_drainThrottledDataIfNecessary:recoveringFromError:", v17, v7);
}

- (id)_allObservedTypes
{
  return (id)-[NSMutableDictionary allKeys](self->_observersByType, "allKeys");
}

- (BOOL)isQueryStateRunningForType:(id)a3
{
  return -[HKSampleTypeUpdateController _queryStateForType:](self, "_queryStateForType:", a3) == 2;
}

- (BOOL)_typeRequiresNewQuery:(id)a3
{
  return (unint64_t)(-[HKSampleTypeUpdateController _queryStateForType:](self, "_queryStateForType:", a3) - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (int64_t)_queryStateForType:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_queryStatesByType, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "integerValue");
  else
    v5 = 0;

  return v5;
}

- (void)_setQueryState:(int64_t)a3 forType:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a4;
  objc_msgSend(v6, "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queryStatesByType, "setObject:forKeyedSubscript:", v8, v7);

}

- (BOOL)_isHighFrequencyDataType:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *MEMORY[0x1E0CB5C78];
    v9[0] = *MEMORY[0x1E0CB5CA8];
    v9[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "containsObject:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_createQueryForType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[6];
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD aBlock[5];
  id v38;
  uint8_t v39[128];
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKSampleTypeUpdateController _setQueryState:forType:](self, "_setQueryState:forType:", 1, v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke;
  aBlock[3] = &unk_1E9C436B0;
  aBlock[4] = self;
  v7 = v4;
  v38 = v7;
  v8 = _Block_copy(aBlock);
  v9 = objc_alloc(MEMORY[0x1E0CB62C0]);
  objc_msgSend(MEMORY[0x1E0CB6A80], "latestAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v6;
  v35[1] = 3221225472;
  v35[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_3;
  v35[3] = &unk_1E9C436D8;
  v11 = v8;
  v36 = v11;
  v12 = (void *)objc_msgSend(v9, "initWithType:predicate:anchor:limit:resultsHandler:", v7, 0, v10, 0, v35);

  v33[0] = v6;
  v33[1] = 3221225472;
  v33[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_4;
  v33[3] = &unk_1E9C436D8;
  v13 = v11;
  v34 = v13;
  objc_msgSend(v12, "setUpdateHandler:", v33);
  objc_msgSend(v5, "addObject:", v12);
  if (-[HKSampleTypeUpdateController _isHighFrequencyDataType:](self, "_isHighFrequencyDataType:", v7))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v41 = __Block_byref_object_copy__13;
    v42 = __Block_byref_object_dispose__13;
    v43 = v7;
    v32[0] = v6;
    v32[1] = 3221225472;
    v32[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_207;
    v32[3] = &unk_1E9C43700;
    v32[4] = self;
    v32[5] = buf;
    v14 = _Block_copy(v32);
    v15 = (void *)MEMORY[0x1E0CB6A78];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "predicateForSamplesWithStartDate:endDate:options:", v16, 0, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0CB6980]);
    v19 = (void *)objc_msgSend(v18, "initWithSampleType:predicate:updateHandler:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v17, v14);
    objc_msgSend(v19, "setObserveUnfrozenSeries:", 1);
    objc_msgSend(v5, "addObject:", v19);

    _Block_object_dispose(buf, 8);
  }
  _HKInitializeLogging();
  v20 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_DEBUG))
  {
    v25 = v20;
    v26 = objc_msgSend(v5, "count");
    objc_msgSend(v7, "description");
    v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v26;
    *(_WORD *)&buf[22] = 2112;
    v41 = v27;
    _os_log_debug_impl(&dword_1D7813000, v25, OS_LOG_TYPE_DEBUG, "HKSampleTypeUpdateController(%p): ChartDataUpdate: installing %ld queries for type %@", buf, 0x20u);

  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v21 = v5;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
  if (v22)
  {
    v23 = *(_QWORD *)v29;
    do
    {
      v24 = 0;
      do
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v21);
        -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v24++), (_QWORD)v28);
      }
      while (v22 != v24);
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v28, v39, 16);
    }
    while (v22);
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_outstandingQueriesByType, "setObject:forKeyedSubscript:", v21, v7);
}

void __52__HKSampleTypeUpdateController__createQueryForType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  id v17;
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_2;
  block[3] = &unk_1E9C43688;
  v10 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v15 = v10;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQueryCallbackForType:samplesAdded:objectsDeleted:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_207(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4)
    return objc_msgSend(*(id *)(result + 32), "_handleHighFrequencyObserverCallbacksForType:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40));
  return result;
}

- (void)_removeQueryForType:(id)a3 queryState:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_outstandingQueriesByType, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  -[NSMutableDictionary removeObjectForKey:](self->_outstandingQueriesByType, "removeObjectForKey:", v6);
  -[HKSampleTypeUpdateController _setQueryState:forType:](self, "_setQueryState:forType:", a4, v6);

}

- (void)_handleQueryCallbackForType:(id)a3 samplesAdded:(id)a4 objectsDeleted:(id)a5 error:(id)a6
{
  if (a6)
    -[HKSampleTypeUpdateController _handleQueryErrorForType:error:](self, "_handleQueryErrorForType:error:", a3, a6, a5);
  else
    -[HKSampleTypeUpdateController _handleQuerySuccessForType:samplesAdded:objectsRemoved:](self, "_handleQuerySuccessForType:samplesAdded:objectsRemoved:", a3, a4, a5);
}

- (void)_handleQueryErrorForType:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  os_log_t v10;
  dispatch_time_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB5378];
  v9 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
  {
    v12 = v9;
    v13 = (void *)objc_opt_class();
    v14 = v13;
    objc_msgSend(v6, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543875;
    v19 = v13;
    v20 = 2113;
    v21 = v15;
    v22 = 2114;
    v23 = v7;
    _os_log_error_impl(&dword_1D7813000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Sample type error (%{private}@): %{public}@", buf, 0x20u);

  }
  -[HKSampleTypeUpdateController _removeQueryForType:queryState:](self, "_removeQueryForType:queryState:", v6, 3);
  if (self->_applicationIsInBackground)
  {
    _HKInitializeLogging();
    v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[HKSampleTypeUpdateController _handleQueryErrorForType:error:].cold.1(v10);
  }
  else
  {
    v11 = dispatch_time(0, 500000000);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__HKSampleTypeUpdateController__handleQueryErrorForType_error___block_invoke;
    v16[3] = &unk_1E9C3FC50;
    v16[4] = self;
    v17 = v6;
    dispatch_after(v11, MEMORY[0x1E0C80D38], v16);

  }
}

uint64_t __63__HKSampleTypeUpdateController__handleQueryErrorForType_error___block_invoke(uint64_t a1)
{
  void *v2;

  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
    __63__HKSampleTypeUpdateController__handleQueryErrorForType_error___block_invoke_cold_1(a1, v2);
  objc_msgSend(*(id *)(a1 + 32), "_errorRecoveryCallbacksForType:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_createQueryForType:", *(_QWORD *)(a1 + 40));
}

- (void)_handleQuerySuccessForType:(id)a3 samplesAdded:(id)a4 objectsRemoved:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  HKSampleTypeUpdateController *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HKSampleTypeUpdateController _setQueryState:forType:](self, "_setQueryState:forType:", 2, v8);
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB5378];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_DEBUG))
  {
    v14 = v11;
    objc_msgSend(v8, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218755;
    v17 = self;
    v18 = 2113;
    v19 = v15;
    v20 = 2048;
    v21 = objc_msgSend(v9, "count");
    v22 = 2048;
    v23 = objc_msgSend(v10, "count");
    _os_log_debug_impl(&dword_1D7813000, v14, OS_LOG_TYPE_DEBUG, "HKSampleTypeUpdateController(%p, %{private}@): ChartDataUpdate: adding %ld objects, removing %ld objects", (uint8_t *)&v16, 0x2Au);

  }
  -[HKSampleTypeUpdateController _observersForType:](self, "_observersForType:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSampleTypeUpdateController _callObservers:withType:samplesAdded:objectsRemoved:recoveringFromError:](self, "_callObservers:withType:samplesAdded:objectsRemoved:recoveringFromError:", v13, v8, v9, v10, 0);

}

- (void)_handleHighFrequencyObserverCallbacksForType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  HKSampleTypeUpdateController *v10;
  id v11;

  v4 = a3;
  -[HKSampleTypeUpdateController _observersForType:](self, "_observersForType:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__HKSampleTypeUpdateController__handleHighFrequencyObserverCallbacksForType___block_invoke;
  block[3] = &unk_1E9C3FB90;
  v9 = v5;
  v10 = self;
  v11 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __77__HKSampleTypeUpdateController__handleHighFrequencyObserverCallbacksForType___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "updateController:didReceiveHighFrequencyUpdateForType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_errorRecoveryCallbacksForType:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[HKSampleTypeUpdateController _observersForType:](self, "_observersForType:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSampleTypeUpdateController _callObservers:withType:samplesAdded:objectsRemoved:recoveringFromError:](self, "_callObservers:withType:samplesAdded:objectsRemoved:recoveringFromError:", v5, v6, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], 1);

  if (-[HKSampleTypeUpdateController _isHighFrequencyDataType:](self, "_isHighFrequencyDataType:", v6))
    -[HKSampleTypeUpdateController _handleHighFrequencyObserverCallbacksForType:](self, "_handleHighFrequencyObserverCallbacksForType:", v6);

}

- (void)_applicationMovingToBackground:(id)a3
{
  self->_applicationIsInBackground = 1;
}

- (void)_handleQueryErrorForType:(void *)a1 error:.cold.1(void *a1)
{
  NSObject *v1;
  id v2;
  int v3;
  id v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v3 = 138543362;
  v4 = (id)objc_opt_class();
  v2 = v4;
  _os_log_error_impl(&dword_1D7813000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Error occurred in background.  Query will be resumed in foreground", (uint8_t *)&v3, 0xCu);

}

void __63__HKSampleTypeUpdateController__handleQueryErrorForType_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(void **)(a1 + 40);
  v6 = v4;
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543619;
  v9 = v4;
  v10 = 2113;
  v11 = v7;
  _os_log_error_impl(&dword_1D7813000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Resuming failed query from foreground (%{private}@)", (uint8_t *)&v8, 0x16u);

}

@end
