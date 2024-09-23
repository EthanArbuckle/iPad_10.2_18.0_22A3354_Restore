@implementation CCUIModuleInstanceManager

- (id)contentModuleContext:(id)a3 requestsSensorActivityDataForActiveSensorType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CCUIModuleInstanceManager contextDelegate](self, "contextDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentModuleContext:requestsSensorActivityDataForActiveSensorType:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (CCUIContentModuleContextDelegate)contextDelegate
{
  return (CCUIContentModuleContextDelegate *)objc_loadWeakRetained((id *)&self->_contextDelegate);
}

uint64_t __51__CCUIModuleInstanceManager__updateModuleInstances__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "moduleInstancesChangedForModuleInstanceManager:", *(_QWORD *)(a1 + 32));
}

uint64_t __71__CCUIModuleInstanceManager_loadableModulesChangedForModuleRepository___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateModuleInstances");
}

- (void)_updateModuleInstances
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __51__CCUIModuleInstanceManager__updateModuleInstances__block_invoke;
  v2[3] = &unk_1E8CFC818;
  v2[4] = self;
  -[CCUIModuleInstanceManager _runBlockOnObservers:](self, "_runBlockOnObservers:", v2);
}

- (NSArray)moduleInstances
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_enabledModuleInstanceByUniqueIdentifer, "allValues");
}

- (void)_runBlockOnObservers:(id)a3
{
  NSHashTable *observers;
  id v4;
  id v5;

  observers = self->_observers;
  v4 = a3;
  -[NSHashTable allObjects](observers, "allObjects");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_each:", v4);

}

- (id)_loadBundlesForModuleMetadata:(id)a3
{
  id v3;
  id v4;
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
  NSObject *v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  __int128 v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v5)
  {
    v7 = v5;
    v8 = *(_QWORD *)v30;
    *(_QWORD *)&v6 = 138543362;
    v26 = v6;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB34D0];
        objc_msgSend(v10, "moduleBundleURL", v26);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "bundleWithURL:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v13, "isLoaded") & 1) == 0)
        {
          v14 = (void *)*MEMORY[0x1E0D146A0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A0], OS_LOG_TYPE_DEFAULT))
          {
            v15 = v14;
            objc_msgSend(v10, "moduleIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v34 = v16;
            v35 = 2114;
            v36 = v13;
            _os_log_impl(&dword_1CFB7D000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Loading bundle %{public}@ for module", buf, 0x16u);

          }
          v28 = 0;
          v17 = objc_msgSend(v13, "loadAndReturnError:", &v28);
          v18 = v28;
          v19 = (void *)*MEMORY[0x1E0D146A0];
          v20 = *MEMORY[0x1E0D146A0];
          if (v17)
          {
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21 = v19;
              objc_msgSend(v10, "moduleIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v26;
              v34 = v22;
              _os_log_impl(&dword_1CFB7D000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Bundle was loaded successfully", buf, 0xCu);

            }
            objc_msgSend(v27, "addObject:", v13);
          }
          else if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            v23 = v19;
            objc_msgSend(v10, "moduleIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v34 = v24;
            v35 = 2114;
            v36 = v18;
            _os_log_fault_impl(&dword_1CFB7D000, v23, OS_LOG_TYPE_FAULT, "[%{public}@] Bundle was not loaded, error=%{public}@", buf, 0x16u);

          }
        }

      }
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    }
    while (v7);
  }

  return v27;
}

