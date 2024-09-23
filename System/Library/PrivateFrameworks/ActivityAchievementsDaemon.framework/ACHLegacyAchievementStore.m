@implementation ACHLegacyAchievementStore

- (ACHLegacyAchievementStore)initWithTemplateStore:(id)a3 earnedInstanceStore:(id)a4 templateAssetRegistry:(id)a5 progressProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ACHLegacyAchievementStore *v15;
  ACHLegacyAchievementStore *v16;
  NSMutableDictionary *v17;
  NSMutableDictionary *achievementsByTemplateUniqueName;
  uint64_t v19;
  NSHashTable *observers;
  uint64_t v21;
  OS_dispatch_queue *notificationQueue;
  uint64_t v23;
  OS_dispatch_queue *synchronizationQueue;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)ACHLegacyAchievementStore;
  v15 = -[ACHLegacyAchievementStore init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_templateStore, a3);
    objc_storeStrong((id *)&v16->_earnedInstanceStore, a4);
    objc_storeStrong((id *)&v16->_templateAssetRegistry, a5);
    objc_storeStrong((id *)&v16->_progressProvider, a6);
    -[ACHTemplateAssetRegistry setDelegate:](v16->_templateAssetRegistry, "setDelegate:", v16);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    achievementsByTemplateUniqueName = v16->_achievementsByTemplateUniqueName;
    v16->_achievementsByTemplateUniqueName = v17;

    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v19 = objc_claimAutoreleasedReturnValue();
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v19;

    HKCreateSerialDispatchQueue();
    v21 = objc_claimAutoreleasedReturnValue();
    notificationQueue = v16->_notificationQueue;
    v16->_notificationQueue = (OS_dispatch_queue *)v21;

    HKCreateSerialDispatchQueue();
    v23 = objc_claimAutoreleasedReturnValue();
    synchronizationQueue = v16->_synchronizationQueue;
    v16->_synchronizationQueue = (OS_dispatch_queue *)v23;

    objc_msgSend(v11, "addObserver:", v16);
    objc_msgSend(v12, "addObserver:", v16);
  }

  return v16;
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
  -[ACHLegacyAchievementStore templateStore](self, "templateStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "loadAllTemplatesFromDatabaseIfNecessary");

  -[ACHLegacyAchievementStore earnedInstanceStore](self, "earnedInstanceStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "loadAllEarnedInstancesFromDatabaseIfNecessary");

  v8 = v9;
  if (v9)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, v5 & v7);
    v8 = v9;
  }

}

- (id)achievementsForEarnedDateComponents:(id)a3
{
  return objc_alloc_init(MEMORY[0x24BDBCF20]);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "conformsToProtocol:", &unk_254D78500))
  {
    -[ACHLegacyAchievementStore notificationQueue](self, "notificationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __41__ACHLegacyAchievementStore_addObserver___block_invoke;
    v7[3] = &unk_24D13A360;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    ACHLogDefault();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ACHLegacyAchievementStore addObserver:].cold.1((uint64_t)v4, v6);

  }
}

uint64_t __41__ACHLegacyAchievementStore_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  result = objc_msgSend(*(id *)(a1 + 32), "templateStoreDidFinishInitialFetch");
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(a1 + 32), "earnedInstanceStoreDidFinishInitialFetch");
    if ((_DWORD)result)
    {
      result = objc_opt_respondsToSelector();
      if ((result & 1) != 0)
        return objc_msgSend(*(id *)(a1 + 40), "achievementStoreDidFinishInitialFetch:", *(_QWORD *)(a1 + 32));
    }
  }
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
  -[ACHLegacyAchievementStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__ACHLegacyAchievementStore_removeObserver___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __44__ACHLegacyAchievementStore_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "observers");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", *(_QWORD *)(a1 + 40));

  }
}

- (void)_notifyObserversOfInitialFetchCompletion
{
  NSObject *v3;
  _QWORD block[5];

  if (-[ACHLegacyAchievementStore templateStoreDidFinishInitialFetch](self, "templateStoreDidFinishInitialFetch"))
  {
    if (-[ACHLegacyAchievementStore earnedInstanceStoreDidFinishInitialFetch](self, "earnedInstanceStoreDidFinishInitialFetch"))
    {
      -[ACHLegacyAchievementStore notificationQueue](self, "notificationQueue");
      v3 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __69__ACHLegacyAchievementStore__notifyObserversOfInitialFetchCompletion__block_invoke;
      block[3] = &unk_24D13A338;
      block[4] = self;
      dispatch_async(v3, block);

    }
  }
}

