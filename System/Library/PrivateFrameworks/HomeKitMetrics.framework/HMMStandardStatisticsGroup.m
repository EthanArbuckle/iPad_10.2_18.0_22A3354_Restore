@implementation HMMStandardStatisticsGroup

- (HMMStandardStatisticsGroup)initWithCoreDataGroup:(id)a3 partitionProvider:(id)a4 coreDataStorage:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMMStandardStatisticsGroup *v12;
  HMMStandardStatisticsGroup *v13;
  uint64_t v14;
  NSMutableDictionary *ephemeralContainers;
  uint64_t v16;
  NSMutableDictionary *observers;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HMMStandardStatisticsGroup;
  v12 = -[HMMStandardStatisticsGroup init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_coreDataGroup, a3);
    objc_storeStrong((id *)&v13->_partitionProvider, a4);
    objc_storeStrong((id *)&v13->_coreDataStorage, a5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    ephemeralContainers = v13->_ephemeralContainers;
    v13->_ephemeralContainers = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = objc_claimAutoreleasedReturnValue();
    observers = v13->_observers;
    v13->_observers = (NSMutableDictionary *)v16;

  }
  return v13;
}

- (void)addMaxValueObserver:(id)a3 forStatistics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observers, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "arrayByAddingObject:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observers, "setObject:forKeyedSubscript:", v10, v7);

  os_unfair_lock_unlock(&self->_lock);
}

- (id)observersForStatistics:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observers, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)notifyObserversForStatistics:(id)a3 previousMax:(int64_t)a4 newMax:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[HMMStandardStatisticsGroup observersForStatistics:](self, "observersForStatistics:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "updatedCounter:fromOldValue:toNewValue:", v8, a4, a5);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)addValue:(int64_t)a3 toStatistics:(id)a4
{
  id v6;
  void *v7;
  id v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  id v19;
  int64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[HMMStandardStatisticsGroup coreDataStorage](self, "coreDataStorage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__HMMStandardStatisticsGroup_addValue_toStatistics___block_invoke;
  v18[3] = &unk_1E898A540;
  v18[4] = self;
  v8 = v6;
  v19 = v8;
  v20 = a3;
  objc_msgSend(v7, "executeWithManagedObjectContext:", v18);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allValues](self->_ephemeralContainers, "allValues", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "addValue:toStatistics:", a3, v8);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v21, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(p_lock);
}

- (id)datePartitions
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  -[HMMStandardStatisticsGroup coreDataStorage](self, "coreDataStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "save");

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__466;
  v12 = __Block_byref_object_dispose__467;
  v13 = (id)MEMORY[0x1E0C9AA60];
  -[HMMStandardStatisticsGroup coreDataStorage](self, "coreDataStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__HMMStandardStatisticsGroup_datePartitions__block_invoke;
  v7[3] = &unk_1E898A628;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "executeWithManagedObjectContextAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)statistics:(id)a3 inDatePartition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__466;
  v21 = __Block_byref_object_dispose__467;
  v22 = 0;
  -[HMMStandardStatisticsGroup coreDataStorage](self, "coreDataStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __57__HMMStandardStatisticsGroup_statistics_inDatePartition___block_invoke;
  v13[3] = &unk_1E898A650;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v8, "executeWithManagedObjectContextAndWait:", v13);

  v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (id)statisticsInDatePartition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__466;
  v16 = __Block_byref_object_dispose__467;
  v17 = (id)MEMORY[0x1E0C9AA70];
  -[HMMStandardStatisticsGroup coreDataStorage](self, "coreDataStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HMMStandardStatisticsGroup_statisticsInDatePartition___block_invoke;
  v9[3] = &unk_1E898A6A0;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "executeWithManagedObjectContextAndWait:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)addEphemeralContainerWithName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  HMMStandardStatisticsGroup *v8;
  NSObject *v9;
  void *v10;
  HMMEphemeralStatisticsContainer *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_ephemeralContainers, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)MEMORY[0x1D17B78FC]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_1CD029000, v9, OS_LOG_TYPE_ERROR, "%{public}@Ephemeral container already exists: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }
  else
  {
    v11 = objc_alloc_init(HMMEphemeralStatisticsContainer);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_ephemeralContainers, "setObject:forKeyedSubscript:", v11, v4);

  }
  os_unfair_lock_unlock(p_lock);

  return v6 == 0;
}

- (void)deactivateEphemeralContainerWithName:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_ephemeralContainers, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActive:", 0);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeEphemeralContainerWithName:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_ephemeralContainers, "setObject:forKeyedSubscript:", 0, v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (NSArray)ephemeralContainerNames
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_ephemeralContainers, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_ephemeralContainers, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEmpty");

        if ((v11 & 1) == 0)
          objc_msgSend(v4, "addObject:", v9);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v12;
}

