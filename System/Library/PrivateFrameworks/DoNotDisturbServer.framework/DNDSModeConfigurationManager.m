@implementation DNDSModeConfigurationManager

- (DNDSModeConfigurationManager)initWithBackingStore:(id)a3 keybag:(id)a4
{
  id v7;
  id v8;
  DNDSModeConfigurationManager *v9;
  uint64_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)DNDSModeConfigurationManager;
  v9 = -[DNDSModeConfigurationManager init](&v13, sel_init);
  if (v9)
  {
    +[DNDSWorkloop serialQueueTargetingSharedWorkloop:](DNDSWorkloop, "serialQueueTargetingSharedWorkloop:", CFSTR("com.apple.donotdisturb.server.ModeConfigurationsManager"));
    v10 = objc_claimAutoreleasedReturnValue();
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v10;

    objc_storeStrong((id *)&v9->_backingStore, a3);
    -[DNDSModeConfigurationsStoring setDelegate:](v9->_backingStore, "setDelegate:", v9);
    objc_storeStrong((id *)&v9->_keybag, a4);
    -[DNDSKeybagStateProviding addObserver:](v9->_keybag, "addObserver:", v9);
    DNDSRegisterSysdiagnoseDataProvider(v9);
    -[DNDSModeConfigurationManager _fixupConfigurationsIfNeeded](v9, "_fixupConfigurationsIfNeeded");
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSModeConfigurationManager;
  -[DNDSModeConfigurationManager dealloc](&v3, sel_dealloc);
}

- (BOOL)setModeConfiguration:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  const __CFString **v23;
  uint64_t *v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  BOOL v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  int v48;
  void *v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  _QWORD v53[2];

  v53[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self, "modeConfigurationForModeIdentifier:withError:", v8, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6 || v6 && v9 && objc_msgSend(v6, "isEqual:", v9))
  {
    v10 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v48) = 0;
      _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Ignoring call to set mode configuration because it is unchanged.", (uint8_t *)&v48, 2u);
    }
  }
  if ((-[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot") & 1) != 0)
  {
    v11 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v48) = 0;
      _os_log_impl(&dword_1CB895000, v11, OS_LOG_TYPE_DEFAULT, "Secure data will be written", (uint8_t *)&v48, 2u);
    }
    goto LABEL_21;
  }
  if (objc_msgSend(v6, "hasSecureData"))
  {
    v12 = DNDSLogModeConfigurations;
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationManager setModeConfiguration:withError:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D1D3E0];
    v52 = *MEMORY[0x1E0CB2D50];
    v53[0] = CFSTR("Cannot store mode configuration as new configuration contains secure data and store is not writeable");
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = (const __CFString **)v53;
    v24 = &v52;
  }
  else
  {
    v25 = objc_msgSend(v9, "hasSecureData");
    v26 = DNDSLogModeConfigurations;
    if (!v25)
    {
      v37 = 0;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v48) = 0;
        _os_log_impl(&dword_1CB895000, v26, OS_LOG_TYPE_DEFAULT, "Secure data will not be written", (uint8_t *)&v48, 2u);
        v37 = 0;
      }
      goto LABEL_22;
    }
    if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR))
      -[DNDSModeConfigurationManager setModeConfiguration:withError:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D1D3E0];
    v50 = *MEMORY[0x1E0CB2D50];
    v51 = CFSTR("Cannot replace mode configuration as existing configuration has secure data and store is not writeable");
    v22 = (void *)MEMORY[0x1E0C99D80];
    v23 = &v51;
    v24 = &v50;
  }
  objc_msgSend(v22, "dictionaryWithObjects:forKeys:count:", v23, v24, 1);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 1004, v34);
  v35 = (id)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
LABEL_21:
    v37 = 1;
