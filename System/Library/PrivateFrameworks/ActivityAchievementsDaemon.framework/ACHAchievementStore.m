@implementation ACHAchievementStore

- (id)allAchievements
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__26;
  v9 = __Block_byref_object_dispose__26;
  v10 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __38__ACHAchievementStore_allAchievements__block_invoke;
  v4[3] = &unk_24D13AC40;
  v4[4] = self;
  v4[5] = &v5;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)recalculateProgressForAllAchievements
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __60__ACHAchievementStore_recalculateProgressForAllAchievements__block_invoke;
  v2[3] = &unk_24D13A338;
  v2[4] = self;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v2);
}

- (void)processAchievementProgressUpdates:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ACHAchievementStore *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__ACHAchievementStore_processAchievementProgressUpdates___block_invoke;
  v6[3] = &unk_24D13A360;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v6);

}

- (void)_performWithLock:(id)a3
{
  os_unfair_lock_s *p_syncLock;
  void (**v4)(_QWORD);

  p_syncLock = &self->_syncLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_syncLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_syncLock);
}

void __60__ACHAchievementStore_recalculateProgressForAllAchievements__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "achievementsByTemplateUniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_lock_addProgressAndGoalToAchievements:", v4);

}

void __57__ACHAchievementStore_processAchievementProgressUpdates___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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

  v22 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "achievementsByTemplateUniqueName", (_QWORD)v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "templateUniqueName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = *(void **)(a1 + 40);
          objc_msgSend(v8, "progressQuantity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "goalQuantity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "_updateProgressAndGoalFor:progressQuantity:goalQuantity:", v11, v13, v14);

          objc_msgSend(v2, "addObject:", v11);
        }

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

  v15 = *(void **)(a1 + 40);
  v16 = (void *)objc_msgSend(v2, "copy");
  objc_msgSend(v15, "_notifyObserversOfUpdatedAchievements:", v16);

}

void __38__ACHAchievementStore_allAchievements__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "achievementsByTemplateUniqueName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (NSMutableDictionary)achievementsByTemplateUniqueName
{
  return self->_achievementsByTemplateUniqueName;
}

- (void)_updateProgressAndGoalFor:(id)a3 progressQuantity:(id)a4 goalQuantity:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  ACHLogDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "template");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniqueName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "description");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "description");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    v19 = 2112;
    v20 = v14;
    _os_log_impl(&dword_21407B000, v10, OS_LOG_TYPE_DEFAULT, "Progress Update: %@: [%@/%@]", (uint8_t *)&v15, 0x20u);

  }
  objc_msgSend(v7, "setGoal:", v9);
  objc_msgSend(v7, "setProgress:", v8);

}

- (void)_notifyObserversOfUpdatedAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHAchievementStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__ACHAchievementStore__notifyObserversOfUpdatedAchievements___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)_lock_addProgressAndGoalToAchievements:(id)a3
{
  os_unfair_lock_s *p_syncLock;
  id v5;
  void *v6;
  id v7;

  p_syncLock = &self->_syncLock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_syncLock);
  -[ACHAchievementStore progressEngine](self, "progressEngine");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "populateProgressAndGoalForAchievements:", v6);
}

