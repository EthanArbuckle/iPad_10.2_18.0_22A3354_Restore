@implementation BLSXPCAssertionService

+ (id)defaultEndpoint
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0D03458];
  objc_msgSend(MEMORY[0x1E0D03458], "defaultShellMachName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[BLSXPCAssertionServiceSpecification identifier](BLSXPCAssertionServiceSpecification, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpointForMachName:service:instance:", v3, v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0D03458];
    +[BLSXPCAssertionServiceSpecification identifier](BLSXPCAssertionServiceSpecification, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nullEndpointForService:instance:", v9, 0);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BLSXPCAssertionService)init
{
  void *v3;
  BLSXPCAssertionService *v4;

  +[BLSXPCAssertionService defaultEndpoint](BLSXPCAssertionService, "defaultEndpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[BLSXPCAssertionService initWithEndpoint:](self, "initWithEndpoint:", v3);

  return v4;
}

- (BLSXPCAssertionService)initWithEndpoint:(id)a3
{
  id v5;
  BLSXPCAssertionService *v6;
  BLSXPCAssertionService *v7;
  uint64_t v8;
  NSMapTable *queue_assertions;
  uint64_t v10;
  NSMutableSet *queue_assertionsToReacquire;
  uint64_t v12;
  BSServiceConnection *connection;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BSServiceConnection *v18;
  id v19;
  id v20;
  BLSXPCAssertionService *v21;
  NSObject *v22;
  BSServiceConnection *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  BLSXPCAssertionService *v30;
  id v31;
  id location;
  objc_super v33;
  uint8_t buf[4];
  BLSXPCAssertionService *v35;
  __int16 v36;
  BSServiceConnection *v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  NSClassFromString(CFSTR("BSServiceConnectionEndpoint"));
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_bs_assert_object != nil"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[BLSXPCAssertionService initWithEndpoint:].cold.1(a2);
    objc_msgSend(objc_retainAutorelease(v25), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B0C7CEBCLL);
  }
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("[_bs_assert_object isKindOfClass:BSServiceConnectionEndpointClass]"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[BLSXPCAssertionService initWithEndpoint:].cold.2(a2);
    objc_msgSend(objc_retainAutorelease(v26), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1B0C7CF20);
  }

  v33.receiver = self;
  v33.super_class = (Class)BLSXPCAssertionService;
  v6 = -[BLSXPCAssertionService init](&v33, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    queue_assertions = v7->_queue_assertions;
    v7->_queue_assertions = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    queue_assertionsToReacquire = v7->_queue_assertionsToReacquire;
    v7->_queue_assertionsToReacquire = (NSMutableSet *)v10;

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v5);
    v12 = objc_claimAutoreleasedReturnValue();
    connection = v7->_connection;
    v7->_connection = (BSServiceConnection *)v12;

    +[BLSXPCAssertionServiceSpecification serviceQuality](BLSXPCAssertionServiceSpecification, "serviceQuality");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D01760], "serial");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serviceClass:relativePriority:", objc_msgSend(v14, "serviceClass"), objc_msgSend(v14, "relativePriority"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)BSDispatchQueueCreate();

    objc_storeStrong((id *)&v7->_requestQueue, v17);
    objc_initWeak(&location, v7);
    v18 = v7->_connection;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __43__BLSXPCAssertionService_initWithEndpoint___block_invoke;
    v27[3] = &unk_1E621A638;
    v19 = v14;
    v28 = v19;
    v20 = v17;
    v29 = v20;
    v21 = v7;
    v30 = v21;
    objc_copyWeak(&v31, &location);
    -[BSServiceConnection configureConnection:](v18, "configureConnection:", v27);
    -[BSServiceConnection activate](v7->_connection, "activate");
    bls_assertions_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v24 = v7->_connection;
      *(_DWORD *)buf = 134218498;
      v35 = v21;
      v36 = 2114;
      v37 = v24;
      v38 = 2114;
      v39 = v5;
      _os_log_debug_impl(&dword_1B0C75000, v22, OS_LOG_TYPE_DEBUG, "%p did activate connection:%{public}@ for endpoint:%{public}@", buf, 0x20u);
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __43__BLSXPCAssertionService_initWithEndpoint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setServiceQuality:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(a1 + 40));
  +[BLSXPCAssertionServiceSpecification interface](BLSXPCAssertionServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 48));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__BLSXPCAssertionService_initWithEndpoint___block_invoke_2;
  v5[3] = &unk_1E621A5F0;
  objc_copyWeak(&v6, (id *)(a1 + 56));
  objc_msgSend(v3, "setInterruptionHandler:", v5);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_0);
  objc_destroyWeak(&v6);

}