LABEL_22:
    if (!v9 && objc_msgSend(v6, "isAutomaticallyGenerated"))
    {
      -[DNDSModeConfigurationManager _inheritFromDefaultModeConfiguration:](self, "_inheritFromDefaultModeConfiguration:", v6);
      v38 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v38;
    }
    v39 = v6;
    -[DNDSModeConfigurationManager _prepareModeConfigurationForStorage:withError:](self, "_prepareModeConfigurationForStorage:withError:", v6, a4);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (a4 && *a4)
    {
      v35 = 0;
      goto LABEL_28;
    }
    objc_msgSend(v6, "mode");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = objc_msgSend(v40, "isPlaceholder");

    if (v41)
    {
      v42 = (void *)DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        v43 = v42;
        objc_msgSend(v6, "mode");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "modeIdentifier");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543362;
        v49 = v45;
        _os_log_impl(&dword_1CB895000, v43, OS_LOG_TYPE_DEFAULT, "Setting mode configuration with placeholder visibility effectively removing mode configuration for system Focus by demoting to placeholder; modeIdentifier=%{public}@",
          (uint8_t *)&v48,
          0xCu);

      }
    }
    v46 = -[DNDSModeConfigurationManager _saveModeConfiguration:writeSecurePartition:error:](self, "_saveModeConfiguration:writeSecurePartition:error:", v6, v37, a4);
    if (v46 == 2)
      -[DNDSModeConfigurationManager _notifyChangeOfModeConfigurationFrom:to:](self, "_notifyChangeOfModeConfigurationFrom:to:", v9, v6);
    v35 = 0;
    v36 = v46 != 0;
    goto LABEL_35;
  }
  if (!a4)
  {
LABEL_28:
    v36 = 0;
    goto LABEL_35;
  }
  v35 = objc_retainAutorelease(v35);
  v36 = 0;
  *a4 = v35;
LABEL_35:

  return v36;
}

- (id)modeConfigurationForModeIdentifier:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:](self, "_readModeConfigurationsReturningError:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "modeConfigurationForModeIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && (objc_msgSend(v8, "mode"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "visibility"),
        v9,
        !v10))
  {
    objc_msgSend(MEMORY[0x1E0D1D650], "modeConfigurationForRecord:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 withError:(id *)a4
{
  return -[DNDSModeConfigurationManager removeModeConfigurationForModeIdentifier:deletePlaceholder:withError:](self, "removeModeConfigurationForModeIdentifier:deletePlaceholder:withError:", a3, 0, a4);
}

- (BOOL)removeModeConfigurationForModeIdentifier:(id)a3 deletePlaceholder:(BOOL)a4 withError:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  id WeakRetained;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:](self, "_readModeConfigurationsReturningError:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modeConfigurationForModeIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)objc_msgSend(v9, "mutableCopy");
    objc_msgSend(v10, "mode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "semanticType");

    if ((unint64_t)(v13 - 1) >= 9)
    {
      if (v13)
      {
        v23 = DNDSLogModeConfigurations;
        if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
        {
          v24 = 138543362;
          v25 = v8;
          _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Removing mode configuration for custom Focus or Focus w/ unknown semantic type; modeIdentifier=%{public}@",
            (uint8_t *)&v24,
            0xCu);
        }
        objc_msgSend(v11, "setModeConfiguration:forModeIdentifier:", 0, v8);
      }
      else if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_FAULT))
      {
        -[DNDSModeConfigurationManager removeModeConfigurationForModeIdentifier:deletePlaceholder:withError:].cold.1();
      }
    }
    else
    {
      if (a4)
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v10, "mode");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[DNDSModeConfigurationManager _removedModeConfigurationRecordForModeRecord:](self, "_removedModeConfigurationRecordForModeRecord:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "makeRecord");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v18 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        v24 = 138543362;
        v25 = v8;
        _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Removing mode configuration for system Focus by demoting to placeholder; modeIdentifier=%{public}@",
          (uint8_t *)&v24,
          0xCu);
      }
      objc_msgSend(v11, "setModeConfiguration:forModeIdentifier:", v14, v8);

    }
    v19 = -[DNDSModeConfigurationManager _writeModeConfigurationsRecord:writeSecurePartition:error:](self, "_writeModeConfigurationsRecord:writeSecurePartition:error:", v11, 1, a5);
    if (v19 == 2)
    {
      -[DNDSModeConfigurationManager availableModesFilteringPlaceholders:returningError:](self, "availableModesFilteringPlaceholders:returningError:", 1, 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "modeConfigurationManager:didUpdateAvailableModes:", self, v20);

    }
    v15 = v19 != 0;
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (id)modeConfigurationsWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:](self, "_readModeConfigurationsReturningError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v6, "modeConfigurations", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "mode");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "visibility");

        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0D1D650], "modeConfigurationForRecord:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "mode");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "modeIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v17);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }

  return v5;
}