void __61__ACHAchievementStore__notifyObserversOfUpdatedAchievements___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "achievementStore:didUpdateAchievements:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (ACHAchievementProgressEngine)progressEngine
{
  return self->_progressEngine;
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (ACHAchievementStore)initWithClient:(id)a3 templateStore:(id)a4 earnedInstanceStore:(id)a5 templateAssetRegistry:(id)a6 progressEngine:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  ACHAchievementStore *v17;
  ACHAchievementStore *v18;
  NSMutableArray *v19;
  NSMutableArray *initialFetchObserversToCall;
  NSMutableDictionary *v21;
  NSMutableDictionary *achievementsByTemplateUniqueName;
  NSMutableDictionary *v23;
  NSMutableDictionary *achievementsByPrerequisiteTemplateName;
  uint64_t v25;
  NSHashTable *observers;
  uint64_t v27;
  OS_dispatch_queue *notificationQueue;
  uint64_t v29;
  OS_dispatch_queue *internalQueue;
  const char *v31;
  NSObject *v32;
  id v34;
  _QWORD handler[4];
  id v36;
  id location;
  objc_super v38;

  v34 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v38.receiver = self;
  v38.super_class = (Class)ACHAchievementStore;
  v17 = -[ACHAchievementStore init](&v38, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_syncLock._os_unfair_lock_opaque = 0;
    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    initialFetchObserversToCall = v18->_initialFetchObserversToCall;
    v18->_initialFetchObserversToCall = v19;

    objc_storeStrong((id *)&v18->_client, a3);
    objc_storeStrong((id *)&v18->_templateStore, a4);
    objc_storeStrong((id *)&v18->_earnedInstanceStore, a5);
    objc_storeStrong((id *)&v18->_templateAssetRegistry, a6);
    objc_storeStrong((id *)&v18->_progressEngine, a7);
    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    achievementsByTemplateUniqueName = v18->_achievementsByTemplateUniqueName;
    v18->_achievementsByTemplateUniqueName = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    achievementsByPrerequisiteTemplateName = v18->_achievementsByPrerequisiteTemplateName;
    v18->_achievementsByPrerequisiteTemplateName = v23;

    -[ACHTemplateAssetRegistry setDelegate:](v18->_templateAssetRegistry, "setDelegate:", v18);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v25 = objc_claimAutoreleasedReturnValue();
    observers = v18->_observers;
    v18->_observers = (NSHashTable *)v25;

    HKCreateSerialDispatchQueue();
    v27 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v18->_notificationQueue;
    v18->_notificationQueue = (OS_dispatch_queue *)v27;

    HKCreateSerialDispatchQueue();
    v29 = objc_claimAutoreleasedReturnValue();
    internalQueue = v18->_internalQueue;
    v18->_internalQueue = (OS_dispatch_queue *)v29;

    objc_initWeak(&location, v18);
    v31 = (const char *)objc_msgSend((id)*MEMORY[0x24BE01560], "UTF8String");
    v32 = v18->_internalQueue;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __109__ACHAchievementStore_initWithClient_templateStore_earnedInstanceStore_templateAssetRegistry_progressEngine___block_invoke;
    handler[3] = &unk_24D13A2C0;
    objc_copyWeak(&v36, &location);
    notify_register_dispatch(v31, &v18->_protectedDataToken, v32, handler);
    objc_msgSend(v13, "addObserver:", v18);
    objc_msgSend(v14, "addObserver:", v18);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v18;
}

void __109__ACHAchievementStore_initWithClient_templateStore_earnedInstanceStore_templateAssetRegistry_progressEngine___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleProtectedDataAvailabilityChangeNotification");

}

- (void)dealloc
{
  objc_super v3;

  if (notify_is_valid_token(self->_protectedDataToken))
    notify_cancel(self->_protectedDataToken);
  v3.receiver = self;
  v3.super_class = (Class)ACHAchievementStore;
  -[ACHAchievementStore dealloc](&v3, sel_dealloc);
}

- (void)_handleProtectedDataAvailabilityChangeNotification
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __73__ACHAchievementStore__handleProtectedDataAvailabilityChangeNotification__block_invoke;
  v2[3] = &unk_24D13A338;
  v2[4] = self;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v2);
}

void __73__ACHAchievementStore__handleProtectedDataAvailabilityChangeNotification__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "client");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isProtectedDataAvailable");

  ACHLogTemplates();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_21407B000, v4, OS_LOG_TYPE_DEFAULT, "Achievement store received notification of a change in protected data availability: %d", (uint8_t *)v8, 8u);
  }

  if (v3 && objc_msgSend(*(id *)(a1 + 32), "needsUpdateWhenProtectedDataAvailable"))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNeedsUpdateWhenProtectedDataAvailable:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_lock_populateMostRecentEarnedInstanceAndCountForAllAchievements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_lock_populatePrerequisiteMetForAllAchievements");
    if (objc_msgSend(v5, "count"))
    {
      v6 = *(void **)(a1 + 32);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v5);
      objc_msgSend(v6, "_notifyObserversOfUpdatedAchievements:", v7);

    }
  }
}

- (void)loadAllAchievementsFromDatabaseIfNecessaryWithCompletionHandler:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  unsigned int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[ACHAchievementStore earnedInstanceStore](self, "earnedInstanceStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "loadAllEarnedInstancesFromDatabaseIfNecessary");

  -[ACHAchievementStore templateStore](self, "templateStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "loadAllTemplatesFromDatabaseIfNecessary");

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, v5 & v7);
    v8 = v9;
  }

}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[ACHAchievementStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254D78500))
  {
    -[ACHAchievementStore notificationQueue](self, "notificationQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __35__ACHAchievementStore_addObserver___block_invoke;
    v8[3] = &unk_24D13A360;
    v8[4] = self;
    v9 = v4;
    dispatch_sync(v6, v8);

  }
  else
  {
    ACHLogDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ACHLegacyAchievementStore addObserver:].cold.1((uint64_t)v4, v7);

  }
}

