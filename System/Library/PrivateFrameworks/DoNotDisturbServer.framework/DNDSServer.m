@implementation DNDSServer

- (BOOL)setUILockState:(unint64_t)a3 error:(id *)a4
{
  -[DNDSServer setLockState:](self, "setLockState:", a3, a4);
  return 1;
}

- (void)setLockState:(unint64_t)a3
{
  self->_lockState = a3;
}

- (id)remoteAppConfigurationServiceProvider:(id)a3 getCurrentAppConfigurationForActionIdentifier:(id)a4 bundleIdentifier:(id)a5 withError:(id *)a6
{
  id v9;
  __CFString *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  DNDSAppConfigurationManager *appConfigurationManager;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  const __CFString *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  __CFString *v31;
  __int16 v32;
  __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = (__CFString *)a5;
  -[DNDSStateProvider lastCalculatedState](self->_stateProvider, "lastCalculatedState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activeModeIdentifier");
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    v16 = 0;
LABEL_11:
    v20 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v10;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "No enabled action for %@ in active mode %@", buf, 0x16u);
    }
    if (a6 && v16)
    {
      v16 = objc_retainAutorelease(v16);
      v17 = 0;
      *a6 = v16;
    }
    else
    {
      if (a6)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v22 = *MEMORY[0x1E0D1D3E0];
        v26 = *MEMORY[0x1E0CB2D50];
        v27 = CFSTR("No current action is available. Supply the caller with the default.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1007, v23);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      v17 = 0;
    }
    goto LABEL_19;
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:", v10);
  appConfigurationManager = self->_appConfigurationManager;
  v25 = 0;
  -[DNDSAppConfigurationManager appActionForActionIdentifier:applicationIdentifier:modeIdentifier:error:](appConfigurationManager, "appActionForActionIdentifier:applicationIdentifier:modeIdentifier:error:", v9, v13, v12, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  v17 = 0;
  if (objc_msgSend(v15, "isEnabled"))
  {
    objc_msgSend(v15, "action");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v19 = CFSTR("Found");
    *(_DWORD *)buf = 138412802;
    if (!v17)
      v19 = CFSTR("No");
    v29 = v19;
    v30 = 2112;
    v31 = v10;
    v32 = 2112;
    v33 = v12;
    _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "%@ action for '%@' in active mode %@", buf, 0x20u);
  }

  if (!v17)
    goto LABEL_11;
LABEL_19:

  return v17;
}

void __58__DNDSServer_remoteServiceProvider_currentStateWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "lastCalculatedState");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)remoteServiceProvider:(id)a3 currentStateWithError:(id *)a4
{
  NSObject *queue;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  v13 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__DNDSServer_remoteServiceProvider_currentStateWithError___block_invoke;
  v7[3] = &unk_1E86A5948;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __18__DNDSServer_init__block_invoke_123(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUILockState:error:", objc_msgSend(*(id *)(a1 + 32), "layoutIsLocked:") ^ 1, 0);
}

- (BOOL)layoutIsLocked:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "elements", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = *MEMORY[0x1E0D22C78];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", v7);

        if ((v10 & 1) != 0)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)triggerManager:(id)a3 performModeAssertionUpdatesWithHandler:(id)a4
{
  return -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", a4, 0);
}

- (id)triggerManager:(id)a3 assertionsWithClientIdentifer:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[DNDSClientDetailsProvider clientDetailsForIdentifier:](self->_clientDetailsProvider, "clientDetailsForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D1D5F8];
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateForModeAssertionsWithClientIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionManager modeAssertionsMatchingPredicate:](self->_modeAssertionManager, "modeAssertionsMatchingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)triggerManager:(id)a3 takeModeAssertionWithDetails:(id)a4 clientIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  DNDSClientDetailsProvider *clientDetailsProvider;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v9 = a4;
  v10 = a5;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __116__DNDSServer_DNDSBiomeTriggerManagerDataSource__triggerManager_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke;
  v24 = &unk_1E86A5C48;
  v25 = v10;
  v26 = v9;
  v11 = v9;
  v12 = v10;
  -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", &v21, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assertions", v21, v22, v23, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  clientDetailsProvider = self->_clientDetailsProvider;
  objc_msgSend(v15, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "clientIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSClientDetailsProvider clientDetailsForIdentifier:](clientDetailsProvider, "clientDetailsForIdentifier:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMetricsManager assertionTaken:withClientDetails:lockState:](self->_metricsManager, "assertionTaken:withClientDetails:lockState:", v15, v19, -[DNDSServer lockState](self, "lockState"));
  return v15;
}

uint64_t __116__DNDSServer_DNDSBiomeTriggerManagerDataSource__triggerManager_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", *(_QWORD *)(a1 + 32), 0);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "takeAssertionWithDetails:source:startDate:", v5, v4, v6);

  return 1;
}

- (id)triggerManager:(id)a3 invalidateModeAssertionWithUUID:(id)a4 reason:(unint64_t)a5 reasonOverride:(unint64_t)a6 clientIdentifier:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(_QWORD *, void *);
  void *v24;
  id v25;
  id v26;
  unint64_t v27;
  unint64_t v28;

  v13 = a4;
  v14 = a7;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __141__DNDSServer_DNDSBiomeTriggerManagerDataSource__triggerManager_invalidateModeAssertionWithUUID_reason_reasonOverride_clientIdentifier_error___block_invoke;
  v24 = &unk_1E86A5C70;
  v25 = v13;
  v26 = v14;
  v27 = a5;
  v28 = a6;
  v15 = v14;
  v16 = v13;
  -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", &v21, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "invalidations", v21, v22, v23, v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __141__DNDSServer_DNDSBiomeTriggerManagerDataSource__triggerManager_invalidateModeAssertionWithUUID_reason_reasonOverride_clientIdentifier_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11[0] = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionUUIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", a1[5], 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v5, v7, 0, v6, a1[6], a1[7]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v8);
  return 1;
}

- (id)triggerManager:(id)a3 latestInvalidationWithClientIdentifer:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[DNDSClientDetailsProvider clientDetailsForIdentifier:](self->_clientDetailsProvider, "clientDetailsForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D1D628];
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateForModeAssertionInvalidationsWithAssertionClientIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionManager modeAssertionInvalidationsMatchingPredicate:](self->_modeAssertionManager, "modeAssertionInvalidationsMatchingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)appForegroundTriggerConfigurationForAppForegroundTriggerManager:(id)a3
{
  DNDSAppForegroundTriggerConfiguration *v4;
  void *v5;
  DNDSAppForegroundTriggerConfiguration *v6;
  _QWORD v8[4];
  DNDSAppForegroundTriggerConfiguration *v9;

  v4 = objc_alloc_init(DNDSAppForegroundTriggerConfiguration);
  -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __121__DNDSServer_DNDSAppForegroundTriggerManagerDataSource__appForegroundTriggerConfigurationForAppForegroundTriggerManager___block_invoke;
  v8[3] = &unk_1E86A7F30;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

  return v6;
}

void __121__DNDSServer_DNDSAppForegroundTriggerManagerDataSource__appForegroundTriggerConfigurationForAppForegroundTriggerManager___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a3, "triggers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "isEnabled"))
        {
          v12 = *(void **)(a1 + 32);
          objc_msgSend(v11, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addTriggerForModeWithIdentifier:onForegroundOfApp:", v5, v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)drivingModeForDrivingTriggerManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  v14 = 0;
  -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__DNDSServer_DNDSDrivingTriggerManagerDataSource__drivingModeForDrivingTriggerManager___block_invoke;
  v8[3] = &unk_1E86A7F58;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __87__DNDSServer_DNDSDrivingTriggerManagerDataSource__drivingModeForDrivingTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "triggers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v12, "isEnabled"))
          {
            objc_msgSend(v6, "mode");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

          }
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (id)gamingModeForGamingTriggerManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  v14 = 0;
  -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84__DNDSServer_DNDSGamingTriggerManagerDataSource__gamingModeForGamingTriggerManager___block_invoke;
  v8[3] = &unk_1E86A7F58;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __84__DNDSServer_DNDSGamingTriggerManagerDataSource__gamingModeForGamingTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "triggers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v12, "isEnabled"))
          {
            objc_msgSend(v6, "mode");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

          }
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (id)mindfulnessModeForMindfulnessTriggerManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  v14 = 0;
  -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __99__DNDSServer_DNDSMindfulnessTriggerManagerDataSource__mindfulnessModeForMindfulnessTriggerManager___block_invoke;
  v8[3] = &unk_1E86A7F58;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __99__DNDSServer_DNDSMindfulnessTriggerManagerDataSource__mindfulnessModeForMindfulnessTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "triggers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v12, "isEnabled"))
          {
            objc_msgSend(v6, "mode");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

          }
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (id)sleepingModeForSleepingTriggerManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  v14 = 0;
  -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __90__DNDSServer_DNDSSleepingTriggerManagerDataSource__sleepingModeForSleepingTriggerManager___block_invoke;
  v8[3] = &unk_1E86A7F58;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __90__DNDSServer_DNDSSleepingTriggerManagerDataSource__sleepingModeForSleepingTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "triggers", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v12, "isEnabled"))
          {
            objc_msgSend(v6, "mode");
            v13 = objc_claimAutoreleasedReturnValue();
            v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v15 = *(void **)(v14 + 40);
            *(_QWORD *)(v14 + 40) = v13;

          }
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

}

- (id)modesSupportingSmartEntryForSmartTriggerManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __97__DNDSServer_DNDSSmartTriggerManagerDataSource__modesSupportingSmartEntryForSmartTriggerManager___block_invoke;
  v8[3] = &unk_1E86A7F58;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __97__DNDSServer_DNDSSmartTriggerManagerDataSource__modesSupportingSmartEntryForSmartTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "triggers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v10, "isEnabled"))
          {
            v11 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
            objc_msgSend(v4, "mode");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v12);

          }
          goto LABEL_12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

}

- (id)workoutModeForWorkoutTriggerManager:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__14;
  v13 = __Block_byref_object_dispose__14;
  v14 = 0;
  -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__DNDSServer_DNDSWorkoutTriggerManagerDataSource__workoutModeForWorkoutTriggerManager___block_invoke;
  v8[3] = &unk_1E86A7F58;
  v8[4] = &v9;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __87__DNDSServer_DNDSWorkoutTriggerManagerDataSource__workoutModeForWorkoutTriggerManager___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v12 = a3;
  objc_msgSend(v12, "triggers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a3);
          *a4 = 1;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)setWorkoutTriggerEnabled:(BOOL)a3 forWorkoutTriggerManager:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  DNDSModeConfigurationManager *modeConfigurationManager;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  id v18;
  uint8_t buf[4];
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v4 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  -[DNDSServer workoutModeForWorkoutTriggerManager:](self, "workoutModeForWorkoutTriggerManager:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x1E0D1D6A8]);
    if (v4)
      v9 = 2;
    else
      v9 = 1;
    v10 = (void *)objc_msgSend(v8, "initWithEnabledSetting:", v9);
    objc_msgSend(v7, "triggers");
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v11, "bs_filter:", &__block_literal_global_30);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    objc_msgSend(v13, "addObject:", v10);
    objc_msgSend(v7, "setTriggers:", v13);
    modeConfigurationManager = self->_modeConfigurationManager;
    v18 = 0;
    LOBYTE(v11) = -[DNDSModeConfigurationManager setModeConfiguration:withError:](modeConfigurationManager, "setModeConfiguration:withError:", v7, &v18);
    v15 = v18;
    if ((v11 & 1) == 0)
    {
      v16 = DNDSLogWorkoutTrigger;
      if (os_log_type_enabled((os_log_t)DNDSLogWorkoutTrigger, OS_LOG_TYPE_DEFAULT))
      {
        v17 = CFSTR("N");
        *(_DWORD *)buf = 138543874;
        if (v4)
          v17 = CFSTR("Y");
        v20 = v17;
        v21 = 2114;
        v22 = v7;
        v23 = 2114;
        v24 = v15;
        _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Unable to updated workout trigger enabled setting: enabled=%{public}@ mode=%{public}@ error=%{public}@", buf, 0x20u);
      }
    }

  }
}

BOOL __101__DNDSServer_DNDSWorkoutTriggerManagerDataSource__setWorkoutTriggerEnabled_forWorkoutTriggerManager___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

- (void)globalConfigurationManager:(id)a3 didUpdatePhoneCallBypassSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "DND phone call bypass settings changed, will refresh state; manager=%{public}@, settings=%{public}@",
      (uint8_t *)&v9,
      0x16u);
  }
  -[DNDSRemoteServiceProvider handleUpdatedPhoneCallBypassSettings:](self->_serviceProvider, "handleUpdatedPhoneCallBypassSettings:", v7);
  -[DNDSSettingsSyncManager update](self->_settingsSyncManager, "update");

}

- (void)globalConfigurationManager:(id)a3 didUpdatePreventAutoReplySetting:(BOOL)a4
{
  -[DNDSRemoteServiceProvider handleUpdatedPreventAutoReplySetting:](self->_serviceProvider, "handleUpdatedPreventAutoReplySetting:", a4);
}

- (void)globalConfigurationManager:(id)a3 didUpdateModesCanImpactAvailabilitySetting:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  int v7;
  DNDSUserAvailabilityCoordinator *userAvailabilityCoordinator;
  void *v9;
  void *v10;
  DNDSUserAvailabilityCoordinator *v11;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = a4;
  -[DNDSSettingsManager syncSettingsWithError:](self->_settingsManager, "syncSettingsWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isCloudSyncEnabled");

  if (v4)
  {
    if (v7)
    {
      userAvailabilityCoordinator = self->_userAvailabilityCoordinator;
      -[DNDSModeConfigurationManager relevantContacts](self->_modeConfigurationManager, "relevantContacts");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "allObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __124__DNDSServer_DNDSGlobalConfigurationManagerDelegate__globalConfigurationManager_didUpdateModesCanImpactAvailabilitySetting___block_invoke;
      v13[3] = &unk_1E86A8538;
      v13[4] = self;
      -[DNDSUserAvailabilityCoordinator resumeUpdatingInvitationsForContacts:completionHandler:](userAvailabilityCoordinator, "resumeUpdatingInvitationsForContacts:completionHandler:", v10, v13);

    }
  }
  else if (v7)
  {
    v11 = self->_userAvailabilityCoordinator;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __124__DNDSServer_DNDSGlobalConfigurationManagerDelegate__globalConfigurationManager_didUpdateModesCanImpactAvailabilitySetting___block_invoke_2;
    v12[3] = &unk_1E86A8538;
    v12[4] = self;
    -[DNDSUserAvailabilityCoordinator suspendWithOverrideSetting:completionHandler:](v11, "suspendWithOverrideSetting:completionHandler:", 1, v12);
  }
}

void __124__DNDSServer_DNDSGlobalConfigurationManagerDelegate__globalConfigurationManager_didUpdateModesCanImpactAvailabilitySetting___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "availability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAvailable");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "lastCalculatedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeModeConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType(objc_msgSend(v8, "semanticType"));

  }
  else
  {
    v9 = -2;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);

}

void __124__DNDSServer_DNDSGlobalConfigurationManagerDelegate__globalConfigurationManager_didUpdateModesCanImpactAvailabilitySetting___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "availability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAvailable");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "lastCalculatedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeModeConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType(objc_msgSend(v8, "semanticType"));

  }
  else
  {
    v9 = -2;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);

}

