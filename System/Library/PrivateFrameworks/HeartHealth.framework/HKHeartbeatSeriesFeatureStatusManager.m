@implementation HKHeartbeatSeriesFeatureStatusManager

- (HKHeartbeatSeriesFeatureStatusManager)initWithHealthStore:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  HKHeartbeatSeriesFeatureStatusManager *v8;

  v4 = (objc_class *)MEMORY[0x1E0C99EA0];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)objc_msgSend(v6, "initWithSuiteName:", *MEMORY[0x1E0CB76F8]);
  v8 = -[HKHeartbeatSeriesFeatureStatusManager initWithHealthStore:heartNotificationsUserDefaults:](self, "initWithHealthStore:heartNotificationsUserDefaults:", v5, v7);

  return v8;
}

- (HKHeartbeatSeriesFeatureStatusManager)initWithHealthStore:(id)a3 heartNotificationsUserDefaults:(id)a4
{
  id v7;
  id v8;
  HKHeartbeatSeriesFeatureStatusManager *v9;
  HKHeartbeatSeriesFeatureStatusManager *v10;
  id v11;
  objc_class *v12;
  void *v13;
  uint64_t v14;
  HKObserverSet *observers;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  HKTaskServerProxyProvider *proxyProvider;
  id v21;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HKHeartbeatSeriesFeatureStatusManager;
  v9 = -[HKHeartbeatSeriesFeatureStatusManager init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_healthStore, a3);
    v11 = objc_alloc(MEMORY[0x1E0CB6988]);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v11, "initWithName:loggingCategory:", v13, *MEMORY[0x1E0CB52E8]);
    observers = v10->_observers;
    v10->_observers = (HKObserverSet *)v14;

    v16 = objc_alloc(MEMORY[0x1E0CB6CC0]);
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v16, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v7, v17, v10, v18);
    proxyProvider = v10->_proxyProvider;
    v10->_proxyProvider = (HKTaskServerProxyProvider *)v19;

    -[HKTaskServerProxyProvider setShouldRetryOnInterruption:](v10->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v21 = objc_alloc_init(MEMORY[0x1E0CB6CB8]);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v10->_proxyProvider, "setTaskConfiguration:", v21);

    objc_storeStrong((id *)&v10->_heartNotificationsUserDefaults, a4);
    -[HKHeartbeatSeriesFeatureStatusManager _startObservingHeartNotificationsUserDefaults](v10, "_startObservingHeartNotificationsUserDefaults");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[NSUserDefaults removeObserver:forKeyPath:context:](self->_heartNotificationsUserDefaults, "removeObserver:forKeyPath:context:", self, *MEMORY[0x1E0CB76D0], HeartNotificationsUserDefaultsContext);
  v3.receiver = self;
  v3.super_class = (Class)HKHeartbeatSeriesFeatureStatusManager;
  -[HKHeartbeatSeriesFeatureStatusManager dealloc](&v3, sel_dealloc);
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  -[HKHeartbeatSeriesFeatureStatusManager registerObserver:queue:activationHandler:](self, "registerObserver:queue:activationHandler:", a3, a4, 0);
}

- (void)registerObserver:(id)a3 queue:(id)a4 activationHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  HKObserverSet *observers;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  HKHeartbeatSeriesFeatureStatusManager *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  _HKInitializeLogging();
  v11 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v12 = v11;
    *(_DWORD *)buf = 138543874;
    v24 = (id)objc_opt_class();
    v25 = 2048;
    v26 = self;
    v27 = 2112;
    v28 = v8;
    v13 = v24;
    _os_log_impl(&dword_1D7781000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Registering observer %@", buf, 0x20u);

  }
  v14 = MEMORY[0x1E0C809B0];
  observers = self->_observers;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke;
  v22[3] = &unk_1E9C26188;
  v22[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v8, v10, v22);

  -[HKTaskServerProxyProvider clientQueueObjectHandlerWithCompletion:](self->_proxyProvider, "clientQueueObjectHandlerWithCompletion:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_3;
  v19[3] = &unk_1E9C26688;
  v19[4] = self;
  v20 = v8;
  v21 = v16;
  v17 = v16;
  v18 = v8;
  -[HKHeartbeatSeriesFeatureStatusManager _startObservingWithActivationHandler:](self, "_startObservingWithActivationHandler:", v19);

}

void __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t);
  void *v5;
  id v6;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = MEMORY[0x1E0C809B0];
  v3 = 3221225472;
  v4 = __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_2;
  v5 = &unk_1E9C26110;
  objc_copyWeak(&v6, &location);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAutomaticProxyReconnectionHandler:", &v2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setShouldRetryOnInterruption:", 1, v2, v3, v4, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutomaticProxyReconnection");

}

void __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v8 = a1[5];
  v9 = *(void **)(v7 + 16);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_4;
  v12[3] = &unk_1E9C26660;
  v13 = v5;
  v14 = v7;
  v15 = v6;
  v10 = v6;
  v11 = v5;
  objc_msgSend(v9, "notifyObserver:handler:", v8, v12);
  (*(void (**)(void))(a1[6] + 16))();

}

