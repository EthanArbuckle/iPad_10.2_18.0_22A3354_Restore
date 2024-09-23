@implementation HDQueryServer

- (NSUUID)queryUUID
{
  return self->_queryUUID;
}

- (HDHealthStoreClient)client
{
  return self->_client;
}

- (HKSampleType)sampleType
{
  HKObjectType *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_objectType;
  else
    v3 = 0;
  return (HKSampleType *)v3;
}

- (_HKFilter)filter
{
  return self->_filter;
}

- (void)setQueryDidFinishHandler:(id)a3
{
  id v4;
  NSObject *queryQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queryQueue = self->_queryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__HDQueryServer_setQueryDidFinishHandler___block_invoke;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queryQueue, block);

}

- (void)onQueue:(id)a3
{
  dispatch_async((dispatch_queue_t)self->_queryQueue, a3);
}

void __42__HDQueryServer_setQueryDidFinishHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

}

- (void)_queue_setQueryState:(uint64_t)a1
{
  unsigned int *v4;
  signed int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t v13;

  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    v4 = (unsigned int *)(a1 + 72);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(a2, v4));
    v6 = v5;
    if (v5 != a2)
      objc_msgSend((id)a1, "_queue_didChangeStateFromPreviousState:state:", v5, a2);
    v7 = _Block_copy(*(const void **)(a1 + 184));
    v8 = v7;
    if (v7)
    {
      v9 = *(NSObject **)(a1 + 88);
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __38__HDQueryServer__queue_setQueryState___block_invoke;
      v10[3] = &unk_1E6CFF510;
      v10[4] = a1;
      v11 = v7;
      v12 = v6;
      v13 = a2;
      dispatch_async(v9, v10);

    }
  }
}

- (void)scheduleDatabaseAccessOnQueueWithBlock:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HDQueryServer_scheduleDatabaseAccessOnQueueWithBlock___block_invoke;
  v9[3] = &unk_1E6CF2920;
  objc_copyWeak(&v11, &location);
  v8 = v4;
  v10 = v8;
  objc_msgSend(v7, "scheduleDatabaseAccessForQueryServer:block:", self, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __56__HDQueryServer_scheduleDatabaseAccessOnQueueWithBlock___block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  char v4;
  NSObject *v5;
  NSObject **v6;
  _QWORD block[4];
  id v8;

  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v4 = objc_msgSend(WeakRetained, "_shouldStopProcessingQuery");
    v3 = v6;
    if ((v4 & 1) == 0)
    {
      v5 = v6[17];
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __56__HDQueryServer_scheduleDatabaseAccessOnQueueWithBlock___block_invoke_2;
      block[3] = &unk_1E6CE7DE0;
      v8 = *(id *)(a1 + 32);
      dispatch_sync(v5, block);

      v3 = v6;
    }
  }

}

- (BOOL)_shouldStopProcessingQuery
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldFinish);
  return v2 & 1;
}

