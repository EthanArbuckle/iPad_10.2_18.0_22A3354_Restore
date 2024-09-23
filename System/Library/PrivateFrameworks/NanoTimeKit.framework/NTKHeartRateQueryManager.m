@implementation NTKHeartRateQueryManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_19 != -1)
    dispatch_once(&sharedInstance_onceToken_19, &__block_literal_global_134);
  return (id)sharedInstance___sharedInstance_6;
}

void __42__NTKHeartRateQueryManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[NTKHeartRateQueryManager _init]([NTKHeartRateQueryManager alloc], "_init");
  v1 = (void *)sharedInstance___sharedInstance_6;
  sharedInstance___sharedInstance_6 = (uint64_t)v0;

}

- (id)_init
{
  NTKHeartRateQueryManager *v2;
  void *v3;
  uint64_t v4;
  NSHashTable *observers;
  dispatch_queue_t v6;
  OS_dispatch_queue *healthQueue;
  dispatch_queue_t v8;
  OS_dispatch_queue *sampleQueue;
  void *v10;
  NSObject *v11;
  _QWORD block[4];
  NTKHeartRateQueryManager *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)NTKHeartRateQueryManager;
  v2 = -[NTKHeartRateQueryManager init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_deviceIsLocked = objc_msgSend(v3, "isLocked");

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v4;

    v2->_observersLock._os_unfair_lock_opaque = 0;
    v6 = dispatch_queue_create("com.apple.nanotimekit.heart-rate.healthQueue", 0);
    healthQueue = v2->_healthQueue;
    v2->_healthQueue = (OS_dispatch_queue *)v6;

    v8 = dispatch_queue_create("com.apple.nanotimekit.heart-rate.sampleQueue", MEMORY[0x1E0C80D50]);
    sampleQueue = v2->_sampleQueue;
    v2->_sampleQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v2, sel__handleDeviceLockChange, *MEMORY[0x1E0C93EE0], 0);

    v11 = v2->_healthQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__NTKHeartRateQueryManager__init__block_invoke;
    block[3] = &unk_1E6BCD5F0;
    v14 = v2;
    dispatch_async(v11, block);

  }
  return v2;
}

void __33__NTKHeartRateQueryManager__init__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB6780], "fiui_sharedHealthStoreForCarousel");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

}

- (void)dealloc
{
  void *v3;
  HKAnchoredObjectQuery *heartRateQuery;
  HKHeartRateSummaryQuery *heartRateSummaryQuery;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable removeAllObjects](self->_observers, "removeAllObjects");
  os_unfair_lock_unlock(&self->_observersLock);
  if (self->_heartRateQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    heartRateQuery = self->_heartRateQuery;
    self->_heartRateQuery = 0;

  }
  if (self->_heartRateSummaryQuery)
  {
    -[HKHealthStore stopQuery:](self->_healthStore, "stopQuery:");
    heartRateSummaryQuery = self->_heartRateSummaryQuery;
    self->_heartRateSummaryQuery = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)NTKHeartRateQueryManager;
  -[NTKHeartRateQueryManager dealloc](&v6, sel_dealloc);
}

- (void)_handleDeviceLockChange
{
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[16];

  _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: received CLKDeviceLockStateChangedNotification", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__NTKHeartRateQueryManager__handleDeviceLockChange__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__NTKHeartRateQueryManager__handleDeviceLockChange__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0C944B0], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocked");

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 8) = v3;
  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "startObservingIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfLatestSample");
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfLatestSummary");
  }
}

- (void)_queue_clearHeartRateSampleQueryWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  HKAnchoredObjectQuery *heartRateQuery;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthQueue);
  _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NTKHeartRateQueryManager _queue_clearHeartRateSampleQueryWithError:].cold.1((uint64_t)v4, v5, v6);

  heartRateQuery = self->_heartRateQuery;
  self->_heartRateQuery = 0;

}

