@implementation HDWorkoutManager

- (BOOL)hasAnyActiveWorkouts
{
  HDWorkoutManager *v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__HDWorkoutManager_hasAnyActiveWorkouts__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __40__HDWorkoutManager_hasAnyActiveWorkouts__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 8) != 0;
  return result;
}

- (id)currentWorkoutClient
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__180;
  v11 = __Block_byref_object_dispose__180;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__HDWorkoutManager_currentWorkoutClient__block_invoke;
  v6[3] = &unk_1E6CED168;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__HDWorkoutManager_currentWorkoutClient__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "isActive"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "client");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)_startWatchAppWithWorkoutConfiguration:(id)a3 client:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  HDCodableStartWorkoutAppRequest *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(a4, "process");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "applicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDWorkoutManager profile](self, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processStateManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "applicationIsForeground:", v11);

  _HKInitializeLogging();
  v16 = *MEMORY[0x1E0CB5380];
  v17 = *MEMORY[0x1E0CB5380];
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138543618;
      v23 = v11;
      v24 = 2114;
      v25 = v8;
      _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "Starting workout app %{public}@ on watch. configuration: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    v18 = objc_alloc_init(HDCodableStartWorkoutAppRequest);
    -[HDCodableStartWorkoutAppRequest setApplicationIdentifier:](v18, "setApplicationIdentifier:", v11);
    objc_msgSend(v8, "codableRepresentationForSync");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableStartWorkoutAppRequest setWorkoutConfiguration:](v18, "setWorkoutConfiguration:", v19);

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableStartWorkoutAppRequest setRequestIdentifier:](v18, "setRequestIdentifier:", v21);

    -[HDWorkoutManager _startWatchAppWithRequest:completion:](self, v18, v9);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Cannot start watch app when phone app is in background", (uint8_t *)&v22, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 550, CFSTR("Cannot start watch app when phone app is in background"));
    v18 = (HDCodableStartWorkoutAppRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, HDCodableStartWorkoutAppRequest *))v9 + 2))(v9, 0, v18);
  }

}

- (void)_startWatchAppWithRequest:(void *)a3 completion:
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__HDWorkoutManager_Platform___startWatchAppWithRequest_completion___block_invoke;
    block[3] = &unk_1E6CECC58;
    block[4] = a1;
    v10 = v6;
    v9 = v5;
    dispatch_async(v7, block);

  }
}

- (void)_startWatchAppWithWorkoutPlanData:(id)a3 processIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  HDCodableStartWorkoutAppRequest *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint8_t v18[16];

  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = a5;
  -[HDWorkoutManager profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "processStateManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v12, "processIsForeground:", v6);

  if ((_DWORD)v6)
  {
    v13 = objc_alloc_init(HDCodableStartWorkoutAppRequest);
    -[HDCodableStartWorkoutAppRequest setWorkoutPlanData:](v13, "setWorkoutPlanData:", v8);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableStartWorkoutAppRequest setRequestIdentifier:](v13, "setRequestIdentifier:", v15);

    -[HDWorkoutManager _startWatchAppWithRequest:completion:](self, v13, v9);
  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "Cannot start watch app when phone app is in background", v18, 2u);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 550, CFSTR("Cannot start watch app when phone app is in background"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v17);

  }
}

void __67__HDWorkoutManager_Platform___startWatchAppWithRequest_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "profile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nanoSyncManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __67__HDWorkoutManager_Platform___startWatchAppWithRequest_completion___block_invoke_2;
    v6[3] = &unk_1E6CFA680;
    v4 = *(_QWORD *)(a1 + 40);
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v3, "sendStartWorkoutAppRequest:completion:", v4, v6);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 550, CFSTR("Unable to launch watch app"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
}

void __67__HDWorkoutManager_Platform___startWatchAppWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a2)
  {
    (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "success"), v5);
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v7 = 138543362;
      v8 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Error launching watch app: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    (*(void (**)(_QWORD, _QWORD, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), 0, v5);
  }

}

- (void)_receivedStartWorkoutAppRequest:(id)a3 completion:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v5 = a4;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Received unsupported start workout app message non-watch device.", v8, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 100, CFSTR("Start workout app request not supported on non-watch devices"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDWorkoutManager _sendStartWorkoutAppResponse:error:](self, "_sendStartWorkoutAppResponse:error:", v5, v7);

}

- (HDWorkoutManager)initWithProfile:(id)a3
{
  id v4;
  HDWorkoutManager *v5;
  HDWorkoutManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *sessionCreationHandlers;
  NSMutableDictionary *v11;
  NSMutableDictionary *sessionServers;
  HDLocationManager *v13;
  HDLocationManager *locationManager;
  HDWorkoutLocationSmoother *v15;
  HDWorkoutLocationSmoother *locationSmoother;
  HDWorkoutMirroringManager *v17;
  HDWorkoutMirroringManager *mirroringManager;
  void *v19;
  id v20;
  uint64_t v21;
  HKObserverSet *currentWorkoutObservers;
  NSMutableDictionary *v23;
  NSMutableDictionary *backgroundStartAssertions;
  id WeakRetained;
  objc_super v27;

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDWorkoutManager;
  v5 = -[HDWorkoutManager init](&v27, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    HKCreateSerialDispatchQueue();
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionCreationHandlers = v6->_sessionCreationHandlers;
    v6->_sessionCreationHandlers = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionServers = v6->_sessionServers;
    v6->_sessionServers = v11;

    v13 = objc_alloc_init(HDLocationManager);
    locationManager = v6->_locationManager;
    v6->_locationManager = v13;

    v15 = -[HDWorkoutLocationSmoother initWithProfile:]([HDWorkoutLocationSmoother alloc], "initWithProfile:", v4);
    locationSmoother = v6->_locationSmoother;
    v6->_locationSmoother = v15;

    v17 = -[HDWorkoutMirroringManager initWithWorkoutManager:]([HDWorkoutMirroringManager alloc], "initWithWorkoutManager:", v6);
    mirroringManager = v6->_mirroringManager;
    v6->_mirroringManager = v17;

    objc_msgSend(MEMORY[0x1E0D29830], "sharedDiagnosticManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObject:", v6);

    v20 = objc_alloc(MEMORY[0x1E0CB6988]);
    v21 = objc_msgSend(v20, "initWithName:loggingCategory:", CFSTR("current-workout-observers"), *MEMORY[0x1E0CB5380]);
    currentWorkoutObservers = v6->_currentWorkoutObservers;
    v6->_currentWorkoutObservers = (HKObserverSet *)v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    backgroundStartAssertions = v6->_backgroundStartAssertions;
    v6->_backgroundStartAssertions = v23;

    v6->_assertionsLock._os_unfair_lock_opaque = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (void)dealloc
{
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HDAssertion invalidate](self->_currentWorkoutAssertion, "invalidate");
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sessionAssertionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeAssertionsForIdentifier:", CFSTR("HDAssertionIdentifierBackgroundWorkoutStart"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "invalidate");
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)HDWorkoutManager;
  -[HDWorkoutManager dealloc](&v10, sel_dealloc);
}

