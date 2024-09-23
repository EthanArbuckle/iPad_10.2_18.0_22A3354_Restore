@implementation BLSXPCBacklightProxy

- (BOOL)isAlwaysOnEnabled
{
  os_unfair_lock_s *p_lock;
  char lock_isAlwaysOnEnabled;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_isAlwaysOnEnabledCached)
  {
    lock_isAlwaysOnEnabled = self->_lock_isAlwaysOnEnabled;
  }
  else
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    lock_isAlwaysOnEnabled = objc_msgSend(v5, "isAlwaysOnEnabled");

  }
  os_unfair_lock_unlock(p_lock);
  return lock_isAlwaysOnEnabled;
}

+ (id)defaultEndpoint
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLSXPCBacklightProxySpecification identifier](BLSXPCBacklightProxySpecification, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "endpointForMachName:service:instance:", v1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0D03458];
    +[BLSXPCBacklightProxySpecification identifier](BLSXPCBacklightProxySpecification, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "nullEndpointForService:instance:", v7, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BLSXPCBacklightProxy)init
{
  void *v3;
  BLSXPCBacklightProxy *v4;

  +[BLSXPCBacklightProxy defaultEndpoint]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (BLSXPCBacklightProxy *)-[BLSXPCBacklightProxy initWithEndpoint:](self, v3);

  return v4;
}

- (id)initWithEndpoint:(void *)a1
{
  id v3;
  void *v4;
  id v5;
  _DWORD *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id location;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = v3;
    NSClassFromString(CFSTR("BSServiceConnectionEndpoint"));
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BLSXPCBacklightProxy initWithEndpoint:].cold.1(sel_initWithEndpoint_);
      objc_msgSend(objc_retainAutorelease(v23), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1B0C8DC04);
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[BLSXPCBacklightProxy initWithEndpoint:].cold.2(sel_initWithEndpoint_);
      objc_msgSend(objc_retainAutorelease(v24), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1B0C8DC68);
    }

    v30.receiver = a1;
    v30.super_class = (Class)BLSXPCBacklightProxy;
    v6 = objc_msgSendSuper2(&v30, sel_init);
    v7 = v6;
    if (v6)
    {
      v6[8] = 0;
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)*((_QWORD *)v7 + 1);
      *((_QWORD *)v7 + 1) = v8;

      objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v5);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)*((_QWORD *)v7 + 3);
      *((_QWORD *)v7 + 3) = v10;

      +[BLSXPCBacklightProxySpecification serviceQuality](BLSXPCBacklightProxySpecification, "serviceQuality");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D01760], "serial");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "serviceClass:relativePriority:", objc_msgSend(v12, "serviceClass"), objc_msgSend(v12, "relativePriority"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = BSDispatchQueueCreate();
      v16 = (void *)*((_QWORD *)v7 + 2);
      *((_QWORD *)v7 + 2) = v15;

      objc_initWeak(&location, v7);
      v17 = (void *)*((_QWORD *)v7 + 3);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __41__BLSXPCBacklightProxy_initWithEndpoint___block_invoke;
      v25[3] = &unk_1E621ABF0;
      v18 = v12;
      v26 = v18;
      v19 = v7;
      v27 = v19;
      objc_copyWeak(&v28, &location);
      objc_msgSend(v17, "configureConnection:", v25);
      objc_msgSend(*((id *)v7 + 3), "activate");
      bls_backlight_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        v22 = *((_QWORD *)v7 + 3);
        *(_DWORD *)buf = 134218498;
        v32 = v19;
        v33 = 2114;
        v34 = v22;
        v35 = 2114;
        v36 = v5;
        _os_log_debug_impl(&dword_1B0C75000, v20, OS_LOG_TYPE_DEBUG, "%p did activate connection:%{public}@ for endpoint:%{public}@", buf, 0x20u);
      }

      objc_destroyWeak(&v28);
      objc_destroyWeak(&location);

    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

void __41__BLSXPCBacklightProxy_initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setServiceQuality:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16));
  +[BLSXPCBacklightProxySpecification interface](BLSXPCBacklightProxySpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__BLSXPCBacklightProxy_initWithEndpoint___block_invoke_2;
  v5[3] = &unk_1E621A5F0;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  objc_msgSend(v3, "setInterruptionHandler:", v5);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_10);
  objc_destroyWeak(&v6);

}

