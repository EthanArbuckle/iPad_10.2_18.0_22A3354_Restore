@implementation ASCAppOfferStateCenter

+ (OS_os_log)log
{
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, &__block_literal_global_3);
  return (OS_os_log *)(id)log_log_1;
}

void __29__ASCAppOfferStateCenter_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.AppStoreComponents", "ASCAppOfferStateCenter");
  v1 = (void *)log_log_1;
  log_log_1 = (uint64_t)v0;

}

+ (ASCAppOfferStateCenter)sharedCenter
{
  if (sharedCenter_onceToken != -1)
    dispatch_once(&sharedCenter_onceToken, &__block_literal_global_3);
  return (ASCAppOfferStateCenter *)(id)sharedCenter_sharedCenter;
}

void __38__ASCAppOfferStateCenter_sharedCenter__block_invoke()
{
  ASCAppOfferStateCenter *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [ASCAppOfferStateCenter alloc];
  +[ASCServicesConnection sharedConnection](ASCServicesConnection, "sharedConnection");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[ASCWorkspace sharedWorkspace](ASCWorkspace, "sharedWorkspace");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[ASCAppOfferStateCenter initWithConnection:workspace:](v0, "initWithConnection:workspace:", v4, v1);
  v3 = (void *)sharedCenter_sharedCenter;
  sharedCenter_sharedCenter = v2;

}

- (ASCAppOfferStateCenter)initWithConnection:(id)a3 workspace:(id)a4
{
  id v7;
  id v8;
  ASCAppOfferStateCenter *v9;
  ASCAppOfferStateCenter *v10;
  uint64_t v11;
  NSMapTable *stateMachines;
  ASCJitterBackoff *v13;
  ASCJitterBackoff *reconnectBackoff;
  ASCPendingPromises *v15;
  ASCPendingPromises *pendingActionPromises;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)ASCAppOfferStateCenter;
  v9 = -[ASCAppOfferStateCenter init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connection, a3);
    objc_storeStrong((id *)&v10->_workspace, a4);
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v11 = objc_claimAutoreleasedReturnValue();
    stateMachines = v10->_stateMachines;
    v10->_stateMachines = (NSMapTable *)v11;

    v13 = -[ASCJitterBackoff initWithBaseSleepTimeInterval:maxSleepTimeInterval:]([ASCJitterBackoff alloc], "initWithBaseSleepTimeInterval:maxSleepTimeInterval:", 0.1, 5.0);
    reconnectBackoff = v10->_reconnectBackoff;
    v10->_reconnectBackoff = v13;

    v15 = objc_alloc_init(ASCPendingPromises);
    pendingActionPromises = v10->_pendingActionPromises;
    v10->_pendingActionPromises = v15;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v10, sel_daemonConnectionWasLost_, 0x1E7565F68, v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v10, sel_daemonConnectionWasLost_, 0x1E7565F88, v7);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCRebootstrapNotifier sharedNotifier](ASCRebootstrapNotifier, "sharedNotifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObserver:selector:name:object:", v10, sel_daemonDidRebootstrap_, 0x1E7565F08, v20);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ASCAppOfferStateCenter;
  -[ASCAppOfferStateCenter dealloc](&v4, sel_dealloc);
}

- (void)connectToService
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1BCB7B000, v0, OS_LOG_TYPE_DEBUG, "%@ asked to connect, but it already has a connection", v1, 0xCu);
}

uint64_t __42__ASCAppOfferStateCenter_connectToService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "Resuming observation of changes to %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v3, "startObservingStateOfOffers:", *(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "reset");
}

void __42__ASCAppOfferStateCenter_connectToService__block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __42__ASCAppOfferStateCenter_connectToService__block_invoke_19_cold_1(a1);

}

- (void)useOfferStateMachineFallback
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    ASCLocalizedString(CFSTR("OFFER_BUTTON_TITLE_VIEW"), v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASCOfferMetadata textMetadataWithTitle:subtitle:](ASCOfferMetadata, "textMetadataWithTitle:subtitle:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    -[ASCAppOfferStateCenter stateMachines](self, "stateMachines", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "offerStateDidChange:withMetadata:flags:", CFSTR("unknown"), v6, 2);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)scheduleTryReconnect
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[ASCAppOfferStateCenter reconnectBackoff](self, "reconnectBackoff");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "nextSleepTimeInterval");
    -[ASCAppOfferStateCenter performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_tryReconnect, 0);

  }
}

