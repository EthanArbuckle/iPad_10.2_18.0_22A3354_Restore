@implementation DNDSAppSpecificSettingsManager

- (id)appActionWithIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[DNDSAppSpecificSettingsManager appSpecificSettingsOfType:identifier:modeIdentifier:applicationIdentifier:error:](self, "appSpecificSettingsOfType:identifier:modeIdentifier:applicationIdentifier:error:", objc_opt_class(), v12, v10, v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)appConfigurationTargetContentIdentifierPrefixForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[DNDSAppSpecificSettingsManager appSpecificSettingsOfType:modeIdentifier:applicationIdentifier:error:](self, "appSpecificSettingsOfType:modeIdentifier:applicationIdentifier:error:", objc_opt_class(), v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)appConfigurationTargetContentIdentifierPrefixForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[DNDSAppSpecificSettingsManager appSpecificSettingsOfType:identifier:modeIdentifier:applicationIdentifier:error:](self, "appSpecificSettingsOfType:identifier:modeIdentifier:applicationIdentifier:error:", objc_opt_class(), v12, v10, v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)systemActionWithIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[DNDSAppSpecificSettingsManager modeSpecificSettingsOfType:identifier:modeIdentifier:error:](self, "modeSpecificSettingsOfType:identifier:modeIdentifier:error:", objc_opt_class(), v9, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)appConfigurationPredicateForActionIdentifier:(id)a3 forApplicationIdentifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  -[DNDSAppSpecificSettingsManager appSpecificSettingsOfType:identifier:modeIdentifier:applicationIdentifier:error:](self, "appSpecificSettingsOfType:identifier:modeIdentifier:applicationIdentifier:error:", objc_opt_class(), v12, v10, v11, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)appConfigurationPredicateForApplicationIdentifier:(id)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a4;
  v9 = a3;
  -[DNDSAppSpecificSettingsManager appSpecificSettingsOfType:modeIdentifier:applicationIdentifier:error:](self, "appSpecificSettingsOfType:modeIdentifier:applicationIdentifier:error:", objc_opt_class(), v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "anyObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (DNDSAppSpecificSettingsManager)init
{
  DNDSAppSpecificSettingsManager *v2;
  DNDSCoreDataBackingStore *v3;
  DNDSCoreDataBackingStore *store;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNDSAppSpecificSettingsManager;
  v2 = -[DNDSAppSpecificSettingsManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(DNDSCoreDataBackingStore);
    store = v2->_store;
    v2->_store = v3;

  }
  return v2;
}

- (DNDSAppSpecificSettingsManager)initWithIDSSyncEngine:(id)a3 backingStoreURL:(id)a4
{
  id v7;
  id v8;
  DNDSAppSpecificSettingsManager *v9;
  DNDSAppSpecificSettingsManager *v10;
  DNDSCoreDataBackingStore *v11;
  DNDSCoreDataBackingStore *store;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DNDSAppSpecificSettingsManager;
  v9 = -[DNDSAppSpecificSettingsManager init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_idsSyncEngine, a3);
    -[DNDSIDSSyncEngine setDataSource:forZone:](v10->_idsSyncEngine, "setDataSource:forZone:", v10, CFSTR("DNDSAppSpecificSettings"));
    v11 = -[DNDSCoreDataBackingStore _initWithURL:]([DNDSCoreDataBackingStore alloc], "_initWithURL:", v8);
    store = v10->_store;
    v10->_store = v11;

  }
  return v10;
}

- (id)_initWithBackingStoreURL:(id)a3
{
  id v4;
  DNDSAppSpecificSettingsManager *v5;
  DNDSCoreDataBackingStore *v6;
  DNDSCoreDataBackingStore *store;

  v4 = a3;
  v5 = -[DNDSAppSpecificSettingsManager init](self, "init");
  if (v5)
  {
    v6 = -[DNDSCoreDataBackingStore _initWithURL:]([DNDSCoreDataBackingStore alloc], "_initWithURL:", v4);
    store = v5->_store;
    v5->_store = v6;

  }
  return v5;
}

- (id)modeSpecificSettingsOfType:(Class)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__13;
  v18 = __Block_byref_object_dispose__13;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__DNDSAppSpecificSettingsManager_modeSpecificSettingsOfType_modeIdentifier_error___block_invoke;
  v13[3] = &unk_1E86A7A30;
  v13[4] = &v14;
  v13[5] = a3;
  -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:](self, "_perModeSettingsMOsOfType:modeIdentifier:processBlock:", a3, v8, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v15[5];
    v15[5] = 0;

    if (a5)
      *a5 = objc_retainAutorelease(v9);
  }
  v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __82__DNDSAppSpecificSettingsManager_modeSpecificSettingsOfType_modeIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(a1 + 40), "appSpecificSettingsForManagedObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (id)appSpecificSettingsOfType:(Class)a3 modeIdentifier:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  Class v17;

  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a4;
  objc_msgSend(v8, "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_error___block_invoke;
  v15[3] = &unk_1E86A7A58;
  v11 = v10;
  v16 = v11;
  v17 = a3;
  -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:](self, "_perModeSettingsMOsOfType:modeIdentifier:processBlock:", a3, v9, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {

    v11 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v12);
  }
  v13 = v11;

  return v13;
}

void __81__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v7);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = objc_alloc(MEMORY[0x1E0D1D598]);
          objc_msgSend(v8, "application");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v9, "initWithBundleID:", v11);

          objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            v14 = objc_alloc_init(MEMORY[0x1E0C99E60]);
            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v12);

          }
          objc_msgSend(*(id *)(a1 + 40), "appSpecificSettingsForManagedObject:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v12);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setByAddingObject:", v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, v12);

          }
        }
        else
        {
          v18 = (void *)DNDSLogAppSpecificSettingsManager;
          if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
            __81__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_error___block_invoke_cold_1(v23, v18, (uint64_t)v8, &v24);
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v5);
  }

}

- (id)_perModeSettingsMOsOfType:(Class)a3 modeIdentifier:(id)a4 processBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint8_t buf[8];
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  const __CFString *v47;
  uint64_t v48;
  const __CFString *v49;
  uint64_t v50;
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__13;
  v44 = __Block_byref_object_dispose__13;
  v45 = 0;
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "hasUnlockedSinceBoot");

  if ((v11 & 1) != 0)
  {
    -[DNDSAppSpecificSettingsManager store](self, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "newManagedObjectContext");

    -[objc_class appSpecificSettingsEntity](a3, "appSpecificSettingsEntity");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "persistentStoreCoordinator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "managedObjectModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "entitiesByName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (v18)
      {
        v33[0] = MEMORY[0x1E0C809B0];
        v33[1] = 3221225472;
        v33[2] = __88__DNDSAppSpecificSettingsManager__perModeSettingsMOsOfType_modeIdentifier_processBlock___block_invoke;
        v33[3] = &unk_1E86A7A80;
        v34 = v13;
        v35 = v8;
        v36 = v18;
        v38 = &v40;
        v37 = v9;
        objc_msgSend(v34, "performBlockAndWait:", v33);

        v19 = v34;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
          -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:].cold.1();
        v29 = (void *)MEMORY[0x1E0CB35C8];
        v46 = *MEMORY[0x1E0CB2D50];
        v47 = CFSTR("Model does not contain provided entity name.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v19);
        v30 = objc_claimAutoreleasedReturnValue();
        v31 = (void *)v41[5];
        v41[5] = v30;

      }
    }
    else
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0CB2D50];
      v49 = CFSTR("Mode identifier not valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v49, &v48, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v19);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = (void *)v41[5];
      v41[5] = v27;

    }
    v25 = (id)v41[5];

  }
  else
  {
    v20 = DNDSLogAppSpecificSettingsManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Attempt to get mode specific settings before first unlock.", buf, 2u);
    }
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v50 = *MEMORY[0x1E0CB2D50];
    v51[0] = CFSTR("Attempt to get mode specific settings before first unlock.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, &v50, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1004, v22);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = (void *)v41[5];
    v41[5] = v23;

    v25 = (id)v41[5];
  }
  _Block_object_dispose(&v40, 8);

  return v25;
}