void __41__BLSXPCBacklightProxy_initWithEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[BLSXPCBacklightProxy _reactivate]((uint64_t)WeakRetained);

}

- (void)_reactivate
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  os_activity_scope_state_s v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = _os_activity_create(&dword_1B0C75000, "BLSXPCBacklightProxy Reconnect", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    v5.opaque[0] = 0;
    v5.opaque[1] = 0;
    os_activity_scope_enter(v2, &v5);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 24), "activate");
    *(_BYTE *)(a1 + 72) = 0;
    *(_BYTE *)(a1 + 74) = 0;
    if (objc_msgSend(*(id *)(a1 + 8), "count"))
    {
      bls_backlight_log();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v7 = a1;
        _os_log_impl(&dword_1B0C75000, v3, OS_LOG_TYPE_DEFAULT, "%p backlight proxy has observers - reconnect and begin observation.", buf, 0xCu);
      }

      -[BLSXPCBacklightProxy lock_updateHostObservationMask:](a1, 1);
    }
    else
    {
      bls_backlight_log();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v7 = a1;
        _os_log_impl(&dword_1B0C75000, v4, OS_LOG_TYPE_DEFAULT, "%p Reset BLSXPCBacklightProxy for reconnect because there are no observers.", buf, 0xCu);
      }

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    os_activity_scope_leave(&v5);

  }
}

- (void)invalidate
{
  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)dealloc
{
  void *v1;
  objc_class *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v3, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

- (int64_t)backlightState
{
  os_unfair_lock_s *p_lock;
  uint64_t lock_backlightState;
  void *v5;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_isBacklightStateCached)
  {
    lock_backlightState = self->_lock_backlightState;
  }
  else
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getBacklightState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    lock_backlightState = objc_msgSend(v6, "integerValue");

  }
  os_unfair_lock_unlock(p_lock);
  return lock_backlightState;
}

- (int64_t)flipbookState
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  int64_t v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getFlipbookState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (BOOL)isTransitioning
{
  os_unfair_lock_s *p_lock;
  void *v4;
  char v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTransitioning");

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (BOOL)deviceSupportsAlwaysOn
{
  os_unfair_lock_s *p_lock;
  char lock_deviceSupportsAlwaysOn;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_deviceSupportsAlwaysOnCached)
  {
    lock_deviceSupportsAlwaysOn = self->_lock_deviceSupportsAlwaysOn;
  }
  else
  {
    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    lock_deviceSupportsAlwaysOn = objc_msgSend(v5, "deviceSupportsAlwaysOn");

    if (!self->_lock_deviceSupportsAlwaysOnCached)
    {
      self->_lock_deviceSupportsAlwaysOn = lock_deviceSupportsAlwaysOn;
      self->_lock_deviceSupportsAlwaysOnCached = 1;
    }
  }
  os_unfair_lock_unlock(p_lock);
  return lock_deviceSupportsAlwaysOn;
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[BLSXPCBacklightProxyObserverMask maskForObserver:](BLSXPCBacklightProxyObserverMask, "maskForObserver:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable setObject:forKey:](self->_lock_observers, "setObject:forKey:", v5, v4);

  -[BLSXPCBacklightProxy lock_updateHostObservationMask:]((uint64_t)self, 0);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)lock_updateHostObservationMask:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 32));
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, *(NSMapTable **)(a1 + 8));
    value = 0;
    key = 0;
    if (NSNextMapEnumeratorPair(&enumerator, &key, &value))
    {
      v4 = 0;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      do
      {
        if (key)
        {
          v10 = value;
          v4 = v4 + objc_msgSend(value, "isObservingDidCompleteUpdateToState");
          v5 = v5 + objc_msgSend(v10, "isObservingEventsArray");
          v6 = v6 + objc_msgSend(v10, "isObservingDidChangeAlwaysOnEnabled");
          v7 = v7 + objc_msgSend(v10, "isObservingActivatingWithEvent");
          v9 = v9 + objc_msgSend(v10, "isObservingDeactivatingWithEvent");
          v8 = v8 + objc_msgSend(v10, "isObservingPerformingEvent");
        }
      }
      while (NSNextMapEnumeratorPair(&enumerator, &key, &value));
    }
    else
    {
      v9 = 0;
      v8 = 0;
      v7 = 0;
      v6 = 0;
      v5 = 0;
      v4 = 0;
    }
    NSEndMapTableEnumeration(&enumerator);
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v11 = MEMORY[0x1E0C809B0];
    v21 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __55__BLSXPCBacklightProxy_lock_updateHostObservationMask___block_invoke;
    v17[3] = &unk_1E621AC18;
    v17[4] = &v18;
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E0F100](v17);
    v12[2](v12, a1 + 36, v4);
    v12[2](v12, a1 + 40, v5);
    v12[2](v12, a1 + 44, v6);
    v12[2](v12, a1 + 48, v7);
    v12[2](v12, a1 + 52, v9);
    v12[2](v12, a1 + 56, v8);
    if ((int)v4 <= 0 && (int)v5 <= 0)
      *(_BYTE *)(a1 + 72) = 0;
    if ((int)v6 <= 0)
      *(_BYTE *)(a1 + 74) = 0;
    if (*((_BYTE *)v19 + 24) || a2)
    {
      objc_msgSend(*(id *)(a1 + 24), "remoteTarget");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[BLSXPCBacklightProxyObserverMask maskForObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:](BLSXPCBacklightProxyObserverMask, "maskForObservingDidCompleteUpdateToState:observingEventsArray:didChangeAlwaysOnEnabled:activatingWithEvent:deactivatingWithEvent:performingEvent:", (int)v4 > 0, (int)v5 > 0, (int)v6 > 0, (int)v7 > 0, (int)v9 > 0, (int)v8 > 0);
      v15[0] = v11;
      v15[1] = 3221225472;
      v15[2] = __55__BLSXPCBacklightProxy_lock_updateHostObservationMask___block_invoke_2;
      v15[3] = &unk_1E621AA30;
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v16 = v14;
      objc_msgSend(v13, "nowObservingWithMask:completion:", v14, v15);

    }
    _Block_object_dispose(&v18, 8);
  }
}