uint64_t __56__HDQueryServer_scheduleDatabaseAccessOnQueueWithBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __36__HDQueryServer__scheduleStartQuery__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  int v5;
  HDDatabaseTransactionContextStatistics *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 128));
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "behavior");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isAppleInternalInstall");

  if (v5)
  {
    v6 = objc_alloc_init(HDDatabaseTransactionContextStatistics);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(void **)(v7 + 96);
    *(_QWORD *)(v7 + 96) = v6;

  }
  v9 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__HDQueryServer__scheduleStartQuery__block_invoke_2;
  v10[3] = &unk_1E6CED650;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  v10[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "scheduleDatabaseAccessOnQueueWithBlock:", v10);
  objc_destroyWeak(&v11);
}

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  void *v2;
  void *v3;
  BOOL v4;

  -[HDQueryServer client](self, "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityAssertions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)_shouldListenForUpdates
{
  return 0;
}

- (HKQueryClientInterface)clientProxy
{
  void *v2;
  void *v3;

  -[HDHealthStoreClient connection](self->_client, "connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (HKQueryClientInterface *)v3;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HDHealthStoreClient process](self->_client, "process");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQueryServerConfiguration debugIdentifier](self->_configuration, "debugIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQueryServerConfiguration qualityOfService](self->_configuration, "qualityOfService");
  -[HDQueryServer _queryStateString]((__CFString *)self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKCopyQueryDescription();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (__CFString)_queryStateString
{
  unint64_t v1;

  if (result)
  {
    v1 = -[__CFString queryState](result, "queryState");
    if (v1 > 4)
      return CFSTR("Unknown state");
    else
      return off_1E6CFF5B8[v1];
  }
  return result;
}

- (void)_queue_start
{
  void *v4;

  if (-[HDQueryServer queryState](self, "queryState") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQueryServer.m"), 799, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.queryState == HDQueryServerStateRunning"));

  }
  if (-[HDQueryServer _shouldListenForUpdates](self, "_shouldListenForUpdates"))
    -[HDQueryServer _queue_beginObservingDataTypes]((uint64_t)self);
}

- (void)_queue_beginObservingDataTypes
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1 && !*(_BYTE *)(a1 + 77))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
    objc_msgSend(WeakRetained, "dataManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_loadWeakRetained((id *)(a1 + 128));
    objc_msgSend(v4, "associationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)a1, "_shouldObserveAllSampleTypes"))
    {
      objc_msgSend(v3, "addObserverForAllTypes:", a1);
      objc_msgSend(v5, "addObserverForAllTypes:", a1);
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend((id)a1, "objectTypes", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
            objc_msgSend(v3, "addObserver:forDataType:", a1, v11);
            objc_msgSend(v5, "addObserver:forDataType:", a1, v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

    }
    *(_BYTE *)(a1 + 77) = 1;

  }
}

- (BOOL)_shouldObserveAllSampleTypes
{
  return 0;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setCollectionInterval:(double)a3
{
  self->_collectionInterval = a3;
}

- (void)_queue_transitionToPaused
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    v2 = objc_msgSend(a1, "queryState");
    if (v2 == 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_transitionToPaused, a1, CFSTR("HDQueryServer.m"), 489, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryServerState != HDQueryServerStatePaused"));
    }
    else
    {
      if (v2 != 4)
      {
LABEL_4:
        -[HDQueryServer _queue_transitionToSuspendedState:]((id *)a1, 3);
        return;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_transitionToPaused, a1, CFSTR("HDQueryServer.m"), 490, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queryServerState != HDQueryServerStateFinished"));
    }

    goto LABEL_4;
  }
}

- (void)_queue_transitionToSuspendedState:(id *)a1
{
  uint64_t v4;
  id WeakRetained;
  void *v6;

  v4 = objc_msgSend(a1, "queryState");
  -[HDQueryServer _queue_setQueryState:]((uint64_t)a1, a2);
  if ((objc_msgSend(a1, "_shouldExecuteWhenProtectedDataIsUnavailable") & 1) != 0
    || objc_msgSend(a1, "_shouldObserveDatabaseProtectedDataAvailability"))
  {
    WeakRetained = objc_loadWeakRetained(a1 + 16);
    objc_msgSend(WeakRetained, "database");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeProtectedDataObserver:", a1);

  }
  if (v4 == 2)
  {
    objc_msgSend(a1, "_queue_stop");
    if (objc_msgSend(a1, "_shouldListenForUpdates")
      && (objc_msgSend(a1, "queryState") == 4 || (objc_msgSend(a1, "_shouldObserveOnPause") & 1) == 0))
    {
      objc_msgSend(a1, "_queue_stopDataCollection");
    }
    -[HDQueryServer _queue_invalidateActiveQueryTransaction](a1);
  }
  -[HDQueryServer _queue_didFinishTransitionFromState:]((uint64_t)a1, v4);
}

- (void)_queue_stop
{
  int64_t v4;
  void *v5;

  v4 = -[HDQueryServer queryState](self, "queryState");
  if ((unint64_t)(v4 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQueryServer.m"), 807, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(queryState == HDQueryServerStateFinished) || (queryState == HDQueryServerStatePaused)"));

  }
  else if (v4 == 3 && -[HDQueryServer _shouldObserveOnPause](self, "_shouldObserveOnPause"))
  {
    -[HDQueryServer _queue_beginObservingDataTypes]((uint64_t)self);
    return;
  }
  -[HDQueryServer _queue_endObservingDataTypes]((uint64_t)self);
}

- (BOOL)_shouldObserveOnPause
{
  return 0;
}

- (void)_queue_endObservingDataTypes
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a1 && *(_BYTE *)(a1 + 77))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
    objc_msgSend(WeakRetained, "dataManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_loadWeakRetained((id *)(a1 + 128));
    objc_msgSend(v4, "associationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend((id)a1, "_shouldObserveAllSampleTypes"))
    {
      objc_msgSend(v3, "removeObserverForAllTypes:", a1);
      objc_msgSend(v5, "removeObserverForAllTypes:", a1);
    }
    else
    {
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      objc_msgSend((id)a1, "objectTypes", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          for (i = 0; i != v8; ++i)
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
            objc_msgSend(v3, "removeObserver:forDataType:", a1, v11);
            objc_msgSend(v5, "removeObserver:forDataType:", a1, v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

    }
    *(_BYTE *)(a1 + 77) = 0;

  }
}

- (BOOL)clientHasActiveWorkout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  -[HDQueryServer client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "process");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "workoutManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentWorkoutClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "process");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v5);

  return v11;
}

- (id)newDataEntityEnumerator
{
  void *objectType;
  id WeakRetained;

  objectType = self->_objectType;
  if (objectType)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    +[HDSampleEntity entityEnumeratorWithType:profile:](HDSampleEntity, "entityEnumeratorWithType:profile:", objectType, WeakRetained);
    objectType = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(objectType, "addEncodingOptionsFromDictionary:", self->_baseDataEntityEncodingOptions);
  }
  return objectType;
}

- (id)sampleAuthorizationFilter
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  HDQueryServer *v10;

  -[HDQueryServer client](self, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authorizationOracle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __42__HDQueryServer_sampleAuthorizationFilter__block_invoke;
  v8[3] = &unk_1E6CFF598;
  v9 = v4;
  v10 = self;
  v5 = v4;
  v6 = _Block_copy(v8);

  return v6;
}

- (id)readAuthorizationStatusForType:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[HDQueryServer client](self, "client");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "authorizationOracle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "readAuthorizationStatusForType:error:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_shouldSuspendQuery
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_shouldPause);
  return v2 & 1;
}

- (void)_queue_startDataCollection
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HDDataCollectionAssertion *v17;
  HDDataCollectionAssertion *dataCollectionAssertion;
  id v19;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "dataCollectionManager");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer _queue_sampleTypesForObservation](self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[HDQueryServer client](self, "client");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "process");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer queryUUID](self, "queryUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "substringToIndex:", 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@-%@-%@"), v8, v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer _queue_collectionObserverState](self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "takeCollectionAssertionWithOwnerIdentifier:sampleTypes:observerState:collectionInterval:", v14, v15, v16, self->_collectionInterval);
  v17 = (HDDataCollectionAssertion *)objc_claimAutoreleasedReturnValue();

  -[HDAssertion invalidate](self->_dataCollectionAssertion, "invalidate");
  dataCollectionAssertion = self->_dataCollectionAssertion;
  self->_dataCollectionAssertion = v17;

  self->_isCollectingData = 1;
  -[HDQueryServer _queue_updateSampleTypeObservationAssertions]((id *)&self->super.isa);

}

- (void)remote_deactivateServer
{
  -[HDQueryServer deactivateServerWithCompletion:](self, "deactivateServerWithCompletion:", 0);
}

- (void)deactivateServerWithCompletion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  atomic_store(1u, (unsigned __int8 *)&self->_shouldFinish);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__HDQueryServer_deactivateServerWithCompletion___block_invoke;
  v6[3] = &unk_1E6CE9C08;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[HDQueryServer onQueue:](self, "onQueue:", v6);

}

