@implementation HMMStandardCounterGroup

- (HMMStandardCounterGroup)initWithCoreDataGroup:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMMStandardCounterGroup *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[HMMUptimeProvider sharedInstance](HMMUptimeProvider, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HMMStandardCounterGroup initWithCoreDataGroup:dateProvider:partitionProvider:coreDataStorage:uptimeProvider:](self, "initWithCoreDataGroup:dateProvider:partitionProvider:coreDataStorage:uptimeProvider:", v13, v12, v11, v10, v14);

  return v15;
}

- (HMMStandardCounterGroup)initWithCoreDataGroup:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6 uptimeProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMMStandardCounterGroup *v17;
  HMMStandardCounterGroup *v18;
  uint64_t v19;
  NSMutableDictionary *ephemeralContainers;
  uint64_t v21;
  NSMutableDictionary *observers;
  uint64_t v23;
  NSMutableDictionary *runningDurationCounters;
  id v26;
  objc_super v27;

  v26 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HMMStandardCounterGroup;
  v17 = -[HMMStandardCounterGroup init](&v27, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_coreDataGroup, a3);
    objc_storeStrong((id *)&v18->_uptimeProvider, a7);
    objc_storeStrong((id *)&v18->_dateProvider, a4);
    objc_storeStrong((id *)&v18->_partitionProvider, a5);
    objc_storeStrong((id *)&v18->_coreDataStorage, a6);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    ephemeralContainers = v18->_ephemeralContainers;
    v18->_ephemeralContainers = (NSMutableDictionary *)v19;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v21 = objc_claimAutoreleasedReturnValue();
    observers = v18->_observers;
    v18->_observers = (NSMutableDictionary *)v21;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = objc_claimAutoreleasedReturnValue();
    runningDurationCounters = v18->_runningDurationCounters;
    v18->_runningDurationCounters = (NSMutableDictionary *)v23;

  }
  return v18;
}

- (void)addObserver:(id)a3 forCounter:(id)a4
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

- (id)observersForCounter:(id)a3
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

- (void)notifyObserversForCounter:(id)a3 previousCount:(int64_t)a4 newCount:(int64_t)a5
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
  -[HMMStandardCounterGroup observersForCounter:](self, "observersForCounter:", v8, 0);
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

- (void)incrementCounter:(id)a3
{
  -[HMMStandardCounterGroup incrementCounter:by:](self, "incrementCounter:by:", a3, 1);
}

- (void)incrementCounter:(id)a3 by:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[HMMStandardCounterGroup partitionProvider](self, "partitionProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDatePartition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMStandardCounterGroup incrementCounter:inDatePartition:by:](self, "incrementCounter:inDatePartition:by:", v6, v7, a4);

}

