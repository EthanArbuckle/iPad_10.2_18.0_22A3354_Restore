@implementation MEAppExtensionsController

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__MEAppExtensionsController_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (id)log_log;
}

void __32__MEAppExtensionsController_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sIntance;
}

void __43__MEAppExtensionsController_sharedInstance__block_invoke()
{
  MEAppExtensionsController *v0;
  void *v1;

  v0 = objc_alloc_init(MEAppExtensionsController);
  v1 = (void *)sharedInstance_sIntance;
  sharedInstance_sIntance = (uint64_t)v0;

}

+ (id)_emailExtensionAttributeDictionary
{
  if (_emailExtensionAttributeDictionary_onceToken != -1)
    dispatch_once(&_emailExtensionAttributeDictionary_onceToken, &__block_literal_global_19);
  return (id)_emailExtensionAttributeDictionary_sMatchDictionary;
}

void __63__MEAppExtensionsController__emailExtensionAttributeDictionary__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE72FE0];
  v3[0] = CFSTR("com.apple.email.extension");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_emailExtensionAttributeDictionary_sMatchDictionary;
  _emailExtensionAttributeDictionary_sMatchDictionary = v0;

}

- (MEAppExtensionsController)init
{
  MEAppExtensionsController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  uint64_t v5;
  NSMapTable *observers;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *stateCaptureQueue;
  uint64_t v11;
  EFCancelable *stateCaptureCancelable;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MEAppExtensionsController;
  v2 = -[MEAppExtensionsController init](&v16, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.email.extension.remoteExtensionLoader", v3);
    -[MEAppExtensionsController setQueue:](v2, "setQueue:", v4);

    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSMapTable *)v5;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_BACKGROUND, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.email.MEAppExtensionsController.stateCaptureQueue", v8);
    stateCaptureQueue = v2->_stateCaptureQueue;
    v2->_stateCaptureQueue = (OS_dispatch_queue *)v9;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v2);
    objc_copyWeak(&v14, &location);
    EFLogRegisterStateCaptureBlock();
    v11 = objc_claimAutoreleasedReturnValue();
    stateCaptureCancelable = v2->_stateCaptureCancelable;
    v2->_stateCaptureCancelable = (EFCancelable *)v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __33__MEAppExtensionsController_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
  v2 = *((id *)WeakRetained + 4);
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "ef_publicDescription", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        if (objc_msgSend(v9, "isEnabled"))
        {
          objc_msgSend(v9, "ef_publicDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v6);
  }

  v18[0] = CFSTR("All Extensions");
  v18[1] = CFSTR("Enabled Extensions");
  v19[0] = v3;
  v19[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[MEAppExtensionsController _stopMatchingExtensions](self, "_stopMatchingExtensions");
  -[EFCancelable cancel](self->_stateCaptureCancelable, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MEAppExtensionsController;
  -[MEAppExtensionsController dealloc](&v3, sel_dealloc);
}

- (void)registerMailAppExtensionsObserver:(id)a3 capabilities:(id)a4 includeDisabled:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  MEMailAppExtensionObserverCriteria *v13;
  os_unfair_lock_s *p_lock;
  void *v15;
  _BOOL4 areRemoteExtensionsFetched;
  void *v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  NSArray *v21;
  void *v22;
  _QWORD v23[5];
  MEMailAppExtensionObserverCriteria *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id from;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = -[MEMailAppExtensionObserverCriteria initWithCapabilities:includeDisabled:]([MEMailAppExtensionObserverCriteria alloc], "initWithCapabilities:includeDisabled:", v11, v7);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_observers, "objectForKey:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    areRemoteExtensionsFetched = self->_areRemoteExtensionsFetched;
    os_unfair_lock_unlock(p_lock);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("MEMailExtensionErrorDomain"), 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _BOOL4, void *))v12 + 2))(v12, 0, 0, areRemoteExtensionsFetched, v17);

  }
  else
  {
    -[NSMapTable setObject:forKey:](self->_observers, "setObject:forKey:", v13, v10);
    v18 = self->_areRemoteExtensionsFetched;
    os_unfair_lock_unlock(&self->_lock);
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v10);
    v19 = objc_alloc_init(MEMORY[0x24BE2E638]);
    from = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&from, self);
    v20 = MEMORY[0x24BDAC760];
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __103__MEAppExtensionsController_registerMailAppExtensionsObserver_capabilities_includeDisabled_completion___block_invoke;
    v25[3] = &unk_24C4D2648;
    objc_copyWeak(&v26, &from);
    objc_copyWeak(&v27, &location);
    objc_msgSend(v19, "addCancelationBlock:", v25);
    os_unfair_lock_lock(&self->_lock);
    v21 = self->_allRemoteExtensions;
    if (!self->_extensionMatchingContext)
      -[MEAppExtensionsController _startMatchingExtensions](self, "_startMatchingExtensions");
    os_unfair_lock_unlock(&self->_lock);
    v23[0] = v20;
    v23[1] = 3221225472;
    v23[2] = __103__MEAppExtensionsController_registerMailAppExtensionsObserver_capabilities_includeDisabled_completion___block_invoke_2;
    v23[3] = &unk_24C4D2670;
    v23[4] = self;
    v24 = v13;
    -[NSArray ef_filter:](v21, "ef_filter:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, id, void *, _BOOL4, _QWORD))v12 + 2))(v12, v19, v22, v18, 0);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&from);

    objc_destroyWeak(&location);
  }

}