uint64_t __48__HDQueryServer_deactivateServerWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  if (objc_msgSend(*(id *)(a1 + 32), "queryState") != 4)
  {
    -[HDQueryServer _queue_transitionToFinished](*(_QWORD *)(a1 + 32));
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
    {
      objc_msgSend(*(id *)(v2 + 48), "invalidate");
      v3 = *(void **)(v2 + 48);
      *(_QWORD *)(v2 + 48) = 0;

    }
  }
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_queue_transitionToFinished
{
  void *v2;
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t);

  if (a1)
  {
    if (objc_msgSend((id)a1, "queryState") == 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_transitionToFinished, a1, CFSTR("HDQueryServer.m"), 465, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.queryState != HDQueryServerStateFinished"));

    }
    -[HDQueryServer _queue_transitionToSuspendedState:]((id *)a1, 4);
    v7 = (void (**)(id, uint64_t))_Block_copy(*(const void **)(a1 + 24));
    v2 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    if (v7)
      v7[2](v7, a1);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
    objc_msgSend(WeakRetained, "queryServerDidFinish:", a1);

    objc_msgSend((id)a1, "_queue_stopDataCollection");
    v4 = objc_loadWeakRetained((id *)(a1 + 128));
    objc_msgSend(v4, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeProtectedDataObserver:", a1);

    -[HDQueryServer _queue_endObservingDataTypes](a1);
    -[HDQueryServer _queue_invalidateActiveQueryTransaction]((id *)a1);
    objc_msgSend((id)a1, "_queue_didDeactivate");

  }
}

- (void)_queue_stopDataCollection
{
  HDDataCollectionAssertion *dataCollectionAssertion;

  -[HDAssertion invalidate](self->_dataCollectionAssertion, "invalidate");
  dataCollectionAssertion = self->_dataCollectionAssertion;
  self->_dataCollectionAssertion = 0;

  self->_isCollectingData = 0;
  -[HDQueryServer _queue_updateSampleTypeObservationAssertions]((id *)&self->super.isa);
}

- (void)dealloc
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[HDAssertion invalidate](self->_dataCollectionAssertion, "invalidate");
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_dataObservationAssertions;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "invalidate");
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)HDQueryServer;
  -[HDQueryServer dealloc](&v8, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_queryServerDidFinishStateTransitionHandler, 0);
  objc_storeStrong(&self->_unitTest_queryServerWillChangeStateHandler, 0);
  objc_storeStrong(&self->_unitTest_queryServerSetShouldPauseHandler, 0);
  objc_storeStrong((id *)&self->_objectType, 0);
  objc_storeStrong((id *)&self->_filter, 0);
  objc_storeStrong((id *)&self->_queryQueue, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_queryUUID, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_transactionStatistics, 0);
  objc_storeStrong((id *)&self->_unitTestQueryQueue, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_runningTransaction, 0);
  objc_storeStrong((id *)&self->_activationTransaction, 0);
  objc_storeStrong((id *)&self->_dataCollectionAssertion, 0);
  objc_storeStrong((id *)&self->_dataObservationAssertions, 0);
  objc_storeStrong(&self->_queryDidFinishHandler, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_baseDataEntityEncodingOptions, 0);
}

- (OS_dispatch_queue)queryQueue
{
  return self->_queryQueue;
}

- (int64_t)queryState
{
  return (int)atomic_load((unsigned int *)&self->_queryState);
}

- (HDQueryServerDelegate)delegate
{
  return (HDQueryServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (id)builtInQueryServerClasses
{
  _QWORD v3[36];

  v3[35] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  v3[4] = objc_opt_class();
  v3[5] = objc_opt_class();
  v3[6] = objc_opt_class();
  v3[7] = objc_opt_class();
  v3[8] = objc_opt_class();
  v3[9] = objc_opt_class();
  v3[10] = objc_opt_class();
  v3[11] = objc_opt_class();
  v3[12] = objc_opt_class();
  v3[13] = objc_opt_class();
  v3[14] = objc_opt_class();
  v3[15] = objc_opt_class();
  v3[16] = objc_opt_class();
  v3[17] = objc_opt_class();
  v3[18] = objc_opt_class();
  v3[19] = objc_opt_class();
  v3[20] = objc_opt_class();
  v3[21] = objc_opt_class();
  v3[22] = objc_opt_class();
  v3[23] = objc_opt_class();
  v3[24] = objc_opt_class();
  v3[25] = objc_opt_class();
  v3[26] = objc_opt_class();
  v3[27] = objc_opt_class();
  v3[28] = objc_opt_class();
  v3[29] = objc_opt_class();
  v3[30] = objc_opt_class();
  v3[31] = objc_opt_class();
  v3[32] = objc_opt_class();
  v3[33] = objc_opt_class();
  v3[34] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 35);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (HDQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HDQueryServer *v16;
  uint64_t v17;
  NSUUID *queryUUID;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  OS_dispatch_queue *queryQueue;
  void *v28;
  uint64_t v29;
  OS_dispatch_queue *unitTestQueryQueue;
  uint64_t v31;
  HKObjectType *objectType;
  void *v33;
  uint64_t v34;
  _HKFilter *filter;
  uint64_t v36;
  NSDictionary *baseDataEntityEncodingOptions;
  uint64_t v38;
  HDDaemonTransaction *activationTransaction;
  void *v41;
  objc_super v42;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (v14 && (objc_msgSend(v14, "conformsToProtocol:", &unk_1EF1E83C0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDQueryServer.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[delegate conformsToProtocol:@protocol(HDQueryServerDelegate)]"));

  }
  v42.receiver = self;
  v42.super_class = (Class)HDQueryServer;
  v16 = -[HDQueryServer init](&v42, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v11, "copy");
    queryUUID = v16->_queryUUID;
    v16->_queryUUID = (NSUUID *)v17;

    objc_storeStrong((id *)&v16->_client, a5);
    objc_msgSend(v13, "profile");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v16->_profile, v19);

    objc_storeStrong((id *)&v16->_configuration, a4);
    objc_storeWeak((id *)&v16->_delegate, v15);
    objc_msgSend(v13, "process");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = objc_msgSend(v20, "processIdentifier");
    objc_msgSend(v20, "name");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%d.%@.%@"), v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    HKCreateSerialDispatchQueue();
    v26 = objc_claimAutoreleasedReturnValue();
    queryQueue = v16->_queryQueue;
    v16->_queryQueue = (OS_dispatch_queue *)v26;

    if (_HDIsUnitTesting)
    {
      objc_msgSend(v25, "stringByAppendingString:", CFSTR(".UnitTesting"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      HKCreateSerialDispatchQueue();
      v29 = objc_claimAutoreleasedReturnValue();
      unitTestQueryQueue = v16->_unitTestQueryQueue;
      v16->_unitTestQueryQueue = (OS_dispatch_queue *)v29;

    }
    atomic_store(0, (unsigned int *)&v16->_queryState);
    objc_msgSend(v12, "objectType");
    v31 = objc_claimAutoreleasedReturnValue();
    objectType = v16->_objectType;
    v16->_objectType = (HKObjectType *)v31;

    objc_msgSend(v12, "filter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "filterWithQueryFilter:objectType:", v33, v16->_objectType);
    v34 = objc_claimAutoreleasedReturnValue();
    filter = v16->_filter;
    v16->_filter = (_HKFilter *)v34;

    objc_msgSend(v13, "baseDataEntityEncodingOptions");
    v36 = objc_claimAutoreleasedReturnValue();
    baseDataEntityEncodingOptions = v16->_baseDataEntityEncodingOptions;
    v16->_baseDataEntityEncodingOptions = (NSDictionary *)v36;

    v16->_collectionInterval = 5.0;
    +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", v16, CFSTR("Activate"));
    v38 = objc_claimAutoreleasedReturnValue();
    activationTransaction = v16->_activationTransaction;
    v16->_activationTransaction = (HDDaemonTransaction *)v38;

  }
  return v16;
}

- (id)sanitizedSampleForQueryClient:(id)a3
{
  HDHealthStoreClient *client;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  client = self->_client;
  v5 = a3;
  -[HDHealthStoreClient entitlements](client, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sanitizedSample:forEntitlements:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[HDHealthStoreClient hasPrivateMetadataAccess](self->_client, "hasPrivateMetadataAccess"))
  {
    v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v7, "workoutEvents", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v25;
        do
        {
          v14 = 0;
          v15 = v12;
          do
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(v9);
            v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v14);
            objc_msgSend(v16, "metadata");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v12, "count"))
            {
              objc_msgSend(v12, "hk_copySanitizedForPublicClient");
              v17 = objc_claimAutoreleasedReturnValue();
              v18 = (void *)v17;
              if (v12 != (void *)v17 && (!v17 || (objc_msgSend(v12, "isEqual:", v17) & 1) == 0))
                objc_msgSend(v16, "_setWorkoutEventMetadata:", v18);

            }
            ++v14;
            v15 = v12;
          }
          while (v11 != v14);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v11);

      }
    }
    objc_msgSend(v7, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_copySanitizedForPublicClient");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v19 != (void *)v20 && (!v20 || (objc_msgSend(v19, "isEqual:", v20) & 1) == 0))
    {
      v22 = (void *)objc_msgSend(v7, "_copyByArchiving");

      objc_msgSend(v22, "_setMetadata:", v21);
      v7 = v22;
    }
    v8 = v7;

  }
  return v8;
}

