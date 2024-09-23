@implementation CCSModuleSettingsProvider

void __64__CCSModuleSettingsProvider_orderedUserEnabledModuleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__CCSModuleSettingsProvider_orderedUserEnabledFixedModuleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __58__CCSModuleSettingsProvider_orderedFixedModuleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (NSArray)orderedFixedModuleIdentifiers
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__CCSModuleSettingsProvider_orderedFixedModuleIdentifiers__block_invoke;
  v5[3] = &unk_24D460D08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)orderedUserEnabledModuleIdentifiers
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __64__CCSModuleSettingsProvider_orderedUserEnabledModuleIdentifiers__block_invoke;
  v5[3] = &unk_24D460D08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

- (NSArray)orderedUserEnabledFixedModuleIdentifiers
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __69__CCSModuleSettingsProvider_orderedUserEnabledFixedModuleIdentifiers__block_invoke;
  v5[3] = &unk_24D460D08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

+ (id)sharedProvider
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__CCSModuleSettingsProvider_sharedProvider__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedProvider_onceToken != -1)
    dispatch_once(&sharedProvider_onceToken, block);
  return (id)sharedProvider_instance;
}

void __43__CCSModuleSettingsProvider_sharedProvider__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedProvider_instance;
  sharedProvider_instance = (uint64_t)v1;

}

- (CCSModuleSettingsProvider)init
{
  CCSModuleSettingsProvider *v2;
  uint64_t v3;
  NSHashTable *observers;
  uint64_t v5;
  NSArray *orderedFixedModuleIdentifiers;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *callOutQueue;
  NSObject *v13;
  _QWORD block[4];
  CCSModuleSettingsProvider *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)CCSModuleSettingsProvider;
  v2 = -[CCSModuleSettingsProvider init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    objc_msgSend((id)objc_opt_class(), "_defaultFixedModuleIdentifiers");
    v5 = objc_claimAutoreleasedReturnValue();
    orderedFixedModuleIdentifiers = v2->_orderedFixedModuleIdentifiers;
    v2->_orderedFixedModuleIdentifiers = (NSArray *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create("com.apple.ControlCenter.ModuleSettingsProvider", v7);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v8;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.ControlCenter.ModuleSettingsProvider.callout", v10);
    callOutQueue = v2->_callOutQueue;
    v2->_callOutQueue = (OS_dispatch_queue *)v11;

    v13 = v2->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __33__CCSModuleSettingsProvider_init__block_invoke;
    block[3] = &unk_24D460CE0;
    v16 = v2;
    dispatch_sync(v13, block);

  }
  return v2;
}

uint64_t __33__CCSModuleSettingsProvider_init__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_loadSettings");
  return objc_msgSend(*(id *)(a1 + 32), "_queue_startMonitoringConfigurationUpdates");
}

- (void)dealloc
{
  NSObject *queue;
  objc_super v4;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__CCSModuleSettingsProvider_dealloc__block_invoke;
  block[3] = &unk_24D460CE0;
  block[4] = self;
  dispatch_sync(queue, block);
  v4.receiver = self;
  v4.super_class = (Class)CCSModuleSettingsProvider;
  -[CCSModuleSettingsProvider dealloc](&v4, sel_dealloc);
}

uint64_t __36__CCSModuleSettingsProvider_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_stopMonitoringConfigurationUpdates");
}

- (NSArray)userDisabledModuleIdentifiers
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
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
  queue = self->_queue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__CCSModuleSettingsProvider_userDisabledModuleIdentifiers__block_invoke;
  v5[3] = &unk_24D460D08;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __58__CCSModuleSettingsProvider_userDisabledModuleIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setAndSaveOrderedUserEnabledModuleIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledModuleIdentifiers___block_invoke;
  block[3] = &unk_24D460D30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __75__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledModuleIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAndSaveOrderedUserEnabledModuleIdentifiers:previousOrderedUserEnabledModuleIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
}

