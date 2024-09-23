@implementation FBSDisplayLayoutMonitor

- (FBSDisplayLayout)currentLayout
{
  os_unfair_lock_s *p_lock;
  _FBSDisplayLayoutServiceAssertion *lock_handlerAssertion;
  void *v5;
  void *v6;
  _OWORD v8[4];
  _BYTE v9[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_handlerAssertion = self->_lock_handlerAssertion;
  if (lock_handlerAssertion)
  {
    -[_FBSDisplayLayoutServiceAssertion currentLayout](lock_handlerAssertion, "currentLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    -[NSMapTable objectEnumerator](self->_lock_deprecated_observerAssertions, "objectEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", v8, v9, 16))
    {
      objc_msgSend(**((id **)&v8[0] + 1), "currentLayout");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  os_unfair_lock_unlock(p_lock);
  return (FBSDisplayLayout *)v5;
}

void __116__FBSDisplayLayoutMonitor__initWithConfiguration_singleton_needsDefaultPriority_mutable_displayType_mutableHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;

  v7 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __39__FBSDisplayLayoutMonitor_addObserver___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = v7;
  if (WeakRetained && v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "layoutMonitor:didUpdateDisplayLayout:withContext:", WeakRetained, v9, v5);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "layoutMonitor:didUpdateDisplayLayout:", WeakRetained, v9);
    }
  }

}

uint64_t __72__FBSDisplayLayoutMonitor_initWithDisplayType_qualityOfService_handler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __36__FBSDisplayLayoutMonitor_interface__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  +[FBSDisplayLayoutMonitor serviceIdentifier](FBSDisplayLayoutMonitor, "serviceIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E38, "interfaceWithIdentifier:", v0);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(off_1E38E9E50, "protocolForProtocol:", &unk_1EE3B7260);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClient:", v1);

  objc_msgSend(v4, "setClientMessagingExpectation:", 1);
  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)interface___interface_0;
  interface___interface_0 = v2;

}

- (void)invalidate
{
  os_unfair_lock_s *p_lock;
  _FBSDisplayLayoutServiceAssertion *lock_handlerAssertion;
  id lock_deprecated_handler;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMapTable *lock_deprecated_observerAssertions;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!self->_deprecated_singleton)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    if (!self->_lock_invalidated)
    {
      self->_lock_invalidated = 1;
      -[_FBSDisplayLayoutServiceAssertion invalidate](self->_lock_handlerAssertion, "invalidate");
      lock_handlerAssertion = self->_lock_handlerAssertion;
      self->_lock_handlerAssertion = 0;

      lock_deprecated_handler = self->_lock_deprecated_handler;
      self->_lock_deprecated_handler = 0;

      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
      -[NSMapTable objectEnumerator](self->_lock_deprecated_observerAssertions, "objectEnumerator", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v13;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v13 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10++), "invalidate");
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        }
        while (v8);
      }

      lock_deprecated_observerAssertions = self->_lock_deprecated_observerAssertions;
      self->_lock_deprecated_observerAssertions = 0;

    }
    os_unfair_lock_unlock(p_lock);
  }
}