- (id)availableModesFilteringPlaceholders:(BOOL)a3 returningError:(id *)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:](self, "_readModeConfigurationsReturningError:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v5, "modeConfigurations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
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
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "mode");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D1D5F0], "modeForRecord:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((!v4 || (objc_msgSend(v13, "isPlaceholder") & 1) == 0)
          && (objc_msgSend(v14, "semanticType") != 9 || _os_feature_enabled_impl()))
        {
          objc_msgSend(v6, "addObject:", v14);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v6;
}

- (unint64_t)exceptionForApplication:(id)a3 thread:(id)a4 forModeIdentifier:(id)a5
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  unint64_t v13;

  v8 = (objc_class *)MEMORY[0x1E0D1D598];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v8 alloc], "initWithBundleID:", v11);

  v13 = -[DNDSModeConfigurationManager exceptionForApplicationIdentifier:thread:forModeIdentifier:](self, "exceptionForApplicationIdentifier:thread:forModeIdentifier:", v12, v10, v9);
  return v13;
}

- (unint64_t)exceptionForApplicationIdentifier:(id)a3 thread:(id)a4 forModeIdentifier:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v8 = a4;
  v9 = a3;
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self, "modeConfigurationForModeIdentifier:withError:", a5, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "exceptionForApplicationIdentifier:thread:", v9, v8);

  return v12;
}

- (unint64_t)exceptionForContactHandle:(id)a3 forModeIdentifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;

  v6 = a3;
  -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self, "modeConfigurationForModeIdentifier:withError:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "exceptionForContactHandle:", v6);

  return v9;
}

- (id)_readModeConfigurationsReturningError:(id *)a3
{
  DNDSModeConfigurationsStoring *backingStore;
  DNDSModeConfigurationsRecord *v6;
  id v7;
  void *v8;
  int v9;
  _BOOL4 v10;
  id v12;

  backingStore = self->_backingStore;
  v12 = 0;
  -[DNDSModeConfigurationsStoring readRecordWithError:](backingStore, "readRecordWithError:", &v12);
  v6 = (DNDSModeConfigurationsRecord *)objc_claimAutoreleasedReturnValue();
  v7 = v12;
  v8 = v7;
  if (v7)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v7);
    v9 = -[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot");
    v10 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v10)
        -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:].cold.1();
      _DNDSRequestRadar(CFSTR("Failed to load configurations"), v8, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModeConfigurationManager.m"), 266);
      if (!v6)
        goto LABEL_11;
      goto LABEL_12;
    }
    if (v10)
    {
      -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:].cold.2();
      if (v6)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  if (!v6)
LABEL_11:
    v6 = objc_alloc_init(DNDSModeConfigurationsRecord);
LABEL_12:

  return v6;
}

- (id)relevantApplicationIdentifiers
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  void *v26;
  id obj;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
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
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:](self, "_readModeConfigurationsReturningError:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "modeConfigurations");
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v4)
  {
    v5 = v4;
    v28 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v7, "triggers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "triggers");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = 0u;
        v36 = 0u;
        v33 = 0u;
        v34 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v34;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v34 != v13)
                objc_enumerationMutation(v10);
              v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "applicationIdentifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v3, "addObject:", v16);

              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
          }
          while (v12);
        }

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        objc_msgSend(v7, "secureConfiguration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "allowedApplications");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v30;
          do
          {
            for (k = 0; k != v20; ++k)
            {
              if (*(_QWORD *)v30 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * k));
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
          }
          while (v20);
        }

        objc_msgSend(v7, "secureConfiguration");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "deniedApplications");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v24);

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v5);
  }

  return v3;
}