void __69__ACHLegacyAchievementStore__notifyObserversOfInitialFetchCompletion__block_invoke(uint64_t a1)
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
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "observers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
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
          objc_msgSend(v7, "achievementStoreDidFinishInitialFetch:", *(_QWORD *)(a1 + 32));
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_notifyObserversOfNewAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHLegacyAchievementStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__ACHLegacyAchievementStore__notifyObserversOfNewAchievements___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __63__ACHLegacyAchievementStore__notifyObserversOfNewAchievements___block_invoke(uint64_t a1)
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

- (void)_notifyObserversOfUpdatedAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHLegacyAchievementStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__ACHLegacyAchievementStore__notifyObserversOfUpdatedAchievements___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__ACHLegacyAchievementStore__notifyObserversOfUpdatedAchievements___block_invoke(uint64_t a1)
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

- (void)_notifyObserversOfRemovedAchievements:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHLegacyAchievementStore notificationQueue](self, "notificationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__ACHLegacyAchievementStore__notifyObserversOfRemovedAchievements___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __67__ACHLegacyAchievementStore__notifyObserversOfRemovedAchievements___block_invoke(uint64_t a1)
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

- (id)allAchievements
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__11;
  v11 = __Block_byref_object_dispose__11;
  v12 = 0;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__ACHLegacyAchievementStore_allAchievements__block_invoke;
  v6[3] = &unk_24D13AC40;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __44__ACHLegacyAchievementStore_allAchievements__block_invoke(uint64_t a1)
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

- (id)achievementWithTemplateUniqueName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__11;
    v15 = __Block_byref_object_dispose__11;
    v16 = 0;
    -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __63__ACHLegacyAchievementStore_achievementWithTemplateUniqueName___block_invoke;
    block[3] = &unk_24D13AC68;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v12[5];
    _Block_object_dispose(&v11, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __63__ACHLegacyAchievementStore_achievementWithTemplateUniqueName___block_invoke(uint64_t a1)
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

- (id)ephemeralAchievementWithTemplateUniqueName:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v9;
  ACHLegacyAchievementStore *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__11;
    v16 = __Block_byref_object_dispose__11;
    v17 = 0;
    -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __72__ACHLegacyAchievementStore_ephemeralAchievementWithTemplateUniqueName___block_invoke;
    block[3] = &unk_24D13BA90;
    v10 = self;
    v11 = &v12;
    v9 = v4;
    dispatch_sync(v5, block);

    v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __72__ACHLegacyAchievementStore_ephemeralAchievementWithTemplateUniqueName___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int IsMonthlyChallenge;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BE01830]);
  objc_msgSend(v2, "setTemplateUniqueName:", a1[4]);
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE012A8];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEarnedDateComponents:", v6);

  IsMonthlyChallenge = ACHTemplateUniqueNameIsMonthlyChallenge();
  v8 = (void *)a1[5];
  if (IsMonthlyChallenge)
  {
    objc_msgSend(v8, "_queue_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:earnedInstance:", a1[4], v2);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1[6] + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

  }
  else
  {
    objc_msgSend(v8, "achievementsByTemplateUniqueName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", a1[4]);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    v16 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    v21[0] = v2;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "shallowCopyReplacingEarnedInstances:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1[6] + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v18;

  }
}

- (id)_queue_ephemeralMonthlyChallengeAchievementForTemplateUniqueName:(id)a3 earnedInstance:(id)a4
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
  id v15;
  void *v16;
  void *v17;
  void *v18;
  ACHLegacyAchievementStore *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = a3;
  ACHMonthlyChallengeTypeFromTemplateUniqueName();
  objc_msgSend(v7, "componentsSeparatedByString:", CFSTR("_"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count") == 3)
  {
    objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "integerValue");
    objc_msgSend(v23, "integerValue");
    ACHDateComponentsForYearMonthDay();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateFromComponents:", v9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_startOfMonthForDate:addingMonths:", v22, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hk_startOfDateBySubtractingDays:fromDate:", 1, v21);
    v20 = self;
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "components:fromDate:", 28, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE01828]), "initWithStartDateComponents:endDateComponents:", v9, v12);
    ACHMonthlyChallengeTemplate();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSourceName:", *MEMORY[0x24BE01638]);
    v15 = objc_alloc(MEMORY[0x24BE017A8]);
    v25[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v15, "initWithTemplate:earnedInstances:", v14, v16);

    -[ACHLegacyAchievementStore templateAssetRegistry](v20, "templateAssetRegistry");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "populateResourcePropertiesForAchievement:", v17);

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)recalculateProgressForAllAchievements
{
  -[ACHLegacyAchievementStore progressProviderDidUpdateProgressValues:](self, "progressProviderDidUpdateProgressValues:", self->_progressProvider);
}