- (HDWorkoutSessionServer)currentWorkout
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__180;
  v10 = __Block_byref_object_dispose__180;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HDWorkoutManager_currentWorkout__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HDWorkoutSessionServer *)v3;
}

void __34__HDWorkoutManager_currentWorkout__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (NSDictionary)sessionServers
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__180;
  v10 = __Block_byref_object_dispose__180;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__HDWorkoutManager_sessionServers__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __34__HDWorkoutManager_sessionServers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)recoveredWorkoutSessionServerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[5];
  id v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__180;
  v43 = __Block_byref_object_dispose__180;
  v44 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__180;
  v37 = __Block_byref_object_dispose__180;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__180;
  v31 = __Block_byref_object_dispose__180;
  v32 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__HDWorkoutManager_recoveredWorkoutSessionServerWithIdentifier_error___block_invoke;
  block[3] = &unk_1E6D0CAD8;
  v24 = &v39;
  block[4] = self;
  v8 = v6;
  v23 = v8;
  v25 = &v27;
  v26 = &v33;
  dispatch_sync(queue, block);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = (id)v28[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v45, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v9);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v45, 16);
    }
    while (v10);
  }

  v13 = (void *)v40[5];
  if (!v13)
  {
    v14 = (id)v34[5];
    v15 = v14;
    if (v14)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v14);
      else
        _HKLogDroppedError();
    }

    v13 = (void *)v40[5];
  }
  v16 = v13;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v16;
}

void __70__HDWorkoutManager_recoveredWorkoutSessionServerWithIdentifier_error___block_invoke(uint64_t *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id WeakRetained;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112));
    v6 = a1[5];
    v17 = 0;
    +[HDWorkoutSessionServer recoveredSessionServerWithProfile:sessionUUID:error:](HDWorkoutSessionServer, "recoveredSessionServerWithProfile:sessionUUID:error:", WeakRetained, v6, &v17);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v17;
    v9 = v17;
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v7;

    v12 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v12)
    {
      objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", v12, a1[5]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "addObserver:queue:", a1[4], *(_QWORD *)(a1[4] + 136));
      objc_msgSend(*(id *)(a1[4] + 40), "objectForKeyedSubscript:", a1[5]);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1[7] + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

      objc_msgSend(*(id *)(a1[4] + 40), "removeObjectForKey:", a1[5]);
      v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "state");
      if ((unint64_t)(v16 - 4) < 0xB || v16 == 17)
        -[HDWorkoutManager _queue_beginTransitionToWorkoutSession:](a1[4], *(void **)(*(_QWORD *)(a1[6] + 8) + 40));
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1[8] + 8) + 40), v8);
    }

  }
}

- (void)_queue_beginTransitionToWorkoutSession:(uint64_t)a1
{
  id v4;
  void *v5;
  id v6;
  id *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  HDWatchAppStateMonitor *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = v4;
  if (!a1)
    goto LABEL_22;
  v6 = *(id *)(a1 + 8);
  if (v6 == v4)
  {
    objc_msgSend(v4, "didBecomeCurrent");
    goto LABEL_22;
  }
  v7 = (id *)(a1 + 24);
  if (*(id *)(a1 + 24) != v4)
  {
    if (!v6)
    {
      -[HDWorkoutManager _queue_setCurrentWorkout:](a1, v4);
LABEL_19:
      objc_msgSend(v5, "applicationIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = [HDWatchAppStateMonitor alloc];
        objc_msgSend(v5, "applicationIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HDWatchAppStateMonitor initWithBundleIdentifier:](v13, "initWithBundleIdentifier:", v14);
        v16 = *(void **)(a1 + 56);
        *(_QWORD *)(a1 + 56) = v15;

      }
      goto LABEL_22;
    }
    if ((objc_msgSend(v4, "shouldStopPreviousSession") & 1) == 0
      && objc_msgSend(*(id *)(a1 + 8), "isActive"))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 551, CFSTR("Cannot start when another session is active"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "didResignCurrentWithError:", v8);

      goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 8, CFSTR("Another session is starting"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (_HDWorkoutSessionCanReplaceSession(*(void **)(a1 + 8), v5))
    {
      if (!*v7)
      {
LABEL_15:
        objc_storeStrong((id *)(a1 + 24), a2);
        objc_msgSend(*(id *)(a1 + 8), "didResignCurrentWithError:", v10);
        _HKInitializeLogging();
        v11 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
        {
          v17 = 138543362;
          v18 = v5;
          _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w0) In line as next workout.", (uint8_t *)&v17, 0xCu);
        }

        goto LABEL_19;
      }
      if (_HDWorkoutSessionCanReplaceSession(*v7, v5))
      {
        objc_msgSend(*v7, "didResignCurrentWithError:", v10);
        goto LABEL_15;
      }
    }
    objc_msgSend(v5, "didResignCurrentWithError:", v10);

    goto LABEL_22;
  }
  _HKInitializeLogging();
  v9 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543362;
    v18 = v5;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w1) Ignorning become-current request while already in line as the next workout.", (uint8_t *)&v17, 0xCu);
  }
LABEL_22:

}

- (void)sessionServerFromSessionIdentifier:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HDWorkoutManager *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__HDWorkoutManager_sessionServerFromSessionIdentifier_completion___block_invoke;
  block[3] = &unk_1E6CECC58;
  v13 = self;
  v14 = v7;
  v12 = v6;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __66__HDWorkoutManager_sessionServerFromSessionIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 32), "objectForKeyedSubscript:");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }
    else
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      if (!v3)
      {
        v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 32));
      }
      v4 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
      v5 = _Block_copy(v4);
      objc_msgSend(v3, "addObject:", v5);

    }
  }
  else
  {
    _HKInitializeLogging();
    v2 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B7802000, v2, OS_LOG_TYPE_ERROR, "Unable to fetch session server because Session Identifier is unexpectedly nil", buf, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
}

- (id)sessionServerWithConfiguration:(id)a3 sessionUUID:(id)a4 clientBundleIdentifier:(id)a5 taskServer:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  void *v16;
  HDWorkoutSessionServer *v17;
  id WeakRetained;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD block[5];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__180;
  v30 = __Block_byref_object_dispose__180;
  v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__HDWorkoutManager_sessionServerWithConfiguration_sessionUUID_clientBundleIdentifier_taskServer___block_invoke;
  block[3] = &unk_1E6CF6BF8;
  v25 = &v26;
  block[4] = self;
  v15 = v11;
  v24 = v15;
  dispatch_sync(queue, block);
  v16 = (void *)v27[5];
  if (!v16)
  {
    v17 = [HDWorkoutSessionServer alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v19 = -[HDWorkoutSessionServer initWithProfile:configuration:sessionUUID:](v17, "initWithProfile:configuration:sessionUUID:", WeakRetained, v10, v15);
    v20 = (void *)v27[5];
    v27[5] = v19;

    -[HDWorkoutManager _setupNewSessionServer:withTaskServer:]((uint64_t)self, (void *)v27[5], v13);
    v16 = (void *)v27[5];
  }
  v21 = v16;

  _Block_object_dispose(&v26, 8);
  return v21;
}

