@implementation HDMirroredWorkoutSessionServer

- (HDMirroredWorkoutSessionServer)initWithProfile:(id)a3 configuration:(id)a4 sessionUUID:(id)a5 globalState:(id)a6 clientBundleIdentifier:(id)a7
{
  id v12;
  id v13;
  HDMirroredWorkoutSessionServer *v14;
  HDMirroredWorkoutSessionServer *v15;
  void *startDate;
  void *stopDate;
  void *v18;
  void *v19;
  uint64_t v20;
  HKWorkoutActivity *currentActivity;
  NSMutableArray *v22;
  NSMutableArray *pendingClientUpdates;
  NSMutableArray *v24;
  NSMutableArray *pendingData;
  objc_super v27;

  v12 = a6;
  v13 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HDMirroredWorkoutSessionServer;
  v14 = -[HDWorkoutSessionServer initWithProfile:configuration:sessionUUID:](&v27, sel_initWithProfile_configuration_sessionUUID_, a3, a4, a5);
  v15 = v14;
  if (v14)
  {
    v14->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v14->super._clientProcessBundleIdentifier, a7);
    v15->super._isMirroring = 1;
    v15->_sessionState = objc_msgSend(v12, "sessionState");
    if ((objc_msgSend(v12, "hasStartDate") & 1) != 0)
    {
      objc_msgSend(v12, "startDate");
      HDDecodeDateForValue();
      startDate = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v15->super._startDate, startDate);
    }
    else
    {
      startDate = v15->super._startDate;
      v15->super._startDate = 0;
    }

    if ((objc_msgSend(v12, "hasEndDate") & 1) != 0)
    {
      objc_msgSend(v12, "endDate");
      HDDecodeDateForValue();
      stopDate = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&v15->super._stopDate, stopDate);
    }
    else
    {
      stopDate = v15->super._stopDate;
      v15->super._stopDate = 0;
    }

    v18 = (void *)MEMORY[0x1E0CB6DD8];
    objc_msgSend(v12, "currentActivity");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "createWithCodable:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    currentActivity = v15->super._currentActivity;
    v15->super._currentActivity = (HKWorkoutActivity *)v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingClientUpdates = v15->_pendingClientUpdates;
    v15->_pendingClientUpdates = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingData = v15->_pendingData;
    v15->_pendingData = v24;

    -[HDMirroredWorkoutSessionServer _setupLiveActivityObserver](v15, "_setupLiveActivityObserver");
    -[HDMirroredWorkoutSessionServer _takeLiveActivityBackgroundAssertion](v15, "_takeLiveActivityBackgroundAssertion");
    -[HDMirroredWorkoutSessionServer _launchClientInTheBackground](v15, "_launchClientInTheBackground");
    -[HDMirroredWorkoutSessionServer _setupProcessStateManagerObserver](v15, "_setupProcessStateManagerObserver");
  }

  return v15;
}

- (void)dealloc
{
  BSInvalidatable *liveActivitySubscription;
  NSObject *v4;
  SNAAssertion *liveActivityAssertion;
  id WeakRetained;
  void *v7;
  void *v8;
  NSObject *periodicRuntimeSource;
  OS_dispatch_source *v10;
  objc_super v11;
  uint8_t buf[4];
  HDMirroredWorkoutSessionServer *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[BSInvalidatable invalidate](self->_liveActivitySubscription, "invalidate");
  liveActivitySubscription = self->_liveActivitySubscription;
  self->_liveActivitySubscription = 0;

  if (self->_liveActivityAssertion)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v13 = self;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Will invalidate Live Activity background assertion after server dealloc.", buf, 0xCu);
    }
    -[SNAAssertion invalidate](self->_liveActivityAssertion, "invalidate");
    liveActivityAssertion = self->_liveActivityAssertion;
    self->_liveActivityAssertion = 0;

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->super._profile);
  objc_msgSend(WeakRetained, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "processStateManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterObserver:forBundleIdentifier:", self, self->super._clientProcessBundleIdentifier);

  os_unfair_lock_lock(&self->_lock);
  periodicRuntimeSource = self->_periodicRuntimeSource;
  if (periodicRuntimeSource)
  {
    dispatch_source_cancel(periodicRuntimeSource);
    v10 = self->_periodicRuntimeSource;
    self->_periodicRuntimeSource = 0;

  }
  os_unfair_lock_unlock(&self->_lock);
  v11.receiver = self;
  v11.super_class = (Class)HDMirroredWorkoutSessionServer;
  -[HDWorkoutSessionServer dealloc](&v11, sel_dealloc);
}