void __103__MEAppExtensionsController_registerMailAppExtensionsObserver_capabilities_includeDisabled_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
  v2 = (void *)*((_QWORD *)WeakRetained + 1);
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v2, "removeObjectForKey:", v3);

  if (!objc_msgSend(*((id *)WeakRetained + 1), "count"))
    objc_msgSend(WeakRetained, "_stopMatchingExtensions");
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);

}

uint64_t __103__MEAppExtensionsController_registerMailAppExtensionsObserver_capabilities_includeDisabled_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_extension:matchesCriteria:", a2, *(_QWORD *)(a1 + 40));
}

- (id)extensionForIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSArray *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = self->_allRemoteExtensions;
  os_unfair_lock_unlock(p_lock);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __52__MEAppExtensionsController_extensionForIdentifier___block_invoke;
  v10[3] = &unk_24C4D2698;
  v11 = v4;
  v7 = v4;
  -[NSArray ef_firstObjectPassingTest:](v6, "ef_firstObjectPassingTest:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __52__MEAppExtensionsController_extensionForIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "extensionID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)hasSecurityExtensionsEnabled
{
  NSArray *v2;
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = self->_allRemoteExtensions;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v2;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (objc_msgSend(v7, "isEnabled", (_QWORD)v11))
        {
          objc_msgSend(v7, "capabilities");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "containsObject:", CFSTR("MEMessageSecurityHandler"));

          if ((v9 & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (void)_startMatchingExtensions
{
  void *v3;
  void *v4;
  void *v5;
  id extensionMatchingContext;
  _QWORD v7[5];

  v3 = (void *)MEMORY[0x24BDD1550];
  +[MEAppExtensionsController _emailExtensionAttributeDictionary](MEAppExtensionsController, "_emailExtensionAttributeDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__MEAppExtensionsController__startMatchingExtensions__block_invoke;
  v7[3] = &unk_24C4D2708;
  v7[4] = self;
  objc_msgSend(v3, "beginMatchingExtensionsWithAttributes:completion:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  extensionMatchingContext = self->_extensionMatchingContext;
  self->_extensionMatchingContext = v5;

}

void __53__MEAppExtensionsController__startMatchingExtensions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v3 = a2;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__MEAppExtensionsController__startMatchingExtensions__block_invoke_2;
  block[3] = &unk_24C4D26E0;
  objc_copyWeak(&v8, &location);
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __53__MEAppExtensionsController__startMatchingExtensions__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t k;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id obj;
  id v33;
  id WeakRetained;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v29 = *((id *)WeakRetained + 4);
  v2 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v29;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v44 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_msgSend(v6, "extensionID", v29);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, v7);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v3);
  }

  objc_msgSend(WeakRetained, "_remoteEmailExtensionsForExtensions:enabledOnly:", *(_QWORD *)(a1 + 32), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v30 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v33 = v30;
  v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v40 != v11)
          objc_enumerationMutation(v33);
        v13 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend(v13, "extensionID", v29);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, v14);

      }
      v10 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    }
    while (v10);
  }

  os_unfair_lock_lock((os_unfair_lock_t)WeakRetained + 4);
  objc_storeStrong((id *)WeakRetained + 4, v30);
  v15 = WeakRetained;
  v16 = (void *)objc_msgSend(*((id *)WeakRetained + 1), "copy");
  *((_BYTE *)WeakRetained + 40) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)WeakRetained + 4);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v16, "keyEnumerator");
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v36;
    do
    {
      for (k = 0; k != v17; ++k)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v31);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * k);
        objc_msgSend(v16, "objectForKey:", v20, v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_extensionsNewlyMatchingFromNewExtensions:currentExtensions:forCriteria:", v9, v2, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "_extensionsNoLongerMatchingFromNewExtensions:currentExtensions:forCriteria:", v9, v2, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "extensionsMatched:", v22);
        if (objc_msgSend(v23, "count"))
          objc_msgSend(v20, "extensionsNoLongerMatching:", v23);

        v15 = WeakRetained;
      }
      v17 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    }
    while (v17);
  }

  objc_msgSend(v33, "ef_compactMap:", &__block_literal_global_44);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)*((_QWORD *)WeakRetained + 8);
  *((_QWORD *)WeakRetained + 8) = v24;

  v26 = CFSTR("processing updates");
  if (!v29)
    v26 = CFSTR("startup");
  v27 = v26;
  objc_msgSend(WeakRetained, "_logExtensionsStateWithReason:", v27);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "postNotificationName:object:", CFSTR("MEMailAppExtensionsEnabledStateChanged"), WeakRetained);

}

