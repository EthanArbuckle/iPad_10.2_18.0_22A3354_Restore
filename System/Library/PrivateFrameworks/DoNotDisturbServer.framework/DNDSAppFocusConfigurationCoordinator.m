@implementation DNDSAppFocusConfigurationCoordinator

- (DNDSAppFocusConfigurationCoordinator)initWithAppConfigurationManager:(id)a3 keybagProviding:(id)a4 xpcEventPublisher:(id)a5
{
  id v9;
  id v10;
  id v11;
  DNDSAppFocusConfigurationCoordinator *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *workQueue;
  uint64_t v16;
  NSMutableDictionary *queuedTasksByBundleIdentifier;
  uint64_t v18;
  NSMutableDictionary *taskGroups;
  uint64_t v20;
  NSMutableDictionary *groupDetails;
  objc_super v23;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)DNDSAppFocusConfigurationCoordinator;
  v12 = -[DNDSAppFocusConfigurationCoordinator init](&v23, sel_init);
  if (v12)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.donotdisturb.private.app-focus-filter.queue", v13);
    workQueue = v12->_workQueue;
    v12->_workQueue = (OS_dispatch_queue *)v14;

    objc_storeStrong((id *)&v12->_appConfigurationManager, a3);
    objc_msgSend(v9, "addDelegate:", v12);
    objc_storeStrong((id *)&v12->_xpcEventPublisher, a5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    queuedTasksByBundleIdentifier = v12->_queuedTasksByBundleIdentifier;
    v12->_queuedTasksByBundleIdentifier = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    taskGroups = v12->_taskGroups;
    v12->_taskGroups = (NSMutableDictionary *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    groupDetails = v12->_groupDetails;
    v12->_groupDetails = (NSMutableDictionary *)v20;

    -[DNDSAppFocusConfigurationCoordinator _xpcCheckIn](v12, "_xpcCheckIn");
    objc_storeStrong((id *)&v12->_keybag, a4);
  }

  return v12;
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
  NSObject *v21;
  NSObject *workQueue;
  int v23;
  _QWORD block[4];
  id v25;
  DNDSAppFocusConfigurationCoordinator *v26;
  uint8_t buf[16];

  v4 = a3;
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) != 0)
  {
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
    if (v11 != (void *)v12)
    {
      v13 = (void *)v12;
      objc_msgSend(v7, "modeIdentifier");
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(v10, "modeIdentifier");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v7, "modeIdentifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "modeIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v18, "isEqual:", v19);

          if (!v23)
            goto LABEL_14;
LABEL_10:
          v21 = DNDSLogAppFocusConfiguration;
          if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1CB895000, v21, OS_LOG_TYPE_DEFAULT, "Ignoring request to coordinate app configurations; from and to mode are the same.",
              buf,
              2u);
          }
          goto LABEL_15;
        }

      }
LABEL_14:
      workQueue = self->_workQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke;
      block[3] = &unk_1E86A59E8;
      v25 = v4;
      v26 = self;
      dispatch_async(workQueue, block);

LABEL_15:
      goto LABEL_16;
    }

    goto LABEL_10;
  }
  v20 = DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Ignoring request to coordinate app configurations; device has not unlocked since boot.",
      buf,
      2u);
  }
LABEL_16:

}

void __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke(uint64_t a1)
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
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  id obj;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v2 = (void *)DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
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
    *(_DWORD *)buf = 138543618;
    v78 = v6;
    v79 = 2114;
    v80 = v8;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Handling state update: %{public}@; previous: %{public}@",
      buf,
      0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "state");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeModeIdentifier");
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_groupIdentifierForStateUpdate:", *(_QWORD *)(a1 + 32));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = objc_alloc_init(MEMORY[0x1E0D44200]);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeModeIdentifier");
  v11 = objc_claimAutoreleasedReturnValue();

  v48 = (void *)v11;
  if (v11)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "appActionsForModeIdentifier:error:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v73 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v71 != v17)
            objc_enumerationMutation(v14);
          v19 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "bs_filter:", &__block_literal_global_24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v21, v19);

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      }
      while (v16);
    }

    v22 = (void *)objc_msgSend(v13, "copy");
  }
  else
  {
    v22 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "previousState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activeModeIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v47 = v24;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "appActionsForModeIdentifier:error:", v24, 0);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v25 = (id)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v67;
      v50 = v25;
      v51 = v22;
      v49 = *(_QWORD *)v67;
      do
      {
        v29 = 0;
        v52 = v27;
        do
        {
          if (*(_QWORD *)v67 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v29);
          v31 = (void *)MEMORY[0x1D17A0B90]();
          objc_msgSend(v22, "objectForKeyedSubscript:", v30);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v32)
          {
            v53 = v29;
            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            objc_msgSend(v25, "objectForKeyedSubscript:", v30);
            obj = (id)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
            if (v33)
            {
              v34 = v33;
              v35 = *(_QWORD *)v63;
              do
              {
                for (j = 0; j != v34; ++j)
                {
                  if (*(_QWORD *)v63 != v35)
                    objc_enumerationMutation(obj);
                  v37 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
                  if (objc_msgSend(v37, "isEnabled"))
                  {
                    objc_msgSend(*(id *)(a1 + 40), "_incrementTasksExecutedForGroupWithIdentifier:", v54);
                    v38 = *(void **)(a1 + 40);
                    objc_msgSend(v37, "action");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v30, "bundleID");
                    v40 = v30;
                    v41 = a1;
                    v42 = v31;
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v38, "_executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadataProvider:", v39, 0, v43, v56, v54, 1, v55);

                    v31 = v42;
                    a1 = v41;
                    v30 = v40;

                  }
                }
                v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
              }
              while (v34);
            }

            v25 = v50;
            v22 = v51;
            v28 = v49;
            v27 = v52;
            v29 = v53;
          }
          objc_autoreleasePoolPop(v31);
          ++v29;
        }
        while (v29 != v27);
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      }
      while (v27);
    }

    v24 = v47;
  }
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke_2;
  v58[3] = &unk_1E86A7948;
  v58[4] = *(_QWORD *)(a1 + 40);
  v59 = v54;
  v60 = v56;
  v61 = v55;
  v44 = v55;
  v45 = v56;
  v46 = v54;
  objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v58);

}