void __88__DNDSAppSpecificSettingsManager__perModeSettingsMOsOfType_modeIdentifier_processBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v19 = CFSTR("MODE_ID");
  v20[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("PerModeSettingsForMode"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setEntity:", *(_QWORD *)(a1 + 48));
  v7 = a1 + 64;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(v6, "execute:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
      __88__DNDSAppSpecificSettingsManager__perModeSettingsMOsOfType_modeIdentifier_processBlock___block_invoke_cold_1();
    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0D1D3E0];
    v17 = *MEMORY[0x1E0CB2D50];
    v18 = CFSTR("Error querying settings.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", v11, 1008, v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)v7 + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (id)appSpecificSettingsOfType:(Class)a3 modeIdentifier:(id)a4 applicationIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint8_t *v33;
  Class v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  const __CFString *v48;
  uint64_t v49;
  const __CFString *v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasUnlockedSinceBoot");

  if ((v13 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v42 = buf;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__13;
    v45 = __Block_byref_object_dispose__13;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v46 = (id)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__13;
    v39 = __Block_byref_object_dispose__13;
    v40 = 0;
    objc_msgSend(v11, "bundleID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14 == 0;

    if (v15)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v49 = *MEMORY[0x1E0CB2D50];
      v50 = CFSTR("Application's bundle identifier not valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v18);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v10)
      {
        -[DNDSAppSpecificSettingsManager store](self, "store");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "newManagedObjectContext");

        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke;
        v28[3] = &unk_1E86A7AA8;
        v18 = v17;
        v29 = v18;
        v30 = v11;
        v31 = v10;
        v32 = &v35;
        v33 = buf;
        v34 = a3;
        objc_msgSend(v18, "performBlockAndWait:", v28);

        v19 = v29;
        goto LABEL_12;
      }
      v25 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48 = CFSTR("Mode identifier not valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v18);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    v19 = (void *)v36[5];
    v36[5] = v24;
LABEL_12:

    if (a6)
    {
      *a6 = objc_retainAutorelease((id)v36[5]);
      if (v36[5])
      {
        v26 = (void *)*((_QWORD *)v42 + 5);
        *((_QWORD *)v42 + 5) = 0;

      }
    }
    a6 = (id *)*((id *)v42 + 5);
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(buf, 8);
    goto LABEL_16;
  }
  v20 = DNDSLogAppSpecificSettingsManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v20, OS_LOG_TYPE_DEFAULT, "Attempt to get app specific settings before first unlock.", buf, 2u);
  }
  if (a6)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v51 = *MEMORY[0x1E0CB2D50];
    v52[0] = CFSTR("Attempt to get app specific settings before first unlock.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1004, v22);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

    a6 = 0;
  }
LABEL_16:

  return a6;
}

void __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id obj;
  _BYTE v35[128];
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  const __CFString *v39;
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("BUNDLE_ID");
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = CFSTR("MODE_ID");
  v41[0] = v4;
  v41[1] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("PerAppSettingsForAppMode"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 72), "appSpecificSettingsEntity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "managedObjectModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "entitiesByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v6, "setEntity:", v11);
    v12 = a1 + 56;
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v13 + 40);
    objc_msgSend(v6, "execute:", &obj);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v13 + 40), obj);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
        __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke_cold_2();
      v15 = (void *)MEMORY[0x1E0CB35C8];
      v16 = *MEMORY[0x1E0D1D3E0];
      v36 = *MEMORY[0x1E0CB2D50];
      v37 = CFSTR("Failed to fetch settings.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 1008, v17);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = *(_QWORD *)(*(_QWORD *)v12 + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = v18;

    }
    else
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v17 = v14;
      v25 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v31;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v31 != v27)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(a1 + 72), "appSpecificSettingsForManagedObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v28), (_QWORD)v30);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "addObject:", v29);

            ++v28;
          }
          while (v26 != v28);
          v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v26);
      }
      v14 = v17;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
      -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:].cold.1();
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D1D3E0];
    v38 = *MEMORY[0x1E0CB2D50];
    v39 = CFSTR("Model does not contain provided entity name.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1006, v14);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(id *)(v24 + 40);
    *(_QWORD *)(v24 + 40) = v23;
  }

}

- (id)modeSpecificSettingsOfType:(Class)a3 identifier:(id)a4 modeIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *v28;
  uint8_t *v29;
  Class v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint8_t buf[8];
  uint8_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "hasUnlockedSinceBoot");

  if ((v13 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v38 = buf;
    v39 = 0x3032000000;
    v40 = __Block_byref_object_copy__13;
    v41 = __Block_byref_object_dispose__13;
    v42 = 0;
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__13;
    v35 = __Block_byref_object_dispose__13;
    v36 = 0;
    if (v11)
    {
      -[DNDSAppSpecificSettingsManager store](self, "store");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "newManagedObjectContext");

      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __93__DNDSAppSpecificSettingsManager_modeSpecificSettingsOfType_identifier_modeIdentifier_error___block_invoke;
      v24[3] = &unk_1E86A7AA8;
      v16 = v15;
      v25 = v16;
      v26 = v11;
      v27 = v10;
      v28 = &v31;
      v29 = buf;
      v30 = a3;
      objc_msgSend(v16, "performBlockAndWait:", v24);

      v17 = v25;
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      v44 = CFSTR("Mode identifier not valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v16);
      v22 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v32[5];
      v32[5] = v22;
    }

    if (a6)
      *a6 = objc_retainAutorelease((id)v32[5]);
    a6 = (id *)*((id *)v38 + 5);
    _Block_object_dispose(&v31, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v18 = DNDSLogAppSpecificSettingsManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CB895000, v18, OS_LOG_TYPE_DEFAULT, "Attempt to get mode specific settings before first unlock.", buf, 2u);
    }
    if (a6)
    {
      v19 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      v46[0] = CFSTR("Attempt to mode app specific settings before first unlock.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1004, v20);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

      a6 = 0;
    }
  }

  return a6;
}

void __93__DNDSAppSpecificSettingsManager_modeSpecificSettingsOfType_identifier_modeIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id obj;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  const __CFString *v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v34[0] = CFSTR("MODE_ID");
  v34[1] = CFSTR("SETTINGS_ID");
  v35[0] = v4;
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v35[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("PerModeSettingsForModeID"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  objc_msgSend(*(id *)(a1 + 72), "appSpecificSettingsEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entitiesByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
      -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:].cold.1();
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D1D3E0];
    v32 = *MEMORY[0x1E0CB2D50];
    v33 = CFSTR("Model does not contain provided entity name.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 1006, v16);
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v24;
    goto LABEL_16;
  }
  objc_msgSend(v8, "setEntity:", v13);
  v14 = (uint64_t *)(a1 + 56);
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v15 + 40);
  objc_msgSend(v8, "execute:", &obj);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v15 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
      __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke_cold_2();
    v17 = (void *)MEMORY[0x1E0CB35C8];
    v18 = *MEMORY[0x1E0D1D3E0];
    v30 = *MEMORY[0x1E0CB2D50];
    v31 = CFSTR("Failed to fetch settings.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", v18, 1008, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *v14;
    goto LABEL_15;
  }
  if (objc_msgSend(v16, "count"))
  {
    v26 = *(void **)(a1 + 72);
    objc_msgSend(v16, "firstObject");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "appSpecificSettingsForManagedObject:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1 + 64);
LABEL_15:
    v27 = *(_QWORD *)(v21 + 8);
    v28 = *(void **)(v27 + 40);
    *(_QWORD *)(v27 + 40) = v20;

LABEL_16:
  }

}