void __97__HDWorkoutManager_sessionServerWithConfiguration_sessionUUID_clientBundleIdentifier_taskServer___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_setupNewSessionServer:(void *)a3 withTaskServer:
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD block[5];
  id v17;
  id v18;
  uint64_t *v19;
  char *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__180;
    v25 = __Block_byref_object_dispose__180;
    v26 = 0;
    v7 = *(NSObject **)(a1 + 136);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__HDWorkoutManager__setupNewSessionServer_withTaskServer___block_invoke;
    block[3] = &unk_1E6D0CB00;
    block[4] = a1;
    v17 = v5;
    v20 = sel__setupNewSessionServer_withTaskServer_;
    v18 = v6;
    v19 = &v21;
    dispatch_sync(v7, block);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = (id)v22[5];
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v27, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11) + 16))(*(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v27, 16);
      }
      while (v9);
    }

    _Block_object_dispose(&v21, 8);
  }

}

- (void)mirroredSessionServerWithUUID:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  SEL v15;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__HDWorkoutManager_mirroredSessionServerWithUUID_completion___block_invoke;
  v12[3] = &unk_1E6CED448;
  v12[4] = self;
  v13 = v7;
  v14 = v8;
  v15 = a2;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, v12);

}

void __61__HDWorkoutManager_mirroredSessionServerWithUUID_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "sessionType") != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("HDWorkoutManager.m"), 274, CFSTR("Expected session %@ type to be mirrored"), *(_QWORD *)(a1 + 40));

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __61__HDWorkoutManager_mirroredSessionServerWithUUID_completion___block_invoke_2;
    v6[3] = &unk_1E6CF13E8;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v4, "recoverMirroredWorkoutSessionWithCompletion:", v6);

  }
}

uint64_t __61__HDWorkoutManager_mirroredSessionServerWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __58__HDWorkoutManager__setupNewSessionServer_withTaskServer___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "sessionType") == 1)
  {
    -[HDWorkoutManager _queue_sessionFinished:](*(_QWORD *)(a1 + 32), v16);
  }
  else if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("HDWorkoutManager.m"), 295, CFSTR("Conflicting session creation."));

  }
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v6);

  objc_msgSend(*(id *)(a1 + 40), "setTaskServer:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 48), "observeWorkoutSessionServer:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "addObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(void **)(a1 + 40);
  v13 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObjectForKey:", v14);

}

- (void)_queue_sessionFinished:(uint64_t)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    if (*(id *)(a1 + 8) == v3)
    {
      _HKInitializeLogging();
      v5 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v3;
        _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w0) Finished while current.", buf, 0xCu);
      }
      objc_msgSend(*(id *)(a1 + 8), "removeObserver:", a1);
      v6 = *(void **)(a1 + 8);
      *(_QWORD *)(a1 + 8) = 0;

      v7 = *(void **)(a1 + 88);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __43__HDWorkoutManager__queue_sessionFinished___block_invoke;
      v13[3] = &unk_1E6D0CBF0;
      v13[4] = a1;
      objc_msgSend(v7, "notifyObservers:", v13);
      if (!objc_msgSend(v3, "sessionType"))
      {
        objc_msgSend(*(id *)(a1 + 16), "invalidate");
        v8 = *(void **)(a1 + 16);
        *(_QWORD *)(a1 + 16) = 0;

      }
      -[HDWorkoutManager _postWorkoutUpdatedNotification](a1);
      v9 = *(void **)(a1 + 24);
      if (!v9)
        goto LABEL_13;
      -[HDWorkoutManager _queue_setCurrentWorkout:](a1, v9);
    }
    else
    {
      if (*(id *)(a1 + 24) != v3)
      {
LABEL_13:
        v11 = *(void **)(a1 + 32);
        objc_msgSend(v3, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObjectForKey:", v12);

        goto LABEL_14;
      }
      _HKInitializeLogging();
      v4 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v15 = v3;
        _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w0) Finished while pending.", buf, 0xCu);
      }
    }
    v10 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    goto LABEL_13;
  }
LABEL_14:

}

- (void)_queue_setCurrentWorkout:(uint64_t)a1
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w0) Become current.", buf, 0xCu);
  }
  objc_storeStrong((id *)(a1 + 8), a2);
  v6 = *(void **)(a1 + 88);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __45__HDWorkoutManager__queue_setCurrentWorkout___block_invoke;
  v16[3] = &unk_1E6D0CBF0;
  v16[4] = a1;
  objc_msgSend(v6, "notifyObservers:", v16);
  objc_msgSend(*(id *)(a1 + 8), "didBecomeCurrent");
  objc_msgSend(v4, "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "applicationIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    objc_msgSend(*(id *)(a1 + 96), "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 96), "setObject:forKeyedSubscript:", 0, v8);

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    objc_msgSend(v9, "invalidate");

  }
  if (!objc_msgSend(v4, "sessionType"))
  {
    objc_msgSend(v4, "clientProcessBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(id *)(a1 + 16);
    if (v10)
    {
      v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D29800]), "initWithAssertionIdentifier:ownerIdentifier:", CFSTR("HDCurrentWorkoutSessionAssertion"), v10);
      v13 = *(void **)(a1 + 16);
      *(_QWORD *)(a1 + 16) = v12;

    }
    objc_msgSend(v11, "invalidate");
    if (*(_QWORD *)(a1 + 16))
    {
      objc_msgSend((id)a1, "profile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "sessionAssertionManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "takeAssertion:", *(_QWORD *)(a1 + 16));

    }
  }
  -[HDWorkoutManager _postWorkoutUpdatedNotification](a1);

}

- (void)_sendStartWorkoutAppResponse:(id)a3 error:(id)a4
{
  id v5;
  void (**v6)(id, id, id);
  HDCodableStartWorkoutAppResponse *v7;
  void *v8;
  HDCodableStartWorkoutAppResponse *v9;

  v5 = a4;
  v6 = (void (**)(id, id, id))a3;
  v7 = objc_alloc_init(HDCodableStartWorkoutAppResponse);
  v9 = v7;
  if (v5)
  {
    -[HDCodableStartWorkoutAppResponse setSuccess:](v7, "setSuccess:", 0);
    objc_msgSend(v5, "hk_codableError");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableStartWorkoutAppResponse setLaunchError:](v9, "setLaunchError:", v8);

  }
  else
  {
    -[HDCodableStartWorkoutAppResponse setSuccess:](v7, "setSuccess:", 1);
  }
  v6[2](v6, v9, v5);

}

- (id)newBiomeInterface
{
  return objc_alloc_init(HDBiomeInterface);
}

- (id)newCMSwimTracker
{
  return objc_alloc_init(MEMORY[0x1E0CA56E8]);
}

- (id)newCMSkiTracker
{
  return objc_alloc_init(MEMORY[0x1E0CA56C8]);
}

