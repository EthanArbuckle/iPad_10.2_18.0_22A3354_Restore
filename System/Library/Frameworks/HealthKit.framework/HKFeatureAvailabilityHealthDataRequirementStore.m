@implementation HKFeatureAvailabilityHealthDataRequirementStore

- (HKFeatureAvailabilityHealthDataRequirementStore)initWithHealthStore:(id)a3
{
  id v4;
  HKFeatureAvailabilityHealthDataRequirementStore *v5;
  HKObserverSet *v6;
  void *v7;
  uint64_t v8;
  HKObserverSet *observers;
  HKTaskServerProxyProvider *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HKTaskServerProxyProvider *proxyProvider;
  HKTaskConfiguration *v15;
  uint64_t v16;
  NSMapTable *lock_requirementsByObserver;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HKFeatureAvailabilityHealthDataRequirementStore;
  v5 = -[HKFeatureAvailabilityHealthDataRequirementStore init](&v19, sel_init);
  if (v5)
  {
    v6 = [HKObserverSet alloc];
    HKLogInfrastructure();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[HKObserverSet initWithName:loggingCategory:](v6, "initWithName:loggingCategory:", CFSTR("HKFeatureAvailabilityHealthDataRequirementStore"), v7);
    observers = v5->_observers;
    v5->_observers = (HKObserverSet *)v8;

    v10 = [HKTaskServerProxyProvider alloc];
    objc_msgSend((id)objc_opt_class(), "taskIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKTaskServerProxyProvider initWithHealthStore:taskIdentifier:exportedObject:taskUUID:](v10, "initWithHealthStore:taskIdentifier:exportedObject:taskUUID:", v4, v11, v5, v12);
    proxyProvider = v5->_proxyProvider;
    v5->_proxyProvider = (HKTaskServerProxyProvider *)v13;

    -[HKProxyProvider setShouldRetryOnInterruption:](v5->_proxyProvider, "setShouldRetryOnInterruption:", 0);
    v15 = objc_alloc_init(HKTaskConfiguration);
    -[HKTaskServerProxyProvider setTaskConfiguration:](v5->_proxyProvider, "setTaskConfiguration:", v15);

    v5->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v16 = objc_claimAutoreleasedReturnValue();
    lock_requirementsByObserver = v5->_lock_requirementsByObserver;
    v5->_lock_requirementsByObserver = (NSMapTable *)v16;

  }
  return v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)evaluationOfRequirements:(id)a3 error:(id *)a4
{
  id v6;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  _QWORD v14[4];
  id v15;
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
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__25;
    v28 = __Block_byref_object_dispose__25;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__25;
    v22 = __Block_byref_object_dispose__25;
    v23 = 0;
    proxyProvider = self->_proxyProvider;
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke;
    v14[3] = &unk_1E37EFFF0;
    v15 = v6;
    v16 = &v24;
    v17 = &v18;
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke_3;
    v13[3] = &unk_1E37E8B48;
    v13[4] = &v18;
    -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v14, v13);
    v9 = (id)v19[5];
    v10 = v9;
    if (v9)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v9);
      else
        _HKLogDroppedError(v9);
    }

    v11 = (id)v25[5];
    _Block_object_dispose(&v18, 8);

    _Block_object_dispose(&v24, 8);
  }
  else
  {
    v11 = (id)MEMORY[0x1E0C9AA70];
  }

  return v11;
}

uint64_t __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke_2;
  v4[3] = &unk_1E37EFFC8;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_getEvaluationOfRequirements:completion:", v2, v4);
}

void __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __82__HKFeatureAvailabilityHealthDataRequirementStore_evaluationOfRequirements_error___block_invoke_3(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (void)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "count"))
    -[HKFeatureAvailabilityHealthDataRequirementStore registerObserver:forRequirements:queue:activationHandler:](self, "registerObserver:forRequirements:queue:activationHandler:", v10, v8, v9, 0);

}