- (void)_setupProcessStateManagerObserver
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._profile);
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processStateManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:forBundleIdentifier:", self, self->super._clientProcessBundleIdentifier);

}

- (void)_executeClientDataUpdate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  objc_super v9;
  uint8_t buf[4];
  HDMirroredWorkoutSessionServer *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v9.receiver = self;
    v9.super_class = (Class)HDMirroredWorkoutSessionServer;
    -[HDWorkoutSessionServer didReceiveDataFromRemoteWorkoutSession:completion:](&v9, sel_didReceiveDataFromRemoteWorkoutSession_completion_, v6, v7);
  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v11 = self;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "[mirroring] %{public}@: No pending data to deliver", buf, 0xCu);
    }
  }

}

- (void)didDisconnectFromRemoteWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->super._queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 0;
  objc_msgSend(*(id *)(a1 + 32), "_launchClientInTheBackground");
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_2;
  v3[3] = &unk_1E6CF92A0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "_enqueueClientUpdate:launchClient:waitForClientSetup:", v3, 0, 1);

}

void __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v3;
  id *v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = (void *)a2[4];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_3;
  v7[3] = &unk_1E6CF93D0;
  v8 = *(id *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "sendToDestinationProcessors:", v7);
  WeakRetained = objc_loadWeakRetained(v4 + 1);
  objc_msgSend(WeakRetained, "workoutManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tearDownMirroredWorkoutSession:", v4);

}

uint64_t __67__HDMirroredWorkoutSessionServer_didDisconnectFromRemoteWithError___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didDisconnectFromRemoteWithError:", *(_QWORD *)(a1 + 32));
}

- (void)syncTransitionToState:(int64_t)a3 date:(id)a4 completion:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  _QWORD block[5];
  id v13;
  int64_t v14;

  v8 = a4;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke;
  block[3] = &unk_1E6CE9C58;
  v13 = v8;
  v14 = a3;
  block[4] = self;
  v10 = v8;
  v11 = (void (**)(id, uint64_t, _QWORD))a5;
  dispatch_async(queue, block);
  v11[2](v11, 1, 0);

}

void __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288) = *(_QWORD *)(a1 + 48);
  v2 = HKWorkoutSessionStateFromServerState();
  v3 = HKWorkoutSessionStateFromServerState();
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5380];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      v7 = v4;
      _HKWorkoutSessionServerStateToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _HKWorkoutSessionServerStateToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v19 = v6;
      v20 = 2112;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Synced state: %@ is equivalent to current state: %@, not notifying the client", buf, 0x20u);

    }
  }
  else
  {
    if (v5)
    {
      v10 = v4;
      v11 = (void *)objc_opt_class();
      v12 = v11;
      _HKWorkoutSessionServerStateToString();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v11;
      v20 = 2112;
      v21 = v13;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Notifying client of synced transition to new state: %@", buf, 0x16u);

    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke_191;
    v15[3] = &unk_1E6CF92C8;
    v17 = *(_QWORD *)(a1 + 48);
    v14 = *(void **)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    objc_msgSend(v14, "_enqueueClientUpdate:launchClient:waitForClientSetup:", v15, 1, 1);

  }
}

void __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke_191(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  uint64_t v6;

  v2 = *(void **)(a2 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke_2;
  v4[3] = &unk_1E6CF93F8;
  v3 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  objc_msgSend(v2, "sendToDestinationProcessors:", v4);

}

void __72__HDMirroredWorkoutSessionServer_syncTransitionToState_date_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "didSyncTransitionToNewState:date:", HKWorkoutSessionStateFromServerState(), *(_QWORD *)(a1 + 32));

}

- (void)syncSessionEvent:(int64_t)a3 date:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HDMirroredWorkoutSessionServer_syncSessionEvent_date___block_invoke;
  block[3] = &unk_1E6CE9C58;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

_QWORD *__56__HDMirroredWorkoutSessionServer_syncSessionEvent_date___block_invoke(_QWORD *result)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  v1 = result[4];
  if (*(_BYTE *)(v1 + 64))
  {
    v2 = *(void **)(v1 + 72);
    v4 = result[5];
    v3 = result[6];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __56__HDMirroredWorkoutSessionServer_syncSessionEvent_date___block_invoke_2;
    v5[3] = &unk_1E6CE77C8;
    v5[4] = v1;
    return (_QWORD *)objc_msgSend(v2, "sendStateEvent:date:completion:", v3, v4, v5);
  }
  return result;
}