void __82__HKHeartbeatSeriesFeatureStatusManager_registerObserver_queue_activationHandler___block_invoke_4(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = v3;
  if (v4)
  {
    objc_msgSend(v3, "heartbeatSeriesFeatureStatusManager:didUpdatePredominantFeature:", v5, objc_msgSend(v4, "integerValue"));
  }
  else if (a1[6])
  {
    objc_msgSend(v3, "heartbeatSeriesFeatureStatusManager:didFailToUpdateWithError:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 2000, CFSTR("Unknown error starting observation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heartbeatSeriesFeatureStatusManager:didFailToUpdateWithError:", v5, v6);

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  HKObserverSet *observers;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;
  __int16 v12;
  HKHeartbeatSeriesFeatureStatusManager *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)buf = 138543874;
    v11 = (id)objc_opt_class();
    v12 = 2048;
    v13 = self;
    v14 = 2112;
    v15 = v4;
    v7 = v11;
    _os_log_impl(&dword_1D7781000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Unregistering observer %@", buf, 0x20u);

  }
  observers = self->_observers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke;
  v9[3] = &unk_1E9C26188;
  v9[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", v4, v9);

}

uint64_t __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setAutomaticProxyReconnectionHandler:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 24);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_3;
  v5[3] = &unk_1E9C26160;
  v5[4] = v2;
  return objc_msgSend(v3, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_5, v5);
}

uint64_t __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_3_cold_1(a1, v4);

}

- (void)_startObservingWithActivationHandler:(id)a3
{
  id v4;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  proxyProvider = self->_proxyProvider;
  v6 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke;
  v10[3] = &unk_1E9C266F0;
  v11 = v4;
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke_2;
  v8[3] = &unk_1E9C26430;
  v8[4] = self;
  v9 = v11;
  v7 = v11;
  -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v10, v8);

}

uint64_t __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", *(_QWORD *)(a1 + 32));
}

void __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke_2_cold_1(a1, v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_synchronouslyStartObservingWithError:(id *)a3
{
  HKTaskServerProxyProvider *proxyProvider;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  proxyProvider = self->_proxyProvider;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke;
  v10[3] = &unk_1E9C26718;
  v10[4] = &v17;
  v10[5] = &v11;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3;
  v9[3] = &unk_1E9C261F0;
  v9[4] = self;
  v9[5] = &v11;
  -[HKTaskServerProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v10, v9);
  v5 = (id)v12[5];
  v6 = v5;
  if (v5)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v5);
    else
      _HKLogDroppedError();
  }

  v7 = (id)v18[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v7;
}

uint64_t __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  __int128 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_2;
  v3[3] = &unk_1E9C26368;
  v4 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(a2, "remote_startObservingChangesWithCompletion:", v3);
}

void __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

void __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)_handleAutomaticProxyReconnection
{
  NSObject *v3;
  id v6;
  id v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a1;
  v9 = 138543874;
  v10 = (id)OUTLINED_FUNCTION_5();
  v11 = 2048;
  v12 = a2;
  v13 = 2114;
  v14 = a3;
  v7 = v10;
  OUTLINED_FUNCTION_2_2(&dword_1D7781000, v3, v8, "[%{public}@:%p] Failed to resume observation on server reconnection: %{public}@", (uint8_t *)&v9);

  OUTLINED_FUNCTION_1_2();
}

- (void)_startObservingHeartNotificationsUserDefaults
{
  -[NSUserDefaults addObserver:forKeyPath:options:context:](self->_heartNotificationsUserDefaults, "addObserver:forKeyPath:options:context:", self, *MEMORY[0x1E0CB76D0], 0, HeartNotificationsUserDefaultsContext);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  NSObject *v8;
  id v9;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  HKHeartbeatSeriesFeatureStatusManager *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((void *)HeartNotificationsUserDefaultsContext == a6)
  {
    _HKInitializeLogging();
    v7 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v8 = v7;
      *(_DWORD *)buf = 138543618;
      v12 = (id)objc_opt_class();
      v13 = 2048;
      v14 = self;
      v9 = v12;
      _os_log_impl(&dword_1D7781000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Received KVO notification of notification settings change", buf, 0x16u);

    }
    -[HKHeartbeatSeriesFeatureStatusManager _updateAndNotifyAllObservers](self, "_updateAndNotifyAllObservers");
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)HKHeartbeatSeriesFeatureStatusManager;
    -[HKHeartbeatSeriesFeatureStatusManager observeValueForKeyPath:ofObject:change:context:](&v10, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (void)_updateAndNotifyAllObservers
{
  HKTaskServerProxyProvider *proxyProvider;
  void *v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[HKObserverSet count](self->_observers, "count"))
  {
    proxyProvider = self->_proxyProvider;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke_2;
    v7[3] = &unk_1E9C26160;
    v7[4] = self;
    -[HKTaskServerProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_214, v7);
  }
  else
  {
    _HKInitializeLogging();
    v4 = (void *)*MEMORY[0x1E0CB52E8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
    {
      v5 = v4;
      *(_DWORD *)buf = 138543362;
      v9 = (id)objc_opt_class();
      v6 = v9;
      _os_log_impl(&dword_1D7781000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping a manual update and notify because we have no observers", buf, 0xCu);

    }
  }
}

uint64_t __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_updateAndNotifyAllObservers");
}

void __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_ERROR))
    __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke_2_cold_1(a1, v4);

}