- (void)setAndSaveOrderedUserEnabledModuleIdentifiers:(id)a3 previousOrderedUserEnabledModuleIdentifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __119__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledModuleIdentifiers_previousOrderedUserEnabledModuleIdentifiers___block_invoke;
  block[3] = &unk_24D460D58;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __119__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledModuleIdentifiers_previousOrderedUserEnabledModuleIdentifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setAndSaveOrderedUserEnabledModuleIdentifiers:previousOrderedUserEnabledModuleIdentifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_setAndSaveOrderedUserEnabledModuleIdentifiers:(id)a3 previousOrderedUserEnabledModuleIdentifiers:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *orderedUserEnabledModuleIdentifiers;
  NSArray *v16;
  NSArray *userDisabledModuleIdentifiers;
  id v18;

  v18 = a3;
  v6 = a4;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v18);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v9, "minusSet:", v8);
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v10, "minusSet:", v7);
    v11 = (void *)-[NSArray mutableCopy](self->_userDisabledModuleIdentifiers, "mutableCopy");
    objc_msgSend(v10, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObjectsInArray:", v12);

    objc_msgSend(v9, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v13);

    objc_msgSend(v11, "sortUsingSelector:", sel_caseInsensitiveCompare_);
    v14 = (NSArray *)objc_msgSend(v18, "copy");
    orderedUserEnabledModuleIdentifiers = self->_orderedUserEnabledModuleIdentifiers;
    self->_orderedUserEnabledModuleIdentifiers = v14;

    v16 = (NSArray *)objc_msgSend(v11, "copy");
    userDisabledModuleIdentifiers = self->_userDisabledModuleIdentifiers;
    self->_userDisabledModuleIdentifiers = v16;

    -[CCSModuleSettingsProvider _queue_stopMonitoringConfigurationUpdates](self, "_queue_stopMonitoringConfigurationUpdates");
    -[CCSModuleSettingsProvider _queue_saveSettings](self, "_queue_saveSettings");
    -[CCSModuleSettingsProvider _queue_startMonitoringConfigurationUpdates](self, "_queue_startMonitoringConfigurationUpdates");
    -[CCSModuleSettingsProvider _queue_sendConfigurationFileUpdateMessageToObservers](self, "_queue_sendConfigurationFileUpdateMessageToObservers");

  }
}

- (void)setAndSaveOrderedUserEnabledFixedModuleIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledFixedModuleIdentifiers___block_invoke;
  block[3] = &unk_24D460D30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __80__CCSModuleSettingsProvider_setAndSaveOrderedUserEnabledFixedModuleIdentifiers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  if ((BSEqualObjects() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", *(_QWORD *)(a1 + 40));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v3, "minusSet:", v2);
    v4 = (void *)objc_msgSend(v2, "mutableCopy");
    objc_msgSend(v4, "minusSet:", v14);
    v5 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "mutableCopy");
    objc_msgSend(v4, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectsInArray:", v6);

    objc_msgSend(v3, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    objc_msgSend(v5, "sortUsingSelector:", sel_caseInsensitiveCompare_);
    v8 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 56);
    *(_QWORD *)(v9 + 56) = v8;

    v11 = objc_msgSend(v5, "copy");
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 64);
    *(_QWORD *)(v12 + 64) = v11;

    objc_msgSend(*(id *)(a1 + 32), "_queue_stopMonitoringConfigurationUpdates");
    objc_msgSend(*(id *)(a1 + 32), "_queue_saveSettings");
    objc_msgSend(*(id *)(a1 + 32), "_queue_startMonitoringConfigurationUpdates");
    objc_msgSend(*(id *)(a1 + 32), "_queue_sendConfigurationFileUpdateMessageToObservers");

  }
}