uint64_t __61__HDWorkoutManager__queue_sessionServerForRecoveryForClient___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)finishAllWorkoutsForClient:(id)a3 error:(id *)a4
{
  id v6;
  HDProfile **p_profile;
  id WeakRetained;
  _BOOL4 v9;
  id v10;
  BOOL v11;

  v6 = a3;
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  v9 = +[HDWorkoutSessionServer finishAllWorkoutSessionsForClient:profile:error:](HDWorkoutSessionServer, "finishAllWorkoutSessionsForClient:profile:error:", v6, WeakRetained, a4);

  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)p_profile);
    v11 = +[HDWorkoutBuilderServer finishAllWorkoutBuildersForClient:profile:error:](HDWorkoutBuilderServer, "finishAllWorkoutBuildersForClient:profile:error:", v6, v10, a4);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)recoverWorkoutSessionForClient:(id)a3 server:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a3;
  v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HDWorkoutManager_recoverWorkoutSessionForClient_server_completion___block_invoke;
  block[3] = &unk_1E6CEA160;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_sync(queue, block);

}

void __69__HDWorkoutManager_recoverWorkoutSessionForClient_server_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
    goto LABEL_7;
  v3 = *(NSObject **)(v2 + 136);
  v4 = *(id *)(a1 + 40);
  dispatch_assert_queue_V2(v3);
  objc_msgSend(v4, "process");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "applicationIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v2 + 8), "applicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", v6);

  if ((_DWORD)v5)
  {
    v8 = *(id *)(v2 + 8);
  }
  else
  {
    objc_msgSend(*(id *)(v2 + 32), "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__HDWorkoutManager__queue_sessionServerForRecoveryForClient___block_invoke;
    v13[3] = &unk_1E6D0CB28;
    v14 = v6;
    objc_msgSend(v9, "hk_firstObjectPassingTest:", v13);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v8)
  {
    v12 = 0;
    objc_msgSend(v8, "taskServerConfigurationForRecoveryWithError:", &v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v12;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    v8 = 0;
  }

}

void __45__HDWorkoutManager__activeSessionIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allKeys");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __61__HDWorkoutManager__scheduleFinishAllDetachedWorkoutBuilders__block_invoke(uint64_t a1)
{
  -[HDWorkoutManager _finishAllDetachedWorkoutBuilders](*(_QWORD *)(a1 + 32));
}

- (void)_finishAllDetachedWorkoutBuilders
{
  NSObject *v2;
  id v3;
  void *v4;
  id WeakRetained;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD block[6];
  __int128 buf;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 136));
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__180;
    v17 = __Block_byref_object_dispose__180;
    v18 = 0;
    v2 = *(NSObject **)(a1 + 136);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__HDWorkoutManager__activeSessionIdentifiers__block_invoke;
    block[3] = &unk_1E6CE8110;
    block[4] = a1;
    block[5] = &buf;
    dispatch_sync(v2, block);
    v3 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v3);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    v12 = 0;
    v6 = +[HDWorkoutBuilderServer finishAllDetachedWorkoutBuildersExcludingSessions:profile:error:](HDWorkoutBuilderServer, "finishAllDetachedWorkoutBuildersExcludingSessions:profile:error:", v4, WeakRetained, &v12);
    v7 = v12;

    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5380];
    v9 = *MEMORY[0x1E0CB5380];
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v10 = v8;
        objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "Finished all detached workout builders, excluding active sessions (%@)", (uint8_t *)&buf, 0xCu);

      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Failed to finish detached workout builders: %{public}@", (uint8_t *)&buf, 0xCu);
    }

  }
}

- (id)currentWorkoutConfiguration
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__180;
  v11 = __Block_byref_object_dispose__180;
  v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__HDWorkoutManager_currentWorkoutConfiguration__block_invoke;
  v6[3] = &unk_1E6CE8110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__HDWorkoutManager_currentWorkoutConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "currentActivityConfiguration");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)generatePauseOrResumeRequestAllowingBackgroundRuntime:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v7;
  os_log_t *v8;
  NSObject *v9;
  const __CFString *v10;
  id WeakRetained;
  void *v12;
  int v13;
  _BOOL4 v14;
  _BOOL4 v15;
  os_log_t v16;
  NSObject *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  NSObject *queue;
  _QWORD block[5];
  id v23;
  SEL v24;
  uint8_t buf[4];
  HDWorkoutManager *v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v4 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  _HKInitializeLogging();
  v8 = (os_log_t *)MEMORY[0x1E0CB5380];
  v9 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("NO");
    if (v4)
      v10 = CFSTR("YES");
    *(_DWORD *)buf = 138543618;
    v26 = self;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Received pause/resume request, allow background runtime: %@", buf, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isProtectedDataAvailable");

  v14 = -[HDWorkoutSessionServer canBePaused](self->_currentWorkout, "canBePaused");
  v15 = -[HDWatchAppStateMonitor appIsActive](self->_appStateMonitor, "appIsActive");
  if (((v13 & 1) != 0 || v14) && (((v13 ^ 1 | v15) & 1) != 0 || v4))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__HDWorkoutManager_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke;
    block[3] = &unk_1E6CF7C30;
    block[4] = self;
    v23 = v7;
    v24 = a2;
    dispatch_async(queue, block);

  }
  else
  {
    _HKInitializeLogging();
    v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      HKStringFromBool();
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      HKStringFromBool();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      HKStringFromBool();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v26 = self;
      v27 = 2114;
      v28 = v18;
      v29 = 2114;
      v30 = v19;
      v31 = 2114;
      v32 = v20;
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring pause/resume request. { unlocked=%{public}@, can be paused=%{public}@, active=%{public}@.", buf, 0x2Au);

    }
    (*((void (**)(id, uint64_t, _QWORD))v7 + 2))(v7, 1, 0);
  }

}

