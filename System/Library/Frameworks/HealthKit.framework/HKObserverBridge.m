@implementation HKObserverBridge

- (HKObserverBridge)init
{
  HKObserverBridge *v2;
  uint64_t v3;
  NSMapTable *observerBlocksByKeyByObserver;
  uint64_t v5;
  NSMutableDictionary *observersByKey;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKObserverBridge;
  v2 = -[HKObserverBridge init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observerBlocksByKeyByObserver = v2->_observerBlocksByKeyByObserver;
    v2->_observerBlocksByKeyByObserver = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    observersByKey = v2->_observersByKey;
    v2->_observersByKey = (NSMutableDictionary *)v5;

    v2->_lock._os_unfair_lock_opaque = 0;
  }
  return v2;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_observersByKey;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_observersByKey, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "bridgedObserver");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKObserverBridge unregisterBridgedObserver:forKey:](self, "unregisterBridgedObserver:forKey:", v10, v8);

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)HKObserverBridge;
  -[HKObserverBridge dealloc](&v11, sel_dealloc);
}

- (void)registerObserver:(id)a3 forKey:(id)a4 newValueHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_lock;
  void *v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  id v16;
  HKObserverBridgeHandle *v17;
  _HKBridgedObserverSet *v18;
  void *v19;
  void *v20;
  HKObserverSet *v21;
  void *v22;
  HKObserverSet *v23;
  _HKObservationBlock *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSMapTable *observerBlocksByKeyByObserver;
  void *v30;
  void *v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observersByKey, "objectForKeyedSubscript:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);

    if (v14)
    {
      HKLogInfrastructure();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v42 = (id)objc_opt_class();
        v43 = 2114;
        v44 = v9;
        v16 = v42;
        _os_log_impl(&dword_19A0E6000, v15, OS_LOG_TYPE_INFO, "[%{public}@] Beginning observation for key %{public}@", buf, 0x16u);

      }
    }
    v17 = -[HKObserverBridgeHandle initWithBridge:]([HKObserverBridgeHandle alloc], "initWithBridge:", self);
    v18 = objc_alloc_init(_HKBridgedObserverSet);
    -[HKObserverBridge makeAndRegisterBridgedObserverForKey:handle:](self, "makeAndRegisterBridgedObserverForKey:handle:", v9, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[_HKBridgedObserverSet setBridgedObserver:](v18, "setBridgedObserver:", v19);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), objc_opt_class(), v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = [HKObserverSet alloc];
    HKLogInfrastructure();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[HKObserverSet initWithName:loggingCategory:](v21, "initWithName:loggingCategory:", v20, v22);
    -[_HKBridgedObserverSet setObservers:](v18, "setObservers:", v23);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observersByKey, "setObject:forKeyedSubscript:", v18, v9);
  }
  v24 = objc_alloc_init(_HKObservationBlock);
  objc_initWeak((id *)buf, v8);
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __60__HKObserverBridge_registerObserver_forKey_newValueHandler___block_invoke;
  v38[3] = &unk_1E37F02E8;
  objc_copyWeak(&v40, (id *)buf);
  v25 = v10;
  v39 = v25;
  -[_HKObservationBlock setNewValueHandler:](v24, "setNewValueHandler:", v38);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observersByKey, "objectForKeyedSubscript:", v9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "observers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "registerObserver:", v24);

  -[NSMapTable objectForKey:](self->_observerBlocksByKeyByObserver, "objectForKey:", v8);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = v28 == 0;

  if ((_DWORD)v26)
  {
    observerBlocksByKeyByObserver = self->_observerBlocksByKeyByObserver;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](observerBlocksByKeyByObserver, "setObject:forKey:", v30, v8);

  }
  -[NSMapTable objectForKey:](self->_observerBlocksByKeyByObserver, "objectForKey:", v8);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", v9);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v32 == 0;

  if (v33)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable objectForKey:](self->_observerBlocksByKeyByObserver, "objectForKey:", v8);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v9);

  }
  -[NSMapTable objectForKey:](self->_observerBlocksByKeyByObserver, "objectForKey:", v8);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "objectForKeyedSubscript:", v9);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "addObject:", v24);

  os_unfair_lock_unlock(p_lock);
  objc_destroyWeak(&v40);
  objc_destroyWeak((id *)buf);

}

