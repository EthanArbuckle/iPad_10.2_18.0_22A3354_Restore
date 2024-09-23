@implementation MEContentRuleListManager

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __31__MEContentRuleListManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_1 != -1)
    dispatch_once(&log_onceToken_1, block);
  return (id)log_log_1;
}

void __31__MEContentRuleListManager_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_1;
  log_log_1 = (uint64_t)v1;

}

- (MEContentRuleListManager)init
{
  return -[MEContentRuleListManager initWithExtensionsController:](self, "initWithExtensionsController:", 0);
}

- (MEContentRuleListManager)initWithExtensionsController:(id)a3
{
  id v5;
  MEContentRuleListManager *v6;
  MEContentRuleListManager *v7;
  EFCancelationToken *v8;
  EFCancelationToken *extensionsObserverCancelable;
  id v10;
  id v11;
  uint64_t v12;
  EFLocked *activeRuleListsByIdentifier;
  uint64_t v14;
  NSHashTable *observers;
  uint64_t v16;
  EFAssertableScheduler *observationScheduler;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v19;
  EFAssertableScheduler *v20;
  uint64_t v21;
  uint64_t v22;
  EFDebouncer *reloadDebouncer;
  MEAppExtensionsController *extensionsController;
  void *v25;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id location;
  objc_super v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v32.receiver = self;
  v32.super_class = (Class)MEContentRuleListManager;
  v6 = -[MEContentRuleListManager init](&v32, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extensionsController, a3);
    v8 = (EFCancelationToken *)objc_alloc_init(MEMORY[0x24BE2E638]);
    extensionsObserverCancelable = v7->_extensionsObserverCancelable;
    v7->_extensionsObserverCancelable = v8;

    v10 = objc_alloc(MEMORY[0x24BE2E658]);
    v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v12 = objc_msgSend(v10, "initWithObject:", v11);
    activeRuleListsByIdentifier = v7->_activeRuleListsByIdentifier;
    v7->_activeRuleListsByIdentifier = (EFLocked *)v12;

    v7->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v14 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v14;

    objc_msgSend(MEMORY[0x24BE2E688], "serialDispatchQueueSchedulerWithName:", CFSTR("com.apple.MEContentRuleListManager.observation"));
    v16 = objc_claimAutoreleasedReturnValue();
    observationScheduler = v7->_observationScheduler;
    v7->_observationScheduler = (EFAssertableScheduler *)v16;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_reload, CFSTR("MEContentBlockerMangerReload"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    v19 = objc_alloc(MEMORY[0x24BE2E640]);
    v20 = v7->_observationScheduler;
    v21 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __57__MEContentRuleListManager_initWithExtensionsController___block_invoke;
    v29[3] = &unk_24C4D28A0;
    objc_copyWeak(&v30, &location);
    v22 = objc_msgSend(v19, "initWithTimeInterval:scheduler:startAfter:block:", v20, 0, v29, 60.0);
    reloadDebouncer = v7->_reloadDebouncer;
    v7->_reloadDebouncer = (EFDebouncer *)v22;

    extensionsController = v7->_extensionsController;
    v33[0] = CFSTR("MEContentBlocker");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v21;
    v27[1] = 3221225472;
    v27[2] = __57__MEContentRuleListManager_initWithExtensionsController___block_invoke_2;
    v27[3] = &unk_24C4D2758;
    objc_copyWeak(&v28, &location);
    -[MEAppExtensionsController registerMailAppExtensionsObserver:capabilities:includeDisabled:completion:](extensionsController, "registerMailAppExtensionsObserver:capabilities:includeDisabled:completion:", v7, v25, 0, v27);

    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v7;
}

void __57__MEContentRuleListManager_initWithExtensionsController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_reloadContentRuleLists");

}

void __57__MEContentRuleListManager_initWithExtensionsController___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  id *WeakRetained;
  id *v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x24BDAC8D0];
  v8 = a2;
  v9 = a3;
  v10 = a5;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v12 = WeakRetained;
  if (WeakRetained)
  {
    if (v10)
    {
      +[MEContentRuleListManager log](MEContentRuleListManager, "log");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "ef_publicDescription");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        __57__MEContentRuleListManager_initWithExtensionsController___block_invoke_2_cold_1(v14, (uint64_t)v15, v13);
      }

    }
    else
    {
      objc_msgSend(WeakRetained, "_handleExtensionsAdded:", v9);
      objc_msgSend(v12[3], "addCancelable:", v8);
    }
  }

}