id __53__MEAppExtensionsController__startMatchingExtensions__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if (objc_msgSend(v2, "isEnabled"))
  {
    objc_msgSend(v2, "extensionID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)_extensionsNewlyMatchingFromNewExtensions:(id)a3 currentExtensions:(id)a4 forCriteria:(id)a5
{
  id v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSArray *previouslyEnabledExtensionIdentifiers;
  void *v17;
  id v19;
  id v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v19 = a3;
  v21 = a4;
  v8 = a5;
  v9 = objc_msgSend(v8, "includeDisabled");
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v19, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (-[MEAppExtensionsController _extension:matchesCriteria:](self, "_extension:matchesCriteria:", v13, v8, v19))
        {
          objc_msgSend(v13, "extensionID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v9 & 1) != 0)
          {
            if (!v15)
              goto LABEL_12;
          }
          else if (objc_msgSend(v13, "isEnabled"))
          {
            previouslyEnabledExtensionIdentifiers = self->_previouslyEnabledExtensionIdentifiers;
            objc_msgSend(v13, "extensionID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(previouslyEnabledExtensionIdentifiers) = -[NSArray containsObject:](previouslyEnabledExtensionIdentifiers, "containsObject:", v17);

            if ((previouslyEnabledExtensionIdentifiers & 1) == 0)
LABEL_12:
              objc_msgSend(v20, "addObject:", v13);
          }

          continue;
        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  return v20;
}

- (id)_extensionsNoLongerMatchingFromNewExtensions:(id)a3 currentExtensions:(id)a4 forCriteria:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSArray *previouslyEnabledExtensionIdentifiers;
  void *v17;
  id v19;
  id v20;
  char v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v19 = a4;
  v9 = a5;
  v21 = objc_msgSend(v9, "includeDisabled");
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v19, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v13, "extensionID", v19);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!-[MEAppExtensionsController _extension:matchesCriteria:](self, "_extension:matchesCriteria:", v15, v9)
          && -[MEAppExtensionsController _extension:matchesOldCriteria:](self, "_extension:matchesOldCriteria:", v13, v9))
        {
          if ((v21 & 1) != 0)
          {
            if (v15)
              goto LABEL_14;
LABEL_13:
            objc_msgSend(v20, "addObject:", v13);
            goto LABEL_14;
          }
          if ((objc_msgSend(v15, "isEnabled") & 1) == 0)
          {
            previouslyEnabledExtensionIdentifiers = self->_previouslyEnabledExtensionIdentifiers;
            objc_msgSend(v15, "extensionID");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(previouslyEnabledExtensionIdentifiers) = -[NSArray containsObject:](previouslyEnabledExtensionIdentifiers, "containsObject:", v17);

            if ((previouslyEnabledExtensionIdentifiers & 1) != 0)
              goto LABEL_13;
          }
        }
LABEL_14:

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  return v20;
}

- (BOOL)_extension:(id)a3 matchesOldCriteria:(id)a4
{
  id v6;
  id v7;
  NSArray *previouslyEnabledExtensionIdentifiers;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "includeDisabled") & 1) != 0
    || (previouslyEnabledExtensionIdentifiers = self->_previouslyEnabledExtensionIdentifiers,
        objc_msgSend(v6, "extensionID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(previouslyEnabledExtensionIdentifiers) = -[NSArray containsObject:](previouslyEnabledExtensionIdentifiers, "containsObject:", v9), v9, (previouslyEnabledExtensionIdentifiers & 1) != 0))
  {
    objc_msgSend(v7, "capabilities");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[MEAppExtensionsController _extension:matchesCapabilities:](self, "_extension:matchesCapabilities:", v6, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)_extension:(id)a3 matchesCriteria:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v7, "includeDisabled") & 1) != 0 || (objc_msgSend(v6, "isEnabled") & 1) != 0)
  {
    objc_msgSend(v7, "capabilities");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MEAppExtensionsController _extension:matchesCapabilities:](self, "_extension:matchesCapabilities:", v6, v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_extension:(id)a3 matchesCapabilities:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "capabilities");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v8) = objc_msgSend(v6, "intersectsSet:", v9);
  return (char)v8;
}