- (id)appSpecificSettingsOfType:(Class)a3 identifier:(id)a4 modeIdentifier:(id)a5 applicationIdentifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint8_t *v36;
  Class v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  const __CFString *v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasUnlockedSinceBoot");

  if ((v16 & 1) != 0)
  {
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__13;
    v48 = __Block_byref_object_dispose__13;
    v49 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__13;
    v42 = __Block_byref_object_dispose__13;
    v43 = 0;
    objc_msgSend(v14, "bundleID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17 == 0;

    if (v18)
    {
      v26 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D50];
      v53 = CFSTR("Application's bundle identifier not valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v21);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v13)
      {
        -[DNDSAppSpecificSettingsManager store](self, "store");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v19, "newManagedObjectContext");

        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __114__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_identifier_modeIdentifier_applicationIdentifier_error___block_invoke;
        v30[3] = &unk_1E86A7AD0;
        v21 = v20;
        v31 = v21;
        v32 = v14;
        v33 = v13;
        v34 = v12;
        v35 = &v38;
        v36 = buf;
        v37 = a3;
        objc_msgSend(v21, "performBlockAndWait:", v30);

        v22 = v31;
LABEL_12:

        if (a7)
          *a7 = objc_retainAutorelease((id)v39[5]);
        a7 = (id *)*((id *)v45 + 5);
        _Block_object_dispose(&v38, 8);

        _Block_object_dispose(buf, 8);
        goto LABEL_15;
      }
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v50 = *MEMORY[0x1E0CB2D50];
      v51 = CFSTR("Mode identifier not valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v21);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v22 = (void *)v39[5];
    v39[5] = v27;
    goto LABEL_12;
  }
  v23 = DNDSLogAppSpecificSettingsManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v23, OS_LOG_TYPE_DEFAULT, "Attempt to get app specific settings before first unlock.", buf, 2u);
  }
  if (a7)
  {
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v54 = *MEMORY[0x1E0CB2D50];
    v55[0] = CFSTR("Attempt to get app specific settings before first unlock.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, &v54, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1004, v25);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
  }
LABEL_15:

  return a7;
}

void __114__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_identifier_modeIdentifier_applicationIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id obj;
  uint64_t v31;
  const __CFString *v32;
  uint64_t v33;
  const __CFString *v34;
  _QWORD v35[3];
  _QWORD v36[4];

  v36[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = CFSTR("BUNDLE_ID");
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v36[0] = v4;
  v36[1] = v5;
  v35[1] = CFSTR("MODE_ID");
  v35[2] = CFSTR("SETTINGS_ID");
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v36[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("PerAppSettingsForAppModeID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  objc_msgSend(*(id *)(a1 + 80), "appSpecificSettingsEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entitiesByName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
      -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:].cold.1();
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v24 = *MEMORY[0x1E0D1D3E0];
    v33 = *MEMORY[0x1E0CB2D50];
    v34 = CFSTR("Model does not contain provided entity name.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", v24, 1006, v17);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v20 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v25;
    goto LABEL_16;
  }
  objc_msgSend(v9, "setEntity:", v14);
  v15 = (uint64_t *)(a1 + 64);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v16 + 40);
  objc_msgSend(v9, "execute:", &obj);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v16 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
      __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke_cold_2();
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D1D3E0];
    v31 = *MEMORY[0x1E0CB2D50];
    v32 = CFSTR("Failed to fetch settings.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 1008, v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *v15;
    goto LABEL_15;
  }
  if (objc_msgSend(v17, "count"))
  {
    v27 = *(void **)(a1 + 80);
    objc_msgSend(v17, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "appSpecificSettingsForManagedObject:", v20);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(_QWORD *)(a1 + 72);
LABEL_15:
    v28 = *(_QWORD *)(v22 + 8);
    v29 = *(void **)(v28 + 40);
    *(_QWORD *)(v28 + 40) = v21;

LABEL_16:
  }

}

- (BOOL)setModeSpecificSettings:(id)a3 identifier:(id)a4 type:(Class)a5 modeIdentifier:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  DNDSAppSpecificSettingsManager *v31;
  uint64_t *v32;
  uint64_t *v33;
  Class v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hasUnlockedSinceBoot");

  if ((v16 & 1) != 0)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__13;
    v43 = __Block_byref_object_dispose__13;
    v44 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 1;
    if (v14)
    {
      -[DNDSAppSpecificSettingsManager store](self, "store");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v17, "newManagedObjectContext");

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke;
      v26[3] = &unk_1E86A7AF8;
      v19 = v18;
      v27 = v19;
      v28 = v14;
      v34 = a5;
      v29 = v13;
      v32 = &v39;
      v33 = &v35;
      v30 = v12;
      v31 = self;
      objc_msgSend(v19, "performBlockAndWait:", v26);

      v20 = v27;
    }
    else
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0CB2D50];
      v46 = CFSTR("Mode identifier not valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v19);
      v24 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v40[5];
      v40[5] = v24;
    }

    if (a7)
      *a7 = objc_retainAutorelease((id)v40[5]);
    LOBYTE(a7) = *((_BYTE *)v36 + 24) != 0;
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
      -[DNDSAppSpecificSettingsManager setModeSpecificSettings:identifier:type:modeIdentifier:error:].cold.1();
    if (a7)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v47 = *MEMORY[0x1E0CB2D50];
      v48[0] = CFSTR("Attempt to set mode specific settings before first unlock.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v47, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1004, v22);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a7) = 0;
    }
  }

  return (char)a7;
}

