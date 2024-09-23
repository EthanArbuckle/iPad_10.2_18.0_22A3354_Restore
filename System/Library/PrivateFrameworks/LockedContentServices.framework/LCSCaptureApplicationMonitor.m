@implementation LCSCaptureApplicationMonitor

+ (id)_bundleIdentifierAllowList
{
  if (_bundleIdentifierAllowList_onceToken != -1)
    dispatch_once(&_bundleIdentifierAllowList_onceToken, &__block_literal_global);
  return (id)_bundleIdentifierAllowList_allowList;
}

void __58__LCSCaptureApplicationMonitor__bundleIdentifierAllowList__block_invoke()
{
  void *v0;

  v0 = (void *)_bundleIdentifierAllowList_allowList;
  _bundleIdentifierAllowList_allowList = (uint64_t)&unk_251107C28;

}

- (LCSCaptureApplicationMonitor)init
{
  LCSCaptureApplicationMonitor *v2;
  LCSCaptureApplicationMonitor *v3;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSHashTable *queue_observers;
  LCSExtensionMonitor *v8;
  LCSExtensionProvider *queue_extensionMonitor;
  LCSFirstUnlockManager *v10;
  _QWORD v12[4];
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)LCSCaptureApplicationMonitor;
  v2 = -[LCSCaptureApplicationMonitor init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = objc_claimAutoreleasedReturnValue();
    queue_observers = v3->_queue_observers;
    v3->_queue_observers = (NSHashTable *)v6;

    v8 = -[LCSExtensionMonitor initWithExtensionPointIdentifier:]([LCSExtensionMonitor alloc], "initWithExtensionPointIdentifier:", CFSTR("com.apple.securecapture"));
    queue_extensionMonitor = v3->_queue_extensionMonitor;
    v3->_queue_extensionMonitor = (LCSExtensionProvider *)v8;

    -[LCSExtensionProvider addObserver:](v3->_queue_extensionMonitor, "addObserver:", v3);
    -[LCSCaptureApplicationMonitor _beginObservingMetadataChanges](v3, "_beginObservingMetadataChanges");
    objc_initWeak(&location, v3);
    v10 = objc_alloc_init(LCSFirstUnlockManager);
    if (!-[LCSFirstUnlockManager hasUnlockedSinceBoot](v10, "hasUnlockedSinceBoot"))
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __36__LCSCaptureApplicationMonitor_init__block_invoke;
      v12[3] = &unk_251104988;
      objc_copyWeak(&v13, &location);
      -[LCSFirstUnlockManager setPostFirstUnlockHandler:](v10, "setPostFirstUnlockHandler:", v12);
      objc_storeStrong((id *)&v3->_firstUnlockManager, v10);
      objc_destroyWeak(&v13);
    }

    objc_destroyWeak(&location);
  }
  return v3;
}

void __36__LCSCaptureApplicationMonitor_init__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_reevaluateCaptureApplicationRequirements");
    v2 = (void *)v3[6];
    v3[6] = 0;

    WeakRetained = v3;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[LCSCaptureApplicationMonitor invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)LCSCaptureApplicationMonitor;
  -[LCSCaptureApplicationMonitor dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  -[LCSCaptureApplicationMonitor _endObservingMetadataChanges](self, "_endObservingMetadataChanges");
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__LCSCaptureApplicationMonitor_invalidate__block_invoke;
  block[3] = &unk_2511049B0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __42__LCSCaptureApplicationMonitor_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "invalidate");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = 0;

}

- (NSDictionary)knownCaptureApplicationsByBundleIdentifier
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSDictionary copy](self->_lock_knownCaptureApplicationsByBundleIdentifier, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v4;
}