- (void)loadableModulesChangedForModuleRepository:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CCUIModuleInstanceManager_loadableModulesChangedForModuleRepository___block_invoke;
  block[3] = &unk_1E8CFC3D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (CCUIModuleInstanceManager)initWithSystemAgent:(id)a3
{
  id v5;
  CCUIModuleInstanceManager *v6;
  CCUIModuleInstanceManager *v7;
  uint64_t v8;
  CCSModuleRepository *repository;
  NSMutableDictionary *v10;
  NSMutableDictionary *alertModuleInstanceByModuleIdentifier;
  NSMutableDictionary *v12;
  NSMutableDictionary *enabledModuleInstanceByUniqueIdentifer;
  uint64_t v14;
  NSHashTable *observers;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CCUIModuleInstanceManager;
  v6 = -[CCUIModuleInstanceManager init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_systemAgent, a3);
    objc_msgSend(MEMORY[0x1E0D14558], "repositoryWithDefaults");
    v8 = objc_claimAutoreleasedReturnValue();
    repository = v7->_repository;
    v7->_repository = (CCSModuleRepository *)v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    alertModuleInstanceByModuleIdentifier = v7->_alertModuleInstanceByModuleIdentifier;
    v7->_alertModuleInstanceByModuleIdentifier = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    enabledModuleInstanceByUniqueIdentifer = v7->_enabledModuleInstanceByUniqueIdentifer;
    v7->_enabledModuleInstanceByUniqueIdentifer = v12;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v14 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.ControlCenter.ModuleInstanceManager", v16);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v17;

    CCUIRegisterControlCenterLogging();
    -[CCUIModuleInstanceManager _updateModuleInstances](v7, "_updateModuleInstances");
    -[CCSModuleRepository addObserver:](v7->_repository, "addObserver:", v7);
  }

  return v7;
}

- (void)setEnabledModuleIdentifiersFromSettingsApp:(id)a3
{
  NSSet *v4;
  NSSet *enabledModuleIdentifiersFromSettingsApp;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (NSSet *)objc_msgSend(v6, "copy");
    enabledModuleIdentifiersFromSettingsApp = self->_enabledModuleIdentifiersFromSettingsApp;
    self->_enabledModuleIdentifiersFromSettingsApp = v4;

    -[CCUIModuleInstanceManager _updateModuleInstances](self, "_updateModuleInstances");
  }

}

- (NSSet)loadableModuleIdentifiers
{
  return (NSSet *)-[CCSModuleRepository loadableModuleIdentifiers](self->_repository, "loadableModuleIdentifiers");
}

- (id)loadAlertModuleWithBundleIdentifier:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIModuleInstanceManager.m"), 77, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moduleIdentifier != nil"));

  }
  -[NSMutableDictionary objectForKey:](self->_alertModuleInstanceByModuleIdentifier, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[CCSModuleRepository moduleMetadataForModuleIdentifier:](self->_repository, "moduleMetadataForModuleIdentifier:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v7, "moduleBundleURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleWithURL:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v11, "isLoaded") & 1) == 0)
      {
        v18[0] = v8;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[CCUIModuleInstanceManager _loadBundlesForModuleMetadata:](self, "_loadBundlesForModuleMetadata:", v12);

      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[CCUIModuleInstanceManager _instantiateModuleWithMetadata:uniqueIdentifier:](self, "_instantiateModuleWithMetadata:uniqueIdentifier:", v8, v15);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary bs_setSafeObject:forKey:](self->_alertModuleInstanceByModuleIdentifier, "bs_setSafeObject:forKey:", v6, v5);
    }
    else
    {
      v6 = 0;
    }

  }
  return v6;
}

- (id)obtainModuleWithBundleIdentifier:(id)a3 uniqueIdentifier:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIModuleInstanceManager.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("moduleIdentifier != nil"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIModuleInstanceManager.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifier != nil"));

LABEL_3:
  -[NSMutableDictionary objectForKey:](self->_enabledModuleInstanceByUniqueIdentifer, "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    -[CCSModuleRepository moduleMetadataForModuleIdentifier:](self->_repository, "moduleMetadataForModuleIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = (void *)MEMORY[0x1E0CB34D0];
      objc_msgSend(v11, "moduleBundleURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "bundleWithURL:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v15, "isLoaded") & 1) == 0)
      {
        v21[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[CCUIModuleInstanceManager _loadBundlesForModuleMetadata:](self, "_loadBundlesForModuleMetadata:", v16);

      }
      -[CCUIModuleInstanceManager _instantiateModuleWithMetadata:uniqueIdentifier:](self, "_instantiateModuleWithMetadata:uniqueIdentifier:", v12, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary bs_setSafeObject:forKey:](self->_enabledModuleInstanceByUniqueIdentifer, "bs_setSafeObject:forKey:", v10, v9);

    }
    else
    {
      v10 = 0;
    }

  }
  return v10;
}