void __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  DNDFocusModeMO *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  uint64_t v47;
  char v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  id v63;
  id obj;
  uint64_t v65;
  uint64_t v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  const __CFString *v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  _QWORD v79[2];
  _QWORD v80[4];

  v80[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v80[0] = *(_QWORD *)(a1 + 40);
  v79[0] = CFSTR("MODE_ID");
  v79[1] = CFSTR("SETTINGS_ID");
  v5 = v4;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v80[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("PerModeSettingsForModeID"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  objc_msgSend(v7, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 88), "appSpecificSettingsEntity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entitiesByName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v7, "setEntity:", v12);
    v13 = *(void **)(a1 + 32);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    obj = *(id *)(v14 + 40);
    objc_msgSend(v13, "executeFetchRequest:error:", v7, &obj);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v14 + 40), obj);
    v16 = (void *)DNDSLogAppSpecificSettingsManager;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
        __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_4();
      if (!*(_QWORD *)(a1 + 56))
      {
        v33 = (void *)MEMORY[0x1E0CB35C8];
        v34 = *MEMORY[0x1E0D1D3E0];
        v75 = *MEMORY[0x1E0CB2D50];
        v76 = CFSTR("Failed to fetch settings to delete.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "errorWithDomain:code:userInfo:", v34, 1008, v35);
        v36 = objc_claimAutoreleasedReturnValue();
        v37 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v38 = *(void **)(v37 + 40);
        *(_QWORD *)(v37 + 40) = v36;

        v19 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
        v22 = v12;
LABEL_42:

        goto LABEL_43;
      }
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = 0;

      if (!*(_QWORD *)(a1 + 56))
      {
        v19 = 0;
LABEL_29:
        v22 = v12;
LABEL_30:
        if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
        {
          v46 = *(void **)(a1 + 32);
          v47 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          v63 = *(id *)(v47 + 40);
          v48 = objc_msgSend(v46, "save:", &v63);
          objc_storeStrong((id *)(v47 + 40), v63);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v48;
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
            && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
          {
            v55 = DNDSLogAppSpecificSettingsManager;
            if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
            {
              v57 = *(_QWORD *)(a1 + 40);
              v56 = *(void **)(a1 + 48);
              *(_DWORD *)buf = 138543618;
              v68 = v56;
              v69 = 2114;
              v70 = v57;
              _os_log_impl(&dword_1CB895000, v55, OS_LOG_TYPE_DEFAULT, "Committed mode settings for %{public}@ in %{public}@", buf, 0x16u);
            }
            v58 = *(void **)(a1 + 64);
            if (*(_QWORD *)(a1 + 56))
            {
              v66 = *(_QWORD *)(a1 + 40);
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v58;
              v61 = v59;
              v62 = 0;
            }
            else
            {
              v65 = *(_QWORD *)(a1 + 40);
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v65, 1);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              v60 = v58;
              v61 = 0;
              v62 = v59;
            }
            objc_msgSend(v60, "_modesToSave:modesToDelete:", v61, v62);

          }
          else
          {
            if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
              __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_2();
            v49 = (void *)MEMORY[0x1E0CB35C8];
            v50 = *MEMORY[0x1E0D1D3E0];
            v71 = *MEMORY[0x1E0CB2D50];
            v72 = CFSTR("Failed to commit settings.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "errorWithDomain:code:userInfo:", v50, 1008, v51);
            v52 = objc_claimAutoreleasedReturnValue();
            v53 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            v54 = *(void **)(v53 + 40);
            *(_QWORD *)(v53 + 40) = v52;

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
          }
        }
        goto LABEL_42;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        v25 = (void *)MEMORY[0x1E0CB37E8];
        v26 = v16;
        objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v27;
        _os_log_impl(&dword_1CB895000, v26, OS_LOG_TYPE_DEFAULT, "Fetched %{public}@ settings for set/clear.", buf, 0xCu);

      }
      objc_msgSend(v15, "firstObject");
      v28 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v28;
      v29 = *(_QWORD *)(a1 + 56);
      if (!v29)
      {
        if (v28)
          objc_msgSend(*(id *)(a1 + 32), "deleteObject:", v28);
        goto LABEL_29;
      }
      if (v28)
      {
        v22 = v12;
LABEL_22:
        objc_msgSend(*(id *)(a1 + 88), "completeManagedObject:forAppSpecificSettings:", v19, v29);
        goto LABEL_30;
      }
    }
    v30 = (void *)MEMORY[0x1E0C97B20];
    objc_msgSend(*(id *)(a1 + 88), "appSpecificSettingsEntity");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "entityForName:inManagedObjectContext:", v31, *(_QWORD *)(a1 + 32));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B80]), "initWithEntity:insertIntoManagedObjectContext:", v22, *(_QWORD *)(a1 + 32));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v39 = (void *)DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
        __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_3(v39);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 0;
      v40 = (void *)MEMORY[0x1E0CB35C8];
      v41 = *MEMORY[0x1E0D1D3E0];
      v73 = *MEMORY[0x1E0CB2D50];
      v74 = CFSTR("Unexpected managed object class for entity.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v74, &v73, 1);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 1006, v42);
      v43 = objc_claimAutoreleasedReturnValue();
      v44 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v45 = *(void **)(v44 + 40);
      *(_QWORD *)(v44 + 40) = v43;

      goto LABEL_42;
    }
    objc_msgSend(v19, "setIdentifier:", *(_QWORD *)(a1 + 48));
    v32 = -[DNDFocusModeMO initWithContext:]([DNDFocusModeMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
    -[DNDFocusModeMO setIdentifier:](v32, "setIdentifier:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v32, 1);
    objc_msgSend(v19, "setMode:", v32);

    v29 = *(_QWORD *)(a1 + 56);
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
    -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:].cold.1();
  v20 = (void *)MEMORY[0x1E0CB35C8];
  v21 = *MEMORY[0x1E0D1D3E0];
  v77 = *MEMORY[0x1E0CB2D50];
  v78 = CFSTR("Model does not contain provided entity name.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 1006, v22);
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v19 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;
LABEL_43:

}

- (BOOL)setAppSpecificSettings:(id)a3 identifier:(id)a4 type:(Class)a5 applicationIdentifier:(id)a6 modeIdentifier:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  char v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  DNDSAppSpecificSettingsManager *v38;
  uint64_t *v39;
  uint64_t *v40;
  Class v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  const __CFString *v53;
  uint64_t v54;
  const __CFString *v55;
  uint64_t v56;
  _QWORD v57[2];

  v57[1] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "hasUnlockedSinceBoot");

  if ((v19 & 1) != 0)
  {
    v46 = 0;
    v47 = &v46;
    v48 = 0x3032000000;
    v49 = __Block_byref_object_copy__13;
    v50 = __Block_byref_object_dispose__13;
    v51 = 0;
    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 1;
    objc_msgSend(v16, "bundleID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20 == 0;

    if (v21)
    {
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v54 = *MEMORY[0x1E0CB2D50];
      v55 = CFSTR("Application's bundle identifier not valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v24);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v17)
      {
        -[DNDSAppSpecificSettingsManager store](self, "store");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "newManagedObjectContext");

        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __116__DNDSAppSpecificSettingsManager_setAppSpecificSettings_identifier_type_applicationIdentifier_modeIdentifier_error___block_invoke;
        v32[3] = &unk_1E86A7B20;
        v24 = v23;
        v33 = v24;
        v34 = v16;
        v35 = v17;
        v41 = a5;
        v36 = v15;
        v39 = &v46;
        v40 = &v42;
        v37 = v14;
        v38 = self;
        objc_msgSend(v24, "performBlockAndWait:", v32);

        v25 = v33;
LABEL_12:

        if (a8)
          *a8 = objc_retainAutorelease((id)v47[5]);
        LOBYTE(a8) = *((_BYTE *)v43 + 24) != 0;
        _Block_object_dispose(&v42, 8);
        _Block_object_dispose(&v46, 8);

        goto LABEL_15;
      }
      v30 = (void *)MEMORY[0x1E0CB35C8];
      v52 = *MEMORY[0x1E0CB2D50];
      v53 = CFSTR("Mode identifier not valid.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
      v24 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1006, v24);
      v29 = objc_claimAutoreleasedReturnValue();
    }
    v25 = (void *)v47[5];
    v47[5] = v29;
    goto LABEL_12;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
    -[DNDSAppSpecificSettingsManager setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:].cold.1();
  if (a8)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v56 = *MEMORY[0x1E0CB2D50];
    v57[0] = CFSTR("Attempt to set app specific settings before first unlock.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, &v56, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1004, v27);
    *a8 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a8) = 0;
  }
LABEL_15:

  return (char)a8;
}

void __116__DNDSAppSpecificSettingsManager_setAppSpecificSettings_identifier_type_applicationIdentifier_modeIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
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
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  DNDApplicationMO *v34;
  void *v35;
  DNDFocusModeMO *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  char v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  NSObject *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id obj;
  uint64_t v69;
  uint64_t v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  uint64_t v74;
  uint64_t v75;
  const __CFString *v76;
  uint64_t v77;
  const __CFString *v78;
  uint64_t v79;
  const __CFString *v80;
  uint64_t v81;
  const __CFString *v82;
  _QWORD v83[3];
  _QWORD v84[5];

  v84[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v83[0] = CFSTR("BUNDLE_ID");
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  v6 = *(void **)(a1 + 56);
  v84[0] = v4;
  v84[1] = v5;
  v83[1] = CFSTR("MODE_ID");
  v83[2] = CFSTR("SETTINGS_ID");
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v84[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("PerAppSettingsForAppModeID"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  objc_msgSend(v9, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 96), "appSpecificSettingsEntity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "managedObjectModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "entitiesByName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v9, "setEntity:", v14);
    v15 = *(void **)(a1 + 32);
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v16 + 40);
    objc_msgSend(v15, "executeFetchRequest:error:", v9, &obj);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v16 + 40), obj);
    v18 = (void *)DNDSLogAppSpecificSettingsManager;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
        __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_4();
      if (!*(_QWORD *)(a1 + 64))
      {
        v37 = (void *)MEMORY[0x1E0CB35C8];
        v38 = *MEMORY[0x1E0D1D3E0];
        v79 = *MEMORY[0x1E0CB2D50];
        v80 = CFSTR("Failed to fetch settings to delete.");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v80, &v79, 1);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "errorWithDomain:code:userInfo:", v38, 1008, v39);
        v40 = objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
        v42 = *(void **)(v41 + 40);
        *(_QWORD *)(v41 + 40) = v40;

        v21 = 0;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
        v24 = v14;