void __35__ACHAchievementStore_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_initialFetchComplete"))
    {
      objc_msgSend(*(id *)(a1 + 40), "achievementStoreDidFinishInitialFetch:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __35__ACHAchievementStore_addObserver___block_invoke_2;
      v4[3] = &unk_24D13A360;
      v3 = *(void **)(a1 + 40);
      v5 = *(id *)(a1 + 32);
      v6 = v3;
      objc_msgSend(v5, "_performWithLock:", v4);

    }
  }
}

uint64_t __35__ACHAchievementStore_addObserver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)_initialFetchComplete
{
  ACHAchievementStore *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v2 = self;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__ACHAchievementStore__initialFetchComplete__block_invoke;
  v4[3] = &unk_24D13AC40;
  v4[4] = v2;
  v4[5] = &v5;
  -[ACHAchievementStore _performWithLock:](v2, "_performWithLock:", v4);
  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

uint64_t __44__ACHAchievementStore__initialFetchComplete__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "templateStoreFinishedInitialFetch");
  if ((_DWORD)result)
    result = objc_msgSend(*(id *)(a1 + 32), "earnedInstancsStoreFinishedInitialFetch");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHAchievementStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__ACHAchievementStore_removeObserver___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __38__ACHAchievementStore_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __38__ACHAchievementStore_removeObserver___block_invoke_2;
    v6[3] = &unk_24D13A360;
    v5 = *(void **)(a1 + 40);
    v7 = *(id *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v7, "_performWithLock:", v6);

  }
}

uint64_t __38__ACHAchievementStore_removeObserver___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (id)achievementsForEarnedDateComponents:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__26;
  v15 = __Block_byref_object_dispose__26;
  v16 = objc_alloc_init(MEMORY[0x24BDBCF20]);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__ACHAchievementStore_achievementsForEarnedDateComponents___block_invoke;
  v8[3] = &unk_24D13A3C8;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__ACHAchievementStore_achievementsForEarnedDateComponents___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "earnedInstanceStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "earnedInstancesForEarnedDateComponents:error:", *(_QWORD *)(a1 + 40), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__ACHAchievementStore_achievementsForEarnedDateComponents___block_invoke_2;
  v8[3] = &unk_24D13CA00;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "hk_map:", v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF20]), "initWithArray:", v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

id __59__ACHAchievementStore_achievementsForEarnedDateComponents___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "achievementsByTemplateUniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "templateUniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "shallowCopyWithRelevantEarnedInstance:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)ephemeralAchievementWithTemplateUniqueName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ACHAchievementStore *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__26;
    v16 = __Block_byref_object_dispose__26;
    v17 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __66__ACHAchievementStore_ephemeralAchievementWithTemplateUniqueName___block_invoke;
    v8[3] = &unk_24D13BA90;
    v10 = self;
    v11 = &v12;
    v9 = v4;
    -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v8);
    v6 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __66__ACHAchievementStore_ephemeralAchievementWithTemplateUniqueName___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int IsMonthlyChallenge;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = objc_alloc_init(MEMORY[0x24BE01830]);
  objc_msgSend(v15, "setTemplateUniqueName:", a1[4]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BE012A8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setEarnedDateComponents:", v5);

  IsMonthlyChallenge = ACHTemplateUniqueNameIsMonthlyChallenge();
  v7 = (void *)a1[5];
  if (IsMonthlyChallenge)
  {
    objc_msgSend(v7, "_lock_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:earnedInstance:", a1[4], v15);
  }
  else
  {
    objc_msgSend(v7, "achievementsByTemplateUniqueName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", a1[4]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[6] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "shallowCopyWithRelevantEarnedInstance:", v15);
  }
  v8 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1[6] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v8;

}

- (id)achievementWithTemplateUniqueName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__26;
    v15 = __Block_byref_object_dispose__26;
    v16 = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __57__ACHAchievementStore_achievementWithTemplateUniqueName___block_invoke;
    v8[3] = &unk_24D13AC68;
    v10 = &v11;
    v8[4] = self;
    v9 = v4;
    -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __57__ACHAchievementStore_achievementWithTemplateUniqueName___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "achievementsByTemplateUniqueName");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_lock_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:(id)a3 earnedInstance:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v6 = a4;
  v7 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  ACHMonthlyChallengeTypeFromTemplateUniqueName();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("_"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 3)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "integerValue");
    objc_msgSend(v20, "integerValue");
    ACHDateComponentsForYearMonthDay();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromComponents:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_startOfMonthForDate:addingMonths:", v19, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_startOfDateBySubtractingDays:fromDate:", 1, v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "components:fromDate:", 28, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v9, v12);
    ACHMonthlyChallengeTemplate();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSourceName:", *MEMORY[0x24BE01638]);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithTemplate:relevantEarnedInstance:earnedInstanceCount:", v14, v6, 1);
    -[ACHAchievementStore templateAssetRegistry](self, "templateAssetRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "populateResourcePropertiesForAchievement:", v15);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)requestUpdateProgressValuesForProgressProvider:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __70__ACHAchievementStore_requestUpdateProgressValuesForProgressProvider___block_invoke;
  v6[3] = &unk_24D13A360;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v6);

}