- (void)_queue_clearHeartRateSummaryQueryWithError:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  HKHeartRateSummaryQuery *heartRateSummaryQuery;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthQueue);
  _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NTKHeartRateQueryManager _queue_clearHeartRateSummaryQueryWithError:].cold.1((uint64_t)v4, v5, v6);

  heartRateSummaryQuery = self->_heartRateSummaryQuery;
  self->_heartRateSummaryQuery = 0;

}

- (void)_queue_startObservingHeartRateSummary
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "NTKHeartRateQueryManager: Either our gatekeeping logic in _startObservingIfNeeded failed or someone else is calling _queue_startObservingHeartRateSummary from somewhere else.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

void __65__NTKHeartRateQueryManager__queue_startObservingHeartRateSummary__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject **WeakRetained;
  NSObject **v9;
  NSObject *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (WeakRetained)
  {
    if (v7)
    {
      v10 = WeakRetained[2];
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __65__NTKHeartRateQueryManager__queue_startObservingHeartRateSummary__block_invoke_2;
      v17[3] = &unk_1E6BCD778;
      v17[4] = WeakRetained;
      v18 = v7;
      dispatch_sync(v10, v17);

    }
    else
    {
      _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v6)
      {
        if (v12)
        {
          objc_msgSend(v6, "heartRateDateInterval");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "heartRateDateInterval");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "endDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v20 = v14;
          v21 = 2114;
          v22 = v16;
          _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: Updated with latest heart rate summary for %{public}@ to %{public}@", buf, 0x16u);

        }
        objc_msgSend(v9, "setLatestHeartRateSummary:", v6);
        objc_msgSend(v9, "_notifyObserversOfLatestSummary");
      }
      else
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: Updated with nil heart rate summary.", buf, 2u);
        }

      }
    }
  }

}

uint64_t __65__NTKHeartRateQueryManager__queue_startObservingHeartRateSummary__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearHeartRateSummaryQueryWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_stopObservingHeartRateSummary
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "NTKHeartRateQueryManager: attempted to stop observing when no query was running -> gatekeeping logic in _stopObservingIfNeeded is wrong or someone else tried to call _queue_stopObservingHeartRateSummary somewhere else.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

- (void)_notifyObserversOfLatestSummary
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[NTKHeartRateQueryManager latestHeartRateSummary](self, "latestHeartRateSummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__NTKHeartRateQueryManager__notifyObserversOfLatestSummary__block_invoke;
    v5[3] = &unk_1E6BCD778;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __59__NTKHeartRateQueryManager__notifyObserversOfLatestSummary__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__NTKHeartRateQueryManager__notifyObserversOfLatestSummary__block_invoke_2;
  v2[3] = &unk_1E6BD8318;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_enumerateObserversUsingBlock:", v2);

}

void __59__NTKHeartRateQueryManager__notifyObserversOfLatestSummary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "manager:receivedLatestHeartRateSummary:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_enumerateObserversUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  os_unfair_lock_s *p_observersLock;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, char *))a3;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_observersLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
      v13 = 0;
      v4[2](v4, v12, &v13);
      if (v13)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)startObservingIfNeeded
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  __int16 v6;
  uint8_t buf[2];
  __int16 v8;

  if (-[NTKHeartRateQueryManager _alreadyObserving](self, "_alreadyObserving"))
  {
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 0;
      v4 = "NTKHeartRateQueryManager: attempted to start observing but we're already observing";
      v5 = (uint8_t *)&v8;
LABEL_10:
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (!-[NTKHeartRateQueryManager _haveObservers](self, "_haveObservers"))
  {
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v4 = "NTKHeartRateQueryManager: attempted to start observing but don't have any observers to notify";
      v5 = buf;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (self->_deviceIsLocked)
  {
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 0;
      v4 = "NTKHeartRateQueryManager: attempted to start observing but the device is locked— waiting for unlock";
      v5 = (uint8_t *)&v6;
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  -[NTKHeartRateQueryManager _startObserving](self, "_startObserving");
}

- (void)_stopObservingIfNeeded
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[NTKHeartRateQueryManager _alreadyObserving](self, "_alreadyObserving"))
  {
    -[NTKHeartRateQueryManager _stopObserving](self, "_stopObserving");
  }
  else
  {
    _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: attempted to stop observing but we weren't observing", v4, 2u);
    }

  }
}