- (DNDSServer)init
{
  DNDSServer *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  DNDSKeybagStateProviding *keybag;
  DNDSAppInfoCache *v7;
  void *v8;
  uint64_t v9;
  DNDSAppInfoCache *appInfoCache;
  DNDSClientDetailsProvider *v11;
  DNDSClientDetailsProvider *clientDetailsProvider;
  id v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v15;
  void *v16;
  DNDSIntelligentBehaviorResolver *v17;
  DNDSIntelligentBehaviorResolver *intelligentBehaviorResolver;
  DNDSAuxiliaryStateMonitor *v19;
  DNDSAuxiliaryStateMonitor *auxiliaryStateMonitor;
  DNDSModeAssertionManager *v21;
  void *v22;
  uint64_t v23;
  DNDSModeAssertionManager *modeAssertionManager;
  DNDSMeDeviceService *v25;
  DNDSMeDeviceService *meDeviceService;
  DNDSXPCEventStream *v27;
  DNDSXPCEventStream *eventStream;
  DNDSCalendarEventLifetimeMonitor *v29;
  DNDSCalendarEventLifetimeMonitor *calendarEventLifetimeMonitor;
  DNDSXPCEventPublisher *v31;
  uint64_t v32;
  DNDSXPCEventPublisher *focusConfigurationEventPublisher;
  DNDSScheduleLifetimeMonitor *v34;
  DNDSScheduleLifetimeMonitor *scheduleLifetimeMonitor;
  DNDSDefaultLifetimeMonitor *v36;
  DNDSDateIntervalLifetimeMonitor *v37;
  DNDSLocationLifetimeMonitor *v38;
  DNDSLocationLifetimeMonitor *locationLifetimeMonitor;
  DNDSScheduleLifetimeMonitor *v40;
  uint64_t v41;
  NSArray *lifetimeMonitors;
  DNDSScheduleManager *v43;
  DNDSScheduleManager *scheduleManager;
  void *v45;
  uint64_t v46;
  IDSService *idsLocalService;
  DNDSEventBehaviorResolver *v48;
  DNDSEventBehaviorResolver *eventBehaviorResolver;
  uint64_t v50;
  IDSService *idsCloudService;
  uint64_t v52;
  DNDSSyncEngine *syncEngine;
  DNDSIDSSyncService *v54;
  DNDSIDSSyncEngineMetadataStore *v55;
  void *v56;
  uint64_t v57;
  DNDSIDSSyncEngine *v58;
  DNDSIDSSyncEngine *idsSyncEngine;
  void *v60;
  uint64_t v61;
  DNDSGlobalConfigurationStore *v62;
  DNDSGlobalConfigurationStore *globalConfigurationStore;
  DNDSGlobalConfigurationManager *v64;
  DNDSGlobalConfigurationManager *globalConfigurationManager;
  void *v66;
  void *v67;
  uint64_t v68;
  DNDSModeConfigurationsStore *v69;
  DNDSModeConfigurationsStore *modeConfigurationsStore;
  DNDSModeConfigurationManager *v71;
  DNDSModeConfigurationManager *modeConfigurationManager;
  void *v73;
  void *v74;
  DNDSMemoryCachedBackingStore *v75;
  DNDSPlaceholderModeManager *v76;
  DNDSPlaceholderModeManager *placeholderModeManager;
  DNDSStateProvider *v78;
  DNDSStateProvider *stateProvider;
  DNDSAppForegroundTriggerManager *v80;
  DNDSAppForegroundTriggerManager *appForegroundTriggerManager;
  DNDSDrivingTriggerManager *v82;
  DNDSDrivingTriggerManager *drivingTriggerManager;
  DNDSGamingTriggerManager *v84;
  DNDSGamingTriggerManager *gamingTriggerManager;
  DNDSMindfulnessTriggerManager *v86;
  DNDSMindfulnessTriggerManager *mindfulnessTriggerManager;
  DNDSSleepingTriggerManager *v88;
  DNDSSleepingTriggerManager *sleepingTriggerManager;
  DNDSSmartTriggerManager *v90;
  DNDSSmartTriggerManager *smartTriggerManager;
  DNDSWorkoutTriggerManager *v92;
  DNDSWorkoutTriggerManager *workoutTriggerManager;
  DNDSBiomeDonationManager *v94;
  DNDSBiomeDonationManager *biomeDonationManager;
  DNDSPairedDeviceStateMonitor *v96;
  DNDSPairedDeviceStateMonitor *pairedDeviceStateMonitor;
  void *v98;
  void *v99;
  DNDSMemoryCachedBackingStore *v100;
  DNDSSettingsManager *v101;
  DNDSSettingsManager *settingsManager;
  DNDSContactProvider *v103;
  void *v104;
  DNDSContactMonitor *v105;
  DNDSContactMonitor *contactMonitor;
  DNDSRemoteServiceProvider *v107;
  DNDSRemoteServiceProvider *serviceProvider;
  DNDSRemoteAvailabilityServiceProvider *v109;
  DNDSRemoteAvailabilityServiceProvider *availabilityServiceProvider;
  DNDSRemoteAppConfigurationServiceProvider *v111;
  DNDSRemoteAppConfigurationServiceProvider *appConfigurationServiceProvider;
  DNDSAppSpecificSettingsManager *v113;
  DNDSAppConfigurationManager *v114;
  DNDSAppConfigurationManager *appConfigurationManager;
  DNDSAppFocusConfigurationCoordinator *v116;
  DNDSAppFocusConfigurationCoordinator *appFocusConfigurationCoordinator;
  DNDSSystemFocusConfigurationCoordinator *v118;
  DNDSSystemFocusConfigurationCoordinator *systemFocusConfigurationCoordinator;
  uint64_t v120;
  DNDSReachability *reachability;
  STFocusStatusDomainPublisher *v122;
  STFocusStatusDomainPublisher *focusStatusDomainPublisher;
  DNDSMetricsManager *v124;
  DNDSMetricsManager *metricsManager;
  DNDSUserAvailabilityCoordinator *v126;
  DNDSUserAvailabilityCoordinator *userAvailabilityCoordinator;
  void *v128;
  int v129;
  DNDSUserAvailabilityCoordinator *v130;
  void *v131;
  DNDSServer *v132;
  uint64_t v133;
  FBSDisplayLayoutMonitor *layoutMonitor;
  DNDSFirstUnlockPurgedBackingStore *v136;
  DNDSMemoryCachedBackingStore *v137;
  void *v138;
  DNDSMemoryCachedBackingStore *v139;
  void *v140;
  void *v141;
  DNDSIDSSyncService *v142;
  DNDSModeRepository *v143;
  void *v144;
  DNDSDateIntervalLifetimeMonitor *v145;
  DNDSDefaultLifetimeMonitor *v146;
  _QWORD v147[4];
  DNDSServer *v148;
  objc_super v149;
  _QWORD v150[7];

  v150[5] = *MEMORY[0x1E0C80C00];
  v149.receiver = self;
  v149.super_class = (Class)DNDSServer;
  v2 = -[DNDSServer init](&v149, sel_init);
  if (v2)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.donotdisturb.server.Server"));
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    keybag = v2->_keybag;
    v2->_keybag = (DNDSKeybagStateProviding *)v5;

    v7 = [DNDSAppInfoCache alloc];
    +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[DNDSAppInfoCache initWithKeybag:](v7, "initWithKeybag:", v8);
    appInfoCache = v2->_appInfoCache;
    v2->_appInfoCache = (DNDSAppInfoCache *)v9;

    v11 = objc_alloc_init(DNDSClientDetailsProvider);
    clientDetailsProvider = v2->_clientDetailsProvider;
    v2->_clientDetailsProvider = v11;

    v13 = objc_alloc_init(MEMORY[0x1E0C97298]);
    objc_msgSend(v13, "requestAccessForEntityType:completionHandler:", 0, &__block_literal_global_39);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)DNDHandleSignificantTimeChange, CFSTR("SignificantTimeChangeNotification"), 0, CFNotificationSuspensionBehaviorCoalesce);
    v15 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v15, v2, (CFNotificationCallback)DNDSHandleLostModeStateChange, (CFStringRef)*MEMORY[0x1E0D21398], 0, CFNotificationSuspensionBehaviorCoalesce);
    objc_msgSend(MEMORY[0x1E0D21380], "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_lostModeState = objc_msgSend(v16, "lostModeIsActive");

    v17 = objc_alloc_init(DNDSIntelligentBehaviorResolver);
    intelligentBehaviorResolver = v2->_intelligentBehaviorResolver;
    v2->_intelligentBehaviorResolver = v17;

    v19 = objc_alloc_init(DNDSAuxiliaryStateMonitor);
    auxiliaryStateMonitor = v2->_auxiliaryStateMonitor;
    v2->_auxiliaryStateMonitor = v19;

    v21 = [DNDSModeAssertionManager alloc];
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_localAssertionBackingStoreFileURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[DNDSModeAssertionManager initWithBackingStoreURL:clientDetailsProvider:](v21, "initWithBackingStoreURL:clientDetailsProvider:", v22, v2->_clientDetailsProvider);
    modeAssertionManager = v2->_modeAssertionManager;
    v2->_modeAssertionManager = (DNDSModeAssertionManager *)v23;

    v25 = objc_alloc_init(DNDSMeDeviceService);
    meDeviceService = v2->_meDeviceService;
    v2->_meDeviceService = v25;

    -[DNDSMeDeviceService addListener:](v2->_meDeviceService, "addListener:", v2);
    v27 = objc_alloc_init(DNDSXPCEventStream);
    eventStream = v2->_eventStream;
    v2->_eventStream = v27;

    v29 = objc_alloc_init(DNDSCalendarEventLifetimeMonitor);
    calendarEventLifetimeMonitor = v2->_calendarEventLifetimeMonitor;
    v2->_calendarEventLifetimeMonitor = v29;

    -[DNDSBaseLifetimeMonitor setDataSource:](v2->_calendarEventLifetimeMonitor, "setDataSource:", v2);
    -[DNDSCalendarEventLifetimeMonitor setDelegate:](v2->_calendarEventLifetimeMonitor, "setDelegate:", v2);
    v31 = [DNDSXPCEventPublisher alloc];
    v32 = -[DNDSXPCEventPublisher initWithStream:](v31, "initWithStream:", *MEMORY[0x1E0D1D3F0]);
    focusConfigurationEventPublisher = v2->_focusConfigurationEventPublisher;
    v2->_focusConfigurationEventPublisher = (DNDSXPCEventPublisher *)v32;

    v34 = objc_alloc_init(DNDSScheduleLifetimeMonitor);
    scheduleLifetimeMonitor = v2->_scheduleLifetimeMonitor;
    v2->_scheduleLifetimeMonitor = v34;

    -[DNDSBaseLifetimeMonitor setDataSource:](v2->_scheduleLifetimeMonitor, "setDataSource:", v2);
    -[DNDSScheduleLifetimeMonitor setDelegate:](v2->_scheduleLifetimeMonitor, "setDelegate:", v2);
    v36 = objc_alloc_init(DNDSDefaultLifetimeMonitor);
    -[DNDSBaseLifetimeMonitor setDataSource:](v36, "setDataSource:", v2);
    -[DNDSBaseLifetimeMonitor setDelegate:](v36, "setDelegate:", v2);
    v37 = objc_alloc_init(DNDSDateIntervalLifetimeMonitor);
    -[DNDSBaseLifetimeMonitor setDataSource:](v37, "setDataSource:", v2);
    -[DNDSDateIntervalLifetimeMonitor setDelegate:](v37, "setDelegate:", v2);
    v38 = -[DNDSLocationLifetimeMonitor initWithMeDeviceService:]([DNDSLocationLifetimeMonitor alloc], "initWithMeDeviceService:", v2->_meDeviceService);
    locationLifetimeMonitor = v2->_locationLifetimeMonitor;
    v2->_locationLifetimeMonitor = v38;

    -[DNDSLocationLifetimeMonitor setDataSource:](v2->_locationLifetimeMonitor, "setDataSource:", v2);
    -[DNDSLocationLifetimeMonitor setDelegate:](v2->_locationLifetimeMonitor, "setDelegate:", v2);
    v40 = v2->_scheduleLifetimeMonitor;
    v150[0] = v2->_calendarEventLifetimeMonitor;
    v150[1] = v40;
    v145 = v37;
    v146 = v36;
    v150[2] = v36;
    v150[3] = v37;
    v150[4] = v2->_locationLifetimeMonitor;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v150, 5);
    v41 = objc_claimAutoreleasedReturnValue();
    lifetimeMonitors = v2->_lifetimeMonitors;
    v2->_lifetimeMonitors = (NSArray *)v41;

    v43 = -[DNDSScheduleManager initWithModeAssertionManager:]([DNDSScheduleManager alloc], "initWithModeAssertionManager:", v2->_modeAssertionManager);
    scheduleManager = v2->_scheduleManager;
    v2->_scheduleManager = v43;

    -[DNDSScheduleManager setDataSource:](v2->_scheduleManager, "setDataSource:", v2);
    objc_msgSend(MEMORY[0x1E0D1D5C8], "currentDevice");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v45, "deviceClass") == 5 || objc_msgSend(v45, "deviceClass") == 1)
    {
      v46 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.donotdisturb"));
      idsLocalService = v2->_idsLocalService;
      v2->_idsLocalService = (IDSService *)v46;

    }
    v144 = v45;
    v143 = objc_alloc_init(DNDSModeRepository);
    v48 = -[DNDSEventBehaviorResolver initWithModeRepository:contactStore:auxiliaryStateMonitor:intelligentBehaviorResolver:IDSLocalService:]([DNDSEventBehaviorResolver alloc], "initWithModeRepository:contactStore:auxiliaryStateMonitor:intelligentBehaviorResolver:IDSLocalService:", v143, v13, v2->_auxiliaryStateMonitor, v2->_intelligentBehaviorResolver, v2->_idsLocalService);
    eventBehaviorResolver = v2->_eventBehaviorResolver;
    v2->_eventBehaviorResolver = v48;

    -[DNDSEventBehaviorResolver setDataSource:](v2->_eventBehaviorResolver, "setDataSource:", v2);
    v50 = objc_msgSend(objc_alloc(MEMORY[0x1E0D34358]), "initWithService:", CFSTR("com.apple.private.alloy.status.personal"));
    idsCloudService = v2->_idsCloudService;
    v2->_idsCloudService = (IDSService *)v50;

    +[DNDSSyncEngine sharedInstance](DNDSSyncEngine, "sharedInstance");
    v52 = objc_claimAutoreleasedReturnValue();
    syncEngine = v2->_syncEngine;
    v2->_syncEngine = (DNDSSyncEngine *)v52;

    v54 = -[DNDSIDSSyncService initWithIDSService:]([DNDSIDSSyncService alloc], "initWithIDSService:", v2->_idsLocalService);
    v55 = [DNDSIDSSyncEngineMetadataStore alloc];
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_idsSyncEngineMetadataFileURL");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = -[DNDSIDSSyncEngineMetadataStore initWithURL:](v55, "initWithURL:", v56);

    v141 = (void *)v57;
    v142 = v54;
    v58 = -[DNDSIDSSyncEngine initWithMetadataStore:syncService:keybag:]([DNDSIDSSyncEngine alloc], "initWithMetadataStore:syncService:keybag:", v57, v54, v2->_keybag);
    idsSyncEngine = v2->_idsSyncEngine;
    v2->_idsSyncEngine = v58;

    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_globalConfigurationBackingStoreFileURL");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSGlobalConfiguration backingStoreWithFileURL:](DNDSGlobalConfiguration, "backingStoreWithFileURL:", v60);
    v61 = objc_claimAutoreleasedReturnValue();

    v140 = (void *)v61;
    v139 = -[DNDSMemoryCachedBackingStore initWithUnderlyingBackingStore:]([DNDSMemoryCachedBackingStore alloc], "initWithUnderlyingBackingStore:", v61);
    v62 = -[DNDSGlobalConfigurationStore initWithBackingStore:syncEngine:idsSyncEngine:]([DNDSGlobalConfigurationStore alloc], "initWithBackingStore:syncEngine:idsSyncEngine:", v139, v2->_syncEngine, v2->_idsSyncEngine);
    globalConfigurationStore = v2->_globalConfigurationStore;
    v2->_globalConfigurationStore = v62;

    v64 = -[DNDSGlobalConfigurationManager initWithBackingStore:]([DNDSGlobalConfigurationManager alloc], "initWithBackingStore:", v2->_globalConfigurationStore);
    globalConfigurationManager = v2->_globalConfigurationManager;
    v2->_globalConfigurationManager = v64;

    -[DNDSGlobalConfigurationManager setDelegate:](v2->_globalConfigurationManager, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_modeConfigurationsBackingStoreFileURL");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_modeConfigurationsSecureBackingStoreFileURL");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSModeConfigurationsRecord backingStoreWithFileURL:secureFileURL:](DNDSModeConfigurationsRecord, "backingStoreWithFileURL:secureFileURL:", v66, v67);
    v68 = objc_claimAutoreleasedReturnValue();

    v138 = (void *)v68;
    v137 = -[DNDSMemoryCachedBackingStore initWithUnderlyingBackingStore:]([DNDSMemoryCachedBackingStore alloc], "initWithUnderlyingBackingStore:", v68);
    v136 = -[DNDSFirstUnlockPurgedBackingStore initWithUnderlyingBackingStore:keybag:]([DNDSFirstUnlockPurgedBackingStore alloc], "initWithUnderlyingBackingStore:keybag:", v137, v2->_keybag);
    v69 = -[DNDSModeConfigurationsStore initWithBackingStore:syncEngine:idsSyncEngine:]([DNDSModeConfigurationsStore alloc], "initWithBackingStore:syncEngine:idsSyncEngine:", v136, v2->_syncEngine, v2->_idsSyncEngine);
    modeConfigurationsStore = v2->_modeConfigurationsStore;
    v2->_modeConfigurationsStore = v69;

    v71 = -[DNDSModeConfigurationManager initWithBackingStore:keybag:]([DNDSModeConfigurationManager alloc], "initWithBackingStore:keybag:", v2->_modeConfigurationsStore, v2->_keybag);
    modeConfigurationManager = v2->_modeConfigurationManager;
    v2->_modeConfigurationManager = v71;

    -[DNDSModeConfigurationManager setDelegate:](v2->_modeConfigurationManager, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_placeholderModesLocalBackingStoreFileURL");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSPlaceholderModesRecord backingStoreWithFileURL:](DNDSPlaceholderModesRecord, "backingStoreWithFileURL:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();

    v75 = -[DNDSMemoryCachedBackingStore initWithUnderlyingBackingStore:]([DNDSMemoryCachedBackingStore alloc], "initWithUnderlyingBackingStore:", v74);
    v76 = -[DNDSPlaceholderModeManager initWithBackingStore:]([DNDSPlaceholderModeManager alloc], "initWithBackingStore:", v75);
    placeholderModeManager = v2->_placeholderModeManager;
    v2->_placeholderModeManager = v76;

    v78 = -[DNDSStateProvider initWithModeConfigurationManager:]([DNDSStateProvider alloc], "initWithModeConfigurationManager:", v2->_modeConfigurationManager);
    stateProvider = v2->_stateProvider;
    v2->_stateProvider = v78;

    v80 = objc_alloc_init(DNDSAppForegroundTriggerManager);
    appForegroundTriggerManager = v2->_appForegroundTriggerManager;
    v2->_appForegroundTriggerManager = v80;

    -[DNDSAppForegroundTriggerManager setDataSource:](v2->_appForegroundTriggerManager, "setDataSource:", v2);
    -[DNDSAppForegroundTriggerManager refresh](v2->_appForegroundTriggerManager, "refresh");
    v82 = objc_alloc_init(DNDSDrivingTriggerManager);
    drivingTriggerManager = v2->_drivingTriggerManager;
    v2->_drivingTriggerManager = v82;

    -[DNDSDrivingTriggerManager setDataSource:](v2->_drivingTriggerManager, "setDataSource:", v2);
    -[DNDSDrivingTriggerManager refresh](v2->_drivingTriggerManager, "refresh");
    v84 = objc_alloc_init(DNDSGamingTriggerManager);
    gamingTriggerManager = v2->_gamingTriggerManager;
    v2->_gamingTriggerManager = v84;

    -[DNDSGamingTriggerManager setDataSource:](v2->_gamingTriggerManager, "setDataSource:", v2);
    -[DNDSGamingTriggerManager refresh](v2->_gamingTriggerManager, "refresh");
    v86 = objc_alloc_init(DNDSMindfulnessTriggerManager);
    mindfulnessTriggerManager = v2->_mindfulnessTriggerManager;
    v2->_mindfulnessTriggerManager = v86;

    -[DNDSMindfulnessTriggerManager setDataSource:](v2->_mindfulnessTriggerManager, "setDataSource:", v2);
    -[DNDSMindfulnessTriggerManager refresh](v2->_mindfulnessTriggerManager, "refresh");
    v88 = objc_alloc_init(DNDSSleepingTriggerManager);
    sleepingTriggerManager = v2->_sleepingTriggerManager;
    v2->_sleepingTriggerManager = v88;

    -[DNDSSleepingTriggerManager setDataSource:](v2->_sleepingTriggerManager, "setDataSource:", v2);
    -[DNDSSleepingTriggerManager refresh](v2->_sleepingTriggerManager, "refresh");
    v90 = objc_alloc_init(DNDSSmartTriggerManager);
    smartTriggerManager = v2->_smartTriggerManager;
    v2->_smartTriggerManager = v90;

    -[DNDSSmartTriggerManager setDataSource:](v2->_smartTriggerManager, "setDataSource:", v2);
    -[DNDSSmartTriggerManager refresh](v2->_smartTriggerManager, "refresh");
    v92 = objc_alloc_init(DNDSWorkoutTriggerManager);
    workoutTriggerManager = v2->_workoutTriggerManager;
    v2->_workoutTriggerManager = v92;

    -[DNDSWorkoutTriggerManager setDataSource:](v2->_workoutTriggerManager, "setDataSource:", v2);
    -[DNDSWorkoutTriggerManager refreshMigratingIfNecessary](v2->_workoutTriggerManager, "refreshMigratingIfNecessary");
    v94 = objc_alloc_init(DNDSBiomeDonationManager);
    biomeDonationManager = v2->_biomeDonationManager;
    v2->_biomeDonationManager = v94;

    v96 = -[DNDSPairedDeviceStateMonitor initWithLocalIDSService:cloudIDSService:]([DNDSPairedDeviceStateMonitor alloc], "initWithLocalIDSService:cloudIDSService:", v2->_idsLocalService, v2->_idsCloudService);
    pairedDeviceStateMonitor = v2->_pairedDeviceStateMonitor;
    v2->_pairedDeviceStateMonitor = v96;

    -[DNDSPairedDeviceStateMonitor setDelegate:](v2->_pairedDeviceStateMonitor, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0C99E98], "dnds_settingsBackingStoreFileURL");
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSSettingsRecord backingStoreWithFileURL:](DNDSSettingsRecord, "backingStoreWithFileURL:", v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    v100 = -[DNDSMemoryCachedBackingStore initWithUnderlyingBackingStore:]([DNDSMemoryCachedBackingStore alloc], "initWithUnderlyingBackingStore:", v99);
    v101 = -[DNDSSettingsManager initWithBackingStore:contactStore:]([DNDSSettingsManager alloc], "initWithBackingStore:contactStore:", v100, v13);
    settingsManager = v2->_settingsManager;
    v2->_settingsManager = v101;

    -[DNDSSettingsManager setDelegate:](v2->_settingsManager, "setDelegate:", v2);
    v103 = objc_alloc_init(DNDSContactProvider);
    v104 = v13;
    v105 = -[DNDSContactMonitor initWithContactStore:contactProvider:]([DNDSContactMonitor alloc], "initWithContactStore:contactProvider:", v13, v103);
    contactMonitor = v2->_contactMonitor;
    v2->_contactMonitor = v105;

    -[DNDSContactMonitor addListener:](v2->_contactMonitor, "addListener:", v2->_modeConfigurationsStore);
    v107 = -[DNDSRemoteServiceProvider initWithClientDetailsProvider:]([DNDSRemoteServiceProvider alloc], "initWithClientDetailsProvider:", v2->_clientDetailsProvider);
    serviceProvider = v2->_serviceProvider;
    v2->_serviceProvider = v107;

    -[DNDSRemoteServiceProvider setDelegate:](v2->_serviceProvider, "setDelegate:", v2);
    v109 = -[DNDSRemoteAvailabilityServiceProvider initWithClientDetailsProvider:]([DNDSRemoteAvailabilityServiceProvider alloc], "initWithClientDetailsProvider:", v2->_clientDetailsProvider);
    availabilityServiceProvider = v2->_availabilityServiceProvider;
    v2->_availabilityServiceProvider = v109;

    -[DNDSRemoteAvailabilityServiceProvider setDelegate:](v2->_availabilityServiceProvider, "setDelegate:", v2);
    v111 = -[DNDSRemoteAppConfigurationServiceProvider initWithClientDetailsProvider:]([DNDSRemoteAppConfigurationServiceProvider alloc], "initWithClientDetailsProvider:", v2->_clientDetailsProvider);
    appConfigurationServiceProvider = v2->_appConfigurationServiceProvider;
    v2->_appConfigurationServiceProvider = v111;

    -[DNDSRemoteAppConfigurationServiceProvider setDelegate:](v2->_appConfigurationServiceProvider, "setDelegate:", v2);
    v113 = -[DNDSAppSpecificSettingsManager initWithIDSSyncEngine:backingStoreURL:]([DNDSAppSpecificSettingsManager alloc], "initWithIDSSyncEngine:backingStoreURL:", v2->_idsSyncEngine, 0);
    v114 = -[DNDSAppConfigurationManager initWithAppSpecificSettingsManager:]([DNDSAppConfigurationManager alloc], "initWithAppSpecificSettingsManager:", v113);
    appConfigurationManager = v2->_appConfigurationManager;
    v2->_appConfigurationManager = v114;

    v116 = -[DNDSAppFocusConfigurationCoordinator initWithAppConfigurationManager:keybagProviding:xpcEventPublisher:]([DNDSAppFocusConfigurationCoordinator alloc], "initWithAppConfigurationManager:keybagProviding:xpcEventPublisher:", v2->_appConfigurationManager, v2->_keybag, v2->_focusConfigurationEventPublisher);
    appFocusConfigurationCoordinator = v2->_appFocusConfigurationCoordinator;
    v2->_appFocusConfigurationCoordinator = v116;

    -[DNDSAppFocusConfigurationCoordinator setDelegate:](v2->_appFocusConfigurationCoordinator, "setDelegate:", v2);
    v118 = -[DNDSSystemFocusConfigurationCoordinator initWithAppConfigurationManager:]([DNDSSystemFocusConfigurationCoordinator alloc], "initWithAppConfigurationManager:", v2->_appConfigurationManager);
    systemFocusConfigurationCoordinator = v2->_systemFocusConfigurationCoordinator;
    v2->_systemFocusConfigurationCoordinator = v118;

    -[DNDSSystemFocusConfigurationCoordinator setDelegate:](v2->_systemFocusConfigurationCoordinator, "setDelegate:", v2);
    +[DNDSReachability commonReachability](DNDSReachability, "commonReachability");
    v120 = objc_claimAutoreleasedReturnValue();
    reachability = v2->_reachability;
    v2->_reachability = (DNDSReachability *)v120;

    -[DNDSReachability addDelegate:](v2->_reachability, "addDelegate:", v2);
    -[DNDSKeybagStateProviding addObserver:](v2->_keybag, "addObserver:", v2);
    v122 = (STFocusStatusDomainPublisher *)objc_alloc_init(MEMORY[0x1E0DB08E8]);
    focusStatusDomainPublisher = v2->_focusStatusDomainPublisher;
    v2->_focusStatusDomainPublisher = v122;

    -[DNDSServer _migrateDefaultDoNotDisturbModeIfNeeded](v2, "_migrateDefaultDoNotDisturbModeIfNeeded");
    -[DNDSServer _migrateReduceInterruptionsIfNeeded](v2, "_migrateReduceInterruptionsIfNeeded");
    v124 = objc_alloc_init(DNDSMetricsManager);
    metricsManager = v2->_metricsManager;
    v2->_metricsManager = v124;

    v126 = -[DNDSUserAvailabilityCoordinator initWithConfigurationProvider:stateProvider:]([DNDSUserAvailabilityCoordinator alloc], "initWithConfigurationProvider:stateProvider:", v2->_modeConfigurationManager, v2->_stateProvider);
    userAvailabilityCoordinator = v2->_userAvailabilityCoordinator;
    v2->_userAvailabilityCoordinator = v126;

    -[DNDSSettingsManager syncSettingsWithError:](v2->_settingsManager, "syncSettingsWithError:", 0);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "isCloudSyncEnabled");

    v130 = v2->_userAvailabilityCoordinator;
    if (v129)
      -[DNDSUserAvailabilityCoordinator resume](v130, "resume");
    else
      -[DNDSUserAvailabilityCoordinator suspend](v130, "suspend");
    objc_msgSend(MEMORY[0x1E0D230E0], "configurationForDefaultMainDisplayMonitor");
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v147[0] = MEMORY[0x1E0C809B0];
    v147[1] = 3221225472;
    v147[2] = __18__DNDSServer_init__block_invoke_123;
    v147[3] = &unk_1E86A8580;
    v132 = v2;
    v148 = v132;
    objc_msgSend(v131, "setTransitionHandler:", v147);
    objc_msgSend(MEMORY[0x1E0D230D0], "monitorWithConfiguration:", v131);
    v133 = objc_claimAutoreleasedReturnValue();
    layoutMonitor = v132->_layoutMonitor;
    v132->_layoutMonitor = (FBSDisplayLayoutMonitor *)v133;

    -[DNDSXPCEventStream start](v2->_eventStream, "start");
  }
  return v2;
}