void __43__BLSXPCAssertionService_initWithEndpoint___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[BLSXPCAssertionService _queue_reconnectAssertions]((uint64_t)WeakRetained);

}

- (void)_queue_reconnectAssertions
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  BOOL v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    v21 = _os_activity_create(&dword_1B0C75000, "BLSXPCAssertionService Reconnect", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v21, &state);
    bls_assertions_log();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v29 = a1;
      _os_log_impl(&dword_1B0C75000, v2, OS_LOG_TYPE_DEFAULT, "%p Reconnect assertions", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 16), "activate");
    v3 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 24), "objectEnumerator");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

    objc_msgSend(*(id *)(a1 + 32), "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 24), "removeAllObjects");
    objc_msgSend(*(id *)(a1 + 16), "remoteTarget");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v24 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "identifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setIdentifier:", 0);
          v13 = objc_msgSend(v11, "acquisitionState");
          v14 = v13;
          if ((unint64_t)(v13 - 1) >= 2)
          {
            if (!v13)
            {
              bls_assertions_log();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218498;
                v29 = a1;
                v30 = 2114;
                v31 = v11;
                v32 = 2114;
                v33 = v12;
                _os_log_impl(&dword_1B0C75000, v19, OS_LOG_TYPE_INFO, "%p %{public}@ oldIdentifier=%{public}@ is no longer acquired when handling the reconnection event, ignoring", buf, 0x20u);
              }

            }
          }
          else
          {
            objc_msgSend(v11, "identifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v15 == 0;

            if (!v16)
            {
              bls_assertions_log();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218498;
                v29 = a1;
                v30 = 2114;
                v31 = v11;
                v32 = 2114;
                v33 = v12;
                _os_log_impl(&dword_1B0C75000, v20, OS_LOG_TYPE_INFO, "%p %{public}@ oldIdentifier=%{public}@ has a new identifier, ignoring", buf, 0x20u);
              }

              goto LABEL_24;
            }
            bls_assertions_log();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              NSStringFromBLSAssertionAcquisitionState(v14);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v29 = a1;
              v30 = 2048;
              v31 = v11;
              v32 = 2114;
              v33 = v18;
              _os_log_impl(&dword_1B0C75000, v17, OS_LOG_TYPE_INFO, "%p Reacquiring assertion %p for state %{public}@", buf, 0x20u);

            }
            -[BLSXPCAssertionService _queue_acquireAssertion:withRemoteTarget:](a1, v11, v22);
          }

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
        if (v8)
          continue;
        break;
      }
    }
LABEL_24:

    os_activity_scope_leave(&state);
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

- (id)_queue_assertionForIdentifier:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      bls_assertions_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1 + 24);
        v8 = 134218498;
        v9 = a1;
        v10 = 2112;
        v11 = v3;
        v12 = 2112;
        v13 = v7;
        _os_log_error_impl(&dword_1B0C75000, v5, OS_LOG_TYPE_ERROR, "%p could not find assertion:%@; %@",
          (uint8_t *)&v8,
          0x20u);
      }

      objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v3);
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_queue_setAssertion:(void *)a3 forIdentifier:
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(*(id *)(a1 + 24), "setObject:forKey:", v5, v6);
    bls_assertions_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v8 = 134218498;
      v9 = a1;
      v10 = 2114;
      v11 = v5;
      v12 = 2114;
      v13 = v6;
      _os_log_debug_impl(&dword_1B0C75000, v7, OS_LOG_TYPE_DEBUG, "%p set assertion:%{public}@ for identifier:%{public}@", (uint8_t *)&v8, 0x20u);
    }

  }
}

- (void)_queue_removeAssertionForIdentifier:(uint64_t)a1
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    bls_assertions_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[BLSXPCAssertionService _queue_removeAssertionForIdentifier:].cold.1(a1, (uint64_t)v3, v4);

    objc_msgSend(*(id *)(a1 + 24), "removeObjectForKey:", v3);
  }

}

- (void)enqueueRemoteRequest:(uint64_t)a1
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __47__BLSXPCAssertionService_enqueueRemoteRequest___block_invoke;
    v6[3] = &unk_1E621A660;
    v6[4] = a1;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