uint64_t __55__BLSXPCBacklightProxy_lock_updateHostObservationMask___block_invoke(uint64_t result, int *a2, int a3)
{
  int v3;

  v3 = *a2;
  *a2 = a3;
  if ((a3 == 0) == (v3 != 0))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  return result;
}

void __55__BLSXPCBacklightProxy_lock_updateHostObservationMask___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  os_log_type_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    bls_assertions_log();
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqual:", CFSTR("com.apple.BacklightServices")))
      v6 = OS_LOG_TYPE_FAULT;
    else
      v6 = OS_LOG_TYPE_ERROR;

    if (os_log_type_enabled(v4, v6))
    {
      v7 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v3, "bls_loggingString");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1B0C75000, v4, v6, "failed to observe with mask %{public}@ error:%{public}@", (uint8_t *)&v9, 0x16u);

    }
  }

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable removeObjectForKey:](self->_lock_observers, "removeObjectForKey:", v5);

  -[BLSXPCBacklightProxy lock_updateHostObservationMask:]((uint64_t)self, 0);
  os_unfair_lock_unlock(p_lock);
}

- (id)performChangeRequest:(id)a3
{
  BSServiceConnection *connection;
  id v4;
  void *v5;
  void *v6;

  connection = self->_connection;
  v4 = a3;
  -[BSServiceConnection remoteTarget](connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "performChangeRequest:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)didCompleteUpdateToState:(id)a3 forEvents:(id)a4 abortedEvents:(id)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v21 = a5;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isBacklightStateCached = 1;
  v19 = v8;
  v10 = objc_msgSend(v8, "integerValue");
  self->_lock_backlightState = v10;
  -[BLSXPCBacklightProxy lock_allDidCompleteUpdateToStateObservers]((id *)&self->super.isa);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v12 = v9;
  objc_msgSend(v9, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v17);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v18, "backlight:didCompleteUpdateToState:forEvents:abortedEvents:", self, v10, v12, v21);
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v18, "backlight:didCompleteUpdateToState:forEvent:", self, v10, v20);
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

}