void __18__DNDSServer_init__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = a2;
    v7 = 2114;
    v8 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Access to contacts store: granted=%{BOOL}u, error=%{public}@", (uint8_t *)v6, 0x12u);
  }

}

- (void)resume
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __20__DNDSServer_resume__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __20__DNDSServer_resume__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_resume");
}

- (void)_handleSignificantTimeChange
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Got significant time change; update lifetime monitors",
      buf,
      2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__DNDSServer__handleSignificantTimeChange__block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __42__DNDSServer__handleSignificantTimeChange__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 4, 1);
  return objc_msgSend(*(id *)(a1 + 32), "_queue_validateIDSSyncEngine");
}

- (BOOL)_setLostModeState:(unint64_t)a3 error:(id *)a4
{
  NSObject *queue;
  _QWORD block[5];

  -[DNDSServer setLostModeState:](self, "setLostModeState:", a3, a4);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__DNDSServer__setLostModeState_error___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
  return 1;
}

uint64_t __38__DNDSServer__setLostModeState_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 4, 1);
}

- (id)currentStateForEventBehaviorResolver:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[DNDSStateProvider lastCalculatedState](self->_stateProvider, "lastCalculatedState", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1D748], "fallbackState");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)eventBehaviorResolver:(id)a3 bypassSettingsForClientIdentifier:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[DNDSServer currentStateForEventBehaviorResolver:](self, "currentStateForEventBehaviorResolver:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeModeConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phoneCallBypassSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)eventBehaviorResolver:(id)a3 configurationForModeIdentifier:(id)a4
{
  DNDSModeConfigurationManager *modeConfigurationManager;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v13;

  modeConfigurationManager = self->_modeConfigurationManager;
  v13 = 0;
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", a4, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  objc_msgSend(v6, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[DNDSGlobalConfigurationManager fallbackConfiguration](self->_globalConfigurationManager, "fallbackConfiguration");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

- (BOOL)eventBehaviorResolver:(id)a3 isAvailabilityActiveForBundleIdentifier:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;

  -[DNDSServer currentStateForEventBehaviorResolver:](self, "currentStateForEventBehaviorResolver:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeModeConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "impactsAvailability");

  return v6 != 1;
}

- (id)eventBehaviorResolver:(id)a3 appPredicateForApplicationIdentifier:(id)a4 modeIdentifier:(id)a5
{
  return -[DNDSAppConfigurationManager predicateForApplicationIdentifier:modeIdentifier:error:](self->_appConfigurationManager, "predicateForApplicationIdentifier:modeIdentifier:error:", a4, a5, 0);
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  -[DNDSServer _migrateDefaultDoNotDisturbModeIfNeeded](self, "_migrateDefaultDoNotDisturbModeIfNeeded", a3);
  if (+[DNDSPlatformEligibility isIntelligenceAvailable](DNDSPlatformEligibility, "isIntelligenceAvailable"))
  {
    -[DNDSServer _migrateReduceInterruptionsIfNeeded](self, "_migrateReduceInterruptionsIfNeeded");
  }
}

- (id)lifetimeMonitor:(id)a3 modeAssertionsWithLifetimeClass:(Class)a4
{
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D1D5F8], "predicateForModeAssertionsWithLifetimeClass:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionManager modeAssertionsMatchingPredicate:](self->_modeAssertionManager, "modeAssertionsMatchingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)locationTriggerConfigurationForLifetimeMonitor:(id)a3
{
  DNDSLocationTriggerConfiguration *v4;
  void *v5;
  DNDSLocationTriggerConfiguration *v6;
  void *v7;
  DNDSLocationTriggerConfiguration *v8;
  DNDSLocationTriggerConfiguration *v9;
  _QWORD v11[4];
  DNDSLocationTriggerConfiguration *v12;

  v4 = objc_alloc_init(DNDSLocationTriggerConfiguration);
  -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__DNDSServer_locationTriggerConfigurationForLifetimeMonitor___block_invoke;
  v11[3] = &unk_1E86A7F30;
  v12 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v11);
  -[DNDSLocationTriggerConfiguration regions](v6, "regions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;

  return v9;
}

void __61__DNDSServer_locationTriggerConfigurationForLifetimeMonitor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "triggers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "isEnabled"))
        {
          objc_msgSend(v11, "region");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "addTriggerForModeWithIdentifier:forRegion:", v5, v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)activeAssertionsDidChangeForLifetimeMonitor:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  DNDSServer *v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v12 = v4;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Lifetime monitor says active assertions changed; monitor=%p",
      buf,
      0xCu);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__DNDSServer_activeAssertionsDidChangeForLifetimeMonitor___block_invoke;
  v8[3] = &unk_1E86A59E8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(queue, v8);

}

uint64_t __58__DNDSServer_activeAssertionsDidChangeForLifetimeMonitor___block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD **)(a1 + 40);
  if (v2 == v1[3])
    v3 = 5;
  else
    v3 = 6;
  return objc_msgSend(v1, "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", v3, 1);
}

- (id)lifetimeMonitor:(id)a3 takeModeAssertionWithDetails:(id)a4 clientIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  DNDSClientDetailsProvider *clientDetailsProvider;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  void *v24;
  id v25;
  id v26;

  v9 = a4;
  v10 = a5;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __82__DNDSServer_lifetimeMonitor_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke;
  v24 = &unk_1E86A5C48;
  v25 = v10;
  v26 = v9;
  v11 = v9;
  v12 = v10;
  -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", &v21, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assertions", v21, v22, v23, v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  clientDetailsProvider = self->_clientDetailsProvider;
  objc_msgSend(v15, "source");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "clientIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSClientDetailsProvider clientDetailsForIdentifier:](clientDetailsProvider, "clientDetailsForIdentifier:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSMetricsManager assertionTaken:withClientDetails:lockState:](self->_metricsManager, "assertionTaken:withClientDetails:lockState:", v15, v19, -[DNDSServer lockState](self, "lockState"));
  return v15;
}

uint64_t __82__DNDSServer_lifetimeMonitor_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", *(_QWORD *)(a1 + 32), 0);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "takeAssertionWithDetails:source:startDate:", v5, v4, v6);

  return 1;
}

- (void)lifetimeMonitor:(id)a3 lifetimeDidExpireForAssertionUUIDs:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  DNDSServer *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    v11 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v21 = v8;
      v22 = 2114;
      v23 = v9;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Lifetime monitor says UUIDs should expire; monitor=%{public}@, UUIDs=%{public}@",
        buf,
        0x16u);
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__DNDSServer_lifetimeMonitor_lifetimeDidExpireForAssertionUUIDs_expirationDate___block_invoke;
    v15[3] = &unk_1E86A85A8;
    v16 = v9;
    v17 = v8;
    v18 = self;
    v19 = v10;
    v14 = 0;
    v12 = -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", v15, &v14);
    v13 = v14;

  }
}

uint64_t __80__DNDSServer_lifetimeMonitor_lifetimeDidExpireForAssertionUUIDs_expirationDate___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v3 = a2;
  +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionUUIDs:", a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D1D648]);
  v6 = (void *)objc_msgSend(v5, "initWithClientIdentifier:deviceIdentifier:", *MEMORY[0x1E0D1D530], 0);
  v7 = a1[5];
  v8 = a1[6];
  if (v7 == *(_QWORD *)(v8 + 32))
  {
    v9 = 7;
  }
  else if (v7 == *(_QWORD *)(v8 + 16))
  {
    v9 = 8;
  }
  else
  {
    v9 = 1;
  }
  +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v4, a1[7], 0, v6, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v10);

  return 1;
}

- (void)lifetimeMonitor:(id)a3 setTimer:(id)a4
{
  -[DNDSXPCEventStream setTimer:](self->_eventStream, "setTimer:", a4);
}

- (void)lifetimeMonitor:(id)a3 registerTimerHandlerWithServiceIdentifier:(id)a4 handler:(id)a5
{
  -[DNDSXPCEventStream registerTimerHandlerWithServiceIdentifier:handler:](self->_eventStream, "registerTimerHandlerWithServiceIdentifier:handler:", a4, a5);
}

- (id)remoteServiceProvider:(id)a3 resolveBehaviorForEventDetails:(id)a4 clientDetails:(id)a5 date:(id)a6 error:(id *)a7
{
  DNDSMetricsManager *metricsManager;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  NSObject *v19;
  int v21;
  void *v22;
  __int16 v23;
  _BOOL8 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  metricsManager = self->_metricsManager;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  -[DNDSMetricsManager sendMetricsHeartbeatsIfNeeded](metricsManager, "sendMetricsHeartbeatsIfNeeded");
  -[DNDSEventBehaviorResolver resolveBehaviorForEventDetails:clientDetails:date:error:](self->_eventBehaviorResolver, "resolveBehaviorForEventDetails:clientDetails:date:error:", v14, v13, v12, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "eventDetails");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v18 = DNDSPowerLogInterruptionSuppressionForDNDInterruptionSuppression(objc_msgSend(v15, "interruptionSuppression"));
    v19 = DNDSLogMetrics;
    if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_INFO))
    {
      v21 = 138543618;
      v22 = v17;
      v23 = 2048;
      v24 = v18;
      _os_log_impl(&dword_1CB895000, v19, OS_LOG_TYPE_INFO, "Notifying PowerLog of Focus interruption suppression event: bundleIdentifier=%{public}@ suppression=%ld", (uint8_t *)&v21, 0x16u);
    }
    DNDSPowerLogFocusInterruptionSuppresionEvent(v17, v18);
  }

  return v15;
}

- (id)remoteServiceProvider:(id)a3 activeAssertionWithClientIdentifer:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v6 = a4;
  -[DNDSStateProvider lastCalculatedState](self->_stateProvider, "lastCalculatedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSStateProvider lastSystemSnapshot](self->_stateProvider, "lastSystemSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeModeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assertions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke;
  v21[3] = &unk_1E86A6EB0;
  v12 = v8;
  v22 = v12;
  v13 = v9;
  v23 = v13;
  objc_msgSend(v10, "bs_filter:", v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v14, "count") < 2)
  {
    objc_msgSend(v14, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19[0] = v11;
    v19[1] = 3221225472;
    v19[2] = __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke_2;
    v19[3] = &unk_1E86A5BB0;
    v20 = v6;
    objc_msgSend(v14, "bs_filter:", v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count") == 1)
    {
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_139);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v16;
}

uint64_t __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activeAssertionUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    objc_msgSend(v3, "details");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 40));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

uint64_t __77__DNDSServer_remoteServiceProvider_activeAssertionWithClientIdentifer_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (id)remoteServiceProvider:(id)a3 assertionWithClientIdentifer:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[DNDSClientDetailsProvider clientDetailsForIdentifier:](self->_clientDetailsProvider, "clientDetailsForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D1D5F8];
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateForModeAssertionsWithClientIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionManager modeAssertionsMatchingPredicate:](self->_modeAssertionManager, "modeAssertionsMatchingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)remoteServiceProvider:(id)a3 takeModeAssertionWithDetails:(id)a4 clientIdentifier:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  DNDSModeConfigurationManager *modeConfigurationManager;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  DNDSClientDetailsProvider *clientDetailsProvider;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, void *);
  void *v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  modeConfigurationManager = self->_modeConfigurationManager;
  objc_msgSend(v9, "modeIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", v12, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __88__DNDSServer_remoteServiceProvider_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke;
    v31 = &unk_1E86A5C48;
    v32 = v10;
    v33 = v9;
    -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", &v28, a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assertions", v28, v29, v30, v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    clientDetailsProvider = self->_clientDetailsProvider;
    objc_msgSend(v16, "source");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "clientIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDSClientDetailsProvider clientDetailsForIdentifier:](clientDetailsProvider, "clientDetailsForIdentifier:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[DNDSMetricsManager assertionTaken:withClientDetails:lockState:](self->_metricsManager, "assertionTaken:withClientDetails:lockState:", v16, v20, -[DNDSServer lockState](self, "lockState"));
  }
  else
  {
    if (a6)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0D1D3E0];
      v36 = *MEMORY[0x1E0CB2D50];
      v37[0] = CFSTR("No mode configuration found for mode identifier.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1003, v23);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v24 = (void *)DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      v25 = v24;
      objc_msgSend(v9, "modeIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v35 = v26;
      _os_log_impl(&dword_1CB895000, v25, OS_LOG_TYPE_DEFAULT, "No mode configuration found for mode identifier: modeIdentifier=%{public}@", buf, 0xCu);

    }
    v16 = 0;
  }

  return v16;
}

