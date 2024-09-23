@implementation HMMCountersManager

- (HMMCountersManager)initWithDataModelName:(id)a3 atPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMMCountersManager *v9;

  v6 = a4;
  v7 = a3;
  +[HMMDateProvider sharedInstance](HMMDateProvider, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMMCountersManager initWithDataModelName:atPath:dateProvider:](self, "initWithDataModelName:atPath:dateProvider:", v7, v6, v8);

  return v9;
}

- (HMMCountersManager)initWithDataModelName:(id)a3 atPath:(id)a4 dateProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMMCountersManager *v11;
  HMMCoreDataCounterStorage *v12;
  HMMCoreDataCounterStorage *coreDataStorage;
  HMMDailyPartitionProvider *v14;
  HMMDailyPartitionProvider *partitionProvider;
  uint64_t v16;
  NSMutableDictionary *counterGroups;
  uint64_t v18;
  NSMutableDictionary *statisticsGroups;
  uint64_t v20;
  NSMutableDictionary *managedContainersByName;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)HMMCountersManager;
  v11 = -[HMMCountersManager init](&v23, sel_init);
  if (v11)
  {
    v12 = -[HMMCoreDataCounterStorage initWithModelName:atPath:]([HMMCoreDataCounterStorage alloc], "initWithModelName:atPath:", v8, v9);
    coreDataStorage = v11->_coreDataStorage;
    v11->_coreDataStorage = v12;

    v11->_storageNeedsLoading = 1;
    objc_storeStrong((id *)&v11->_dateProvider, a5);
    v14 = -[HMMDailyPartitionProvider initWithDateProvider:]([HMMDailyPartitionProvider alloc], "initWithDateProvider:", v10);
    partitionProvider = v11->_partitionProvider;
    v11->_partitionProvider = v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    counterGroups = v11->_counterGroups;
    v11->_counterGroups = (NSMutableDictionary *)v16;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v18 = objc_claimAutoreleasedReturnValue();
    statisticsGroups = v11->_statisticsGroups;
    v11->_statisticsGroups = (NSMutableDictionary *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    managedContainersByName = v11->_managedContainersByName;
    v11->_managedContainersByName = (NSMutableDictionary *)v20;

  }
  return v11;
}

- (BOOL)loadPersistentStoreWithError:(id *)a3
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  LOBYTE(a3) = -[HMMCountersManager _loadPersistentStoreWithError:](self, "_loadPersistentStoreWithError:", a3);
  os_unfair_lock_unlock(p_lock);
  return (char)a3;
}

- (BOOL)_loadPersistentStoreWithError:(id *)a3
{
  void *v5;
  char v6;
  void *v8;
  HMMCountersManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_storageNeedsLoading)
    return 1;
  self->_storageNeedsLoading = 0;
  -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loadPersistentStoreWithError:", a3);

  if ((v6 & 1) != 0)
    return 1;
  v8 = (void *)MEMORY[0x1D17B78FC]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543362;
    v13 = v11;
    _os_log_impl(&dword_1CD029000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to load persistent store. Counters won't be tracked.", (uint8_t *)&v12, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  return 0;
}

- (void)loadAllCounterGroups
{
  void *v3;
  _QWORD v4[5];

  -[HMMCountersManager loadPersistentStoreWithError:](self, "loadPersistentStoreWithError:", 0);
  -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__HMMCountersManager_loadAllCounterGroups__block_invoke;
  v4[3] = &unk_1E898A8E0;
  v4[4] = self;
  objc_msgSend(v3, "executeWithManagedObjectContextAndWait:", v4);

}