- (id)relevantContacts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSModeConfigurationManager _readModeConfigurationsReturningError:](self, "_readModeConfigurationsReturningError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modeConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)MEMORY[0x1E0D1D740];
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v9), "secureConfiguration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "senderConfiguration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "configurationForRecord:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "allowedContacts");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v14);

        objc_msgSend(v13, "deniedContacts");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v15);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  return v3;
}

- (void)keybagDidUnlockForTheFirstTime:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = DNDSLogModeConfigurations;
  if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "Keybag unlocked for the first time; fixing up mode sender configurations if needed.",
      v5,
      2u);
  }
  -[DNDSModeConfigurationManager _fixupConfigurationsIfNeeded](self, "_fixupConfigurationsIfNeeded");
}

- (unint64_t)_saveModeConfiguration:(id)a3 writeSecurePartition:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  v6 = a4;
  v8 = DNDSLogModeConfigurations;
  v9 = a3;
  objc_msgSend(v9, "log:withMessage:", v8, CFSTR("Saving configuration"));
  -[DNDSModeConfigurationsStoring readRecordWithError:](self->_backingStore, "readRecordWithError:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");
  objc_msgSend(v9, "makeRecord");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "modeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setModeConfiguration:forModeIdentifier:", v12, v14);

  v15 = -[DNDSModeConfigurationManager _writeModeConfigurationsRecord:writeSecurePartition:error:](self, "_writeModeConfigurationsRecord:writeSecurePartition:error:", v11, v6, a5);
  return v15;
}

- (unint64_t)_writeModeConfigurationsRecord:(id)a3 writeSecurePartition:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  DNDSModeConfigurationsStoring *backingStore;
  uint64_t v10;
  id v11;
  void *v12;
  unint64_t v13;
  int v14;
  _BOOL4 v15;
  NSObject *v16;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v6 = a4;
  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  backingStore = self->_backingStore;
  v18 = 0;
  v10 = -[DNDSModeConfigurationsStoring writeRecord:writePartition:error:](backingStore, "writeRecord:writePartition:error:", v8, v6, &v18);
  v11 = v18;
  v12 = v11;
  if (v10)
  {
    if (v10 == 1)
    {
      v16 = DNDSLogModeConfigurations;
      if (os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v12;
        _os_log_impl(&dword_1CB895000, v16, OS_LOG_TYPE_DEFAULT, "Failed to save configurations, but error can be ignored; error=%{public}@",
          buf,
          0xCu);
      }
    }
    else if (v10 == 2)
    {
      objc_msgSend(v8, "log:withMessage:", DNDSLogModeConfigurations, CFSTR("Saved configurations"));
      v13 = 2;
      goto LABEL_19;
    }
    v13 = 1;
    goto LABEL_19;
  }
  if (a5 && v11)
    *a5 = objc_retainAutorelease(v11);
  v14 = -[DNDSKeybagStateProviding hasUnlockedSinceBoot](self->_keybag, "hasUnlockedSinceBoot");
  v15 = os_log_type_enabled((os_log_t)DNDSLogModeConfigurations, OS_LOG_TYPE_ERROR);
  if (v14)
  {
    if (v15)
      -[DNDSModeConfigurationManager _writeModeConfigurationsRecord:writeSecurePartition:error:].cold.1();
    objc_msgSend(v8, "log:withMessage:", DNDSLogModeConfigurations, CFSTR("Failed to save configuations"));
    _DNDSRequestRadar(CFSTR("Error saving configurations"), v12, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSModeConfigurationManager.m"), 370);
  }
  else
  {
    if (v15)
      -[DNDSModeConfigurationManager _writeModeConfigurationsRecord:writeSecurePartition:error:].cold.2();
    objc_msgSend(v8, "log:withMessage:", DNDSLogModeConfigurations, CFSTR("Failed to save configuations; first lock"));
  }
  v13 = 0;
LABEL_19:

  return v13;
}