- (id)filteredSamplesForClientWithSamples:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  HDObjectAuthorizationRequestContext *v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v23;
  id v24;
  id obj;
  uint64_t v26;
  id v27;
  void *v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[5];
  id v32;
  NSObject *v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[HDHealthStoreClient hasEntitlement:](self->_client, "hasEntitlement:", *MEMORY[0x1E0CB59B0]))
  {
    v5 = v4;
  }
  else
  {
    objc_msgSend(v4, "hk_filter:", &__block_literal_global_163);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[HDQueryServer client](self, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "authorizationOracle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "clientHasAuthorizationForAllTypes");

    if (v9)
    {
      v5 = v6;
    }
    else
    {
      objc_msgSend(v6, "hk_mapToSet:", &__block_literal_global_260);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
      {
        v28 = v6;
        v24 = v4;
        v27 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        v11 = dispatch_group_create();
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v23 = v10;
        obj = v10;
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
        if (v12)
        {
          v13 = v12;
          v26 = *(_QWORD *)v36;
          v14 = MEMORY[0x1E0C809B0];
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v36 != v26)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v15);
              v34[0] = v14;
              v34[1] = 3221225472;
              v34[2] = __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_2;
              v34[3] = &unk_1E6CEDCE0;
              v34[4] = v16;
              objc_msgSend(v28, "hk_filter:", v34);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              dispatch_group_enter(v11);
              v18 = -[HDObjectAuthorizationRequestContext initWithSamples:metadata:]([HDObjectAuthorizationRequestContext alloc], "initWithSamples:metadata:", v17, 0);
              -[HDObjectAuthorizationRequestContext setPersistSession:](v18, "setPersistSession:", 0);
              -[HDObjectAuthorizationRequestContext setPromptWithNoSamples:](v18, "setPromptWithNoSamples:", 0);
              -[HDQueryServer delegate](self, "delegate");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "code");
              v20 = HKPromptForLegacyPerObjectAuthorizationDuringQueries();
              v31[0] = v14;
              v31[1] = 3221225472;
              v31[2] = __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_3;
              v31[3] = &unk_1E6CF29B8;
              v31[4] = v16;
              v32 = v27;
              v33 = v11;
              objc_msgSend(v19, "queryServer:requestsAuthorizationWithContext:promptIfNeeded:completion:", self, v18, v20, v31);

              ++v15;
            }
            while (v13 != v15);
            v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
          }
          while (v13);
        }

        dispatch_group_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_264;
        v29[3] = &unk_1E6CEDCE0;
        v30 = v27;
        v21 = v27;
        v6 = v28;
        objc_msgSend(v28, "hk_filter:", v29);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        v10 = v23;
        v4 = v24;
      }
      else
      {
        v5 = v6;
      }

    }
  }

  return v5;
}

uint64_t __53__HDQueryServer_filteredSamplesForClientWithSamples___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_requiresPrivateEntitlementForQueries") ^ 1;
}