- (void)processAchievementProgressUpdates:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ACHLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v24 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "processAchievementProgressUpdates for %lu achievements", buf, 0xCu);
  }

  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v12, "templateUniqueName", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACHLegacyAchievementStore achievementWithTemplateUniqueName:](self, "achievementWithTemplateUniqueName:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "progressQuantity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setProgress:", v15);

          objc_msgSend(v12, "goalQuantity");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setGoal:", v16);

          objc_msgSend(v6, "addObject:", v14);
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHLegacyAchievementStore _notifyObserversOfUpdatedAchievements:](self, "_notifyObserversOfUpdatedAchievements:", v17);

}

- (void)requestUpdateProgressValuesForProgressProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ACHLogDefault();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "requestUpdateProgressValuesForProgressProvider: %@.", (uint8_t *)&v7, 0xCu);
  }

  -[ACHLegacyAchievementStore progressProvider](self, "progressProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACHLegacyAchievementStore progressProviderDidUpdateProgressValues:](self, "progressProviderDidUpdateProgressValues:", v6);

}

- (void)templateStoreDidFinishInitialFetch:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __64__ACHLegacyAchievementStore_templateStoreDidFinishInitialFetch___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __64__ACHLegacyAchievementStore_templateStoreDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "allTemplates");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_addTemplatesToLocalStore:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setTemplateStoreDidFinishInitialFetch:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfInitialFetchCompletion");
}

- (void)templateStore:(id)a3 didAddNewTemplates:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__ACHLegacyAchievementStore_templateStore_didAddNewTemplates___block_invoke;
  v8[3] = &unk_24D13A360;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __62__ACHLegacyAchievementStore_templateStore_didAddNewTemplates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addTemplatesToLocalStore:", *(_QWORD *)(a1 + 40));
}

- (void)templateStore:(id)a3 didRemoveTemplates:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __62__ACHLegacyAchievementStore_templateStore_didRemoveTemplates___block_invoke;
  v8[3] = &unk_24D13A360;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __62__ACHLegacyAchievementStore_templateStore_didRemoveTemplates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeTemplatesFromLocalStore:", *(_QWORD *)(a1 + 40));
}

- (void)earnedInstanceStoreDidFinishInitialFetch:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __70__ACHLegacyAchievementStore_earnedInstanceStoreDidFinishInitialFetch___block_invoke;
  v7[3] = &unk_24D13A360;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __70__ACHLegacyAchievementStore_earnedInstanceStoreDidFinishInitialFetch___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "earnedInstances");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_addEarnedInstancesToLocalStore:", v3);

  objc_msgSend(*(id *)(a1 + 32), "setEarnedInstanceStoreDidFinishInitialFetch:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserversOfInitialFetchCompletion");
}

- (void)earnedInstanceStore:(id)a3 didAddNewEarnedInstances:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__ACHLegacyAchievementStore_earnedInstanceStore_didAddNewEarnedInstances___block_invoke;
  v8[3] = &unk_24D13A360;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __74__ACHLegacyAchievementStore_earnedInstanceStore_didAddNewEarnedInstances___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addEarnedInstancesToLocalStore:", *(_QWORD *)(a1 + 40));
}