+ (id)_readSettingsWithVersion:(unint64_t *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend((id)objc_opt_class(), "_configurationFileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE90], "inputStreamWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "open");
    v26 = 0;
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithStream:options:format:error:", v6, 0, 0, &v26);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v26;
    objc_msgSend(v6, "close");
    if (v8)
    {
      v9 = CCSLogModuleSettings;
      if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v28 = v4;
        v29 = 2114;
        v30 = v8;
        _os_log_impl(&dword_215C14000, v9, OS_LOG_TYPE_DEFAULT, "Could not load configuration file at %{public}@, plist error %{public}@", buf, 0x16u);
      }
      v10 = 0;
    }
    else
    {
      v12 = objc_opt_class();
      v13 = v7;
      if (v12)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v14 = v13;
        else
          v14 = 0;
      }
      else
      {
        v14 = 0;
      }
      v15 = v14;

      objc_msgSend(v15, "bs_safeNumberForKey:", CFSTR("version"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "unsignedIntegerValue");

      if (a3)
        *a3 = v17;
      if ((unint64_t)(v17 - 1) > 2)
      {
        v22 = CCSLogModuleSettings;
        if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR))
          +[CCSModuleSettingsProvider _readSettingsWithVersion:].cold.1((uint64_t)v4, v17, v22);
        v10 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "bs_safeArrayForKey:", CFSTR("module-identifiers"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "bs_mapNoNulls:", &__block_literal_global_3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bs_setSafeObject:forKey:", v24, CFSTR("module-identifiers"));
        objc_msgSend(v15, "bs_safeArrayForKey:", CFSTR("userenabled-fixed-module-identifiers"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "bs_mapNoNulls:", &__block_literal_global_43);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bs_setSafeObject:forKey:", v19, CFSTR("userenabled-fixed-module-identifiers"));
        objc_msgSend(v15, "bs_safeArrayForKey:", CFSTR("disabled-module-identifiers"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "bs_mapNoNulls:", &__block_literal_global_44);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bs_setSafeObject:forKey:", v21, CFSTR("disabled-module-identifiers"));

      }
    }

  }
  else
  {
    v11 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v28 = v4;
      _os_log_impl(&dword_215C14000, v11, OS_LOG_TYPE_DEFAULT, "Could not load configuration file at %{public}@", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

id __54__CCSModuleSettingsProvider__readSettingsWithVersion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

id __54__CCSModuleSettingsProvider__readSettingsWithVersion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

id __54__CCSModuleSettingsProvider__readSettingsWithVersion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v2 = a2;
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

+ (void)_writeOrderedIdentifiers:(id)a3 userEnabledFixedIdentifiers:(id)a4 userDisabledIdentifiers:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "_configurationDirectoryURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v15 = objc_msgSend(v14, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v23);
    v16 = v23;

    if ((v15 & 1) == 0 && os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR))
      +[CCSModuleSettingsProvider _writeOrderedIdentifiers:userEnabledFixedIdentifiers:userDisabledIdentifiers:].cold.2();

  }
  objc_msgSend((id)objc_opt_class(), "_configurationFileURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = CFSTR("version");
  v24[1] = CFSTR("module-identifiers");
  v25[0] = &unk_24D464710;
  v25[1] = v7;
  v24[2] = CFSTR("userenabled-fixed-module-identifiers");
  v24[3] = CFSTR("disabled-module-identifiers");
  v25[2] = v8;
  v25[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1770], "dataWithPropertyList:format:options:error:", v18, 100, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v20 = objc_msgSend(v19, "writeToURL:options:error:", v17, 268435457, &v22);
  v21 = v22;
  if ((v20 & 1) == 0 && os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_ERROR))
    +[CCSModuleSettingsProvider _writeOrderedIdentifiers:userEnabledFixedIdentifiers:userDisabledIdentifiers:].cold.1();

}