- (void)_startObserving
{
  uint64_t v3;
  NSObject *healthQueue;
  _QWORD block[6];
  _QWORD v6[5];
  _QWORD v7[3];
  char v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v3 = MEMORY[0x1E0C809B0];
  v8 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__NTKHeartRateQueryManager__startObserving__block_invoke;
  v6[3] = &unk_1E6BD8340;
  v6[4] = v7;
  -[NTKHeartRateQueryManager _enumerateObserversUsingBlock:](self, "_enumerateObserversUsingBlock:", v6);
  healthQueue = self->_healthQueue;
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __43__NTKHeartRateQueryManager__startObserving__block_invoke_2;
  block[3] = &unk_1E6BD8368;
  block[4] = self;
  block[5] = v7;
  dispatch_async(healthQueue, block);
  _Block_object_dispose(v7, 8);
}

uint64_t __43__NTKHeartRateQueryManager__startObserving__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void __43__NTKHeartRateQueryManager__startObserving__block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  int v4;
  _QWORD *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[5])
  {
    objc_msgSend(v2, "_queue_startObservingHeartRate");
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "_queue_retrieveLatestHeartRateOnce");
  _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: shouldStartQueryingSummary? %d", (uint8_t *)v6, 8u);
  }

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = *(_QWORD **)(a1 + 32);
    if (!v5[6])
      objc_msgSend(v5, "_queue_startObservingHeartRateSummary");
  }
}

- (void)_stopObserving
{
  NSObject *healthQueue;
  _QWORD block[5];

  healthQueue = self->_healthQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__NTKHeartRateQueryManager__stopObserving__block_invoke;
  block[3] = &unk_1E6BCD5F0;
  block[4] = self;
  dispatch_async(healthQueue, block);
}

void __42__NTKHeartRateQueryManager__stopObserving__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  if ((objc_msgSend(*(id *)(a1 + 32), "_haveObservers") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "_queue_stopObservingHeartRate");
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__NTKHeartRateQueryManager__stopObserving__block_invoke_2;
  v3[3] = &unk_1E6BD8340;
  v3[4] = &v4;
  objc_msgSend(v2, "_enumerateObserversUsingBlock:", v3);
  if (*((_BYTE *)v5 + 24))
    objc_msgSend(*(id *)(a1 + 32), "_queue_stopObservingHeartRateSummary");
  _Block_object_dispose(&v4, 8);
}

uint64_t __42__NTKHeartRateQueryManager__stopObserving__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (BOOL)_alreadyObserving
{
  NSObject *healthQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  healthQueue = self->_healthQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__NTKHeartRateQueryManager__alreadyObserving__block_invoke;
  v5[3] = &unk_1E6BD1498;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(healthQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __45__NTKHeartRateQueryManager__alreadyObserving__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) != 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__NTKHeartRateQueryManager__alreadyObserving__block_invoke_2;
  v5[3] = &unk_1E6BD8340;
  v5[4] = &v6;
  objc_msgSend(v2, "_enumerateObserversUsingBlock:", v5);
  if (*((_BYTE *)v7 + 24))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(_BYTE *)(v3 + 24);
    if (v4)
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48) != 0;
    *(_BYTE *)(v3 + 24) = v4;
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __45__NTKHeartRateQueryManager__alreadyObserving__block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint8_t v7[24];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_observersLock);
    if (-[NSHashTable containsObject:](self->_observers, "containsObject:", v4))
    {
      os_unfair_lock_unlock(&self->_observersLock);
    }
    else
    {
      _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v7 = 138543362;
        *(_QWORD *)&v7[4] = objc_opt_class();
        v6 = *(id *)&v7[4];
        _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: Adding observer %{public}@", v7, 0xCu);

      }
      -[NSHashTable addObject:](self->_observers, "addObject:", v4);
      os_unfair_lock_unlock(&self->_observersLock);
      -[NTKHeartRateQueryManager _notifyObserversOfLatestSample](self, "_notifyObserversOfLatestSample");
      -[NTKHeartRateQueryManager _notifyObserversOfLatestSummary](self, "_notifyObserversOfLatestSummary");
    }
    -[NTKHeartRateQueryManager startObservingIfNeeded](self, "startObservingIfNeeded", *(_OWORD *)v7);
  }

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  if (a3)
  {
    p_observersLock = &self->_observersLock;
    v5 = a3;
    os_unfair_lock_lock(p_observersLock);
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);

    os_unfair_lock_unlock(p_observersLock);
    -[NTKHeartRateQueryManager _stopObservingIfNeeded](self, "_stopObservingIfNeeded");
  }
}