- (id)counterGroupForSpecifier:(id)a3 coreDataGroup:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  HMMStandardCounterGroup *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  id v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMCountersManager _loadPersistentStoreWithError:](self, "_loadPersistentStoreWithError:", 0);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_counterGroups, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (v7)
    {
      v10 = [HMMStandardCounterGroup alloc];
      -[HMMCountersManager dateProvider](self, "dateProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMCountersManager partitionProvider](self, "partitionProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HMMStandardCounterGroup initWithCoreDataGroup:dateProvider:partitionProvider:coreDataStorage:](v10, "initWithCoreDataGroup:dateProvider:partitionProvider:coreDataStorage:", v7, v11, v12, v13);
    }
    else
    {
      -[HMMCountersManager dateProvider](self, "dateProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMCountersManager partitionProvider](self, "partitionProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMMStandardCounterGroup groupFromSpecifier:dateProvider:partitionProvider:coreDataStorage:](HMMStandardCounterGroup, "groupFromSpecifier:dateProvider:partitionProvider:coreDataStorage:", v6, v11, v12, v13);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v14;

    if (v9)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      -[NSMutableDictionary allValues](self->_managedContainersByName, "allValues", 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            if (objc_msgSend(v19, "isActive"))
            {
              objc_msgSend(v19, "containerName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addEphemeralContainerWithName:", v20);

            }
          }
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v16);
      }

      -[NSMutableDictionary setObject:forKey:](self->_counterGroups, "setObject:forKey:", v9, v6);
    }
  }
  v21 = v9;

  os_unfair_lock_unlock(p_lock);
  return v21;
}

- (id)counterGroupForName:(id)a3
{
  id v4;
  HMMNamedGroupSpecifier *v5;
  void *v6;

  v4 = a3;
  v5 = -[HMMNamedGroupSpecifier initWithGroupName:]([HMMNamedGroupSpecifier alloc], "initWithGroupName:", v4);

  -[HMMCountersManager counterGroupForSpecifier:coreDataGroup:](self, "counterGroupForSpecifier:coreDataGroup:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)counterGroupForHomeUUID:(id)a3 groupName:(id)a4
{
  id v6;
  id v7;
  HMMHomeGroupSpecifier *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[HMMHomeGroupSpecifier initWithHomeUUID:groupName:]([HMMHomeGroupSpecifier alloc], "initWithHomeUUID:groupName:", v7, v6);

  -[HMMCountersManager counterGroupForSpecifier:coreDataGroup:](self, "counterGroupForSpecifier:coreDataGroup:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)counterGroupForHomeUUIDFromLogEvent:(id)a3 groupName:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  HMMSafeHomeUUIDFromLogEvent(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMMCountersManager counterGroupForHomeUUID:groupName:](self, "counterGroupForHomeUUID:groupName:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)counterGroupForAccessoryUUID:(id)a3 homeUUID:(id)a4 groupName:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMMAccessoryGroupSpecifier *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HMMAccessoryGroupSpecifier initWithAccessoryUUID:homeUUID:groupName:]([HMMAccessoryGroupSpecifier alloc], "initWithAccessoryUUID:homeUUID:groupName:", v10, v9, v8);

  -[HMMCountersManager counterGroupForSpecifier:coreDataGroup:](self, "counterGroupForSpecifier:coreDataGroup:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)enumerateCounterGroupsUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMMCountersManager loadAllCounterGroups](self, "loadAllCounterGroups");
  os_unfair_lock_lock_with_options();
  v6 = (id)-[NSMutableDictionary copy](self->_counterGroups, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__HMMCountersManager_enumerateCounterGroupsUsingBlock___block_invoke;
  v7[3] = &unk_1E898A908;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void)loadAllStatisticsGroups
{
  void *v3;
  _QWORD v4[5];

  -[HMMCountersManager loadPersistentStoreWithError:](self, "loadPersistentStoreWithError:", 0);
  -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__HMMCountersManager_loadAllStatisticsGroups__block_invoke;
  v4[3] = &unk_1E898A8E0;
  v4[4] = self;
  objc_msgSend(v3, "executeWithManagedObjectContextAndWait:", v4);

}

- (id)statisticsGroupForSpecifier:(id)a3 coreDataGroup:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  HMMStandardStatisticsGroup *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  id v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMCountersManager _loadPersistentStoreWithError:](self, "_loadPersistentStoreWithError:", 0);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_statisticsGroups, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (v7)
    {
      v10 = [HMMStandardStatisticsGroup alloc];
      -[HMMCountersManager partitionProvider](self, "partitionProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[HMMStandardStatisticsGroup initWithCoreDataGroup:partitionProvider:coreDataStorage:](v10, "initWithCoreDataGroup:partitionProvider:coreDataStorage:", v7, v11, v12);
    }
    else
    {
      -[HMMCountersManager partitionProvider](self, "partitionProvider");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMMStandardStatisticsGroup groupFromSpecifier:partitionProvider:coreDataStorage:](HMMStandardStatisticsGroup, "groupFromSpecifier:partitionProvider:coreDataStorage:", v6, v11, v12);
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v9 = (void *)v13;

    if (v9)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[NSMutableDictionary allValues](self->_managedContainersByName, "allValues", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v23 != v16)
              objc_enumerationMutation(v14);
            v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
            if (objc_msgSend(v18, "isActive"))
            {
              objc_msgSend(v18, "containerName");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addEphemeralContainerWithName:", v19);

            }
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v15);
      }

      -[NSMutableDictionary setObject:forKey:](self->_statisticsGroups, "setObject:forKey:", v9, v6);
    }
  }
  v20 = v9;

  os_unfair_lock_unlock(p_lock);
  return v20;
}