void __47__BLSXPCAssertionService_enqueueRemoteRequest___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteTarget");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_queue_acquireAssertion:(void *)a3 withRemoteTarget:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    objc_msgSend(v5, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    bls_assertions_log();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
      {
        *(_DWORD *)buf = 134218498;
        v21 = a1;
        v22 = 2114;
        v23 = v5;
        v24 = 2114;
        v25 = v7;
        _os_log_debug_impl(&dword_1B0C75000, v8, OS_LOG_TYPE_DEBUG, "%p assertion:%{public}@ already has identifier:%{public}@", buf, 0x20u);
      }

      -[BLSXPCAssertionService _queue_setAssertion:forIdentifier:](a1, v5, v7);
      objc_msgSend(v6, "acquireAssertion:", v7);
    }
    else
    {
      if (v9)
        -[BLSXPCAssertionService _queue_acquireAssertion:withRemoteTarget:].cold.1(a1, (uint64_t)v5, v8);

      objc_msgSend(v5, "descriptor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      objc_msgSend(v6, "acquireAssertionForDescriptor:error:", v10, &v19);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v19;

      if (v11)
      {
        objc_msgSend(v5, "setIdentifier:", v11);
        -[BLSXPCAssertionService _queue_setAssertion:forIdentifier:](a1, v5, v11);
      }
      if (v12)
      {
        v13 = objc_msgSend(v12, "isBSServiceConnectionError");
        bls_assertions_log();
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v13)
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "bls_loggingString");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v21 = a1;
            v22 = 2114;
            v23 = v5;
            v24 = 2114;
            v25 = v18;
            _os_log_error_impl(&dword_1B0C75000, v15, OS_LOG_TYPE_ERROR, "%p assertion:%{public}@ failed to acquire with connection error:%{public}@", buf, 0x20u);

          }
          objc_msgSend(v5, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v16)
            objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
        }
        else
        {
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v12, "bls_loggingString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218498;
            v21 = a1;
            v22 = 2114;
            v23 = v5;
            v24 = 2114;
            v25 = v17;
            _os_log_impl(&dword_1B0C75000, v15, OS_LOG_TYPE_INFO, "%p assertion:%{public}@ failed to acquire with error:%{public}@", buf, 0x20u);

          }
          -[BLSXPCAssertionService queue_assertionResponder:didFailToAcquireWithBLSError:](a1, v5, v12);
        }
      }

    }
  }

}

- (void)queue_assertionResponder:(void *)a3 didFailToAcquireWithBLSError:
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  if (a1)
  {
    v5 = *(NSObject **)(a1 + 8);
    v6 = a3;
    dispatch_assert_queue_V2(v5);
    objc_msgSend(v8, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      -[BLSXPCAssertionService _queue_removeAssertionForIdentifier:](a1, v7);
    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v8);
    objc_msgSend(v8, "serviceFailedToAcquireWithError:", v6);

  }
}

- (void)acquireAssertion:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  BLSXPCAssertionService *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__BLSXPCAssertionService_acquireAssertion___block_invoke;
  v6[3] = &unk_1E621A688;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[BLSXPCAssertionService enqueueRemoteRequest:]((uint64_t)self, v6);

}

void __43__BLSXPCAssertionService_acquireAssertion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isAcquired"))
  {
    bls_assertions_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43__BLSXPCAssertionService_acquireAssertion___block_invoke_cold_1();

  }
  else
  {
    -[BLSXPCAssertionService _queue_acquireAssertion:withRemoteTarget:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32), v3);
  }

}

- (void)cancelAssertion:(id)a3 withError:(id)a4
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
  v10[2] = __52__BLSXPCAssertionService_cancelAssertion_withError___block_invoke;
  v10[3] = &unk_1E621A6B0;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[BLSXPCAssertionService enqueueRemoteRequest:]((uint64_t)self, v10);

}

void __52__BLSXPCAssertionService_cancelAssertion_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  bls_assertions_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __52__BLSXPCAssertionService_cancelAssertion_withError___block_invoke_cold_1();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAssertion:withError:", v5, *(_QWORD *)(a1 + 48));

}

- (void)restartAssertionTimeoutTimer:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__BLSXPCAssertionService_restartAssertionTimeoutTimer___block_invoke;
  v6[3] = &unk_1E621A688;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[BLSXPCAssertionService enqueueRemoteRequest:]((uint64_t)self, v6);

}

void __55__BLSXPCAssertionService_restartAssertionTimeoutTimer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;

  v3 = a2;
  bls_assertions_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __55__BLSXPCAssertionService_restartAssertionTimeoutTimer___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartAssertionTimeoutTimer:", v5);

}