- (void)addObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __44__LCSCaptureApplicationMonitor_addObserver___block_invoke;
    v7[3] = &unk_2511049D8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __44__LCSCaptureApplicationMonitor_addObserver___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count"))
  {
    LCSLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_240B1C000, v2, OS_LOG_TYPE_DEFAULT, "Starting extension monitor because first observer added", v4, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_queue_start");
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __47__LCSCaptureApplicationMonitor_removeObserver___block_invoke;
    v7[3] = &unk_2511049D8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

uint64_t __47__LCSCaptureApplicationMonitor_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  uint8_t v4[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "count");
  if (!result)
  {
    LCSLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_240B1C000, v3, OS_LOG_TYPE_DEFAULT, "Suspending extension monitor because no observers left", v4, 2u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "_queue_cancel");
  }
  return result;
}

- (BOOL)isCaptureApplication:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)-[NSDictionary copy](self->_lock_knownCaptureApplicationsByBundleIdentifier, "copy");
  os_unfair_lock_unlock(p_lock);
  if (v6
    && (objc_msgSend(v6, "objectForKey:", v4), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
  {
    v8 = 1;
  }
  else
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC79E8]), "initWithExtensionPointIdentifier:", CFSTR("com.apple.securecapture"));
    objc_msgSend(MEMORY[0x24BDC79F0], "executeQuery:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __53__LCSCaptureApplicationMonitor_isCaptureApplication___block_invoke;
    v13[3] = &unk_251104A00;
    v14 = v4;
    objc_msgSend(v10, "bs_firstObjectPassingTest:", v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v11 != 0;

  }
  return v8;
}

uint64_t __53__LCSCaptureApplicationMonitor_isCaptureApplication___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "containingBundleRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (void)_reevaluateCaptureApplicationRequirements
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x24BDBCF20];
  -[LCSExtensionProvider knownCaptureExtensions](self->_queue_extensionMonitor, "knownCaptureExtensions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[LCSCaptureApplicationMonitor _evaluateCaptureApplicationRequirementsForKnownExtensions:](self, "_evaluateCaptureApplicationRequirementsForKnownExtensions:", v5);
}

- (void)_evaluateCaptureApplicationRequirementsForKnownExtensions:(id)a3
{
  void *v4;
  NSDictionary *v5;
  NSDictionary *lock_knownCaptureApplicationsByBundleIdentifier;
  void *v7;
  void *v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;

  -[LCSCaptureApplicationMonitor _captureApplicationsFromKnownExtensions:](self, "_captureApplicationsFromKnownExtensions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");
  lock_knownCaptureApplicationsByBundleIdentifier = self->_lock_knownCaptureApplicationsByBundleIdentifier;
  self->_lock_knownCaptureApplicationsByBundleIdentifier = v5;

  os_unfair_lock_unlock(&self->_lock);
  v7 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __90__LCSCaptureApplicationMonitor__evaluateCaptureApplicationRequirementsForKnownExtensions___block_invoke;
  v12[3] = &unk_2511049D8;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_async(queue, v12);

}

void __90__LCSCaptureApplicationMonitor__evaluateCaptureApplicationRequirementsForKnownExtensions___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "copy", 0);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "captureApplicationProvider:didUpdateKnownApplications:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_queue_start
{
  -[LCSExtensionProvider start](self->_queue_extensionMonitor, "start");
}

- (void)_queue_cancel
{
  -[LCSExtensionProvider cancel](self->_queue_extensionMonitor, "cancel");
}

- (void)_beginObservingMetadataChanges
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *metadataChangedObserverToken;
  _QWORD v7[4];
  id v8;
  id location;

  if (!self->_metadataChangedObserverToken)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x24BE5FED0];
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __62__LCSCaptureApplicationMonitor__beginObservingMetadataChanges__block_invoke;
    v7[3] = &unk_251104A28;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
    v5 = objc_claimAutoreleasedReturnValue();

    metadataChangedObserverToken = self->_metadataChangedObserverToken;
    self->_metadataChangedObserverToken = v5;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __62__LCSCaptureApplicationMonitor__beginObservingMetadataChanges__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BE5FED8]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "_processMetadataChangeForBundleIdentifiers:", v5);
  }

}