LABEL_42:

        goto LABEL_43;
      }
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v20 = *(void **)(v19 + 40);
      *(_QWORD *)(v19 + 40) = 0;

      if (!*(_QWORD *)(a1 + 64))
      {
        v21 = 0;
LABEL_29:
        v24 = v14;
LABEL_30:
        if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
        {
          v50 = *(void **)(a1 + 32);
          v51 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
          v67 = *(id *)(v51 + 40);
          v52 = objc_msgSend(v50, "save:", &v67);
          objc_storeStrong((id *)(v51 + 40), v67);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = v52;
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)
            && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
          {
            v59 = DNDSLogAppSpecificSettingsManager;
            if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
            {
              v60 = *(void **)(a1 + 40);
              v61 = *(_QWORD *)(a1 + 48);
              *(_DWORD *)buf = 138543618;
              v72 = v60;
              v73 = 2114;
              v74 = v61;
              _os_log_impl(&dword_1CB895000, v59, OS_LOG_TYPE_DEFAULT, "Committed settings for %{public}@ in %{public}@", buf, 0x16u);
            }
            v62 = *(void **)(a1 + 72);
            if (*(_QWORD *)(a1 + 64))
            {
              v70 = *(_QWORD *)(a1 + 48);
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v62;
              v65 = v63;
              v66 = 0;
            }
            else
            {
              v69 = *(_QWORD *)(a1 + 48);
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v64 = v62;
              v65 = 0;
              v66 = v63;
            }
            objc_msgSend(v64, "_modesToSave:modesToDelete:", v65, v66);

          }
          else
          {
            if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
              __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_2();
            v53 = (void *)MEMORY[0x1E0CB35C8];
            v54 = *MEMORY[0x1E0D1D3E0];
            v75 = *MEMORY[0x1E0CB2D50];
            v76 = CFSTR("Failed to commit settings.");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "errorWithDomain:code:userInfo:", v54, 1008, v55);
            v56 = objc_claimAutoreleasedReturnValue();
            v57 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
            v58 = *(void **)(v57 + 40);
            *(_QWORD *)(v57 + 40) = v56;

            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
          }
        }
        goto LABEL_42;
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        v27 = (void *)MEMORY[0x1E0CB37E8];
        v28 = v18;
        objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v17, "count"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v72 = v29;
        _os_log_impl(&dword_1CB895000, v28, OS_LOG_TYPE_DEFAULT, "Fetched %@ settings for set/clear.", buf, 0xCu);

      }
      objc_msgSend(v17, "firstObject");
      v30 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v30;
      v31 = *(_QWORD *)(a1 + 64);
      if (!v31)
      {
        if (v30)
          objc_msgSend(*(id *)(a1 + 32), "deleteObject:", v30);
        goto LABEL_29;
      }
      if (v30)
      {
        v24 = v14;
LABEL_22:
        objc_msgSend(*(id *)(a1 + 96), "completeManagedObject:forAppSpecificSettings:", v21, v31);
        goto LABEL_30;
      }
    }
    v32 = (void *)MEMORY[0x1E0C97B20];
    objc_msgSend(*(id *)(a1 + 96), "appSpecificSettingsEntity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "entityForName:inManagedObjectContext:", v33, *(_QWORD *)(a1 + 32));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B80]), "initWithEntity:insertIntoManagedObjectContext:", v24, *(_QWORD *)(a1 + 32));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v43 = (void *)DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
        __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_3(v43);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0D1D3E0];
      v77 = *MEMORY[0x1E0CB2D50];
      v78 = CFSTR("Unexpected managed object class for entity.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v78, &v77, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, 1006, v46);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v49 = *(void **)(v48 + 40);
      *(_QWORD *)(v48 + 40) = v47;

      goto LABEL_42;
    }
    objc_msgSend(v21, "setIdentifier:", *(_QWORD *)(a1 + 56));
    v34 = -[DNDApplicationMO initWithContext:]([DNDApplicationMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 40), "bundleID");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[DNDApplicationMO setBundleIdentifier:](v34, "setBundleIdentifier:", v35);

    objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v34, 1);
    objc_msgSend(v21, "setApplication:", v34);
    v36 = -[DNDFocusModeMO initWithContext:]([DNDFocusModeMO alloc], "initWithContext:", *(_QWORD *)(a1 + 32));
    -[DNDFocusModeMO setIdentifier:](v36, "setIdentifier:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "refreshObject:mergeChanges:", v36, 1);
    objc_msgSend(v21, "setMode:", v36);

    v31 = *(_QWORD *)(a1 + 64);
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
    -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:].cold.1();
  v22 = (void *)MEMORY[0x1E0CB35C8];
  v23 = *MEMORY[0x1E0D1D3E0];
  v81 = *MEMORY[0x1E0CB2D50];
  v82 = CFSTR("Model does not contain provided entity name.");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v82, &v81, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 1006, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v21 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;
LABEL_43:

}