- (void)removeModuleWithUniqueIdentifier:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  v7 = v5;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCUIModuleInstanceManager.m"), 114, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifier != nil"));

    v5 = 0;
  }
  -[NSMutableDictionary removeObjectForKey:](self->_enabledModuleInstanceByUniqueIdentifer, "removeObjectForKey:", v5);

}

- (NSArray)alertModuleInstances
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_alertModuleInstanceByModuleIdentifier, "allValues");
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)contentModuleContext:(id)a3 enqueueStatusUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[CCUIModuleInstanceManager contextDelegate](self, "contextDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentModuleContext:enqueueStatusUpdate:", v7, v6);

}

- (void)requestExpandModuleForContentModuleContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CCUIModuleInstanceManager contextDelegate](self, "contextDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "requestExpandModuleForContentModuleContext:", v4);

}

- (void)dismissExpandedViewForContentModuleContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CCUIModuleInstanceManager contextDelegate](self, "contextDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissExpandedViewForContentModuleContext:", v4);

}

- (void)dismissControlCenterForContentModuleContext:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CCUIModuleInstanceManager contextDelegate](self, "contextDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissControlCenterForContentModuleContext:", v4);

}

- (id)contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CCUIModuleInstanceManager contextDelegate](self, "contextDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentModuleContextRequestsSensorActivityDataEligibleForInactiveMicModeSelection:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_instantiateModuleWithMetadata:(id)a3 uniqueIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id *v15;
  id v16;
  const char *v17;
  uint64_t *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CCUIModuleInstance *v26;
  void *v27;
  void *v28;
  CCUIModuleInstance *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t);
  void *v53;
  id v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  void (*v58)(_QWORD *);
  void *v59;
  id v60;
  CCUIModuleInstanceManager *v61;
  uint64_t *v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v6, "moduleBundleURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleWithURL:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "moduleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isLoaded"))
  {
    v12 = (void *)objc_msgSend(v10, "principalClass");
    if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EFC31898))
      v13 = v12;
    else
      v13 = 0;
    v14 = v13;
    v63 = 0;
    v64 = &v63;
    v65 = 0x3032000000;
    v66 = __Block_byref_object_copy__0;
    v67 = __Block_byref_object_dispose__0;
    v68 = (id)objc_msgSend(v14, "alloc");
    if (v64[5])
    {
      objc_msgSend(v10, "ccui_associateWithModuleInstance:");
      if (objc_msgSend((id)v64[5], "conformsToProtocol:", &unk_1EFC57C58)
        && (objc_opt_respondsToSelector() & 1) != 0)
      {
        v56 = MEMORY[0x1E0C809B0];
        v57 = 3221225472;
        v58 = __77__CCUIModuleInstanceManager__instantiateModuleWithMetadata_uniqueIdentifier___block_invoke;
        v59 = &unk_1E8CFC840;
        v15 = &v60;
        v16 = v11;
        v61 = self;
        v62 = &v63;
        v60 = v16;
        v17 = "instantiate internal module";
        v18 = &v56;
      }
      else
      {
        v50 = MEMORY[0x1E0C809B0];
        v51 = 3221225472;
        v52 = __77__CCUIModuleInstanceManager__instantiateModuleWithMetadata_uniqueIdentifier___block_invoke_87;
        v53 = &unk_1E8CFC868;
        v15 = &v54;
        v54 = v11;
        v55 = &v63;
        v17 = "instantiate module";
        v18 = &v50;
      }
      _os_activity_initiate(&dword_1CFB7D000, v17, OS_ACTIVITY_FLAG_DEFAULT, v18);

      if (v64[5])
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
          v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D14778]), "initWithModuleIdentifier:uniqueIdentifier:", v11, v27);
          objc_msgSend(v28, "setDelegate:", self);
          objc_msgSend((id)v64[5], "setContentModuleContext:", v28);

        }
        v29 = [CCUIModuleInstance alloc];
        v30 = v64[5];
        v31 = objc_msgSend(v10, "ccui_prototypeModuleSize");
        v33 = v32;
        objc_msgSend(v10, "ccui_displayName");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = -[CCUIModuleInstance initWithMetadata:module:prototypeModuleSize:uniqueIdentifier:displayName:](v29, "initWithMetadata:module:prototypeModuleSize:uniqueIdentifier:displayName:", v6, v30, v31, v33, v7, v34);

        goto LABEL_22;
      }
      v42 = *MEMORY[0x1E0D146A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A0], OS_LOG_TYPE_ERROR))
        -[CCUIModuleInstanceManager _instantiateModuleWithMetadata:uniqueIdentifier:].cold.2((uint64_t)v11, v42, v43, v44, v45, v46, v47, v48);
    }
    else
    {
      v35 = *MEMORY[0x1E0D146A0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A0], OS_LOG_TYPE_ERROR))
        -[CCUIModuleInstanceManager _instantiateModuleWithMetadata:uniqueIdentifier:].cold.1((uint64_t)v11, v35, v36, v37, v38, v39, v40, v41);
    }
    objc_msgSend(v10, "unload", v50, v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62);
    v26 = 0;