void __85__HDWorkoutManager_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke(_QWORD *a1)
{
  __CFString *v2;
  os_log_t *v3;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  const __CFString *v15;
  char v16;
  void *v17;
  void *v18;
  dispatch_time_t v19;
  uint64_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD block[4];
  id v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "identifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v3 = (os_log_t *)MEMORY[0x1E0CB5380];
  v4 = *MEMORY[0x1E0CB5380];
  v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      v6 = a1[4];
      *(_DWORD *)buf = 138543618;
      v30 = v6;
      v31 = 2114;
      v32 = v2;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Generating pause/resume request for session %{public}@.", buf, 0x16u);
    }
    v7 = objc_alloc(MEMORY[0x1E0CB7048]);
    v8 = objc_alloc_init(MEMORY[0x1E0CB3588]);
    v9 = (void *)objc_msgSend(v7, "initWithEventType:sessionId:dateInterval:metadata:", 10, v2, v8, 0);

    objc_msgSend(*(id *)(a1[4] + 8), "generateEvent:", v9);
    objc_msgSend(*(id *)(a1[4] + 8), "clientProcessBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v11 = +[HDBackgroundWorkoutRunner hasBackgroundPermissionForBundleIdentifier:errorOut:](HDBackgroundWorkoutRunner, "hasBackgroundPermissionForBundleIdentifier:errorOut:", v10, &v28);
    v12 = v28;

    _HKInitializeLogging();
    v13 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      v14 = a1[4];
      v15 = CFSTR("NO");
      *(_DWORD *)buf = 138543874;
      if (v11)
        v15 = CFSTR("YES");
      v30 = v14;
      v31 = 2114;
      v32 = v15;
      v33 = 2114;
      v34 = v12;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Client process has background permission: %{public}@, error: %{public}@", buf, 0x20u);
    }
    if (v12)
      v16 = 1;
    else
      v16 = v11;
    if ((v16 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1[4] + 8), "client");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDBackgroundWorkoutRunner acquireBKSAssertionForClient:](HDBackgroundWorkoutRunner, "acquireBKSAssertionForClient:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = dispatch_time(0, 10000000000);
      v20 = a1[4];
      v21 = *(NSObject **)(v20 + 136);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__HDWorkoutManager_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_239;
      block[3] = &unk_1E6CE8080;
      v26 = v18;
      v27 = v20;
      v22 = v18;
      dispatch_after(v19, v21, block);

    }
    (*(void (**)(void))(a1[5] + 16))();

  }
  else
  {
    if (v5)
    {
      v23 = a1[4];
      *(_DWORD *)buf = 138543362;
      v30 = v23;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Rejecting pause/resume request; no current workout.",
        buf,
        0xCu);
    }
    v24 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a1[6], CFSTR("No current workout to pause or resume"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v24 + 16))(v24, 0, v9);
  }

}

void __85__HDWorkoutManager_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_239(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "client");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  +[HDBackgroundWorkoutRunner releaseBKSAssertion:forClient:](HDBackgroundWorkoutRunner, "releaseBKSAssertion:forClient:", v1, v2);

}

- (BOOL)allowBackgroundStartForApplicationIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  void *v7;
  NSObject *v8;
  int v10;
  HDWorkoutManager *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(&unk_1E6DFA4A8, "containsObject:", v4))
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v4;
      _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Workout session allowed to start for %{public}@ because it is listed", (uint8_t *)&v10, 0x16u);
    }
    v6 = 1;
  }
  else
  {
    os_unfair_lock_lock(&self->_assertionsLock);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundStartAssertions, "objectForKeyedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(&self->_assertionsLock);
    if (v7 && objc_msgSend(v7, "state") != 3)
    {
      _HKInitializeLogging();
      v8 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138543618;
        v11 = self;
        v12 = 2114;
        v13 = v4;
        _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Workout session allowed to start for %{public}@ because an assertion is held", (uint8_t *)&v10, 0x16u);
      }
      v6 = 1;
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (void)_takeBackgroundStartAssertionForApplicationIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0D29800];
  v5 = a3;
  v9 = (id)objc_msgSend([v4 alloc], "initWithAssertionIdentifier:ownerIdentifier:", CFSTR("HDAssertionIdentifierBackgroundWorkoutStart"), v5);
  objc_msgSend(v9, "setBudget:", 30.0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "sessionAssertionManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "takeAssertion:", v9);

  os_unfair_lock_lock(&self->_assertionsLock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_backgroundStartAssertions, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_backgroundStartAssertions, "setObject:forKeyedSubscript:", v9, v5);

  os_unfair_lock_unlock(&self->_assertionsLock);
  objc_msgSend(v8, "invalidate");

}

void __61__HDWorkoutManager__scheduleFinishForDetachedWorkoutBuilders__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id *WeakRetained;
  _QWORD v4[5];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_loadWeakRetained(WeakRetained + 14);
    objc_msgSend(v1, "database");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __61__HDWorkoutManager__scheduleFinishAllDetachedWorkoutBuilders__block_invoke;
    v4[3] = &unk_1E6CE80E8;
    v4[4] = WeakRetained;
    objc_msgSend(v2, "performAsynchronously:", v4);

  }
}

void __63__HDWorkoutManager__recoverActiveWorkoutSessionServersIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
  v46 = 0;
  +[HDWorkoutSessionServer sessionIdentifierForRecoveryInProfile:error:](HDWorkoutSessionServer, "sessionIdentifierForRecoveryInProfile:error:", WeakRetained, &v46);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v46;

  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKeyedSubscript:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      _HKInitializeLogging();
      v6 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(void **)(v7 + 32);
        *(_DWORD *)buf = 138543618;
        v48 = v7;
        v49 = 2114;
        v50 = v8;
        _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping automatic current workout recovery: session servers (%{public}@) already exist.", buf, 0x16u);
      }
LABEL_8:
      -[HDWorkoutManager _postWorkoutUpdatedNotification](*(_QWORD *)(a1 + 32));
      goto LABEL_29;
    }
    v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    objc_msgSend(v11, "daemon");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "devicePowerMonitor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "primarySourceIsCharging");

    if (v14)
    {
      _HKInitializeLogging();
      v15 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
      {
        v16 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v48 = v16;
        v49 = 2114;
        v50 = v3;
        _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping automatic current workout recovery (%{public}@): primary power source is currently charging.", buf, 0x16u);
      }
      v17 = v4;
    }
    else
    {
      v19 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
      v45 = v4;
      +[HDWorkoutSessionServer recoveredSessionServerWithProfile:sessionUUID:error:](HDWorkoutSessionServer, "recoveredSessionServerWithProfile:sessionUUID:error:", v19, v3, &v45);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v45;

      objc_msgSend(v20, "workoutConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        v22 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
        objc_msgSend(v22, "daemon");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "devicePowerMonitor");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "primarySourceIsCharging");

        if (v25)
        {
          _HKInitializeLogging();
          v26 = *MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            v27 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v48 = v27;
            v49 = 2114;
            v50 = v3;
            _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping automatic current workout recovery (%{public}@): primary power source is currently charging.", buf, 0x16u);
          }
        }
        else
        {
          v32 = objc_msgSend(v20, "state");
          if ((unint64_t)(v32 - 4) < 0xB || v32 == 17)
          {
            _HKInitializeLogging();
            v33 = *MEMORY[0x1E0CB5380];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
            {
              v34 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138543618;
              v48 = v34;
              v49 = 2114;
              v50 = v20;
              _os_log_impl(&dword_1B7802000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Automatically recovering latest workout session %{public}@ after restart.", buf, 0x16u);
            }
            v35 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
            objc_msgSend(v20, "identifier");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "setObject:forKeyedSubscript:", v20, v36);

            objc_msgSend(v20, "addObserver:queue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136));
            -[HDWorkoutManager _queue_beginTransitionToWorkoutSession:](*(_QWORD *)(a1 + 32), v20);

            goto LABEL_26;
          }
          _HKInitializeLogging();
          v38 = (void *)*MEMORY[0x1E0CB5380];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
          {
            v39 = *(_QWORD *)(a1 + 32);
            v40 = v38;
            objc_msgSend(v20, "state");
            _HKWorkoutSessionServerStateToString();
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v48 = v39;
            v49 = 2114;
            v50 = v20;
            v51 = 2114;
            v52 = v41;
            _os_log_impl(&dword_1B7802000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: Not automatically recovering workout session %{public}@ after restart; state %{public}@ does n"
              "ot indicate a current workout",
              buf,
              0x20u);

          }
        }
      }
      else
      {
        _HKInitializeLogging();
        v28 = *MEMORY[0x1E0CB5380];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        {
          v43 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543874;
          v48 = v43;
          v49 = 2114;
          v50 = v3;
          v51 = 2114;
          v52 = v17;
          _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recover workout session %{public}@ after restart with error %{public}@", buf, 0x20u);
        }
      }

      if (v21)
      {
LABEL_25:
        v30 = (void *)objc_msgSend(*(id *)(a1 + 32), "newBiomeInterface");
        objc_msgSend(v30, "stopSessionWithIdentifier:recoveredWorkoutConfiguration:", v3, v21);

LABEL_26:
        v4 = v17;
        goto LABEL_29;
      }
    }
    v29 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 112));
    v44 = v17;
    +[HDWorkoutSessionServer workoutConfigurationForRecoveryWithProfile:sessionUUID:error:](HDWorkoutSessionServer, "workoutConfigurationForRecoveryWithProfile:sessionUUID:error:", v29, v3, &v44);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v44;

    if (v21)
    {
      v17 = v4;
      goto LABEL_25;
    }
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
    {
      v42 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v48 = v42;
      v49 = 2114;
      v50 = v3;
      v51 = 2114;
      v52 = v4;
      _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recover workout configuration for session %{public}@ after restart with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5380];
    v10 = *MEMORY[0x1E0CB5380];
    if (v4)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v37 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v48 = v37;
        v49 = 2114;
        v50 = v4;
        _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@: No workout session available for automatic recovery after restart: %{public}@", buf, 0x16u);
      }
      goto LABEL_8;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v48 = v18;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: No workout session available for automatic recovery after restart", buf, 0xCu);
    }
    v4 = 0;
  }
