@implementation DNDSAppConfigurationManager

- (DNDSAppConfigurationManager)initWithAppSpecificSettingsManager:(id)a3
{
  id v5;
  DNDSAppConfigurationManager *v6;
  uint64_t v7;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v9;
  NSMutableDictionary *predicates;
  uint64_t v11;
  NSHashTable *delegates;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)DNDSAppConfigurationManager;
  v6 = -[DNDSAppConfigurationManager init](&v14, sel_init);
  if (v6)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.server.AppConfigurationsManager"));
    v7 = objc_claimAutoreleasedReturnValue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    predicates = v6->_predicates;
    v6->_predicates = v9;

    objc_storeStrong((id *)&v6->_appSpecificSettingsManager, a3);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v11 = objc_claimAutoreleasedReturnValue();
    delegates = v6->_delegates;
    v6->_delegates = (NSHashTable *)v11;

    DNDSRegisterSysdiagnoseDataProvider(v6);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSAppConfigurationManager;
  -[DNDSAppConfigurationManager dealloc](&v3, sel_dealloc);
}

- (void)addDelegate:(id)a3
{
  -[NSHashTable addObject:](self->_delegates, "addObject:", a3);
}

- (void)removeDelegate:(id)a3
{
  -[NSHashTable removeObject:](self->_delegates, "removeObject:", a3);
}

- (void)refreshWithAvailableModes:(id)a3
{
  void *v4;
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
  NSHashTable *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  DNDSAppConfigurationManager *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "bs_map:", &__block_literal_global_29);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = self;
  -[DNDSAppSpecificSettingsManager removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers:error:](self->_appSpecificSettingsManager, "removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers:error:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v30 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "applicationIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v12);

        objc_msgSend(v7, "objectForKeyedSubscript:", v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "modeSpecificSettings");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v9);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v24->_delegates;
  v18 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v22, "appConfigurationManager:didClearActionsForAppsInModeIdentifiers:", v24, v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v22, "appConfigurationManager:didClearSystemActionsInModeIdentifiers:", v24, v6);
      }
      v19 = -[NSHashTable countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

}

uint64_t __57__DNDSAppConfigurationManager_refreshWithAvailableModes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "modeIdentifier");
}

- (id)predicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  return -[DNDSAppSpecificSettingsManager appConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:error:](self->_appSpecificSettingsManager, "appConfigurationPredicateForActionIdentifier:forApplicationIdentifier:modeIdentifier:error:", a3, a4, a5, a6);
}

- (id)setPredicate:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  void *v15;
  id v16;
  DNDSAppSpecificSettingsManager *v17;
  id v18;
  void *v19;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10)
    goto LABEL_4;
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  v22 = 0;
  -[DNDSAppSpecificSettingsManager appActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:](appSpecificSettingsManager, "appActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:", v11, v12, v13, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  if (v15)
  {

LABEL_4:
    v17 = self->_appSpecificSettingsManager;
    v21 = 0;
    -[DNDSAppSpecificSettingsManager setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:](v17, "setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:", v10, v11, objc_opt_class(), v12, v13, &v21);
    v18 = v21;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", CFSTR("No action exists for action identifier; ignoring request to set predicate."),
    *MEMORY[0x1E0CB2D50]);
  if (v16)
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v19);
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v18;
}

- (id)predicateForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  return -[DNDSAppSpecificSettingsManager appConfigurationPredicateForApplicationIdentifier:modeIdentifier:error:](self->_appSpecificSettingsManager, "appConfigurationPredicateForApplicationIdentifier:modeIdentifier:error:", a3, a4, a5);
}

- (id)targetContentIdentifierPrefixForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  return -[DNDSAppSpecificSettingsManager appConfigurationTargetContentIdentifierPrefixForApplicationIdentifier:modeIdentifier:error:](self->_appSpecificSettingsManager, "appConfigurationTargetContentIdentifierPrefixForApplicationIdentifier:modeIdentifier:error:", a3, a4, a5);
}