- (BOOL)removeModeSpecificSettingsForModeIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  DNDSAppSpecificSettingsManager *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasUnlockedSinceBoot");

  if ((v8 & 1) != 0)
  {
    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__13;
    v29 = __Block_byref_object_dispose__13;
    v30 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 1;
    -[DNDSAppSpecificSettingsManager store](self, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newManagedObjectContext");

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke;
    v15[3] = &unk_1E86A7B48;
    v11 = v10;
    v16 = v11;
    v19 = &v25;
    v20 = &v21;
    v17 = v6;
    v18 = self;
    objc_msgSend(v11, "performBlockAndWait:", v15);
    if (a4)
      *a4 = objc_retainAutorelease((id)v26[5]);
    LOBYTE(a4) = *((_BYTE *)v22 + 24) != 0;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
      -[DNDSAppSpecificSettingsManager removeModeSpecificSettingsForModeIdentifier:error:].cold.1();
    if (a4)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("Attempt to remove mode specific settings before first unlock.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1004, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

void __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  char v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id obj;
  uint64_t v40;
  uint64_t v41;
  const __CFString *v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;
  const __CFString *v48;
  const __CFString *v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v49 = CFSTR("MODE_ID");
  v50[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, &v49, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("ModeForModeIdentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v6);
  objc_msgSend(v7, "setResultType:", 2);
  v8 = *(void **)(a1 + 32);
  v9 = a1 + 56;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v8, "executeRequest:error:", v7, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  v12 = (void *)DNDSLogAppSpecificSettingsManager;
  v13 = (uint64_t *)MEMORY[0x1E0D1D3E0];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
      __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke_cold_1();
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *v13;
    v47 = *MEMORY[0x1E0CB2D50];
    v48 = CFSTR("Failed to remote settings.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 1008, v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)v9 + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

    v20 = *(_QWORD *)(*(_QWORD *)v9 + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = 0;

  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    v22 = v12;
    objc_msgSend(v11, "result");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v44 = v23;
    v45 = 2114;
    v46 = v24;
    _os_log_impl(&dword_1CB895000, v22, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ settings for mode %{public}@.", buf, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v25 = *(void **)(a1 + 32);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v38 = *(id *)(v26 + 40);
    v27 = objc_msgSend(v25, "save:", &v38);
    objc_storeStrong((id *)(v26 + 40), v38);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v27;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)
      && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40))
    {
      v34 = DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        v35 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v44 = v35;
        _os_log_impl(&dword_1CB895000, v34, OS_LOG_TYPE_DEFAULT, "Committed settings removal for mode %{public}@", buf, 0xCu);
      }
      v36 = *(void **)(a1 + 48);
      v40 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "_modesToSave:modesToDelete:", 0, v37);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
        __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke_cold_1();
      v28 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0D1D3E0];
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = CFSTR("Failed to remove settings.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "errorWithDomain:code:userInfo:", v29, 1008, v30);
      v31 = objc_claimAutoreleasedReturnValue();
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v33 = *(void **)(v32 + 40);
      *(_QWORD *)(v32 + 40) = v31;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }
  }

}

- (id)removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  DNDSAppSpecificSettingsManager *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint8_t buf[4];
  id v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasUnlockedSinceBoot");

  if ((v8 & 1) != 0)
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__13;
    v32 = __Block_byref_object_dispose__13;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__13;
    v26 = __Block_byref_object_dispose__13;
    v27 = 0;
    v9 = DNDSLogAppSpecificSettingsManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v6;
      _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_DEFAULT, "Removing settings for modes not in %{public}@.", buf, 0xCu);
    }
    -[DNDSAppSpecificSettingsManager store](self, "store");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "newManagedObjectContext");

    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke;
    v16[3] = &unk_1E86A7B48;
    v17 = v6;
    v12 = v11;
    v20 = &v28;
    v21 = &v22;
    v18 = v12;
    v19 = self;
    objc_msgSend(v12, "performBlockAndWait:", v16);
    if (a4)
      *a4 = objc_retainAutorelease((id)v29[5]);
    a4 = (id *)(id)v23[5];

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v28, 8);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
      -[DNDSAppSpecificSettingsManager removeModeSpecificSettingsForModeIdentifier:error:].cold.1();
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      v37[0] = CFSTR("Attempt to remove mode specific settings before first unlock.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1004, v14);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }

  return a4;
}

void __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  objc_class *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  int v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  id obj;
  uint64_t v69;
  const __CFString *v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  void *v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;
  _QWORD v78[4];

  v1 = a1;
  v78[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("identifier IN (%@)"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "notPredicateWithSubpredicate:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  +[DNDFocusModeMO fetchRequest](DNDFocusModeMO, "fetchRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v3);
  objc_msgSend(v4, "setIncludesPendingChanges:", 1);
  v5 = *(void **)(v1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v5, "executeFetchRequest:error:", v4, &obj);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v6 + 40), obj);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 56) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
      __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke_cold_2();
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0D1D3E0];
    v77 = *MEMORY[0x1E0CB2D50];
    v78[0] = CFSTR("Failed to fetch settings to delete.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, &v77, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, 1008);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }
  else
  {
    v46 = v1 + 56;
    v48 = v4;
    v49 = v3;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v7, "count"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0u;
    v65 = 0u;
    v66 = 0u;
    v67 = 0u;
    v47 = v7;
    v50 = v7;
    v54 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    if (v54)
    {
      v51 = *(_QWORD *)v65;
      v52 = v1;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v65 != v51)
            objc_enumerationMutation(v50);
          v57 = v13;
          v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v13);
          objc_msgSend(v14, "identifier");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v63 = 0u;
          v55 = v14;
          objc_msgSend(v14, "settings");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v61;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v61 != v19)
                  objc_enumerationMutation(v16);
                v21 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v22 = (objc_class *)MEMORY[0x1E0D1D598];
                  v23 = v21;
                  v24 = [v22 alloc];
                  objc_msgSend(v23, "application");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "bundleIdentifier");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v27 = (void *)objc_msgSend(v24, "initWithBundleID:", v26);
                  objc_msgSend(v15, "addObject:", v27);

                }
                else
                {
                  v28 = (objc_class *)objc_msgSend(v21, "dnd_settingsType");
                  NSStringFromClass(v28);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(&unk_1E86DEFB8, "containsObject:", v25) & 1) != 0)
                  {
                    -[objc_class appSpecificSettingsForManagedObject:](v28, "appSpecificSettingsForManagedObject:", v21);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v29)
                      objc_msgSend(v58, "addObject:", v29);

                  }
                  else
                  {
                    v30 = DNDSLogAppSpecificSettingsManager;
                    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
                    {
                      *(_DWORD *)buf = 138543362;
                      v72 = v25;
                    }
                  }
                }

              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v60, v75, 16);
            }
            while (v18);
          }

          v31 = (void *)objc_opt_new();
          objc_msgSend(v31, "setApplicationIdentifiers:", v15);
          objc_msgSend(v31, "setModeSpecificSettings:", v58);
          objc_msgSend(v53, "setObject:forKeyedSubscript:", v31, v56);
          v32 = DNDSLogAppSpecificSettingsManager;
          if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v72 = v56;
            v73 = 2114;
            v74 = v15;
            _os_log_impl(&dword_1CB895000, v32, OS_LOG_TYPE_DEFAULT, "Removing settings for %{public}@; apps=%{public}@",
              buf,
              0x16u);
          }
          v1 = v52;
          objc_msgSend(*(id *)(v52 + 40), "deleteObject:", v55);

          v13 = v57 + 1;
        }
        while (v57 + 1 != v54);
        v54 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
      }
      while (v54);
    }

    if (!objc_msgSend(*(id *)(v1 + 40), "hasChanges"))
    {
      v4 = v48;
      v3 = v49;
      v7 = v47;
      goto LABEL_37;
    }
    v33 = *(void **)(v1 + 40);
    v34 = *(_QWORD *)(*(_QWORD *)(v1 + 56) + 8);
    v59 = *(id *)(v34 + 40);
    v35 = objc_msgSend(v33, "save:", &v59);
    objc_storeStrong((id *)(v34 + 40), v59);
    v4 = v48;
    v3 = v49;
    if (v35 && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v46 + 8) + 40))
    {
      v41 = DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CB895000, v41, OS_LOG_TYPE_DEFAULT, "Changes did commit.", buf, 2u);
      }
      v42 = objc_msgSend(v53, "copy");
      v43 = *(_QWORD *)(*(_QWORD *)(v1 + 64) + 8);
      v44 = *(void **)(v43 + 40);
      *(_QWORD *)(v43 + 40) = v42;

      v45 = *(void **)(v1 + 48);
      objc_msgSend(v53, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "_modesToSave:modesToDelete:", 0, v12);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
        __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke_cold_1();
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0D1D3E0];
      v69 = *MEMORY[0x1E0CB2D50];
      v70 = CFSTR("Failed to commit changes.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 1008, v12);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = *(_QWORD *)(*(_QWORD *)v46 + 8);
      v40 = *(void **)(v39 + 40);
      *(_QWORD *)(v39 + 40) = v38;

    }
    v7 = v47;
  }

LABEL_37:
}