id __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "requiresPerObjectAuthorization"))
  {
    objc_msgSend(v2, "sampleType");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "UUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
  }
  else
  {
    _HKInitializeLogging();
    v13 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_DEFAULT))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      v22 = 2114;
      v23 = v6;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "Failed to obtain authorized samples for %{public}@: %{public}@", buf, 0x16u);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __55__HDQueryServer_authorizedSamplesForClientWithSamples___block_invoke_264(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "sampleType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "requiresPerObjectAuthorization");

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "containsObject:", v7);

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)predicateForQueryClient
{
  void *v3;
  id WeakRetained;
  void *v5;

  -[HDQueryServer filter](self, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v3, "predicateWithProfile:", WeakRetained);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)createDatabaseTransactionContext
{
  HDMutableDatabaseTransactionContext *v3;

  v3 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  -[HDMutableDatabaseTransactionContext setCacheScope:](v3, "setCacheScope:", 1);
  -[HDMutableDatabaseTransactionContext setStatistics:](v3, "setStatistics:", self->_transactionStatistics);
  return v3;
}

- (BOOL)prepareToActivateServerWithError:(id *)a3
{
  int64_t v5;
  char v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;

  v5 = -[HDQueryServer queryState](self, "queryState");
  if (!v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "database");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[4] = self;
    v13 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __50__HDQueryServer_prepareToActivateServerWithError___block_invoke;
    v12[3] = &unk_1E6CECC80;
    v6 = objc_msgSend(v8, "performHighPriorityTransactionsWithError:block:", &v13, v12);
    v9 = v13;

    if ((v6 & 1) != 0)
    {
LABEL_12:

      return v6;
    }
    if (v9)
    {
      v10 = v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 124, CFSTR("Unknown query validation error"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
LABEL_11:

        goto LABEL_12;
      }
    }
    if (a3)
      *a3 = objc_retainAutorelease(v10);
    else
      _HKLogDroppedError();

    if (v9)
      goto LABEL_12;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 126, CFSTR("Invalid query state %ld"), v5);
  return 0;
}

uint64_t __50__HDQueryServer_prepareToActivateServerWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "validateConfiguration:", a2);
}

- (void)activateServerWithClientState:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *queryQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "isSuspended"))
    -[HDQueryServer _setShouldPause:]((uint64_t)self, 1u);
  queryQueue = self->_queryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HDQueryServer_activateServerWithClientState_error___block_invoke;
  block[3] = &unk_1E6CE7FB8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queryQueue, block);

}

- (void)_setShouldPause:(uint64_t)a1
{
  void *v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  unsigned __int8 v9;

  if (a1)
  {
    atomic_store(a2, (unsigned __int8 *)(a1 + 80));
    v4 = _Block_copy(*(const void **)(a1 + 176));
    v5 = v4;
    if (v4)
    {
      v6 = *(NSObject **)(a1 + 88);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33__HDQueryServer__setShouldPause___block_invoke;
      block[3] = &unk_1E6CEBC78;
      block[4] = a1;
      v8 = v4;
      v9 = a2;
      dispatch_async(v6, block);

    }
  }
}

void __53__HDQueryServer_activateServerWithClientState_error___block_invoke(uint64_t a1)
{
  -[HDQueryServer _queue_activateServerWithClientState:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_queue_activateServerWithClientState:(void *)a3 error:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void (**v14)(void);
  void *v15;
  id location;
  _BYTE buf[24];
  void *v18;
  uint64_t v19;
  id v20[3];

  v20[2] = *(id *)MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v7 = objc_msgSend((id)a1, "queryState");
    if (v7 != 4)
    {
      v8 = v7;
      if (!v7)
        -[HDQueryServer _queue_setQueryState:](a1, 1);
      objc_msgSend((id)a1, "setClientState:", v5);
      v9 = objc_msgSend(v5, "isSuspended");
      _HKInitializeLogging();
      v10 = *MEMORY[0x1E0CB5348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = a1;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v6 == 0;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = v9;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: activated successfully: %{BOOL}d, paused: %{BOOL}d", buf, 0x18u);
      }
      if (v6)
      {
        -[HDQueryServer _queue_transitionToFinished](a1);
      }
      else if (v9)
      {
        -[HDQueryServer _queue_transitionToPaused]((void *)a1);
      }
      else
      {
        -[HDQueryServer _queue_takeActiveQueryTransaction](a1);
        if (!*(_BYTE *)(a1 + 78)
          && objc_msgSend((id)a1, "_shouldListenForUpdates")
          && (objc_msgSend(*(id *)(a1 + 16), "shouldSuppressDataCollection") & 1) == 0)
        {
          objc_msgSend((id)a1, "_queue_startDataCollection");
        }
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
        objc_msgSend((id)a1, "objectTypes");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "hk_anyObjectPassingTest:", &__block_literal_global_306);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "postNotificationName:object:", CFSTR("HDQueryServerDidReceiveHealthRecordsQueryNotification"), a1);

        }
        objc_initWeak(&location, (id)a1);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __36__HDQueryServer__scheduleStartQuery__block_invoke;
        v18 = &unk_1E6CED848;
        v19 = a1;
        objc_copyWeak(v20, &location);
        v14 = (void (**)(void))_Block_copy(buf);
        v14[2]();

        objc_destroyWeak(v20);
        objc_destroyWeak(&location);
      }
      objc_msgSend(*(id *)(a1 + 48), "invalidate");
      v15 = *(void **)(a1 + 48);
      *(_QWORD *)(a1 + 48) = 0;

      -[HDQueryServer _queue_didFinishTransitionFromState:](a1, v8);
    }
  }

}

- (void)_queue_takeActiveQueryTransaction
{
  void *v2;
  void *v3;
  char v4;
  uint64_t v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  objc_msgSend(WeakRetained, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "supportsActiveQueryDaemonTransactions"))
  {

LABEL_6:
    return;
  }
  v4 = objc_msgSend((id)a1, "hasActiveDaemonTransaction");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Running-%@"), *(_QWORD *)(a1 + 112));
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();
    +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:", a1);
    v5 = objc_claimAutoreleasedReturnValue();
    v2 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = v5;
    goto LABEL_6;
  }
}

- (void)_queue_didFinishTransitionFromState:(uint64_t)a1
{
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t v11;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  v4 = objc_msgSend((id)a1, "queryState");
  v5 = _Block_copy(*(const void **)(a1 + 192));
  v6 = v5;
  if (v5)
  {
    v7 = *(NSObject **)(a1 + 88);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__HDQueryServer__queue_didFinishTransitionFromState___block_invoke;
    v8[3] = &unk_1E6CFF510;
    v8[4] = a1;
    v9 = v5;
    v10 = a2;
    v11 = v4;
    dispatch_async(v7, v8);

  }
}

