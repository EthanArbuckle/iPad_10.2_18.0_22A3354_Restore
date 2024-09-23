@implementation HKCloudSyncObserver

- (HKCloudSyncObserver)initWithHealthStore:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  HKCloudSyncObserver *v8;
  uint64_t v9;
  NSUUID *identifier;
  HKTaskServerProxyProvider *v11;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HKCloudSyncObserver;
  v8 = -[HKCloudSyncObserver init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = objc_claimAutoreleasedReturnValue();
    identifier = v8->_identifier;
    v8->_identifier = (NSUUID *)v9;

    objc_storeWeak((id *)&v8->_delegate, v7);
    v11 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:]([HKTaskServerProxyProvider alloc], "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v6, CFSTR("HKCloudSyncObserverServerIdentifier"), v8, v8->_identifier);
    proxyProvider = v8->_proxyProvider;
    v8->_proxyProvider = v11;

    -[HKProxyProvider setShouldRetryOnInterruption:](v8->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_filter = 0;
    *(_WORD *)&v8->_isObservingSyncRequests = 0;
    objc_initWeak(&location, v8);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__HKCloudSyncObserver_initWithHealthStore_delegate___block_invoke;
    v14[3] = &unk_1E37E95B8;
    objc_copyWeak(&v15, &location);
    -[HKProxyProvider setAutomaticProxyReconnectionHandler:](v8->_proxyProvider, "setAutomaticProxyReconnectionHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __52__HKCloudSyncObserver_initWithHealthStore_delegate___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v2;
  int os_unfair_lock_opaque_low;
  uint64_t v4;
  int v5;
  os_unfair_lock_s *v6;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 12;
    v6 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 12);
    os_unfair_lock_opaque_low = LOBYTE(v6[16]._os_unfair_lock_opaque);
    v4 = *(_QWORD *)&v6[14]._os_unfair_lock_opaque;
    v5 = BYTE1(v6[16]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v2);
    if (os_unfair_lock_opaque_low)
      -[os_unfair_lock_s startObservingSyncRequestsMatchingFilter:](v6, "startObservingSyncRequestsMatchingFilter:", v4);
    WeakRetained = v6;
    if (v5)
    {
      -[os_unfair_lock_s startObservingSyncStatus](v6, "startObservingSyncStatus");
      WeakRetained = v6;
    }
  }

}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (HKCloudSyncObserverDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (HKCloudSyncObserverDelegate *)WeakRetained;
}

- (HKCloudSyncObserverStatus)status
{
  os_unfair_lock_s *p_lock;
  HKCloudSyncObserverStatus *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_status;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setStatus:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  HKCloudSyncObserverStatus *v6;
  HKCloudSyncObserverStatus *status;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  v6 = (HKCloudSyncObserverStatus *)objc_msgSend(v5, "copy");

  status = self->_status;
  self->_status = v6;

  os_unfair_lock_unlock(p_lock);
}

- (void)startObservingSyncStatus
{
  os_unfair_lock_s *p_lock;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v5[5];
  _QWORD v6[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isObservingSyncStatus = 1;
  os_unfair_lock_unlock(p_lock);
  proxyProvider = self->_proxyProvider;
  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke;
  v6[3] = &unk_1E37EC010;
  v6[4] = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_148;
  v5[3] = &unk_1E37E6A70;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v6, v5);
}

uint64_t __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_2;
  v3[3] = &unk_1E37E6770;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingSyncStatusWithCompletion:", v3);
}

void __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = HKLogSync;
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Started observing sync status", (uint8_t *)&v4, 0xCu);
  }
}

void __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_148()
{
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_148_cold_1();
}