- (void)earnedInstanceStore:(id)a3 didRemoveEarnedInstances:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__ACHLegacyAchievementStore_earnedInstanceStore_didRemoveEarnedInstances___block_invoke;
  v8[3] = &unk_24D13A360;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __74__ACHLegacyAchievementStore_earnedInstanceStore_didRemoveEarnedInstances___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeEarnedInstancesFromLocalStore:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_addTemplatesToLocalStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  ACHEarnedInstanceStore *earnedInstanceStore;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[16];
  _BYTE v29[16];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x2199C8FE0]();
        ACHLogDefault();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[ACHLegacyAchievementStore _queue_addTemplatesToLocalStore:].cold.2((uint64_t)v29, (uint64_t)v11);

        earnedInstanceStore = self->_earnedInstanceStore;
        objc_msgSend(v11, "uniqueName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ACHEarnedInstanceStore earnedInstancesForTemplateUniqueName:error:](earnedInstanceStore, "earnedInstancesForTemplateUniqueName:error:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE017A8]), "initWithTemplate:earnedInstances:", v11, v16);
        objc_msgSend(v17, "setPrerequisiteMet:", 1);
        ACHLogAssets();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          -[ACHLegacyAchievementStore _queue_addTemplatesToLocalStore:].cold.1((uint64_t)v28, (uint64_t)v11);

        -[ACHLegacyAchievementStore templateAssetRegistry](self, "templateAssetRegistry");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "populateResourcePropertiesForAchievement:", v17);

        -[ACHLegacyAchievementStore _queue_addProgressAndGoalToAchievement:](self, "_queue_addProgressAndGoalToAchievement:", v17);
        -[ACHLegacyAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v17, v21);

        objc_msgSend(v6, "addObject:", v17);
        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
  {
    v22 = (void *)objc_msgSend(v6, "copy");
    -[ACHLegacyAchievementStore _notifyObserversOfNewAchievements:](self, "_notifyObserversOfNewAchievements:", v22);

  }
}

- (void)_queue_removeTemplatesFromLocalStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  ACHLegacyAchievementStore *v22;
  uint64_t v23;
  id v24;
  ACHLegacyAchievementStore *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  id obj;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  _BYTE v43[16];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v36;
    do
    {
      v10 = 0;
      v31 = v8;
      do
      {
        if (*(_QWORD *)v36 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v10);
        v12 = (void *)MEMORY[0x2199C8FE0]();
        ACHLogDefault();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[ACHLegacyAchievementStore _queue_removeTemplatesFromLocalStore:].cold.1((uint64_t)v43, (uint64_t)v11);

        -[ACHLegacyAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uniqueName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          -[ACHLegacyAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "uniqueName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setObject:forKeyedSubscript:", 0, v18);

          objc_msgSend(v6, "addObject:", v16);
          v19 = (void *)MEMORY[0x24BDBCF20];
          objc_msgSend(v16, "earnedInstances");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setWithArray:", v20);
          v21 = objc_claimAutoreleasedReturnValue();

          if (-[NSObject count](v21, "count"))
          {
            v33 = v12;
            v22 = self;
            v23 = v9;
            v24 = v6;
            v25 = v22;
            -[ACHLegacyAchievementStore earnedInstanceStore](v22, "earnedInstanceStore");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject allObjects](v21, "allObjects");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0;
            objc_msgSend(v26, "removeEarnedInstances:error:", v27, &v34);
            v28 = v34;

            if (v28)
            {
              ACHLogDefault();
              v29 = objc_claimAutoreleasedReturnValue();
              v9 = v23;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v40 = v11;
                v41 = 2114;
                v42 = v28;
                _os_log_error_impl(&dword_21407B000, v29, OS_LOG_TYPE_ERROR, "Unable to remove the earned instances for template: %{public}@. Reason: %{public}@", buf, 0x16u);
              }

              v6 = v24;
            }
            else
            {
              v6 = v24;
              v9 = v23;
            }
            self = v25;
            v8 = v31;
            v12 = v33;
          }
        }
        else
        {
          ACHLogDefault();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v40 = v11;
            _os_log_impl(&dword_21407B000, v21, OS_LOG_TYPE_DEFAULT, "Achievement store unexpectedly didn't find an achievement instance for template being removed: %{public}@", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v12);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v6, "count"))
  {
    v30 = (void *)objc_msgSend(v6, "copy");
    -[ACHLegacyAchievementStore _notifyObserversOfRemovedAchievements:](self, "_notifyObserversOfRemovedAchievements:", v30);

  }
}