uint64_t __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

void __58__DNDSAppFocusConfigurationCoordinator_handleStateUpdate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17A0B90]();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_msgSend(*(id *)(a1 + 32), "_incrementTasksExecutedForGroupWithIdentifier:", *(_QWORD *)(a1 + 40));
        v14 = *(void **)(a1 + 32);
        objc_msgSend(v13, "action");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadataProvider:", v15, 0, v16, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 56));

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v7);
}

- (void)appConfigurationManager:(id)a3 didClearActionWithIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *workQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  workQueue = self->_workQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __133__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didClearActionWithIdentifier_forApplicationIdentifier_modeIdentifier___block_invoke;
  v16[3] = &unk_1E86A6AB0;
  v16[4] = self;
  v17 = v11;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(workQueue, v16);

}

void __133__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didClearActionWithIdentifier_forApplicationIdentifier_modeIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_currentModeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = (void *)DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v5 = *(void **)(a1 + 56);
      v7 = v4;
      objc_msgSend(v5, "bundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v16 = v6;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Running default action due to action deletion in active mode. identifier=%@; bundle=%@; mode=%@",
        buf,
        0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0D44200]);
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 56), "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadataProvider:", 0, v13, v14, *(_QWORD *)(a1 + 40), v10, 1, v11);

  }
}

- (void)appConfigurationManager:(id)a3 didSetAction:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *workQueue;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  workQueue = self->_workQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __117__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didSetAction_forApplicationIdentifier_modeIdentifier___block_invoke;
  v16[3] = &unk_1E86A6AB0;
  v16[4] = self;
  v17 = v11;
  v18 = v9;
  v19 = v10;
  v13 = v10;
  v14 = v9;
  v15 = v11;
  dispatch_async(workQueue, v16);

}

void __117__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didSetAction_forApplicationIdentifier_modeIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_currentModeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    v4 = objc_msgSend(*(id *)(a1 + 48), "isEnabled") ^ 1;
    v5 = (void *)DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(void **)(a1 + 48);
      v7 = v5;
      objc_msgSend(v6, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "bundleID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Running action due to action update in active mode. identifier=%@; bundle=%@; mode=%@",
        buf,
        0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0D44200]);
    v13 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 48), "action");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 56), "bundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadataProvider:", v14, 0, v15, *(_QWORD *)(a1 + 40), v11, v4, v12);

  }
}

- (void)appConfigurationManager:(id)a3 didClearActionsForAppsInModeIdentifiers:(id)a4
{
  id v5;
  NSObject *workQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  workQueue = self->_workQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __104__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didClearActionsForAppsInModeIdentifiers___block_invoke;
  v8[3] = &unk_1E86A59E8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(workQueue, v8);

}