void __70__ACHAchievementStore_requestUpdateProgressValuesForProgressProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "achievementsByTemplateUniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__ACHAchievementStore_requestUpdateProgressValuesForProgressProvider___block_invoke_2;
  v7[3] = &unk_24D13BAB8;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "hk_filter:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_lock_addProgressAndGoalToAchievements:", v6);

}

uint64_t __70__ACHAchievementStore_requestUpdateProgressValuesForProgressProvider___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "providesProgressForTemplate:", v3);

  return v4;
}

- (void)_lock_notifyObserversOfInitialFetchCompletion
{
  NSObject *v3;
  _QWORD block[5];

  if (-[ACHAchievementStore templateStoreFinishedInitialFetch](self, "templateStoreFinishedInitialFetch"))
  {
    if (-[ACHAchievementStore earnedInstancsStoreFinishedInitialFetch](self, "earnedInstancsStoreFinishedInitialFetch"))
    {
      -[ACHAchievementStore notificationQueue](self, "notificationQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke;
      block[3] = &unk_24D13A338;
      block[4] = self;
      dispatch_async(v3, block);

    }
  }
}

uint64_t __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke_2;
  v3[3] = &unk_24D13A338;
  v3[4] = v1;
  return objc_msgSend(v1, "_performWithLock:", v3);
}

void __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x24BDAC760];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 32), "notificationQueue");
        v9 = objc_claimAutoreleasedReturnValue();
        v13[0] = v6;
        v13[1] = 3221225472;
        v13[2] = __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke_3;
        v13[3] = &unk_24D13A360;
        v10 = *(_QWORD *)(a1 + 32);
        v13[4] = v8;
        v13[5] = v10;
        dispatch_async(v9, v13);

        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 16);
  *(_QWORD *)(v11 + 16) = 0;

}

uint64_t __68__ACHAchievementStore__lock_notifyObserversOfInitialFetchCompletion__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "achievementStoreDidFinishInitialFetch:", *(_QWORD *)(a1 + 40));
}

- (void)_notifyObserversOfNewAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHAchievementStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__ACHAchievementStore__notifyObserversOfNewAchievements___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __57__ACHAchievementStore__notifyObserversOfNewAchievements___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "achievementStore:didAddAchievements:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfRemovedAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHAchievementStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__ACHAchievementStore__notifyObserversOfRemovedAchievements___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __61__ACHAchievementStore__notifyObserversOfRemovedAchievements___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "achievementStore:didRemoveAchievements:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)templateStoreDidFinishInitialFetch:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__ACHAchievementStore_templateStoreDidFinishInitialFetch___block_invoke;
  v6[3] = &unk_24D13A360;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v6);

}

uint64_t __58__ACHAchievementStore_templateStoreDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allTemplates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_lock_addTemplatesToLocalStore:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setTemplateStoreFinishedInitialFetch:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_lock_notifyObserversOfInitialFetchCompletion");
}

- (void)templateStore:(id)a3 didAddNewTemplates:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__ACHAchievementStore_templateStore_didAddNewTemplates___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v7);

}

uint64_t __56__ACHAchievementStore_templateStore_didAddNewTemplates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_addTemplatesToLocalStore:", *(_QWORD *)(a1 + 40));
}

- (void)templateStore:(id)a3 didRemoveTemplates:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __56__ACHAchievementStore_templateStore_didRemoveTemplates___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v7);

}

uint64_t __56__ACHAchievementStore_templateStore_didRemoveTemplates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_removeTemplatesFromLocalStore:", *(_QWORD *)(a1 + 40));
}

- (void)earnedInstanceStoreDidFinishInitialFetch:(id)a3
{
  _QWORD v4[5];

  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __64__ACHAchievementStore_earnedInstanceStoreDidFinishInitialFetch___block_invoke;
  v4[3] = &unk_24D13A338;
  v4[4] = self;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v4);
}

uint64_t __64__ACHAchievementStore_earnedInstanceStoreDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setEarnedInstancsStoreFinishedInitialFetch:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_lock_notifyObserversOfInitialFetchCompletion");
}