- (BOOL)_haveObservers
{
  NTKHeartRateQueryManager *v2;
  os_unfair_lock_s *p_observersLock;

  v2 = self;
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  LOBYTE(v2) = -[NSHashTable count](v2->_observers, "count") != 0;
  os_unfair_lock_unlock(p_observersLock);
  return (char)v2;
}

- (void)_notifyObserversOfLatestSample
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  -[NTKHeartRateQueryManager latestHeartRateSample](self, "latestHeartRateSample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __58__NTKHeartRateQueryManager__notifyObserversOfLatestSample__block_invoke;
    v5[3] = &unk_1E6BCD778;
    v5[4] = self;
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __58__NTKHeartRateQueryManager__notifyObserversOfLatestSample__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __58__NTKHeartRateQueryManager__notifyObserversOfLatestSample__block_invoke_2;
  v2[3] = &unk_1E6BD8318;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "_enumerateObserversUsingBlock:", v2);

}

uint64_t __58__NTKHeartRateQueryManager__notifyObserversOfLatestSample__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "manager:receivedLatestHeartRateSample:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_queue_startObservingHeartRate
{
  NSObject *v3;
  void *v4;
  void *v5;
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
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HKAnchoredObjectQuery *v21;
  HKAnchoredObjectQuery *heartRateQuery;
  _QWORD aBlock[4];
  id v24;
  id buf;
  _QWORD v26[2];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: start observing heart rate query", (uint8_t *)&buf, 2u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_healthQueue);
  if (!self->_heartRateQuery)
  {
    objc_initWeak(&buf, self);
    aBlock[1] = 3221225472;
    aBlock[2] = __58__NTKHeartRateQueryManager__queue_startObservingHeartRate__block_invoke;
    aBlock[3] = &unk_1E6BD8390;
    aBlock[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(&v24, &buf);
    v4 = _Block_copy(aBlock);
    v5 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K >= %@"), *MEMORY[0x1E0CB57F0], v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB6A78], "_predicateForObjectsFromAppleWatches");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0CB6A78];
    objc_msgSend(MEMORY[0x1E0CB6C18], "_blePeripheralSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateForObjectsFromSource:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0CB3528];
    v27[0] = v8;
    v27[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "orPredicateWithSubpredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3528];
    v26[0] = v14;
    v26[1] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = objc_alloc(MEMORY[0x1E0CB62C0]);
    objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A80], "latestAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (HKAnchoredObjectQuery *)objc_msgSend(v18, "initWithType:predicate:anchor:limit:resultsHandler:", v19, v17, v20, 0, v4);
    heartRateQuery = self->_heartRateQuery;
    self->_heartRateQuery = v21;

    -[HKAnchoredObjectQuery setShouldSuppressDataCollection:](self->_heartRateQuery, "setShouldSuppressDataCollection:", 1);
    -[HKAnchoredObjectQuery setUpdateHandler:](self->_heartRateQuery, "setUpdateHandler:", v4);
    -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", self->_heartRateQuery);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&buf);
  }
}

void __58__NTKHeartRateQueryManager__queue_startObservingHeartRate__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v8;
  id v9;
  NSObject **WeakRetained;
  NSObject **v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a6;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    if (v9)
    {
      v12 = WeakRetained[2];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __58__NTKHeartRateQueryManager__queue_startObservingHeartRate__block_invoke_2;
      v15[3] = &unk_1E6BCD778;
      v15[4] = WeakRetained;
      v16 = v9;
      dispatch_sync(v12, v15);

    }
    else
    {
      v13 = objc_msgSend(v8, "count");
      _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v18 = v13;
        _os_log_impl(&dword_1B72A3000, v14, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: received %lu sample objects", buf, 0xCu);
      }

      if (v13)
        objc_msgSend(v11, "setHeartRateSamples:", v8);
    }
  }

}