- (id)targetContentIdentifierPrefixesForModeIdentifier:(id)a3 error:(id *)a4
{
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  id v6;
  void *v7;

  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  v6 = a3;
  -[DNDSAppSpecificSettingsManager appSpecificSettingsOfType:modeIdentifier:error:](appSpecificSettingsManager, "appSpecificSettingsOfType:modeIdentifier:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)setTargetContentIdentifierPrefix:(id)a3 forActionIdentifier:(id)a4 forApplicationIdentifier:(id)a5 modeIdentifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  void *v15;
  id v16;
  DNDSAppSpecificSettingsManager *v17;
  id v18;
  void *v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v10 || !objc_msgSend(v10, "length"))
    goto LABEL_5;
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  v22 = 0;
  -[DNDSAppSpecificSettingsManager appActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:](appSpecificSettingsManager, "appActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:", v11, v12, v13, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v22;
  if (v15)
  {

LABEL_5:
    v17 = self->_appSpecificSettingsManager;
    v21 = 0;
    -[DNDSAppSpecificSettingsManager setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:](v17, "setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:", v10, v11, objc_opt_class(), v12, v13, &v21);
    v18 = v21;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("No action exists for action identifier; ignoring request to set target content identifier prefix."),
    *MEMORY[0x1E0CB2D50]);
  if (v16)
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB3388]);
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v20);
  v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v18;
}

- (void)invalidateAppContextForActionIdentifier:(id)a3 applicationIdentifier:(id)a4 modeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  _QWORD v31[4];
  id v32;
  DNDSAppConfigurationManager *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  uint8_t buf[4];
  id v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v39 = 0;
  -[DNDSAppConfigurationManager appActionForActionIdentifier:applicationIdentifier:modeIdentifier:error:](self, "appActionForActionIdentifier:applicationIdentifier:modeIdentifier:error:", v8, v9, v10, &v39);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v39;
  if (v12)
    v13 = 1;
  else
    v13 = v11 == 0;
  if (v13)
  {
    v14 = v12;
    v15 = DNDSLogAppConfigurationServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138413058;
      v41 = v8;
      v42 = 2112;
      v43 = v9;
      v44 = 2112;
      v45 = v10;
      v46 = 2112;
      v47 = v14;
      _os_log_error_impl(&dword_1CB895000, v15, OS_LOG_TYPE_ERROR, "Failed to retrieve action for actionIdentifier:%@ applicationIdentifier:%@ modeIdentifier: %@, error=%@", buf, 0x2Au);
    }
  }
  else
  {
    objc_msgSend(v9, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc_init(MEMORY[0x1E0D44200]);
    v38 = 0;
    objc_msgSend(v17, "actionForBundleIdentifier:andActionIdentifier:error:", v16, v8, &v38);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v38;
    v14 = v19;
    if (v19 || !v18)
    {
      v27 = DNDSLogAppFocusConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogAppFocusConfiguration, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138544130;
        v41 = v8;
        v42 = 2114;
        v43 = v9;
        v44 = 2114;
        v45 = v10;
        v46 = 2114;
        v47 = v14;
        _os_log_error_impl(&dword_1CB895000, v27, OS_LOG_TYPE_ERROR, "Failed to get action metadata for task with actionIdentifier:%{public}@ applicationIdentifier:%{public}@ modeIdentifier:%{public}@ error=%{public}@", buf, 0x2Au);
      }
    }
    else
    {
      v29 = v17;
      v30 = v16;
      objc_msgSend(MEMORY[0x1E0D44188], "policyWithActionMetadata:", v18);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "action");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "parameters");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "actionWithParameters:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "actionWithOpenWhenRun:", 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v20;
      v37 = 0;
      objc_msgSend(v20, "connectionWithError:", &v37);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v37;
      if (v14 || !v26)
      {
        v28 = DNDSLogAppConfigurationServiceProvider;
        if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138413058;
          v41 = v8;
          v42 = 2112;
          v43 = v9;
          v44 = 2112;
          v45 = v10;
          v46 = 2112;
          v47 = v14;
          _os_log_error_impl(&dword_1CB895000, v28, OS_LOG_TYPE_ERROR, "Failed to create connection for actionIdentifier:%@ applicationIdentifier:%@ modeIdentifier: %@, error=%@", buf, 0x2Au);
        }
      }
      else
      {
        v31[0] = MEMORY[0x1E0C809B0];
        v31[1] = 3221225472;
        v31[2] = __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke;
        v31[3] = &unk_1E86A7F08;
        v32 = v24;
        v33 = self;
        v34 = v8;
        v35 = v9;
        v36 = v10;
        objc_msgSend(v26, "fetchActionAppContextForAction:completionHandler:", v32, v31);

      }
      v17 = v29;
      v16 = v30;
    }

  }
}