uint64_t __88__DNDSServer_remoteServiceProvider_takeModeAssertionWithDetails_clientIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", *(_QWORD *)(a1 + 32), 0);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "takeAssertionWithDetails:source:startDate:", v5, v4, v6);

  return 1;
}

- (id)remoteServiceProvider:(id)a3 invalidateModeAssertionWithUUID:(id)a4 reason:(unint64_t)a5 reasonOverride:(unint64_t)a6 clientIdentifier:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  DNDSModeAssertionManager *modeAssertionManager;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t (*v31)(_QWORD *, void *);
  void *v32;
  id v33;
  id v34;
  unint64_t v35;
  unint64_t v36;
  uint8_t buf[4];
  id v38;
  __int16 v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v13 = a4;
  v14 = (id)*MEMORY[0x1E0D1D530];
  if (a7)
    v14 = a7;
  v15 = v14;
  modeAssertionManager = self->_modeAssertionManager;
  v17 = (void *)MEMORY[0x1E0D1D5F8];
  v41[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "predicateForModeAssertionsWithUUIDs:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionManager modeAssertionsMatchingPredicate:](modeAssertionManager, "modeAssertionsMatchingPredicate:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "source");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "clientIdentifier");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v23, "hasSuffix:", CFSTR(".private.schedule")))
  {
    v24 = DNDSLogServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogServiceProvider, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v38 = v15;
      v39 = 2114;
      v40 = v23;
      _os_log_impl(&dword_1CB895000, v24, OS_LOG_TYPE_DEFAULT, "Overriding invalidation client (%{public}@) with assertion client (%{public}@)", buf, 0x16u);
    }
    -[DNDSServer _invalidateModeAssertionForClientIdentifier:reason:reasonOverride:details:error:](self, "_invalidateModeAssertionForClientIdentifier:reason:reasonOverride:details:error:", v23, a5, a6, 0, a8);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __113__DNDSServer_remoteServiceProvider_invalidateModeAssertionWithUUID_reason_reasonOverride_clientIdentifier_error___block_invoke;
    v32 = &unk_1E86A5C70;
    v33 = v13;
    v34 = v15;
    v35 = a5;
    v36 = a6;
    -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", &v29, a8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "invalidations", v29, v30, v31, v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

uint64_t __113__DNDSServer_remoteServiceProvider_invalidateModeAssertionWithUUID_reason_reasonOverride_clientIdentifier_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v11[0] = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionUUIDs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", a1[5], 0);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v5, v7, 0, v6, a1[6], a1[7]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v8);
  return 1;
}

- (id)remoteServiceProvider:(id)a3 invalidateModeAssertionForClientIdentifier:(id)a4 reason:(unint64_t)a5 reasonOverride:(unint64_t)a6 details:(id)a7 error:(id *)a8
{
  return -[DNDSServer _invalidateModeAssertionForClientIdentifier:reason:reasonOverride:details:error:](self, "_invalidateModeAssertionForClientIdentifier:reason:reasonOverride:details:error:", a4, a5, a6, a7, a8);
}

- (id)_invalidateModeAssertionForClientIdentifier:(id)a3 reason:(unint64_t)a4 reasonOverride:(unint64_t)a5 details:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  id v22;
  unint64_t v23;
  unint64_t v24;

  v12 = a3;
  v13 = a6;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __94__DNDSServer__invalidateModeAssertionForClientIdentifier_reason_reasonOverride_details_error___block_invoke;
  v20[3] = &unk_1E86A85F0;
  v20[4] = self;
  v21 = v12;
  v22 = v13;
  v23 = a4;
  v24 = a5;
  v14 = v13;
  v15 = v12;
  -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", v20, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "invalidations");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

uint64_t __94__DNDSServer__invalidateModeAssertionForClientIdentifier_reason_reasonOverride_details_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1[4] + 384), "clientDetailsForIdentifier:", a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSModeAssertionInvalidationPredicate predicateForAssertionClientIdentifiers:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionClientIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", a1[5], 0);
  +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v7, v5, a1[6], v8, a1[7], a1[8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v9);

  return 1;
}

- (id)remoteServiceProvider:(id)a3 latestInvalidationWithClientIdentifer:(id)a4 error:(id *)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[DNDSClientDetailsProvider clientDetailsForIdentifier:](self->_clientDetailsProvider, "clientDetailsForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D1D628];
  objc_msgSend(v6, "identifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateForModeAssertionInvalidationsWithAssertionClientIdentifiers:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionManager modeAssertionInvalidationsMatchingPredicate:](self->_modeAssertionManager, "modeAssertionInvalidationsMatchingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)remoteServiceProvider:(id)a3 invalidateAllModeAssertionsTakenBeforeDate:(id)a4 forReason:(unint64_t)a5 clientIdentifier:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  unint64_t v21;

  v11 = a4;
  v12 = a6;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __112__DNDSServer_remoteServiceProvider_invalidateAllModeAssertionsTakenBeforeDate_forReason_clientIdentifier_error___block_invoke;
  v18[3] = &unk_1E86A72F0;
  v19 = v12;
  v20 = v11;
  v21 = a5;
  v13 = v11;
  v14 = v12;
  -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", v18, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "invalidations");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

uint64_t __112__DNDSServer_remoteServiceProvider_invalidateAllModeAssertionsTakenBeforeDate_forReason_clientIdentifier_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  +[DNDSModeAssertionInvalidationPredicate predicateForAnyAssertion](DNDSModeAssertionInvalidationPredicate, "predicateForAnyAssertion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D648]), "initWithClientIdentifier:deviceIdentifier:", a1[4], 0);
  +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:source:reason:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:source:reason:", v4, a1[5], v5, a1[6]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v6);

  return 1;
}

- (id)remoteServiceProvider:(id)a3 allActiveModeAssertionsWithError:(id *)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[DNDSServer _stateSystemSnapshot](self, "_stateSystemSnapshot", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assertions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __69__DNDSServer_remoteServiceProvider_allActiveModeAssertionsWithError___block_invoke;
  v9[3] = &unk_1E86A5BB0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "bs_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __69__DNDSServer_remoteServiceProvider_allActiveModeAssertionsWithError___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "activeAssertionUUIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "containsObject:", v5);
  return v6;
}

- (BOOL)remoteServiceProvider:(id)a3 setScreenIsShared:(BOOL)a4 screenIsMirrored:(BOOL)a5 withError:(id *)a6
{
  _BOOL8 v6;

  v6 = a5;
  -[DNDSAuxiliaryStateMonitor setScreenShared:](self->_auxiliaryStateMonitor, "setScreenShared:", a4);
  -[DNDSAuxiliaryStateMonitor setScreenMirrored:](self->_auxiliaryStateMonitor, "setScreenMirrored:", v6);
  return 1;
}

- (void)appFocusConfigurationCoordinator:(id)a3 didUpdateAppConfigurationContextForModeIdentifier:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;

  v10 = (unint64_t)a4;
  -[DNDSStateProvider lastCalculatedState](self->_stateProvider, "lastCalculatedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1D748], "fallbackState");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(v8, "activeModeIdentifier");
  v9 = objc_claimAutoreleasedReturnValue();
  if (!(v10 | v9) || v9 && objc_msgSend((id)v9, "isEqualToString:", v10))
    -[DNDSRemoteServiceProvider handleAppConfigurationContextUpdateForModeIdentifier:](self->_serviceProvider, "handleAppConfigurationContextUpdateForModeIdentifier:", v10);

}

- (id)currentStateForAppFocusConfigurationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[DNDSStateProvider lastCalculatedState](self->_stateProvider, "lastCalculatedState", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1D748], "fallbackState");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)currentStateForSystemFocusConfigurationCoordinator:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[DNDSStateProvider lastCalculatedState](self->_stateProvider, "lastCalculatedState", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1D748], "fallbackState");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)remoteServiceProvider:(id)a3 behaviorSettingsWithError:(id *)a4
{
  DNDSSettingsManager *settingsManager;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[8];
  id v12;

  settingsManager = self->_settingsManager;
  v12 = 0;
  -[DNDSSettingsManager behaviorSettingsWithError:](settingsManager, "behaviorSettingsWithError:", &v12);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (unint64_t)v12;
  v8 = (void *)v7;
  if (v6 | v7)
  {
    if (a4 && v7)
      *a4 = objc_retainAutorelease((id)v7);
  }
  else
  {
    v6 = (uint64_t)objc_alloc_init(MEMORY[0x1E0D1D5A0]);
    v9 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "No behavior settings in settings manager, will return default settings", v11, 2u);
    }
  }

  return (id)v6;
}

- (BOOL)remoteServiceProvider:(id)a3 setBehaviorSettings:(id)a4 withError:(id *)a5
{
  return -[DNDSSettingsManager setBehaviorSettings:withError:](self->_settingsManager, "setBehaviorSettings:withError:", a4, a5);
}

- (id)remoteServiceProvider:(id)a3 scheduleSettingsWithError:(id *)a4
{
  id v4;
  NSObject *v5;
  uint8_t v7[16];

  -[DNDSServer _scheduleSettingsFromDefaultScheduleTrigger](self, "_scheduleSettingsFromDefaultScheduleTrigger", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D1D738]);
    v5 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "No schedule settings in settings manager, will return default settings", v7, 2u);
    }
  }
  return v4;
}

- (BOOL)remoteServiceProvider:(id)a3 setScheduleSettings:(id)a4 withError:(id *)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSScheduleSettings settingsWithClientSettings:creationDate:](DNDSScheduleSettings, "settingsWithClientSettings:creationDate:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[DNDSServer _setDefaultScheduleTriggerWithScheduleSettings:](self, "_setDefaultScheduleTriggerWithScheduleSettings:", v9);
  return (char)self;
}

- (id)currentlyActivePairedDeviceForSyncManager:(id)a3
{
  return -[DNDSPairedDeviceStateMonitor pairedDevice](self->_pairedDeviceStateMonitor, "pairedDevice", a3);
}

- (id)pairedCloudDevicesForSyncManager:(id)a3
{
  void *v4;
  void *v5;

  -[DNDSSettingsManager syncSettingsWithError:](self->_settingsManager, "syncSettingsWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isCloudSyncEnabled")
    || (-[DNDSPairedDeviceStateMonitor cloudDevices](self->_pairedDeviceStateMonitor, "cloudDevices"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEBUG))
    -[DNDSServer pairedCloudDevicesForSyncManager:].cold.1();

  return v5;
}

- (id)pairedDevicesForSyncManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];

  -[DNDSSettingsManager syncSettingsWithError:](self->_settingsManager, "syncSettingsWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "isCloudSyncEnabled")
    || (-[DNDSPairedDeviceStateMonitor cloudDevices](self->_pairedDeviceStateMonitor, "cloudDevices"),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (objc_msgSend(v4, "isPairSyncEnabled"))
  {
    -[DNDSPairedDeviceStateMonitor pairedDevice](self->_pairedDeviceStateMonitor, "pairedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "setByAddingObject:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    else
    {
      v8 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "No default paired device", v10, 2u);
      }
    }

  }
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEBUG))
    -[DNDSServer pairedDevicesForSyncManager:].cold.1();

  return v5;
}

- (id)syncManager:(id)a3 deviceForDeviceIdentifier:(id)a4
{
  void *v5;
  void *v6;

  -[DNDSPairedDeviceStateMonitor pairedDeviceForDeviceIdentifier:](self->_pairedDeviceStateMonitor, "pairedDeviceForDeviceIdentifier:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSettingsManager syncSettingsWithError:](self->_settingsManager, "syncSettingsWithError:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "syncServiceType") == 2 && !objc_msgSend(v6, "isCloudSyncEnabled")
    || objc_msgSend(v5, "syncServiceType") == 1 && (objc_msgSend(v6, "isPairSyncEnabled") & 1) == 0)
  {

    v5 = 0;
  }

  return v5;
}

- (id)syncManager:(id)a3 updateOutboundModeAssertion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  DNDSModeConfigurationManager *modeConfigurationManager;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  modeConfigurationManager = self->_modeConfigurationManager;
  objc_msgSend(v7, "modeIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "lastModified");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11
      && (objc_msgSend(MEMORY[0x1E0C99D68], "distantPast"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "isEqualToDate:", v12),
          v12,
          (v13 & 1) == 0))
    {
      objc_msgSend(v10, "lastModified");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setModeConfigurationModifiedDate:", v20);

      v21 = objc_alloc(MEMORY[0x1E0D1D5F8]);
      objc_msgSend(v5, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "source");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v21, "initWithUUID:startDate:details:source:", v22, v23, v7, v24);

      v25 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_INFO))
      {
        v26 = 138412546;
        v27 = v11;
        v28 = 2112;
        v29 = v17;
        _os_log_impl(&dword_1CB895000, v25, OS_LOG_TYPE_INFO, "Updated mode modifification date to %@ on assertion %@", (uint8_t *)&v26, 0x16u);
      }
    }
    else
    {
      v14 = (void *)DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        objc_msgSend(v7, "modeIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412546;
        v27 = v16;
        v28 = 2112;
        v29 = (uint64_t)v11;
        _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "%@ configuration doesn't have a useful modification date: %@", (uint8_t *)&v26, 0x16u);

      }
      v17 = (uint64_t)v5;
    }

    v5 = (id)v17;
  }
  else
  {
    v18 = (void *)DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_FAULT))
      -[DNDSServer syncManager:updateOutboundModeAssertion:].cold.1(v18, v7);
  }

  return v5;
}

- (id)syncManager:(id)a3 scheduleSettingsForModeIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[DNDSServer _scheduleSettingsForModeConfigurations](self, "_scheduleSettingsForModeConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isCloudSyncDisabledForSyncManager:(id)a3
{
  void *v3;
  char v4;

  -[DNDSSettingsManager syncSettingsWithError:](self->_settingsManager, "syncSettingsWithError:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCloudSyncEnabled") ^ 1;

  return v4;
}

- (void)syncManager:(id)a3 performModeAssertionUpdatesWithHandler:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", a4, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v7)
  {
    +[DNDSModeAssertionUpdateResult emptyResult](DNDSModeAssertionUpdateResult, "emptyResult");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "isEqual:", v9);

    if ((v10 & 1) == 0)
    {
      v11 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v6;
        _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Performed update for sync manager; manager=%{public}@",
          buf,
          0xCu);
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
  {
    -[DNDSServer syncManager:performModeAssertionUpdatesWithHandler:].cold.1();
  }

}

- (void)syncManager:(id)a3 prepareForSyncToDevices:(id)a4
{
  NSObject *v5;
  uint8_t v6[16];

  if (objc_msgSend(a4, "bs_containsObjectPassingTest:", &__block_literal_global_153))
  {
    -[DNDSSyncEngine sendChangesWithCompletionHandler:](self->_syncEngine, "sendChangesWithCompletionHandler:", &__block_literal_global_155);
  }
  else
  {
    v5 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Not requesting cloud sync because the Focus sync does not target any cloud devices.", v6, 2u);
    }
  }
}

BOOL __50__DNDSServer_syncManager_prepareForSyncToDevices___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "syncServiceType") == 2;
}

void __50__DNDSServer_syncManager_prepareForSyncToDevices___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  v3 = DNDSLogGeneral;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
      __50__DNDSServer_syncManager_prepareForSyncToDevices___block_invoke_2_cold_1();
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Completed settings sync for Focus sync.", v4, 2u);
  }

}

- (id)currentStateForLegacyAssertionSyncManager:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[DNDSStateProvider lastCalculatedState](self->_stateProvider, "lastCalculatedState", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1D748], "fallbackState");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)phoneCallBypassSettingsForSyncManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self->_modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", *MEMORY[0x1E0D1D3C0], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "phoneCallBypassSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v4;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Sync manager gets bypass settings; manager=%{public}@, settings=%{public}@",
      (uint8_t *)&v10,
      0x16u);
  }

  return v7;
}

- (id)scheduleSettingsForSyncManager:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;

  -[DNDSServer _scheduleSettingsFromDefaultScheduleTrigger](self, "_scheduleSettingsFromDefaultScheduleTrigger", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0D1D738]);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[DNDSScheduleSettings settingsWithClientSettings:creationDate:](DNDSScheduleSettings, "settingsWithClientSettings:creationDate:", v6, v7);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (void)syncManager:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  DNDSModeConfigurationManager *modeConfigurationManager;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  DNDSModeConfigurationManager *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Received updated bypass settings via sync; manager=%{public}@, settings=%{public}@",
      buf,
      0x16u);
  }
  modeConfigurationManager = self->_modeConfigurationManager;
  v10 = *MEMORY[0x1E0D1D3C0];
  v19 = 0;
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", v10, &v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v19;
  if (v12)
  {
    v13 = v12;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
      -[DNDSServer syncManager:didReceiveUpdatedPhoneCallBypassSettings:].cold.2();
  }
  else
  {
    v14 = (void *)objc_msgSend(v11, "mutableCopy");
    objc_msgSend(v14, "configuration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(v15, "mutableCopy");

    objc_msgSend(v16, "setPhoneCallBypassSettings:", v7);
    objc_msgSend(v14, "setConfiguration:", v16);
    v17 = self->_modeConfigurationManager;
    v18 = 0;
    -[DNDSModeConfigurationManager setModeConfiguration:withError:](v17, "setModeConfiguration:withError:", v14, &v18);
    v13 = v18;
    if (v13 && os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
      -[DNDSServer syncManager:didReceiveUpdatedPhoneCallBypassSettings:].cold.1();

  }
}

- (void)syncManager:(id)a3 didReceiveUpdatedScheduleSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Received updated schedule settings via sync; manager=%{public}@, settings=%{public}@",
      (uint8_t *)&v9,
      0x16u);
  }
  -[DNDSServer _setDefaultScheduleTriggerWithScheduleSettings:](self, "_setDefaultScheduleTriggerWithScheduleSettings:", v7);

}

- (void)settingsManager:(id)a3 didReceiveUpdatedBehaviorSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "DND behavior settings changed, will refresh state; manager=%{public}@, settings=%{public}@",
      buf,
      0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__DNDSServer_settingsManager_didReceiveUpdatedBehaviorSettings___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);
  -[DNDSRemoteServiceProvider handleUpdatedBehaviorSettings:](self->_serviceProvider, "handleUpdatedBehaviorSettings:", v7);

}

uint64_t __64__DNDSServer_settingsManager_didReceiveUpdatedBehaviorSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 1, 1);
}

- (void)settingsManager:(id)a3 didReceiveUpdatedPhoneCallBypassSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138543618;
    v10 = v6;
    v11 = 2114;
    v12 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "DND phone call bypass settings changed, will refresh state; manager=%{public}@, settings=%{public}@",
      (uint8_t *)&v9,
      0x16u);
  }
  -[DNDSRemoteServiceProvider handleUpdatedPhoneCallBypassSettings:](self->_serviceProvider, "handleUpdatedPhoneCallBypassSettings:", v7);
  -[DNDSSettingsSyncManager update](self->_settingsSyncManager, "update");

}