- (void)tryReconnect
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  id buf[2];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "Performing test before reconnecting to service", (uint8_t *)buf, 2u);
    }

    -[ASCAppOfferStateCenter connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "testConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_initWeak(buf, self);
    v7 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __38__ASCAppOfferStateCenter_tryReconnect__block_invoke;
    v10[3] = &unk_1E7560398;
    v10[4] = self;
    objc_msgSend(v6, "addSuccessBlock:", v10);
    v8[0] = v7;
    v8[1] = 3221225472;
    v8[2] = __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_2;
    v8[3] = &unk_1E7560498;
    objc_copyWeak(&v9, buf);
    objc_msgSend(v6, "addErrorBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(buf);

  }
}

void __38__ASCAppOfferStateCenter_tryReconnect__block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];
  uint8_t buf[16];

  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7B000, v2, OS_LOG_TYPE_INFO, "Connection test successful, reconnecting to service", buf, 2u);
  }

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_27;
  block[3] = &unk_1E7560398;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_27(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "connectToService");
}

void __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v3 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_2_cold_1();

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_28;
  block[3] = &unk_1E7560470;
  objc_copyWeak(&v6, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v6);

}

void __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_28(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "useOfferStateMachineFallback");

}

- (void)daemonConnectionWasLost:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ASCAppOfferStateCenter_daemonConnectionWasLost___block_invoke;
  block[3] = &unk_1E7560398;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __50__ASCAppOfferStateCenter_daemonConnectionWasLost___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingActionPromises");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelAll");

    objc_msgSend(*(id *)(a1 + 32), "setService:", 0);
    objc_msgSend(*(id *)(a1 + 32), "scheduleTryReconnect");
  }
}

- (void)daemonDidRebootstrap:(id)a3
{
  void *v4;

  -[ASCAppOfferStateCenter service](self, "service", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ASCAppOfferStateCenter setService:](self, "setService:", 0);
    -[ASCAppOfferStateCenter tryReconnect](self, "tryReconnect");
  }
}

- (id)stateMachineForOffer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  ASCAppOfferStateMachine *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[ASCAppOfferStateCenter connectToService](self, "connectToService");
  -[ASCAppOfferStateCenter stateMachines](self, "stateMachines");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v7;
  }
  else
  {
    v8 = -[ASCAppOfferStateMachine initWithOffer:stateCenter:]([ASCAppOfferStateMachine alloc], "initWithOffer:stateCenter:", v4, self);
    -[ASCAppOfferStateCenter stateMachines](self, "stateMachines");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v8, v4);

    -[ASCAppOfferStateCenter service](self, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke;
    v17[3] = &unk_1E75604C0;
    v12 = v4;
    v18 = v12;
    objc_msgSend(v10, "addSuccessBlock:", v17);

    -[ASCAppOfferStateCenter service](self, "service");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke_31;
    v15[3] = &unk_1E7560410;
    v16 = v12;
    objc_msgSend(v13, "addErrorBlock:", v15);

  }
  return v8;
}

void __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "Starting observation of changes to %{public}@", buf, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "startObservingStateOfOffers:", v6);

}

void __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke_31(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke_31_cold_1(a1);

}

- (void)stopObservingStateForOffer:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke;
  v16[3] = &unk_1E75604C0;
  v7 = v4;
  v17 = v7;
  objc_msgSend(v5, "addSuccessBlock:", v16);

  -[ASCAppOfferStateCenter service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v6;
  v12 = 3221225472;
  v13 = __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke_32;
  v14 = &unk_1E7560410;
  v15 = v7;
  v9 = v7;
  objc_msgSend(v8, "addErrorBlock:", &v11);

  -[ASCAppOfferStateCenter stateMachines](self, "stateMachines", v11, v12, v13, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObjectForKey:", v9);

}

void __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v9 = v5;
    _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "Stopping observation of changes to %{public}@", buf, 0xCu);
  }

  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopObservingStateOfOffers:", v6);

}