- (void)incrementCounter:(id)a3 inDatePartition:(id)a4 by:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  os_unfair_lock_s *p_lock;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  id v23;
  id v24;
  int64_t v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[HMMStandardCounterGroup coreDataStorage](self, "coreDataStorage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__HMMStandardCounterGroup_incrementCounter_inDatePartition_by___block_invoke;
  v22[3] = &unk_1E898A600;
  v22[4] = self;
  v11 = v8;
  v23 = v11;
  v12 = v9;
  v24 = v12;
  v25 = a5;
  objc_msgSend(v10, "executeWithManagedObjectContext:", v22);

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_ephemeralContainers, "allValues", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17++), "incrementCounter:by:", v11, a5);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)resumeDurationCounter:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMStandardCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[HMMUptimeProvider uptime](self->_uptimeProvider, "uptime");
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMStandardCounterGroup runningDurationCounters](self, "runningDurationCounters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)pauseDurationCounter:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  -[HMMStandardCounterGroup updateDurationCounter:](self, "updateDurationCounter:");
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMMStandardCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

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

  -[HMMStandardCounterGroup coreDataStorage](self, "coreDataStorage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "save");

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__777;
  v12 = __Block_byref_object_dispose__778;
  v13 = (id)MEMORY[0x1E0C9AA60];
  -[HMMStandardCounterGroup coreDataStorage](self, "coreDataStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__HMMStandardCounterGroup_datePartitions__block_invoke;
  v7[3] = &unk_1E898A628;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "executeWithManagedObjectContextAndWait:", v7);

  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (int64_t)valueForCounter:(id)a3 inDatePartition:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  int64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[HMMStandardCounterGroup coreDataStorage](self, "coreDataStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__HMMStandardCounterGroup_valueForCounter_inDatePartition___block_invoke;
  v13[3] = &unk_1E898A650;
  v13[4] = self;
  v9 = v6;
  v14 = v9;
  v10 = v7;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v8, "executeWithManagedObjectContextAndWait:", v13);

  v11 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)updateDurationCounter:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  os_unfair_lock_lock_with_options();
  -[HMMStandardCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    -[HMMStandardCounterGroup uptimeProvider](self, "uptimeProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uptime");
    v10 = v9;

    -[HMMStandardCounterGroup dateProvider](self, "dateProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMMStandardCounterGroup runningDurationCounters](self, "runningDurationCounters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

    os_unfair_lock_unlock(&self->_lock);
    -[HMMStandardCounterGroup addDuration:toCounter:endTime:](self, "addDuration:toCounter:endTime:", v15, v12, v10 - v7);

  }
  else
  {
    os_unfair_lock_unlock(&self->_lock);
  }

}

- (void)updateAllDurationCounters
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  -[HMMStandardCounterGroup uptimeProvider](self, "uptimeProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uptime");
  v5 = v4;

  -[HMMStandardCounterGroup dateProvider](self, "dateProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMMStandardCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copy");

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  -[HMMStandardCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14);
        -[HMMStandardCounterGroup runningDurationCounters](self, "runningDurationCounters", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v7, v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v12);
  }

  os_unfair_lock_unlock(&self->_lock);
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__HMMStandardCounterGroup_updateAllDurationCounters__block_invoke;
  v19[3] = &unk_1E898A678;
  v21 = v5;
  v19[4] = self;
  v20 = v18;
  v17 = v18;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v19);

}

- (void)addDuration:(double)a3 toCounter:(id)a4 endTime:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  void *v14;
  double v15;
  id v16;

  v16 = a4;
  v8 = a5;
  objc_msgSend(v8, "addTimeInterval:", -a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMStandardCounterGroup partitionProvider](self, "partitionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "datePartitionContainingDate:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "compare:", v11) == -1)
  {
    do
    {
      objc_msgSend(v8, "timeIntervalSinceDate:", v11);
      -[HMMStandardCounterGroup incrementCounter:inDatePartition:by:](self, "incrementCounter:inDatePartition:by:", v16, v11, llround(v13));
      v12 = v11;

      -[HMMStandardCounterGroup partitionProvider](self, "partitionProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "datePartitionWithOffset:fromDatePartition:", -1, v12);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v12;
    }
    while (objc_msgSend(v9, "compare:", v11) == -1);
  }
  else
  {
    v12 = v8;
  }
  objc_msgSend(v12, "timeIntervalSinceDate:", v9);
  -[HMMStandardCounterGroup incrementCounter:inDatePartition:by:](self, "incrementCounter:inDatePartition:by:", v16, v11, llround(v15));

}

- (double)durationForCounter:(id)a3 inDatePartition:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a4;
  v7 = a3;
  -[HMMStandardCounterGroup updateDurationCounter:](self, "updateDurationCounter:", v7);
  v8 = -[HMMStandardCounterGroup valueForCounter:inDatePartition:](self, "valueForCounter:inDatePartition:", v7, v6);

  return (double)v8;
}