- (void)earnedInstanceStore:(id)a3 didAddNewEarnedInstances:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  ACHAchievementStore *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__26;
  v19 = __Block_byref_object_dispose__26;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__ACHAchievementStore_earnedInstanceStore_didAddNewEarnedInstances___block_invoke;
  v11[3] = &unk_24D13A3C8;
  v8 = v7;
  v12 = v8;
  v13 = self;
  v14 = &v15;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v11);
  if (objc_msgSend((id)v16[5], "count"))
  {
    v9 = objc_alloc(MEMORY[0x24BDBCF20]);
    v10 = (void *)objc_msgSend(v9, "initWithArray:", v16[5]);
    -[ACHAchievementStore _notifyObserversOfUpdatedAchievements:](self, "_notifyObserversOfUpdatedAchievements:", v10);

  }
  _Block_object_dispose(&v15, 8);

}

void __68__ACHAchievementStore_earnedInstanceStore_didAddNewEarnedInstances___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "achievementsByTemplateUniqueName", (_QWORD)v18);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "templateUniqueName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
          objc_msgSend(v2, "addObject:", v11);
        objc_msgSend(*(id *)(a1 + 40), "achievementsByPrerequisiteTemplateName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "templateUniqueName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
          objc_msgSend(v2, "addObject:", v14);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "_lock_populateMostRecentEarnedInstancesAndCountsForAchievements:", v2);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  objc_msgSend(*(id *)(a1 + 40), "_lock_populatePrerequisiteMetForAchievements:", v2);
}

- (void)earnedInstanceStoreDidReceiveSyncNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__26;
  v12 = __Block_byref_object_dispose__26;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__ACHAchievementStore_earnedInstanceStoreDidReceiveSyncNotification___block_invoke;
  v7[3] = &unk_24D13AC40;
  v7[4] = self;
  v7[5] = &v8;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v7);
  if (objc_msgSend((id)v9[5], "count"))
  {
    v5 = objc_alloc(MEMORY[0x24BDBCF20]);
    v6 = (void *)objc_msgSend(v5, "initWithArray:", v9[5]);
    -[ACHAchievementStore _notifyObserversOfUpdatedAchievements:](self, "_notifyObserversOfUpdatedAchievements:", v6);

  }
  _Block_object_dispose(&v8, 8);

}

uint64_t __69__ACHAchievementStore_earnedInstanceStoreDidReceiveSyncNotification___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_lock_populateMostRecentEarnedInstanceAndCountForAllAchievements");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_lock_populatePrerequisiteMetForAllAchievements");
}

- (void)earnedInstanceStore:(id)a3 didRemoveEarnedInstances:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  ACHAchievementStore *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__26;
  v19 = __Block_byref_object_dispose__26;
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__ACHAchievementStore_earnedInstanceStore_didRemoveEarnedInstances___block_invoke;
  v11[3] = &unk_24D13A3C8;
  v8 = v7;
  v12 = v8;
  v13 = self;
  v14 = &v15;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v11);
  if (objc_msgSend((id)v16[5], "count"))
  {
    v9 = objc_alloc(MEMORY[0x24BDBCF20]);
    v10 = (void *)objc_msgSend(v9, "initWithArray:", v16[5]);
    -[ACHAchievementStore _notifyObserversOfUpdatedAchievements:](self, "_notifyObserversOfUpdatedAchievements:", v10);

  }
  _Block_object_dispose(&v15, 8);

}

void __68__ACHAchievementStore_earnedInstanceStore_didRemoveEarnedInstances___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  void *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v20;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v20 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v5);
        objc_msgSend(*(id *)(a1 + 40), "achievementsByTemplateUniqueName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "templateUniqueName");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          v10 = objc_msgSend(v9, "earnedInstanceCount");
          v11 = objc_msgSend(v9, "prerequisiteMet");
          v12 = *(void **)(a1 + 40);
          v23 = v9;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (id)objc_msgSend(v12, "_lock_populateMostRecentEarnedInstancesAndCountsForAchievements:", v13);

          objc_msgSend(*(id *)(a1 + 40), "_lock_populatePrerequisiteMet:", v9);
          if (objc_msgSend(v9, "earnedInstanceCount") != v10
            || v11 != objc_msgSend(v9, "prerequisiteMet"))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v9);
          }
          objc_msgSend(*(id *)(a1 + 40), "achievementsByPrerequisiteTemplateName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "templateUniqueName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(*(id *)(a1 + 40), "_lock_populatePrerequisiteMet:", v17);
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v17);
          }

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v3);
  }

}