void __104__DNDSAppFocusConfigurationCoordinator_appConfigurationManager_didClearActionsForAppsInModeIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *context;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_currentModeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v2;
      v49 = 2112;
      v50 = v4;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Running default actions due to deletion of active mode. mode=%@; apps=%@",
        buf,
        0x16u);
    }
    v29 = objc_alloc_init(MEMORY[0x1E0D44200]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = v4;
    v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v30)
    {
      v28 = *(_QWORD *)v42;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v42 != v28)
            objc_enumerationMutation(obj);
          v34 = v6;
          v7 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v6);
          context = (void *)MEMORY[0x1D17A0B90]();
          objc_msgSend(v7, "bundleID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(MEMORY[0x1E0D44270], "focusConfigurationProtocol");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setWithObject:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          objc_msgSend(v29, "actionsConformingToSystemProtocols:logicalType:bundleIdentifier:error:", v11, 1, v8, &v40);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v40;

          if (v13)
          {
            v14 = DNDSLogAppFocusConfiguration;
            if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v48 = v8;
              v49 = 2114;
              v50 = v13;
              _os_log_error_impl(&dword_1CB895000, v14, OS_LOG_TYPE_ERROR, "Failed to find actions for %{public}@: %{public}@", buf, 0x16u);
            }
          }
          v31 = v13;
          v32 = v12;
          objc_msgSend(v12, "objectForKeyedSubscript:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "allValues");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = 0u;
          v39 = 0u;
          v36 = 0u;
          v37 = 0u;
          v17 = v16;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v19; ++i)
              {
                v22 = v2;
                if (*(_QWORD *)v37 != v20)
                  objc_enumerationMutation(v17);
                v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
                v24 = *(void **)(a1 + 32);
                objc_msgSend(v23, "identifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v23;
                v2 = v22;
                objc_msgSend(v24, "_executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadata:", 0, v25, v8, v22, v35, 1, v26);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
            }
            while (v19);
          }

          objc_autoreleasePoolPop(context);
          v6 = v34 + 1;
        }
        while (v34 + 1 != v30);
        v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v30);
    }

  }
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__DNDSAppFocusConfigurationCoordinator_keybagDidUnlockForTheFirstTime___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(workQueue, block);
}

uint64_t __71__DNDSAppFocusConfigurationCoordinator_keybagDidUnlockForTheFirstTime___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_workQueue_handleFirstLaunch");
}

- (id)_currentModeIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  -[DNDSAppFocusConfigurationCoordinator delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentStateForAppFocusConfigurationCoordinator:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeModeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_executeAction:(id)a3 orActionIdentifier:(id)a4 withBundleIdentifier:(id)a5 modeIdentifier:(id)a6 groupIdentifier:(id)a7 exiting:(BOOL)a8 metadataProvider:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  _BOOL4 v24;
  id v25;

  v24 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  if (v14)
  {
    objc_msgSend(v14, "identifier");
    v20 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v20;
  }
  v25 = 0;
  objc_msgSend(v19, "actionForBundleIdentifier:andActionIdentifier:error:", v16, v15, &v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v25;
  if (v22)
  {
    v23 = (void *)DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
      -[DNDSAppFocusConfigurationCoordinator _executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadataProvider:].cold.1((uint64_t)v16, v23, v22);
  }
  -[DNDSAppFocusConfigurationCoordinator _executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadata:](self, "_executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadata:", v14, v15, v16, v17, v18, v24, v21);

}

- (void)_executeAction:(id)a3 orActionIdentifier:(id)a4 withBundleIdentifier:(id)a5 modeIdentifier:(id)a6 groupIdentifier:(id)a7 exiting:(BOOL)a8 metadata:(id)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  _BOOL4 v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  _BOOL4 v47;
  _QWORD v48[4];
  id v49;
  DNDSAppFocusConfigurationCoordinator *v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  id v59;
  __int16 v60;
  id v61;
  __int16 v62;
  uint64_t v63;
  _BYTE v64[128];
  uint64_t v65;

  v47 = a8;
  v65 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  if (v14)
  {
    objc_msgSend(v14, "identifier");
    v20 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v20;
  }
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D441B8]), "initWithType:bundleIdentifier:", 0, v16);
  v22 = -[DNDSAppFocusConfigurationCoordinator _shouldExecuteActionOnApplicationWithBundleIdentifier:](self, "_shouldExecuteActionOnApplicationWithBundleIdentifier:", v16);
  if (!v19)
  {
    v34 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v59 = v15;
      v60 = 2114;
      v61 = v21;
      v62 = 2114;
      v63 = 0;
      _os_log_impl(&dword_1CB895000, v34, OS_LOG_TYPE_DEFAULT, "Failed to find metadata for action. The app may not be installed. action=%{public}@; bundle=%{public}@; %{public}@",
        buf,
        0x20u);
    }
    goto LABEL_32;
  }
  v23 = v22;
  v45 = v18;
  v46 = v14;
  objc_msgSend(v19, "effectiveBundleIdentifiers");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v23 && objc_msgSend(v24, "containsObject:", v21))
  {
    v26 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v59 = v15;
      v60 = 2114;
      v61 = v21;
      _os_log_impl(&dword_1CB895000, v26, OS_LOG_TYPE_DEFAULT, "Application is running; will use for action %{public}@: %{public}@",
        buf,
        0x16u);
    }
    goto LABEL_26;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v27 = v25;
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
  if (v28)
  {
    v29 = v28;
    v43 = v17;
    v44 = v16;
    v30 = *(_QWORD *)v55;
LABEL_10:
    v31 = 0;
    while (1)
    {
      if (*(_QWORD *)v55 != v30)
        objc_enumerationMutation(v27);
      v32 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v31);
      if ((objc_msgSend(v32, "isEqual:", v21, v43, v44) & 1) == 0 && objc_msgSend(v32, "type") == 1)
        break;
      if (v29 == ++v31)
      {
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v54, v64, 16);
        if (v29)
          goto LABEL_10;
        v33 = v21;
        goto LABEL_23;
      }
    }
    v33 = (id)objc_msgSend(v32, "copy");

    v35 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v59 = v15;
      v60 = 2114;
      v61 = v33;
      _os_log_impl(&dword_1CB895000, v35, OS_LOG_TYPE_DEFAULT, "Found extension for action %{public}@: %{public}@", buf, 0x16u);
      v17 = v43;
      v16 = v44;
      goto LABEL_24;
    }