- (void)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5 activationHandler:(id)a6
{
  HKTaskServerProxyProvider *proxyProvider;
  id v11;
  id v12;
  id v13;
  HKObserverSet *observers;
  id v15;
  _QWORD v16[5];

  proxyProvider = self->_proxyProvider;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[HKProxyProvider clientQueueActionHandlerWithCompletion:](proxyProvider, "clientQueueActionHandlerWithCompletion:", a6);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable setObject:forKey:](self->_lock_requirementsByObserver, "setObject:forKey:", v12, v13);
  os_unfair_lock_unlock(&self->_lock);
  observers = self->_observers;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __108__HKFeatureAvailabilityHealthDataRequirementStore_registerObserver_forRequirements_queue_activationHandler___block_invoke;
  v16[3] = &unk_1E37E6770;
  v16[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", v13, v11, v16);

  -[HKFeatureAvailabilityHealthDataRequirementStore _startObservingRequirements:activationHandler:](self, "_startObservingRequirements:activationHandler:", v12, v15);
}

void __108__HKFeatureAvailabilityHealthDataRequirementStore_registerObserver_forRequirements_queue_activationHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v7 = v3;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Beginning observation", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __108__HKFeatureAvailabilityHealthDataRequirementStore_registerObserver_forRequirements_queue_activationHandler___block_invoke_12;
  v4[3] = &unk_1E37E95B8;
  objc_copyWeak(&v5, (id *)buf);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAutomaticProxyReconnectionHandler:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setShouldRetryOnInterruption:", 1);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __108__HKFeatureAvailabilityHealthDataRequirementStore_registerObserver_forRequirements_queue_activationHandler___block_invoke_12(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleAutomaticProxyReconnection");

}

- (void)unregisterObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  HKObserverSet *observers;
  _QWORD v7[5];

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable removeObjectForKey:](self->_lock_requirementsByObserver, "removeObjectForKey:", v5);
  os_unfair_lock_unlock(p_lock);
  observers = self->_observers;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke;
  v7[3] = &unk_1E37E6770;
  v7[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", v5, v7);

}

uint64_t __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v3;
    _os_log_impl(&dword_19A0E6000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Ending observation", buf, 0xCu);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setAutomaticProxyReconnectionHandler:", 0);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2;
  v7[3] = &unk_1E37E6A70;
  v7[4] = v4;
  return objc_msgSend(v5, "fetchProxyWithHandler:errorHandler:", &__block_literal_global_63, v7);
}

uint64_t __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_stopObservingChanges");
}

void __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2_cold_1(a1);

}

- (void)_startObservingRequirements:(id)a3 activationHandler:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  HKTaskServerProxyProvider *proxyProvider;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  proxyProvider = self->_proxyProvider;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke;
  v14[3] = &unk_1E37F0058;
  v15 = v6;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2;
  v12[3] = &unk_1E37E69F8;
  v12[4] = self;
  v13 = v16;
  v10 = v16;
  v11 = v6;
  -[HKProxyProvider fetchProxyWithHandler:errorHandler:](proxyProvider, "fetchProxyWithHandler:errorHandler:", v14, v12);

}

uint64_t __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "remote_startObservingChangesInRequirements:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2_cold_1(a1);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (BOOL)_synchronouslyStartObservingWithError:(id *)a3
{
  void *v5;
  HKTaskServerProxyProvider *proxyProvider;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  _QWORD v13[6];
  _QWORD v14[4];
  id v15;
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

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__25;
  v22 = __Block_byref_object_dispose__25;
  v23 = 0;
  -[HKFeatureAvailabilityHealthDataRequirementStore _allObservedRequirements](self, "_allObservedRequirements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  proxyProvider = self->_proxyProvider;
  v7 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke;
  v14[3] = &unk_1E37EFFF0;
  v8 = v5;
  v15 = v8;
  v16 = &v24;
  v17 = &v18;
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3;
  v13[3] = &unk_1E37E8AD0;
  v13[4] = self;
  v13[5] = &v18;
  -[HKProxyProvider getSynchronousProxyWithHandler:errorHandler:](proxyProvider, "getSynchronousProxyWithHandler:errorHandler:", v14, v13);
  v9 = (id)v19[5];
  v10 = v9;
  if (v9)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v9);
    else
      _HKLogDroppedError(v9);
  }

  v11 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v11;
}