void __36__HDQueryServer__scheduleStartQuery__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v8;
  void *v9;
  double Current;
  void *v11;
  void *v12;
  HDMutableDatabaseTransactionContext *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int v21;
  id v22;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  NSObject *v37;
  _BOOL4 v38;
  void *v39;
  NSObject *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  double v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (uint64_t)WeakRetained;
  if (WeakRetained
    && objc_msgSend(WeakRetained, "queryState") == 1
    && (objc_msgSend((id)v3, "_shouldStopProcessingQuery") & 1) == 0)
  {
    if ((objc_msgSend((id)v3, "_shouldExecuteWhenProtectedDataIsUnavailable") & 1) != 0
      || (v4 = objc_loadWeakRetained((id *)(v3 + 128)),
          objc_msgSend(v4, "database"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isProtectedDataAvailable"),
          v5,
          v4,
          v6))
    {
      v7 = objc_msgSend((id)v3, "queryState");
      if (v7 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", sel__queue_transitionToRunning, v3, CFSTR("HDQueryServer.m"), 416, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousState == HDQueryServerStateActivated"));

      }
      -[HDQueryServer _queue_setQueryState:](v3, 2);
      if ((objc_msgSend((id)v3, "_shouldExecuteWhenProtectedDataIsUnavailable") & 1) != 0
        || objc_msgSend((id)v3, "_shouldObserveDatabaseProtectedDataAvailability"))
      {
        v8 = objc_loadWeakRetained((id *)(v3 + 128));
        objc_msgSend(v8, "database");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addProtectedDataObserver:queue:", v3, *(_QWORD *)(v3 + 136));

      }
      -[HDQueryServer _queue_takeActiveQueryTransaction](v3);
      if (!*(_BYTE *)(v3 + 78)
        && objc_msgSend((id)v3, "_shouldListenForUpdates")
        && (objc_msgSend(*(id *)(v3 + 16), "shouldSuppressDataCollection") & 1) == 0)
      {
        objc_msgSend((id)v3, "_queue_startDataCollection");
      }
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend((id)v3, "client");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "accessibilityAssertions");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v12, "count"))
      {
        v13 = objc_alloc_init(HDMutableDatabaseTransactionContext);
        -[HDMutableDatabaseTransactionContext setCacheScope:](v13, "setCacheScope:", 1);
        -[HDMutableDatabaseTransactionContext addAccessibilityAssertions:](v13, "addAccessibilityAssertions:", v12);
        objc_msgSend((id)v3, "profile");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "database");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v48[4] = v3;
        v49 = 0;
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __43__HDQueryServer__queue_transitionToRunning__block_invoke;
        v48[3] = &unk_1E6CECC80;
        objc_msgSend(v15, "performWithTransactionContext:error:block:", v13, &v49, v48);
        v16 = v49;

      }
      else
      {
        objc_msgSend((id)v3, "_queue_start");
      }
      v17 = CFAbsoluteTimeGetCurrent() - Current;
      objc_msgSend(*(id *)(v3 + 96), "totalDuration");
      v19 = v18;
      objc_msgSend((id)v3, "clientState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isBackgroundRunning");

      if (v21)
      {
        if (v19 <= 0.0)
          v19 = v17;
        dispatch_assert_queue_V2(*(dispatch_queue_t *)(v3 + 136));
        if (v19 != 0.0)
        {
          v22 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v24, CFSTR("queryType"));

          objc_msgSend((id)v3, "queryUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v26, CFSTR("queryId"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v27, CFSTR("totalDuration"));

          objc_msgSend(v22, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("isBackgroundQuery"));
          objc_msgSend((id)v3, "sampleType");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v28;
          if (v28)
          {
            objc_msgSend(v28, "description");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, CFSTR("dataType"));

          }
          v31 = kHDEventNameQuery;
          objc_msgSend((id)v3, "client");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          HDPowerLogForClient(v31, v32, v22);

        }
      }
      v33 = objc_loadWeakRetained((id *)(v3 + 128));
      objc_msgSend(v33, "daemon");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "behavior");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isAppleInternalInstall");

      _HKInitializeLogging();
      v37 = *MEMORY[0x1E0CB5348];
      v38 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_INFO);
      if (v36)
      {
        if (v38)
        {
          v39 = *(void **)(v3 + 96);
          v40 = v37;
          objc_msgSend(v39, "totalDuration");
          *(_DWORD *)buf = 138543874;
          v51 = v3;
          v52 = 2048;
          v53 = v17;
          v54 = 2048;
          v55 = v41;
          _os_log_impl(&dword_1B7802000, v40, OS_LOG_TYPE_INFO, "%{public}@: Ran in %.3fs (%.3fs in database transactions)", buf, 0x20u);

        }
      }
      else if (v38)
      {
        *(_DWORD *)buf = 138543618;
        v51 = v3;
        v52 = 2048;
        v53 = v17;
        _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_INFO, "%{public}@: Ran in %.3fs", buf, 0x16u);
      }
      -[HDQueryServer _queue_didFinishTransitionFromState:](v3, v7);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_protectedDataInaccessibilityError");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v3, "clientProxy");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (v43)
      {
        objc_msgSend((id)v3, "queryUUID");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "client_deliverError:forQuery:", v42, v44);

      }
    }
  }

  v45 = *(_QWORD *)(a1 + 32);
  v46 = *(void **)(v45 + 96);
  *(_QWORD *)(v45 + 96) = 0;

}

- (void)schedulePause
{
  _QWORD v3[5];

  -[HDQueryServer _setShouldPause:]((uint64_t)self, 1u);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__HDQueryServer_schedulePause__block_invoke;
  v3[3] = &unk_1E6CE80E8;
  v3[4] = self;
  -[HDQueryServer onQueue:](self, "onQueue:", v3);
}

void __30__HDQueryServer_schedulePause__block_invoke(uint64_t a1)
{
  if ((unint64_t)(objc_msgSend(*(id *)(a1 + 32), "queryState") - 5) <= 0xFFFFFFFFFFFFFFFDLL)
    -[HDQueryServer _queue_transitionToPaused](*(void **)(a1 + 32));
}