LABEL_23:
    v17 = v43;
    v16 = v44;
  }
  else
  {
    v33 = v21;
  }
LABEL_24:

  if (objc_msgSend(v33, "type") == 1)
  {
    v21 = v33;
LABEL_26:

    if (v47)
    {
      v36 = objc_alloc(MEMORY[0x1E0D441F0]);
      objc_msgSend(v21, "bundleIdentifier");
      v37 = v17;
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = (void *)objc_msgSend(v36, "initWithActionIdentifier:bundleIdentifier:", v15, v38);

      v17 = v37;
      v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D440E8]), "initWithActionIdentifier:actionMetadata:", v39, v19);
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke;
      v48[3] = &unk_1E86A7970;
      v33 = v21;
      v49 = v33;
      v50 = self;
      v51 = v37;
      v52 = v45;
      v53 = v15;
      objc_msgSend(v40, "loadDefaultValuesWithCompletionHandler:", v48);

      v18 = v45;
      v14 = v46;
      goto LABEL_33;
    }
    objc_msgSend(v21, "bundleIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v45;
    v14 = v46;
    -[DNDSAppFocusConfigurationCoordinator _executeAction:withBundleIdentifier:modeIdentifier:groupIdentifier:](self, "_executeAction:withBundleIdentifier:modeIdentifier:groupIdentifier:", v46, v42, v17, v45);

LABEL_32:
    v33 = v21;
    goto LABEL_33;
  }
  v41 = DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v59 = v33;
    v60 = 2114;
    v61 = v15;
    _os_log_impl(&dword_1CB895000, v41, OS_LOG_TYPE_DEFAULT, "No extension for action in app; background update unavailable. app=%{public}@; action=%{public}@",
      buf,
      0x16u);
  }

  v18 = v45;
  v14 = v46;
LABEL_33:

}

void __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = DNDSLogAppFocusConfiguration;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 32);
      v9 = v7;
      objc_msgSend(v8, "bundleIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v19 = v10;
      v20 = 2114;
      v21 = v5;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Found default action for %{public}@. action=%{public}@", buf, 0x16u);

    }
    v11 = *(_QWORD *)(a1 + 40);
    v12 = *(NSObject **)(v11 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke_17;
    block[3] = &unk_1E86A7130;
    block[4] = v11;
    v14 = v5;
    v15 = *(id *)(a1 + 32);
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    dispatch_async(v12, block);

  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
  {
    __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke_cold_1(a1, (uint64_t)v6, v7);
  }

}

void __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke_17(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "bundleIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_executeAction:withBundleIdentifier:modeIdentifier:groupIdentifier:", v3, v4, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

}

- (void)_executeAction:(id)a3 withBundleIdentifier:(id)a4 modeIdentifier:(id)a5 groupIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DNDSAppFocusConfigurationTask *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = -[DNDSAppFocusConfigurationTask initWithAction:bundleIdentifier:]([DNDSAppFocusConfigurationTask alloc], "initWithAction:bundleIdentifier:", v10, v11);
  -[DNDSAppFocusConfigurationTask taskIdentifier](v14, "taskIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)DNDSLogAppFocusConfiguration;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v17 = v16;
      -[DNDSAppFocusConfigurationTask taskIdentifier](v14, "taskIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v18;
      v28 = 2114;
      v29 = v13;
      _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Added action execution task=%{public}@ for group=%{public}@", buf, 0x16u);

    }
    -[DNDSAppFocusConfigurationCoordinator _addTask:toGroupWithIdentifier:](self, "_addTask:toGroupWithIdentifier:", v14, v13);
    objc_initWeak((id *)buf, self);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __107__DNDSAppFocusConfigurationCoordinator__executeAction_withBundleIdentifier_modeIdentifier_groupIdentifier___block_invoke;
    v21[3] = &unk_1E86A79C0;
    objc_copyWeak(&v25, (id *)buf);
    v22 = v11;
    v23 = v12;
    v24 = v13;
    -[DNDSAppFocusConfigurationCoordinator _executeOrQueueTask:completion:](self, "_executeOrQueueTask:completion:", v14, v21);

    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
  {
    v19 = v16;
    objc_msgSend(v10, "identifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544130;
    v27 = v20;
    v28 = 2114;
    v29 = v11;
    v30 = 2114;
    v31 = v12;
    v32 = 2114;
    v33 = v13;
    _os_log_error_impl(&dword_1CB895000, v19, OS_LOG_TYPE_ERROR, "Unable to add action execution task; actionIdentifier=%{public}@ bundleIdentifier=%{public}@ modeIdentifier=%{publ"
      "ic}@ group=%{public}@",
      buf,
      0x2Au);

  }
}

void __107__DNDSAppFocusConfigurationCoordinator__executeAction_withBundleIdentifier_modeIdentifier_groupIdentifier___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  v8 = WeakRetained[1];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __107__DNDSAppFocusConfigurationCoordinator__executeAction_withBundleIdentifier_modeIdentifier_groupIdentifier___block_invoke_2;
  v11[3] = &unk_1E86A7998;
  objc_copyWeak(&v17, a1 + 7);
  v12 = a1[4];
  v13 = a1[5];
  v14 = v6;
  v15 = v5;
  v16 = a1[6];
  v9 = v5;
  v10 = v6;
  dispatch_async(v8, v11);

  objc_destroyWeak(&v17);
}