- (id)countersInDatePartition:(id)a3
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
  -[HMMStandardCounterGroup updateAllDurationCounters](self, "updateAllDurationCounters");
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__777;
  v16 = __Block_byref_object_dispose__778;
  v17 = (id)MEMORY[0x1E0C9AA70];
  -[HMMStandardCounterGroup coreDataStorage](self, "coreDataStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __51__HMMStandardCounterGroup_countersInDatePartition___block_invoke;
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

- (int64_t)sumOfCountersInDatePartition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  -[HMMStandardCounterGroup updateAllDurationCounters](self, "updateAllDurationCounters");
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  -[HMMStandardCounterGroup coreDataStorage](self, "coreDataStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__HMMStandardCounterGroup_sumOfCountersInDatePartition___block_invoke;
  v9[3] = &unk_1E898A6A0;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "executeWithManagedObjectContextAndWait:", v9);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (BOOL)addEphemeralContainerWithName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  HMMStandardCounterGroup *v8;
  NSObject *v9;
  void *v10;
  HMMEphemeralCounterContainer *v11;
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
    v11 = objc_alloc_init(HMMEphemeralCounterContainer);
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

- (int64_t)valueForCounter:(id)a3 inEphemeralContainer:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;

  v6 = a3;
  v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_ephemeralContainers, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "valueForCounter:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "longLongValue");
  -[NSMutableDictionary objectForKeyedSubscript:](self->_ephemeralContainers, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "valueForCounter:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "longLongValue");

  os_unfair_lock_unlock(p_lock);
  return v13;
}

- (double)durationForCounter:(id)a3 inEphemeralContainer:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a4;
  v7 = a3;
  -[HMMStandardCounterGroup updateDurationCounter:](self, "updateDurationCounter:", v7);
  v8 = -[HMMStandardCounterGroup valueForCounter:inEphemeralContainer:](self, "valueForCounter:inEphemeralContainer:", v7, v6);

  return (double)v8;
}

- (id)countersInEphemeralContainer:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  -[HMMStandardCounterGroup updateAllDurationCounters](self, "updateAllDurationCounters");
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_ephemeralContainers, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "counters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (int64_t)sumOfCountersInEphemeralContainer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMMStandardCounterGroup updateAllDurationCounters](self, "updateAllDurationCounters");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMMStandardCounterGroup countersInEphemeralContainer:](self, "countersInEphemeralContainer:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v9 += objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "longLongValue");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HMMCounterDatePartitionProvider)partitionProvider
{
  return self->_partitionProvider;
}

- (HMMDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (HMMUptimeProvider)uptimeProvider
{
  return self->_uptimeProvider;
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

- (NSMutableDictionary)runningDurationCounters
{
  return self->_runningDurationCounters;
}

- (HMMCoreDataNamedGroup)coreDataGroup
{
  return self->_coreDataGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreDataGroup, 0);
  objc_storeStrong((id *)&self->_runningDurationCounters, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_ephemeralContainers, 0);
  objc_storeStrong((id *)&self->_coreDataStorage, 0);
  objc_storeStrong((id *)&self->_uptimeProvider, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
  objc_storeStrong((id *)&self->_partitionProvider, 0);
}

void __56__HMMStandardCounterGroup_sumOfCountersInDatePartition___block_invoke(uint64_t a1, void *a2)
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
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  id v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupCounter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(group == %@) && (date == %@)"), v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v28 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;
  if (v9)
  {
    v10 = (void *)MEMORY[0x1D17B78FC]();
    v11 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v23 = v3;
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "name");
      v22 = v10;
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v31 = v13;
      v32 = 2114;
      v33 = v15;
      v34 = 2114;
      v35 = v16;
      v36 = 2114;
      v37 = v9;
      _os_log_impl(&dword_1CD029000, v12, OS_LOG_TYPE_ERROR, "%{public}@Error getting all counters in group %{public}@ on date %{public}@: %{public}@", buf, 0x2Au);

      v10 = v22;
      v3 = v23;
    }

    objc_autoreleasePoolPop(v10);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v25;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v17);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v21++), "value");
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

}

void __51__HMMStandardCounterGroup_countersInDatePartition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t v35[128];
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupCounter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(group == %@) && (date == %@)"), v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v34 = 0;
  v28 = v3;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v34);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v34;
  if (v29)
  {
    v9 = (void *)MEMORY[0x1D17B78FC]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138544130;
      v37 = v12;
      v38 = 2114;
      v39 = v14;
      v40 = 2114;
      v41 = v15;
      v42 = 2114;
      v43 = v29;
      _os_log_impl(&dword_1CD029000, v11, OS_LOG_TYPE_ERROR, "%{public}@Error getting all counters in group %{public}@ on date %{public}@: %{public}@", buf, 0x2Au);

    }
    objc_autoreleasePoolPop(v9);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v17 = v8;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v22, "value"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "name");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKey:", v23, v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v19);
  }

  v25 = objc_msgSend(v16, "copy");
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v27 = *(void **)(v26 + 40);
  *(_QWORD *)(v26 + 40) = v25;

}