uint64_t __58__NTKHeartRateQueryManager__queue_startObservingHeartRate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_clearHeartRateSampleQueryWithError:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_stopObservingHeartRate
{
  OUTLINED_FUNCTION_5(&dword_1B72A3000, a1, a3, "NTKHeartRateQueryManager: attempted to stop observing when no query was running -> gatekeeping logic in _stopObservingIfNeeded is wrong or someone else tried to call _queue_stopObservingHeartRate somewhere else.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5_1();
}

- (void)_queue_retrieveLatestHeartRateOnce
{
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id buf[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B72A3000, v3, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: requesting latest heart rate", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v4 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5CB0]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6A78], "_predicateForObjectsFromAppleWatches");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E60], 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__NTKHeartRateQueryManager__queue_retrieveLatestHeartRateOnce__block_invoke;
  v10[3] = &unk_1E6BD83B8;
  objc_copyWeak(&v11, buf);
  v9 = (void *)objc_msgSend(v4, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v5, v6, 1, v8, v10);

  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
}

void __62__NTKHeartRateQueryManager__queue_retrieveLatestHeartRateOnce__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *WeakRetained;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v8)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __62__NTKHeartRateQueryManager__queue_retrieveLatestHeartRateOnce__block_invoke_cold_1(v9, v11);
    goto LABEL_9;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: retrieve once: received %lu sample objects", (uint8_t *)&v13, 0xCu);
  }

  if (objc_msgSend(v8, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v11 = WeakRetained;
    if (WeakRetained)
      -[NSObject _findLatestHeartRateSample:](WeakRetained, "_findLatestHeartRateSample:", v8);
LABEL_9:

  }
}

- (void)_findLatestHeartRateSample:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  void *v25;
  NTKHeartRateQueryManager *v26;
  id v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B72A3000, v5, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: finding latest heart rate sample", buf, 2u);
  }

  -[NTKHeartRateQueryManager latestHeartRateSample](self, "latestHeartRateSample");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NTKHeartRateQueryManager canUseFutureSamples](self, "canUseFutureSamples"))
  {
    objc_msgSend(v4, "lastObject");
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
    goto LABEL_22;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (!v9)
  {

    goto LABEL_24;
  }
  v10 = v9;
  v26 = self;
  v27 = v4;
  v28 = 0;
  v11 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v30 != v11)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
      objc_msgSend(v13, "startDate", v26, v27);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceNow");
      v16 = v15;

      if (v16 > 60.0)
      {
        _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "startDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "quantity");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v34 = v18;
          v35 = 2112;
          v36 = v19;
          _os_log_error_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_ERROR, "NTKHeartRateQueryManager: ignoring heart rate with future date: %{public}@ (%@).", buf, 0x16u);

        }
LABEL_18:

        continue;
      }
      if (!v6)
        goto LABEL_15;
      objc_msgSend(v13, "startDate");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "startDate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "timeIntervalSinceDate:", v21);
      v23 = v22;

      if (v23 > 2.22044605e-16)
      {
LABEL_15:
        v24 = v13;

        _NTKLoggingObjectForDomain(38, (uint64_t)"NTKLoggingDomainHeartRate");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v24, "startDate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v34 = v25;
          _os_log_impl(&dword_1B72A3000, v17, OS_LOG_TYPE_DEFAULT, "NTKHeartRateQueryManager: updated latest heart rate sample: %{public}@", buf, 0xCu);

        }
        v28 = 1;
        v6 = v24;
        goto LABEL_18;
      }
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  }
  while (v10);

  self = v26;
  v4 = v27;
  if ((v28 & 1) != 0)
  {
LABEL_22:
    -[NTKHeartRateQueryManager setLatestHeartRateSample:](self, "setLatestHeartRateSample:", v6);
    -[NTKHeartRateQueryManager _notifyObserversOfLatestSample](self, "_notifyObserversOfLatestSample");
  }