uint64_t __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD v4[4];
  __int128 v5;

  v2 = *(_QWORD *)(a1 + 32);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_2;
  v4[3] = &unk_1E37E9020;
  v5 = *(_OWORD *)(a1 + 40);
  return objc_msgSend(a2, "remote_startObservingChangesInRequirements:completion:", v2, v4);
}

void __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_2(uint64_t a1, char a2, id obj)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
}

void __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3_cold_1(a1, v4);

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

- (void)_handleAutomaticProxyReconnection
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v1, v2, "[%{public}@] Failed to resume observation on server reconnection: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

- (void)_reevaluateAllObservedRequirementsAndNotifyObservers
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v1, v2, "[%{public}@] Error reevaluating requirements on automatic proxy reconnection: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __103__HKFeatureAvailabilityHealthDataRequirementStore__reevaluateAllObservedRequirementsAndNotifyObservers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
          objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", v11, objc_msgSend(v12, "BOOLValue"));

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)_notifyObservers:(id)a3
{
  id v4;
  void *v5;
  HKObserverSet *observers;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)-[NSMapTable copy](self->_lock_requirementsByObserver, "copy");
  os_unfair_lock_unlock(&self->_lock);
  observers = self->_observers;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__HKFeatureAvailabilityHealthDataRequirementStore__notifyObservers___block_invoke;
  v9[3] = &unk_1E37F00A8;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v9);

}

void __68__HKFeatureAvailabilityHealthDataRequirementStore__notifyObservers___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_allObservedRequirements
{
  os_unfair_lock_s *p_lock;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMapTable objectEnumerator](self->_lock_requirementsByObserver, "objectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "unionSet:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  v10 = (void *)objc_msgSend(v4, "copy");

  return v10;
}

- (void)client_featureAvailabilityRequirement:(id)a3 didUpdateSatisfaction:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BOOL v11;
  uint8_t buf[4];
  HKFeatureAvailabilityHealthDataRequirementStore *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v13 = self;
    _os_log_impl(&dword_19A0E6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received server notification of requirement satisfaction update", buf, 0xCu);
  }

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __111__HKFeatureAvailabilityHealthDataRequirementStore_client_featureAvailabilityRequirement_didUpdateSatisfaction___block_invoke;
  v9[3] = &unk_1E37F00D0;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  -[HKFeatureAvailabilityHealthDataRequirementStore _notifyObservers:](self, "_notifyObservers:", v9);

}

void __111__HKFeatureAvailabilityHealthDataRequirementStore_client_featureAvailabilityRequirement_didUpdateSatisfaction___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if (objc_msgSend(a3, "containsObject:", *(_QWORD *)(a1 + 32)))
    objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_requirementsByObserver, 0);
  objc_storeStrong((id *)&self->_proxyProvider, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

void __70__HKFeatureAvailabilityHealthDataRequirementStore_unregisterObserver___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v1, v2, "[%{public}@] Failed to communicate with task server for observation stop: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __97__HKFeatureAvailabilityHealthDataRequirementStore__startObservingRequirements_activationHandler___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *(_QWORD *)(a1 + 32);
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0(&dword_19A0E6000, v1, v2, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_3();
}

void __89__HKFeatureAvailabilityHealthDataRequirementStore__synchronouslyStartObservingWithError___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  v4 = 138543618;
  v5 = v2;
  v6 = 2114;
  v7 = v3;
  _os_log_error_impl(&dword_19A0E6000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to communicate with task server for observation start: %{public}@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_3();
}

@end
