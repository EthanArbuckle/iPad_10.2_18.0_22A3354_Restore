@implementation HMMediaSystemStageManager

- (void)configureWithHome:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMMediaSystemStageManager mediaSystems](self, "mediaSystems", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12++), "__configureWithContext:home:", v7, v6);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  -[HMFTimerManager setDelegate:](self->_addedMediaSystemTimerManager, "setDelegate:", self);
  -[HMFTimerManager setDelegate:](self->_removedMediaSystemTimerManager, "setDelegate:", self);
  objc_msgSend(v7, "queue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFTimerManager setDelegateQueue:](self->_addedMediaSystemTimerManager, "setDelegateQueue:", v13);

  objc_msgSend(v7, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFTimerManager setDelegateQueue:](self->_removedMediaSystemTimerManager, "setDelegateQueue:", v14);

}

- (void)postConfigure
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

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[HMMediaSystemStageManager mediaSystems](self, "mediaSystems", 0);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "postConfigure");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (NSArray)mediaSystems
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSMutableSet *stagedRemovedMediaSystemUUIDs;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary mutableCopy](self->_committedMediaSystemsMap, "mutableCopy");
  -[NSMutableDictionary allValues](self->_stagedAddedMediaSystemsMap, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __41__HMMediaSystemStageManager_mediaSystems__block_invoke;
  v17[3] = &unk_1E3AAF510;
  v7 = v4;
  v18 = v7;
  objc_msgSend(v5, "na_each:", v17);

  stagedRemovedMediaSystemUUIDs = self->_stagedRemovedMediaSystemUUIDs;
  v12 = v6;
  v13 = 3221225472;
  v14 = __41__HMMediaSystemStageManager_mediaSystems__block_invoke_2;
  v15 = &unk_1E3AAF538;
  v9 = v7;
  v16 = v9;
  -[NSMutableSet na_each:](stagedRemovedMediaSystemUUIDs, "na_each:", &v12);
  objc_msgSend(v9, "allValues", v12, v13, v14, v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v10;
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMMediaSystemStageManager)initWithIdentifier:(id)a3 mediaSystems:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  HMMediaSystemStageManager *v11;

  v6 = (objc_class *)MEMORY[0x1E0D286D0];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithOptions:", 2);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D286D0]), "initWithOptions:", 2);
  v11 = -[HMMediaSystemStageManager initWithIdentifier:mediaSystems:addedMediaSystemTimerManager:removedMediaSystemTimerManager:](self, "initWithIdentifier:mediaSystems:addedMediaSystemTimerManager:removedMediaSystemTimerManager:", v8, v7, v9, v10);

  return v11;
}

- (HMMediaSystemStageManager)initWithIdentifier:(id)a3 mediaSystems:(id)a4 addedMediaSystemTimerManager:(id)a5 removedMediaSystemTimerManager:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  HMMediaSystemStageManager *v16;
  HMMediaSystemStageManager *v17;
  void *v18;
  uint64_t v19;
  NSMutableDictionary *committedMediaSystemsMap;
  uint64_t v21;
  NSMutableDictionary *stagedAddedMediaSystemsMap;
  uint64_t v23;
  NSMutableSet *stagedRemovedMediaSystemUUIDs;
  HMHomeManager *v26;
  SEL v27;
  objc_super v28;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!v11)
  {
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  if (!v12)
  {
LABEL_9:
    _HMFPreconditionFailure();
    goto LABEL_10;
  }
  if (!v13)
  {
LABEL_10:
    _HMFPreconditionFailure();
    goto LABEL_11;
  }
  v15 = v14;
  if (!v14)
  {
LABEL_11:
    v26 = (HMHomeManager *)_HMFPreconditionFailure();
    return (HMMediaSystemStageManager *)-[HMHomeManager createAccessorySettingsDataSource](v26, v27);
  }
  v28.receiver = self;
  v28.super_class = (Class)HMMediaSystemStageManager;
  v16 = -[HMMediaSystemStageManager init](&v28, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_identifier, a3);
    objc_msgSend(v12, "na_dictionaryWithKeyGenerator:", &__block_literal_global_14064);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "mutableCopy");
    committedMediaSystemsMap = v17->_committedMediaSystemsMap;
    v17->_committedMediaSystemsMap = (NSMutableDictionary *)v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
    stagedAddedMediaSystemsMap = v17->_stagedAddedMediaSystemsMap;
    v17->_stagedAddedMediaSystemsMap = (NSMutableDictionary *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
    stagedRemovedMediaSystemUUIDs = v17->_stagedRemovedMediaSystemUUIDs;
    v17->_stagedRemovedMediaSystemUUIDs = (NSMutableSet *)v23;

    objc_storeStrong((id *)&v17->_addedMediaSystemTimerManager, a5);
    objc_storeStrong((id *)&v17->_removedMediaSystemTimerManager, a6);
  }

  return v17;
}