- (void)clientRemote_didUpdateObserverWithSyncStatus:(id)a3
{
  id v5;
  id WeakRetained;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  HKCloudSyncObserver *v12;
  id v13;

  v5 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_storeStrong((id *)&self->_status, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__HKCloudSyncObserver_clientRemote_didUpdateObserverWithSyncStatus___block_invoke;
  block[3] = &unk_1E37E6738;
  v11 = WeakRetained;
  v12 = self;
  v13 = v5;
  v8 = v5;
  v9 = WeakRetained;
  dispatch_sync(v7, block);

}

uint64_t __68__HKCloudSyncObserver_clientRemote_didUpdateObserverWithSyncStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cloudSyncObserverStatusUpdated:status:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)clientRemote_didFailToPopulateStatusWithError:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  HKCloudSyncObserver *v11;
  id v12;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HKCloudSyncObserver_clientRemote_didFailToPopulateStatusWithError___block_invoke;
  block[3] = &unk_1E37E6738;
  v10 = WeakRetained;
  v11 = self;
  v12 = v4;
  v7 = v4;
  v8 = WeakRetained;
  dispatch_sync(v6, block);

}

uint64_t __69__HKCloudSyncObserver_clientRemote_didFailToPopulateStatusWithError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "cloudSyncObserver:didFailToPopulateStatusWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  return result;
}

- (id)progress
{
  os_unfair_lock_s *p_lock;
  NSProgress *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = self->_progress;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setProgress:(id)a3
{
  NSProgress *v4;
  NSProgress *progress;

  v4 = (NSProgress *)a3;
  os_unfair_lock_lock(&self->_lock);
  progress = self->_progress;
  self->_progress = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)startSyncIfRestoreNotCompleted
{
  uint64_t v3;
  void *v4;
  HKTaskServerProxyProvider *proxyProvider;
  id v6;
  _QWORD v7[5];
  id v8;
  _QWORD v9[5];
  id v10;
  _QWORD aBlock[5];

  v3 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke;
  aBlock[3] = &unk_1E37EC038;
  aBlock[4] = self;
  v4 = _Block_copy(aBlock);
  proxyProvider = self->_proxyProvider;
  v9[0] = v3;
  v9[1] = 3221225472;
  v9[2] = __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_3;
  v9[3] = &unk_1E37EC060;
  v9[4] = self;
  v10 = v4;
  v7[0] = v3;
  v7[1] = 3221225472;
  v7[2] = __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_4;
  v7[3] = &unk_1E37E69F8;
  v7[4] = self;
  v8 = v10;
  v6 = v10;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v9, v7);

}

void __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  id v10;
  uint64_t v11;

  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_2;
  block[3] = &unk_1E37E69A8;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = a2;
  block[4] = v7;
  v8 = v5;
  dispatch_async(v6, block);

}

uint64_t __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_clientQueue_didCompleteSyncWithStatus:error:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

void __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = *(void **)(a1 + 32);
  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a2;
  objc_msgSend(v4, "UUID");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remote_startSyncIfRestoreNotCompletedWithUUID:completion:", v7, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setProgress:", v6);
}

void __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_4_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_clientQueue_didCompleteSyncWithStatus:(int64_t)a3 error:(id)a4
{
  NSObject *v6;
  id WeakRetained;
  id v8;

  v8 = a4;
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  if (a3 == 2)
  {
    objc_msgSend(WeakRetained, "cloudSyncObserverSyncCompleted:", self);
  }
  else if ((a3 & 0xFFFFFFFFFFFFFFFBLL) == 0)
  {
    objc_msgSend(WeakRetained, "cloudSyncObserver:syncFailedWithError:", self, v8);
  }

}

- (void)clientRemote_syncDidStart
{
  OUTLINED_FUNCTION_2(&dword_19A0E6000, a2, a3, "%{public}@: Called sync observer client, but progress is nil", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

uint64_t __48__HKCloudSyncObserver_clientRemote_syncDidStart__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cloudSyncObserver:syncDidStartWithProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24));
}

- (void)startObservingSyncRequestsMatchingFilter:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v7[5];
  _QWORD v8[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_filter = a3;
  self->_isObservingSyncRequests = 1;
  os_unfair_lock_unlock(p_lock);
  proxyProvider = self->_proxyProvider;
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke;
  v8[3] = &__block_descriptor_40_e46_v16__0___HKCloudSyncObserverServerInterface__8l;
  v8[4] = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke_2;
  v7[3] = &unk_1E37E6A70;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v8, v7);
}

uint64_t __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingSyncRequestsMatchingFilter:", *(_QWORD *)(a1 + 32));
}

void __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke_2()
{
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke_2_cold_1();
}