- (void)clientStateWillChange:(id)a3
{
  NSObject *queryQueue;
  id v5;

  queryQueue = self->_queryQueue;
  v5 = a3;
  dispatch_assert_queue_not_V2(queryQueue);
  LOBYTE(queryQueue) = objc_msgSend(v5, "isSuspended");

  -[HDQueryServer _setShouldPause:]((uint64_t)self, queryQueue);
}

- (void)clientStateDidChange:(id)a3
{
  id v4;
  NSObject *queryQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queryQueue = self->_queryQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__HDQueryServer_clientStateDidChange___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queryQueue, block);

}

void __38__HDQueryServer_clientStateDidChange___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 64);
  *(_QWORD *)(v3 + 64) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 32), "queryState");
  if (objc_msgSend(*(id *)(a1 + 40), "isSuspended"))
  {
    if ((unint64_t)(v5 - 5) <= 0xFFFFFFFFFFFFFFFDLL)
      -[HDQueryServer _queue_transitionToPaused](*(void **)(a1 + 32));
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "queryState") == 3)
  {
    v6 = *(_QWORD *)(a1 + 32);
    if (!*(_QWORD *)(v6 + 48))
    {
      +[HKDaemonTransaction transactionWithOwner:activityName:](HDDaemonTransaction, "transactionWithOwner:activityName:");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 48);
      *(_QWORD *)(v8 + 48) = v7;

      v6 = *(_QWORD *)(a1 + 32);
    }
    -[HDQueryServer _queue_setQueryState:](v6, 0);
    -[HDQueryServer _queue_activateServerWithClientState:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), 0);
  }
  -[HDQueryServer _queue_collectionObserverState](*(void **)(a1 + 32));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "setObserverState:", v10);

  -[HDQueryServer _queue_updateSampleTypeObservationAssertions](*(id **)(a1 + 32));
}

- (id)_queue_collectionObserverState
{
  void *v1;
  uint64_t v2;

  if (a1)
  {
    objc_msgSend(a1, "clientState");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "isForeground") ^ 1;

    +[HDDataCollectionObserverState dataCollectionObserverStateInBackground:hasRunningWorkout:](HDDataCollectionObserverState, "dataCollectionObserverStateInBackground:hasRunningWorkout:", v2, 0);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_queue_updateSampleTypeObservationAssertions
{
  id *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  id *v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1, "profile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "sessionAssertionManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
LABEL_24:

      return;
    }
    -[HDQueryServer _queue_sampleTypesForObservation](v1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v1 + 78))
    {
      objc_msgSend(v1, "clientState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "isForeground") & 1) != 0)
      {
        v6 = objc_msgSend(v4, "count");

        if (v6)
        {
          v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v26 = v1;
          objc_msgSend(v1, "client");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "process");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v30 = 0u;
          v31 = 0u;
          v28 = 0u;
          v29 = 0u;
          v27 = v4;
          v11 = v4;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v29;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v29 != v14)
                  objc_enumerationMutation(v11);
                HDQueryServerSampleTypeObservationAssertionName(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i));
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29800]), "initWithAssertionIdentifier:ownerIdentifier:", v16, v10);
                objc_msgSend(v3, "takeAssertion:", v17);
                objc_msgSend(v7, "addObject:", v17);

              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            }
            while (v13);
          }

          v1 = v26;
          v4 = v27;
          goto LABEL_16;
        }
      }
      else
      {

      }
    }
    v7 = 0;
LABEL_16:
    v18 = v1[4];
    v19 = objc_msgSend(v7, "copy");
    v20 = v1[4];
    v1[4] = (id)v19;

    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v21 = v18;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v33;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v33 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * j), "invalidate");
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v23);
    }

    goto LABEL_24;
  }
}

BOOL __43__HDQueryServer__queue_transitionToRunning__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_start");
  return a2 == 0;
}

- (void)_queue_invalidateActiveQueryTransaction
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained(a1 + 16);
  objc_msgSend(WeakRetained, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "behavior");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "supportsActiveQueryDaemonTransactions"))
  {
    v4 = objc_msgSend(a1, "hasActiveDaemonTransaction");

    if ((v4 & 1) != 0)
    {
      objc_msgSend(a1[7], "invalidate");
      v5 = a1[7];
      a1[7] = 0;

    }
  }
  else
  {

  }
}

uint64_t __38__HDQueryServer__queue_setQueryState___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6], a1[7]);
}

- (id)_queue_sampleTypesForObservation
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v1 = a1;
  v6[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(a1, "_shouldObserveAllSampleTypes"))
    {
      HKAllCollectibleTypesWithStoreDemoModeEnabled();
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "hk_map:", &__block_literal_global_295_0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "allObjects");
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v1, "sampleType");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
        return MEMORY[0x1E0C9AA60];
      objc_msgSend(v1, "sampleType");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = v2;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
      v1 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v1;
}

id __49__HDQueryServer__queue_sampleTypesForObservation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

uint64_t __53__HDQueryServer__queue_didFinishTransitionFromState___block_invoke(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[4], a1[6], a1[7]);
}

uint64_t __56__HDQueryServer__queue_notifyIfQueryingForHealthRecords__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isHealthRecordsType");
}

- (void)remote_startQueryWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, _QWORD, void *);

  v7 = (void (**)(id, _QWORD, void *))a3;
  -[HDQueryServer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "queryServer:shouldStartWithCompletion:", self, v7);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("nil query server delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v6);

  }
}

- (NSSet)objectTypes
{
  if (self->_objectType)
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:");
  else
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

- (HKQuantityType)quantityType
{
  HKObjectType *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self->_objectType;
  else
    v3 = 0;
  return (HKQuantityType *)v3;
}

uint64_t __33__HDQueryServer__setShouldPause___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (double)activationTime
{
  double result;

  -[HKQueryServerConfiguration activationTime](self->_configuration, "activationTime");
  return result;
}

- (BOOL)hasActiveDaemonTransaction
{
  return self->_runningTransaction != 0;
}

id __42__HDQueryServer_sampleAuthorizationFilter__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 32);
  v9 = 0;
  objc_msgSend(v3, "filteredObjectsForReadAuthorization:anchor:error:", a2, 0, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (!v4)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Sample authorization failed: %{public}@", buf, 0x16u);
    }
  }

  return v4;
}