void __60__HKObserverBridge_registerObserver_forKey_newValueHandler___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  id v4;

  v4 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)unregisterObserver:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  id v21;
  id obj;
  _QWORD v23[5];
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_observerBlocksByKeyByObserver, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_observersByKey, "objectForKeyedSubscript:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v10)
    v13 = v11 == 0;
  else
    v13 = 1;
  if (!v13)
  {
    v21 = v6;
    -[NSMapTable objectForKey:](self->_observerBlocksByKeyByObserver, "objectForKey:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObjectForKey:", v7);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v10;
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v27 != v17)
            objc_enumerationMutation(obj);
          v19 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v12, "observers");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __46__HKObserverBridge_unregisterObserver_forKey___block_invoke;
          v23[3] = &unk_1E37E6738;
          v23[4] = self;
          v24 = v7;
          v25 = v12;
          objc_msgSend(v20, "unregisterObserver:runIfLastObserver:", v19, v23);

        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v16);
    }

    p_lock = &self->_lock;
    v6 = v21;
  }
  os_unfair_lock_unlock(p_lock);

}

void __46__HKObserverBridge_unregisterObserver_forKey___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _BOOL4 v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  _BYTE v10[24];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_INFO);

  if (v3)
  {
    HKLogInfrastructure();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = (void *)objc_opt_class();
      v6 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)v10 = 138543618;
      *(_QWORD *)&v10[4] = v5;
      *(_WORD *)&v10[12] = 2114;
      *(_QWORD *)&v10[14] = v6;
      v7 = v5;
      _os_log_impl(&dword_19A0E6000, v4, OS_LOG_TYPE_INFO, "[%{public}@] Ending observation for key %{public}@", v10, 0x16u);

    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40), *(_OWORD *)v10, *(_QWORD *)&v10[16], v11);
  v8 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "bridgedObserver");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unregisterBridgedObserver:forKey:", v9, *(_QWORD *)(a1 + 40));

}

- (BOOL)notifyObserversOfChangeForKey:(id)a3 newValue:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v23[4];
  NSObject *v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

  if (v9)
  {
    HKLogInfrastructure();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v26 = (id)objc_opt_class();
      v27 = 2114;
      v28 = v6;
      v11 = v26;
      _os_log_impl(&dword_19A0E6000, v10, OS_LOG_TYPE_INFO, "[%{public}@] Observed change to %{public}@", buf, 0x16u);

    }
  }
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observersByKey, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "observers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_lock);
  _HKInitializeLogging();
  HKLogInfrastructure();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v13)
  {
    v16 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);

    if (v16)
    {
      HKLogInfrastructure();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v18 = (void *)objc_opt_class();
        v19 = (void *)MEMORY[0x1E0CB37E8];
        v20 = v18;
        objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v26 = v18;
        v27 = 2114;
        v28 = v21;
        v29 = 2114;
        v30 = v6;
        _os_log_impl(&dword_19A0E6000, v17, OS_LOG_TYPE_INFO, "[%{public}@] Notifying %{public}@ observers of key %{public}@", buf, 0x20u);

      }
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __59__HKObserverBridge_notifyObserversOfChangeForKey_newValue___block_invoke;
    v23[3] = &unk_1E37F0310;
    v24 = v7;
    objc_msgSend(v13, "notifyObservers:", v23);
    v15 = v24;
  }
  else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    -[HKObserverBridge notifyObserversOfChangeForKey:newValue:].cold.1((uint64_t)self, (uint64_t)v6, v15);
  }

  return v13 != 0;
}

void __59__HKObserverBridge_notifyObserversOfChangeForKey_newValue___block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(id, _QWORD);

  objc_msgSend(a2, "newValueHandler");
  v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByKey, 0);
  objc_storeStrong((id *)&self->_observerBlocksByKeyByObserver, 0);
}

- (id)makeAndRegisterBridgedObserverForKey:(id)a3 handle:(id)a4
{
  OUTLINED_FUNCTION_1_2();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)unregisterBridgedObserver:(id)a3 forKey:(id)a4
{
  OUTLINED_FUNCTION_1_2();
  NSRequestConcreteImplementation();
}

- (void)notifyObserversOfChangeForKey:(NSObject *)a3 newValue:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  id v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 138543618;
  v7 = (id)objc_opt_class();
  v8 = 2114;
  v9 = a2;
  v5 = v7;
  _os_log_error_impl(&dword_19A0E6000, a3, OS_LOG_TYPE_ERROR, "[%{public}@] Found no observer set for key %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