void __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = DNDSLogAppConfigurationServiceProvider;
    if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_ERROR))
      __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke_cold_2((uint64_t)a1, (uint64_t)v6, v7);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = v5;
      v9 = DNDSLogAppConfigurationServiceProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_DEFAULT))
      {
        v10 = a1[4];
        v18 = 138412546;
        v19 = v8;
        v20 = 2112;
        v21 = v10;
        _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Successfully fetched updated appContext %@ for action %@", (uint8_t *)&v18, 0x16u);
      }
      v11 = (void *)a1[5];
      objc_msgSend(v8, "notificationFilterPredicate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (id)objc_msgSend(v11, "setPredicate:forActionIdentifier:forApplicationIdentifier:modeIdentifier:", v12, a1[6], a1[7], a1[8]);

      v14 = (void *)a1[5];
      objc_msgSend(v8, "targetContentIdentifierPrefix");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (id)objc_msgSend(v14, "setTargetContentIdentifierPrefix:forActionIdentifier:forApplicationIdentifier:modeIdentifier:", v15, a1[6], a1[7], a1[8]);

    }
    else
    {
      v17 = DNDSLogAppConfigurationServiceProvider;
      if (os_log_type_enabled((os_log_t)DNDSLogAppConfigurationServiceProvider, OS_LOG_TYPE_ERROR))
        __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke_cold_1((uint64_t)v5, (uint64_t)a1, v17);
    }
  }

}

- (id)appActionForActionIdentifier:(id)a3 applicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  return -[DNDSAppSpecificSettingsManager appActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:](self->_appSpecificSettingsManager, "appActionWithIdentifier:forApplicationIdentifier:modeIdentifier:error:", a3, a4, a5, a6);
}

- (id)appActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  id v6;
  void *v7;

  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  v6 = a3;
  -[DNDSAppSpecificSettingsManager appSpecificSettingsOfType:modeIdentifier:error:](appSpecificSettingsManager, "appSpecificSettingsOfType:modeIdentifier:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)setAppAction:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  void *v14;
  DNDSAppSpecificSettingsManager *v15;
  void *v16;
  id v17;
  NSHashTable *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0D1D570], "runtimeIsSupported:", &v33);
  v11 = v33;
  if (!v11)
  {
    objc_msgSend(v9, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBundleIdentifier:", v12);

    appSpecificSettingsManager = self->_appSpecificSettingsManager;
    objc_msgSend(v8, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    -[DNDSAppSpecificSettingsManager setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:](appSpecificSettingsManager, "setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:", v8, v14, objc_opt_class(), v9, v10, &v32);
    v11 = v32;

    if (v8)
    {
      if (v11)
        goto LABEL_16;
    }
    else
    {
      v15 = self->_appSpecificSettingsManager;
      objc_msgSend(0, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v11;
      -[DNDSAppSpecificSettingsManager setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:](v15, "setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:", 0, v16, objc_opt_class(), v9, v10, &v31);
      v17 = v31;

      v11 = v17;
      if (v17)
        goto LABEL_16;
    }
    v26 = v11;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = self->_delegates;
    v19 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v22);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v23, "appConfigurationManager:didSetAction:forApplicationIdentifier:modeIdentifier:", self, v8, v9, v10);
          ++v22;
        }
        while (v20 != v22);
        v20 = -[NSHashTable countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v27, v34, 16);
      }
      while (v20);
    }

    v11 = v26;
  }