- (void)legacyModuleMigration:(BOOL *)a3 versionNumber:(unint64_t)a4
{
  NSArray *v7;
  NSArray *userDisabledModuleIdentifiers;
  NSArray **p_orderedUserEnabledModuleIdentifiers;
  NSArray *v10;
  NSArray *v11;
  NSArray *v12;
  NSArray *v13;
  NSArray *v14;
  NSArray *v15;
  NSObject *v16;
  void *v17;
  NSArray *v18;
  NSArray *orderedUserEnabledFixedModuleIdentifiers;
  NSArray *v20;
  NSArray *v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSArray *v25;
  NSArray *v26;
  NSArray *v27;
  NSArray *v28;
  NSArray *v29;
  NSArray *v30;
  NSArray *v31;
  NSArray *v32;
  NSArray *v33;
  NSArray *v34;
  NSArray *v35;
  NSArray *v36;
  NSArray *v37;
  NSArray *v38;
  int v39;
  unint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray containsObject:](self->_userDisabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.control-center.CarModeModule")))
  {
    v7 = (NSArray *)-[NSArray mutableCopy](self->_userDisabledModuleIdentifiers, "mutableCopy");
    -[NSArray removeObject:](v7, "removeObject:", CFSTR("com.apple.control-center.CarModeModule"));
    userDisabledModuleIdentifiers = self->_userDisabledModuleIdentifiers;
    self->_userDisabledModuleIdentifiers = v7;

    *a3 = 1;
  }
  p_orderedUserEnabledModuleIdentifiers = &self->_orderedUserEnabledModuleIdentifiers;
  if (-[NSArray containsObject:](self->_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.control-center.CarModeModule")))
  {
    v10 = (NSArray *)-[NSArray mutableCopy](*p_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    -[NSArray removeObject:](v10, "removeObject:", CFSTR("com.apple.control-center.CarModeModule"));
    v11 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v10;

    *a3 = 1;
  }
  if (-[NSArray containsObject:](self->_userDisabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.sleep.controlcenter.sleepmode")))
  {
    v12 = (NSArray *)-[NSArray mutableCopy](self->_userDisabledModuleIdentifiers, "mutableCopy");
    -[NSArray removeObject:](v12, "removeObject:", CFSTR("com.apple.sleep.controlcenter.sleepmode"));
    v13 = self->_userDisabledModuleIdentifiers;
    self->_userDisabledModuleIdentifiers = v12;

    *a3 = 1;
  }
  if (-[NSArray containsObject:](*p_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.sleep.controlcenter.sleepmode")))
  {
    v14 = (NSArray *)-[NSArray mutableCopy](*p_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    -[NSArray removeObject:](v14, "removeObject:", CFSTR("com.apple.sleep.controlcenter.sleepmode"));
    v15 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v14;

    *a3 = 1;
  }
  if (-[NSArray containsObject:](*p_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.Home.ControlCenter")))
  {
    v16 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v39) = 0;
      _os_log_impl(&dword_215C14000, v16, OS_LOG_TYPE_DEFAULT, "Migrating home module from user enabled to enabled and fixed module", (uint8_t *)&v39, 2u);
    }
    v17 = (void *)-[NSArray mutableCopy](self->_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    objc_msgSend(v17, "removeObject:", CFSTR("com.apple.Home.ControlCenter"));
    objc_storeStrong((id *)&self->_orderedUserEnabledModuleIdentifiers, v17);
    if (!-[NSArray containsObject:](self->_orderedUserEnabledFixedModuleIdentifiers, "containsObject:", CFSTR("com.apple.Home.ControlCenter")))
    {
      v18 = (NSArray *)-[NSArray mutableCopy](self->_orderedUserEnabledFixedModuleIdentifiers, "mutableCopy");
      -[NSArray addObject:](v18, "addObject:", CFSTR("com.apple.Home.ControlCenter"));
      orderedUserEnabledFixedModuleIdentifiers = self->_orderedUserEnabledFixedModuleIdentifiers;
      self->_orderedUserEnabledFixedModuleIdentifiers = v18;

    }
    *a3 = 1;

  }
  if (!-[NSArray containsObject:](self->_userDisabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.BarcodeSupport.NFCControlCenterModule"))&& !-[NSArray containsObject:](*p_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.BarcodeSupport.NFCControlCenterModule")))
  {
    v20 = (NSArray *)-[NSArray mutableCopy](*p_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    -[NSArray addObject:](v20, "addObject:", CFSTR("com.apple.BarcodeSupport.NFCControlCenterModule"));
    v21 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v20;

    *a3 = 1;
  }
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "deviceClass");

  if (a4 <= 1
    && !v23
    && -[NSArray containsObject:](self->_userDisabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.control-center.MuteModule")))
  {
    v24 = CCSLogModuleSettings;
    if (os_log_type_enabled((os_log_t)CCSLogModuleSettings, OS_LOG_TYPE_DEFAULT))
    {
      v39 = 134217984;
      v40 = a4;
      _os_log_impl(&dword_215C14000, v24, OS_LOG_TYPE_DEFAULT, "Migrating mute module out of user-disabled list from settings with version: %lu", (uint8_t *)&v39, 0xCu);
    }
    v25 = (NSArray *)-[NSArray mutableCopy](self->_userDisabledModuleIdentifiers, "mutableCopy");
    -[NSArray removeObject:](v25, "removeObject:", CFSTR("com.apple.control-center.MuteModule"));
    v26 = self->_userDisabledModuleIdentifiers;
    self->_userDisabledModuleIdentifiers = v25;

    *a3 = 1;
  }
  if (!-[NSArray containsObject:](self->_orderedFixedModuleIdentifiers, "containsObject:", CFSTR("com.apple.control-center.MuteModule"))&& !-[NSArray containsObject:](self->_userDisabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.control-center.MuteModule"))&& !-[NSArray containsObject:](*p_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.control-center.MuteModule")))
  {
    v27 = (NSArray *)-[NSArray mutableCopy](*p_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    -[NSArray insertObject:atIndex:](v27, "insertObject:atIndex:", CFSTR("com.apple.control-center.MuteModule"), 0);
    v28 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v27;

    *a3 = 1;
  }
  if (-[NSArray containsObject:](self->_orderedFixedModuleIdentifiers, "containsObject:", CFSTR("com.apple.control-center.MuteModule"))&& -[NSArray containsObject:](*p_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.control-center.MuteModule")))
  {
    v29 = (NSArray *)-[NSArray mutableCopy](*p_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    -[NSArray removeObject:](v29, "removeObject:", CFSTR("com.apple.control-center.MuteModule"));
    v30 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v29;

    *a3 = 1;
  }
  if (!-[NSArray containsObject:](self->_orderedFixedModuleIdentifiers, "containsObject:", CFSTR("com.apple.mediaremote.controlcenter.airplaymirroring"))&& !-[NSArray containsObject:](self->_userDisabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.mediaremote.controlcenter.airplaymirroring"))&& !-[NSArray containsObject:](*p_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.mediaremote.controlcenter.airplaymirroring")))
  {
    v31 = (NSArray *)-[NSArray mutableCopy](*p_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    -[NSArray addObject:](v31, "addObject:", CFSTR("com.apple.mediaremote.controlcenter.airplaymirroring"));
    v32 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v31;

    *a3 = 1;
  }
  if (-[NSArray containsObject:](self->_orderedFixedModuleIdentifiers, "containsObject:", CFSTR("com.apple.mediaremote.controlcenter.airplaymirroring"))&& -[NSArray containsObject:](*p_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.mediaremote.controlcenter.airplaymirroring")))
  {
    v33 = (NSArray *)-[NSArray mutableCopy](*p_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    -[NSArray removeObject:](v33, "removeObject:", CFSTR("com.apple.mediaremote.controlcenter.airplaymirroring"));
    v34 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v33;

    *a3 = 1;
  }
  if (((_os_feature_enabled_impl() & 1) != 0 || _os_feature_enabled_impl())
    && !-[NSArray containsObject:](self->_userDisabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.springboard.SensitiveUIModule"))&& !-[NSArray containsObject:](*p_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.springboard.SensitiveUIModule")))
  {
    v35 = (NSArray *)-[NSArray mutableCopy](*p_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    -[NSArray addObject:](v35, "addObject:", CFSTR("com.apple.springboard.SensitiveUIModule"));
    v36 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v35;

    *a3 = 1;
  }
  if (objc_msgSend((id)objc_opt_class(), "_continuousExposeEnabled")
    && !-[NSArray containsObject:](self->_userDisabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.springboard.ContinuousExposeModule"))&& !-[NSArray containsObject:](*p_orderedUserEnabledModuleIdentifiers, "containsObject:", CFSTR("com.apple.springboard.ContinuousExposeModule")))
  {
    v37 = (NSArray *)-[NSArray mutableCopy](*p_orderedUserEnabledModuleIdentifiers, "mutableCopy");
    -[NSArray addObject:](v37, "addObject:", CFSTR("com.apple.springboard.ContinuousExposeModule"));
    v38 = *p_orderedUserEnabledModuleIdentifiers;
    *p_orderedUserEnabledModuleIdentifiers = v37;

    *a3 = 1;
  }
}

- (void)_queue_loadSettings
{
  void *v3;
  NSArray *v4;
  NSArray *userDisabledModuleIdentifiers;
  NSArray *v6;
  NSArray *orderedUserEnabledFixedModuleIdentifiers;
  NSArray *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  NSArray *orderedUserEnabledModuleIdentifiers;
  NSArray *v13;
  NSArray *v14;
  uint64_t v15;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v15 = 0;
  objc_msgSend((id)objc_opt_class(), "_readSettingsWithVersion:", &v15);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("disabled-module-identifiers"));
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  userDisabledModuleIdentifiers = self->_userDisabledModuleIdentifiers;
  self->_userDisabledModuleIdentifiers = v4;

  if (!self->_userDisabledModuleIdentifiers)
  {
    self->_userDisabledModuleIdentifiers = (NSArray *)MEMORY[0x24BDBD1A8];

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("userenabled-fixed-module-identifiers"));
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orderedUserEnabledFixedModuleIdentifiers = self->_orderedUserEnabledFixedModuleIdentifiers;
  self->_orderedUserEnabledFixedModuleIdentifiers = v6;

  v8 = self->_orderedUserEnabledFixedModuleIdentifiers;
  if (!v8)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultUserEnabledFixedModuleIdentifiers");
    v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v10 = self->_orderedUserEnabledFixedModuleIdentifiers;
    self->_orderedUserEnabledFixedModuleIdentifiers = v9;

  }
  objc_msgSend(v3, "objectForKey:", CFSTR("module-identifiers"));
  v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
  orderedUserEnabledModuleIdentifiers = self->_orderedUserEnabledModuleIdentifiers;
  self->_orderedUserEnabledModuleIdentifiers = v11;

  if (!self->_orderedUserEnabledModuleIdentifiers)
  {
    objc_msgSend((id)objc_opt_class(), "_defaultUserEnabledModuleIdentifiers");
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v14 = self->_orderedUserEnabledModuleIdentifiers;
    self->_orderedUserEnabledModuleIdentifiers = v13;

LABEL_9:
    -[CCSModuleSettingsProvider _queue_saveSettings](self, "_queue_saveSettings");
    goto LABEL_10;
  }
  if (!v8)
    goto LABEL_9;
LABEL_10:

}

- (void)_queue_saveSettings
{
  objc_msgSend((id)objc_opt_class(), "_writeOrderedIdentifiers:userEnabledFixedIdentifiers:userDisabledIdentifiers:", self->_orderedUserEnabledModuleIdentifiers, self->_orderedUserEnabledFixedModuleIdentifiers, self->_userDisabledModuleIdentifiers);
}

- (void)_queue_startMonitoringConfigurationUpdates
{
  id v3;
  int v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *configurationChangedSource;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  int v11;
  _QWORD handler[4];
  id v13;
  id location;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend((id)objc_opt_class(), "_configurationFileURL");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0x8000);
  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA28], v4, 1uLL, (dispatch_queue_t)self->_queue);
  configurationChangedSource = self->_configurationChangedSource;
  self->_configurationChangedSource = v5;

  objc_initWeak(&location, self);
  v7 = self->_configurationChangedSource;
  v8 = MEMORY[0x24BDAC760];
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __71__CCSModuleSettingsProvider__queue_startMonitoringConfigurationUpdates__block_invoke;
  handler[3] = &unk_24D460DC0;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler(v7, handler);
  v9 = self->_configurationChangedSource;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __71__CCSModuleSettingsProvider__queue_startMonitoringConfigurationUpdates__block_invoke_2;
  v10[3] = &__block_descriptor_36_e5_v8__0l;
  v11 = v4;
  dispatch_source_set_cancel_handler(v9, v10);
  dispatch_resume((dispatch_object_t)self->_configurationChangedSource);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __71__CCSModuleSettingsProvider__queue_startMonitoringConfigurationUpdates__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_handleConfigurationFileUpdate");

}

uint64_t __71__CCSModuleSettingsProvider__queue_startMonitoringConfigurationUpdates__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)_queue_stopMonitoringConfigurationUpdates
{
  NSObject *configurationChangedSource;
  OS_dispatch_source *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  configurationChangedSource = self->_configurationChangedSource;
  if (configurationChangedSource)
  {
    dispatch_source_cancel(configurationChangedSource);
    v4 = self->_configurationChangedSource;
    self->_configurationChangedSource = 0;

  }
}

- (void)_queue_handleConfigurationFileUpdate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[CCSModuleSettingsProvider _queue_stopMonitoringConfigurationUpdates](self, "_queue_stopMonitoringConfigurationUpdates");
  -[CCSModuleSettingsProvider _queue_loadSettings](self, "_queue_loadSettings");
  -[CCSModuleSettingsProvider _queue_startMonitoringConfigurationUpdates](self, "_queue_startMonitoringConfigurationUpdates");
  -[CCSModuleSettingsProvider _queue_sendConfigurationFileUpdateMessageToObservers](self, "_queue_sendConfigurationFileUpdateMessageToObservers");
}

- (void)_queue_sendConfigurationFileUpdateMessageToObservers
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __81__CCSModuleSettingsProvider__queue_sendConfigurationFileUpdateMessageToObservers__block_invoke;
  v2[3] = &unk_24D460E08;
  v2[4] = self;
  -[CCSModuleSettingsProvider _queue_runBlockOnListeners:](self, "_queue_runBlockOnListeners:", v2);
}

uint64_t __81__CCSModuleSettingsProvider__queue_sendConfigurationFileUpdateMessageToObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "orderedEnabledModuleIdentifiersChangedForSettingsProvider:", *(_QWORD *)(a1 + 32));
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__CCSModuleSettingsProvider_addObserver___block_invoke;
  block[3] = &unk_24D460D30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __41__CCSModuleSettingsProvider_addObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__CCSModuleSettingsProvider_removeObserver___block_invoke;
  block[3] = &unk_24D460D30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __44__CCSModuleSettingsProvider_removeObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_runBlockOnListeners:(id)a3
{
  id v4;
  void *v5;
  NSObject *callOutQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CCSModuleSettingsProvider__queue_runBlockOnListeners___block_invoke;
  block[3] = &unk_24D460A70;
  v10 = v5;
  v11 = v4;
  v7 = v4;
  v8 = v5;
  dispatch_sync(callOutQueue, block);

}

uint64_t __56__CCSModuleSettingsProvider__queue_runBlockOnListeners___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bs_each:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)_continuousExposeEnabled
{
  if ((MGGetBoolAnswer() & 1) != 0)
    return 1;
  else
    return MGGetBoolAnswer();
}

+ (id)_defaultEnabledModuleOrder
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CCSModuleSettingsProvider__defaultEnabledModuleOrder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_defaultEnabledModuleOrder_onceToken != -1)
    dispatch_once(&_defaultEnabledModuleOrder_onceToken, block);
  return (id)_defaultEnabledModuleOrder_moduleOrderDict;
}

void __55__CCSModuleSettingsProvider__defaultEnabledModuleOrder__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  char v4;
  int v5;
  void *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deviceClass");

  if (v3)
  {
    v4 = MGGetBoolAnswer();
    v5 = objc_msgSend(*(id *)(a1 + 32), "_continuousExposeEnabled");
    if ((v4 & 1) != 0)
    {
      if (v5)
      {
        v13[0] = CFSTR("fixed");
        v13[1] = CFSTR("user-enabled-fixed");
        v14[0] = &unk_24D464A60;
        v14[1] = MEMORY[0x24BDBD1A8];
        v13[2] = CFSTR("user-enabled");
        v14[2] = &unk_24D464A78;
        v6 = (void *)MEMORY[0x24BDBCE70];
        v7 = v14;
        v8 = v13;
      }
      else
      {
        v11[0] = CFSTR("fixed");
        v11[1] = CFSTR("user-enabled-fixed");
        v12[0] = &unk_24D464A90;
        v12[1] = MEMORY[0x24BDBD1A8];
        v11[2] = CFSTR("user-enabled");
        v12[2] = &unk_24D464AA8;
        v6 = (void *)MEMORY[0x24BDBCE70];
        v7 = v12;
        v8 = v11;
      }
    }
    else
    {
      v15[0] = CFSTR("fixed");
      v15[1] = CFSTR("user-enabled-fixed");
      v16[0] = &unk_24D464A30;
      v16[1] = MEMORY[0x24BDBD1A8];
      v15[2] = CFSTR("user-enabled");
      v16[2] = &unk_24D464A48;
      v6 = (void *)MEMORY[0x24BDBCE70];
      v7 = v16;
      v8 = v15;
    }
  }
  else if ((MGGetBoolAnswer() & 1) != 0)
  {
    v17[0] = CFSTR("fixed");
    v17[1] = CFSTR("user-enabled-fixed");
    v18[0] = &unk_24D464A00;
    v18[1] = MEMORY[0x24BDBD1A8];
    v17[2] = CFSTR("user-enabled");
    v18[2] = &unk_24D464A18;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = v18;
    v8 = v17;
  }
  else
  {
    v19[0] = CFSTR("fixed");
    v19[1] = CFSTR("user-enabled-fixed");
    v20[0] = &unk_24D4649D0;
    v20[1] = MEMORY[0x24BDBD1A8];
    v19[2] = CFSTR("user-enabled");
    v20[2] = &unk_24D4649E8;
    v6 = (void *)MEMORY[0x24BDBCE70];
    v7 = v20;
    v8 = v19;
  }
  objc_msgSend(v6, "dictionaryWithObjects:forKeys:count:", v7, v8, 3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)_defaultEnabledModuleOrder_moduleOrderDict;
  _defaultEnabledModuleOrder_moduleOrderDict = v9;

}

+ (id)_configurationDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x24BDBCF48];
  BSCurrentUserDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = CFSTR("Library");
  v7[2] = CFSTR("ControlCenter");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPathComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_configurationFileURL
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_configurationDirectoryURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("ModuleConfiguration.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_defaultFixedModuleIdentifiers
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_defaultEnabledModuleOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("fixed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_defaultUserEnabledFixedModuleIdentifiers
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_defaultEnabledModuleOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("user-enabled-fixed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_defaultUserEnabledModuleIdentifiers
{
  void *v2;
  void *v3;

  objc_msgSend((id)objc_opt_class(), "_defaultEnabledModuleOrder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("user-enabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDisabledModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedUserEnabledFixedModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedUserEnabledModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedFixedModuleIdentifiers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_configurationChangedSource, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)_readSettingsWithVersion:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138543874;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  v7 = 2048;
  v8 = 3;
  _os_log_error_impl(&dword_215C14000, log, OS_LOG_TYPE_ERROR, "Configuration file at %{public}@ has an invalid version number, %lu (current version = %lu)", (uint8_t *)&v3, 0x20u);
}

+ (void)_writeOrderedIdentifiers:userEnabledFixedIdentifiers:userDisabledIdentifiers:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_215C14000, v0, v1, "Error writing configuration file %{public}@, %{public}@");
}

+ (void)_writeOrderedIdentifiers:userEnabledFixedIdentifiers:userDisabledIdentifiers:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_215C14000, v0, v1, "Error creating directory for configuration file %{public}@, %{public}@");
}

@end