- (void)replaceWithService:(id)a3
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("%@ does not support replaceWithService: %@"), self, a3);
}

- (void)assertion:(id)a3 failedToAcquireWithError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  BLSXPCAssertionService *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  bls_assertions_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134218754;
    v11 = self;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_debug_impl(&dword_1B0C75000, v9, OS_LOG_TYPE_DEBUG, "%p failed to acquire assertion:%{public}@ with identifier:%{public}@ server error:%{public}@", (uint8_t *)&v10, 0x2Au);
  }

  if (v8)
    -[BLSXPCAssertionService queue_assertionResponder:didFailToAcquireWithBLSError:]((uint64_t)self, v8, v7);

}

- (void)assertionAcquired:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  BLSXPCAssertionService *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bls_assertions_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134218498;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v4;
    _os_log_debug_impl(&dword_1B0C75000, v6, OS_LOG_TYPE_DEBUG, "%p acquired assertion:%{public}@ with identifier:%{public}@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(v5, "serviceDidAcquire");
}

- (void)assertionWillCancel:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  BLSXPCAssertionService *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bls_assertions_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134218498;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v4;
    _os_log_debug_impl(&dword_1B0C75000, v6, OS_LOG_TYPE_DEBUG, "%p will cancel assertion:%{public}@ with identifier:%{public}@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(v5, "serviceWillCancel");
}

- (void)assertionDidCancel:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  BLSXPCAssertionService *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  bls_assertions_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = 134218754;
    v11 = self;
    v12 = 2114;
    v13 = v8;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_debug_impl(&dword_1B0C75000, v9, OS_LOG_TYPE_DEBUG, "%p did cancel assertion:%{public}@ with identifier:%{public}@ error:%{public}@", (uint8_t *)&v10, 0x2Au);
  }

  objc_msgSend(v8, "serviceDidCancelWithError:", v7);
  -[BLSXPCAssertionService _queue_removeAssertionForIdentifier:]((uint64_t)self, v6);

}

- (void)assertionPaused:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  BLSXPCAssertionService *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bls_assertions_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134218498;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v4;
    _os_log_debug_impl(&dword_1B0C75000, v6, OS_LOG_TYPE_DEBUG, "%p paused assertion:%{public}@ with identifier:%{public}@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(v5, "serviceDidPause");
}

- (void)assertionResumed:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  BLSXPCAssertionService *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_requestQueue);
  -[BLSXPCAssertionService _queue_assertionForIdentifier:]((uint64_t)self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  bls_assertions_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = 134218498;
    v8 = self;
    v9 = 2114;
    v10 = v5;
    v11 = 2114;
    v12 = v4;
    _os_log_debug_impl(&dword_1B0C75000, v6, OS_LOG_TYPE_DEBUG, "%p resumed assertion:%{public}@ with identifier:%{public}@", (uint8_t *)&v7, 0x20u);
  }

  objc_msgSend(v5, "serviceDidResume");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_assertionsToReacquire, 0);
  objc_storeStrong((id *)&self->_queue_assertions, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_requestQueue, 0);
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
  OUTLINED_FUNCTION_4();
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
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B0C75000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)_queue_removeAssertionForIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 24), "objectForKey:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 134218498;
  v8 = a1;
  v9 = 2114;
  v10 = v6;
  v11 = 2114;
  v12 = a2;
  _os_log_debug_impl(&dword_1B0C75000, a3, OS_LOG_TYPE_DEBUG, "%p remove assertion:%{public}@ for identifier:%{public}@", (uint8_t *)&v7, 0x20u);

}

- (void)_queue_acquireAssertion:(NSObject *)a3 withRemoteTarget:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218242;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_5(&dword_1B0C75000, a3, (uint64_t)a3, "%p acquiringAssertionForDescriptor %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

void __43__BLSXPCAssertionService_acquireAssertion___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1B0C75000, v0, OS_LOG_TYPE_ERROR, "%p already aquired:%{public}@, ignoring", v1, 0x16u);
  OUTLINED_FUNCTION_6();
}

void __52__BLSXPCAssertionService_cancelAssertion_withError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1B0C75000, v0, v1, "%p tell remote to cancel assertion:%{public}@", v2);
  OUTLINED_FUNCTION_6();
}

void __55__BLSXPCAssertionService_restartAssertionTimeoutTimer___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1B0C75000, v0, v1, "%p tell remote to restart timeout timer for assertion:%{public}@", v2);
  OUTLINED_FUNCTION_6();
}

@end