void __107__DNDSAppFocusConfigurationCoordinator__executeAction_withBundleIdentifier_modeIdentifier_groupIdentifier___block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  xpc_object_t v5;
  const char *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  char v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  id v30;
  id v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  _DNDSPrimaryBundleIdentifier(*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _DNDSContainingBundleIdentifier(*(void **)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = (const char *)*MEMORY[0x1E0D1D3E8];
  v7 = objc_retainAutorelease(v4);
  xpc_dictionary_set_string(v5, v6, (const char *)objc_msgSend(v7, "UTF8String"));
  objc_msgSend(WeakRetained[6], "broadcastEvent:", v5);
  if (*(_QWORD *)(a1 + 40))
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:", v3);
    objc_msgSend(*(id *)(a1 + 48), "actionAppContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 48), "action");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = DNDSLogAppFocusConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        v14 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138544130;
        v38 = v10;
        v39 = 2114;
        v40 = v8;
        v41 = 2114;
        v42 = v12;
        v43 = 2114;
        v44 = v14;
        _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Retrieved App Context %{public}@ for bundleIdentifier=%{public}@ actionIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
      }
      v33 = v10;
      v34 = v3;
      objc_msgSend(v10, "notificationFilterPredicate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v7;
      if (v15)
      {
        v35 = 0;
        v36 = 0;
        v30 = objc_alloc_init(MEMORY[0x1E0D1D730]);
        v16 = objc_msgSend(v30, "validatePredicate:compileTimeIssues:runTimeIssues:", v15, &v36, &v35);
        v17 = v36;
        v31 = v35;
        if ((v16 & 1) != 0)
        {
          v18 = v17;
        }
        else
        {
          v19 = DNDSLogAppFocusConfiguration;
          if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
          {
            v28 = v31;
            if (v17)
              v28 = v17;
            v29 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 138544130;
            v38 = v28;
            v39 = 2114;
            v40 = v8;
            v41 = 2114;
            v42 = v12;
            v43 = 2114;
            v44 = v29;
            _os_log_error_impl(&dword_1CB895000, v19, OS_LOG_TYPE_ERROR, "Notification filter predicate from App Context did not validate, issues=%{public}@ bundleIdentifier=%{public}@ actionIdentifier=%{public}@ modeIdentifier=%{public}@", buf, 0x2Au);
          }
          v18 = v17;

          v15 = 0;
        }
        v10 = v33;

      }
      v20 = (id)objc_msgSend(WeakRetained[5], "setPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:", v15, v12, v8, *(_QWORD *)(a1 + 40));
      v21 = WeakRetained[5];
      objc_msgSend(v10, "targetContentIdentifierPrefix");
      v22 = v10;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (id)objc_msgSend(v21, "setTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:", v23, v12, v8, *(_QWORD *)(a1 + 40));

      v3 = v34;
      v7 = v32;
    }

  }
  if (objc_msgSend(WeakRetained, "_removeTask:fromGroupWithIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64)))
  {
    v25 = DNDSLogAppFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
    {
      v26 = *(void **)(a1 + 64);
      *(_DWORD *)buf = 138543362;
      v38 = v26;
      _os_log_impl(&dword_1CB895000, v25, OS_LOG_TYPE_DEFAULT, "Completed action execution(s) for group=%{public}@", buf, 0xCu);
    }
    objc_msgSend(WeakRetained, "_groupWithIdentifierCompleted:", *(_QWORD *)(a1 + 64));
    objc_msgSend(WeakRetained, "delegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "appFocusConfigurationCoordinator:didUpdateAppConfigurationContextForModeIdentifier:", WeakRetained, *(_QWORD *)(a1 + 40));

  }
  objc_msgSend(WeakRetained, "_executeQueuedTaskFollowingTask:", *(_QWORD *)(a1 + 56));

}

- (void)_executeOrQueueTask:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  _DNDSPrimaryBundleIdentifier(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_queuedTasksByBundleIdentifier, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "prepareWithCompletion:", v7);
  objc_msgSend(v11, "addObject:", v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queuedTasksByBundleIdentifier, "setObject:forKeyedSubscript:", v11, v9);
  v12 = (void *)DNDSLogAppFocusConfigurationTask;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    objc_msgSend(v6, "taskIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138543874;
    v19 = v14;
    v20 = 2114;
    v21 = v9;
    v22 = 2048;
    v23 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, "Queued task=%{public}@ for bundleIdentifier=%{public}@ queuedTasks=%lu", (uint8_t *)&v18, 0x20u);

  }
  if (objc_msgSend(v11, "count") == 1)
  {
    v15 = (void *)DNDSLogAppFocusConfigurationTask;
    if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      objc_msgSend(v6, "taskIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Immediately executing task=%{public}@", (uint8_t *)&v18, 0xCu);

    }
    objc_msgSend(v6, "execute");
  }

}