- (id)statistics:(id)a3 inEphemeralContainer:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_ephemeralContainers, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "statistics:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (id)statisticsInEphemeralContainer:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_ephemeralContainers, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statistics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (HMMCounterDatePartitionProvider)partitionProvider
{
  return self->_partitionProvider;
}

- (HMMCoreDataCounterStorage)coreDataStorage
{
  return self->_coreDataStorage;
}

- (NSMutableDictionary)ephemeralContainers
{
  return self->_ephemeralContainers;
}

- (NSMutableDictionary)observers
{
  return self->_observers;
}

- (HMMCoreDataNamedGroup)coreDataGroup
{
  return self->_coreDataGroup;
}

- (void)setCoreDataGroup:(id)a3
{
  objc_storeStrong((id *)&self->_coreDataGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataGroup, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_ephemeralContainers, 0);
  objc_storeStrong((id *)&self->_coreDataStorage, 0);
  objc_storeStrong((id *)&self->_partitionProvider, 0);
}

void __56__HMMStandardStatisticsGroup_statisticsInDatePartition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupValueStatistics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(group == %@) && (date == %@)"), v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v35 = 0;
  v30 = v3;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v35);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v35;
  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17B78FC]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v29 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v38 = v13;
      v39 = 2114;
      v40 = v15;
      v41 = 2114;
      v42 = v16;
      v43 = 2114;
      v44 = v9;
      _os_log_impl(&dword_1CD029000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error getting all statistics in group %{public}@ on date %{public}@: %{public}@", buf, 0x2Au);

      v10 = v29;
    }

    objc_autoreleasePoolPop(v10);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v32 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v23, "counterStatistics");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v24, v25);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v20);
  }

  v26 = objc_msgSend(v17, "copy");
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v28 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v26;

}

void __57__HMMStandardStatisticsGroup_statistics_inDatePartition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupValueStatistics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(group == %@) && (name == %@) && (date == %@)"), v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v27 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v27);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v27;
  if (!objc_msgSend(v8, "count"))
  {
    if (!v9)
      goto LABEL_11;
    v14 = (void *)MEMORY[0x1D17B78FC]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "name");
      v25 = v14;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544386;
      v29 = v17;
      v30 = 2114;
      v31 = v24;
      v32 = 2114;
      v33 = v19;
      v34 = 2114;
      v35 = v20;
      v36 = 2114;
      v37 = v9;
      _os_log_impl(&dword_1CD029000, v16, OS_LOG_TYPE_ERROR, "%{public}@Error getting counter %{public}@ in group %{public}@ on date %{public}@: %{public}@", buf, 0x34u);

      v14 = v25;
LABEL_9:

    }
LABEL_10:

    objc_autoreleasePoolPop(v14);
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "count") != 1)
  {
    v14 = (void *)MEMORY[0x1D17B78FC]();
    v15 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v14;
      v21 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "name");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v17;
      v30 = 2114;
      v31 = v21;
      v14 = v26;
      v32 = 2114;
      v33 = v23;
      _os_log_impl(&dword_1CD029000, v16, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra statistics returned for counter %{public}@ in group %{public}@", buf, 0x20u);

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "counterStatistics");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

LABEL_11:
}

void __44__HMMStandardStatisticsGroup_datePartitions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupValueStatistics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("group == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  objc_msgSend(v4, "setResultType:", 2);
  objc_msgSend(v4, "setPropertiesToFetch:", &unk_1E8991F68);
  objc_msgSend(v4, "setReturnsDistinctResults:", 1);
  v31 = 0;
  v26 = v3;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v31;
  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17B78FC]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v34 = v13;
      v35 = 2114;
      v36 = v15;
      v37 = 2114;
      v38 = v9;
      _os_log_impl(&dword_1CD029000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error getting dates for group %{public}@: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v28;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v28 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v21), "objectForKeyedSubscript:", CFSTR("date"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v19);
  }

  v23 = objc_msgSend(v16, "copy");
  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v25 = *(void **)(v24 + 40);
  *(_QWORD *)(v24 + 40) = v23;

}

void __52__HMMStandardStatisticsGroup_addValue_toStatistics___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  HMMCoreDataGroupValueStatistics *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "partitionProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDatePartition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupValueStatistics"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("(group == %@) && (name == %@) && (date == %@)"), v8, *(_QWORD *)(a1 + 40), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v9);

  v33 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v6, &v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v33;
  if (objc_msgSend(v10, "count"))
  {
    if (objc_msgSend(v10, "count") == 1)
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
      v12 = (HMMCoreDataGroupValueStatistics *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = (void *)MEMORY[0x1D17B78FC]();
      v20 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v30 = v11;
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
        v32 = v19;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v35 = v22;
        v36 = 2114;
        v37 = v28;
        v38 = 2114;
        v39 = v24;
        _os_log_impl(&dword_1CD029000, v21, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra statistics returned for statistic %{public}@ in group %{public}@", buf, 0x20u);

        v19 = v32;
        v11 = v30;
      }

      objc_autoreleasePoolPop(v19);
      v12 = 0;
    }
    goto LABEL_12;
  }
  if (!v11)
  {
    v12 = -[HMMCoreDataGroupValueStatistics initWithContext:]([HMMCoreDataGroupValueStatistics alloc], "initWithContext:", v3);
    objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMCoreDataGroupValueStatistics setGroup:](v12, "setGroup:", v25);

    -[HMMCoreDataGroupValueStatistics setName:](v12, "setName:", *(_QWORD *)(a1 + 40));
    -[HMMCoreDataGroupValueStatistics setDate:](v12, "setDate:", v5);