LABEL_29:

}

- (uint64_t)_postWorkoutUpdatedNotification
{
  NSObject *v1;
  _BOOL4 v2;
  const char *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    _HKInitializeLogging();
    v1 = *MEMORY[0x1E0CB5380];
    v2 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT);
    v3 = (const char *)*MEMORY[0x1E0CB7660];
    if (v2)
    {
      v4 = 136315138;
      v5 = v3;
      _os_log_impl(&dword_1B7802000, v1, OS_LOG_TYPE_DEFAULT, "Posting %s notification", (uint8_t *)&v4, 0xCu);
    }
    notify_post(v3);
    return HKDispatchAsyncOnGlobalConcurrentQueue();
  }
  return result;
}

- (void)_finishAllWorkoutsWithExclusionHandler:(uint64_t)a1
{
  id v3;
  id WeakRetained;
  void *v5;
  _BOOL4 v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  BOOL (*v14)(uint64_t, void *, _QWORD *);
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t *v18;
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 136));
    v20 = 0;
    v21 = &v20;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy__180;
    v24 = __Block_byref_object_dispose__180;
    v25 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    objc_msgSend(WeakRetained, "database");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __59__HDWorkoutManager__finishAllWorkoutsWithExclusionHandler___block_invoke;
    v15 = &unk_1E6D0CBA0;
    v16 = a1;
    v18 = &v20;
    v17 = v3;
    v6 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDWorkoutSessionEntity, "performWriteTransactionWithHealthDatabase:error:block:", v5, &v19, &v12);
    v7 = v19;

    if (v6)
    {
      _HKInitializeLogging();
      v8 = (id)*MEMORY[0x1E0CB5380];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)v21[5], "allObjects", v12, v13, v14, v15, v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v27 = v10;
        _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "Finished all unrecovered workouts, excluding active sessions (%@)", buf, 0xCu);

      }
    }
    else
    {
      _HKInitializeLogging();
      v11 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v7;
        _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "Failed to finish unrecovered workouts: %{public}@", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v20, 8);
  }

}

BOOL __59__HDWorkoutManager__finishAllWorkoutsWithExclusionHandler___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  _BOOL8 v9;
  id v10;
  void *v11;
  __int128 v13;
  _QWORD block[5];
  __int128 v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v5 = a2;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__180;
  v22 = __Block_byref_object_dispose__180;
  v23 = 0;
  v6 = *(_QWORD *)(a1 + 32);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__HDWorkoutManager__finishAllWorkoutsWithExclusionHandler___block_invoke_2;
  block[3] = &unk_1E6D0CB78;
  v13 = *(_OWORD *)(a1 + 40);
  v7 = *(NSObject **)(v6 + 136);
  v8 = (id)v13;
  v15 = v13;
  block[4] = *(_QWORD *)(a1 + 32);
  v16 = &v24;
  v17 = &v18;
  dispatch_sync(v7, block);
  if (*((_BYTE *)v25 + 24))
  {
    v9 = 1;
  }
  else
  {
    v10 = (id)v19[5];
    v11 = v10;
    if (v10)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v10);
      else
        _HKLogDroppedError();
    }

    v9 = *((_BYTE *)v25 + 24) != 0;
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v9;
}

void __59__HDWorkoutManager__finishAllWorkoutsWithExclusionHandler___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  id WeakRetained;
  BOOL v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  (*(void (**)(void))(a1[5] + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112));
  v11 = 0;
  v7 = +[HDWorkoutSessionServer finishAllWorkoutsExcludingSessions:profile:error:](HDWorkoutSessionServer, "finishAllWorkoutsExcludingSessions:profile:error:", v5, WeakRetained, &v11);
  v8 = v11;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v7;

  v9 = *(_QWORD *)(a1[8] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __55__HDWorkoutManager__notifyForPostLaunchSessionRecovery__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 72);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        dispatch_async(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 80), *(dispatch_block_t *)(*((_QWORD *)&v9 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 72);
  *(_QWORD *)(v7 + 72) = 0;

}

void __60__HDWorkoutManager__recoverCurrentWorkoutSessionAfterLaunch__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD *v13;
  NSObject *v14;
  _QWORD v15[5];
  id location;
  uint64_t block;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    v4 = v2[17];
    block = MEMORY[0x1E0C809B0];
    v18 = 3221225472;
    v19 = __63__HDWorkoutManager__recoverActiveWorkoutSessionServersIfNeeded__block_invoke;
    v20 = &unk_1E6CE80E8;
    v21 = v2;
    dispatch_sync(v4, &block);
    v5 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v5 = 0;
  }
  v15[0] = v3;
  v15[1] = 3221225472;
  v15[2] = __60__HDWorkoutManager__recoverCurrentWorkoutSessionAfterLaunch__block_invoke_2;
  v15[3] = &unk_1E6D0CBC8;
  v15[4] = v5;
  -[HDWorkoutManager _finishAllWorkoutsWithExclusionHandler:](v5, v15);
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained((id *)(v6 + 112));
    objc_msgSend(WeakRetained, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsWorkouts");

    if (v10)
    {
      objc_initWeak(&location, (id)v6);
      v11 = dispatch_time(0, 30000000000);
      v12 = *(NSObject **)(v6 + 136);
      block = v3;
      v18 = 3221225472;
      v19 = __61__HDWorkoutManager__scheduleFinishForDetachedWorkoutBuilders__block_invoke;
      v20 = &unk_1E6CECE78;
      objc_copyWeak(&v21, &location);
      dispatch_after(v11, v12, &block);
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
    v13 = *(_QWORD **)(a1 + 32);
    if (v13)
    {
      v14 = v13[17];
      block = v3;
      v18 = 3221225472;
      v19 = __55__HDWorkoutManager__notifyForPostLaunchSessionRecovery__block_invoke;
      v20 = &unk_1E6CE80E8;
      v21 = v13;
      dispatch_sync(v14, &block);
    }
  }
}