- (void)_executeQueuedTaskFollowingTask:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _DNDSPrimaryBundleIdentifier(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_queuedTasksByBundleIdentifier, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v8 && objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_11;
    objc_msgSend(v4, "taskIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject taskIdentifier](v9, "taskIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      objc_msgSend(v8, "removeObject:", v9);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_queuedTasksByBundleIdentifier, "setObject:forKeyedSubscript:", v8, v6);
      v13 = (void *)DNDSLogAppFocusConfigurationTask;
      if (!os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      v14 = v13;
      objc_msgSend(v4, "taskIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v15;
      v28 = 2114;
      v29 = v6;
      v30 = 2048;
      v31 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Removed completed task=%{public}@ for bundleIdentifier=%{public}@ queuedTasks=%lu", (uint8_t *)&v26, 0x20u);
    }
    else
    {
      v18 = (void *)DNDSLogAppFocusConfigurationTask;
      if (!os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_ERROR))
      {
LABEL_11:
        objc_msgSend(v8, "firstObject");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (void *)DNDSLogAppFocusConfigurationTask;
        v20 = os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v20)
          {
            v21 = v19;
            objc_msgSend(v4, "taskIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject taskIdentifier](v9, "taskIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = 138543618;
            v27 = v22;
            v28 = 2114;
            v29 = v23;
            _os_log_impl(&dword_1CB895000, v21, OS_LOG_TYPE_DEFAULT, "Executing task=%{public}@ queued behind task=%{public}@", (uint8_t *)&v26, 0x16u);

          }
          objc_msgSend(v17, "execute");
        }
        else if (v20)
        {
          v24 = v19;
          -[NSObject taskIdentifier](v9, "taskIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = 138543618;
          v27 = v6;
          v28 = 2114;
          v29 = v25;
          _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, "Task queue for bundleIdentifier=%{public}@ empty following completion of task=%{public}@", (uint8_t *)&v26, 0x16u);

        }
        goto LABEL_17;
      }
      v14 = v18;
      objc_msgSend(v4, "taskIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543874;
      v27 = v15;
      v28 = 2114;
      v29 = v6;
      v30 = 2048;
      v31 = objc_msgSend(v8, "count");
      _os_log_error_impl(&dword_1CB895000, v14, OS_LOG_TYPE_ERROR, "Completed task=%{public}@ for bundleIdentifier=%{public}@ was not the tracked 'current' task queuedTasks=%lu", (uint8_t *)&v26, 0x20u);
    }

    goto LABEL_11;
  }
  v16 = (void *)DNDSLogAppFocusConfigurationTask;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfigurationTask, OS_LOG_TYPE_ERROR))
  {
    v9 = v16;
    objc_msgSend(v4, "taskIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 138543874;
    v27 = v17;
    v28 = 2114;
    v29 = v6;
    v30 = 2048;
    v31 = objc_msgSend(v8, "count");
    _os_log_error_impl(&dword_1CB895000, v9, OS_LOG_TYPE_ERROR, "Completed task=%{public}@ for bundleIdentifier=%{public}@ was not the tracked queuedTasks=%lu", (uint8_t *)&v26, 0x20u);
LABEL_17:

  }
}

- (id)_groupIdentifierForStateUpdate:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3A28];
  v5 = a3;
  objc_msgSend(v4, "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = CFSTR("stateUpdate");
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](self->_groupDetails, "setObject:forKey:", v7, v6);

  return v6;
}