- (void)templateAssetRegistry:(id)a3 didUpdateResourcesForTemplatesWithSourceName:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __96__ACHLegacyAchievementStore_templateAssetRegistry_didUpdateResourcesForTemplatesWithSourceName___block_invoke;
  v8[3] = &unk_24D13A360;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __96__ACHLegacyAchievementStore_templateAssetRegistry_didUpdateResourcesForTemplatesWithSourceName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_populateResourcesForAchievementsWithTemplateSourceName:", *(_QWORD *)(a1 + 40));
}

- (void)_queue_populateResourcesForAchievementsWithTemplateSourceName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _QWORD v34[4];
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x24BDBCF20];
  -[ACHLegacyAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __91__ACHLegacyAchievementStore__queue_populateResourcesForAchievementsWithTemplateSourceName___block_invoke;
  v34[3] = &unk_24D13BAB8;
  v10 = v4;
  v35 = v10;
  objc_msgSend(v9, "hk_filter:", v34);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
  {
    v29 = v9;
    ACHLogAssets();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 134218242;
      v38 = v13;
      v39 = 2114;
      v40 = v10;
      _os_log_impl(&dword_21407B000, v12, OS_LOG_TYPE_DEFAULT, "Achievement store updating assets for %lu templates for source with identifier %{public}@", buf, 0x16u);
    }
    v28 = v10;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v27 = v11;
    v14 = v11;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v31 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x2199C8FE0]();
          ACHLogAssets();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v19, "template");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "uniqueName");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v38 = (uint64_t)v23;
            _os_log_impl(&dword_21407B000, v21, OS_LOG_TYPE_DEFAULT, "Achievement store updating assets for template %{public}@", buf, 0xCu);

          }
          -[ACHLegacyAchievementStore templateAssetRegistry](self, "templateAssetRegistry");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "populateResourcePropertiesForAchievement:", v19);

          objc_autoreleasePoolPop(v20);
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v16);
    }

    ACHLogAssets();
    v25 = objc_claimAutoreleasedReturnValue();
    v9 = v29;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21407B000, v25, OS_LOG_TYPE_DEFAULT, "Done updating assets. Notifying observers.", buf, 2u);
    }

    v26 = (void *)objc_msgSend(v14, "copy");
    -[ACHLegacyAchievementStore _notifyObserversOfUpdatedAchievements:](self, "_notifyObserversOfUpdatedAchievements:", v26);

    v11 = v27;
    v10 = v28;
  }

}

uint64_t __91__ACHLegacyAchievementStore__queue_populateResourcesForAchievementsWithTemplateSourceName___block_invoke(uint64_t a1, void *a2)
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

- (void)_queue_addEarnedInstancesToLocalStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id obj;
  void *v38;
  ACHLegacyAchievementStore *v39;
  _QWORD v40[4];
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint8_t buf[4];
  uint64_t v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v39 = self;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v35 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v47 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(v12, "templateUniqueName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v12, "templateUniqueName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

        }
        objc_msgSend(v14, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v9);
  }
  v34 = v7;

  objc_msgSend(v6, "allKeys");
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v43;
    do
    {
      v19 = 0;
      v36 = v17;
      do
      {
        if (*(_QWORD *)v43 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * v19);
        v21 = (void *)MEMORY[0x2199C8FE0]();
        -[ACHLegacyAchievementStore achievementsByTemplateUniqueName](v39, "achievementsByTemplateUniqueName");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v20);
        v23 = objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject earnedInstances](v23, "earnedInstances");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = MEMORY[0x24BDAC760];
          v40[1] = 3221225472;
          v40[2] = __67__ACHLegacyAchievementStore__queue_addEarnedInstancesToLocalStore___block_invoke;
          v40[3] = &unk_24D13BAE0;
          v26 = v25;
          v41 = v26;
          objc_msgSend(v24, "hk_filter:", v40);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v27, "count"))
          {
            -[NSObject earnedInstances](v23, "earnedInstances");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "arrayByAddingObjectsFromArray:", v27);
            v38 = v21;
            v29 = v6;
            v30 = v18;
            v31 = (void *)objc_claimAutoreleasedReturnValue();

            -[NSObject shallowCopyReplacingEarnedInstances:](v23, "shallowCopyReplacingEarnedInstances:", v31);
            v32 = objc_claimAutoreleasedReturnValue();

            -[ACHLegacyAchievementStore achievementsByTemplateUniqueName](v39, "achievementsByTemplateUniqueName");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v32, v20);

            objc_msgSend(v35, "addObject:", v32);
            v18 = v30;
            v6 = v29;
            v21 = v38;
            v23 = v32;
            v17 = v36;
          }

        }
        else
        {
          ACHLogDefault();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138543362;
            v51 = v20;
            _os_log_debug_impl(&dword_21407B000, v23, OS_LOG_TYPE_DEBUG, "Achievement store didn't find achievement instance for template unique name (%{public}@)", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v21);
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v35, "count"))
    -[ACHLegacyAchievementStore _notifyObserversOfUpdatedAchievements:](v39, "_notifyObserversOfUpdatedAchievements:", v35);

}