LABEL_16:
  v24 = v11;

  return v24;
}

- (id)clearAppActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  id v12;
  DNDSAppSpecificSettingsManager *v13;
  NSHashTable *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  v27 = 0;
  -[DNDSAppSpecificSettingsManager setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:](appSpecificSettingsManager, "setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:", 0, v8, objc_opt_class(), v9, v10, &v27);
  v12 = v27;
  v13 = self->_appSpecificSettingsManager;
  v26 = v12;
  -[DNDSAppSpecificSettingsManager setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:](v13, "setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:", 0, v8, objc_opt_class(), v9, v10, &v26);
  v21 = v26;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = self->_delegates;
  v15 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v18);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v19, "appConfigurationManager:didClearActionWithIdentifier:forApplicationIdentifier:modeIdentifier:", self, v8, v9, v10);
        ++v18;
      }
      while (v16 != v18);
      v16 = -[NSHashTable countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v16);
  }

  return v21;
}

- (id)systemActionForActionIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  id v8;
  id v9;
  void *v10;

  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  v8 = a4;
  v9 = a3;
  -[DNDSAppSpecificSettingsManager modeSpecificSettingsOfType:identifier:modeIdentifier:error:](appSpecificSettingsManager, "modeSpecificSettingsOfType:identifier:modeIdentifier:error:", objc_opt_class(), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)systemActionsForModeIdentifier:(id)a3 error:(id *)a4
{
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  id v6;
  void *v7;

  appSpecificSettingsManager = self->_appSpecificSettingsManager;
  v6 = a3;
  -[DNDSAppSpecificSettingsManager modeSpecificSettingsOfType:modeIdentifier:error:](appSpecificSettingsManager, "modeSpecificSettingsOfType:modeIdentifier:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)setSystemAction:(id)a3 modeIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  void *v10;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v24 = 0;
  objc_msgSend(MEMORY[0x1E0D1D768], "runtimeIsSupported:", &v24);
  v8 = v24;
  if (!v8)
  {
    appSpecificSettingsManager = self->_appSpecificSettingsManager;
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    -[DNDSAppSpecificSettingsManager setModeSpecificSettings:identifier:type:modeIdentifier:error:](appSpecificSettingsManager, "setModeSpecificSettings:identifier:type:modeIdentifier:error:", v6, v10, objc_opt_class(), v7, &v23);
    v8 = v23;

    if (!v8)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v11 = self->_delegates;
      v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v20;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v20 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v15);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v16, "appConfigurationManager:didSetSystemAction:modeIdentifier:", self, v6, v7, (_QWORD)v19);
            ++v15;
          }
          while (v13 != v15);
          v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        }
        while (v13);
      }

    }
  }
  v17 = v8;

  return v17;
}

