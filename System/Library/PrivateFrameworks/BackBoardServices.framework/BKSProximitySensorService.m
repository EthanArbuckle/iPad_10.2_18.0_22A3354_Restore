@implementation BKSProximitySensorService

- (id)_init
{
  BKSProximitySensorService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *calloutQueue;
  void *v5;
  BKSProximitySensorService *v6;
  uint64_t v7;
  BSCompoundAssertion *observers;
  _QWORD v10[4];
  BKSProximitySensorService *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKSProximitySensorService;
  v2 = -[BKSProximitySensorService init](&v12, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.backboardd.BKSProximitySensorService", 0);
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    v5 = (void *)MEMORY[0x1E0D01718];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __34__BKSProximitySensorService__init__block_invoke;
    v10[3] = &unk_1E1EA0698;
    v6 = v2;
    v11 = v6;
    objc_msgSend(v5, "assertionWithIdentifier:stateDidChangeHandler:", CFSTR("BKSProximitySensorService observers"), v10);
    v7 = objc_claimAutoreleasedReturnValue();
    observers = v6->_observers;
    v6->_observers = (BSCompoundAssertion *)v7;

  }
  return v2;
}

- (void)_connectToRemoteServiceIfNeeded
{
  BSServiceConnection **p_connection;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  BKSProximitySensorService *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  p_connection = &self->_connection;
  if (!self->_connection)
  {
    +[BKSHIDServiceConnection clientConnectionForServiceWithName:](BKSHIDServiceConnection, "clientConnectionForServiceWithName:", CFSTR("BKProximitySensor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_storeStrong((id *)p_connection, v5);
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __60__BKSProximitySensorService__connectToRemoteServiceIfNeeded__block_invoke;
      v15[3] = &unk_1E1EA1868;
      v15[4] = self;
      objc_msgSend(v5, "configureConnection:", v15);
      BKLogUISensor();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEBUG, "activating connection to server", buf, 2u);
      }

      objc_msgSend(v5, "activate");
      BKLogUISensor();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v5, "remoteTarget");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v17 = v14;
        _os_log_debug_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_DEBUG, "server remote target %{public}@", buf, 0xCu);

      }
      objc_msgSend(v5, "remoteTarget");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("we must have a remote target"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          NSStringFromSelector(a2);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (objc_class *)objc_opt_class();
          NSStringFromClass(v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544642;
          v17 = v10;
          v18 = 2114;
          v19 = v12;
          v20 = 2048;
          v21 = self;
          v22 = 2114;
          v23 = CFSTR("BKSProximitySensorService.m");
          v24 = 1024;
          v25 = 95;
          v26 = 2114;
          v27 = v9;
          _os_log_error_impl(&dword_18A0F0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);

        }
        objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x18A118C4CLL);
      }
    }
    else
    {
      BKLogUISensor();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_18A0F0000, v13, OS_LOG_TYPE_ERROR, "cannot get connection for service", buf, 2u);
      }

    }
  }
}

- (void)proximityDetectionMaskDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_calloutQueue);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[BSCompoundAssertion orderedContext](self->_observers, "orderedContext", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "proximitySensorDetectionMaskDidChange:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)addObserver:(id)a3 forReason:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  -[BKSProximitySensorService _connectToRemoteServiceIfNeeded](self, "_connectToRemoteServiceIfNeeded");
  -[BSCompoundAssertion acquireForReason:withContext:](self->_observers, "acquireForReason:withContext:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __60__BKSProximitySensorService__connectToRemoteServiceIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = a2;
  BKLogUISensor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v9 = 0;
    _os_log_debug_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEBUG, "configured client service", v9, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF5E4B0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF661A0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("BKProximitySensor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v6);
  objc_msgSend(v7, "setClient:", v5);
  objc_msgSend(v3, "setInterface:", v7);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v8);

  objc_msgSend(v3, "setInterruptionHandler:", &__block_literal_global_2460);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_61);

}

void __60__BKSProximitySensorService__connectToRemoteServiceIfNeeded__block_invoke_60()
{
  NSObject *v0;
  uint8_t v1[16];

  BKLogUISensor();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v1 = 0;
    _os_log_error_impl(&dword_18A0F0000, v0, OS_LOG_TYPE_ERROR, "backboardd must be going down, sounds like fun", v1, 2u);
  }

}

void __60__BKSProximitySensorService__connectToRemoteServiceIfNeeded__block_invoke_58(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  BKLogUISensor();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_ERROR, "service interruption -- attempting to reactivate", v4, 2u);
  }

  objc_msgSend(v2, "activate");
}

void __34__BKSProximitySensorService__init__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  NSObject *v11;
  _QWORD v12[4];
  _QWORD *v13;
  id v14;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4 = a2;
  objc_msgSend(v3, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend(v4, "isActive");

  objc_msgSend(v6, "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObservesProximitySensorDetectionMaskChanges:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *(_QWORD **)(a1 + 32);
    v11 = v10[2];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __34__BKSProximitySensorService__init__block_invoke_2;
    v12[3] = &unk_1E1EA1BF8;
    v13 = v10;
    v14 = v9;
    dispatch_async(v11, v12);

  }
}

uint64_t __34__BKSProximitySensorService__init__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "proximityDetectionMaskDidChange:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedInstance
{
  return -[BKSProximitySensorService _init]([BKSProximitySensorService alloc], "_init");
}

@end