void __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke_32(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke_32_cold_1(a1);

}

- (id)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5 usingService:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7B000, v14, OS_LOG_TYPE_INFO, "Performing action", buf, 2u);
  }

  v15 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
  v16 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke;
  v28[3] = &unk_1E75604E8;
  v29 = v10;
  v30 = v11;
  v31 = v12;
  v17 = v15;
  v32 = v17;
  v18 = v12;
  v19 = v11;
  v20 = v10;
  objc_msgSend(v13, "addSuccessBlock:", v28);
  v26[0] = v16;
  v26[1] = 3221225472;
  v26[2] = __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_34;
  v26[3] = &unk_1E7560410;
  v21 = v17;
  v27 = v21;
  objc_msgSend(v13, "addErrorBlock:", v26);

  -[ASCAppOfferStateCenter pendingActionPromises](self, "pendingActionPromises");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addBinaryPromise:", v21);

  v23 = v27;
  v24 = v21;

  return v24;
}

void __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_2;
  v6[3] = &unk_1E7560410;
  v5 = *(_QWORD *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  objc_msgSend(a2, "performActionOfOffer:withActivity:inContext:withReplyHandler:", v3, v4, v5, v6);

}

void __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1BCB7B000, v4, OS_LOG_TYPE_INFO, "Performed action", v6, 2u);
  }

  v5 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v5, "finishWithError:", v3);
  else
    objc_msgSend(v5, "finishWithSuccess");

}

void __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_34_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v3);
}

- (id)performFallbackActionForOffer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v12[16];

  v4 = a3;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "Performing fallback action", v12, 2u);
  }

  objc_msgSend(v4, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "flags");

  +[ASCLockupProductDetails URLForLockupID:ofKind:withOfferFlags:](ASCLockupProductDetails, "URLForLockupID:ofKind:withOfferFlags:", v6, CFSTR("app"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASCAppOfferStateCenter workspace](self, "workspace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openURL:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)performActionOfOffer:(id)a3 withActivity:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    -[ASCAppOfferStateCenter performActionOfOffer:withActivity:inContext:usingService:](self, "performActionOfOffer:withActivity:inContext:usingService:", v10, v8, v9, v11);
  else
    -[ASCAppOfferStateCenter performFallbackActionForOffer:](self, "performFallbackActionForOffer:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)viewAppForAppDistributionOffer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[16];

  v4 = a3;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7B000, v5, OS_LOG_TYPE_INFO, "Viewing app for app distribution offer", buf, 2u);
  }

  -[ASCAppOfferStateCenter service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke;
  v9[3] = &unk_1E75604C0;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v6, "addSuccessBlock:", v9);

  -[ASCAppOfferStateCenter service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addErrorBlock:", &__block_literal_global_36);

}

uint64_t __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "viewAppForAppDistributionOffer:", *(_QWORD *)(a1 + 32));
}

void __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke_2_cold_1();

}

- (id)reinstallWatchAppWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[ASCAppOfferStateCenter connectToService](self, "connectToService");
  -[ASCAppOfferStateCenter service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke;
  v18[3] = &unk_1E7560448;
  v19 = v4;
  v9 = v7;
  v20 = v9;
  v10 = v4;
  objc_msgSend(v6, "addSuccessBlock:", v18);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke_3;
  v16[3] = &unk_1E7560410;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v6, "addErrorBlock:", v16);
  -[ASCAppOfferStateCenter pendingActionPromises](self, "pendingActionPromises");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addBinaryPromise:", v11);

  v13 = v17;
  v14 = v11;

  return v14;
}

void __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke_2;
  v4[3] = &unk_1E7560410;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "reinstallWatchAppWithID:withReplyHandler:", v3, v4);

}

uint64_t __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithSuccess");
}