- (id)updateSystemActionWithReverseAction:(id)a3 actionIdentifier:(id)a4 modeIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  id v29;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v33 = 0;
  objc_msgSend(MEMORY[0x1E0D1D768], "runtimeIsSupported:", &v33);
  v11 = v33;
  if (!v11)
  {
    v32 = 0;
    -[DNDSAppConfigurationManager systemActionForActionIdentifier:modeIdentifier:error:](self, "systemActionForActionIdentifier:modeIdentifier:error:", v9, v10, &v32);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v32;
    if (v14)
    {
      objc_msgSend(v14, "reverseAction");
      v15 = objc_claimAutoreleasedReturnValue();
      if ((id)v15 == v8)
      {

LABEL_17:
        v13 = 0;
        goto LABEL_18;
      }
      v16 = (void *)v15;
      if (v8 && (objc_msgSend(v14, "reverseAction"), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v18 = (void *)v17;
        objc_msgSend(v14, "reverseAction");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v8, "isEqual:", v19);

        if ((v20 & 1) != 0)
          goto LABEL_17;
      }
      else
      {

      }
      v27 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v27, "setReverseAction:", v8);

      appSpecificSettingsManager = self->_appSpecificSettingsManager;
      v31 = v12;
      -[DNDSAppSpecificSettingsManager setModeSpecificSettings:identifier:type:modeIdentifier:error:](appSpecificSettingsManager, "setModeSpecificSettings:identifier:type:modeIdentifier:error:", v27, v9, objc_opt_class(), v10, &v31);
      v29 = v31;

      v26 = v29;
      v12 = v26;
      v14 = v27;
LABEL_15:
      v13 = v26;
LABEL_18:

      goto LABEL_19;
    }
    v21 = DNDSLogSystemFocusConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogSystemFocusConfiguration, OS_LOG_TYPE_ERROR))
    {
      -[DNDSAppConfigurationManager updateSystemActionWithReverseAction:actionIdentifier:modeIdentifier:].cold.1((uint64_t)v9, (uint64_t)v10, v21);
      if (v12)
        goto LABEL_12;
    }
    else if (v12)
    {
LABEL_12:
      v26 = v12;
      v12 = v26;
      v14 = 0;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to find system action for reverse action. action=%@; mode=%@"),
      v9,
      v10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D1D3E0];
    v34 = *MEMORY[0x1E0CB2D50];
    v35[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 1007, v25);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  v12 = v11;
  v13 = v12;
LABEL_19:

  return v13;
}

- (id)clearSystemActionWithIdentifier:(id)a3 modeIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  DNDSAppSpecificSettingsManager *appSpecificSettingsManager;
  NSHashTable *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  id v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v25 = 0;
  -[DNDSAppConfigurationManager systemActionForActionIdentifier:modeIdentifier:error:](self, "systemActionForActionIdentifier:modeIdentifier:error:", v6, v7, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;
  if (v8)
  {
    appSpecificSettingsManager = self->_appSpecificSettingsManager;
    v24 = v9;
    v19 = v6;
    -[DNDSAppSpecificSettingsManager setModeSpecificSettings:identifier:type:modeIdentifier:error:](appSpecificSettingsManager, "setModeSpecificSettings:identifier:type:modeIdentifier:error:", 0, v6, objc_opt_class(), v7, &v24);
    v18 = v24;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_delegates;
    v12 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v15);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v16, "appConfigurationManager:didClearSystemAction:modeIdentifier:", self, v8, v7);
          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSHashTable countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
      }
      while (v13);
    }

    v9 = v18;
    v6 = v19;
  }

  return v9;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.AppConfigurationManager");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  return (id)objc_opt_new();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_appSpecificSettingsManager, 0);
  objc_storeStrong((id *)&self->_predicates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *(_QWORD *)(a2 + 32);
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, a2, a3, "Fetched appContext:%@ for action:%@ is invalid", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __108__DNDSAppConfigurationManager_invalidateAppContextForActionIdentifier_applicationIdentifier_modeIdentifier___block_invoke_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, a2, a3, "Failed to fetch appContext for action:%@, error=%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

- (void)updateSystemActionWithReverseAction:(uint64_t)a1 actionIdentifier:(uint64_t)a2 modeIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_0_0(&dword_1CB895000, a2, a3, "Unable to find system action for reverse action. action=%@; mode=%@",
    *(_QWORD *)v3,
    *(_QWORD *)&v3[8],
    *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

@end