void __56__HDMirroredWorkoutSessionServer_syncSessionEvent_date___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send state event to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)syncCurrentActivity:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  _QWORD v10[4];
  id v11;
  HDMirroredWorkoutSessionServer *v12;

  v6 = a3;
  queue = self->super._queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke;
  v10[3] = &unk_1E6CE8080;
  v11 = v6;
  v12 = self;
  v8 = v6;
  v9 = (void (**)(id, uint64_t, _QWORD))a4;
  dispatch_async(queue, v10);
  v9[2](v9, 1, 0);

}

void __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[4];
  _QWORD v26[2];
  _QWORD v27[4];
  _QWORD v28[2];
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "endDate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = *(void **)(a1 + 32);
    if (!v3)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 56), v4);
      _HKInitializeLogging();
      v5 = (void *)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v6 = v5;
        v7 = (void *)objc_opt_class();
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v30 = v7;
        v31 = 2114;
        v32 = v8;
        v9 = v7;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Remote session beginning new activity: %{public}@", buf, 0x16u);

      }
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_193;
      v27[3] = &unk_1E6CF92F0;
      v10 = (id *)v28;
      v11 = *(void **)(a1 + 40);
      v12 = *(id *)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v28[0] = v12;
      v28[1] = v13;
      objc_msgSend(v11, "_enqueueClientUpdate:launchClient:waitForClientSetup:", v27, 1, 1);
      goto LABEL_11;
    }
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v4, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    return;
  _HKInitializeLogging();
  v15 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    v17 = (void *)objc_opt_class();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56);
    *(_DWORD *)buf = 138543618;
    v30 = v17;
    v31 = 2114;
    v32 = v18;
    v19 = v17;
    _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Remote session ending current activity: %{public}@", buf, 0x16u);

  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_194;
  v25[3] = &unk_1E6CF92F0;
  v10 = (id *)v26;
  v20 = *(void **)(a1 + 40);
  v21 = *(id *)(a1 + 32);
  v22 = *(_QWORD *)(a1 + 40);
  v26[0] = v21;
  v26[1] = v22;
  objc_msgSend(v20, "_enqueueClientUpdate:launchClient:waitForClientSetup:", v25, 1, 1);
  v23 = *(_QWORD *)(a1 + 40);
  v24 = *(void **)(v23 + 56);
  *(_QWORD *)(v23 + 56) = 0;

LABEL_11:
}

void __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_193(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = *(void **)(a2 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_2;
  v6[3] = &unk_1E6CE8008;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "sendToDestinationProcessors:", v6);

}

uint64_t __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didBeginActivity:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_194(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = *(void **)(a2 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_2_195;
  v6[3] = &unk_1E6CE8008;
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "sendToDestinationProcessors:", v6);

}

uint64_t __65__HDMirroredWorkoutSessionServer_syncCurrentActivity_completion___block_invoke_2_195(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEndActivity:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)syncWorkoutEvents:(id)a3 completion:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  void (**v9)(id, uint64_t, _QWORD);
  _QWORD v10[4];
  id v11;
  HDMirroredWorkoutSessionServer *v12;

  v6 = a3;
  queue = self->super._queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke;
  v10[3] = &unk_1E6CE8080;
  v11 = v6;
  v12 = self;
  v8 = v6;
  v9 = (void (**)(id, uint64_t, _QWORD))a4;
  dispatch_async(queue, v10);
  v9[2](v9, 1, 0);

}

void __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "hk_map:", &__block_literal_global_104);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_3;
  v5[3] = &unk_1E6CF92A0;
  v6 = v2;
  v4 = v2;
  objc_msgSend(v3, "_enqueueClientUpdate:launchClient:waitForClientSetup:", v5, 1, 1);

}

id __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB7048];
  v3 = a2;
  v4 = objc_msgSend(v2, "internalEventTypeWithPublicEvent:", v3);
  v5 = objc_alloc(MEMORY[0x1E0CB7048]);
  objc_msgSend(v3, "sessionUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithEventType:sessionId:dateInterval:metadata:", v4, v6, v7, v8);
  return v9;
}