uint64_t __50__ASCAppOfferStateCenter_reinstallWatchAppWithID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (id)reinstallWatchSystemAppWithBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    -[ASCAppOfferStateCenter connectToService](self, "connectToService");
  -[ASCAppOfferStateCenter service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0CFDBA8]);
  v8 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke;
  v18[3] = &unk_1E7560448;
  v19 = v4;
  v9 = v7;
  v20 = v9;
  v10 = v4;
  objc_msgSend(v6, "addSuccessBlock:", v18);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke_3;
  v16[3] = &unk_1E7560410;
  v11 = v9;
  v17 = v11;
  objc_msgSend(v6, "addErrorBlock:", v16);
  -[ASCAppOfferStateCenter pendingActionPromises](self, "pendingActionPromises");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addBinaryPromise:", v11);

  v13 = v17;
  v14 = v11;

  return v14;
}

void __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke_2;
  v4[3] = &unk_1E7560410;
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(a2, "reinstallWatchSystemAppWithBundleID:withReplyHandler:", v3, v4);

}

uint64_t __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)(a1 + 32);
  if (a2)
    return objc_msgSend(v2, "finishWithError:", a2);
  else
    return objc_msgSend(v2, "finishWithSuccess");
}

uint64_t __62__ASCAppOfferStateCenter_reinstallWatchSystemAppWithBundleID___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithError:", a2);
}

- (void)offer:(id)a3 didChangeState:(id)a4 withMetadata:(id)a5 flags:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter stateMachines](self, "stateMachines");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "offerStateDidChange:withMetadata:flags:", v11, v12, a6);
  }
  else
  {
    +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v10, "id");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543362;
      v18 = v16;
      _os_log_impl(&dword_1BCB7B000, v15, OS_LOG_TYPE_INFO, "No state machine for to notify for change to %{public}@", (uint8_t *)&v17, 0xCu);

    }
  }

}

- (void)offer:(id)a3 didChangeStatusText:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[ASCAppOfferStateCenter stateMachines](self, "stateMachines");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "offerStatusTextDidChange:", v7);
  }
  else
  {
    +[ASCAppOfferStateCenter log](ASCAppOfferStateCenter, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "id");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_1BCB7B000, v10, OS_LOG_TYPE_INFO, "No state machine for to notify for change to %{public}@", (uint8_t *)&v12, 0xCu);

    }
  }

}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCAppOfferStateCenter connection](self, "connection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v4, CFSTR("connection"));

  -[ASCAppOfferStateCenter stateMachines](self, "stateMachines");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v5, CFSTR("stateMachines"));

  -[ASCAppOfferStateCenter service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addSensitiveObject:withName:](v3, "addSensitiveObject:withName:", v6, CFSTR("service"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (ASCServices)connection
{
  return self->_connection;
}

- (ASCWorkspace)workspace
{
  return self->_workspace;
}

- (NSMapTable)stateMachines
{
  return self->_stateMachines;
}

- (ASCJitterBackoff)reconnectBackoff
{
  return self->_reconnectBackoff;
}

- (ASCPendingPromises)pendingActionPromises
{
  return self->_pendingActionPromises;
}

- (AMSPromise)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_pendingActionPromises, 0);
  objc_storeStrong((id *)&self->_reconnectBackoff, 0);
  objc_storeStrong((id *)&self->_stateMachines, 0);
  objc_storeStrong((id *)&self->_workspace, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

void __42__ASCAppOfferStateCenter_connectToService__block_invoke_19_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "arrayByApplyingSelector:", sel_id);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BCB7B000, v2, v3, "Could not resume observing %{public}@, reason: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __38__ASCAppOfferStateCenter_tryReconnect__block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  AMSLogableError();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1BCB7B000, v1, v2, "Connection test failed, reason: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4();
}

void __47__ASCAppOfferStateCenter_stateMachineForOffer___block_invoke_31_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "id");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BCB7B000, v2, v3, "Could not start observing %{public}@, reason: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __53__ASCAppOfferStateCenter_stopObservingStateForOffer___block_invoke_32_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "id");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_1BCB7B000, v2, v3, "Could not stop observing %{public}@, reason: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __83__ASCAppOfferStateCenter_performActionOfOffer_withActivity_inContext_usingService___block_invoke_34_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  AMSLogableError();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1BCB7B000, v1, v2, "Could not perform action, reason: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4();
}

void __57__ASCAppOfferStateCenter_viewAppForAppDistributionOffer___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  AMSLogableError();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1BCB7B000, v1, v2, "Could not view app, reason: %{public}@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_4();
}

@end