- (void)settingsManager:(id)a3 didReceiveUpdatedScheduleSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v12 = v6;
    v13 = 2114;
    v14 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "DND schedule settings changed, will refresh state; manager=%{public}@, settings=%{public}@",
      buf,
      0x16u);
  }
  -[DNDSRemoteServiceProvider handleUpdatedScheduleSettings:](self->_serviceProvider, "handleUpdatedScheduleSettings:", v7);
  -[DNDSSettingsSyncManager update](self->_settingsSyncManager, "update");
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__DNDSServer_settingsManager_didReceiveUpdatedScheduleSettings___block_invoke;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);

}

uint64_t __64__DNDSServer_settingsManager_didReceiveUpdatedScheduleSettings___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 1, 1);
}

- (void)settingsManager:(id)a3 didReceiveUpdatedSyncSettings:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  int v9;
  _BOOL4 v10;
  uint64_t v11;
  DNDSUserAvailabilityCoordinator *userAvailabilityCoordinator;
  void *v13;
  void *v14;
  DNDSUserAvailabilityCoordinator *v15;
  NSObject *queue;
  _QWORD block[5];
  _QWORD v18[5];
  _QWORD v19[5];
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v21 = v6;
    v22 = 2114;
    v23 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Sync settings updated; manager=%{public}@, settings=%{public}@",
      buf,
      0x16u);
  }
  -[DNDSSyncEngine setSyncPreferenceEnabled:](self->_syncEngine, "setSyncPreferenceEnabled:", objc_msgSend(v7, "isCloudSyncEnabled"));
  v9 = objc_msgSend(v7, "isCloudSyncEnabled");
  v10 = -[DNDSGlobalConfigurationManager getModesCanImpactAvailabilityReturningError:](self->_globalConfigurationManager, "getModesCanImpactAvailabilityReturningError:", 0);
  v11 = MEMORY[0x1E0C809B0];
  if (v9)
  {
    if (v10)
    {
      userAvailabilityCoordinator = self->_userAvailabilityCoordinator;
      -[DNDSModeConfigurationManager relevantContacts](self->_modeConfigurationManager, "relevantContacts");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "allObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v11;
      v19[1] = 3221225472;
      v19[2] = __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke;
      v19[3] = &unk_1E86A8538;
      v19[4] = self;
      -[DNDSUserAvailabilityCoordinator resumeUpdatingInvitationsForContacts:completionHandler:](userAvailabilityCoordinator, "resumeUpdatingInvitationsForContacts:completionHandler:", v14, v19);

    }
  }
  else if (v10)
  {
    v15 = self->_userAvailabilityCoordinator;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke_2;
    v18[3] = &unk_1E86A8538;
    v18[4] = self;
    -[DNDSUserAvailabilityCoordinator suspendWithOverrideSetting:completionHandler:](v15, "suspendWithOverrideSetting:completionHandler:", 1, v18);
  }
  queue = self->_queue;
  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke_3;
  block[3] = &unk_1E86A5970;
  block[4] = self;
  dispatch_async(queue, block);

}

void __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "availability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAvailable");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "lastCalculatedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeModeConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType(objc_msgSend(v8, "semanticType"));

  }
  else
  {
    v9 = -2;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);

}

void __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "availability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAvailable");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "lastCalculatedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeModeConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType(objc_msgSend(v8, "semanticType"));

  }
  else
  {
    v9 = -2;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);

}

uint64_t __60__DNDSServer_settingsManager_didReceiveUpdatedSyncSettings___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_handlePairedDeviceAndSyncSettingsChange");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:options:", 1, 1, 1);
}

- (void)modeConfigurationManager:(id)a3 didUpdateAvailableModes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSObject *queue;
  void *v25;
  _QWORD block[5];
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v30 = v6;
    v31 = 2114;
    v32 = v7;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "Available modes updated; manager=%{public}@, modes=%{public}@",
      buf,
      0x16u);
  }
  -[DNDSSettingsSyncManager update](self->_settingsSyncManager, "update");
  -[DNDSAppForegroundTriggerManager refresh](self->_appForegroundTriggerManager, "refresh");
  -[DNDSDrivingTriggerManager refresh](self->_drivingTriggerManager, "refresh");
  -[DNDSGamingTriggerManager refresh](self->_gamingTriggerManager, "refresh");
  -[DNDSMindfulnessTriggerManager refresh](self->_mindfulnessTriggerManager, "refresh");
  -[DNDSSleepingTriggerManager refresh](self->_sleepingTriggerManager, "refresh");
  -[DNDSSmartTriggerManager refresh](self->_smartTriggerManager, "refresh");
  -[DNDSWorkoutTriggerManager refresh](self->_workoutTriggerManager, "refresh");
  -[DNDSServer _allModes](self, "_allModes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSRemoteServiceProvider handleUpdatedModes:availableModes:](self->_serviceProvider, "handleUpdatedModes:availableModes:", v9, v7);
  -[DNDSAppConfigurationManager refreshWithAvailableModes:](self->_appConfigurationManager, "refreshWithAvailableModes:", v7);
  objc_msgSend(v6, "relevantApplicationIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSAppInfoCache monitorApplicationIdentifiers:](self->_appInfoCache, "monitorApplicationIdentifiers:", v10);
  v11 = (void *)MEMORY[0x1E0D1D5F8];
  objc_msgSend(v7, "bs_map:", &__block_literal_global_157);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateForModeAssertionsWithModeIdentifiersNotContainedIn:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSModeAssertionManager modeAssertionsMatchingPredicate:](self->_modeAssertionManager, "modeAssertionsMatchingPredicate:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bs_compactMap:", &__block_literal_global_159);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_3;
    v27[3] = &unk_1E86A6C70;
    v28 = v15;
    -[DNDSServer _updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:](self, "_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:error:", v27, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v16, "assertions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {

  }
  else
  {
    objc_msgSend(v16, "invalidations");
    v25 = v13;
    v18 = v7;
    v19 = v10;
    v20 = v9;
    v21 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    v6 = v21;
    v9 = v20;
    v10 = v19;
    v7 = v18;
    v13 = v25;

    if (!v23)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_4;
      block[3] = &unk_1E86A5970;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }

}

uint64_t __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modeIdentifier");
}

id __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[DNDSModeAssertionInvalidationPredicate predicateForAssertionUUIDs:](DNDSModeAssertionInvalidationPredicate, "predicateForAssertionUUIDs:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D1D648]);
  v7 = (void *)objc_msgSend(v6, "initWithClientIdentifier:deviceIdentifier:", *MEMORY[0x1E0D1D530], 0);
  +[DNDSModeAssertionInvalidationRequest requestWithPredicate:requestDate:details:source:reason:reasonOverride:](DNDSModeAssertionInvalidationRequest, "requestWithPredicate:requestDate:details:source:reason:reasonOverride:", v5, v4, 0, v7, 2, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "invalidateAssertionsForRequest:", v8);

  return 1;
}

uint64_t __63__DNDSServer_modeConfigurationManager_didUpdateAvailableModes___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 4, 1);
}

- (void)modeConfigurationManager:(id)a3 didModifyAvailableMode:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  NSObject *v14;
  _BOOL4 v15;
  uint8_t v16[16];
  uint8_t buf[16];

  v5 = a4;
  -[DNDSStateProvider lastCalculatedState](self->_stateProvider, "lastCalculatedState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D1D748], "fallbackState");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  if (objc_msgSend(v9, "isActive"))
  {
    objc_msgSend(v5, "modeIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activeModeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (v12)
    {
      v13 = -[DNDSSyncEngine hasLocalChanges](self->_syncEngine, "hasLocalChanges");
      v14 = DNDSLogGeneral;
      v15 = os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Settings for this mode changed. Forcing a sync to all devices.", buf, 2u);
        }
        -[DNDSAssertionSyncManager forceUpdateAllDevices](self->_assertionSyncManager, "forceUpdateAllDevices");
      }
      else if (v15)
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1CB895000, v14, OS_LOG_TYPE_DEFAULT, "Skipping forced update for settings change because they were not local changes.", v16, 2u);
      }
    }
  }

}

- (void)modeConfigurationManager:(id)a3 didModifyExceptionsForContacts:(id)a4 forModeConfiguration:(id)a5
{
  DNDSUserAvailabilityCoordinator *userAvailabilityCoordinator;
  id v6;

  userAvailabilityCoordinator = self->_userAvailabilityCoordinator;
  objc_msgSend(a4, "allKeys", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[DNDSUserAvailabilityCoordinator sendStatusKitInvitationsForContacts:completionHandler:](userAvailabilityCoordinator, "sendStatusKitInvitationsForContacts:completionHandler:", v6, 0);

}

- (void)pairedDeviceStateMonitor:(id)a3 pairingChangedFromDevice:(id)a4 toDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  DNDSServer *v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __73__DNDSServer_pairedDeviceStateMonitor_pairingChangedFromDevice_toDevice___block_invoke;
  v15[3] = &unk_1E86A6AB0;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v19 = self;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __73__DNDSServer_pairedDeviceStateMonitor_pairingChangedFromDevice_toDevice___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v7 = 138543874;
    v8 = v3;
    v9 = 2114;
    v10 = v4;
    v11 = 2114;
    v12 = v5;
    _os_log_impl(&dword_1CB895000, v2, OS_LOG_TYPE_DEFAULT, "Paired devices updated; monitor=%{public}@, previousDevice=%{public}@, device=%{public}@",
      (uint8_t *)&v7,
      0x20u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 144), "pairedDeviceDidChange");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 224), "pairedDeviceDidChange");
  objc_msgSend(*(id *)(a1 + 56), "_queue_handlePairedDeviceAndSyncSettingsChange");
  return objc_msgSend(*(id *)(a1 + 56), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 1, 1);
}

- (void)pairedDeviceStateMonitor:(id)a3 cloudPairingChangedFromDevices:(id)a4 toDevices:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD, _QWORD);
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v19 = v8;
    v20 = 2114;
    v21 = v9;
    v22 = 2114;
    v23 = v10;
    _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Cloud devices changed; monitor=%{public}@, previousDevices=%{public}@, devices=%{public}@",
      buf,
      0x20u);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__DNDSServer_pairedDeviceStateMonitor_cloudPairingChangedFromDevices_toDevices___block_invoke;
  v15[3] = &unk_1E86A86B8;
  v15[4] = self;
  v16 = v10;
  v17 = v9;
  v12 = v9;
  v13 = v10;
  v14 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A0D58](v15);
  ((void (**)(_QWORD, DNDSAssertionSyncManager *))v14)[2](v14, self->_assertionSyncManager);
  ((void (**)(_QWORD, DNDSAssertionSyncManager *))v14)[2](v14, self->_legacyAssertionSyncManager);

}

void __80__DNDSServer_pairedDeviceStateMonitor_cloudPairingChangedFromDevices_toDevices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(void **)(a1 + 40);
    v5 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__DNDSServer_pairedDeviceStateMonitor_cloudPairingChangedFromDevices_toDevices___block_invoke_2;
    block[3] = &unk_1E86A58D0;
    v7 = v4;
    v8 = *(id *)(a1 + 48);
    v9 = v3;
    dispatch_async(v5, block);

  }
}

void __80__DNDSServer_pairedDeviceStateMonitor_cloudPairingChangedFromDevices_toDevices___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "mutableCopy");
  objc_msgSend(v4, "minusSet:", *(_QWORD *)(a1 + 40));
  v2 = *(void **)(a1 + 48);
  objc_msgSend(v4, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateDevices:", v3);

}

- (BOOL)remoteServiceProvider:(id)a3 setPreventAutoReply:(BOOL)a4 withError:(id *)a5
{
  return -[DNDSGlobalConfigurationManager setPreventAutoReply:withError:](self->_globalConfigurationManager, "setPreventAutoReply:withError:", a4, a5);
}

- (BOOL)remoteServiceProvider:(id)a3 getPreventAutoReplyReturningError:(id *)a4
{
  return -[DNDSGlobalConfigurationManager getPreventAutoReplyReturningError:](self->_globalConfigurationManager, "getPreventAutoReplyReturningError:", a4);
}

- (BOOL)remoteServiceProvider:(id)a3 setModesCanImpactAvailability:(BOOL)a4 withError:(id *)a5
{
  return -[DNDSGlobalConfigurationManager setModesCanImpactAvailability:withError:](self->_globalConfigurationManager, "setModesCanImpactAvailability:withError:", a4, a5);
}

- (BOOL)remoteServiceProvider:(id)a3 getModesCanImpactAvailabilityReturningError:(id *)a4
{
  return -[DNDSGlobalConfigurationManager getModesCanImpactAvailabilityReturningError:](self->_globalConfigurationManager, "getModesCanImpactAvailabilityReturningError:", a4);
}

- (unint64_t)remoteServiceProvider:(id)a3 getCloudSyncStateReturningError:(id *)a4
{
  return -[DNDSSyncEngine cloudSyncState](self->_syncEngine, "cloudSyncState", a3, a4);
}

- (BOOL)remoteServiceProvider:(id)a3 setCloudSyncPreferenceEnabled:(BOOL)a4 withError:(id *)a5
{
  _BOOL4 v6;
  void *v8;
  DNDSModeConfigurationManager *modeConfigurationManager;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  DNDSModeConfigurationManager *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v28;
  id *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t buf[4];
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v6 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBool:forKey:", !v6, CFSTR("disableCloudSync"));

  if (!v6)
  {
    modeConfigurationManager = self->_modeConfigurationManager;
    v35 = 0;
    -[DNDSModeConfigurationManager modeConfigurationsWithError:](modeConfigurationManager, "modeConfigurationsWithError:", &v35);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v35;
    if (v11)
    {
      v12 = v11;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
        -[DNDSServer remoteServiceProvider:setCloudSyncPreferenceEnabled:withError:].cold.1();
    }
    else
    {
      v28 = v10;
      v29 = a5;
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(v10, "allValues");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v32;
        v17 = *MEMORY[0x1E0D1D3A8];
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v32 != v16)
              objc_enumerationMutation(v13);
            v19 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
            if ((objc_msgSend(v19, "isSupportedConfiguration") & 1) == 0)
            {
              v20 = (void *)objc_msgSend(v19, "mutableCopy");
              objc_msgSend(v20, "setCompatibilityVersion:", v17);
              if ((objc_msgSend(v20, "isSupportedConfiguration") & 1) == 0)
              {
                objc_msgSend(v20, "triggers");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "bs_filter:", &__block_literal_global_165);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setTriggers:", v22);

              }
              v23 = self->_modeConfigurationManager;
              v30 = 0;
              -[DNDSModeConfigurationManager setModeConfiguration:withError:](v23, "setModeConfiguration:withError:", v20, &v30);
              v24 = v30;
              if (v24)
              {
                v25 = v24;
                v26 = DNDSLogGeneral;
                if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543362;
                  v37 = v25;
                  _os_log_error_impl(&dword_1CB895000, v26, OS_LOG_TYPE_ERROR, "Unable to reset incompatible mode configuration: error=%{public}@", buf, 0xCu);
                }

              }
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
        }
        while (v15);
      }

      v12 = 0;
      v10 = v28;
      a5 = v29;
    }
    if (a5)
      *a5 = objc_retainAutorelease(v12);

  }
  return 1;
}

BOOL __76__DNDSServer_remoteServiceProvider_setCloudSyncPreferenceEnabled_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "compatibilityVersion");
  return v2 < *MEMORY[0x1E0D1D3A8];
}

- (unint64_t)remoteServiceProvider:(id)a3 getPairSyncStateReturningError:(id *)a4
{
  return -[DNDSIDSSyncEngine pairSyncState](self->_idsSyncEngine, "pairSyncState", a3, a4);
}

- (BOOL)remoteServiceProvider:(id)a3 setPairSyncPreferenceEnabled:(BOOL)a4 withError:(id *)a5
{
  -[DNDSSettingsManager setPairSyncEnabled:](self->_settingsManager, "setPairSyncEnabled:", a4);
  return 1;
}

- (id)remoteServiceProvider:(id)a3 getAccountFeatureSupportWithError:(id *)a4
{
  return -[DNDSPairedDeviceStateMonitor accountFeatureSupport](self->_pairedDeviceStateMonitor, "accountFeatureSupport", a3, a4);
}

- (void)remoteServiceProvider:(id)a3 didChangeFocusStatusSharingSettingForApplicationIdentifier:(id)a4
{
  DNDSUserAvailabilityCoordinator *userAvailabilityCoordinator;
  objc_class *v6;
  id v7;
  void *v8;
  _QWORD v9[5];

  userAvailabilityCoordinator = self->_userAvailabilityCoordinator;
  v6 = (objc_class *)MEMORY[0x1E0D1D598];
  v7 = a4;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithBundleID:", v7);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __95__DNDSServer_remoteServiceProvider_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke;
  v9[3] = &unk_1E86A8538;
  v9[4] = self;
  -[DNDSUserAvailabilityCoordinator coordinateUserAvailabilityUpdateForApplicationIdentifier:forced:completionHandler:](userAvailabilityCoordinator, "coordinateUserAvailabilityUpdateForApplicationIdentifier:forced:completionHandler:", v8, 1, v9);

}

void __95__DNDSServer_remoteServiceProvider_didChangeFocusStatusSharingSettingForApplicationIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(a2, "availability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isAvailable");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "lastCalculatedState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeModeConfiguration");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType(objc_msgSend(v8, "semanticType"));

  }
  else
  {
    v9 = -2;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  DNDSPowerLogFocusStatusChangeEvent(v10, v6, 0, 0, v9, a3);

}

- (id)remoteServiceProvider:(id)a3 modeConfigurationForModeIdentifier:(id)a4 withError:(id *)a5
{
  return -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self->_modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", a4, a5);
}

- (id)remoteServiceProvider:(id)a3 modeConfigurationsWithError:(id *)a4
{
  return -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", a4);
}

- (BOOL)remoteServiceProvider:(id)a3 removeModeConfigurationWithModeIdentifier:(id)a4 deletePlaceholder:(BOOL)a5 withError:(id *)a6
{
  return -[DNDSModeConfigurationManager removeModeConfigurationForModeIdentifier:deletePlaceholder:withError:](self->_modeConfigurationManager, "removeModeConfigurationForModeIdentifier:deletePlaceholder:withError:", a4, a5, a6);
}

- (BOOL)remoteServiceProvider:(id)a3 setModeConfiguration:(id)a4 withError:(id *)a5
{
  return -[DNDSModeConfigurationManager setModeConfiguration:withError:](self->_modeConfigurationManager, "setModeConfiguration:withError:", a4, a5);
}

- (id)remoteServiceProvider:(id)a3 allModesReturningError:(id *)a4
{
  void *v5;

  -[DNDSServer _allModes](self, "_allModes", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSIDSSyncEngine sync](self->_idsSyncEngine, "sync");
  -[DNDSSyncEngine fetchChanges:withCompletionHandler:](self->_syncEngine, "fetchChanges:withCompletionHandler:", 0, &__block_literal_global_167);
  return v5;
}

void __59__DNDSServer_remoteServiceProvider_allModesReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  v3 = DNDSLogCloudSync;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      __59__DNDSServer_remoteServiceProvider_allModesReturningError___block_invoke_cold_1();
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Fetched changes", v4, 2u);
  }

}

- (id)remoteServiceProvider:(id)a3 availableModesReturningError:(id *)a4
{
  -[DNDSIDSSyncEngine sync](self->_idsSyncEngine, "sync", a3);
  -[DNDSSyncEngine fetchChanges:withCompletionHandler:](self->_syncEngine, "fetchChanges:withCompletionHandler:", 0, &__block_literal_global_168);
  return -[DNDSModeConfigurationManager availableModesFilteringPlaceholders:returningError:](self->_modeConfigurationManager, "availableModesFilteringPlaceholders:returningError:", 1, a4);
}