void __52__HMMStandardCounterGroup_updateAllDurationCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  double v6;
  double v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = *(double *)(a1 + 48);
  v8 = a2;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v5, "addDuration:toCounter:endTime:", v8, *(_QWORD *)(a1 + 40), v6 - v7);

}

void __59__HMMStandardCounterGroup_valueForCounter_inDatePartition___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupCounter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(group == %@) && (name == %@) && (date == %@)"), v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v24 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v24;
  if (!objc_msgSend(v8, "count"))
  {
    if (!v9)
      goto LABEL_11;
    v11 = (void *)MEMORY[0x1D17B78FC]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "name");
      v22 = v11;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544386;
      v26 = v14;
      v27 = 2114;
      v28 = v21;
      v29 = 2114;
      v30 = v16;
      v31 = 2114;
      v32 = v17;
      v33 = 2114;
      v34 = v9;
      _os_log_impl(&dword_1CD029000, v13, OS_LOG_TYPE_ERROR, "%{public}@Error getting counter %{public}@ in group %{public}@ on date %{public}@: %{public}@", buf, 0x34u);

      v11 = v22;
LABEL_9:

    }
LABEL_10:

    objc_autoreleasePoolPop(v11);
    goto LABEL_11;
  }
  if (objc_msgSend(v8, "count") != 1)
  {
    v11 = (void *)MEMORY[0x1D17B78FC]();
    v12 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v11;
      v18 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "name");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v26 = v14;
      v27 = 2114;
      v28 = v18;
      v11 = v23;
      v29 = 2114;
      v30 = v20;
      _os_log_impl(&dword_1CD029000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra counters returned for counter %{public}@ in group %{public}@", buf, 0x20u);

      goto LABEL_9;
    }
    goto LABEL_10;
  }
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v10, "value");

LABEL_11:
}

void __41__HMMStandardCounterGroup_datePartitions__block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupCounter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("group == %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  objc_msgSend(v4, "setResultType:", 2);
  objc_msgSend(v4, "setPropertiesToFetch:", &unk_1E8991F80);
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

void __63__HMMStandardCounterGroup_incrementCounter_inDatePartition_by___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  HMMCoreDataGroupCounter *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupCounter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("(group == %@) && (name == %@) && (date == %@)"), v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v7);

  v31 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v4, &v31);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v31;
  if (objc_msgSend(v8, "count"))
  {
    if (objc_msgSend(v8, "count") == 1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v10 = (HMMCoreDataGroupCounter *)objc_claimAutoreleasedReturnValue();
      v11 = -[HMMCoreDataGroupCounter value](v10, "value");
      v12 = *(_QWORD *)(a1 + 56) + v11;
      -[HMMCoreDataGroupCounter setValue:](v10, "setValue:", v12);
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v15 = v11;
      v16 = v12;
LABEL_12:
      objc_msgSend(v13, "notifyObserversForCounter:previousCount:newCount:", v14, v15, v16);

      goto LABEL_13;
    }
    v17 = (void *)MEMORY[0x1D17B78FC]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v17;
      v24 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "name");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v33 = v20;
      v34 = 2114;
      v35 = v24;
      v17 = v30;
      v36 = 2114;
      v37 = v26;
      _os_log_impl(&dword_1CD029000, v19, OS_LOG_TYPE_ERROR, "%{public}@Unexpected extra counters returned for counter %{public}@ in group %{public}@", buf, 0x20u);

      goto LABEL_9;
    }
  }
  else
  {
    if (!v9)
    {
      v10 = -[HMMCoreDataGroupCounter initWithContext:]([HMMCoreDataGroupCounter alloc], "initWithContext:", v3);
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMMCoreDataGroupCounter setGroup:](v10, "setGroup:", v27);

      -[HMMCoreDataGroupCounter setName:](v10, "setName:", *(_QWORD *)(a1 + 40));
      -[HMMCoreDataGroupCounter setDate:](v10, "setDate:", *(_QWORD *)(a1 + 48));
      -[HMMCoreDataGroupCounter setValue:](v10, "setValue:", *(_QWORD *)(a1 + 56));
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(a1 + 56);
      v15 = 0;
      goto LABEL_12;
    }
    v17 = (void *)MEMORY[0x1D17B78FC]();
    v18 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "coreDataGroup");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "name");
      v29 = v17;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138544386;
      v33 = v20;
      v34 = 2114;
      v35 = v28;
      v36 = 2114;
      v37 = v22;
      v38 = 2114;
      v39 = v23;
      v40 = 2114;
      v41 = v9;
      _os_log_impl(&dword_1CD029000, v19, OS_LOG_TYPE_ERROR, "%{public}@Error getting counter %{public}@ in group %{public}@ on date %{public}@: %{public}@", buf, 0x34u);

      v17 = v29;