LABEL_24:

}

- (HKQuantitySample)latestHeartRateSample
{
  NSObject *sampleQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40;
  v10 = __Block_byref_object_dispose__40;
  v11 = 0;
  sampleQueue = self->_sampleQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__NTKHeartRateQueryManager_latestHeartRateSample__block_invoke;
  v5[3] = &unk_1E6BD1498;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKQuantitySample *)v3;
}

void __49__NTKHeartRateQueryManager_latestHeartRateSample__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)setLatestHeartRateSample:(id)a3
{
  id v4;
  NSObject *sampleQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sampleQueue = self->_sampleQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__NTKHeartRateQueryManager_setLatestHeartRateSample___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(sampleQueue, v7);

}

void __53__NTKHeartRateQueryManager_setLatestHeartRateSample___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

- (HKHeartRateSummary)latestHeartRateSummary
{
  NSObject *sampleQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__40;
  v10 = __Block_byref_object_dispose__40;
  v11 = 0;
  sampleQueue = self->_sampleQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__NTKHeartRateQueryManager_latestHeartRateSummary__block_invoke;
  v5[3] = &unk_1E6BD1498;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(sampleQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HKHeartRateSummary *)v3;
}

void __50__NTKHeartRateQueryManager_latestHeartRateSummary__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 80));
}

- (void)setLatestHeartRateSummary:(id)a3
{
  id v4;
  NSObject *sampleQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  sampleQueue = self->_sampleQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__NTKHeartRateQueryManager_setLatestHeartRateSummary___block_invoke;
  v7[3] = &unk_1E6BCD778;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_barrier_async(sampleQueue, v7);

}

void __54__NTKHeartRateQueryManager_setLatestHeartRateSummary___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 80), *(id *)(a1 + 40));
}

- (BOOL)canUseFutureSamples
{
  int v3;
  void *v4;

  v3 = NTKInternalBuild(self, a2);
  if (v3)
  {
    if (!-[NTKHeartRateQueryManager hasCheckedDefaults](self, "hasCheckedDefaults"))
    {
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.NanoTimeKit"));
      self->_canUseFutureSamples = objc_msgSend(v4, "BOOLForKey:", CFSTR("useFutureSamples"));
      -[NTKHeartRateQueryManager setCheckedDefaults:](self, "setCheckedDefaults:", 1);

    }
    LOBYTE(v3) = self->_canUseFutureSamples;
  }
  return v3;
}

- (BOOL)hasCheckedDefaults
{
  return self->_checkedDefaults;
}

- (void)setCheckedDefaults:(BOOL)a3
{
  self->_checkedDefaults = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestHeartRateSummary, 0);
  objc_storeStrong((id *)&self->_latestHeartRateSample, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_heartRateSummaryQuery, 0);
  objc_storeStrong((id *)&self->_heartRateQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_sampleQueue, 0);
  objc_storeStrong((id *)&self->_healthQueue, 0);
}

- (void)_queue_clearHeartRateSampleQueryWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "NTKHeartRateQueryManager: HKAnchoredObjectQuery failed. %{public}@", (uint8_t *)&v3);
}

- (void)_queue_clearHeartRateSummaryQueryWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, a3, "NTKHeartRateQueryManager: Heart Rate Summary Query failed. %{public}@", (uint8_t *)&v3);
}

void __62__NTKHeartRateQueryManager__queue_retrieveLatestHeartRateOnce__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_4(&dword_1B72A3000, a2, v4, "NTKHeartRateQueryManager: Error when attempting to retrieve the latest heart rate sample. %@", (uint8_t *)&v5);

}

@end