- (void)_processMetadataChangeForBundleIdentifiers:(id)a3
{
  id v4;
  NSObject *queue;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _QWORD block[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy_;
  v31 = __Block_byref_object_dispose_;
  v32 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__LCSCaptureApplicationMonitor__processMetadataChangeForBundleIdentifiers___block_invoke;
  block[3] = &unk_251104A50;
  block[4] = self;
  block[5] = &v27;
  dispatch_sync(queue, block);
  if (objc_msgSend((id)v28[5], "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2 * objc_msgSend((id)v28[5], "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (id)v28[5];
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v11, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          objc_msgSend(v11, "containerBundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
      }
      while (v8);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v14 = v4;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v33, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v19;
      while (2)
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v19 != v16)
            objc_enumerationMutation(v14);
          if (objc_msgSend(v6, "containsObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (_QWORD)v18))
          {

            goto LABEL_20;
          }
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v33, 16);
        if (v15)
          continue;
        break;
      }
    }

    if (!v14)
LABEL_20:
      -[LCSCaptureApplicationMonitor _reevaluateCaptureApplicationRequirements](self, "_reevaluateCaptureApplicationRequirements", (_QWORD)v18);

  }
  _Block_object_dispose(&v27, 8);

}

void __75__LCSCaptureApplicationMonitor__processMetadataChangeForBundleIdentifiers___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "knownCaptureExtensions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_endObservingMetadataChanges
{
  void *v3;
  NSObject *metadataChangedObserverToken;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_metadataChangedObserverToken);

  metadataChangedObserverToken = self->_metadataChangedObserverToken;
  self->_metadataChangedObserverToken = 0;

}

- (id)_captureApplicationsFromKnownExtensions:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __72__LCSCaptureApplicationMonitor__captureApplicationsFromKnownExtensions___block_invoke;
  v10[3] = &unk_251104A78;
  v10[4] = self;
  v6 = v5;
  v11 = v6;
  objc_msgSend(v4, "bs_each:", v10);

  v7 = v11;
  v8 = v6;

  return v8;
}

void __72__LCSCaptureApplicationMonitor__captureApplicationsFromKnownExtensions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  LCSCaptureApplication *v13;
  int v14;
  void *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "containerBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 32), "_hasCaptureAppIntentForBundleIdentifier:extensionBundleIdentifier:", v4, v5);
  v7 = objc_msgSend(*(id *)(a1 + 32), "_hasCameraUsageDescriptionForBundleIdentifier:", v4);
  v8 = objc_msgSend(*(id *)(a1 + 32), "_hasCameraUsageDescriptionForBundleIdentifier:", v5);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "BOOLForKey:", CFSTR("LCSIgnoreCaptureApplicationRequirementsKey")) & 1) != 0)
  {
    v10 = 1;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_bundleIdentifierAllowList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "containsObject:", v4);

  }
  LCSLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138413570;
    v15 = v4;
    v16 = 1024;
    v17 = v7;
    v18 = 2112;
    v19 = v5;
    v20 = 1024;
    v21 = v8;
    v22 = 1024;
    v23 = v6;
    v24 = 1024;
    v25 = v10;
    _os_log_impl(&dword_240B1C000, v12, OS_LOG_TYPE_DEFAULT, "Capture Application (%@): appHasCameraUsageDescription: %{BOOL}u; Extension (%@): extensionHasCameraUsageDescripti"
      "on: %{BOOL}u; bundleHasCaptureAppIntent %{BOOL}u, captureApplicationRequirementsIgnored: %{BOOL}u",
      (uint8_t *)&v14,
      0x2Eu);
  }

  if ((v7 & v8 & v6 | v10) == 1)
  {
    v13 = -[LCSCaptureApplication initWithExtensionInfo:]([LCSCaptureApplication alloc], "initWithExtensionInfo:", v3);
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v4);

  }
}