- (void)_incrementTasksExecutedForGroupWithIdentifier:(id)a3
{
  NSMutableDictionary *groupDetails;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  id v13;

  groupDetails = self->_groupDetails;
  v5 = a3;
  -[NSMutableDictionary objectForKey:](groupDetails, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v13, "objectForKey:", CFSTR("tasksExecuted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "integerValue") + 1;
  else
    v9 = 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKey:", v10, CFSTR("tasksExecuted"));

  v11 = self->_groupDetails;
  v12 = (void *)objc_msgSend(v13, "copy");
  -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", v12, v5);

}

- (void)_groupWithIdentifierCompleted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  _BOOL8 updated;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  int v19;
  _BOOL8 v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_groupDetails, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("stateUpdate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("tasksExecuted"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v6)
  {
    objc_msgSend(v6, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeModeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10
      && (objc_msgSend(v9, "activeModeConfiguration"), (v11 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v12 = v11;
      objc_msgSend(v11, "mode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType(objc_msgSend(v13, "semanticType"));

    }
    else
    {
      v14 = -2;
    }
    updated = DNDSPowerLogFocusUpdateSourceForDNDStateUpdateSource(objc_msgSend(v6, "source"));
    v16 = DNDSPowerLogFocusUpdateReasonForDNDStateUpdateReason(objc_msgSend(v6, "reason"));
    v17 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_INFO))
    {
      v19 = 134218752;
      v20 = updated;
      v21 = 2048;
      v22 = v16;
      v23 = 2048;
      v24 = v14;
      v25 = 2048;
      v26 = v8;
      _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_INFO, "Notifying PowerLog of Focus filter perform event: source=%ld reason=%ld semanticType=%ld extensionsLaunched=%ld", (uint8_t *)&v19, 0x2Au);
    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    DNDSPowerLogFocusFilterPerformEvent(v18, updated, v16, v14, v8);

    -[NSMutableDictionary removeObjectForKey:](self->_groupDetails, "removeObjectForKey:", v4);
  }

}

- (void)_addTask:(id)a3 toGroupWithIdentifier:(id)a4
{
  NSMutableDictionary *taskGroups;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  taskGroups = self->_taskGroups;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](taskGroups, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "addObject:", v10);
  -[NSMutableDictionary setObject:forKey:](self->_taskGroups, "setObject:forKey:", v9, v7);

}

- (BOOL)_removeTask:(id)a3 fromGroupWithIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *taskGroups;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_taskGroups, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v9, "removeObject:", v6);
  v10 = objc_msgSend(v9, "count");
  taskGroups = self->_taskGroups;
  if (v10)
    -[NSMutableDictionary setObject:forKey:](taskGroups, "setObject:forKey:", v9, v7);
  else
    -[NSMutableDictionary removeObjectForKey:](taskGroups, "removeObjectForKey:", v7);
  v12 = objc_msgSend(v9, "count") == 0;

  return v12;
}

- (BOOL)_shouldExecuteActionOnApplicationWithBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  void *v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  const char *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87DC0], "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(MEMORY[0x1E0D87DB8], "statesForPredicate:withDescriptor:error:", v4, v5, &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;
  if (!v7)
  {
    if (!objc_msgSend(v6, "count"))
    {
      v16 = DNDSLogAppFocusConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
        -[DNDSAppFocusConfigurationCoordinator _shouldExecuteActionOnApplicationWithBundleIdentifier:].cold.1((uint64_t)v3, v16, v17, v18, v19, v20, v21, v22);
      goto LABEL_4;
    }
    if (objc_msgSend(v6, "count") != 1)
    {
      if ((unint64_t)objc_msgSend(v6, "count") >= 2)
      {
        v23 = DNDSLogAppFocusConfiguration;
        if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
          -[DNDSAppFocusConfigurationCoordinator _shouldExecuteActionOnApplicationWithBundleIdentifier:].cold.2((uint64_t)v3, v23, v24, v25, v26, v27, v28, v29);
      }
      goto LABEL_4;
    }
    objc_msgSend(v6, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "taskState");
    v13 = DNDSLogAppFocusConfiguration;
    v14 = os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT);
    v9 = v12 == 4;
    if (v9)
    {
      if (v14)
      {
        *(_DWORD *)buf = 138543362;
        v32 = v3;
        v15 = "Found process state running scheduled for application bundle; will use application if available. bundle=%{public}@";
LABEL_19:
        _os_log_impl(&dword_1CB895000, v13, OS_LOG_TYPE_DEFAULT, v15, buf, 0xCu);
      }
    }
    else if (v14)
    {
      *(_DWORD *)buf = 138543362;
      v32 = v3;
      v15 = "Found process state other than running scheduled for application bundle; will use extension if available. bundle=%{public}@";
      goto LABEL_19;
    }

    goto LABEL_5;
  }
  v8 = DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
    -[DNDSAppFocusConfigurationCoordinator _shouldExecuteActionOnApplicationWithBundleIdentifier:].cold.3((uint64_t)v3, (uint64_t)v7, v8);
LABEL_4:
  v9 = 0;
LABEL_5:

  return v9;
}