- (void)_lock_addTemplatesToLocalStore:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int *v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[24];
  _BYTE v41[128];
  void *v42;
  _BYTE v43[4];
  int v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    v30 = &v44;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x2199C8FE0]();
        ACHLogDefault();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[ACHLegacyAchievementStore _queue_addTemplatesToLocalStore:].cold.2((uint64_t)v43, (uint64_t)v10);

        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithTemplate:relevantEarnedInstance:earnedInstanceCount:", v10, 0, 0);
        v42 = v13;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v42, 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[ACHAchievementStore _lock_populateMostRecentEarnedInstancesAndCountsForAchievements:](self, "_lock_populateMostRecentEarnedInstancesAndCountsForAchievements:", v14);

        -[ACHAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, v17);

        objc_msgSend(v10, "prerequisiteTemplateName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          -[ACHAchievementStore achievementsByPrerequisiteTemplateName](self, "achievementsByPrerequisiteTemplateName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "prerequisiteTemplateName");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setObject:forKeyedSubscript:", v13, v20);

        }
        objc_msgSend(v5, "addObject:", v13, v30);

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v7);
  }

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v21 = v5;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v33;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v33 != v24)
          objc_enumerationMutation(v21);
        v26 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v25);
        ACHLogAssets();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[ACHAchievementStore _lock_addTemplatesToLocalStore:].cold.1((uint64_t)v40, v26);

        -[ACHAchievementStore templateAssetRegistry](self, "templateAssetRegistry");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "populateResourcePropertiesForAchievement:", v26);

        -[ACHAchievementStore _lock_populatePrerequisiteMet:](self, "_lock_populatePrerequisiteMet:", v26);
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v32, v41, 16);
    }
    while (v23);
  }

  -[ACHAchievementStore _lock_addProgressAndGoalToAchievements:](self, "_lock_addProgressAndGoalToAchievements:", v21);
  if (objc_msgSend(v21, "count"))
  {
    v29 = (void *)objc_msgSend(v21, "copy");
    -[ACHAchievementStore _notifyObserversOfNewAchievements:](self, "_notifyObserversOfNewAchievements:", v29);

  }
}

- (id)_lock_populateMostRecentEarnedInstanceAndCountForAllAchievements
{
  void *v3;
  void *v4;
  void *v5;

  -[ACHAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementStore _lock_populateMostRecentEarnedInstancesAndCountsForAchievements:](self, "_lock_populateMostRecentEarnedInstancesAndCountsForAchievements:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_lock_populateMostRecentEarnedInstancesAndCountsForAchievements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  void *v23;
  int v24;
  void *v25;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  id obj;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  id v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  v33 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v4, "hk_map:", &__block_literal_global_24);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementStore earnedInstanceStore](self, "earnedInstanceStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0;
  objc_msgSend(v6, "countOfEarnedInstancesForTemplateUniqueNames:error:", v5, &v42);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v42;

  -[ACHAchievementStore earnedInstanceStore](self, "earnedInstanceStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v8, "mostRecentEarnedInstancesForTemplateUniqueNames:error:", v5, &v41);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v41;

  if ((objc_msgSend(v7, "hk_isDatabaseAccessibilityError") & 1) == 0
    && !objc_msgSend(v9, "hk_isDatabaseAccessibilityError"))
  {
    v27 = v9;
    v28 = v7;
    v29 = v5;
    v30 = v4;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v4;
    v10 = v31;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    if (!v36)
      goto LABEL_29;
    v34 = *(_QWORD *)v38;
    while (1)
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v12, "template", v27, v28, v29, v30);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uniqueName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = objc_msgSend(v15, "unsignedIntegerValue");
          if (objc_msgSend(v12, "earnedInstanceCount") != v17)
            goto LABEL_14;
        }
        else if (objc_msgSend(v12, "earnedInstanceCount"))
        {
          v17 = 0;
LABEL_14:
          objc_msgSend(v12, "setEarnedInstanceCount:", v17);
          v18 = 1;
          goto LABEL_16;
        }
        v18 = 0;
LABEL_16:
        objc_msgSend(v35, "objectForKeyedSubscript:", v14);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "relevantEarnedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v19)
        {
          v22 = v20 == 0;

          objc_msgSend(v12, "relevantEarnedInstance");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v12, "relevantEarnedInstance");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v19, "isEqual:", v23) ^ 1;

            v10 = v31;
          }
          else
          {
            v24 = 0;
          }
        }
        else
        {
          v24 = 0;
          v22 = v20 != 0;
        }

        if (v22 || v24)
        {
          objc_msgSend(v12, "setRelevantEarnedInstance:", v19);
LABEL_26:
          objc_msgSend(v33, "addObject:", v12);
          goto LABEL_27;
        }
        if (v18)
          goto LABEL_26;