- (id)statisticsGroupForName:(id)a3
{
  id v4;
  HMMNamedGroupSpecifier *v5;
  void *v6;

  v4 = a3;
  v5 = -[HMMNamedGroupSpecifier initWithGroupName:]([HMMNamedGroupSpecifier alloc], "initWithGroupName:", v4);

  -[HMMCountersManager statisticsGroupForSpecifier:coreDataGroup:](self, "statisticsGroupForSpecifier:coreDataGroup:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)statisticsGroupForHomeUUID:(id)a3 groupName:(id)a4
{
  id v6;
  id v7;
  HMMHomeGroupSpecifier *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[HMMHomeGroupSpecifier initWithHomeUUID:groupName:]([HMMHomeGroupSpecifier alloc], "initWithHomeUUID:groupName:", v7, v6);

  -[HMMCountersManager statisticsGroupForSpecifier:coreDataGroup:](self, "statisticsGroupForSpecifier:coreDataGroup:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)statisticsGroupForHomeUUIDFromLogEvent:(id)a3 groupName:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  HMMSafeHomeUUIDFromLogEvent(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[HMMCountersManager statisticsGroupForHomeUUID:groupName:](self, "statisticsGroupForHomeUUID:groupName:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)statisticsGroupForAccessoryUUID:(id)a3 homeUUID:(id)a4 groupName:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMMAccessoryGroupSpecifier *v11;
  void *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[HMMAccessoryGroupSpecifier initWithAccessoryUUID:homeUUID:groupName:]([HMMAccessoryGroupSpecifier alloc], "initWithAccessoryUUID:homeUUID:groupName:", v10, v9, v8);

  -[HMMCountersManager statisticsGroupForSpecifier:coreDataGroup:](self, "statisticsGroupForSpecifier:coreDataGroup:", v11, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)enumerateStatisticsGroupsUsingBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[HMMCountersManager loadAllStatisticsGroups](self, "loadAllStatisticsGroups");
  os_unfair_lock_lock_with_options();
  v6 = (id)-[NSMutableDictionary copy](self->_statisticsGroups, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__HMMCountersManager_enumerateStatisticsGroupsUsingBlock___block_invoke;
  v7[3] = &unk_1E898A930;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (BOOL)addEphemeralContainerWithName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSMutableDictionary *managedContainersByName;
  HMMManagedEphemeralContainer *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_managedContainersByName, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    managedContainersByName = self->_managedContainersByName;
    v8 = -[HMMManagedEphemeralContainer initWithContainerName:]([HMMManagedEphemeralContainer alloc], "initWithContainerName:", v4);
    -[NSMutableDictionary setObject:forKey:](managedContainersByName, "setObject:forKey:", v8, v4);

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[NSMutableDictionary allValues](self->_counterGroups, "allValues");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v23;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v12++), "addEphemeralContainerWithName:", v4);
        }
        while (v10 != v12);
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v10);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSMutableDictionary allValues](self->_statisticsGroups, "allValues", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v16++), "addEphemeralContainerWithName:", v4);
        }
        while (v14 != v16);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

  }
  os_unfair_lock_unlock(p_lock);

  return v6 == 0;
}