- (void)unconfigure
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *committedMediaSystemsMap;
  NSMutableDictionary *v9;
  NSMutableDictionary *stagedAddedMediaSystemsMap;
  NSMutableSet *v11;
  NSMutableSet *stagedRemovedMediaSystemUUIDs;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMMediaSystemStageManager mediaSystems](self, "mediaSystems", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v6++), "_unconfigure");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

  os_unfair_lock_lock_with_options();
  v7 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  committedMediaSystemsMap = self->_committedMediaSystemsMap;
  self->_committedMediaSystemsMap = v7;

  v9 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 0);
  stagedAddedMediaSystemsMap = self->_stagedAddedMediaSystemsMap;
  self->_stagedAddedMediaSystemsMap = v9;

  v11 = (NSMutableSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 0);
  stagedRemovedMediaSystemUUIDs = self->_stagedRemovedMediaSystemUUIDs;
  self->_stagedRemovedMediaSystemUUIDs = v11;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)mergeMediaSystems:(id)a3 withHome:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMObjectMergeCollection *v11;
  void *v12;
  HMObjectMergeCollection *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, void *);
  void *v30;
  id v31;
  HMMediaSystemStageManager *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  HMMediaSystemStageManager *v36;
  id v37;
  _QWORD v38[5];
  id v39;
  id v40;
  _QWORD v41[5];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[HMMediaSystemStageManager unstageAndCommitMediaSystems:](self, "unstageAndCommitMediaSystems:", v10);
  v11 = [HMObjectMergeCollection alloc];
  -[HMMediaSystemStageManager committedMediaSystems](self, "committedMediaSystems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HMObjectMergeCollection initWithCurrentObjects:newObjects:](v11, "initWithCurrentObjects:newObjects:", v12, v10);

  -[HMObjectMergeCollection removedObjects](v13, "removedObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke;
  v41[3] = &unk_1E3AAF4A0;
  v41[4] = self;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v41);

  -[HMObjectMergeCollection addedObjects](v13, "addedObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v15;
  v38[1] = 3221225472;
  v38[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_12;
  v38[3] = &unk_1E3AAF4C8;
  v38[4] = self;
  v17 = v9;
  v39 = v17;
  v18 = v8;
  v40 = v18;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v38);

  -[HMObjectMergeCollection mergeCommonObjects](v13, "mergeCommonObjects");
  -[HMObjectMergeCollection finalObjects](v13, "finalObjects");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemStageManager setCommittedMediaSystems:](self, "setCommittedMediaSystems:", v19);

  -[HMObjectMergeCollection removedObjects](v13, "removedObjects");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v15;
  v34[1] = 3221225472;
  v34[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_13;
  v34[3] = &unk_1E3AAF4C8;
  v21 = v17;
  v35 = v21;
  v36 = self;
  v22 = v18;
  v37 = v22;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v34);

  -[HMObjectMergeCollection addedObjects](v13, "addedObjects");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v15;
  v28 = 3221225472;
  v29 = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_3;
  v30 = &unk_1E3AAF4C8;
  v31 = v21;
  v32 = self;
  v33 = v22;
  v24 = v22;
  v25 = v21;
  objc_msgSend(v23, "enumerateObjectsUsingBlock:", &v27);

  LOBYTE(v21) = -[HMObjectMergeCollection isModified](v13, "isModified", v27, v28, v29, v30);
  return (char)v21;
}

- (id)committedMediaSystems
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_committedMediaSystemsMap, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setCommittedMediaSystems:(id)a3
{
  void *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *committedMediaSystemsMap;
  id v7;

  v7 = a3;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v7, "na_dictionaryWithKeyGenerator:", &__block_literal_global_15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (NSMutableDictionary *)objc_msgSend(v4, "mutableCopy");
  committedMediaSystemsMap = self->_committedMediaSystemsMap;
  self->_committedMediaSystemsMap = v5;

  os_unfair_lock_unlock(&self->_lock);
}