id __60__HDWorkoutManager__recoverCurrentWorkoutSessionAfterLaunch__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)performWhenPostLaunchSessionRecoveryHasCompleted:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__HDWorkoutManager_performWhenPostLaunchSessionRecoveryHasCompleted___block_invoke;
  block[3] = &unk_1E6CE9C08;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __69__HDWorkoutManager_performWhenPostLaunchSessionRecoveryHasCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 80))
  {
    HKCreateSerialDispatchQueue();
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 80);
    *(_QWORD *)(v4 + 80) = v3;

    v2 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v2 + 64))
  {
    dispatch_async(*(dispatch_queue_t *)(v2 + 80), *(dispatch_block_t *)(a1 + 40));
  }
  else
  {
    v6 = *(void **)(v2 + 72);
    if (!v6)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 72);
      *(_QWORD *)(v8 + 72) = v7;

      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
    }
    v11 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
    v10 = _Block_copy(v11);
    objc_msgSend(v6, "addObject:", v10);

  }
}

- (void)getCurrentWorkoutSnapshotWithCompletion:(id)a3
{
  id v5;
  NSObject *queue;
  id v7;
  void *v8;
  _QWORD block[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDWorkoutManager.m"), 800, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion != NULL"));

  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HDWorkoutManager_getCurrentWorkoutSnapshotWithCompletion___block_invoke;
  block[3] = &unk_1E6CE8C48;
  block[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, block);

}

void __60__HDWorkoutManager_getCurrentWorkoutSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "currentWorkoutSnapshot");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)registerCurrentWorkoutObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HDWorkoutManager_registerCurrentWorkoutObserver___block_invoke;
  block[3] = &unk_1E6CE8080;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __51__HDWorkoutManager_registerCurrentWorkoutObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "registerObserver:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(v3 + 88);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __51__HDWorkoutManager_registerCurrentWorkoutObserver___block_invoke_2;
  v6[3] = &unk_1E6D0CBF0;
  v6[4] = v3;
  return objc_msgSend(v4, "notifyObserver:handler:", v2, v6);
}

uint64_t __51__HDWorkoutManager_registerCurrentWorkoutObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workoutManager:didUpdateCurrentWorkout:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)unregisterCurrentWorkoutObserver:(id)a3
{
  -[HKObserverSet unregisterObserver:](self->_currentWorkoutObservers, "unregisterObserver:", a3);
}

- (id)currentWorkoutSessionServer
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__180;
  v10 = __Block_byref_object_dispose__180;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__HDWorkoutManager_currentWorkoutSessionServer__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__HDWorkoutManager_currentWorkoutSessionServer__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (id)diagnosticDescription
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41__HDWorkoutManager_diagnosticDescription__block_invoke;
  v9[3] = &unk_1E6CE8080;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  dispatch_sync(queue, v9);
  v6 = v10;
  v7 = v5;

  return v7;
}

void __41__HDWorkoutManager_diagnosticDescription__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  if (v2)
  {
    objc_msgSend(v2, "clientProcessBundleIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "client");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "process");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\nWorkout process: %@ (%d)\n"), v6, objc_msgSend(v5, "processIdentifier"));

    objc_msgSend(*(id *)(a1 + 40), "appendFormat:", CFSTR("Workout Session: %@\n"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "appendString:", CFSTR("\nNo currently active workouts."));
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id WeakRetained;
  void *v12;
  _QWORD v13[5];

  -[HDWorkoutManager profile](self, "profile", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "devicePowerMonitor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addDevicePowerObserver:queue:", self, 0);

  if (self)
  {
    -[HDWorkoutManager profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "behavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsWorkouts");

    if (v10)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      objc_msgSend(WeakRetained, "database");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __60__HDWorkoutManager__recoverCurrentWorkoutSessionAfterLaunch__block_invoke;
      v13[3] = &unk_1E6CE80E8;
      v13[4] = self;
      objc_msgSend(v12, "performWhenDataProtectedByFirstUnlockIsAvailable:", v13);

    }
  }
}

- (void)devicePowerMonitor:(id)a3 primaryPowerSourceIsCharging:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  HDWorkoutManager *v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v9 = self;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Device is now charging; finishing all detached sessions and builders.",
        buf,
        0xCu);
    }
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __68__HDWorkoutManager_devicePowerMonitor_primaryPowerSourceIsCharging___block_invoke;
    v7[3] = &unk_1E6D0CBC8;
    v7[4] = self;
    -[HDWorkoutManager _finishAllWorkoutsWithExclusionHandler:]((uint64_t)self, v7);
    -[HDWorkoutManager _finishAllDetachedWorkoutBuilders]((uint64_t)self);
  }
}

id __68__HDWorkoutManager_devicePowerMonitor_primaryPowerSourceIsCharging___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "allValues");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "hk_mapToSet:", &__block_literal_global_274);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __68__HDWorkoutManager_devicePowerMonitor_primaryPowerSourceIsCharging___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_msgSend(v2, "taskServer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)hk_fakeLapEventWithDate:(id)a3 strokeStyle:(int64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__HDWorkoutManager_hk_fakeLapEventWithDate_strokeStyle___block_invoke;
  block[3] = &unk_1E6CE9C58;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(queue, block);

}

void __56__HDWorkoutManager_hk_fakeLapEventWithDate_strokeStyle___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 8), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB7048]);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", a1[5], 0.0);
    v8 = *MEMORY[0x1E0CB55C8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v3, "initWithEventType:sessionId:dateInterval:metadata:", 5, v2, v4, v6);

    if (v7)
      objc_msgSend(*(id *)(a1[4] + 8), "generateEvent:", v7);

  }
}

- (void)hk_fakeStopEventWithDate:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__HDWorkoutManager_hk_fakeStopEventWithDate___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __45__HDWorkoutManager_hk_fakeStopEventWithDate___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v6 = v2;
    v3 = objc_alloc(MEMORY[0x1E0CB7048]);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", *(_QWORD *)(a1 + 40), 0.0);
    v5 = (void *)objc_msgSend(v3, "initWithEventType:sessionId:dateInterval:metadata:", 1, v6, v4, 0);

    if (v5)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "generateEvent:", v5);

    v2 = v6;
  }

}