void __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_3(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  _QWORD *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = (void *)v3[4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_4;
  v6[3] = &unk_1E6CE8008;
  v7 = *(id *)(a1 + 32);
  v8 = v3;
  v5 = v3;
  objc_msgSend(v4, "sendToDestinationProcessors:", v6);

}

uint64_t __63__HDMirroredWorkoutSessionServer_syncWorkoutEvents_completion___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "addWorkoutEvents:dataSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)receivedBackgroundRuntimeRequestWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);

  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[HDMirroredWorkoutSessionServer _launchClientInTheBackground](self, "_launchClientInTheBackground");
  v4[2](v4, 1, 0);

}

- (void)didReceiveDataFromRemoteWorkoutSession:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __84__HDMirroredWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke;
  v10[3] = &unk_1E6CF9358;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[HDMirroredWorkoutSessionServer _enqueueClientUpdate:launchClient:waitForClientSetup:](self, "_enqueueClientUpdate:launchClient:waitForClientSetup:", v10, 0, 1);
  -[HDMirroredWorkoutSessionServer _schedulePeriodicRuntime](self, "_schedulePeriodicRuntime");

}

void __84__HDMirroredWorkoutSessionServer_didReceiveDataFromRemoteWorkoutSession_completion___block_invoke(_QWORD *a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processStateManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(WeakRetained) = objc_msgSend(v5, "isApplicationStateForegroundForBundleIdentifier:", *(_QWORD *)(a1[4] + 24));
  v6 = objc_msgSend(v5, "isApplicationStateBackgroundRunningForBundleIdentifier:", *(_QWORD *)(a1[4] + 24));
  if ((WeakRetained & 1) != 0 || v6)
  {
    objc_msgSend(v7, "_executeClientDataUpdate:completion:", a1[5], a1[6]);
  }
  else
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1[4] + 280));
    objc_msgSend(*(id *)(a1[4] + 352), "addObjectsFromArray:", a1[5]);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1[4] + 280));
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)_executeClientUpdate:(id)a3
{
  void (**v4)(id, HDMirroredWorkoutSessionServer *);
  id v5;
  id location;

  v4 = (void (**)(id, HDMirroredWorkoutSessionServer *))a3;
  v5 = objc_initWeak(&location, self);
  v4[2](v4, self);

  objc_destroyWeak(&location);
}

- (void)_enqueueClientUpdate:(id)a3 launchClient:(BOOL)a4 waitForClientSetup:(BOOL)a5
{
  _BOOL4 v6;
  os_unfair_lock_s *p_lock;
  void *v10;
  NSMutableArray *pendingClientUpdates;
  void *v12;
  id aBlock;

  v6 = a4;
  aBlock = a3;
  if (self->_hasActiveLiveActivity && v6)
    -[HDMirroredWorkoutSessionServer _launchClientInTheBackground](self, "_launchClientInTheBackground");
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if ((-[HDWorkoutSessionServer clientDidSetupSession](self, "clientDidSetupSession") || a5)
    && (-[NSMutableArray count](self->_pendingClientUpdates, "count")
     || (-[HDWorkoutSessionServer taskServer](self, "taskServer"),
         v10 = (void *)objc_claimAutoreleasedReturnValue(),
         v10,
         !v10)))
  {
    pendingClientUpdates = self->_pendingClientUpdates;
    v12 = _Block_copy(aBlock);
    -[NSMutableArray addObject:](pendingClientUpdates, "addObject:", v12);

    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
    -[HDMirroredWorkoutSessionServer _executeClientUpdate:](self, "_executeClientUpdate:", aBlock);
  }

}

- (void)_schedulePeriodicRuntime
{
  os_unfair_lock_s *p_lock;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *periodicRuntimeSource;
  NSObject *v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  id location;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_periodicRuntimeSource)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    periodicRuntimeSource = self->_periodicRuntimeSource;
    self->_periodicRuntimeSource = v5;

    v7 = self->_periodicRuntimeSource;
    v8 = dispatch_time(0, 300000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    objc_initWeak(&location, self);
    v9 = self->_periodicRuntimeSource;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__HDMirroredWorkoutSessionServer__schedulePeriodicRuntime__block_invoke;
    v10[3] = &unk_1E6CECE78;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_periodicRuntimeSource);
    os_unfair_lock_unlock(p_lock);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __58__HDMirroredWorkoutSessionServer__schedulePeriodicRuntime__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_flushPendingDataRequests");

}