+ (id)monitorWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id result;
  void *v7;

  v3 = a3;
  if (v3)
  {
    v4 = v3;
    v5 = -[FBSDisplayLayoutMonitor _initWithConfiguration:singleton:needsDefaultPriority:mutable:displayType:mutableHandler:]([FBSDisplayLayoutMonitor alloc], "_initWithConfiguration:singleton:needsDefaultPriority:mutable:displayType:mutableHandler:", v3, 0, 0, 0, -1, 0);

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("configuration"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      +[FBSDisplayLayoutMonitor monitorWithConfiguration:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (id)_initWithConfiguration:(id)a3 singleton:(BOOL)a4 needsDefaultPriority:(BOOL)a5 mutable:(BOOL)a6 displayType:(int64_t)a7 mutableHandler:(id)a8
{
  _BOOL4 v10;
  uint64_t v11;
  id v15;
  id v16;
  void *v17;
  FBSDisplayLayoutMonitor *v18;
  void *v19;
  uint64_t v20;
  id lock_deprecated_handler;
  void *v22;
  _FBSDisplayLayoutServiceAssertion *v23;
  uint64_t v24;
  _FBSDisplayLayoutServiceAssertion *lock_handlerAssertion;
  _FBSDisplayLayoutServiceAssertion *v26;
  _FBSDisplayLayoutServiceAssertion *v27;
  id result;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id location;
  objc_super v34;

  v10 = a6;
  LODWORD(v11) = a5;
  v15 = a3;
  v16 = a8;
  if (v15)
  {
    v17 = v16;
    v34.receiver = self;
    v34.super_class = (Class)FBSDisplayLayoutMonitor;
    v18 = -[FBSDisplayLayoutMonitor init](&v34, sel_init);
    if (v18)
    {
      objc_msgSend(v15, "endpoint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "needsUserInteractivePriority"))
        v11 = 2;
      else
        v11 = v11;
      v18->_deprecated_singleton = a4;
      if (v10)
      {
        v18->_deprecated_mutable = 1;
        objc_storeStrong((id *)&v18->_deprecated_endpoint, v19);
        v18->_deprecated_qos = v11;
      }
      v18->_deprecated_displayType = a7;
      v20 = MEMORY[0x19AECA324](v17);
      lock_deprecated_handler = v18->_lock_deprecated_handler;
      v18->_lock_deprecated_handler = (id)v20;

      if (v19)
      {
        objc_msgSend(v15, "transitionHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_initWeak(&location, v18);
          v23 = [_FBSDisplayLayoutServiceAssertion alloc];
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __116__FBSDisplayLayoutMonitor__initWithConfiguration_singleton_needsDefaultPriority_mutable_displayType_mutableHandler___block_invoke;
          v30[3] = &unk_1E38EC658;
          objc_copyWeak(&v32, &location);
          v31 = v22;
          v24 = -[_FBSDisplayLayoutServiceAssertion initWithEndpoint:qos:observer:](v23, "initWithEndpoint:qos:observer:", v19, v11, v30);
          lock_handlerAssertion = v18->_lock_handlerAssertion;
          v18->_lock_handlerAssertion = (_FBSDisplayLayoutServiceAssertion *)v24;

          objc_destroyWeak(&v32);
          objc_destroyWeak(&location);
        }
        else if (!v18->_deprecated_mutable)
        {
          v26 = -[_FBSDisplayLayoutServiceAssertion initWithEndpoint:qos:observer:]([_FBSDisplayLayoutServiceAssertion alloc], "initWithEndpoint:qos:observer:", v19, v11, 0);
          v27 = v18->_lock_handlerAssertion;
          v18->_lock_handlerAssertion = v26;

        }
      }

    }
    return v18;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("config"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutMonitor _initWithConfiguration:singleton:needsDefaultPriority:mutable:displayType:mutableHandler:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v29), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

+ (id)_endpointForDisplayType:(int64_t)a3
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  +[FBSDisplayLayoutMonitor serviceIdentifier](FBSDisplayLayoutMonitor, "serviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    if (a3 == 3)
    {
      v5 = off_1E38E9E68;
      v6 = CFSTR("com.apple.CarPlayApp.non-launching-service");
      v7 = CFSTR("com.apple.CarPlayApp.Dashboard");
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unknown(%li)"), a3);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = off_1E38E9E68;
    if (a3 == 6)
    {
      v6 = CFSTR("com.apple.CarPlayApp.non-launching-service");
      goto LABEL_8;
    }
  }
  else
  {
    +[FBSDisplayLayoutMonitor mainDisplayInstanceIdentifier](FBSDisplayLayoutMonitor, "mainDisplayInstanceIdentifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v5 = off_1E38E9E68;
  }
  objc_msgSend(off_1E38E9E20, "environmentAliases");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(off_1E38E9E68, "defaultShellMachName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resolveMachService:", v9);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  objc_msgSend(v5, "endpointForMachName:service:instance:", v6, v4, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    objc_msgSend(off_1E38E9E68, "nullEndpointForService:instance:", v4, v7);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

+ (NSString)serviceIdentifier
{
  return (NSString *)CFSTR("com.apple.frontboard.layout-monitor");
}

+ (NSString)mainDisplayInstanceIdentifier
{
  return (NSString *)CFSTR("com.apple.frontboard.main-display");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_deprecated_observerAssertions, 0);
  objc_storeStrong(&self->_lock_deprecated_handler, 0);
  objc_storeStrong((id *)&self->_deprecated_endpoint, 0);
  objc_storeStrong((id *)&self->_lock_handlerAssertion, 0);
}

+ (BSServiceInterface)interface
{
  if (interface_onceToken_0 != -1)
    dispatch_once(&interface_onceToken_0, &__block_literal_global_10);
  return (BSServiceInterface *)(id)interface___interface_0;
}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (FBSDisplayLayoutMonitor)init
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  FBSDisplayLayoutMonitor *result;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  FBSDisplayLayoutMonitor *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  void *v20;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("init is not allowed on FBSDisplayLayoutMonitor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v5;
    v11 = 2114;
    v12 = v7;
    v13 = 2048;
    v14 = self;
    v15 = 2114;
    v16 = CFSTR("FBSDisplayLayoutMonitor.m");
    v17 = 1024;
    v18 = 81;
    v19 = 2114;
    v20 = v4;
    _os_log_error_impl(&dword_19A6D4000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);

  }
  objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
  result = (FBSDisplayLayoutMonitor *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

+ (id)sharedMonitorForDisplayType:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  os_unfair_lock_lock((os_unfair_lock_t)&sharedMonitorForDisplayType____lock);
  v4 = (void *)sharedMonitorForDisplayType____monitors;
  if (!sharedMonitorForDisplayType____monitors)
  {
    v5 = objc_opt_new();
    v6 = (void *)sharedMonitorForDisplayType____monitors;
    sharedMonitorForDisplayType____monitors = v5;

    v4 = (void *)sharedMonitorForDisplayType____monitors;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    +[FBSDisplayLayoutMonitor _endpointForDisplayType:](FBSDisplayLayoutMonitor, "_endpointForDisplayType:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:](FBSDisplayLayoutMonitorConfiguration, "configurationWithEndpoint:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[FBSDisplayLayoutMonitor _initWithConfiguration:singleton:needsDefaultPriority:mutable:displayType:mutableHandler:]([FBSDisplayLayoutMonitor alloc], "_initWithConfiguration:singleton:needsDefaultPriority:mutable:displayType:mutableHandler:", v10, 1, 1, 1, a3, 0);
    v11 = (void *)sharedMonitorForDisplayType____monitors;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v8, v12);

  }
  os_unfair_lock_unlock((os_unfair_lock_t)&sharedMonitorForDisplayType____lock);
  return v8;
}

- (FBSDisplayLayoutMonitor)initWithDisplayType:(int64_t)a3
{
  return -[FBSDisplayLayoutMonitor initWithDisplayType:handler:](self, "initWithDisplayType:handler:", a3, 0);
}

- (FBSDisplayLayoutMonitor)initWithDisplayType:(int64_t)a3 handler:(id)a4
{
  return -[FBSDisplayLayoutMonitor initWithDisplayType:qualityOfService:handler:](self, "initWithDisplayType:qualityOfService:handler:", a3, 21, a4);
}

- (FBSDisplayLayoutMonitor)initWithDisplayType:(int64_t)a3 qualityOfService:(unint64_t)a4 handler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  FBSDisplayLayoutMonitor *v12;
  FBSDisplayLayoutMonitor *result;
  void *v14;
  _QWORD v15[4];
  id v16;

  v8 = a5;
  if ((FBSDisplayTypeIsValid(a3) & 1) != 0)
  {
    +[FBSDisplayLayoutMonitor _endpointForDisplayType:](FBSDisplayLayoutMonitor, "_endpointForDisplayType:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBSDisplayLayoutMonitorConfiguration configurationWithEndpoint:](FBSDisplayLayoutMonitorConfiguration, "configurationWithEndpoint:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v11 = (void *)objc_msgSend(v8, "copy");

      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __72__FBSDisplayLayoutMonitor_initWithDisplayType_qualityOfService_handler___block_invoke;
      v15[3] = &unk_1E38EC680;
      v8 = v11;
      v16 = v8;
      objc_msgSend(v10, "setTransitionHandler:", v15);

    }
    v12 = -[FBSDisplayLayoutMonitor _initWithConfiguration:singleton:needsDefaultPriority:mutable:displayType:mutableHandler:](self, "_initWithConfiguration:singleton:needsDefaultPriority:mutable:displayType:mutableHandler:", v10, 0, a4 == 21, 1, a3, v8);

    return v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("FBSDisplayTypeIsValid(displayType)"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutMonitor initWithDisplayType:qualityOfService:handler:].cold.1();
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    result = (FBSDisplayLayoutMonitor *)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (int64_t)displayType
{
  return self->_deprecated_displayType;
}

- (id)handler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id result;
  void *v7;

  if (self->_deprecated_mutable)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    v4 = (void *)MEMORY[0x19AECA324](self->_lock_deprecated_handler);
    os_unfair_lock_unlock(p_lock);
    v5 = (void *)MEMORY[0x19AECA324](v4);

    return v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is deprecated and only works with monitors created using the deprecated interfaces"), "-[FBSDisplayLayoutMonitor handler]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutMonitor handler].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    result = (id)_bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)setHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _FBSDisplayLayoutServiceAssertion *v7;
  _FBSDisplayLayoutServiceAssertion *lock_handlerAssertion;
  void *v9;
  id lock_deprecated_handler;
  _FBSDisplayLayoutServiceAssertion *v11;
  BSServiceConnectionEndpoint *deprecated_endpoint;
  uint64_t deprecated_qos;
  _FBSDisplayLayoutServiceAssertion *v14;
  _FBSDisplayLayoutServiceAssertion *v15;
  void *v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  if (self->_deprecated_mutable)
  {
    v5 = v4;
    v6 = (id)objc_msgSend(v4, "copy");

    os_unfair_lock_lock(&self->_lock);
    if (self->_lock_deprecated_handler != v6 && !self->_lock_invalidated)
    {
      v7 = self->_lock_handlerAssertion;
      lock_handlerAssertion = self->_lock_handlerAssertion;
      self->_lock_handlerAssertion = 0;

      v9 = (void *)MEMORY[0x19AECA324](v6);
      lock_deprecated_handler = self->_lock_deprecated_handler;
      self->_lock_deprecated_handler = v9;

      if (self->_lock_deprecated_handler)
      {
        if (self->_deprecated_endpoint)
        {
          v11 = [_FBSDisplayLayoutServiceAssertion alloc];
          deprecated_endpoint = self->_deprecated_endpoint;
          deprecated_qos = self->_deprecated_qos;
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __38__FBSDisplayLayoutMonitor_setHandler___block_invoke;
          v17[3] = &unk_1E38EC6A8;
          v18 = v6;
          v14 = -[_FBSDisplayLayoutServiceAssertion initWithEndpoint:qos:observer:](v11, "initWithEndpoint:qos:observer:", deprecated_endpoint, deprecated_qos, v17);
          v15 = self->_lock_handlerAssertion;
          self->_lock_handlerAssertion = v14;

        }
      }
      -[_FBSDisplayLayoutServiceAssertion invalidate](v7, "invalidate");

    }
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is deprecated and only works with monitors created using the deprecated interfaces"), "-[FBSDisplayLayoutMonitor setHandler:]");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutMonitor setHandler:].cold.1();
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

uint64_t __38__FBSDisplayLayoutMonitor_setHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addObserver:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSMapTable *v8;
  NSMapTable *lock_deprecated_observerAssertions;
  _FBSDisplayLayoutServiceAssertion *v10;
  BSServiceConnectionEndpoint *deprecated_endpoint;
  uint64_t deprecated_qos;
  _FBSDisplayLayoutServiceAssertion *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id from;
  id location;

  v5 = a3;
  if (self->_deprecated_mutable)
  {
    v6 = v5;
    os_unfair_lock_lock(&self->_lock);
    if (v6)
    {
      -[NSMapTable objectForKey:](self->_lock_deprecated_observerAssertions, "objectForKey:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 || self->_lock_invalidated)
      {

      }
      else if (self->_deprecated_endpoint)
      {
        if (!self->_lock_deprecated_observerAssertions)
        {
          objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
          v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
          lock_deprecated_observerAssertions = self->_lock_deprecated_observerAssertions;
          self->_lock_deprecated_observerAssertions = v8;

        }
        objc_initWeak(&location, self);
        objc_initWeak(&from, v6);
        v10 = [_FBSDisplayLayoutServiceAssertion alloc];
        deprecated_endpoint = self->_deprecated_endpoint;
        deprecated_qos = self->_deprecated_qos;
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __39__FBSDisplayLayoutMonitor_addObserver___block_invoke;
        v15[3] = &unk_1E38EC6D0;
        objc_copyWeak(&v16, &location);
        objc_copyWeak(&v17, &from);
        v13 = -[_FBSDisplayLayoutServiceAssertion initWithEndpoint:qos:observer:](v10, "initWithEndpoint:qos:observer:", deprecated_endpoint, deprecated_qos, v15);
        -[NSMapTable setObject:forKey:](self->_lock_deprecated_observerAssertions, "setObject:forKey:", v13, v6);

        objc_destroyWeak(&v17);
        objc_destroyWeak(&v16);
        objc_destroyWeak(&from);
        objc_destroyWeak(&location);
      }
    }
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is deprecated and only works with monitors created using the deprecated interfaces"), "-[FBSDisplayLayoutMonitor addObserver:]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutMonitor addObserver:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *lock_deprecated_observerAssertions;
  void *v7;
  id v8;

  v4 = a3;
  if (self->_deprecated_mutable)
  {
    v8 = v4;
    os_unfair_lock_lock(&self->_lock);
    if (v8)
    {
      -[NSMapTable objectForKey:](self->_lock_deprecated_observerAssertions, "objectForKey:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

      -[NSMapTable removeObjectForKey:](self->_lock_deprecated_observerAssertions, "removeObjectForKey:", v8);
    }
    if (!-[NSMapTable count](self->_lock_deprecated_observerAssertions, "count"))
    {
      lock_deprecated_observerAssertions = self->_lock_deprecated_observerAssertions;
      self->_lock_deprecated_observerAssertions = 0;

    }
    os_unfair_lock_unlock(&self->_lock);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is deprecated and only works with monitors created using the deprecated interfaces"), "-[FBSDisplayLayoutMonitor removeObserver:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutMonitor removeObserver:].cold.1();
    objc_msgSend(objc_retainAutorelease(v7), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
}

- (unint64_t)qualityOfService
{
  unint64_t result;
  void *v3;

  if (self->_deprecated_mutable)
  {
    if (self->_deprecated_qos == 1)
      return 21;
    else
      return 17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s is deprecated and only works with monitors created using the deprecated interfaces"), "-[FBSDisplayLayoutMonitor qualityOfService]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[FBSDisplayLayoutMonitor qualityOfService].cold.1();
    objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    result = _bs_set_crash_log_message();
    __break(0);
  }
  return result;
}

- (void)_initWithConfiguration:(const char *)a1 singleton:needsDefaultPriority:mutable:displayType:mutableHandler:.cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

+ (void)monitorWithConfiguration:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithDisplayType:qualityOfService:handler:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)handler
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)setHandler:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)addObserver:(const char *)a1 .cold.1(const char *a1)
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
  v2 = (objc_class *)OUTLINED_FUNCTION_11_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)removeObserver:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)qualityOfService
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_24();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_17();
  OUTLINED_FUNCTION_1(&dword_19A6D4000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