uint64_t __67__ACHLegacyAchievementStore__queue_addEarnedInstancesToLocalStore___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "isEqual:", v3, (_QWORD)v11) & 1) != 0)
        {
          v9 = 0;
          goto LABEL_11;
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)_queue_removeEarnedInstancesFromLocalStore:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  NSObject *v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  ACHLegacyAchievementStore *v41;
  id obj;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t v59[128];
  uint8_t buf[4];
  uint64_t v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v38 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        objc_msgSend(v12, "templateUniqueName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "objectForKeyedSubscript:", v13);
        v14 = (id)objc_claimAutoreleasedReturnValue();

        if (!v14)
        {
          v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
          objc_msgSend(v12, "templateUniqueName");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v15);

        }
        objc_msgSend(v14, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
    }
    while (v9);
  }
  v37 = v7;

  objc_msgSend(v6, "allKeys");
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  v43 = v16;
  if (v16)
  {
    v17 = *(_QWORD *)v52;
    v40 = v6;
    v41 = self;
    v39 = *(_QWORD *)v52;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(obj);
        v19 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x2199C8FE0](v16);
        -[ACHLegacyAchievementStore achievementsByTemplateUniqueName](self, "achievementsByTemplateUniqueName", v37);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v19);
        v22 = objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          v44 = v20;
          v45 = v18;
          v46 = v22;
          -[NSObject earnedInstances](v22, "earnedInstances");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v23, "mutableCopy");

          objc_msgSend(v6, "objectForKeyedSubscript:", v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = 0u;
          v48 = 0u;
          v49 = 0u;
          v50 = 0u;
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
          if (v26)
          {
            v27 = v26;
            v28 = 0;
            v29 = *(_QWORD *)v48;
            do
            {
              for (j = 0; j != v27; ++j)
              {
                if (*(_QWORD *)v48 != v29)
                  objc_enumerationMutation(v25);
                v31 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j);
                if (objc_msgSend(v24, "containsObject:", v31))
                {
                  objc_msgSend(v24, "removeObject:", v31);
                  v28 = 1;
                }
                else
                {
                  ACHLogDefault();
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v61 = v31;
                    _os_log_impl(&dword_21407B000, v32, OS_LOG_TYPE_DEFAULT, "Achievement store unexpectedly didn't find an achievement earned instance to remove for removed earned instance: %@", buf, 0xCu);
                  }

                }
              }
              v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v47, v59, 16);
            }
            while (v27);
            if ((v28 & 1) != 0)
            {
              v33 = (void *)objc_msgSend(v24, "copy");
              -[NSObject shallowCopyReplacingEarnedInstances:](v46, "shallowCopyReplacingEarnedInstances:", v33);
              v34 = objc_claimAutoreleasedReturnValue();

              self = v41;
              -[ACHLegacyAchievementStore achievementsByTemplateUniqueName](v41, "achievementsByTemplateUniqueName");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v35, "setObject:forKeyedSubscript:", v34, v19);

              objc_msgSend(v38, "addObject:", v34);
              v46 = v34;
            }
            else
            {
              self = v41;
            }
            v17 = v39;
            v6 = v40;
          }

          v20 = v44;
          v18 = v45;
          v36 = v46;
        }
        else
        {
          ACHLogDefault();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v61 = v19;
            _os_log_impl(&dword_21407B000, v36, OS_LOG_TYPE_DEFAULT, "Achievement store unexpectedly didn't find an achievement instance for removed earned instance with template unique name (%@)", buf, 0xCu);
          }
        }

        objc_autoreleasePoolPop(v20);
        ++v18;
      }
      while (v18 != v43);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
      v43 = v16;
    }
    while (v16);
  }

  if (objc_msgSend(v38, "count"))
    -[ACHLegacyAchievementStore _notifyObserversOfUpdatedAchievements:](self, "_notifyObserversOfUpdatedAchievements:", v38);

}