- (BOOL)removeAppSpecificSettingsForApplicationIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[DNDSKeybag sharedInstance](DNDSKeybag, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasUnlockedSinceBoot");

  if ((v8 & 1) != 0)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__13;
    v28 = __Block_byref_object_dispose__13;
    v29 = 0;
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 1;
    -[DNDSAppSpecificSettingsManager store](self, "store");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "newManagedObjectContext");

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __90__DNDSAppSpecificSettingsManager_removeAppSpecificSettingsForApplicationIdentifier_error___block_invoke;
    v15[3] = &unk_1E86A7B70;
    v11 = v10;
    v16 = v11;
    v17 = v6;
    v18 = &v24;
    v19 = &v20;
    objc_msgSend(v11, "performBlockAndWait:", v15);
    if (a4)
      *a4 = objc_retainAutorelease((id)v25[5]);
    LOBYTE(a4) = *((_BYTE *)v21 + 24) != 0;

    _Block_object_dispose(&v20, 8);
    _Block_object_dispose(&v24, 8);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
      -[DNDSAppSpecificSettingsManager removeAppSpecificSettingsForApplicationIdentifier:error:].cold.1();
    if (a4)
    {
      v12 = (void *)MEMORY[0x1E0CB35C8];
      v30 = *MEMORY[0x1E0CB2D50];
      v31[0] = CFSTR("Attempt to remove app specific settings before first unlock.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D1D3E0], 1004, v13);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a4) = 0;
    }
  }

  return (char)a4;
}

void __90__DNDSAppSpecificSettingsManager_removeAppSpecificSettingsForApplicationIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id obj;
  uint64_t v31;
  const __CFString *v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  uint64_t v36;
  const __CFString *v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = CFSTR("BUNDLE_ID");
  objc_msgSend(*(id *)(a1 + 40), "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("ApplicationForBundleIdentifier"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v6);
  objc_msgSend(v7, "setResultType:", 2);
  v8 = *(void **)(a1 + 32);
  v9 = a1 + 48;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v10 + 40);
  objc_msgSend(v8, "executeRequest:error:", v7, &obj);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v10 + 40), obj);
  v12 = (void *)DNDSLogAppSpecificSettingsManager;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
      __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke_cold_1();
    v13 = *(_QWORD *)(*(_QWORD *)v9 + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    v15 = v12;
    objc_msgSend(v11, "result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v34 = v16;
    v35 = 2114;
    v36 = v17;
    _os_log_impl(&dword_1CB895000, v15, OS_LOG_TYPE_DEFAULT, "Removed %{public}@ settings for app %{public}@.", buf, 0x16u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v29 = *(id *)(v19 + 40);
    v20 = objc_msgSend(v18, "save:", &v29);
    objc_storeStrong((id *)(v19 + 40), v29);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v20;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24)
      && !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v9 + 8) + 40))
    {
      v27 = DNDSLogAppSpecificSettingsManager;
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
      {
        v28 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543362;
        v34 = v28;
        _os_log_impl(&dword_1CB895000, v27, OS_LOG_TYPE_DEFAULT, "Removed settings for app %{public}@", buf, 0xCu);
      }
    }
    else
    {
      if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
        __90__DNDSAppSpecificSettingsManager_removeAppSpecificSettingsForApplicationIdentifier_error___block_invoke_cold_1();
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0D1D3E0];
      v31 = *MEMORY[0x1E0CB2D50];
      v32 = CFSTR("Failed to remove app settings.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v32, &v31, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1008, v23);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v26 = *(void **)(v25 + 40);
      *(_QWORD *)(v25 + 40) = v24;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
  }

}

- (id)_allModeSpecificSettingsOfType:(Class)a3
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  Class v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__DNDSAppSpecificSettingsManager__allModeSpecificSettingsOfType___block_invoke;
  v8[3] = &unk_1E86A7B98;
  v6 = v5;
  v9 = v6;
  v10 = a3;
  -[DNDSAppSpecificSettingsManager _allPerModeSettingsMOsOfType:processBlock:](self, "_allPerModeSettingsMOsOfType:processBlock:", a3, v8);

  return v6;
}

void __65__DNDSAppSpecificSettingsManager__allModeSpecificSettingsOfType___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "mode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v4);

  }
  objc_msgSend(*(id *)(a1 + 40), "appSpecificSettingsForManagedObject:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v7);

  }
}

- (id)_allAppSpecificSettingsOfType:(Class)a3
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  Class v10;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__DNDSAppSpecificSettingsManager__allAppSpecificSettingsOfType___block_invoke;
  v8[3] = &unk_1E86A7B98;
  v6 = v5;
  v9 = v6;
  v10 = a3;
  -[DNDSAppSpecificSettingsManager _allPerModeSettingsMOsOfType:processBlock:](self, "_allPerModeSettingsMOsOfType:processBlock:", a3, v8);

  return v6;
}

void __64__DNDSAppSpecificSettingsManager__allAppSpecificSettingsOfType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "mode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v5);

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0D1D598]);
    objc_msgSend(v3, "application");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithBundleID:", v11);

    objc_msgSend(v8, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E60]);
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v12);

    }
    objc_msgSend(*(id *)(a1 + 40), "appSpecificSettingsForManagedObject:", v3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setByAddingObject:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, v12);

    }
  }
  else
  {
    v18 = (void *)DNDSLogAppSpecificSettingsManager;
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
      __64__DNDSAppSpecificSettingsManager__allAppSpecificSettingsOfType___block_invoke_cold_1(v18);
  }

}

- (void)_allPerModeSettingsMOsOfType:(Class)a3 processBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  -[DNDSAppSpecificSettingsManager store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newManagedObjectContext");

  -[objc_class appSpecificSettingsEntity](a3, "appSpecificSettingsEntity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentStoreCoordinator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "managedObjectModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "entitiesByName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke;
    v14[3] = &unk_1E86A5920;
    v15 = v9;
    v16 = v6;
    objc_msgSend(v8, "performBlockAndWait:", v14);

  }
  else if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
  {
    -[DNDSAppSpecificSettingsManager _perModeSettingsMOsOfType:modeIdentifier:processBlock:].cold.1();
  }

}

void __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v2, "execute:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v15;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
      __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke_cold_1();
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)MEMORY[0x1D17A0B90](v6);
          (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
          objc_autoreleasePoolPop(v10);
          ++v9;
        }
        while (v7 != v9);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        v7 = v6;
      }
      while (v6);
    }

  }
}

- (void)idsSyncEngine:(id)a3 didFetchRecord:(id)a4
{
  id v4;

  v4 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
    -[DNDSAppSpecificSettingsManager idsSyncEngine:didFetchRecord:].cold.1();

}

- (void)idsSyncEngine:(id)a3 prepareRecordToSave:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = DNDSLogAppSpecificSettingsManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v5;
    _os_log_impl(&dword_1CB895000, v6, OS_LOG_TYPE_DEFAULT, "prepareRecordToSave: %@", buf, 0xCu);
  }
  objc_msgSend(v5, "recordID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[DNDSAppSpecificSettingsManager store](self, "store");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "newManagedObjectContext");

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__DNDSAppSpecificSettingsManager_idsSyncEngine_prepareRecordToSave___block_invoke;
  v14[3] = &unk_1E86A58D0;
  v15 = v10;
  v16 = v8;
  v17 = v5;
  v11 = v5;
  v12 = v8;
  v13 = v10;
  objc_msgSend(v13, "performBlockAndWait:", v14);

}