LABEL_27:

      }
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
      if (!v36)
      {
LABEL_29:

        v5 = v29;
        v4 = v30;
        v9 = v27;
        v7 = v28;
        goto LABEL_30;
      }
    }
  }
  -[ACHAchievementStore setNeedsUpdateWhenProtectedDataAvailable:](self, "setNeedsUpdateWhenProtectedDataAvailable:", 1);
LABEL_30:
  v25 = (void *)objc_msgSend(v33, "copy", v27, v28, v29, v30);

  return v25;
}

id __87__ACHAchievementStore__lock_populateMostRecentEarnedInstancesAndCountsForAchievements___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "template");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_lock_removeTemplatesFromLocalStore:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  ACHAchievementStore *v21;
  uint64_t v22;
  id v23;
  ACHAchievementStore *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  id obj;
  void *v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _BYTE v42[16];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      v30 = v7;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x2199C8FE0]();
        ACHLogDefault();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          -[ACHLegacyAchievementStore _queue_removeTemplatesFromLocalStore:].cold.1((uint64_t)v42, (uint64_t)v10);

        -[ACHAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "uniqueName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          -[ACHAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uniqueName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", 0, v17);

          objc_msgSend(v5, "addObject:", v15);
          v18 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v15, "earnedInstances");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setWithArray:", v19);
          v20 = objc_claimAutoreleasedReturnValue();

          if (-[NSObject count](v20, "count"))
          {
            v32 = v11;
            v21 = self;
            v22 = v8;
            v23 = v5;
            v24 = v21;
            -[ACHAchievementStore earnedInstanceStore](v21, "earnedInstanceStore");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject allObjects](v20, "allObjects");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = 0;
            objc_msgSend(v25, "removeEarnedInstances:error:", v26, &v33);
            v27 = v33;

            if (v27)
            {
              ACHLogDefault();
              v28 = objc_claimAutoreleasedReturnValue();
              v8 = v22;
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v39 = v10;
                v40 = 2114;
                v41 = v27;
                _os_log_error_impl(&dword_21407B000, v28, OS_LOG_TYPE_ERROR, "Unable to remove the earned instances for template: %{public}@. Reason: %{public}@", buf, 0x16u);
              }

              v5 = v23;
            }
            else
            {
              v5 = v23;
              v8 = v22;
            }
            self = v24;
            v7 = v30;
            v11 = v32;
          }
        }
        else
        {
          ACHLogDefault();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v39 = v10;
            _os_log_impl(&dword_21407B000, v20, OS_LOG_TYPE_DEFAULT, "Achievement store unexpectedly didn't find an achievement instance for template being removed: %{public}@", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v7);
  }

  if (objc_msgSend(v5, "count"))
  {
    v29 = (void *)objc_msgSend(v5, "copy");
    -[ACHAchievementStore _notifyObserversOfRemovedAchievements:](self, "_notifyObserversOfRemovedAchievements:", v29);

  }
}

- (void)_lock_populatePrerequisiteMetForAllAchievements
{
  void *v3;
  id v4;

  -[ACHAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHAchievementStore _lock_populatePrerequisiteMetForAchievements:](self, "_lock_populatePrerequisiteMetForAchievements:", v3);

}

- (void)_lock_populatePrerequisiteMetForAchievements:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[ACHAchievementStore _lock_populatePrerequisiteMet:](self, "_lock_populatePrerequisiteMet:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)_lock_populatePrerequisiteMet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  id v11;

  v11 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  objc_msgSend(v11, "setPrerequisiteMet:", 1);
  objc_msgSend(v11, "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prerequisiteTemplateName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v11, "unearned"))
  {
    -[ACHAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v11, "relevantEarnedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v7, "relevantEarnedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v10 != 0;

      }
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v11, "setPrerequisiteMet:", v9);

  }
}

- (void)templateAssetRegistry:(id)a3 didUpdateResourcesForTemplatesWithSourceName:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  os_unfair_lock_assert_not_owner(&self->_syncLock);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __90__ACHAchievementStore_templateAssetRegistry_didUpdateResourcesForTemplatesWithSourceName___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[ACHAchievementStore _performWithLock:](self, "_performWithLock:", v7);

}

uint64_t __90__ACHAchievementStore_templateAssetRegistry_didUpdateResourcesForTemplatesWithSourceName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lock_populateResourcesForAchievementsWithTemplateSourceName:", *(_QWORD *)(a1 + 40));
}