- (void)stageAddedMediaSystem:(id)a3
{
  id v4;
  void *v5;
  HMMediaSystemStageManager *v6;
  NSObject *v7;
  void *v8;
  NSMutableDictionary *stagedAddedMediaSystemsMap;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging media system: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  stagedAddedMediaSystemsMap = v6->_stagedAddedMediaSystemsMap;
  objc_msgSend(v4, "uuid");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](stagedAddedMediaSystemsMap, "setObject:forKey:", v4, v10);

  os_unfair_lock_unlock(&v6->_lock);
  -[HMMediaSystemStageManager addedMediaSystemTimerManager](v6, "addedMediaSystemTimerManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "startTimerWithTimeInterval:andReplaceObject:", v12, 180.0);

  -[HMMediaSystemStageManager notifyDelegateOfAddedMediaSystem:](v6, "notifyDelegateOfAddedMediaSystem:", v4);
}

- (void)stageRemovedMediaSystemUUID:(id)a3
{
  id v4;
  void *v5;
  HMMediaSystemStageManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  HMMediaSystemStageManager *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Staging removed media system: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMediaSystemStageManager mediaSystemWithUUID:](v6, "mediaSystemWithUUID:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    os_unfair_lock_lock_with_options();
    -[NSMutableSet addObject:](v6->_stagedRemovedMediaSystemUUIDs, "addObject:", v4);
    os_unfair_lock_unlock(&v6->_lock);
    -[HMMediaSystemStageManager removedMediaSystemTimerManager](v6, "removedMediaSystemTimerManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "startTimerWithTimeInterval:andReplaceObject:", v4, 180.0);

    -[HMMediaSystemStageManager notifyDelegateOfRemovedMediaSystem:](v6, "notifyDelegateOfRemovedMediaSystem:", v9);
  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = v6;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Skipping staging removed media system: %@ due to no existing media system", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)unstageAndCommitMediaSystems:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__HMMediaSystemStageManager_unstageAndCommitMediaSystems___block_invoke;
  v3[3] = &unk_1E3AAF510;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

- (void)unstageAndCommitMediaSystemWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMMediaSystemStageManager *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_stagedAddedMediaSystemsMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_stagedAddedMediaSystemsMap, "removeObjectForKey:", v4);
    -[NSMutableDictionary setObject:forKey:](self->_committedMediaSystemsMap, "setObject:forKey:", v5, v4);

    os_unfair_lock_unlock(&self->_lock);
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v9;
      v12 = 2112;
      v13 = v4;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_INFO, "%{public}@Unstaged and committed media system: %@", (uint8_t *)&v10, 0x16u);

    }
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)unstageExpiredStagedRemovedMediaSystemUUID:(id)a3
{
  id v4;
  void *v5;
  HMMediaSystemStageManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Unstaging expired staged removed media system with UUID: %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[NSMutableSet removeObject:](v6->_stagedRemovedMediaSystemUUIDs, "removeObject:", v4);
  os_unfair_lock_unlock(&v6->_lock);
  -[HMMediaSystemStageManager mediaSystemWithUUID:](v6, "mediaSystemWithUUID:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    -[HMMediaSystemStageManager notifyDelegateOfAddedMediaSystem:](v6, "notifyDelegateOfAddedMediaSystem:", v9);

}

- (void)unstageExpiredStagedAddedMediaSystemUUID:(id)a3
{
  id v4;
  void *v5;
  HMMediaSystemStageManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  HMMediaSystemStageManager *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1A1AC1AAC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v8;
    v18 = 2112;
    v19 = v4;
    _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Unstaging expired staged added media system with UUID: %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](v6->_stagedAddedMediaSystemsMap, "objectForKey:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v6->_stagedAddedMediaSystemsMap, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&v6->_lock);
  if (v9)
  {
    -[HMMediaSystemStageManager mediaSystemWithUUID:](v6, "mediaSystemWithUUID:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10 == 0;

    if (v11)
    {
      v12 = (void *)MEMORY[0x1A1AC1AAC]();
      v13 = v6;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138543618;
        v17 = v15;
        v18 = 2112;
        v19 = v9;
        _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Removed expired staged media system: %@", (uint8_t *)&v16, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(v9, "_unconfigure");
      -[HMMediaSystemStageManager notifyDelegateOfRemovedMediaSystem:](v13, "notifyDelegateOfRemovedMediaSystem:", v9);
    }
  }

}

- (id)mediaSystemWithUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMMediaSystemStageManager mediaSystems](self, "mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__HMMediaSystemStageManager_mediaSystemWithUUID___block_invoke;
  v9[3] = &unk_1E3AAFA80;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)mediaSystemWithUniqueIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMMediaSystemStageManager mediaSystems](self, "mediaSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__HMMediaSystemStageManager_mediaSystemWithUniqueIdentifier___block_invoke;
  v9[3] = &unk_1E3AAFA80;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)notifyDelegateOfAddedMediaSystem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HMMediaSystemStageManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystemStageManager dataSourceHome](self, "dataSourceHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemStageManager dataSourceContext](self, "dataSourceContext");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    -[HMMediaSystemStageManager notifyDelegateOfAddedMediaSystem:usingHome:context:](self, "notifyDelegateOfAddedMediaSystem:usingHome:context:", v4, v5, v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of added media system: %@ due to no home: %@ context: %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)notifyDelegateOfAddedMediaSystem:(id)a3 usingHome:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMMediaSystemStageManager *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "delegateCaller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __80__HMMediaSystemStageManager_notifyDelegateOfAddedMediaSystem_usingHome_context___block_invoke;
    v16[3] = &unk_1E3AB5CD0;
    v16[4] = self;
    v17 = v8;
    v18 = v9;
    objc_msgSend(v11, "invokeBlock:", v16);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify client of added media system due to no delegate caller provided by context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)notifyDelegateOfRemovedMediaSystem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  HMMediaSystemStageManager *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMediaSystemStageManager dataSourceHome](self, "dataSourceHome");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMediaSystemStageManager dataSourceContext](self, "dataSourceContext");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6)
  {
    -[HMMediaSystemStageManager notifyDelegateOfRemovedMediaSystem:usingHome:context:](self, "notifyDelegateOfRemovedMediaSystem:usingHome:context:", v4, v5, v6);
  }
  else
  {
    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138544130;
      v15 = v11;
      v16 = 2112;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to notify of removed media system: %@ due to no home: %@ context: %@", (uint8_t *)&v14, 0x2Au);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)notifyDelegateOfRemovedMediaSystem:(id)a3 usingHome:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMMediaSystemStageManager *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v10, "delegateCaller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__HMMediaSystemStageManager_notifyDelegateOfRemovedMediaSystem_usingHome_context___block_invoke;
    v16[3] = &unk_1E3AB5CD0;
    v16[4] = self;
    v17 = v8;
    v18 = v9;
    objc_msgSend(v11, "invokeBlock:", v16);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v10;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Failed to notify client of did removed media system due to no delegate caller for context: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (id)dataSourceHome
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMMediaSystemStageManager *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMMediaSystemStageManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "homeForMediaSystemStageManager:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source home due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)dataSourceContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMMediaSystemStageManager *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMMediaSystemStageManager dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "contextForMediaSystemStageManager:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1A1AC1AAC]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_19B1B0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to data source context due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMMediaSystemStageManager identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)timerManager:(id)a3 didFireForTimerContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  HMMediaSystemStageManager *v14;
  NSObject *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    -[HMMediaSystemStageManager addedMediaSystemTimerManager](self, "addedMediaSystemTimerManager");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v6)
    {
      -[HMMediaSystemStageManager unstageExpiredStagedAddedMediaSystemUUID:](self, "unstageExpiredStagedAddedMediaSystemUUID:", v10);
    }
    else
    {
      -[HMMediaSystemStageManager removedMediaSystemTimerManager](self, "removedMediaSystemTimerManager");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v6)
        -[HMMediaSystemStageManager unstageExpiredStagedRemovedMediaSystemUUID:](self, "unstageExpiredStagedRemovedMediaSystemUUID:", v10);
    }
  }
  else
  {
    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = self;
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v16;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media system uuid from timer context: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (HMMediaSystemStageManagerDataSource)dataSource
{
  return (HMMediaSystemStageManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 48, 1);
}

- (HMFTimerManager)addedMediaSystemTimerManager
{
  return (HMFTimerManager *)objc_getProperty(self, a2, 56, 1);
}

- (HMFTimerManager)removedMediaSystemTimerManager
{
  return (HMFTimerManager *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedMediaSystemTimerManager, 0);
  objc_storeStrong((id *)&self->_addedMediaSystemTimerManager, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_stagedRemovedMediaSystemUUIDs, 0);
  objc_storeStrong((id *)&self->_stagedAddedMediaSystemsMap, 0);
  objc_storeStrong((id *)&self->_committedMediaSystemsMap, 0);
}

void __82__HMMediaSystemStageManager_notifyDelegateOfRemovedMediaSystem_usingHome_context___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaSystemWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1A1AC1AAC]();
    v6 = a1[4];
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138543618;
      v19 = v8;
      v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_19B1B0000, v7, OS_LOG_TYPE_INFO, "%{public}@Skipping remove notification due to existing media system: %@", (uint8_t *)&v18, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
  }
  else
  {
    objc_msgSend(a1[6], "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE45A110))
      v11 = v10;
    else
      v11 = 0;
    v12 = v11;

    v13 = (void *)MEMORY[0x1A1AC1AAC]();
    v14 = a1[4];
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = a1[5];
      v18 = 138543874;
      v19 = v16;
      v20 = 2112;
      v21 = v17;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_19B1B0000, v15, OS_LOG_TYPE_INFO, "%{public}@Notifying client of did remove media system: %@ with delegate: %@", (uint8_t *)&v18, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v12, "home:didRemoveMediaSystem:", a1[6], a1[5]);

  }
}