void __68__DNDSAppSpecificSettingsManager_idsSyncEngine_prepareRecordToSave___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  const __CFString *v37;
  _QWORD v38[3];

  v38[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v37 = CFSTR("MODE_ID");
  v38[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestFromTemplateWithName:substitutionVariables:", CFSTR("PerModeSettingsForMode"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[DNDPerAppSettingsMO entity](DNDPerAppSettingsMO, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEntity:", v7);

  v35 = 0;
  objc_msgSend(v6, "execute:", &v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v35;
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_ERROR))
      __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke_cold_1();
  }
  else
  {
    v27 = a1;
    v28 = v6;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v26 = v8;
    obj = v8;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0x1E0C99000uLL;
      v13 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v13)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          objc_msgSend(*(id *)(v12 + 3592), "dictionaryWithCapacity:", 4);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (objc_class *)objc_msgSend(v15, "dnd_settingsType");
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "application");
            v20 = v13;
            v21 = v11;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "bundleIdentifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            -[objc_class appSpecificSettingsForManagedObject:](v17, "appSpecificSettingsForManagedObject:", v15);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[objc_class dictionaryRepresentationForAppSpecificSettings:](v17, "dictionaryRepresentationForAppSpecificSettings:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v23, CFSTR("DNDSAppSpecificSettingsApp"));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v19, CFSTR("DNDSAppSpecificSettingsIdentifier"));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("DNDSAppSpecificSettingsType"));
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("DNDSAppSpecificSettingsPayload"));
            objc_msgSend(v29, "addObject:", v16);

            v11 = v21;
            v13 = v20;

            v12 = 0x1E0C99000;
          }

        }
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
    }

    objc_msgSend(*(id *)(v27 + 48), "setObject:forKey:", v29, CFSTR("DNDSAppSpecificSettingsRecord"));
    v6 = v28;
    v9 = 0;
    v8 = v26;
  }

}

- (void)idsSyncEngine:(id)a3 recordWithIDWasDeleted:(id)a4
{
  id v4;

  v4 = a4;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
    -[DNDSAppSpecificSettingsManager idsSyncEngine:recordWithIDWasDeleted:].cold.1();

}

- (void)purgeRecordsForIDSSyncEngine:(id)a3
{
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_FAULT))
    -[DNDSAppSpecificSettingsManager purgeRecordsForIDSSyncEngine:].cold.1();
}

- (id)recordIDsForIDSSyncEngine:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[16];

  v4 = DNDSLogAppSpecificSettingsManager;
  if (os_log_type_enabled((os_log_t)DNDSLogAppSpecificSettingsManager, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v4, OS_LOG_TYPE_DEFAULT, "recordIDsForIDSSyncEngine", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSAppSpecificSettingsManager store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "newManagedObjectContext");

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__DNDSAppSpecificSettingsManager_recordIDsForIDSSyncEngine___block_invoke;
  v13[3] = &unk_1E86A59E8;
  v14 = v7;
  v8 = v5;
  v15 = v8;
  v9 = v7;
  objc_msgSend(v9, "performBlockAndWait:", v13);
  v10 = v15;
  v11 = v8;

  return v11;
}

void __60__DNDSAppSpecificSettingsManager_recordIDsForIDSSyncEngine___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  DNDSIDSRecordID *v12;
  void *v13;
  DNDSIDSRecordID *v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  +[DNDFocusModeMO fetchRequest](DNDFocusModeMO, "fetchRequest");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v21 = 0;
  v16 = (void *)v2;
  objc_msgSend(v3, "executeFetchRequest:error:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
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
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = *(void **)(a1 + 40);
        v12 = [DNDSIDSRecordID alloc];
        objc_msgSend(v10, "identifier", v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[DNDSIDSRecordID initWithIdentifier:zone:](v12, "initWithIdentifier:zone:", v13, CFSTR("DNDSAppSpecificSettings"));
        objc_msgSend(v11, "addObject:", v14);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v7);
  }

}

- (void)_modesToSave:(id)a3 modesToDelete:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  DNDSIDSRecordID *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  DNDSIDSRecordID *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v27;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(v8);
        v13 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v12), CFSTR("DNDSAppSpecificSettings"));
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v10);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v6;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v23;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v23 != v18)
          objc_enumerationMutation(v15);
        v20 = -[DNDSIDSRecordID initWithIdentifier:zone:]([DNDSIDSRecordID alloc], "initWithIdentifier:zone:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19), CFSTR("DNDSAppSpecificSettings"));
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    }
    while (v17);
  }

  -[DNDSIDSSyncEngine addRecordIDsToSave:recordIDsToDelete:](self->_idsSyncEngine, "addRecordIDsToSave:recordIDsToDelete:", v7, v14);
}

- (DNDSCoreDataBackingStore)store
{
  return self->_store;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_idsSyncEngine, 0);
}

void __81__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_error___block_invoke_cold_1(uint8_t *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  NSObject *v6;
  objc_class *v7;
  void *v8;

  v6 = a2;
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138543362;
  *a4 = v8;
  _os_log_error_impl(&dword_1CB895000, v6, OS_LOG_TYPE_ERROR, "Unexpected result type for appSpecificSettings: %{public}@", a1, 0xCu);

}

- (void)_perModeSettingsMOsOfType:modeIdentifier:processBlock:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1CB895000, v0, v1, "Model does not contain entity with name %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __88__DNDSAppSpecificSettingsManager__perModeSettingsMOsOfType_modeIdentifier_processBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error querying settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __103__DNDSAppSpecificSettingsManager_appSpecificSettingsOfType_modeIdentifier_applicationIdentifier_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to fetch settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setModeSpecificSettings:identifier:type:modeIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_2(&dword_1CB895000, v0, v1, "Attempt to set mode specific settings before first unlock.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to commit settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_3(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  OUTLINED_FUNCTION_3_0(a1);
  v2 = (void *)OUTLINED_FUNCTION_10_0();
  v3 = OUTLINED_FUNCTION_13(v2);
  OUTLINED_FUNCTION_4_2(&dword_1CB895000, v1, v4, "Unexpected class for managed object: %{public}@", v5);

  OUTLINED_FUNCTION_6_0();
}

void __95__DNDSAppSpecificSettingsManager_setModeSpecificSettings_identifier_type_modeIdentifier_error___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to fetch existing settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setAppSpecificSettings:identifier:type:applicationIdentifier:modeIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_2(&dword_1CB895000, v0, v1, "Attempt to set app specific settings before first unlock.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

- (void)removeModeSpecificSettingsForModeIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_2(&dword_1CB895000, v0, v1, "Attempt to remove mode specific settings before first unlock.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __84__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifier_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to remove settings for mode: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to commit changes for modes not in: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __105__DNDSAppSpecificSettingsManager_removeModeSpecificSettingsForModeIdentifiersNotInModeIdentifiers_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to fetch modes to delete: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)removeAppSpecificSettingsForApplicationIdentifier:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_2(&dword_1CB895000, v0, v1, "Attempt to remove app specific settings before first unlock.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

void __90__DNDSAppSpecificSettingsManager_removeAppSpecificSettingsForApplicationIdentifier_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_4(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Failed to remove settings for app: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __64__DNDSAppSpecificSettingsManager__allAppSpecificSettingsOfType___block_invoke_cold_1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_3_0(a1);
  v2 = (objc_class *)OUTLINED_FUNCTION_10_0();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_1CB895000, v1, OS_LOG_TYPE_ERROR, "Unexpected result type for appSpecificSettings: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_6_0();
}

void __76__DNDSAppSpecificSettingsManager__allPerModeSettingsMOsOfType_processBlock___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0(&dword_1CB895000, v0, v1, "Error querying settings: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)idsSyncEngine:didFetchRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1CB895000, v0, v1, "Unexpected call to -idsSyncEngine:didFetchRecord:. Record: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)idsSyncEngine:recordWithIDWasDeleted:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_1(&dword_1CB895000, v0, v1, "Unexpected call to -idsSyncEngine:recordWithIDWasDeleted:. Record: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)purgeRecordsForIDSSyncEngine:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_2(&dword_1CB895000, v0, v1, "Unexpected call to -purgeRecordsForIDSSyncEngine:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_9();
}

@end