LABEL_9:

    }
  }

  objc_autoreleasePoolPop(v17);
LABEL_13:

}

+ (id)groupFromSpecifier:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[HMMUptimeProvider sharedInstance](HMMUptimeProvider, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "groupFromSpecifier:dateProvider:partitionProvider:coreDataStorage:uptimeProvider:", v13, v12, v11, v10, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)groupFromSpecifier:(id)a3 dateProvider:(id)a4 partitionProvider:(id)a5 coreDataStorage:(id)a6 uptimeProvider:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  HMMStandardCounterGroup *v19;
  HMMStandardCounterGroup *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__777;
  v36 = __Block_byref_object_dispose__778;
  v37 = 0;
  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __108__HMMStandardCounterGroup_groupFromSpecifier_dateProvider_partitionProvider_coreDataStorage_uptimeProvider___block_invoke;
  v29 = &unk_1E898A628;
  v31 = &v32;
  v17 = v12;
  v30 = v17;
  v18 = objc_msgSend(v15, "executeWithManagedObjectContextAndWait:", &v26);
  if (v33[5])
  {
    v19 = [HMMStandardCounterGroup alloc];
    v20 = -[HMMStandardCounterGroup initWithCoreDataGroup:dateProvider:partitionProvider:coreDataStorage:uptimeProvider:](v19, "initWithCoreDataGroup:dateProvider:partitionProvider:coreDataStorage:uptimeProvider:", v33[5], v13, v14, v15, v16, v26, v27, v28, v29);
  }
  else
  {
    v21 = (void *)MEMORY[0x1D17B78FC](v18);
    v22 = a1;
    HMFGetOSLogHandle();
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v39 = v24;
      _os_log_impl(&dword_1CD029000, v23, OS_LOG_TYPE_ERROR, "%{public}@Can't create counter group due to failure to retrieve database group", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v21);
    v20 = 0;
  }

  _Block_object_dispose(&v32, 8);
  return v20;
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
  objc_msgSend(a1, "deleteCountersUsingPredicate:coreDataStorage:", v8, v7);

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
  objc_msgSend(a1, "deleteCountersUsingPredicate:coreDataStorage:", v8, v7);

}

+ (void)deleteCountersUsingPredicate:(id)a3 coreDataStorage:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__HMMStandardCounterGroup_deleteCountersUsingPredicate_coreDataStorage___block_invoke;
  v8[3] = &unk_1E898A6C8;
  v9 = v6;
  v10 = a1;
  v7 = v6;
  objc_msgSend(a4, "executeWithManagedObjectContextAndWait:", v8);

}

void __72__HMMStandardCounterGroup_deleteCountersUsingPredicate_coreDataStorage___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(MEMORY[0x1E0C97B48], "fetchRequestWithEntityName:", CFSTR("GroupCounter"));
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
      _os_log_impl(&dword_1CD029000, v10, OS_LOG_TYPE_ERROR, "%{public}@Error deleting counters where %{public}@: %{public}@", buf, 0x20u);

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

void __108__HMMStandardCounterGroup_groupFromSpecifier_dateProvider_partitionProvider_coreDataStorage_uptimeProvider___block_invoke(uint64_t a1, uint64_t a2)
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