LABEL_22:
    _Block_object_dispose(&v63, 8);

    goto LABEL_23;
  }
  v19 = *MEMORY[0x1E0D146A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A0], OS_LOG_TYPE_ERROR))
    -[CCUIModuleInstanceManager _instantiateModuleWithMetadata:uniqueIdentifier:].cold.3((uint64_t)v11, v19, v20, v21, v22, v23, v24, v25);
  v26 = 0;
LABEL_23:

  return v26;
}

void __77__CCUIModuleInstanceManager__instantiateModuleWithMetadata_uniqueIdentifier___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D146A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1CFB7D000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will instantiate internal module", (uint8_t *)&v7, 0xCu);
  }
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "initWithSystemAgent:", *(_QWORD *)(a1[5] + 16));
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __77__CCUIModuleInstanceManager__instantiateModuleWithMetadata_uniqueIdentifier___block_invoke_87(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D146A0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D146A0], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1CFB7D000, v2, OS_LOG_TYPE_DEFAULT, "[%{public}@] Will instantiate module", (uint8_t *)&v7, 0xCu);
  }
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "init");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (void)setContextDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_contextDelegate, a3);
}

- (NSSet)enabledModuleIdentifiersFromSettingsApp
{
  return self->_enabledModuleIdentifiersFromSettingsApp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledModuleIdentifiersFromSettingsApp, 0);
  objc_destroyWeak((id *)&self->_contextDelegate);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_enabledModuleInstanceByUniqueIdentifer, 0);
  objc_storeStrong((id *)&self->_alertModuleInstanceByModuleIdentifier, 0);
  objc_storeStrong((id *)&self->_repository, 0);
  objc_storeStrong((id *)&self->_systemAgent, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_instantiateModuleWithMetadata:(uint64_t)a3 uniqueIdentifier:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CFB7D000, a2, a3, "[%{public}@] Could not alloc an instance of the module, will unload bundle", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_instantiateModuleWithMetadata:(uint64_t)a3 uniqueIdentifier:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CFB7D000, a2, a3, "[%{public}@] Module's init method returned nil, will unload bundle", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_instantiateModuleWithMetadata:(uint64_t)a3 uniqueIdentifier:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1CFB7D000, a2, a3, "[%{public}@] Attempting to load module whose bundle has not been loaded", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