+ (Class)queryClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (Class)objc_opt_class();
}

+ (BOOL)supportsAnchorBasedAuthorization
{
  return 0;
}

- (BOOL)validateConfiguration:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  NSObject *v25;
  const __CFString *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  HDQueryServer *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend((id)objc_opt_class(), "requiredEntitlements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v34 != v8)
          objc_enumerationMutation(v5);
        if (!-[HDHealthStoreClient hasRequiredEntitlement:error:](self->_client, "hasRequiredEntitlement:error:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i), a3))
        {
          v13 = 0;
          goto LABEL_36;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[HDQueryServer client](self, "client");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authorizationOracle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "clientHasAuthorizationForAllTypes");

  -[HDQueryServer objectTypes](self, "objectTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 1;
  if (objc_msgSend(v5, "count") && (v12 & 1) == 0)
  {
    -[HDQueryServer client](self, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "authorizationOracle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    objc_msgSend(v15, "readAuthorizationStatusesForTypes:error:", v5, &v32);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v17 = v32;

    if (v16)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v18 = v5;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v29;
        while (2)
        {
          for (j = 0; j != v20; ++j)
          {
            if (*(_QWORD *)v29 != v21)
              objc_enumerationMutation(v18);
            objc_msgSend(v16, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j), (_QWORD)v28);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v23;
            if (!v23 || !objc_msgSend(v23, "isAuthorizationDetermined"))
            {
              v26 = CFSTR("Authorization not determined");
LABEL_31:
              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a3, 5, v26);

              v13 = 0;
              goto LABEL_32;
            }
            if (objc_msgSend(v24, "authorizationMode") == 1
              && (objc_msgSend((id)objc_opt_class(), "supportsAnchorBasedAuthorization") & 1) == 0)
            {
              v26 = CFSTR("Authorization not supported");
              goto LABEL_31;
            }

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
          v13 = 1;
          if (v20)
            continue;
          break;
        }
      }
LABEL_32:

      goto LABEL_35;
    }
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v39 = self;
      v40 = 2114;
      v41 = v17;
      _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "%{public}@: Error determining authorization status: %{public}@", buf, 0x16u);
    }
    v16 = v17;
    if (v16)
    {
      if (a3)
      {
        v13 = 0;
        *a3 = objc_retainAutorelease(v16);
LABEL_35:

        goto LABEL_36;
      }
      _HKLogDroppedError();
    }
    v13 = 0;
    goto LABEL_35;
  }
LABEL_36:

  return v13;
}

- (BOOL)_shouldObserveDatabaseProtectedDataAvailability
{
  return 0;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend((id)objc_msgSend(a1, "queryClass"), "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)taskUUID
{
  return self->_queryUUID;
}

+ (Class)configurationClass
{
  return (Class)objc_msgSend((id)objc_msgSend(a1, "queryClass"), "configurationClass");
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "queryClass"), "serverInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "queryClass"), "clientInterface");
}

- (void)connectionInvalidated
{
  NSObject *v3;
  int v4;
  HDQueryServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5348], OS_LOG_TYPE_DEBUG))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_debug_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEBUG, "%{public}@: connection invalidated, deactivating", (uint8_t *)&v4, 0xCu);
  }
  -[HDQueryServer deactivateServerWithCompletion:](self, "deactivateServerWithCompletion:", 0);
}

- (id)diagnosticDescription
{
  void *v3;
  void *v4;
  id WeakRetained;
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
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  __CFString *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;

  if (self
    && (-[HDQueryServer filter](self, "filter"), v3 = (void *)objc_claimAutoreleasedReturnValue(), v3, v3))
  {
    -[HDQueryServer filter](self, "filter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v4, "predicateWithProfile:", WeakRetained);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "description");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("\n"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n\t"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("\t"), "stringByAppendingString:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }
  -[HKQueryServerConfiguration debugIdentifier](self->_configuration, "debugIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99D68];
  -[HDQueryServer activationTime](self, "activationTime");
  objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)0x1E0CB3000;
  v13 = (void *)MEMORY[0x1E0CB3940];
  -[HDQueryServer queryUUID](self, "queryUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_opt_class();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" \"%@\"), v10);
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = &stru_1E6D11BB8;
  }
  -[HDQueryServer sampleType](self, "sampleType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v14;
  v18 = v16;
  if (v17)
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[HDQueryServer sampleType](self, "sampleType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR(" (%@)"), v12);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = &stru_1E6D11BB8;
  }
  -[HDQueryServer _queryStateString]((__CFString *)self);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[HDQueryServer _shouldStopProcessingQuery](self, "_shouldStopProcessingQuery"))
    v22 = CFSTR(" (finishing)");
  else
    v22 = &stru_1E6D11BB8;
  HKDiagnosticStringFromDate();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@ %@%@%@ - %@%@, activated %@"), v15, v18, v30, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {

  }
  if (v10)

  if (v28)
  {
    objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("\n%@"), v28);
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = v24;
  }
  v26 = v25;

  return v26;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HKQueryServerConfiguration)configuration
{
  return self->_configuration;
}

- (double)collectionInterval
{
  return self->_collectionInterval;
}

- (int64_t)dataCount
{
  return self->_dataCount;
}

- (void)setDataCount:(int64_t)a3
{
  self->_dataCount = a3;
}

- (HKObjectType)objectType
{
  return self->_objectType;
}

- (HDQueryServerClientState)clientState
{
  return self->_clientState;
}

- (void)setClientState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)unitTest_queryServerSetShouldPauseHandler
{
  return self->_unitTest_queryServerSetShouldPauseHandler;
}

- (void)setUnitTest_queryServerSetShouldPauseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)unitTest_queryServerWillChangeStateHandler
{
  return self->_unitTest_queryServerWillChangeStateHandler;
}

- (void)setUnitTest_queryServerWillChangeStateHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)unitTest_queryServerDidFinishStateTransitionHandler
{
  return self->_unitTest_queryServerDidFinishStateTransitionHandler;
}

- (void)setUnitTest_queryServerDidFinishStateTransitionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

@end