void __80__HMMediaSystemStageManager_notifyDelegateOfAddedMediaSystem_usingHome_context___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  objc_msgSend(a1[5], "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaSystemWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(a1[6], "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "conformsToProtocol:", &unk_1EE45A110))
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    v8 = (void *)MEMORY[0x1A1AC1AAC]();
    v9 = a1[4];
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v11;
      v19 = 2112;
      v20 = v4;
      v21 = 2112;
      v22 = v7;
      _os_log_impl(&dword_19B1B0000, v10, OS_LOG_TYPE_INFO, "%{public}@Notifying client of added media system: %@ private delegate: %@", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "home:didAddMediaSystem:", a1[6], v4);

  }
  else
  {
    v12 = (void *)MEMORY[0x1A1AC1AAC]();
    v13 = a1[4];
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543618;
      v18 = v15;
      v19 = 2112;
      v20 = v16;
      _os_log_impl(&dword_19B1B0000, v14, OS_LOG_TYPE_INFO, "%{public}@Skipping add media system notification due to not found media system: %@", (uint8_t *)&v17, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

void __41__HMMediaSystemStageManager_mediaSystems__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKey:", v3, v4);

}

uint64_t __41__HMMediaSystemStageManager_mediaSystems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
}

uint64_t __61__HMMediaSystemStageManager_mediaSystemWithUniqueIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uniqueIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __49__HMMediaSystemStageManager_mediaSystemWithUUID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __58__HMMediaSystemStageManager_unstageAndCommitMediaSystems___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "uuid");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unstageAndCommitMediaSystemWithUUID:", v3);

}