- (void)stopObservingSyncRequests
{
  os_unfair_lock_s *p_lock;
  HKTaskServerProxyProvider *proxyProvider;
  _QWORD v5[5];

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_filter = 0;
  self->_isObservingSyncRequests = 0;
  os_unfair_lock_unlock(p_lock);
  proxyProvider = self->_proxyProvider;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke_2;
  v5[3] = &unk_1E37E6A70;
  v5[4] = self;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_29, v5);
}

uint64_t __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingSyncRequests");
}

void __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke_2()
{
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke_2_cold_1();
}

- (void)clientRemote_syncRequestDidStart:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;
  HKCloudSyncObserver *v10;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke;
  v8[3] = &unk_1E37EC108;
  v9 = v4;
  v10 = self;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_4;
  v7[3] = &unk_1E37E6A70;
  v6 = v4;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v8, v7);

}

void __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke(int8x16_t *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  int8x16_t v12;
  _QWORD block[4];
  id v14;
  int8x16_t v15;
  id v16;

  v3 = (void *)a1[2].i64[0];
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "remote_retrieveProgressForIdentifier:completion:", v5, &__block_literal_global_154);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_lock((os_unfair_lock_t)(a1[2].i64[1] + 48));
  WeakRetained = objc_loadWeakRetained((id *)(a1[2].i64[1] + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(a1[2].i64[1] + 48));
  objc_msgSend(*(id *)(a1[2].i64[1] + 16), "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_3;
  block[3] = &unk_1E37EBEA8;
  v14 = WeakRetained;
  v12 = a1[2];
  v9 = (id)v12.i64[0];
  v15 = vextq_s8(v12, v12, 8uLL);
  v16 = v6;
  v10 = v6;
  v11 = WeakRetained;
  dispatch_async(v8, block);

}

uint64_t __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "cloudSyncObserver:syncStartedForRequest:withProgress:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

void __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_4()
{
  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)HKLogSync, OS_LOG_TYPE_ERROR))
    __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_4_cold_1();
}

- (void)clientRemote_syncRequestDidComplete:(id)a3 success:(BOOL)a4 error:(id)a5
{
  id v8;
  id v9;
  id WeakRetained;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  HKCloudSyncObserver *v17;
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(&self->_lock);
  -[HKProxyProvider clientQueue](self->_proxyProvider, "clientQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__HKCloudSyncObserver_clientRemote_syncRequestDidComplete_success_error___block_invoke;
  block[3] = &unk_1E37EC130;
  v20 = a4;
  v16 = WeakRetained;
  v17 = self;
  v18 = v8;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  v14 = WeakRetained;
  dispatch_sync(v11, block);

}

uint64_t __73__HKCloudSyncObserver_clientRemote_syncRequestDidComplete_success_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 64))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "cloudSyncObserver:syncCompletedForRequest:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "cloudSyncObserver:syncFailedForRequest:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  return result;
}

+ (id)serverInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40EB08);
}

+ (id)clientInterface
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3BC2F8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v3, "setWithObjects:", v4, v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_clientRemote_didUpdateObserverWithSyncStatus_, 0, 0);

  return v2;
}

- (id)exportedInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "clientInterface");
}

- (id)remoteInterface
{
  return (id)objc_msgSend((id)objc_opt_class(), "serverInterface");
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __47__HKCloudSyncObserver_startObservingSyncStatus__block_invoke_148_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: Failed to call remote method startObservingSyncStatusWithCompletion:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __53__HKCloudSyncObserver_startSyncIfRestoreNotCompleted__block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: Failed to call remote method startSyncIfRestoreNotCompletedWithUUID:completion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__HKCloudSyncObserver_startObservingSyncRequestsMatchingFilter___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: Failed to call remote method startObservingSyncRequestsWithFilter:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__HKCloudSyncObserver_stopObservingSyncRequests__block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: Failed to call remote method stopObservingSyncRequests", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__HKCloudSyncObserver_clientRemote_syncRequestDidStart___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_2(&dword_19A0E6000, v0, v1, "%{public}@: Failed to call remote method retrieveProgressForIdentifier::completion:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