- (void)_stopMatchingExtensions
{
  objc_msgSend(MEMORY[0x24BDD1550], "endMatchingExtensions:", self->_extensionMatchingContext);
}

- (id)_remoteEmailExtensionsForExtensions:(id)a3 enabledOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  NSObject *v14;
  MERemoteExtension *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x24BDAC8D0];
  v21 = a3;
  v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v21, "count"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = v21;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    v8 = !v4;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_plugIn");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "userElection");

        if (((objc_msgSend(v10, "optedIn") | v8) & 1) != 0 || v13 < 2uLL)
        {
          objc_msgSend(v10, "_plugIn");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = -[MERemoteExtension initWithExtension:]([MERemoteExtension alloc], "initWithExtension:", v10);
          -[NSObject identifier](v14, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v15, v16);

          +[MEAppExtensionsController log](MEAppExtensionsController, "log");
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v28 = (uint64_t)v11;
            _os_log_impl(&dword_20BB85000, v17, OS_LOG_TYPE_DEFAULT, "Found email extension with identifier:%@", buf, 0xCu);
          }

        }
        else
        {
          +[MEAppExtensionsController log](MEAppExtensionsController, "log");
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            v28 = (uint64_t)v11;
            v29 = 2080;
            v30 = "NO";
            v31 = 2048;
            v32 = v13;
            _os_log_debug_impl(&dword_20BB85000, v14, OS_LOG_TYPE_DEBUG, "Skipping extension:%@, optedIn:%s, election:%ld", buf, 0x20u);
          }
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    }
    while (v6);
  }

  +[MEAppExtensionsController log](MEAppExtensionsController, "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134217984;
    v28 = v19;
    _os_log_impl(&dword_20BB85000, v18, OS_LOG_TYPE_DEFAULT, "Found %lu email extensions", buf, 0xCu);
  }

  return v22;
}

- (void)_logExtensionsStateWithReason:(id)a3
{
  id v4;
  id v5;
  id v6;
  os_unfair_lock_s *p_lock;
  NSArray *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = self->_allRemoteExtensions;
  os_unfair_lock_unlock(p_lock);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = v8;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "ef_publicDescription", (_QWORD)v17);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v14);

        if (objc_msgSend(v13, "isEnabled"))
        {
          objc_msgSend(v13, "ef_publicDescription");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);

        }
      }
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v10);
  }

  MEMailExtensionsLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v22 = v4;
    v23 = 2114;
    v24 = v6;
    v25 = 2114;
    v26 = v5;
    _os_log_impl(&dword_20BB85000, v16, OS_LOG_TYPE_DEFAULT, "Current Mail Extensions for %{public}@ - \nEnabled Extensions - %{public}@\nAll Extensions %{public}@", buf, 0x20u);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSDictionary)extensionsByIdentifier
{
  return self->_extensionsByIdentifier;
}

- (void)setExtensionsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_extensionsByIdentifier, a3);
}

- (NSArray)previouslyEnabledExtensionIdentifiers
{
  return self->_previouslyEnabledExtensionIdentifiers;
}

- (void)setPreviouslyEnabledExtensionIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_previouslyEnabledExtensionIdentifiers, a3);
}

- (OS_dispatch_queue)stateCaptureQueue
{
  return self->_stateCaptureQueue;
}

- (EFCancelable)stateCaptureCancelable
{
  return self->_stateCaptureCancelable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureCancelable, 0);
  objc_storeStrong((id *)&self->_stateCaptureQueue, 0);
  objc_storeStrong((id *)&self->_previouslyEnabledExtensionIdentifiers, 0);
  objc_storeStrong((id *)&self->_extensionsByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_allRemoteExtensions, 0);
  objc_storeStrong(&self->_extensionMatchingContext, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