- (void)_flushPendingDataRequests
{
  os_unfair_lock_s *p_lock;
  OS_dispatch_source *periodicRuntimeSource;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  periodicRuntimeSource = self->_periodicRuntimeSource;
  self->_periodicRuntimeSource = 0;

  os_unfair_lock_unlock(p_lock);
  -[HDMirroredWorkoutSessionServer _launchClientInTheBackground](self, "_launchClientInTheBackground");
}

- (void)_flushPendingData
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  HDMirroredWorkoutSessionServer *v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSMutableArray copy](self->_pendingData, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingData, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HDMirroredWorkoutSessionServer__flushPendingData__block_invoke;
  v6[3] = &unk_1E6CEB718;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[HDMirroredWorkoutSessionServer _executeClientDataUpdate:completion:](self, "_executeClientDataUpdate:completion:", v5, v6);

}

void __51__HDMirroredWorkoutSessionServer__flushPendingData__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(*(id *)(a1 + 32), "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 280));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 352), "insertObjects:atIndexes:", *(_QWORD *)(a1 + 32), v6);
    os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 40) + 280));
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(_QWORD *)(v8 + 24);
      v10 = 138543874;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      v14 = 2114;
      v15 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send pending data to client: %{public}@ with error %{public}@", (uint8_t *)&v10, 0x20u);
    }

  }
}

- (int64_t)sessionType
{
  return 1;
}

- (int64_t)state
{
  return self->_sessionState;
}

- (BOOL)shouldStopPreviousSession
{
  return 1;
}

- (void)setTaskServer:(id)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)HDMirroredWorkoutSessionServer;
  -[HDWorkoutSessionServer setTaskServer:](&v15, sel_setTaskServer_);
  if (a3)
  {
    os_unfair_lock_lock(&self->_lock);
    v5 = (void *)-[NSMutableArray copy](self->_pendingClientUpdates, "copy");
    -[NSMutableArray removeAllObjects](self->_pendingClientUpdates, "removeAllObjects");
    os_unfair_lock_unlock(&self->_lock);
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          -[HDMirroredWorkoutSessionServer _executeClientUpdate:](self, "_executeClientUpdate:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++), (_QWORD)v11);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

  }
}

- (BOOL)_queue_clientApplicationCanStartWorkoutSessionWithError:(id *)a3
{
  NSObject *v4;
  int v6;
  HDMirroredWorkoutSessionServer *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543362;
    v7 = self;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Mirrored workout sessions always allowed to start", (uint8_t *)&v6, 0xCu);
  }
  return 1;
}

- (void)processDidEnterBackground:(id)a3
{
  NSObject *v4;
  NSString *clientProcessBundleIdentifier;
  int v6;
  HDMirroredWorkoutSessionServer *v7;
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    clientProcessBundleIdentifier = self->super._clientProcessBundleIdentifier;
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = clientProcessBundleIdentifier;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "[mirroring] %{public}@: Send pending data to background client: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[HDMirroredWorkoutSessionServer _flushPendingData](self, "_flushPendingData");
}

- (void)processDidEnterForeground:(id)a3
{
  NSObject *v4;
  NSString *clientProcessBundleIdentifier;
  int v6;
  HDMirroredWorkoutSessionServer *v7;
  __int16 v8;
  NSString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_INFO))
  {
    clientProcessBundleIdentifier = self->super._clientProcessBundleIdentifier;
    v6 = 138543618;
    v7 = self;
    v8 = 2114;
    v9 = clientProcessBundleIdentifier;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_INFO, "[mirroring] %{public}@: Send pending data to foreground client: %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[HDMirroredWorkoutSessionServer _flushPendingData](self, "_flushPendingData");
}

- (BOOL)setTargetState:(int64_t)a3 date:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *queue;
  id v9;
  _QWORD block[5];
  id v12;
  int64_t v13;

  v7 = a4;
  queue = self->super._queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HDMirroredWorkoutSessionServer_setTargetState_date_error___block_invoke;
  block[3] = &unk_1E6CE9C58;
  v12 = v7;
  v13 = a3;
  block[4] = self;
  v9 = v7;
  dispatch_async(queue, block);

  return 1;
}