- (void)unitTest_smoothRoute:(id)a3 withSmoother:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__HDWorkoutManager_unitTest_smoothRoute_withSmoother_completion___block_invoke;
  v15[3] = &unk_1E6CE7E08;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __65__HDWorkoutManager_unitTest_smoothRoute_withSmoother_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__HDWorkoutManager_unitTest_smoothRoute_withSmoother_completion___block_invoke_2;
  v4[3] = &unk_1E6D0CC58;
  v3 = *(_QWORD *)(a1 + 48);
  v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "unitTest_smoothRouteSample:withSmoother:completion:", v1, v3, v4);

}

uint64_t __65__HDWorkoutManager_unitTest_smoothRoute_withSmoother_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)unitTest_currentWorkoutSession
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__180;
  v10 = __Block_byref_object_dispose__180;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__HDWorkoutManager_unitTest_currentWorkoutSession__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__HDWorkoutManager_unitTest_currentWorkoutSession__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  HDWorkoutSessionServer *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  HKObserverSet *currentWorkoutObservers;
  _QWORD v15[5];
  HDWorkoutSessionServer *v16;
  int64_t v17;
  const __CFString *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v8 = (HDWorkoutSessionServer *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentWorkout != v8)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      -[HDWorkoutManager _queue_beginTransitionToWorkoutSession:]((uint64_t)self, v8);
      goto LABEL_10;
    }
    if (a4 != 16)
      goto LABEL_10;
LABEL_9:
    -[HDWorkoutManager _queue_sessionFinished:]((uint64_t)self, v8);
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[HDWorkoutSessionServer state](v8, "state"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = CFSTR("state");
  v19[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = kHDEventNameWorkoutSession;
  -[HDWorkoutSessionServer client](self->_currentWorkout, "client");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDPowerLogForClient(v11, v12, v10);

  -[HDWorkoutManager _postWorkoutUpdatedNotification]((uint64_t)self);
  if (a4 == 16)
    goto LABEL_9;
  if (self->_nextWorkout)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 8, CFSTR("Another session is starting"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDWorkoutSessionServer didResignCurrentWithError:](v8, "didResignCurrentWithError:", v13);

  }
  currentWorkoutObservers = self->_currentWorkoutObservers;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __67__HDWorkoutManager_workoutSession_didChangeToState_fromState_date___block_invoke;
  v15[3] = &unk_1E6D0CC80;
  v15[4] = self;
  v16 = v8;
  v17 = a4;
  -[HKObserverSet notifyObservers:](currentWorkoutObservers, "notifyObservers:", v15);

LABEL_10:
}

void __67__HDWorkoutManager_workoutSession_didChangeToState_fromState_date___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "workoutManager:currentWorkout:didChangeToState:", a1[4], a1[5], a1[6]);

}

- (void)workoutSession:(id)a3 didUpdateDataAccumulator:(id)a4
{
  HDWorkoutSessionServer *v6;
  id v7;
  HKObserverSet *currentWorkoutObservers;
  _QWORD v9[5];
  HDWorkoutSessionServer *v10;
  id v11;

  v6 = (HDWorkoutSessionServer *)a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentWorkout == v6)
  {
    currentWorkoutObservers = self->_currentWorkoutObservers;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __60__HDWorkoutManager_workoutSession_didUpdateDataAccumulator___block_invoke;
    v9[3] = &unk_1E6D0CCA8;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    -[HKObserverSet notifyObservers:](currentWorkoutObservers, "notifyObservers:", v9);

  }
}

void __60__HDWorkoutManager_workoutSession_didUpdateDataAccumulator___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "workoutManager:currentWorkout:didUpdateDataAccumulator:", a1[4], a1[5], a1[6]);

}

- (void)_didCreateMirroredSessionServer:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HDWorkoutManager _setupNewSessionServer:withTaskServer:]((uint64_t)self, v4, 0);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutManager__didCreateMirroredSessionServer___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __52__HDWorkoutManager__didCreateMirroredSessionServer___block_invoke(uint64_t a1)
{
  -[HDWorkoutManager _queue_beginTransitionToWorkoutSession:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

uint64_t __45__HDWorkoutManager__queue_setCurrentWorkout___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workoutManager:didUpdateCurrentWorkout:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

uint64_t __43__HDWorkoutManager__queue_sessionFinished___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "workoutManager:didUpdateCurrentWorkout:", *(_QWORD *)(a1 + 32), 0);
}

void __51__HDWorkoutManager__postWorkoutUpdatedNotification__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("HDWorkoutManagerStateDidChange"), 0);

}

- (BOOL)isInHeartRateRecovery
{
  HDWorkoutManager *v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__HDWorkoutManager_isInHeartRateRecovery__block_invoke;
  v5[3] = &unk_1E6CE8110;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __41__HDWorkoutManager_isInHeartRateRecovery__block_invoke(uint64_t a1)
{
  uint64_t result;
  BOOL v3;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "state");
  if (result == 15)
  {
    v3 = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "state");
    v3 = result == 14;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)endHeartRateRecovery
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HDWorkoutManager_endHeartRateRecovery__block_invoke;
  block[3] = &unk_1E6CE80E8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__HDWorkoutManager_endHeartRateRecovery__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "endHeartRateRecovery");
}

- (BOOL)currentActivityRequiresExtendedMode
{
  void *v2;
  char v3;

  -[HDWorkoutManager currentWorkoutConfiguration](self, "currentWorkoutConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldUseExtendedMode");

  return v3;
}

- (void)tearDownMirroredWorkoutSession:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__HDWorkoutManager_tearDownMirroredWorkoutSession___block_invoke;
  v7[3] = &unk_1E6CE8080;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __51__HDWorkoutManager_tearDownMirroredWorkoutSession___block_invoke(uint64_t a1)
{
  -[HDWorkoutManager _queue_sessionFinished:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
}

- (HDAlertSuppressor)alertSuppressor
{
  return self->_alertSuppressor;
}

- (HDLocationManager)locationManager
{
  return self->_locationManager;
}

- (HDWorkoutMirroringManager)mirroringManager
{
  return self->_mirroringManager;
}

- (HDWorkoutLocationSmoother)locationSmoother
{
  return self->_locationSmoother;
}

- (void)setLocationSmoother:(id)a3
{
  objc_storeStrong((id *)&self->_locationSmoother, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSmoother, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mirroringManager, 0);
  objc_storeStrong((id *)&self->_alertSuppressor, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_backgroundStartAssertions, 0);
  objc_storeStrong((id *)&self->_currentWorkoutObservers, 0);
  objc_storeStrong((id *)&self->_postLaunchRecoveryCallbackQueue, 0);
  objc_storeStrong((id *)&self->_postLaunchRecoveryBlocks, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_sessionCreationHandlers, 0);
  objc_storeStrong((id *)&self->_sessionServers, 0);
  objc_storeStrong((id *)&self->_nextWorkout, 0);
  objc_storeStrong((id *)&self->_currentWorkoutAssertion, 0);
  objc_storeStrong((id *)&self->_currentWorkout, 0);
}

@end