- (void)dealloc
{
  objc_super v3;

  -[EFCancelationToken cancel](self->_extensionsObserverCancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MEContentRuleListManager;
  -[MEContentRuleListManager dealloc](&v3, sel_dealloc);
}

- (id)_activeRuleLists
{
  EFLocked *activeRuleListsByIdentifier;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  activeRuleListsByIdentifier = self->_activeRuleListsByIdentifier;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__MEContentRuleListManager__activeRuleLists__block_invoke;
  v5[3] = &unk_24C4D28C8;
  v5[4] = &v6;
  -[EFLocked performWhileLocked:](activeRuleListsByIdentifier, "performWhileLocked:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__MEContentRuleListManager__activeRuleLists__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "allValues");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_handleExtensionsAdded:(id)a3
{
  id v4;
  EFAssertableScheduler *observationScheduler;
  id v6;
  _QWORD v7[4];
  id v8;
  MEContentRuleListManager *v9;

  v4 = a3;
  observationScheduler = self->_observationScheduler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__MEContentRuleListManager__handleExtensionsAdded___block_invoke;
  v7[3] = &unk_24C4D28F0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  -[EFAssertableScheduler performBlock:](observationScheduler, "performBlock:", v7);

}

void __51__MEContentRuleListManager__handleExtensionsAdded___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "_encodedContentRuleListForExtension:", v6, (_QWORD)v10);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = *(void **)(a1 + 40);
          objc_msgSend(v6, "extensionID");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "_compileAndAddContentRuleListForIdentifier:encodedContentRuleList:", v9, v7);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }

}

- (void)_handleExtensionsRemoved:(id)a3
{
  id v4;
  EFAssertableScheduler *observationScheduler;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observationScheduler = self->_observationScheduler;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke;
  v7[3] = &unk_24C4D28F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[EFAssertableScheduler performBlock:](observationScheduler, "performBlock:", v7);

}

void __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_2;
  v6[3] = &unk_24C4D2940;
  v4 = v2;
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "performWhileLocked:", v6);

}

void __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _QWORD v16[4];
  id v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "ef_map:", &__block_literal_global_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_4;
  v16[3] = &unk_24C4D2918;
  v5 = v4;
  v17 = v5;
  objc_msgSend(v3, "ef_filter:", v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "removeObjectsForKeys:", v5);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(a1 + 40), "_notifyObserversOfRemovedContentRuleList:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++), (_QWORD)v12);
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v18, 16);
    }
    while (v9);
  }

}

id __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_3(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "extensionID");
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __53__MEContentRuleListManager__handleExtensionsRemoved___block_invoke_4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
}

- (void)_compileAndAddContentRuleListForIdentifier:(id)a3 encodedContentRuleList:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  MEContentRuleListManager *v14;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke;
  v11[3] = &unk_24C4D2990;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = self;
  objc_msgSend(MEMORY[0x24BE2E688], "mainThreadScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performSyncBlock:", v11);

}

void __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  -[objc_class defaultStore](getWKContentRuleListStoreClass(), "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2;
  v5[3] = &unk_24C4D2968;
  v5[4] = a1[6];
  v6 = v3;
  objc_msgSend(v2, "compileContentRuleListForIdentifier:encodedContentRuleList:completionHandler:", v6, v4, v5);

}

void __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_3;
    v16 = &unk_24C4D2940;
    v17 = v8;
    v10 = v5;
    v18 = v10;
    objc_msgSend(v9, "performWhileLocked:", &v13);
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfNewContentRuleList:", v10, v13, v14, v15, v16);

  }
  else
  {
    if (v6)
    {
      +[MEContentRuleListManager log](MEContentRuleListManager, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_2();

    }
    +[MEContentRuleListManager log](MEContentRuleListManager, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_1();

  }
}

uint64_t __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_encodedContentRuleListForExtension:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "synchronousContentBlockerInterface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __64__MEContentRuleListManager__encodedContentRuleListForExtension___block_invoke;
  v12[3] = &unk_24C4D29B8;
  v12[4] = &v13;
  objc_msgSend(v4, "contentRulesJSONWithCompletionHandler:", v12);
  if (v14[5])
  {
    v5 = objc_alloc(MEMORY[0x24BDD17C8]);
    v6 = (void *)objc_msgSend(v5, "initWithData:encoding:", v14[5], 4);
    +[MEContentRuleListManager log](MEContentRuleListManager, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "extensionID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v6, "length");
      *(_DWORD *)buf = 138543618;
      v20 = v8;
      v21 = 2048;
      v22 = v9;
      _os_log_impl(&dword_20BB85000, v7, OS_LOG_TYPE_DEFAULT, "Filter %{public}@ returned with text length:%lu", buf, 0x16u);

    }
  }
  else
  {
    +[MEContentRuleListManager log](MEContentRuleListManager, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "extensionID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MEContentRuleListManager _encodedContentRuleListForExtension:].cold.1(v10, (uint64_t)buf, v7);
    }
    v6 = 0;
  }

  _Block_object_dispose(&v13, 8);
  return v6;
}

void __64__MEContentRuleListManager__encodedContentRuleListForExtension___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