- (id)lock_allDidCompleteUpdateToStateObservers
{
  if (a1)
  {
    -[BLSXPCBacklightProxy lock_allObserversPassingTest:](a1, &__block_literal_global_33);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)didChangeAlwaysOnEnabled:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
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
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  self->_lock_isAlwaysOnEnabledCached = 1;
  v5 = objc_msgSend(v4, "BOOLValue");
  self->_lock_isAlwaysOnEnabled = v5;
  -[BLSXPCBacklightProxy lock_allDidChangeAlwaysOnEnabledObservers]((id *)&self->super.isa);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "backlight:didChangeAlwaysOnEnabled:", self, v5, (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (id)lock_allDidChangeAlwaysOnEnabledObservers
{
  if (a1)
  {
    -[BLSXPCBacklightProxy lock_allObserversPassingTest:](a1, &__block_literal_global_34);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)performingEvent:(id)a3
{
  id v4;
  char IsActive;
  BOOL v6;
  char v7;
  char v8;
  NSUInteger v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  char v47;
  char v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  IsActive = BLSBacklightStateIsActive(objc_msgSend(v4, "previousState"));
  v6 = BLSBacklightStateIsActive(objc_msgSend(v4, "state"));
  v7 = v6 & ~IsActive;
  v8 = IsActive & !v6;
  os_unfair_lock_lock(&self->_lock);
  v9 = -[NSMapTable count](self->_lock_observers, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __40__BLSXPCBacklightProxy_performingEvent___block_invoke;
  v43[3] = &unk_1E621AC40;
  v13 = v12;
  v44 = v13;
  v47 = v7;
  v14 = v10;
  v45 = v14;
  v48 = v8;
  v15 = v11;
  v46 = v15;
  -[BLSXPCBacklightProxy lock_enumerateObserversWithBlock:]((uint64_t)self, v43);
  os_unfair_lock_unlock(&self->_lock);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v40;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v40 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * v20++), "backlight:activatingWithEvent:", self, v4);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    }
    while (v18);
  }

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v21 = v15;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v36;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v36 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v25++), "backlight:deactivatingWithEvent:", self, v4);
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
    }
    while (v23);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v26 = v13;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v49, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v32;
    do
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v32 != v29)
          objc_enumerationMutation(v26);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v30++), "backlight:performingEvent:", self, v4, (_QWORD)v31);
      }
      while (v28 != v30);
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v31, v49, 16);
    }
    while (v28);
  }

}

void __40__BLSXPCBacklightProxy_performingEvent___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isObservingPerformingEvent"))
  {
    v6 = (id *)(a1 + 32);
LABEL_9:
    objc_msgSend(*v6, "addObject:", v7);
    goto LABEL_10;
  }
  if (*(_BYTE *)(a1 + 56) && objc_msgSend(v5, "isObservingActivatingWithEvent"))
  {
    v6 = (id *)(a1 + 40);
    goto LABEL_9;
  }
  if (*(_BYTE *)(a1 + 57) && objc_msgSend(v5, "isObservingDeactivatingWithEvent"))
  {
    v6 = (id *)(a1 + 48);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)lock_enumerateObserversWithBlock:(uint64_t)a1
{
  void (**v3)(id, void *, void *);
  void *value;
  void *key;
  NSMapEnumerator enumerator;

  v3 = a2;
  if (a1)
  {
    memset(&enumerator, 0, sizeof(enumerator));
    NSEnumerateMapTable(&enumerator, *(NSMapTable **)(a1 + 8));
    value = 0;
    key = 0;
    while (NSNextMapEnumeratorPair(&enumerator, &key, &value))
    {
      if (key)
        v3[2](v3, key, value);
    }
    NSEndMapTableEnumeration(&enumerator);
  }

}

uint64_t __65__BLSXPCBacklightProxy_lock_allDidCompleteUpdateToStateObservers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isObservingDidCompleteUpdateToState");
}

- (id)lock_allObserversPassingTest:(id *)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id v12;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1[1], "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __53__BLSXPCBacklightProxy_lock_allObserversPassingTest___block_invoke;
    v10 = &unk_1E621ACC8;
    v11 = v4;
    v12 = v3;
    v5 = v4;
    -[BLSXPCBacklightProxy lock_enumerateObserversWithBlock:]((uint64_t)a1, &v7);
    a1 = (id *)objc_msgSend(v5, "copy", v7, v8, v9, v10);

  }
  return a1;
}

uint64_t __65__BLSXPCBacklightProxy_lock_allDidChangeAlwaysOnEnabledObservers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "isObservingDidChangeAlwaysOnEnabled");
}

void __53__BLSXPCBacklightProxy_lock_allObserversPassingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_lock_observers, 0);
}

- (void)initWithEndpoint:(const char *)a1 .cold.1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithEndpoint:(const char *)a1 .cold.2(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  NSStringFromSelector(a1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_7();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