- (id)_inheritFromDefaultModeConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v4 = a3;
  objc_msgSend(v4, "mode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "modeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *MEMORY[0x1E0D1D3C0];
  v8 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D1D3C0]);
  v9 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D1D450]);
  v10 = v4;
  if ((v8 & 1) == 0)
  {
    v10 = v4;
    if ((v9 & 1) == 0)
    {
      -[DNDSModeConfigurationManager modeConfigurationForModeIdentifier:withError:](self, "modeConfigurationForModeIdentifier:withError:", v7, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "phoneCallBypassSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "phoneCallBypassSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v4;
      if ((objc_msgSend(v13, "isEqual:", v15) & 1) == 0)
      {
        v16 = (void *)objc_msgSend(v4, "mutableCopy");
        objc_msgSend(v4, "configuration");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v17, "mutableCopy");

        v19 = objc_msgSend(v4, "isAutomaticallyGenerated");
        objc_msgSend(v18, "setPhoneCallBypassSettings:", v15);
        objc_msgSend(v16, "setConfiguration:", v18);
        objc_msgSend(v16, "setAutomaticallyGenerated:", v19);
        v10 = (void *)objc_msgSend(v16, "copy");

      }
    }
  }

  return v10;
}

- (id)_prepareModeConfigurationForStorage:(id)a3 withError:(id *)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C97298]);
  objc_msgSend(v4, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "senderConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sanitizedConfigurationWithContactStore:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    v11 = objc_msgSend(v4, "isAutomaticallyGenerated");
    objc_msgSend(v10, "setSenderConfiguration:", v8);
    v12 = (void *)objc_msgSend(v4, "mutableCopy");
    objc_msgSend(v12, "setConfiguration:", v10);
    objc_msgSend(v12, "setAutomaticallyGenerated:", v11);
    v13 = (void *)objc_msgSend(v12, "copy");

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_notifyChangeOfModeConfigurationFrom:(id)a3 to:(id)a4
{
  id v5;
  id v6;
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  uint64_t v30;
  void *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t j;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t m;
  uint64_t v51;
  void *v52;
  id WeakRetained;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[128];
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "senderConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allowedContacts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "senderConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allowedContacts");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v13, "intersectSet:", v12);
  v62 = v12;
  v14 = (void *)objc_msgSend(v12, "mutableCopy");
  objc_msgSend(v14, "minusSet:", v13);
  v15 = (void *)objc_msgSend(v9, "mutableCopy");
  v60 = v13;
  objc_msgSend(v15, "minusSet:", v13);
  v64 = v5;
  objc_msgSend(v5, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "senderConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "deniedContacts");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v63 = v6;
  objc_msgSend(v6, "configuration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "senderConfiguration");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deniedContacts");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v18, "mutableCopy");
  objc_msgSend(v22, "intersectSet:", v21);
  v58 = v21;
  v55 = (void *)objc_msgSend(v21, "mutableCopy");
  objc_msgSend(v55, "minusSet:", v22);
  v59 = v18;
  v23 = (void *)objc_msgSend(v18, "mutableCopy");
  v57 = v22;
  objc_msgSend(v23, "minusSet:", v22);
  v24 = (void *)objc_opt_new();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  v25 = v15;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v78;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v78 != v28)
          objc_enumerationMutation(v25);
        v30 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v31, v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v77, v84, 16);
    }
    while (v27);
  }

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  v32 = v23;
  v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
  if (v33)
  {
    v34 = v33;
    v35 = *(_QWORD *)v74;
    do
    {
      for (j = 0; j != v34; ++j)
      {
        if (*(_QWORD *)v74 != v35)
          objc_enumerationMutation(v32);
        v37 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v38, v37);

      }
      v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    }
    while (v34);
  }

  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v39 = v14;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v70;
    do
    {
      for (k = 0; k != v41; ++k)
      {
        if (*(_QWORD *)v70 != v42)
          objc_enumerationMutation(v39);
        v44 = *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * k);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 0);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v45, v44);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v69, v82, 16);
    }
    while (v41);
  }
  v56 = v25;

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v46 = v55;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v66;
    do
    {
      for (m = 0; m != v48; ++m)
      {
        if (*(_QWORD *)v66 != v49)
          objc_enumerationMutation(v46);
        v51 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * m);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", 1);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKey:", v52, v51);

      }
      v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v65, v81, 16);
    }
    while (v48);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "modeConfigurationManager:didModifyExceptionsForContacts:forModeConfiguration:", self, v24, v63);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v63, "mode");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "modeConfigurationManager:didModifyAvailableMode:", self, v54);

  }
}