void __65__DNDSServer_remoteServiceProvider_availableModesReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  v3 = DNDSLogCloudSync;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      __59__DNDSServer_remoteServiceProvider_allModesReturningError___block_invoke_cold_1();
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Fetched changes", v4, 2u);
  }

}

- (BOOL)remoteServiceProvider:(id)a3 syncModeConfigurationsReturningError:(id *)a4
{
  NSObject *v5;
  uint8_t v7[16];

  v5 = DNDSLogCloudSync;
  if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CB895000, v5, OS_LOG_TYPE_DEFAULT, "Forcing cloud sync", v7, 2u);
  }
  -[DNDSIDSSyncEngine sync](self->_idsSyncEngine, "sync");
  -[DNDSSyncEngine sync:withCompletionHandler:](self->_syncEngine, "sync:withCompletionHandler:", 1, &__block_literal_global_169);
  return 1;
}

void __73__DNDSServer_remoteServiceProvider_syncModeConfigurationsReturningError___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  v3 = DNDSLogCloudSync;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_ERROR))
      __73__DNDSServer_remoteServiceProvider_syncModeConfigurationsReturningError___block_invoke_cold_1();
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogCloudSync, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Sent changes", v4, 2u);
  }

}

- (id)remoteServiceProvider:(id)a3 allowedModesForContactHandle:(id)a4 withError:(id *)a5
{
  return -[DNDSUserAvailabilityCoordinator allowedModesForContactHandle:withError:](self->_userAvailabilityCoordinator, "allowedModesForContactHandle:withError:", a4, a5);
}

- (id)remoteServiceProvider:(id)a3 silencedModesForContactHandle:(id)a4 withError:(id *)a5
{
  return -[DNDSUserAvailabilityCoordinator silencedModesForContactHandle:withError:](self->_userAvailabilityCoordinator, "silencedModesForContactHandle:withError:", a4, a5);
}

- (BOOL)remoteServiceProvider:(id)a3 userAvailabilityInActiveModeForContactHandle:(id)a4 withError:(id *)a5
{
  return -[DNDSUserAvailabilityCoordinator userAvailabilityInActiveModeForContactHandle:withError:](self->_userAvailabilityCoordinator, "userAvailabilityInActiveModeForContactHandle:withError:", a4, a5);
}

- (id)remoteServiceProvider:(id)a3 publishStatusKitAvailabilityReturningError:(id *)a4
{
  void *v4;
  void *v5;

  -[DNDSUserAvailabilityCoordinator publishStatusKitAvailabilityReturningError:](self->_userAvailabilityCoordinator, "publishStatusKitAvailabilityReturningError:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)remoteAvailabilityServiceProvider:(id)a3 isLocalUserAvailableForApplicationIdentifier:(id)a4 withError:(id *)a5
{
  return -[DNDSUserAvailabilityCoordinator isLocalUserAvailableForApplicationIdentifier:withError:](self->_userAvailabilityCoordinator, "isLocalUserAvailableForApplicationIdentifier:withError:", a4, a5);
}

- (BOOL)remoteAppConfigurationServiceProvider:(id)a3 invalidateAppContextForActionIdentifier:(id)a4 bundleIdentifier:(id)a5 withError:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = a4;
  v9 = a5;
  -[DNDSStateProvider lastCalculatedState](self->_stateProvider, "lastCalculatedState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "activeModeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D598]), "initWithBundleID:", v9);
    -[DNDSAppConfigurationManager invalidateAppContextForActionIdentifier:applicationIdentifier:modeIdentifier:](self->_appConfigurationManager, "invalidateAppContextForActionIdentifier:applicationIdentifier:modeIdentifier:", v8, v12, v11);

  }
  return 1;
}

- (id)remoteServiceProvider:(id)a3 getAppInfoForBundleIdentifier:(id)a4 withError:(id *)a5
{
  return -[DNDSAppInfoCache appInfoForBundleIdentifier:](self->_appInfoCache, "appInfoForBundleIdentifier:", a4);
}

- (id)remoteServiceProvider:(id)a3 getAppInfoForBundleIdentifiers:(id)a4 withError:(id *)a5
{
  DNDSAppInfoCache *appInfoCache;
  void *v6;
  void *v7;
  void *v8;

  appInfoCache = self->_appInfoCache;
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSAppInfoCache appInfoForBundleIdentifiers:](appInfoCache, "appInfoForBundleIdentifiers:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)remoteServiceProvider:(id)a3 currentMeDeviceStateWithError:(id *)a4
{
  return -[DNDSMeDeviceService meDeviceState](self->_meDeviceService, "meDeviceState", a3, a4);
}

- (BOOL)remoteServiceProvider:(id)a3 setAppConfigurationPredicate:(id)a4 forActionIdentifier:(id)a5 forApplicationIdentifier:(id)a6 modeIdentifier:(id)a7 withError:(id *)a8
{
  void *v9;
  void *v10;

  -[DNDSAppConfigurationManager setPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:](self->_appConfigurationManager, "setPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:", a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a8)
    *a8 = objc_retainAutorelease(v9);

  return v10 == 0;
}

- (id)remoteServiceProvider:(id)a3 getAppConfigurationPredicateForActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withError:(id *)a7
{
  return -[DNDSAppConfigurationManager predicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:error:](self->_appConfigurationManager, "predicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:error:", a4, a5, a6, a7);
}

- (BOOL)remoteServiceProvider:(id)a3 setAppConfigurationTargetContentIdentifierPrefix:(id)a4 forActionIdentifier:(id)a5 forApplicationIdentifier:(id)a6 modeIdentifier:(id)a7 withError:(id *)a8
{
  void *v9;
  void *v10;

  -[DNDSAppConfigurationManager setTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:](self->_appConfigurationManager, "setTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:", a4, a5, a6, a7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a8)
    *a8 = objc_retainAutorelease(v9);

  return v10 == 0;
}

- (id)remoteServiceProvider:(id)a3 getAppConfigurationTargetContentIdentifierPrefixesForModeIdentifier:(id)a4 withError:(id *)a5
{
  return -[DNDSAppConfigurationManager targetContentIdentifierPrefixesForModeIdentifier:error:](self->_appConfigurationManager, "targetContentIdentifierPrefixesForModeIdentifier:error:", a4, a5);
}

- (BOOL)remoteServiceProvider:(id)a3 clearSystemConfigurationActionWithIdentifier:(id)a4 modeIdentifier:(id)a5 withError:(id *)a6
{
  void *v7;
  void *v8;

  -[DNDSAppConfigurationManager clearSystemActionWithIdentifier:modeIdentifier:](self->_appConfigurationManager, "clearSystemActionWithIdentifier:modeIdentifier:", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a6)
    *a6 = objc_retainAutorelease(v7);

  return v8 == 0;
}

- (id)remoteServiceProvider:(id)a3 getAppActionsForModeIdentifier:(id)a4 withError:(id *)a5
{
  return -[DNDSAppConfigurationManager appActionsForModeIdentifier:error:](self->_appConfigurationManager, "appActionsForModeIdentifier:error:", a4, a5);
}

- (BOOL)remoteServiceProvider:(id)a3 setAppAction:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withError:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  DNDSAppConfigurationManager *appConfigurationManager;
  void *v16;
  uint64_t v17;

  v11 = a5;
  v12 = a6;
  v13 = a4;
  objc_msgSend(v13, "action");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  appConfigurationManager = self->_appConfigurationManager;
  if (v14)
  {
    -[DNDSAppConfigurationManager setAppAction:forApplicationIdentifier:modeIdentifier:](appConfigurationManager, "setAppAction:forApplicationIdentifier:modeIdentifier:", v13, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v13, "identifier");
    v17 = objc_claimAutoreleasedReturnValue();

    -[DNDSAppConfigurationManager clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:](appConfigurationManager, "clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:", v17, v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)v17;
  }

  if (a7)
    *a7 = objc_retainAutorelease(v16);

  return v16 == 0;
}

- (BOOL)remoteServiceProvider:(id)a3 clearAppActionWithIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6 withError:(id *)a7
{
  void *v8;
  void *v9;

  -[DNDSAppConfigurationManager clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:](self->_appConfigurationManager, "clearAppActionWithIdentifier:forApplicationIdentifier:modeIdentifier:", a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a7)
    *a7 = objc_retainAutorelease(v8);

  return v9 == 0;
}

- (BOOL)remoteServiceProvider:(id)a3 setSystemAction:(id)a4 forModeIdentifier:(id)a5 withError:(id *)a6
{
  void *v7;
  void *v8;

  -[DNDSAppConfigurationManager setSystemAction:modeIdentifier:](self->_appConfigurationManager, "setSystemAction:modeIdentifier:", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a6)
    *a6 = objc_retainAutorelease(v7);

  return v8 == 0;
}

- (BOOL)remoteServiceProvider:(id)a3 clearSystemActionWithIdentifier:(id)a4 forModeIdentifier:(id)a5 withError:(id *)a6
{
  void *v7;
  void *v8;

  -[DNDSAppConfigurationManager clearSystemActionWithIdentifier:modeIdentifier:](self->_appConfigurationManager, "clearSystemActionWithIdentifier:modeIdentifier:", a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a6)
    *a6 = objc_retainAutorelease(v7);

  return v8 == 0;
}

- (id)remoteServiceProvider:(id)a3 getSystemActionsForModeIdentifier:(id)a4 withError:(id *)a5
{
  return -[DNDSAppConfigurationManager systemActionsForModeIdentifier:error:](self->_appConfigurationManager, "systemActionsForModeIdentifier:error:", a4, a5);
}

- (void)meDeviceService:(id)a3 didReceiveMeDeviceStateUpdate:(id)a4
{
  -[DNDSRemoteServiceProvider handleMeDeviceStateUpdate:](self->_serviceProvider, "handleMeDeviceStateUpdate:", a4);
}

- (void)reachabilityChangedTo:(BOOL)a3
{
  NSObject *v4;
  void (**v5)(_QWORD, _QWORD);
  _QWORD v6[5];
  uint8_t buf[16];

  if (a3)
  {
    v4 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Device regained internet connectivity. Queueing a current activity sync.", buf, 2u);
    }
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __36__DNDSServer_reachabilityChangedTo___block_invoke;
    v6[3] = &unk_1E86A8760;
    v6[4] = self;
    v5 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A0D58](v6);
    ((void (**)(_QWORD, DNDSAssertionSyncManager *))v5)[2](v5, self->_assertionSyncManager);
    ((void (**)(_QWORD, DNDSAssertionSyncManager *))v5)[2](v5, self->_legacyAssertionSyncManager);

  }
}

void __36__DNDSServer_reachabilityChangedTo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint8_t v7[16];
  _QWORD block[5];
  id v9;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(NSObject **)(v4 + 8);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36__DNDSServer_reachabilityChangedTo___block_invoke_2;
    block[3] = &unk_1E86A59E8;
    block[4] = v4;
    v9 = v3;
    dispatch_async(v5, block);

  }
  else
  {
    v6 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Device lost internet connectivity.", v7, 2u);
    }
  }

}

void __36__DNDSServer_reachabilityChangedTo___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "pairedCloudDevicesForSyncManager:", *(_QWORD *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(v4, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateDevices:", v3);

  }
}

- (void)_queue_resume
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDSPairedDeviceStateMonitor resume](self->_pairedDeviceStateMonitor, "resume");
  -[DNDSServer _queue_handlePairedDeviceAndSyncSettingsChange](self, "_queue_handlePairedDeviceAndSyncSettingsChange");
  -[DNDSServer _queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:](self, "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:", 4, 1);
  -[DNDSRemoteServiceProvider resume](self->_serviceProvider, "resume");
  -[DNDSRemoteAvailabilityServiceProvider resume](self->_availabilityServiceProvider, "resume");
  -[DNDSRemoteAppConfigurationServiceProvider resume](self->_appConfigurationServiceProvider, "resume");
}

- (void)_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:(unint64_t)a3 source:(int64_t)a4
{
  -[DNDSServer _queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:options:](self, "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:options:", a3, a4, 1);
}

- (void)_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:(unint64_t)a3 source:(int64_t)a4 options:(int64_t)a5
{
  DNDSServer *v5;
  void *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  STFocusStatusDomainPublisher *focusStatusDomainPublisher;
  id v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  void (**v44)(_QWORD, _QWORD);
  DNDSUserAvailabilityCoordinator *userAvailabilityCoordinator;
  DNDSServer *v46;
  void *v47;
  void *v49;
  void *v50;
  _QWORD v53[4];
  id v54;
  id v55;
  int64_t v56;
  unint64_t v57;
  _QWORD v58[4];
  id v59;
  _QWORD v60[4];
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v5 = self;
  v73 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDSScheduleManager refresh](v5->_scheduleManager, "refresh");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v7 = v5->_lifetimeMonitors;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v63;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v63 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * v11++), "refreshMonitorForDate:", v6);
      }
      while (v9 != v11);
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v9);
  }

  -[DNDSStateProvider lastCalculatedState](v5->_stateProvider, "lastCalculatedState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSServer _stateSystemSnapshot](v5, "_stateSystemSnapshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSStateProvider recalculateStateForSnapshot:](v5->_stateProvider, "recalculateStateForSnapshot:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activeModeIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v12, "activeModeConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_msgSend(v14, "activeModeIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v14, "activeModeConfiguration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v18, "mode");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    v21 = v20;
    objc_msgSend(v19, "modeIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "name");
    v49 = v18;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "symbolImageName");
    v46 = v5;
    v24 = v12;
    v25 = v14;
    v26 = v16;
    v27 = v13;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v67 = v22;
    v68 = 2112;
    v69 = v23;
    v70 = 2112;
    v71 = v28;
    _os_log_impl(&dword_1CB895000, v21, OS_LOG_TYPE_DEFAULT, "Sending modeIdentifier: %@, modeName:%@, symbolImageName: %@ to focusStatusDomainPublisher", buf, 0x20u);

    v13 = v27;
    v16 = v26;
    v14 = v25;
    v12 = v24;
    v5 = v46;

    v18 = v49;
  }
  focusStatusDomainPublisher = v5->_focusStatusDomainPublisher;
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke;
  v60[3] = &unk_1E86A8788;
  v30 = v19;
  v61 = v30;
  -[STFocusStatusDomainPublisher updateDataWithBlock:](focusStatusDomainPublisher, "updateDataWithBlock:", v60);
  if (v12 && (objc_msgSend(v12, "isEqual:", v14) & 1) == 0)
  {
    v50 = v18;
    v47 = v13;
    v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D760]), "initWithPreviousState:state:reason:source:options:", v12, v14, a3, a4, a5);
    v32 = (void *)DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
    {
      v33 = v32;
      objc_msgSend(v31, "previousState");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v34;
      _os_log_impl(&dword_1CB895000, v33, OS_LOG_TYPE_DEFAULT, "State was updated: previousState=%{public}@", buf, 0xCu);

    }
    v35 = (void *)DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
    {
      v36 = v35;
      objc_msgSend(v31, "state");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v67 = v37;
      _os_log_impl(&dword_1CB895000, v36, OS_LOG_TYPE_DEFAULT, "State was updated: currentState=%{public}@", buf, 0xCu);

    }
    v38 = (void *)DNDSLogStateProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
    {
      v39 = v38;
      objc_msgSend(v31, "reason");
      DNDStateUpdateReasonToString();
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "source");
      DNDStateUpdateSourceToString();
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v67 = v40;
      v68 = 2114;
      v69 = v41;
      _os_log_impl(&dword_1CB895000, v39, OS_LOG_TYPE_DEFAULT, "State was updated: reason=%{public}@ source=%{public}@", buf, 0x16u);

    }
    -[DNDSRemoteServiceProvider handleStateUpdate:](v5->_serviceProvider, "handleStateUpdate:", v31);
    v42 = MEMORY[0x1E0C809B0];
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke_178;
    v58[3] = &unk_1E86A8760;
    v59 = v31;
    v43 = v31;
    v44 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A0D58](v58);
    ((void (**)(_QWORD, DNDSAssertionSyncManager *))v44)[2](v44, v5->_assertionSyncManager);
    ((void (**)(_QWORD, DNDSAssertionSyncManager *))v44)[2](v44, v5->_legacyAssertionSyncManager);
    -[DNDSBiomeDonationManager handleStateUpdate:](v5->_biomeDonationManager, "handleStateUpdate:", v43);
    -[DNDSAppFocusConfigurationCoordinator handleStateUpdate:](v5->_appFocusConfigurationCoordinator, "handleStateUpdate:", v43);
    -[DNDSSystemFocusConfigurationCoordinator handleStateUpdate:](v5->_systemFocusConfigurationCoordinator, "handleStateUpdate:", v43);
    userAvailabilityCoordinator = v5->_userAvailabilityCoordinator;
    v53[0] = v42;
    v53[1] = 3221225472;
    v53[2] = __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke_2;
    v53[3] = &unk_1E86A87B0;
    v18 = v50;
    v54 = v50;
    v56 = a4;
    v57 = a3;
    v55 = v6;
    -[DNDSUserAvailabilityCoordinator coordinateUserAvailability:fromConfiguration:toConfiguration:completionHandler:](userAvailabilityCoordinator, "coordinateUserAvailability:fromConfiguration:toConfiguration:completionHandler:", v43, v16, v54, v53);

    v13 = v47;
  }

}

void __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "modeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModeIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModeName:", v5);

  objc_msgSend(*(id *)(a1 + 32), "symbolImageName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setModeSymbol:", v6);

  v7 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    objc_msgSend(v3, "modeIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modeName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "modeSymbol");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v11;
    _os_log_impl(&dword_1CB895000, v8, OS_LOG_TYPE_DEFAULT, "currentData has been set to modeIdentifer: %@, modeName: %@, symbolImageName: %@", (uint8_t *)&v12, 0x20u);

  }
}

void __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke_178(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "updateForStateUpdate:", *(_QWORD *)(a1 + 32));

}

void __91__DNDSServer__queue_updateScheduleManagerLifetimeMonitorsAndStateForReason_source_options___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  unint64_t v9;
  _BOOL8 updated;
  uint64_t v11;
  NSObject *v12;
  int v13;
  _BOOL8 v14;
  __int16 v15;
  _BOOL8 v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "impactsAvailability");
    v7 = DNDResolvedImpactsAvailabilitySetting() != 2;
    objc_msgSend(*(id *)(a1 + 32), "mode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = DNDSPowerLogFocusModeSemanticTypeForDNDModeSemanticType(objc_msgSend(v8, "semanticType"));

  }
  else
  {
    v9 = -2;
    v7 = 1;
  }
  updated = DNDSPowerLogFocusUpdateSourceForDNDStateUpdateSource(*(_QWORD *)(a1 + 48));
  v11 = DNDSPowerLogFocusUpdateReasonForDNDStateUpdateReason(*(_QWORD *)(a1 + 56));
  v12 = DNDSLogMetrics;
  if (os_log_type_enabled((os_log_t)DNDSLogMetrics, OS_LOG_TYPE_INFO))
  {
    v13 = 134219008;
    v14 = v7;
    v15 = 2048;
    v16 = updated;
    v17 = 2048;
    v18 = v11;
    v19 = 2048;
    v20 = v9;
    v21 = 2048;
    v22 = a3;
    _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_INFO, "Notifying PowerLog of Focus status change event: availability=%ld source=%ld reason=%ld semanticType=%ld extensionsLaunched=%ld", (uint8_t *)&v13, 0x34u);
  }
  DNDSPowerLogFocusStatusChangeEvent(*(void **)(a1 + 40), v7, updated, v11, v9, a3);

}