void __60__HDMirroredWorkoutSessionServer_setTargetState_date_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = HKWorkoutSessionServerStateFromSessionState();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 288);
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E0CB5380];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT);
  if (v2 == v3)
  {
    if (v5)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = v4;
      _HKWorkoutSessionServerStateToString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      _HKWorkoutSessionServerStateToString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v6;
      v17 = 2114;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Target state: %{public}@ is same as current state: %{public}@", buf, 0x20u);

    }
  }
  else
  {
    if (v5)
    {
      v10 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v10;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Sending mirrored session state update", buf, 0xCu);
    }
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(v12 + 72);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60__HDMirroredWorkoutSessionServer_setTargetState_date_error___block_invoke_201;
    v14[3] = &unk_1E6CE77C8;
    v14[4] = v12;
    objc_msgSend(v13, "sendStateUpdate:date:completion:", v2, v11, v14);
  }
}

void __60__HDMirroredWorkoutSessionServer_setTargetState_date_error___block_invoke_201(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send session updates to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (BOOL)beginNewActivityWithConfiguration:(id)a3 date:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  HDWorkoutSessionRapportSyncController *syncController;
  _QWORD v15[5];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6DD8]), "initWithWorkoutConfiguration:startDate:endDate:metadata:", v9, v10, 0, v11);
  syncController = self->super._syncController;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__HDMirroredWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke;
  v15[3] = &unk_1E6CE77C8;
  v15[4] = self;
  -[HDWorkoutSessionRapportSyncController sendCurrentActivityUpdate:completion:](syncController, "sendCurrentActivityUpdate:completion:", v12, v15);

  return 1;
}

void __88__HDMirroredWorkoutSessionServer_beginNewActivityWithConfiguration_date_metadata_error___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send new activity request to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (BOOL)endCurrentActivityOnDate:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  queue = self->super._queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__HDMirroredWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

void __65__HDMirroredWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(v3, "_setEndDate:", v2);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__HDMirroredWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke_2;
  v6[3] = &unk_1E6CE77C8;
  v6[4] = v4;
  objc_msgSend(v5, "sendCurrentActivityUpdate:completion:", v3, v6);

}

void __65__HDMirroredWorkoutSessionServer_endCurrentActivityOnDate_error___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 138543618;
      v9 = v7;
      v10 = 2114;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[mirroring] %{public}@: Failed to send end current activity request to remote device: %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }

}

- (void)_setupLiveActivityObserver
{
  ACActivityCenter *v3;
  ACActivityCenter *liveActivityCenter;
  ACActivityCenter *v5;
  BSInvalidatable *v6;
  BSInvalidatable *liveActivitySubscription;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = (ACActivityCenter *)objc_alloc_init(MEMORY[0x1E0C90230]);
  liveActivityCenter = self->_liveActivityCenter;
  self->_liveActivityCenter = v3;

  objc_initWeak(&location, self);
  v5 = self->_liveActivityCenter;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__HDMirroredWorkoutSessionServer__setupLiveActivityObserver__block_invoke;
  v8[3] = &unk_1E6CF9380;
  objc_copyWeak(&v9, &location);
  -[ACActivityCenter observeContentUpdatesWithHandler:](v5, "observeContentUpdatesWithHandler:", v8);
  v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  liveActivitySubscription = self->_liveActivitySubscription;
  self->_liveActivitySubscription = v6;

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __60__HDMirroredWorkoutSessionServer__setupLiveActivityObserver__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_didUpdateLiveActivity:", v3);

}

- (void)_didUpdateLiveActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  NSObject *v12;
  const __CFString *v13;
  int v14;
  HDMirroredWorkoutSessionServer *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "platterTargetBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v7 = (os_log_t *)MEMORY[0x1E0CB5380];
  v8 = (id)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "state");
    if ((unint64_t)(v10 - 1) > 2)
      v11 = CFSTR("active");
    else
      v11 = off_1E6CF9418[v10 - 1];
    v14 = 138544130;
    v15 = self;
    v16 = 2114;
    v17 = v9;
    v18 = 2114;
    v19 = v11;
    v20 = 2114;
    v21 = v6;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Received Live Activity update %{public}@, state: %{public}@, bundle identifier: %{public}@", (uint8_t *)&v14, 0x2Au);

  }
  if (objc_msgSend(v6, "isEqualToString:", self->super._clientProcessBundleIdentifier))
  {
    self->_hasActiveLiveActivity = objc_msgSend(v4, "state") == 0;
    _HKInitializeLogging();
    v12 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_hasActiveLiveActivity)
        v13 = CFSTR("YES");
      else
        v13 = CFSTR("NO");
      v14 = 138543362;
      v15 = (HDMirroredWorkoutSessionServer *)v13;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "[mirroring] Did update Live Activity State. Active: %{public}@", (uint8_t *)&v14, 0xCu);
    }
  }

}