- (id)_removedModeConfigurationRecordForModeRecord:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = (void *)MEMORY[0x1E0D1D6E0];
  v5 = a3;
  objc_msgSend(v4, "defaultConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v7, "setVisibility:", 1);
  v8 = objc_alloc(MEMORY[0x1E0D1D650]);
  objc_msgSend(MEMORY[0x1E0D1D5F0], "modeForRecord:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithMode:configuration:triggers:", v9, v6, MEMORY[0x1E0C9AA60]);

  -[DNDSModeConfigurationManager _prepareModeConfigurationForStorage:withError:](self, "_prepareModeConfigurationForStorage:withError:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)CFSTR("com.apple.donotdisturb.ModeConfigurationsManager");
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  return -[DNDSModeConfigurationManager _sysdiagnoseDataShouldRedact:](self, "_sysdiagnoseDataShouldRedact:", a4);
}

- (id)_sysdiagnoseDataShouldRedact:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  DNDSApplicationIdentifierMapper *v5;
  DNDSContactProvider *v6;
  DNDSBackingStoreDictionaryContext *v7;
  void *v8;

  v3 = a3;
  -[DNDSModeConfigurationsStoring readRecordWithError:](self->_backingStore, "readRecordWithError:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(DNDSApplicationIdentifierMapper);
  v6 = objc_alloc_init(DNDSContactProvider);
  v7 = -[DNDSBackingStoreDictionaryContext initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:]([DNDSBackingStoreDictionaryContext alloc], "initWithDestination:partitionType:redactSensitiveData:contactProvider:applicationIdentifierMapper:", 1, 3, v3, v6, v5);
  objc_msgSend(v4, "dictionaryRepresentationWithContext:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_fixupConfigurationsIfNeeded
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to read record to fix up configurations; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  return a4;
}

- (void)modeConfigurationStore:(id)a3 didUpdateAvailableModes:(id)a4
{
  DNDSModeConfigurationManagerDelegate **p_delegate;
  id v6;
  id WeakRetained;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(WeakRetained, "modeConfigurationManager:didUpdateAvailableModes:", self, v6);

}

- (DNDSModeConfigurationManagerDelegate)delegate
{
  return (DNDSModeConfigurationManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keybag, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backingStore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setModeConfiguration:(uint64_t)a3 withError:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1CB895000, a1, a3, "Cannot store mode configuration as new configuration contains secure data and store is not writeable", a5, a6, a7, a8, 0);
}

- (void)setModeConfiguration:(uint64_t)a3 withError:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1CB895000, a1, a3, "Cannot replace mode configuration as existing configuration has secure data and store is not writeable", a5, a6, a7, a8, 0);
}

- (void)removeModeConfigurationForModeIdentifier:deletePlaceholder:withError:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1CB895000, v0, OS_LOG_TYPE_FAULT, "Removing mode configuration for default Focus is not supported; modeIdentifier=%{public}@",
    v1,
    0xCu);
  OUTLINED_FUNCTION_1();
}

- (void)_readModeConfigurationsReturningError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to load configurations, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)_readModeConfigurationsReturningError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to load configurations but device is under first lock; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)_writeModeConfigurationsRecord:writeSecurePartition:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to save configurations, will request a radar; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

- (void)_writeModeConfigurationsRecord:writeSecurePartition:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to save configurations but device is under first lock; error=%{public}@",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_1();
}

@end