- (void)_workQueue_handleFirstLaunch
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[5];
  id v47;
  id v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint8_t v64[128];
  uint8_t buf[4];
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  -[DNDSAppFocusConfigurationCoordinator _currentModeIdentifier](self, "_currentModeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = DNDSLogAppFocusConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v66 = v3;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Handling first launch/unlock: current=%{public}@", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc_init(MEMORY[0x1E0D44200]);
  if (v3)
  {
    -[DNDSAppConfigurationManager appActionsForModeIdentifier:error:](self->_appConfigurationManager, "appActionsForModeIdentifier:error:", v3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v6, "mutableCopy");
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v59;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v59 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "bs_filter:", &__block_literal_global_36_0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setObject:forKeyedSubscript:", v14, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v58, v64, 16);
      }
      while (v9);
    }

    v43 = (void *)objc_msgSend(v44, "copy");
  }
  else
  {
    v43 = 0;
  }
  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(MEMORY[0x1E0D44270], "focusConfigurationProtocol");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithObject:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "actionsConformingToSystemProtocols:logicalType:bundleIdentifier:error:", v17, 1, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v19 = v18;
  v45 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
  if (v45)
  {
    v42 = *(_QWORD *)v55;
    v37 = v19;
    do
    {
      for (j = 0; j != v45; ++j)
      {
        if (*(_QWORD *)v55 != v42)
          objc_enumerationMutation(v19);
        v21 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * j);
        objc_msgSend(v19, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:", v21);
        v24 = (void *)MEMORY[0x1D17A0B90]();
        objc_msgSend(v43, "objectForKeyedSubscript:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          v38 = v24;
          v39 = v23;
          v40 = v22;
          v41 = j;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          objc_msgSend(v22, "allValues");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v51;
            do
            {
              for (k = 0; k != v28; ++k)
              {
                if (*(_QWORD *)v51 != v29)
                  objc_enumerationMutation(v26);
                v31 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * k);
                objc_msgSend(v31, "identifier");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                -[DNDSAppFocusConfigurationCoordinator _executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadata:](self, "_executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadata:", 0, v32, v21, v3, v5, 1, v31);

              }
              v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v50, v62, 16);
            }
            while (v28);
          }

          v19 = v37;
          v24 = v38;
          v22 = v40;
          j = v41;
          v23 = v39;
        }
        objc_autoreleasePoolPop(v24);

      }
      v45 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v54, v63, 16);
    }
    while (v45);
  }

  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __68__DNDSAppFocusConfigurationCoordinator__workQueue_handleFirstLaunch__block_invoke_2;
  v46[3] = &unk_1E86A7948;
  v46[4] = self;
  v47 = v3;
  v48 = v5;
  v49 = v36;
  v33 = v36;
  v34 = v5;
  v35 = v3;
  objc_msgSend(v43, "enumerateKeysAndObjectsUsingBlock:", v46);

}

uint64_t __68__DNDSAppFocusConfigurationCoordinator__workQueue_handleFirstLaunch__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEnabled");
}

void __68__DNDSAppFocusConfigurationCoordinator__workQueue_handleFirstLaunch__block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17A0B90]();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = (void *)a1[4];
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "action");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "bundleID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_executeAction:orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadataProvider:", v14, 0, v15, a1[5], a1[6], 0, a1[7]);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v7);
}

- (void)_xpcCheckIn
{
  void *v2;
  _QWORD handler[5];

  v2 = (void *)*MEMORY[0x1E0C80748];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __51__DNDSAppFocusConfigurationCoordinator__xpcCheckIn__block_invoke;
  handler[3] = &unk_1E86A7A08;
  handler[4] = self;
  xpc_activity_register("com.apple.donotdisturbd.app-focus-filters.first-launch", v2, handler);
}

void __51__DNDSAppFocusConfigurationCoordinator__xpcCheckIn__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  NSObject *v4;
  id v5;
  _QWORD block[5];
  id v7;

  v5 = a2;
  if (xpc_activity_get_state((xpc_activity_t)v5) == 2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(NSObject **)(v3 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__DNDSAppFocusConfigurationCoordinator__xpcCheckIn__block_invoke_2;
    block[3] = &unk_1E86A59E8;
    block[4] = v3;
    v7 = v5;
    dispatch_sync(v4, block);

  }
}

uint64_t __51__DNDSAppFocusConfigurationCoordinator__xpcCheckIn__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_workQueue_handleFirstLaunch");
  return xpc_activity_set_completion_status();
}

- (DNDSAppFocusConfigurationCoordinatorDelegate)delegate
{
  return (DNDSAppFocusConfigurationCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_xpcEventPublisher, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_groupDetails, 0);
  objc_storeStrong((id *)&self->_taskGroups, 0);
  objc_storeStrong((id *)&self->_queuedTasksByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

- (void)_executeAction:(void *)a3 orActionIdentifier:withBundleIdentifier:modeIdentifier:groupIdentifier:exiting:metadataProvider:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  OUTLINED_FUNCTION_7(&dword_1CB895000, v5, v7, "Error fetching actionMetadata for bundle %@: %@", (uint8_t *)&v8);

}

void __143__DNDSAppFocusConfigurationCoordinator__executeAction_orActionIdentifier_withBundleIdentifier_modeIdentifier_groupIdentifier_exiting_metadata___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Failed to load default values for action. action=%{public}@; bundle=%{public}@; %{public}@",
    (uint8_t *)&v5,
    0x20u);
}

- (void)_shouldExecuteActionOnApplicationWithBundleIdentifier:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Failed to find process state for application bundle; will use extension if available. bundle=%{public}@",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_1();
}

- (void)_shouldExecuteActionOnApplicationWithBundleIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CB895000, a2, a3, "Found multiple process states for application bundle; will use extension if available. bundle=%{public}@",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_1();
}

- (void)_shouldExecuteActionOnApplicationWithBundleIdentifier:(NSObject *)a3 .cold.3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_7(&dword_1CB895000, a3, (uint64_t)a3, "Failed to determine process state for application bundle; will use extension if available. bundle=%{public}@; %{public}@",
    (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

@end