- (BOOL)_hasCaptureAppIntentForBundleIdentifier:(id)a3 extensionBundleIdentifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v36 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE60128]), "initWithOptions:", 0);
  objc_msgSend(MEMORY[0x24BE5FDE0], "cameraCaptureProtocol");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  v31 = v6;
  objc_msgSend(v6, "actionsConformingToSystemProtocol:withParametersOfTypes:bundleIdentifier:error:", v7, v8, v5, 0);
  v9 = objc_claimAutoreleasedReturnValue();

  v30 = (void *)v9;
  v10 = (void *)v9;
  v11 = v5;
  objc_msgSend(v10, "objectForKeyedSubscript:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v13;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
  if (v34)
  {
    v14 = 0;
    v33 = *(_QWORD *)v42;
    while (2)
    {
      for (i = 0; i != v34; ++i)
      {
        if (*(_QWORD *)v42 != v33)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        objc_msgSend(v16, "effectiveBundleIdentifiers");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
        if (v18)
        {
          v19 = v18;
          v35 = i;
          v20 = 0;
          v21 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v38 != v21)
                objc_enumerationMutation(v17);
              v23 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              objc_msgSend(v23, "bundleIdentifier");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "isEqualToString:", v11);

              v14 |= v25;
              objc_msgSend(v23, "bundleIdentifier");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v23) = objc_msgSend(v26, "isEqualToString:", v36);

              v20 |= v23;
            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v51, 16);
          }
          while (v19);

          if ((v20 & 1) != 0)
          {
            v27 = 1;
            goto LABEL_21;
          }
          i = v35;
        }
        else
        {

        }
      }
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v52, 16);
      if (v34)
        continue;
      break;
    }
    v27 = 0;
  }
  else
  {
    v27 = 0;
    v14 = 0;
  }
LABEL_21:

  LCSLogCommon();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v46 = v11;
    v47 = 1024;
    v48 = v14 & 1;
    v49 = 1024;
    v50 = v27;
    _os_log_impl(&dword_240B1C000, v28, OS_LOG_TYPE_DEFAULT, "Capture Application (%@): appHasCaptureAppIntent %{BOOL}u, extensionHasCaptureAppIntent %{BOOL}u", buf, 0x18u);
  }

  return v27 & v14;
}

- (BOOL)_hasCameraUsageDescriptionForBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[LCSCaptureApplicationMonitor _bundleRecordForBundleIdentifier:](self, "_bundleRecordForBundleIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "infoDictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSObject objectForKey:ofClass:](v7, "objectForKey:ofClass:", CFSTR("NSCameraUsageDescription"), objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LCSLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_240B1C000, v9, OS_LOG_TYPE_DEFAULT, "NSCameraUsageDescription for %@", (uint8_t *)&v12, 0xCu);
    }

    if (v8)
      v10 = objc_msgSend(v8, "isEqualToString:", &stru_251104E30) ^ 1;
    else
      LOBYTE(v10) = 0;

  }
  else
  {
    LCSLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v4;
      _os_log_impl(&dword_240B1C000, v7, OS_LOG_TYPE_DEFAULT, "No NSCameraUsageDescription for %@", (uint8_t *)&v12, 0xCu);
    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (id)_bundleRecordForBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;

  v3 = a3;
  v8 = 0;
  objc_msgSend(MEMORY[0x24BDC1558], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  if (!v4)
  {
    LCSLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[LCSCaptureApplicationMonitor _bundleRecordForBundleIdentifier:].cold.1((uint64_t)v3, v5, v6);

  }
  return v4;
}

- (void)captureExtensionProvider:(id)a3 didUpdateKnownExtensions:(id)a4
{
  -[LCSCaptureApplicationMonitor _evaluateCaptureApplicationRequirementsForKnownExtensions:](self, "_evaluateCaptureApplicationRequirementsForKnownExtensions:", a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataChangedObserverToken, 0);
  objc_storeStrong((id *)&self->_firstUnlockManager, 0);
  objc_storeStrong((id *)&self->_queue_extensionMonitor, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_lock_knownCaptureApplicationsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_bundleRecordForBundleIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "localizedDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_240B1C000, a3, OS_LOG_TYPE_ERROR, "Unable to resolve bundle record for %@: %@", (uint8_t *)&v6, 0x16u);

}

@end