- (void)client_heartbeatSeriesFeatureStatusManagerDidUpdatePredominantFeature:(int64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  HKHeartbeatSeriesFeatureStatusManager *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    v7 = (void *)objc_opt_class();
    v8 = v7;
    NSStringFromHKHeartbeatSeriesFeature(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HKSensitiveLogItem();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543874;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1D7781000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Received server notification of predominant feature update: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  -[HKHeartbeatSeriesFeatureStatusManager _notifyObserversForPredominantFeatureUpdate:](self, "_notifyObserversForPredominantFeatureUpdate:", a3);
}

- (void)client_heartbeatSeriesFeatureStatusManagerDidFailToUpdateWithError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _BYTE v8[24];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB52E8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52E8], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    *(_DWORD *)v8 = 138543874;
    *(_QWORD *)&v8[4] = objc_opt_class();
    *(_WORD *)&v8[12] = 2048;
    *(_QWORD *)&v8[14] = self;
    *(_WORD *)&v8[22] = 2114;
    v9 = v4;
    v7 = *(id *)&v8[4];
    _os_log_impl(&dword_1D7781000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@:%p] Received server notification of update error: %{public}@", v8, 0x20u);

  }
  -[HKHeartbeatSeriesFeatureStatusManager _notifyObserversForFailureToUpdateWithError:](self, "_notifyObserversForFailureToUpdateWithError:", v4, *(_OWORD *)v8, *(_QWORD *)&v8[16], v9);

}

- (void)_notifyObserversForPredominantFeatureUpdate:(int64_t)a3
{
  HKObserverSet *observers;
  _QWORD v4[6];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __85__HKHeartbeatSeriesFeatureStatusManager__notifyObserversForPredominantFeatureUpdate___block_invoke;
  v4[3] = &unk_1E9C26760;
  v4[4] = self;
  v4[5] = a3;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v4);
}

uint64_t __85__HKHeartbeatSeriesFeatureStatusManager__notifyObserversForPredominantFeatureUpdate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "heartbeatSeriesFeatureStatusManager:didUpdatePredominantFeature:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversForFailureToUpdateWithError:(id)a3
{
  id v4;
  HKObserverSet *observers;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__HKHeartbeatSeriesFeatureStatusManager__notifyObserversForFailureToUpdateWithError___block_invoke;
  v7[3] = &unk_1E9C26788;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v7);

}

uint64_t __85__HKHeartbeatSeriesFeatureStatusManager__notifyObserversForFailureToUpdateWithError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "heartbeatSeriesFeatureStatusManager:didFailToUpdateWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heartNotificationsUserDefaults, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

void __60__HKHeartbeatSeriesFeatureStatusManager_unregisterObserver___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[40];

  OUTLINED_FUNCTION_3_2(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_4_1();
  v4 = OUTLINED_FUNCTION_0_4(v3);
  OUTLINED_FUNCTION_2_2(&dword_1D7781000, v2, v5, "[%{public}@:%p] Failed to communicate with task server for observation stop: %{public}@", v6);

  OUTLINED_FUNCTION_1_2();
}

void __78__HKHeartbeatSeriesFeatureStatusManager__startObservingWithActivationHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[40];

  OUTLINED_FUNCTION_3_2(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_4_1();
  v4 = OUTLINED_FUNCTION_0_4(v3);
  OUTLINED_FUNCTION_2_2(&dword_1D7781000, v2, v5, "[%{public}@:%p] Failed to communicate with task server for observation start: %{public}@", v6);

  OUTLINED_FUNCTION_1_2();
}

void __79__HKHeartbeatSeriesFeatureStatusManager__synchronouslyStartObservingWithError___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (void *)OUTLINED_FUNCTION_5();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v10 = 138543874;
  v11 = v5;
  v12 = 2048;
  v13 = v6;
  v14 = 2114;
  v15 = v7;
  v8 = v5;
  OUTLINED_FUNCTION_2_2(&dword_1D7781000, v2, v9, "[%{public}@:%p] Failed to communicate with task server for observation start: %{public}@", (uint8_t *)&v10);

  OUTLINED_FUNCTION_1_2();
}

void __69__HKHeartbeatSeriesFeatureStatusManager__updateAndNotifyAllObservers__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint8_t v6[40];

  OUTLINED_FUNCTION_3_2(a1, a2);
  v3 = (void *)OUTLINED_FUNCTION_4_1();
  v4 = OUTLINED_FUNCTION_0_4(v3);
  OUTLINED_FUNCTION_2_2(&dword_1D7781000, v2, v5, "[%{public}@:%p] Failed to communicate with task server for update and notify: %{public}@", v6);

  OUTLINED_FUNCTION_1_2();
}

@end