uint64_t __54__HMMediaSystemStageManager_setCommittedMediaSystems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

void __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Removed media system via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "_unconfigure");

}

void __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_12(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_19B1B0000, v6, OS_LOG_TYPE_INFO, "%{public}@Added media system via merge: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v3, "__configureWithContext:home:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

void __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_13(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_2;
  v7[3] = &unk_1E3AB59E8;
  v5 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v4, v7);

}

void __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(v3, "postConfigure");
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_4;
  v7[3] = &unk_1E3AB59E8;
  v5 = *(void **)(a1 + 48);
  v7[4] = *(_QWORD *)(a1 + 40);
  v8 = v3;
  v9 = v5;
  v10 = *(id *)(a1 + 32);
  v6 = v3;
  dispatch_async(v4, v7);

}

uint64_t __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfAddedMediaSystem:usingHome:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __64__HMMediaSystemStageManager_mergeMediaSystems_withHome_context___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyDelegateOfRemovedMediaSystem:usingHome:context:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

uint64_t __121__HMMediaSystemStageManager_initWithIdentifier_mediaSystems_addedMediaSystemTimerManager_removedMediaSystemTimerManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t30 != -1)
    dispatch_once(&logCategory__hmf_once_t30, &__block_literal_global_177);
  return (id)logCategory__hmf_once_v31;
}

void __40__HMMediaSystemStageManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v31;
  logCategory__hmf_once_v31 = v0;

}

@end