- (void)_queue_validateIDSSyncEngine
{
  -[DNDSIDSSyncEngine validate](self->_idsSyncEngine, "validate");
}

- (void)_migrateBypassSettingsIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unable to fetch mode configurations to migrate bypass settings: error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_migrateDefaultDoNotDisturbModeIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "Unable to save migrated default mode: mode=%{public}@ error=%{public}@");
  OUTLINED_FUNCTION_1();
}

- (void)_migrateReduceInterruptionsIfNeeded
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "Unable to save migrated Reduce Interruptions: mode=%{public}@ error=%{public}@");
  OUTLINED_FUNCTION_1();
}

BOOL __49__DNDSServer__migrateReduceInterruptionsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "semanticType") == 9;
}

- (id)_createDefaultModeForWorkoutTriggerIfNecessary
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  DNDSModeConfigurationManager *modeConfigurationManager;
  id v16;
  NSObject *v17;
  id v19;
  _QWORD v20[4];
  __CFString *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self->_modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", CFSTR("com.apple.donotdisturb.mode.workout"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[DNDSPlaceholderModeManager placeholderModesWithError:](self->_placeholderModeManager, "placeholderModesWithError:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__15;
    v27 = __Block_byref_object_dispose__15;
    v28 = 0;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __60__DNDSServer__createDefaultModeForWorkoutTriggerIfNecessary__block_invoke;
    v20[3] = &unk_1E86A8818;
    v21 = CFSTR("com.apple.donotdisturb.mode.workout");
    v22 = &v23;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v20);
    v5 = objc_alloc(MEMORY[0x1E0D1D5F0]);
    objc_msgSend((id)v24[5], "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v24[5], "modeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v24[5], "symbolImageName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v24[5], "tintColorName");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "initWithName:modeIdentifier:symbolImageName:tintColorName:semanticType:", v6, v7, v8, v9, objc_msgSend((id)v24[5], "semanticType"));

    objc_msgSend(MEMORY[0x1E0D1D6E0], "defaultConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0D1D6A8]);
    v33[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1D708]), "initWithMode:configuration:triggers:", v10, v11, v13);
    objc_msgSend(v14, "setImpactsAvailability:", 0);
    objc_msgSend(v14, "setDimsLockScreen:", 1);
    objc_msgSend(v14, "setAutomaticallyGenerated:", 1);
    modeConfigurationManager = self->_modeConfigurationManager;
    v19 = 0;
    LOBYTE(v9) = -[DNDSModeConfigurationManager setModeConfiguration:withError:](modeConfigurationManager, "setModeConfiguration:withError:", v14, &v19);
    v16 = v19;
    if ((v9 & 1) != 0)
    {
      v3 = (void *)objc_msgSend(v14, "copy");
    }
    else
    {
      v17 = DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v30 = v14;
        v31 = 2114;
        v32 = v16;
        _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_DEFAULT, "Unable to save migrated default mode: mode=%{public}@ error=%{public}@", buf, 0x16u);
      }
      v3 = 0;
    }

    _Block_object_dispose(&v23, 8);
  }
  return v3;
}

void __60__DNDSServer__createDefaultModeForWorkoutTriggerIfNecessary__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "modeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (BOOL)_setDimsLockScreenSetting:(unint64_t)a3 forModeConfigurationWithIdentifier:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self->_modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v8, "setDimsLockScreen:", a3);
    v9 = -[DNDSModeConfigurationManager setModeConfiguration:withError:](self->_modeConfigurationManager, "setModeConfiguration:withError:", v8, 0);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_setScheduleTrigger:(id)a3 forModeConfigurationWithIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;

  v6 = a3;
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self->_modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "triggers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_filter:", &__block_literal_global_196);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v11, "triggers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "arrayByExcludingObjectsInArray:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "arrayByAddingObject:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setTriggers:", v14);
    v15 = -[DNDSModeConfigurationManager setModeConfiguration:withError:](self->_modeConfigurationManager, "setModeConfiguration:withError:", v11, 0);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __69__DNDSServer__setScheduleTrigger_forModeConfigurationWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_setDefaultScheduleTriggerWithScheduleSettings:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;

  v4 = a3;
  -[DNDSServer _scheduleTriggerMatchingSettings:](self, "_scheduleTriggerMatchingSettings:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D1D3C0];
  if (-[DNDSServer _setScheduleTrigger:forModeConfigurationWithIdentifier:](self, "_setScheduleTrigger:forModeConfigurationWithIdentifier:", v5, *MEMORY[0x1E0D1D3C0]))
  {
    v7 = -[DNDSServer _setDimsLockScreenSetting:forModeConfigurationWithIdentifier:](self, "_setDimsLockScreenSetting:forModeConfigurationWithIdentifier:", objc_msgSend(v4, "bedtimeBehaviorEnabledSetting"), v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_scheduleSettingsForModeConfigurations
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *);
  void *v10;
  DNDSServer *v11;
  id v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationManager modeConfigurationsWithError:](self->_modeConfigurationManager, "modeConfigurationsWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke;
    v10 = &unk_1E86A88A8;
    v11 = self;
    v12 = v3;
    objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", &v7);

  }
  v5 = (void *)objc_msgSend(v3, "copy", v7, v8, v9, v10, v11);

  return v5;
}

void __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v8 = a2;
  objc_msgSend(a3, "triggers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_filter:", &__block_literal_global_198);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke_3;
    v9[3] = &unk_1E86A8880;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "bs_map:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v8);

  }
}

uint64_t __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __52__DNDSServer__scheduleSettingsForModeConfigurations__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scheduleSettingsMatchingTrigger:", a2);
}

- (id)_scheduleSettingsFromDefaultScheduleTrigger
{
  void *v2;
  void *v3;
  void *v4;

  -[DNDSServer _scheduleSettingsForModeConfigurations](self, "_scheduleSettingsForModeConfigurations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D1D3C0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_scheduleSettingsMatchingTrigger:(id)a3
{
  id v3;
  DNDSScheduleSettings *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  DNDSScheduleSettings *v8;

  v3 = a3;
  v4 = [DNDSScheduleSettings alloc];
  v5 = objc_msgSend(v3, "enabledSetting");
  objc_msgSend(v3, "timePeriod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[DNDSScheduleSettings initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:creationDate:](v4, "initWithScheduleEnabledSetting:timePeriod:bedtimeBehaviorEnabledSetting:creationDate:", v5, v6, 0, v7);
  return v8;
}

- (id)_scheduleTriggerMatchingSettings:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0D1D680];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "timePeriod");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "scheduleEnabledSetting");

  v9 = (void *)objc_msgSend(v5, "initWithTimePeriod:creationDate:enabledSetting:", v6, v7, v8);
  return v9;
}

- (id)_stateSystemSnapshot
{
  DNDSModeAssertionManager *modeAssertionManager;
  void *v4;
  void *v5;
  DNDSModeAssertionManager *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  id *p_isa;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  double v45;
  uint64_t v46;
  DNDSScheduleLifetimeMonitor *scheduleLifetimeMonitor;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  DNDSMutableStateProviderSystemSnapshot *v57;
  void *v58;
  id v60;
  void *v61;
  DNDSServer *v62;
  id obj;
  uint64_t v64;
  id v65;
  void *v66;
  uint64_t v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  modeAssertionManager = self->_modeAssertionManager;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionManager modeAssertionsMatchingPredicate:](modeAssertionManager, "modeAssertionsMatchingPredicate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self->_modeAssertionManager;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeAssertionManager modeAssertionInvalidationsMatchingPredicate:](v6, "modeAssertionInvalidationsMatchingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v82;
    do
    {
      v14 = 0;
      v15 = v9;
      do
      {
        if (*(_QWORD *)v82 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * v14), "invalidationDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "laterDate:", v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        ++v14;
        v15 = v9;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
    }
    while (v12);
  }
  v61 = v10;

  -[DNDSModeConfigurationManager availableModesFilteringPlaceholders:returningError:](self->_modeConfigurationManager, "availableModesFilteringPlaceholders:returningError:", 1, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "bs_map:", &__block_literal_global_201);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __34__DNDSServer__stateSystemSnapshot__block_invoke_2;
  v79[3] = &unk_1E86A88F0;
  v60 = v18;
  v80 = v60;
  objc_msgSend(v5, "bs_compactMap:", v79);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v62 = self;
  v20 = self->_lifetimeMonitors;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v76 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "activeLifetimeAssertionUUIDs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v73[0] = v19;
        v73[1] = 3221225472;
        v73[2] = __34__DNDSServer__stateSystemSnapshot__block_invoke_3;
        v73[3] = &unk_1E86A8918;
        v74 = v66;
        objc_msgSend(v25, "bs_filter:", v73);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v68, "addObjectsFromArray:", v26);
      }
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v75, v86, 16);
    }
    while (v22);
  }

  v65 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  obj = v5;
  v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
  if (!v67)
  {
    p_isa = (id *)&v62->super.isa;
    goto LABEL_35;
  }
  v64 = *(_QWORD *)v70;
  p_isa = (id *)&v62->super.isa;
  do
  {
    v28 = 0;
    do
    {
      if (*(_QWORD *)v70 != v64)
        objc_enumerationMutation(obj);
      v29 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v28);
      objc_msgSend(v29, "UUID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v68, "containsObject:", v30);

      objc_msgSend(p_isa, "_activeDateIntervalForModeAssertion:currentlyActive:", v29, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUID");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "setObject:forKey:", v32, v33);

      if ((_DWORD)v31)
      {
        objc_msgSend(v32, "startDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "laterDate:", v34);
        v35 = objc_claimAutoreleasedReturnValue();
LABEL_28:

        v9 = (void *)v35;
        goto LABEL_29;
      }
      objc_msgSend(v29, "details");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "reason");

      objc_msgSend(v29, "details");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "identifier");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("schedule"));

      objc_msgSend(p_isa[20], "lastSystemSnapshot");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "activeAssertionUUIDs");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v42, "containsObject:", v43);

      if (v37 == 2 && v40)
      {
        p_isa = (id *)&v62->super.isa;
        if (!v44)
          goto LABEL_29;
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "duration");
        objc_msgSend(v34, "dateByAddingTimeInterval:", -v45);
        v46 = objc_claimAutoreleasedReturnValue();
        scheduleLifetimeMonitor = v62->_scheduleLifetimeMonitor;
        objc_msgSend(v29, "details");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "lifetime");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSScheduleLifetimeMonitor activeDateIntervalForScheduleLifetime:assertion:date:](scheduleLifetimeMonitor, "activeDateIntervalForScheduleLifetime:assertion:date:", v49, v29, v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "endDate");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "timeIntervalSinceDate:", v34);
        v53 = v52;

        if (v53 < 0.0)
        {
          objc_msgSend(v50, "endDate");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "laterDate:", v54);
          v55 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v55;
        }
        v35 = (uint64_t)v9;

        v9 = (void *)v46;
        goto LABEL_28;
      }
      p_isa = (id *)&v62->super.isa;
LABEL_29:

      ++v28;
    }
    while (v67 != v28);
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v69, v85, 16);
    v67 = v56;
  }
  while (v56);
LABEL_35:

  v57 = objc_alloc_init(DNDSMutableStateProviderSystemSnapshot);
  -[DNDSMutableStateProviderSystemSnapshot setAssertions:](v57, "setAssertions:", obj);
  -[DNDSMutableStateProviderSystemSnapshot setActiveAssertionUUIDs:](v57, "setActiveAssertionUUIDs:", v68);
  -[DNDSMutableStateProviderSystemSnapshot setActiveDateIntervalByAssertionUUID:](v57, "setActiveDateIntervalByAssertionUUID:", v65);
  -[DNDSMutableStateProviderSystemSnapshot setLostModeState:](v57, "setLostModeState:", objc_msgSend(p_isa, "lostModeState"));
  -[DNDSMutableStateProviderSystemSnapshot setLastUpdate:](v57, "setLastUpdate:", v9);
  objc_msgSend(p_isa[28], "behaviorSettingsWithError:", 0);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableStateProviderSystemSnapshot setInterruptionBehaviorSetting:](v57, "setInterruptionBehaviorSetting:", objc_msgSend(v58, "interruptionBehaviorSetting"));

  return v57;
}

uint64_t __34__DNDSServer__stateSystemSnapshot__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modeIdentifier");
}

id __34__DNDSServer__stateSystemSnapshot__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  objc_msgSend(v3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "details");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "modeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v5, "containsObject:", v7);

  if ((_DWORD)v5)
  {

    v4 = 0;
  }
  return v4;
}

uint64_t __34__DNDSServer__stateSystemSnapshot__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)_activeDateIntervalForModeAssertion:(id)a3 currentlyActive:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  DNDSCalendarEventLifetimeMonitor *calendarEventLifetimeMonitor;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  DNDSScheduleLifetimeMonitor *scheduleLifetimeMonitor;
  void *v21;
  id v22;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "details");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lifetime");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v8, "lifetimeType"))
  {
    case 0:
    case 3:
    case 5:
      v9 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v6, "startDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:", v10, v11);

      break;
    case 1:
      v13 = v8;
      calendarEventLifetimeMonitor = self->_calendarEventLifetimeMonitor;
      objc_msgSend(v6, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[DNDSCalendarEventLifetimeMonitor activeDateIntervalForCalendarEventLifetime:assertionStartDate:](calendarEventLifetimeMonitor, "activeDateIntervalForCalendarEventLifetime:assertionStartDate:", v13, v15);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        goto LABEL_18;
      v16 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v6, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (!v17)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "date");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v16, "initWithStartDate:endDate:", v18, v19);

      if (!v17)
      goto LABEL_17;
    case 2:
      objc_msgSend(v8, "dateInterval");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      v13 = v8;
      scheduleLifetimeMonitor = self->_scheduleLifetimeMonitor;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        -[DNDSScheduleLifetimeMonitor activeDateIntervalForScheduleLifetime:assertion:date:](scheduleLifetimeMonitor, "activeDateIntervalForScheduleLifetime:assertion:date:", v13, v6, v21);
      else
        -[DNDSScheduleLifetimeMonitor nextActiveDateIntervalForScheduleLifetime:assertion:date:](scheduleLifetimeMonitor, "nextActiveDateIntervalForScheduleLifetime:assertion:date:", v13, v6, v21);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        v22 = v17;
      else
        v22 = objc_alloc_init(MEMORY[0x1E0CB3588]);
      v12 = v22;
LABEL_17:

LABEL_18:
      break;
    default:
      v12 = 0;
      break;
  }

  return v12;
}

- (void)_forceConfigurationSyncIfNeededWithUpdateResult:(id)a3
{
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  DNDSSyncEngine *syncEngine;
  id v34;
  NSObject *v35;
  __int128 v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend(a3, "assertions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (!v5)
  {

    goto LABEL_26;
  }
  v7 = v5;
  v8 = *(_QWORD *)v40;
  *(_QWORD *)&v6 = 138412546;
  v36 = v6;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v40 != v8)
        objc_enumerationMutation(v4);
      v10 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
      v11 = (void *)DNDSLogGeneral;
      if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEBUG))
      {
        v23 = v11;
        objc_msgSend(v10, "source");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "deviceIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = v36;
        v44 = v25;
        v45 = 2112;
        v46 = v10;
        _os_log_debug_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEBUG, "Checking configuration from %@ for %@", buf, 0x16u);

      }
      objc_msgSend(v10, "source", v36);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "deviceIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        objc_msgSend(v10, "details");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "modeIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self->_modeConfigurationManager, "modeConfigurationForModeIdentifier:withError:", v15, 0);
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          v17 = (void *)v16;
          objc_msgSend(v10, "details");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "modeConfigurationModifiedDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v17, "lastModified");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceDate:", v20);
          v22 = v21;

          if (v22 <= 1.0)
          {

            continue;
          }
          v28 = v15;
          v29 = (void *)DNDSLogGeneral;
          if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
          {
            v30 = v29;
            objc_msgSend(v17, "lastModified");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v44 = v28;
            v45 = 2112;
            v46 = v19;
            v47 = 2112;
            v48 = v31;
            _os_log_impl(&dword_1CB895000, v30, OS_LOG_TYPE_DEFAULT, "Configuration for %@ is out of date. %@ < %@", buf, 0x20u);

          }
        }
        else
        {
          v26 = v15;
          v27 = DNDSLogGeneral;
          if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = v26;
            _os_log_impl(&dword_1CB895000, v27, OS_LOG_TYPE_DEFAULT, "Unable to find configuration for %@. It may not yet exist on this device.", buf, 0xCu);
          }
        }

        goto LABEL_22;
      }
    }
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    if (v7)
      continue;
    break;
  }
  v15 = 0;
LABEL_22:

  if (v15)
  {
    v32 = DNDSLogGeneral;
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v44 = v15;
      _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_DEFAULT, "Requesting configuration sync for stale mode %@.", buf, 0xCu);
    }
    -[DNDSIDSSyncEngine sync](self->_idsSyncEngine, "sync");
    syncEngine = self->_syncEngine;
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __62__DNDSServer__forceConfigurationSyncIfNeededWithUpdateResult___block_invoke;
    v37[3] = &unk_1E86A8940;
    v38 = v15;
    v34 = v15;
    -[DNDSSyncEngine fetchChanges:withCompletionHandler:](syncEngine, "fetchChanges:withCompletionHandler:", 1, v37);

    return;
  }
LABEL_26:
  v35 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v35, OS_LOG_TYPE_INFO, "Mode configuration is up to date.", buf, 2u);
  }
}

void __62__DNDSServer__forceConfigurationSyncIfNeededWithUpdateResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = DNDSLogGeneral;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_ERROR))
      __62__DNDSServer__forceConfigurationSyncIfNeededWithUpdateResult___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Updated configurations succesfully synced for %@.", (uint8_t *)&v6, 0xCu);
  }

}