LABEL_12:
    -[HMMCoreDataGroupValueStatistics addValue:](v12, "addValue:", *(_QWORD *)(a1 + 48));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v26)
      objc_msgSend(*(id *)(a1 + 32), "notifyObserversForStatistics:previousMax:newMax:", *(_QWORD *)(a1 + 40), objc_msgSend(v26, "integerValue"), *(_QWORD *)(a1 + 48));

    goto LABEL_15;
  }
  v13 = (void *)MEMORY[0x1D17B78FC]();
  v14 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v31 = v13;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v35 = v16;
    v36 = 2114;
    v37 = v29;
    v38 = 2114;
    v39 = v18;
    v40 = 2114;
    v41 = v5;
    v42 = 2114;
    v43 = v11;
    _os_log_impl(&dword_1CD029000, v15, OS_LOG_TYPE_ERROR, "%{public}@Error getting statistics %{public}@ in group %{public}@ on date %{public}@: %{public}@", buf, 0x34u);

    v13 = v31;
  }

  objc_autoreleasePoolPop(v13);
LABEL_15:

}

+ (id)groupFromSpecifier:(id)a3 partitionProvider:(id)a4 coreDataStorage:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  HMMStandardStatisticsGroup *v13;
  HMMStandardStatisticsGroup *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint8_t buf[4];
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__466;
  v30 = __Block_byref_object_dispose__467;
  v31 = 0;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __83__HMMStandardStatisticsGroup_groupFromSpecifier_partitionProvider_coreDataStorage___block_invoke;
  v23 = &unk_1E898A628;
  v25 = &v26;
  v11 = v8;
  v24 = v11;
  v12 = objc_msgSend(v10, "executeWithManagedObjectContextAndWait:", &v20);
  if (v27[5])
  {
    v13 = [HMMStandardStatisticsGroup alloc];
    v14 = -[HMMStandardStatisticsGroup initWithCoreDataGroup:partitionProvider:coreDataStorage:](v13, "initWithCoreDataGroup:partitionProvider:coreDataStorage:", v27[5], v9, v10, v20, v21, v22, v23);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17B78FC](v12);
    v16 = a1;
    HMFGetOSLogHandle();
    v17 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v33 = v18;
      _os_log_impl(&dword_1CD029000, v17, OS_LOG_TYPE_ERROR, "%{public}@Can't create counter group due to failure to retrieve database group", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  _Block_object_dispose(&v26, 8);
  return v14;
}

+ (void)deletePartitionsBeforeDate:(id)a3 coreDataStorage:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("date < %@"), a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deleteStatisticsUsingPredicate:coreDataStorage:", v8, v7);

}

+ (void)deletePartitionsAfterDate:(id)a3 coreDataStorage:(id)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("date > %@"), a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "deleteStatisticsUsingPredicate:coreDataStorage:", v8, v7);

}

+ (void)deleteStatisticsUsingPredicate:(id)a3 coreDataStorage:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __77__HMMStandardStatisticsGroup_deleteStatisticsUsingPredicate_coreDataStorage___block_invoke;
  v8[3] = &unk_1E898A6C8;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a4, "executeWithManagedObjectContextAndWait:", v8);

}

void __77__HMMStandardStatisticsGroup_deleteStatisticsUsingPredicate_coreDataStorage___block_invoke(uint64_t a1, void *a2)
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
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupValueStatistics"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v4);
  objc_msgSend(v5, "setResultType:", 1);
  v18 = 0;
  objc_msgSend(v3, "executeRequest:error:", v5, &v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v7)
  {
    v8 = (void *)MEMORY[0x1D17B78FC]();
    v9 = *(id *)(a1 + 40);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      v26 = 2114;
      v27 = v7;
      _os_log_impl(&dword_1CD029000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error deleting statistics where %{public}@: %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
  }
  objc_msgSend(v6, "result");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
  {
    v15 = (void *)MEMORY[0x1E0C97B88];
    v20 = *MEMORY[0x1E0C97840];
    v21 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "mergeChangesFromRemoteContextSave:intoContexts:", v16, v17);

  }
}

void __83__HMMStandardStatisticsGroup_groupFromSpecifier_partitionProvider_coreDataStorage___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "coreDataGroupUsingContext:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

@end