- (void)_lock_populateResourcesForAchievementsWithTemplateSourceName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  uint64_t v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_syncLock);
  v5 = (void *)MEMORY[0x24BDBCF20];
  -[ACHAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __84__ACHAchievementStore__lock_populateResourcesForAchievementsWithTemplateSourceName___block_invoke;
  v33[3] = &unk_24D13BAB8;
  v9 = v4;
  v34 = v9;
  objc_msgSend(v8, "hk_filter:", v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v28 = v8;
    ACHLogAssets();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(v10, "count");
      *(_DWORD *)buf = 134218242;
      v37 = v12;
      v38 = 2114;
      v39 = v9;
      _os_log_impl(&dword_21407B000, v11, OS_LOG_TYPE_DEFAULT, "Achievement store updating assets for %lu templates for source with identifier %{public}@", buf, 0x16u);
    }
    v27 = v9;

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v10;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          v19 = (void *)MEMORY[0x2199C8FE0]();
          ACHLogAssets();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "template");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "uniqueName");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v37 = (uint64_t)v22;
            _os_log_impl(&dword_21407B000, v20, OS_LOG_TYPE_DEFAULT, "Achievement store updating assets for template %{public}@", buf, 0xCu);

          }
          -[ACHAchievementStore templateAssetRegistry](self, "templateAssetRegistry");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "populateResourcePropertiesForAchievement:", v18);

          objc_autoreleasePoolPop(v19);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      }
      while (v15);
    }

    ACHLogAssets();
    v24 = objc_claimAutoreleasedReturnValue();
    v8 = v28;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v24, OS_LOG_TYPE_DEFAULT, "Done updating assets. Notifying observers.", buf, 2u);
    }

    v25 = (void *)objc_msgSend(v13, "copy");
    -[ACHAchievementStore _notifyObserversOfUpdatedAchievements:](self, "_notifyObserversOfUpdatedAchievements:", v25);

    v10 = v26;
    v9 = v27;
  }

}

uint64_t __84__ACHAchievementStore__lock_populateResourcesForAchievementsWithTemplateSourceName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "template");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (ACHAwardsClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (ACHTemplateStore)templateStore
{
  return self->_templateStore;
}

- (void)setTemplateStore:(id)a3
{
  objc_storeStrong((id *)&self->_templateStore, a3);
}

- (ACHEarnedInstanceStore)earnedInstanceStore
{
  return self->_earnedInstanceStore;
}

- (void)setEarnedInstanceStore:(id)a3
{
  objc_storeStrong((id *)&self->_earnedInstanceStore, a3);
}

- (ACHTemplateAssetRegistry)templateAssetRegistry
{
  return self->_templateAssetRegistry;
}

- (void)setTemplateAssetRegistry:(id)a3
{
  objc_storeStrong((id *)&self->_templateAssetRegistry, a3);
}

- (void)setProgressEngine:(id)a3
{
  objc_storeStrong((id *)&self->_progressEngine, a3);
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (OS_dispatch_queue)internalQueue
{
  return self->_internalQueue;
}

- (void)setInternalQueue:(id)a3
{
  objc_storeStrong((id *)&self->_internalQueue, a3);
}

- (int)protectedDataToken
{
  return self->_protectedDataToken;
}

- (void)setProtectedDataToken:(int)a3
{
  self->_protectedDataToken = a3;
}

- (BOOL)templateStoreFinishedInitialFetch
{
  return self->_templateStoreFinishedInitialFetch;
}

- (void)setTemplateStoreFinishedInitialFetch:(BOOL)a3
{
  self->_templateStoreFinishedInitialFetch = a3;
}

- (BOOL)earnedInstancsStoreFinishedInitialFetch
{
  return self->_earnedInstancsStoreFinishedInitialFetch;
}

- (void)setEarnedInstancsStoreFinishedInitialFetch:(BOOL)a3
{
  self->_earnedInstancsStoreFinishedInitialFetch = a3;
}

- (BOOL)needsUpdateWhenProtectedDataAvailable
{
  return self->_needsUpdateWhenProtectedDataAvailable;
}

- (void)setNeedsUpdateWhenProtectedDataAvailable:(BOOL)a3
{
  self->_needsUpdateWhenProtectedDataAvailable = a3;
}

- (void)setAchievementsByTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsByTemplateUniqueName, a3);
}

- (NSMutableDictionary)achievementsByPrerequisiteTemplateName
{
  return self->_achievementsByPrerequisiteTemplateName;
}

- (void)setAchievementsByPrerequisiteTemplateName:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsByPrerequisiteTemplateName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_achievementsByPrerequisiteTemplateName, 0);
  objc_storeStrong((id *)&self->_achievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_progressEngine, 0);
  objc_storeStrong((id *)&self->_templateAssetRegistry, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_initialFetchObserversToCall, 0);
}

- (void)_lock_addTemplatesToLocalStore:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "template");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v5;
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v6, v7, "Populating assets for template %{public}@ because it was newly added to achievement store");

}

@end