- (id)_updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  DNDSServer *v14;
  int v15;
  char v16;
  unsigned __int8 v17;
  int v18;
  uint64_t i;
  void *v20;
  DNDSClientDetailsProvider *clientDetailsProvider;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v27;
  void *v28;
  __CFString *v29;
  _BOOL4 v30;
  int v31;
  BOOL v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  unsigned __int8 v37;
  uint64_t j;
  void *v39;
  DNDSClientDetailsProvider *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  _BOOL4 v46;
  BOOL v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  DNDSServer *v53;
  NSObject *queue;
  uint64_t v55;
  NSObject *v57;
  char v58;
  int v59;
  void *v60;
  int v61;
  int v62;
  id v63;
  unsigned __int8 v64;
  id obj;
  id obja;
  uint64_t v68;
  unsigned __int8 v69;
  uint64_t v70;
  int v71;
  _QWORD block[5];
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[128];
  uint8_t v86[128];
  uint8_t buf[4];
  void *v88;
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  -[DNDSModeAssertionManager updateModeAssertionsWithContextHandler:error:](self->_modeAssertionManager, "updateModeAssertionsWithContextHandler:error:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "assertions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v88 = v7;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Mode assertion update result:\n assertions=%{public}@", buf, 0xCu);

  }
  v8 = (void *)DNDSLogStateProvider;
  if (os_log_type_enabled((os_log_t)DNDSLogStateProvider, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    objc_msgSend(v4, "invalidations");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v88 = v10;
    _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Mode assertion update result:\n invalidations=%{public}@", buf, 0xCu);

  }
  objc_msgSend(v4, "assertions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {

LABEL_8:
    v14 = self;
    -[DNDSRemoteServiceProvider handleModeAssertionUpdateResult:](self->_serviceProvider, "handleModeAssertionUpdateResult:", v4);
    -[DNDSServer _forceConfigurationSyncIfNeededWithUpdateResult:](self, "_forceConfigurationSyncIfNeededWithUpdateResult:", v4);
    v83 = 0u;
    v84 = 0u;
    v81 = 0u;
    v82 = 0u;
    v60 = v4;
    objc_msgSend(v4, "invalidations");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    if (v70)
    {
      v64 = 0;
      v15 = 0;
      v16 = 0;
      v62 = 0;
      v17 = 0;
      v18 = 0;
      v68 = *(_QWORD *)v82;
      do
      {
        for (i = 0; i != v70; ++i)
        {
          if (*(_QWORD *)v82 != v68)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
          clientDetailsProvider = v14->_clientDetailsProvider;
          objc_msgSend(v20, "source");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "clientIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSClientDetailsProvider clientDetailsForIdentifier:](clientDetailsProvider, "clientDetailsForIdentifier:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v24, "isUserInteractionClient") & 1) != 0)
          {
            v62 = 1;
          }
          else
          {
            objc_msgSend(v20, "reason");
            objc_msgSend(v20, "reasonOverride");
            v25 = DNDResolvedModeAssertionInvalidationReason();
            if (v25 > 8 || ((1 << v25) & 0x182) == 0)
            {
              v15 = 1;
            }
            else
            {
              objc_msgSend(v20, "assertion");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "source");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "clientIdentifier");
              v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
              v30 = v29 != CFSTR("com.apple.donotdisturb.private.schedule");
              v31 = v15;
              v32 = v29 == CFSTR("com.apple.donotdisturb.private.schedule");

              v64 |= v32;
              v15 = v31 | v30;
              v14 = self;
              v16 = 1;
            }
          }
          objc_msgSend(v20, "source");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "deviceIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v17 |= v34 != 0;

          v18 |= objc_msgSend(v24, "forcesAssertionStatusUpdate");
        }
        v70 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
      }
      while (v70);
    }
    else
    {
      v64 = 0;
      v15 = 0;
      v16 = 0;
      v62 = 0;
      v17 = 0;
      v18 = 0;
    }
    v58 = v16;
    v59 = v15;

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    objc_msgSend(v60, "assertions");
    v63 = (id)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
    if (v35)
    {
      v36 = v35;
      v69 = 0;
      v71 = 0;
      v61 = 0;
      v37 = 0;
      obja = *(id *)v78;
      do
      {
        for (j = 0; j != v36; ++j)
        {
          if (*(id *)v78 != obja)
            objc_enumerationMutation(v63);
          v39 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * j);
          v40 = v14->_clientDetailsProvider;
          objc_msgSend(v39, "source");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "clientIdentifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[DNDSClientDetailsProvider clientDetailsForIdentifier:](v40, "clientDetailsForIdentifier:", v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v43, "isUserInteractionClient") & 1) != 0)
          {
            v61 = 1;
          }
          else
          {
            objc_msgSend(v39, "source");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "clientIdentifier");
            v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
            v46 = v45 != CFSTR("com.apple.donotdisturb.private.schedule");
            v47 = v45 == CFSTR("com.apple.donotdisturb.private.schedule");

            v69 |= v47;
            v14 = self;
            v71 |= v46;
          }
          objc_msgSend(v39, "source");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "deviceIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v37 |= v49 != 0;

          v18 |= objc_msgSend(v43, "forcesAssertionStatusUpdate");
        }
        v36 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v77, v85, 16);
      }
      while (v36);
    }
    else
    {
      v69 = 0;
      v71 = 0;
      v61 = 0;
      v37 = 0;
    }

    if (((v61 | v62) & 1) != 0)
    {
      v50 = 1;
      v4 = v60;
    }
    else
    {
      v4 = v60;
      if (((v71 | v59) & 1) != 0)
      {
        v50 = 6;
      }
      else
      {
        v51 = 2;
        if ((v58 & 1) != 0)
          v51 = 3;
        v50 = 5;
        if (((v69 | v64) & 1) == 0)
          v50 = v51;
      }
    }
    v52 = 1;
    if (((v37 | v17) & 1) != 0)
      v52 = 2;
    v53 = v14;
    queue = v14->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    v55 = 3;
    if ((v18 & 1) == 0)
      v55 = 1;
    block[1] = 3221225472;
    block[2] = __86__DNDSServer__updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler_error___block_invoke;
    block[3] = &unk_1E86A8968;
    block[4] = v53;
    v74 = v50;
    v75 = v52;
    v76 = v55;
    v73 = v4;
    dispatch_async(queue, block);

    return v4;
  }
  objc_msgSend(v4, "invalidations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v13)
    goto LABEL_8;
  v57 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v57, OS_LOG_TYPE_DEFAULT, "Ignored update as it changed nothing", buf, 2u);
  }
  return v4;
}

void __86__DNDSServer__updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler_error___block_invoke(uint64_t a1)
{
  void (**v2)(_QWORD, _QWORD);
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_queue_updateScheduleManagerLifetimeMonitorsAndStateForReason:source:options:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __86__DNDSServer__updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler_error___block_invoke_2;
  v3[3] = &unk_1E86A8760;
  v4 = *(id *)(a1 + 40);
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17A0D58](v3);
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 200));
  v2[2](v2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208));

}

void __86__DNDSServer__updateModeAssertionManagerAndRefreshLifetimesAndStateWithHandler_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "updateForModeAssertionUpdateResult:", *(_QWORD *)(a1 + 32));

}

- (id)_allModes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationManager availableModesFilteringPlaceholders:returningError:](self->_modeConfigurationManager, "availableModesFilteringPlaceholders:returningError:", 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSPlaceholderModeManager placeholderModesWithError:](self->_placeholderModeManager, "placeholderModesWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isPlaceholder == NO"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NONE %@.modeIdentifier == modeIdentifier"), v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filteredArrayUsingPredicate:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("isPlaceholder == YES"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY %@.modeIdentifier == modeIdentifier"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v5;
  objc_msgSend(v5, "filteredArrayUsingPredicate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x1E0D1D5F0], "placeholderModeFromMode:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_msgSend(v3, "copy");
  return v16;
}

- (void)_queue_handlePairedDeviceAndSyncSettingsChange
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  DNDSAssertionSyncManager *assertionSyncManager;
  DNDSAssertionSyncManager *legacyAssertionSyncManager;
  DNDSSettingsSyncManager *settingsSyncManager;
  DNDSIDSSyncService *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  DNDSLegacyAssertionSyncManager *v14;
  DNDSAssertionSyncManager *v15;
  DNDSSettingsSyncManager *v16;
  DNDSSettingsSyncManager *v17;
  DNDSIDSSyncService *v18;
  void *v19;
  uint64_t v20;
  DNDSSettingsSyncManager *v21;
  DNDSSettingsSyncManager *v22;
  DNDSModernAssertionSyncManager *v23;
  DNDSModernAssertionSyncManager *v24;
  DNDSAssertionSyncManager *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[DNDSPairedDeviceStateMonitor cloudDevices](self->_pairedDeviceStateMonitor, "cloudDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSSettingsManager syncSettingsWithError:](self->_settingsManager, "syncSettingsWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSPairedDeviceStateMonitor pairedDevice](self->_pairedDeviceStateMonitor, "pairedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = DNDSLogGeneral;
  if (os_log_type_enabled((os_log_t)DNDSLogGeneral, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138543874;
    v27 = v5;
    v28 = 2114;
    v29 = v3;
    v30 = 2114;
    v31 = v4;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "Current DND sync status: local device=%{public}@, cloud devices=%{public}@, settings=%{public}@", (uint8_t *)&v26, 0x20u);
  }
  assertionSyncManager = self->_assertionSyncManager;
  self->_assertionSyncManager = 0;

  legacyAssertionSyncManager = self->_legacyAssertionSyncManager;
  self->_legacyAssertionSyncManager = 0;

  settingsSyncManager = self->_settingsSyncManager;
  self->_settingsSyncManager = 0;

  -[DNDSIDSSyncEngine setPairedDevice:syncEnabled:](self->_idsSyncEngine, "setPairedDevice:syncEnabled:", 0, 0);
  v10 = -[DNDSIDSSyncService initWithIDSService:]([DNDSIDSSyncService alloc], "initWithIDSService:", self->_idsCloudService);
  objc_msgSend(MEMORY[0x1E0D1D5C8], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "deviceClass") == 1)
  {

LABEL_6:
    if (objc_msgSend(v5, "deviceClass") == 3 && objc_msgSend(v5, "assertionSyncProtocolVersion") == 1)
    {
      v14 = -[DNDSLegacyAssertionSyncManager initWithClientDetailsProvider:pairedDevice:]([DNDSLegacyAssertionSyncManager alloc], "initWithClientDetailsProvider:pairedDevice:", self->_clientDetailsProvider, v5);
      v15 = self->_legacyAssertionSyncManager;
      self->_legacyAssertionSyncManager = (DNDSAssertionSyncManager *)v14;

      +[DNDSLegacySettingsSyncManager sendManagerForPairedDevice:](DNDSLegacySettingsSyncManager, "sendManagerForPairedDevice:", v5);
      v16 = (DNDSSettingsSyncManager *)objc_claimAutoreleasedReturnValue();
      v17 = self->_settingsSyncManager;
      self->_settingsSyncManager = v16;

    }
    else
    {
      if (objc_msgSend(v5, "deviceClass"))
      {
        v18 = -[DNDSIDSSyncService initWithIDSService:]([DNDSIDSSyncService alloc], "initWithIDSService:", self->_idsLocalService);
        objc_msgSend(MEMORY[0x1E0D1D5C8], "currentDevice");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v19, "deviceClass") == 1)
        {
          v20 = objc_msgSend(v5, "deviceClass");

          if (v20 == 3)
          {
            if ((unint64_t)objc_msgSend(v5, "configurationSyncProtocolVersion") > 8)
            {
              +[DNDSLegacyAssertionSyncManager cleanupState](DNDSLegacyAssertionSyncManager, "cleanupState");
              +[DNDSLegacySettingsSyncManager cleanupState](DNDSLegacySettingsSyncManager, "cleanupState");
            }
            else
            {
              +[DNDSLegacySettingsSyncManager sendManagerForPairedDevice:](DNDSLegacySettingsSyncManager, "sendManagerForPairedDevice:", v5);
              v21 = (DNDSSettingsSyncManager *)objc_claimAutoreleasedReturnValue();
              v22 = self->_settingsSyncManager;
              self->_settingsSyncManager = v21;

            }
          }
        }
        else
        {

        }
        goto LABEL_18;
      }
      +[DNDSLegacyAssertionSyncManager cleanupState](DNDSLegacyAssertionSyncManager, "cleanupState");
      +[DNDSLegacySettingsSyncManager cleanupState](DNDSLegacySettingsSyncManager, "cleanupState");
    }
    v18 = 0;
LABEL_18:
    v24 = -[DNDSModernAssertionSyncManager initWithClientDetailsProvider:localSyncService:cloudSyncService:keybag:]([DNDSModernAssertionSyncManager alloc], "initWithClientDetailsProvider:localSyncService:cloudSyncService:keybag:", self->_clientDetailsProvider, v18, v10, self->_keybag);
    v25 = self->_assertionSyncManager;
    self->_assertionSyncManager = (DNDSAssertionSyncManager *)v24;

    -[DNDSIDSSyncEngine setPairedDevice:syncEnabled:](self->_idsSyncEngine, "setPairedDevice:syncEnabled:", v5, objc_msgSend(v4, "isPairSyncEnabled"));
    -[DNDSSyncEngine pairedDeviceDidChange](self->_syncEngine, "pairedDeviceDidChange");
    goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0D1D5C8], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "deviceClass");

  if (v13 == 5)
    goto LABEL_6;
  v23 = -[DNDSModernAssertionSyncManager initWithClientDetailsProvider:localSyncService:cloudSyncService:keybag:]([DNDSModernAssertionSyncManager alloc], "initWithClientDetailsProvider:localSyncService:cloudSyncService:keybag:", self->_clientDetailsProvider, 0, v10, self->_keybag);
  v18 = (DNDSIDSSyncService *)self->_assertionSyncManager;
  self->_assertionSyncManager = (DNDSAssertionSyncManager *)v23;
LABEL_19:

  -[DNDSAssertionSyncManager setDataSource:](self->_assertionSyncManager, "setDataSource:", self);
  -[DNDSAssertionSyncManager setDelegate:](self->_assertionSyncManager, "setDelegate:", self);
  -[DNDSAssertionSyncManager resume](self->_assertionSyncManager, "resume");
  -[DNDSAssertionSyncManager setDataSource:](self->_legacyAssertionSyncManager, "setDataSource:", self);
  -[DNDSAssertionSyncManager setDelegate:](self->_legacyAssertionSyncManager, "setDelegate:", self);
  -[DNDSAssertionSyncManager resume](self->_legacyAssertionSyncManager, "resume");
  -[DNDSSettingsSyncManager setDataSource:](self->_settingsSyncManager, "setDataSource:", self);
  -[DNDSSettingsSyncManager setDelegate:](self->_settingsSyncManager, "setDelegate:", self);
  -[DNDSSettingsSyncManager resume](self->_settingsSyncManager, "resume");
  -[DNDSRemoteServiceProvider handleUpdatedPairSyncState:](self->_serviceProvider, "handleUpdatedPairSyncState:", objc_msgSend(v4, "isPairSyncEnabled"));

}

- (unint64_t)lockState
{
  return self->_lockState;
}

- (unint64_t)lostModeState
{
  return self->_lostModeState;
}

- (void)setLostModeState:(unint64_t)a3
{
  self->_lostModeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsManager, 0);
  objc_storeStrong((id *)&self->_modeConfigurationManager, 0);
  objc_storeStrong((id *)&self->_modeAssertionManager, 0);
  objc_storeStrong((id *)&self->_clientDetailsProvider, 0);
  objc_storeStrong((id *)&self->_focusStatusDomainPublisher, 0);
  objc_storeStrong((id *)&self->_userAvailabilityCoordinator, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_appInfoCache, 0);
  objc_storeStrong((id *)&self->_contactMonitor, 0);
  objc_storeStrong((id *)&self->_placeholderModeManager, 0);
  objc_storeStrong((id *)&self->_modeConfigurationsStore, 0);
  objc_storeStrong((id *)&self->_globalConfigurationManager, 0);
  objc_storeStrong((id *)&self->_globalConfigurationStore, 0);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_focusConfigurationEventPublisher, 0);
  objc_storeStrong((id *)&self->_eventStream, 0);
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_storeStrong((id *)&self->_reachability, 0);
  objc_storeStrong((id *)&self->_idsSyncEngine, 0);
  objc_storeStrong((id *)&self->_syncEngine, 0);
  objc_storeStrong((id *)&self->_pairedDeviceStateMonitor, 0);
  objc_storeStrong((id *)&self->_idsCloudService, 0);
  objc_storeStrong((id *)&self->_idsLocalService, 0);
  objc_storeStrong((id *)&self->_settingsManager, 0);
  objc_storeStrong((id *)&self->_settingsSyncManager, 0);
  objc_storeStrong((id *)&self->_legacyAssertionSyncManager, 0);
  objc_storeStrong((id *)&self->_assertionSyncManager, 0);
  objc_storeStrong((id *)&self->_appConfigurationServiceProvider, 0);
  objc_storeStrong((id *)&self->_availabilityServiceProvider, 0);
  objc_storeStrong((id *)&self->_serviceProvider, 0);
  objc_storeStrong((id *)&self->_eventBehaviorResolver, 0);
  objc_storeStrong((id *)&self->_stateProvider, 0);
  objc_storeStrong((id *)&self->_meDeviceService, 0);
  objc_storeStrong((id *)&self->_workoutTriggerManager, 0);
  objc_storeStrong((id *)&self->_smartTriggerManager, 0);
  objc_storeStrong((id *)&self->_sleepingTriggerManager, 0);
  objc_storeStrong((id *)&self->_mindfulnessTriggerManager, 0);
  objc_storeStrong((id *)&self->_intelligentBehaviorResolver, 0);
  objc_storeStrong((id *)&self->_gamingTriggerManager, 0);
  objc_storeStrong((id *)&self->_drivingTriggerManager, 0);
  objc_storeStrong((id *)&self->_biomeDonationManager, 0);
  objc_storeStrong((id *)&self->_auxiliaryStateMonitor, 0);
  objc_storeStrong((id *)&self->_appForegroundTriggerManager, 0);
  objc_storeStrong((id *)&self->_systemFocusConfigurationCoordinator, 0);
  objc_storeStrong((id *)&self->_appFocusConfigurationCoordinator, 0);
  objc_storeStrong((id *)&self->_scheduleManager, 0);
  objc_storeStrong((id *)&self->_lifetimeMonitors, 0);
  objc_storeStrong((id *)&self->_locationLifetimeMonitor, 0);
  objc_storeStrong((id *)&self->_scheduleLifetimeMonitor, 0);
  objc_storeStrong((id *)&self->_calendarEventLifetimeMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)pairedCloudDevicesForSyncManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3(&dword_1CB895000, v0, v1, "Paired cloud devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)pairedDevicesForSyncManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_3(&dword_1CB895000, v0, v1, "Paired devices: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)syncManager:(void *)a1 updateOutboundModeAssertion:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "modeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1CB895000, v3, OS_LOG_TYPE_FAULT, "Unable to find mode configuration for mode %@", v5, 0xCu);

}

- (void)syncManager:performModeAssertionUpdatesWithHandler:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, v0, v1, "Error when performing update for sync manager; manager=%{public}@, error=%{public}@");
  OUTLINED_FUNCTION_1();
}

void __50__DNDSServer_syncManager_prepareForSyncToDevices___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error while requesting settings sync for Focus sync. %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)syncManager:didReceiveUpdatedPhoneCallBypassSettings:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error replacing bypass settings in default mode: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)syncManager:didReceiveUpdatedPhoneCallBypassSettings:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error fetching default mode: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)remoteServiceProvider:setCloudSyncPreferenceEnabled:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Unable to fetch incompatible mode configurations for reset: error=%{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__DNDSServer_remoteServiceProvider_allModesReturningError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error fetching changes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __73__DNDSServer_remoteServiceProvider_syncModeConfigurationsReturningError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error sending changes: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __62__DNDSServer__forceConfigurationSyncIfNeededWithUpdateResult___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, a2, a3, "Failed to sync updated configurations for synced %@ assertion. Error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

@end