- (id)addObserver:(id)a3 activeRuleLists:(id *)a4
{
  id v6;
  NSHashTable *observers;
  id v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;
  id from;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, a3);
  v6 = objc_alloc_init(MEMORY[0x24BE2E638]);
  from = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&from, self);
  v10 = MEMORY[0x24BDAC760];
  v11 = 3221225472;
  v12 = __56__MEContentRuleListManager_addObserver_activeRuleLists___block_invoke;
  v13 = &unk_24C4D2648;
  objc_copyWeak(&v14, &from);
  objc_copyWeak(&v15, &location);
  objc_msgSend(v6, "addCancelationBlock:", &v10);
  os_unfair_lock_lock(&self->_lock);
  observers = self->_observers;
  v8 = objc_loadWeakRetained(&location);
  -[NSHashTable addObject:](observers, "addObject:", v8, v10, v11, v12, v13);

  os_unfair_lock_unlock(&self->_lock);
  if (a4)
  {
    -[MEContentRuleListManager _activeRuleLists](self, "_activeRuleLists");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
  return v6;
}

void __56__MEContentRuleListManager_addObserver_activeRuleLists___block_invoke(uint64_t a1)
{
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v3;
  void *v4;
  id v5;
  os_unfair_lock_s *v6;

  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained + 14;
    v6 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 14);
    v4 = *(void **)&v6[10]._os_unfair_lock_opaque;
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v4, "removeObject:", v5);

    os_unfair_lock_unlock(v3);
    WeakRetained = v6;
  }

}

- (void)_notifyObserversOfNewContentRuleList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "contentRuleListManager:didAddRuleList:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_notifyObserversOfUpdatedContentRuleList:(id)a3 oldContentRuleList:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "contentRuleListManager:didUpdateContentRuleList:oldContentRuleList:", self, v6, v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)_notifyObserversOfRemovedContentRuleList:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "contentRuleListManager:didRemoveRuleList:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_scheduleContentRuleListReload
{
  -[EFDebouncer debounceResult:](self->_reloadDebouncer, "debounceResult:", 0);
}

- (void)_reloadContentRuleLists
{
  id v3;
  _QWORD v4[5];

  -[EFAssertableScheduler assertIsExecuting:](self->_observationScheduler, "assertIsExecuting:", 1);
  -[EFLocked getObject](self->_activeRuleListsByIdentifier, "getObject");
  v4[1] = 3221225472;
  v4[2] = __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke;
  v4[3] = &unk_24C4D2A30;
  v4[4] = self;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "extensionForIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_encodedContentRuleListForExtension:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_2;
    v12[3] = &unk_24C4D2A08;
    v13 = v5;
    v9 = v8;
    v10 = *(_QWORD *)(a1 + 32);
    v14 = v9;
    v15 = v10;
    v16 = v6;
    objc_msgSend(MEMORY[0x24BE2E688], "mainThreadScheduler", v12[0], 3221225472, __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_2, &unk_24C4D2A08);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "performSyncBlock:", v12);

  }
}

void __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;
  id v7;

  -[objc_class defaultStore](getWKContentRuleListStoreClass(), "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_3;
  v5[3] = &unk_24C4D29E0;
  v5[4] = *(_QWORD *)(a1 + 48);
  v6 = v3;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "compileContentRuleListForIdentifier:encodedContentRuleList:completionHandler:", v6, v4, v5);

}

void __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    v8 = *(void **)(a1 + 40);
    v9 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_4;
    v16 = &unk_24C4D2940;
    v17 = v8;
    v10 = v5;
    v18 = v10;
    objc_msgSend(v9, "performWhileLocked:", &v13);
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfUpdatedContentRuleList:oldContentRuleList:", v10, *(_QWORD *)(a1 + 48), v13, v14, v15, v16);

  }
  else
  {
    if (v6)
    {
      +[MEContentRuleListManager log](MEContentRuleListManager, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_2();

    }
    +[MEContentRuleListManager log](MEContentRuleListManager, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_1();

  }
}

uint64_t __51__MEContentRuleListManager__reloadContentRuleLists__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reloadDebouncer, 0);
  objc_storeStrong((id *)&self->_observationScheduler, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_activeRuleListsByIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionsObserverCancelable, 0);
  objc_storeStrong((id *)&self->_remoteExtensions, 0);
  objc_storeStrong((id *)&self->_extensionsController, 0);
}

void __57__MEContentRuleListManager_initWithExtensionsController___block_invoke_2_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_20BB85000, a3, (uint64_t)a3, "Failed to register for app extensions changes error: %{public}@", (uint8_t *)a2);

}

void __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  v3 = 138543362;
  v4 = v0;
  OUTLINED_FUNCTION_0(&dword_20BB85000, v1, v2, "Rule list identifier:%{public}@ was not added to active the rule list", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __94__MEContentRuleListManager__compileAndAddContentRuleListForIdentifier_encodedContentRuleList___block_invoke_2_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_20BB85000, v0, v1, "Error occured while compiling rule list for identifier:%{public}@ error:%{public}@");
  OUTLINED_FUNCTION_2();
}

- (void)_encodedContentRuleListForExtension:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_20BB85000, a3, (uint64_t)a3, "Filter %{public}@ returned with no data", (uint8_t *)a2);

}

@end