- (void)progressProviderDidUpdateProgressValues:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  _QWORD block[5];

  v4 = a3;
  -[ACHLegacyAchievementStore progressProvider](self, "progressProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__ACHLegacyAchievementStore_progressProviderDidUpdateProgressValues___block_invoke;
    block[3] = &unk_24D13A338;
    block[4] = self;
    dispatch_async(v6, block);

  }
}

void __69__ACHLegacyAchievementStore_progressProviderDidUpdateProgressValues___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "achievementsByTemplateUniqueName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __69__ACHLegacyAchievementStore_progressProviderDidUpdateProgressValues___block_invoke_2;
  v9[3] = &unk_24D13BAB8;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "hk_filter:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    ACHLogXPC();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v6;
      _os_log_impl(&dword_21407B000, v5, OS_LOG_TYPE_DEFAULT, "Notifying observers of %{public}@ progress updates.", buf, 0xCu);

    }
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_notifyObserversOfUpdatedAchievements:", v8);

  }
}

uint64_t __69__ACHLegacyAchievementStore_progressProviderDidUpdateProgressValues___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addProgressAndGoalToAchievement:", a2);
}

- (BOOL)_queue_addProgressAndGoalToAchievement:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ACHLegacyAchievementStore synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ACHLegacyAchievementStore progressProvider](self, "progressProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shouldPopulateProgressForAchievement:", v4);

  if (v7)
  {
    -[ACHLegacyAchievementStore progressProvider](self, "progressProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "populateProgressAndGoalForAchievements:", v9);

  }
  return v7;
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

- (ACHAchievementProgressEngine)progressProvider
{
  return self->_progressProvider;
}

- (void)setProgressProvider:(id)a3
{
  objc_storeStrong((id *)&self->_progressProvider, a3);
}

- (NSMutableDictionary)achievementsByTemplateUniqueName
{
  return self->_achievementsByTemplateUniqueName;
}

- (void)setAchievementsByTemplateUniqueName:(id)a3
{
  objc_storeStrong((id *)&self->_achievementsByTemplateUniqueName, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (OS_dispatch_queue)notificationQueue
{
  return self->_notificationQueue;
}

- (void)setNotificationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_notificationQueue, a3);
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (void)setSynchronizationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizationQueue, a3);
}

- (BOOL)templateStoreDidFinishInitialFetch
{
  return self->_templateStoreDidFinishInitialFetch;
}

- (void)setTemplateStoreDidFinishInitialFetch:(BOOL)a3
{
  self->_templateStoreDidFinishInitialFetch = a3;
}

- (BOOL)earnedInstanceStoreDidFinishInitialFetch
{
  return self->_earnedInstanceStoreDidFinishInitialFetch;
}

- (void)setEarnedInstanceStoreDidFinishInitialFetch:(BOOL)a3
{
  self->_earnedInstanceStoreDidFinishInitialFetch = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_notificationQueue, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_achievementsByTemplateUniqueName, 0);
  objc_storeStrong((id *)&self->_progressProvider, 0);
  objc_storeStrong((id *)&self->_templateAssetRegistry, 0);
  objc_storeStrong((id *)&self->_earnedInstanceStore, 0);
  objc_storeStrong((id *)&self->_templateStore, 0);
}

- (void)addObserver:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21407B000, a2, OS_LOG_TYPE_ERROR, "Achievement store did not add observer %@ since it doesn't conform to the observer protocol.", (uint8_t *)&v2, 0xCu);
}

- (void)_queue_addTemplatesToLocalStore:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v5, v6, "Populating assets for template %{public}@ because it was newly added to achievement store");

  OUTLINED_FUNCTION_2_3();
}

- (void)_queue_addTemplatesToLocalStore:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v5, v6, "Adding new template %{public}@ to achievement store");

  OUTLINED_FUNCTION_2_3();
}

- (void)_queue_removeTemplatesFromLocalStore:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_1_2(a1, a2), "uniqueName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138543362;
  *v2 = v4;
  OUTLINED_FUNCTION_0_2(&dword_21407B000, v5, v6, "Removing template %{public}@ from achievement store");

  OUTLINED_FUNCTION_2_3();
}

@end
