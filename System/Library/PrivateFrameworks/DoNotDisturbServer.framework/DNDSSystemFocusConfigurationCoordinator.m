@implementation DNDSSystemFocusConfigurationCoordinator

- (DNDSSystemFocusConfigurationCoordinator)initWithAppConfigurationManager:(id)a3
{
  id v5;
  DNDSSystemFocusConfigurationCoordinator *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  NSMapTable *clientToModeIdentifier;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DNDSSystemFocusConfigurationCoordinator;
  v6 = -[DNDSSystemFocusConfigurationCoordinator init](&v13, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.donotdisturb.private.system-actions", v7);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    clientToModeIdentifier = v6->_clientToModeIdentifier;
    v6->_clientToModeIdentifier = (NSMapTable *)v10;

    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);
    objc_msgSend(v5, "addDelegate:", v6);
  }

  return v6;
}

- (void)handleStateUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *workQueue;
  int v22;
  _QWORD block[4];
  id v24;
  DNDSSystemFocusConfigurationCoordinator *v25;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "previousState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeModeConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "state");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeModeConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "modeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modeIdentifier");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v11 == (void *)v12)
  {

    goto LABEL_7;
  }
  v13 = (void *)v12;
  objc_msgSend(v7, "modeIdentifier");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
LABEL_10:

LABEL_11:
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__DNDSSystemFocusConfigurationCoordinator_handleStateUpdate___block_invoke;
    block[3] = &unk_1E86A59E8;
    v24 = v4;
    v25 = self;
    dispatch_async(workQueue, block);

    goto LABEL_12;
  }
  v15 = (void *)v14;
  objc_msgSend(v10, "modeIdentifier");
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {

    goto LABEL_10;
  }
  v17 = (void *)v16;
  objc_msgSend(v7, "modeIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "modeIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v18, "isEqual:", v19);

  if (!v22)
    goto LABEL_11;
LABEL_7:
  v20 = DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring request to coordinate system configurations; from and to mode are the same.",
      buf,
      2u);
  }
LABEL_12:

}

void __61__DNDSSystemFocusConfigurationCoordinator_handleStateUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint8_t v40[128];
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v2 = (void *)DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "state");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeModeIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "previousState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeModeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_currentModeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v42 = v6;
    v43 = 2114;
    v44 = v8;
    v45 = 2114;
    v46 = v9;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Handling state update: %{public}@; previous: %{public}@ (%{public}@)",
      buf,
      0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeModeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "systemActionsForModeIdentifier:error:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bs_filter:", &__block_literal_global_12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "previousState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activeModeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "systemActionsForModeIdentifier:error:", v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v36 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          if (objc_msgSend(v21, "isEnabled"))
          {
            v22 = *(void **)(a1 + 40);
            objc_msgSend(v21, "reverseAction");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "_executeAction:", v23);

          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
      }
      while (v18);
    }

  }
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v24 = v13;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v32 != v27)
          objc_enumerationMutation(v24);
        v29 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "action", (_QWORD)v31);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_executeAction:", v30);

      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v26);
  }

}

uint64_t __61__DNDSSystemFocusConfigurationCoordinator_handleStateUpdate___block_invoke_32(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

- (void)_executeAction:(id)a3
{
  id v4;
  void *v5;
  NSMapTable *clientToModeIdentifier;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7C78]), "initWithContextualAction:", v4);
    clientToModeIdentifier = self->_clientToModeIdentifier;
    -[DNDSSystemFocusConfigurationCoordinator _currentModeIdentifier](self, "_currentModeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](clientToModeIdentifier, "setObject:forKey:", v7, v5);

    objc_msgSend(v5, "setDelegate:", self);
    v8 = DNDSLogSystemFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218242;
      v10 = v5;
      v11 = 2114;
      v12 = v4;
      _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Running system action: runner=%p; action=%{public}@",
        (uint8_t *)&v9,
        0x16u);
    }
    objc_msgSend(v5, "start");

  }
}

- (void)appConfigurationManager:(id)a3 didClearSystemAction:(id)a4 modeIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *workQueue;
  _QWORD block[4];
  id v13;
  id v14;
  DNDSSystemFocusConfigurationCoordinator *v15;

  v7 = a4;
  v8 = a5;
  -[DNDSSystemFocusConfigurationCoordinator _currentModeIdentifier](self, "_currentModeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqualToString:", v8) & 1) != 0)
  {
    objc_msgSend(v7, "reverseAction");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __103__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didClearSystemAction_modeIdentifier___block_invoke;
      block[3] = &unk_1E86A58D0;
      v13 = v7;
      v14 = v8;
      v15 = self;
      dispatch_async(workQueue, block);

    }
  }
  else
  {

  }
}

void __103__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didClearSystemAction_modeIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v9 = 138543618;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Running reverse action due to action deletion in active mode. identifier=%{public}@; mode=%{public}@",
      (uint8_t *)&v9,
      0x16u);

  }
  v7 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "reverseAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_executeAction:", v8);

}