- (void)deactivateEphemeralContainerWithName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_managedContainersByName, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isActive") & 1) != 0)
  {
    objc_msgSend(v7, "setActive:", 0);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[NSMutableDictionary allValues](self->_counterGroups, "allValues");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v11++), "deactivateEphemeralContainerWithName:", v4);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v9);
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableDictionary allValues](self->_statisticsGroups, "allValues", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v17;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v15++), "deactivateEphemeralContainerWithName:", v4);
        }
        while (v13 != v15);
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      }
      while (v13);
    }

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)removeEphemeralContainerWithName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_managedContainersByName, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_managedContainersByName, "setObject:forKeyedSubscript:", 0, v4);
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    -[NSMutableDictionary allValues](self->_counterGroups, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10++), "removeEphemeralContainerWithName:", v4);
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v8);
    }

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMutableDictionary allValues](self->_statisticsGroups, "allValues", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "removeEphemeralContainerWithName:", v4);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }

  }
  os_unfair_lock_unlock(p_lock);

}

- (NSArray)managedEphemeralContainers
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_managedContainersByName, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)managedEphemeralContainerForName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_managedContainersByName, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)deletePartitionsBeforeDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMMCountersManager loadPersistentStoreWithError:](self, "loadPersistentStoreWithError:", 0);
  -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMStandardCounterGroup deletePartitionsBeforeDate:coreDataStorage:](HMMStandardCounterGroup, "deletePartitionsBeforeDate:coreDataStorage:", v4, v5);

  -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[HMMStandardStatisticsGroup deletePartitionsBeforeDate:coreDataStorage:](HMMStandardStatisticsGroup, "deletePartitionsBeforeDate:coreDataStorage:", v4, v6);

}

- (void)deletePartitionsAfterDate:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HMMCountersManager loadPersistentStoreWithError:](self, "loadPersistentStoreWithError:", 0);
  -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMMStandardCounterGroup deletePartitionsAfterDate:coreDataStorage:](HMMStandardCounterGroup, "deletePartitionsAfterDate:coreDataStorage:", v4, v5);

  -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[HMMStandardStatisticsGroup deletePartitionsAfterDate:coreDataStorage:](HMMStandardStatisticsGroup, "deletePartitionsAfterDate:coreDataStorage:", v4, v6);

}

- (void)save
{
  void *v3;
  void *v4;
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
  -[HMMCountersManager loadPersistentStoreWithError:](self, "loadPersistentStoreWithError:", 0);
  os_unfair_lock_lock_with_options();
  v3 = (void *)-[NSMutableDictionary copy](self->_counterGroups, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v3, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "updateCountersBeforeSave");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[HMMCountersManager coreDataStorage](self, "coreDataStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "save");

}

- (HMMCoreDataCounterStorage)coreDataStorage
{
  return self->_coreDataStorage;
}

- (HMMDailyPartitionProvider)partitionProvider
{
  return self->_partitionProvider;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_partitionProvider, 0);
  objc_storeStrong((id *)&self->_coreDataStorage, 0);
  objc_storeStrong((id *)&self->_managedContainersByName, 0);
  objc_storeStrong((id *)&self->_statisticsGroups, 0);
  objc_storeStrong((id *)&self->_counterGroups, 0);
}

void __58__HMMCountersManager_enumerateStatisticsGroupsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "descriptor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __45__HMMCountersManager_loadAllStatisticsGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("NamedGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("valueStatistics.@count > 0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setIncludesSubentities:", 1);
  v26 = 0;
  v21 = v3;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17B78FC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1CD029000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error loading all groups: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = *(void **)(a1 + 32);
        objc_msgSend(v17, "groupSpecifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v18, "statisticsGroupForSpecifier:coreDataGroup:", v19, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v14);
  }

}

void __55__HMMCountersManager_enumerateCounterGroupsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  objc_msgSend(a2, "descriptor");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v6, v5);

}

void __42__HMMCountersManager_loadAllCounterGroups__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("NamedGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("counters.@count > 0"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setIncludesSubentities:", 1);
  v26 = 0;
  v21 = v3;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17B78FC]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v11;
      v30 = 2114;
      v31 = v7;
      _os_log_impl(&dword_1CD029000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error loading all groups: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        v18 = *(void **)(a1 + 32);
        objc_msgSend(v17, "groupSpecifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (id)objc_msgSend(v18, "counterGroupForSpecifier:coreDataGroup:", v19, v17);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v14);
  }

}

@end