- (void)_takeLiveActivityBackgroundAssertion
{
  void *v3;
  id v4;
  SNAAssertion *v5;
  SNAAssertion *liveActivityAssertion;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  id v11;
  id location;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8CD00]), "initWithBundleIdentifier:", self->super._clientProcessBundleIdentifier);
  objc_initWeak(&location, self);
  v4 = objc_alloc(MEMORY[0x1E0D8CCF8]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __70__HDMirroredWorkoutSessionServer__takeLiveActivityBackgroundAssertion__block_invoke;
  v10 = &unk_1E6CF93A8;
  objc_copyWeak(&v11, &location);
  v5 = (SNAAssertion *)objc_msgSend(v4, "initWithExplanation:target:invalidationHandler:", CFSTR("Apple Watch workout mirrored to companion iPhone"), v3, &v7);
  liveActivityAssertion = self->_liveActivityAssertion;
  self->_liveActivityAssertion = v5;

  -[HDMirroredWorkoutSessionServer _setLiveActivityBackgroundAssertionTimeout](self, "_setLiveActivityBackgroundAssertionTimeout", v7, v8, v9, v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __70__HDMirroredWorkoutSessionServer__takeLiveActivityBackgroundAssertion__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v4;
  id v5;
  id v6;
  id WeakRetained;

  v4 = (id *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_didInvalidateLiveActivityBackgroundAssertion:error:", v6, v5);

}

- (void)_didInvalidateLiveActivityBackgroundAssertion:(id)a3 error:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v8 = a3;
  objc_msgSend(v8, "hd_description");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("[mirroring] %@: Invalidated Live Activity assertion %@."), self, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "invalidationReason");
  _HKInitializeLogging();
  v12 = *MEMORY[0x1E0CB5380];
  v13 = *MEMORY[0x1E0CB5380];
  if (v11 == 3)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v15 = v10;
    v16 = 2114;
    v17 = v6;
    _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@ with error: %{public}@.", buf, 0x16u);
  }

}

- (void)_setLiveActivityBackgroundAssertionTimeout
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *liveActivityAssertionTimeoutSource;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  dispatch_get_global_queue(21, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v3);
  liveActivityAssertionTimeoutSource = self->_liveActivityAssertionTimeoutSource;
  self->_liveActivityAssertionTimeoutSource = v4;

  v6 = self->_liveActivityAssertionTimeoutSource;
  v7 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak(&location, self);
  v8 = self->_liveActivityAssertionTimeoutSource;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HDMirroredWorkoutSessionServer__setLiveActivityBackgroundAssertionTimeout__block_invoke;
  v9[3] = &unk_1E6CECE78;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume((dispatch_object_t)self->_liveActivityAssertionTimeoutSource);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __76__HDMirroredWorkoutSessionServer__setLiveActivityBackgroundAssertionTimeout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_liveActivityBackgroundAssertionDidTimeout");

}

- (void)_liveActivityBackgroundAssertionDidTimeout
{
  NSObject *v3;
  SNAAssertion *liveActivityAssertion;
  int v5;
  HDMirroredWorkoutSessionServer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543362;
    v6 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[mirroring] %{public}@: Will invalidate Live Activity background assertion after timeout.", (uint8_t *)&v5, 0xCu);
  }
  -[SNAAssertion invalidate](self->_liveActivityAssertion, "invalidate");
  liveActivityAssertion = self->_liveActivityAssertion;
  self->_liveActivityAssertion = 0;

}

- (void)_launchClientInTheBackground
{
  void *v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->super._profile);
  objc_msgSend(WeakRetained, "workoutManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mirroringManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "launchClientWithBundleIdentifier:", self->super._clientProcessBundleIdentifier);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingData, 0);
  objc_storeStrong((id *)&self->_pendingClientUpdates, 0);
  objc_storeStrong((id *)&self->_liveActivityAssertionTimeoutSource, 0);
  objc_storeStrong((id *)&self->_liveActivitySubscription, 0);
  objc_storeStrong((id *)&self->_liveActivityAssertion, 0);
  objc_storeStrong((id *)&self->_liveActivityCenter, 0);
  objc_storeStrong((id *)&self->_periodicRuntimeSource, 0);
}

@end