- (void)appConfigurationManager:(id)a3 didSetSystemAction:(id)a4 modeIdentifier:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  NSObject *workQueue;
  _QWORD block[4];
  id v13;
  id v14;
  DNDSSystemFocusConfigurationCoordinator *v15;

  v7 = a4;
  v8 = a5;
  -[DNDSSystemFocusConfigurationCoordinator _currentModeIdentifier](self, "_currentModeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v8);

  if (v10)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didSetSystemAction_modeIdentifier___block_invoke;
    block[3] = &unk_1E86A58D0;
    v13 = v7;
    v14 = v8;
    v15 = self;
    dispatch_async(workQueue, block);

  }
}

void __101__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didSetSystemAction_modeIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v2;
    if (objc_msgSend(v3, "isEnabled"))
      v5 = &stru_1E86A90B0;
    else
      v5 = CFSTR(" reverse");
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 40);
    v12 = 138543874;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Running%{public}@ action due to action update in active mode. identifier=%{public}@; mode=%{public}@",
      (uint8_t *)&v12,
      0x20u);

  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "isEnabled");
  v9 = *(void **)(a1 + 48);
  v10 = *(void **)(a1 + 32);
  if (v8)
    objc_msgSend(v10, "action");
  else
    objc_msgSend(v10, "reverseAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_executeAction:", v11);

}

- (void)appConfigurationManager:(id)a3 didClearSystemActionsInModeIdentifiers:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *workQueue;
  _QWORD block[4];
  id v10;
  id v11;
  DNDSSystemFocusConfigurationCoordinator *v12;

  v5 = a4;
  -[DNDSSystemFocusConfigurationCoordinator _currentModeIdentifier](self, "_currentModeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    workQueue = self->_workQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __106__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didClearSystemActionsInModeIdentifiers___block_invoke;
    block[3] = &unk_1E86A58D0;
    v10 = v5;
    v11 = v6;
    v12 = self;
    dispatch_async(workQueue, block);

  }
}

void __106__DNDSSystemFocusConfigurationCoordinator_appConfigurationManager_didClearSystemActionsInModeIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = v3;
    objc_msgSend(v2, "valueForKey:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v22 = v4;
    v23 = 2114;
    v24 = v6;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Running reverse actions due to action deletion in active mode. mode=%{public}@; identifiers=%{public}@",
      buf,
      0x16u);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v2;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v12, "reverseAction", (_QWORD)v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = *(void **)(a1 + 48);
          objc_msgSend(v12, "reverseAction");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "_executeAction:", v15);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (void)workflowRunnerClient:(id)a3 didFinishRunningAction:(id)a4 withReverseAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *workQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = DNDSLogSystemFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    v24 = 2114;
    v25 = v10;
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Finished running system action: runner=%p; action=%{public}@; reverse=%{public}@",
      buf,
      0x20u);
  }
  workQueue = self->_workQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__DNDSSystemFocusConfigurationCoordinator_workflowRunnerClient_didFinishRunningAction_withReverseAction___block_invoke;
  v16[3] = &unk_1E86A6AB0;
  v16[4] = self;
  v17 = v8;
  v18 = v10;
  v19 = v9;
  v13 = v9;
  v14 = v10;
  v15 = v8;
  dispatch_sync(workQueue, v16);

}

void __105__DNDSSystemFocusConfigurationCoordinator_workflowRunnerClient_didFinishRunningAction_withReverseAction___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    if (*(_QWORD *)(a1 + 48)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
      && (objc_msgSend(*(id *)(a1 + 32), "_currentModeIdentifier"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          v4 = objc_msgSend(v2, "isEqualToString:", v3),
          v3,
          v4))
    {
      v5 = *(id *)(a1 + 48);
    }
    else
    {
      v5 = 0;
    }
    v6 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
    objc_msgSend(*(id *)(a1 + 56), "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v6, "updateSystemActionWithReverseAction:actionIdentifier:modeIdentifier:", v5, v7, v2);

  }
  else
  {
    v9 = (void *)DNDSLogSystemFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_ERROR))
      __105__DNDSSystemFocusConfigurationCoordinator_workflowRunnerClient_didFinishRunningAction_withReverseAction___block_invoke_cold_1(a1, v9);
  }

}

- (id)_currentModeIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[DNDSSystemFocusConfigurationCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentStateForSystemFocusConfigurationCoordinator:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeModeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (DNDSSystemFocusConfigurationCoordinatorDelegate)delegate
{
  return (DNDSSystemFocusConfigurationCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_clientToModeIdentifier, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

void __105__DNDSSystemFocusConfigurationCoordinator_workflowRunnerClient_didFinishRunningAction_withReverseAction___block_invoke_cold_1(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(void **)(a1 + 56);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = 138543618;
  v8 = v5;
  v9 = 2114;
  v10 = v6;
  _os_log_error_impl(&dword_1CB895000, v4, OS_LOG_TYPE_ERROR, "Lost track of mode associated with action. identifier=%{public}@; action=%{public}@",
    (uint8_t *)&v7,
    0x16u);

}

@end
