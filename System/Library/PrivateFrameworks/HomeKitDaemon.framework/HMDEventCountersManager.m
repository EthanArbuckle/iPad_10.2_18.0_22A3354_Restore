@implementation HMDEventCountersManager

- (void)incrementEventCounterForEventName:(id)a3 requestGroup:(id)a4 withValue:(unint64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  -[HMDEventCountersManager counterGroupForName:](self, "counterGroupForName:", a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "incrementEventCounterForEventName:withValue:", v8, a5);

}

- (double)saveInterval
{
  return self->_saveInterval;
}

- (id)fetchEventCountersForRequestGroup:(id)a3
{
  void *v3;
  void *v4;

  -[HMDEventCountersManager counterGroupForName:](self, "counterGroupForName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventCounters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HMDEventCountersStoring)counterStorage
{
  return self->_counterStorage;
}

- (void)resetEventCountersForRequestGroup:(id)a3
{
  id v3;

  -[HMDEventCountersManager counterGroupForName:](self, "counterGroupForName:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resetEventCounters");

}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)_save
{
  NSObject *workQueue;
  _QWORD block[5];

  os_unfair_lock_assert_owner(&self->_lock);
  self->_pendingSave = 1;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HMDEventCountersManager__save__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_fetchAllEventCounters
{
  void *v3;
  NSMutableDictionary *counterGroups;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  counterGroups = self->_counterGroups;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__HMDEventCountersManager__fetchAllEventCounters__block_invoke;
  v8[3] = &unk_24E795138;
  v9 = v3;
  v5 = v3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](counterGroups, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (unint64_t)fetchEventCounterForEventName:(id)a3 requestGroup:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;

  v6 = a3;
  -[HMDEventCountersManager counterGroupForName:](self, "counterGroupForName:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fetchEventCounterForEventName:", v6);

  return v8;
}

- (HMDEventCountersManager)init
{
  HMDPersistentStore *v3;
  HMDEventCountersPersistentStore *v4;
  HMDEventCountersManager *v5;

  v3 = objc_alloc_init(HMDPersistentStore);
  v4 = -[HMDEventCountersPersistentStore initWithPersistentStore:]([HMDEventCountersPersistentStore alloc], "initWithPersistentStore:", v3);
  v5 = -[HMDEventCountersManager initWithEventCountersStorage:bridgedCountersManager:bridgedDateProvider:](self, "initWithEventCountersStorage:bridgedCountersManager:bridgedDateProvider:", v4, 0, 0);

  if (v5)
    objc_storeStrong((id *)&v5->_persistentStore, v3);

  return v5;
}

- (HMDEventCountersManager)initWithEventCountersStorage:(id)a3 bridgedCountersManager:(id)a4 bridgedDateProvider:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  HMDEventCountersManager *v17;

  v8 = (void *)MEMORY[0x24BE3F248];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "sharedPreferences");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferenceForKey:", CFSTR("counterArchivePeriod"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "numberValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "unsignedIntegerValue");

  objc_msgSend(MEMORY[0x24BE4F1D8], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HMDEventCountersManager initWithEventCountersStorage:bridgedCountersManager:bridgedDateProvider:saveInterval:uptimeProvider:](self, "initWithEventCountersStorage:bridgedCountersManager:bridgedDateProvider:saveInterval:uptimeProvider:", v11, v10, v9, v16, (double)v15);

  return v17;
}

- (HMDEventCountersManager)initWithEventCountersStorage:(id)a3 bridgedCountersManager:(id)a4 bridgedDateProvider:(id)a5 saveInterval:(double)a6 uptimeProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMDEventCountersManager *v17;
  HMDEventCountersManager *v18;
  double v19;
  id v20;
  const char *v21;
  NSObject *v22;
  NSObject *v23;
  dispatch_queue_t v24;
  OS_dispatch_queue *workQueue;
  void *v26;
  HMDEventCountersManager *v28;
  SEL v29;
  id v30;
  id v31;
  objc_super v32;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  if (v13)
  {
    if (!v14)
      goto LABEL_6;
    _HMFPreconditionFailure();
  }
  if (!v14 || !v15)
  {
    v28 = (HMDEventCountersManager *)_HMFPreconditionFailure();
    return -[HMDEventCountersManager initWithBridgedCountersManager:bridgedDateProvider:](v28, v29, v30, v31);
  }
LABEL_6:
  v32.receiver = self;
  v32.super_class = (Class)HMDEventCountersManager;
  v17 = -[HMDEventCountersManager init](&v32, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_counterStorage, a3);
    v18->_saveInterval = a6;
    objc_storeStrong((id *)&v18->_uptimeProvider, a7);
    objc_storeStrong((id *)&v18->_bridgedCountersManager, a4);
    objc_storeStrong((id *)&v18->_bridgedDateProvider, a5);
    objc_msgSend(v16, "uptime");
    v18->_lastSaveTime = v19;
    v18->_pendingSave = 0;
    HMDispatchQueueNameString();
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const char *)objc_msgSend(v20, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v22, QOS_CLASS_BACKGROUND, 0);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = dispatch_queue_create(v21, v23);
    workQueue = v18->_workQueue;
    v18->_workQueue = (OS_dispatch_queue *)v24;

    if (v13)
      -[HMDEventCountersManager unarchiveEventCounters](v18, "unarchiveEventCounters");
    else
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v18->_counterGroups, v26);

  }
  return v18;
}

- (HMDEventCountersManager)initWithBridgedCountersManager:(id)a3 bridgedDateProvider:(id)a4
{
  return -[HMDEventCountersManager initWithEventCountersStorage:bridgedCountersManager:bridgedDateProvider:](self, "initWithEventCountersStorage:bridgedCountersManager:bridgedDateProvider:", 0, a3, a4);
}

- (id)counterGroupForName:(id)a3
{
  void *v4;
  void *v5;

  +[HMDEventCounterGroupNameSpecifier specifierWithGroupName:](HMDEventCounterGroupNameSpecifier, "specifierWithGroupName:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventCountersManager counterGroupForSpecifier:](self, "counterGroupForSpecifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)counterGroupForSpecifier:(id)a3
{
  id v4;
  HMDEventCounterGroupBridge *v5;
  void *v6;
  char v7;
  uint64_t v8;
  id v9;
  HMMCountersManager *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  void *v17;
  HMDEventCounterGroupBridge *v18;
  void *v19;
  uint64_t v20;
  id v21;
  HMMCountersManager *bridgedCountersManager;
  void *v23;
  id *v24;
  id v25;
  HMMCountersManager *v26;
  void *v27;
  id v28;
  HMDEventCounterGroupBridge *v29;
  id v30;
  HMMCountersManager *v31;
  void *v32;
  void *v33;
  id v34;
  HMDEventCounterGroupBridge *v35;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  id v42;
  _QWORD aBlock[6];
  _QWORD v44[6];
  _QWORD v45[6];
  _QWORD v46[5];
  id v47;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_counterGroups, "objectForKeyedSubscript:", v4);
  v5 = (HMDEventCounterGroupBridge *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    +[HMDEventCountersManager allowedSpecifierClasses](HMDEventCountersManager, "allowedSpecifierClasses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", objc_opt_class());

    if ((v7 & 1) == 0)
    {
      v37 = (void *)MEMORY[0x24BDBCE88];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Specifier's class must be registered in the allowedSpecifierClasses in HMDEventCountersManager: %@"), objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v38, 0);
      v39 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v39);
    }
    if (self->_bridgedCountersManager)
    {
      v8 = objc_opt_class();
      if (v8 == objc_opt_class())
      {
        v21 = v4;
        bridgedCountersManager = self->_bridgedCountersManager;
        objc_msgSend(v21, "groupName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMMCountersManager counterGroupForName:](bridgedCountersManager, "counterGroupForName:", v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v46[0] = MEMORY[0x24BDAC760];
        v46[1] = 3221225472;
        v46[2] = __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke;
        v46[3] = &unk_24E7950E8;
        v46[4] = self;
        v47 = v21;
        v17 = _Block_copy(v46);
        v5 = -[HMDEventCounterGroupBridge initWithContext:bridgedCounterGroup:dateProvider:statisticsGroupBlock:]([HMDEventCounterGroupBridge alloc], "initWithContext:bridgedCounterGroup:dateProvider:statisticsGroupBlock:", self, v14, self->_bridgedDateProvider, v17);
        v24 = &v47;
      }
      else
      {
        if (v8 == objc_opt_class())
        {
          v25 = v4;
          v26 = self->_bridgedCountersManager;
          objc_msgSend(v25, "groupName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMCountersManager counterGroupForName:](v26, "counterGroupForName:", v27);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v45[0] = MEMORY[0x24BDAC760];
          v45[1] = 3221225472;
          v45[2] = __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_2;
          v45[3] = &unk_24E7950E8;
          v15 = v45;
          v45[4] = self;
          v28 = v25;
          v45[5] = v28;
          v17 = _Block_copy(v45);
          v29 = [HMDEventCounterGroupBridge alloc];
          objc_msgSend(v28, "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[HMDEventCounterGroupBridge initWithContext:bridgedCounterGroup:groupDate:statisticsGroupBlock:](v29, "initWithContext:bridgedCounterGroup:groupDate:statisticsGroupBlock:", self, v14, v19, v17);
        }
        else if (v8 == objc_opt_class())
        {
          v30 = v4;
          v31 = self->_bridgedCountersManager;
          objc_msgSend(v30, "homeUUID");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "groupName");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMCountersManager counterGroupForHomeUUID:groupName:](v31, "counterGroupForHomeUUID:groupName:", v32, v33);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          v44[0] = MEMORY[0x24BDAC760];
          v44[1] = 3221225472;
          v44[2] = __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_3;
          v44[3] = &unk_24E7950E8;
          v15 = v44;
          v44[4] = self;
          v34 = v30;
          v44[5] = v34;
          v17 = _Block_copy(v44);
          v35 = [HMDEventCounterGroupBridge alloc];
          objc_msgSend(v34, "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[HMDEventCounterGroupBridge initWithContext:bridgedCounterGroup:groupDate:statisticsGroupBlock:](v35, "initWithContext:bridgedCounterGroup:groupDate:statisticsGroupBlock:", self, v14, v19, v17);
        }
        else
        {
          if (v8 != objc_opt_class())
          {
            v40 = (void *)MEMORY[0x24BDBCE88];
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Specifier is allowed class %@, but not handled with bridged counters"), objc_opt_class());
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB8], v41, 0);
            v42 = (id)objc_claimAutoreleasedReturnValue();

            objc_exception_throw(v42);
          }
          v9 = v4;
          v10 = self->_bridgedCountersManager;
          objc_msgSend(v9, "accessoryUUID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "homeUUID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "groupName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMMCountersManager counterGroupForAccessoryUUID:homeUUID:groupName:](v10, "counterGroupForAccessoryUUID:homeUUID:groupName:", v11, v12, v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          aBlock[0] = MEMORY[0x24BDAC760];
          aBlock[1] = 3221225472;
          aBlock[2] = __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_4;
          aBlock[3] = &unk_24E7950E8;
          v15 = aBlock;
          aBlock[4] = self;
          v16 = v9;
          aBlock[5] = v16;
          v17 = _Block_copy(aBlock);
          v18 = [HMDEventCounterGroupBridge alloc];
          objc_msgSend(v16, "date");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = -[HMDEventCounterGroupBridge initWithContext:bridgedCounterGroup:groupDate:statisticsGroupBlock:](v18, "initWithContext:bridgedCounterGroup:groupDate:statisticsGroupBlock:", self, v14, v19, v17);
        }
        v5 = (HMDEventCounterGroupBridge *)v20;
        v24 = (id *)(v15 + 5);

      }
    }
    else
    {
      v5 = -[HMDEventCounterGroup initWithContext:serializedEventCounters:uptimeProvider:]([HMDEventCounterGroup alloc], "initWithContext:serializedEventCounters:uptimeProvider:", self, 0, self->_uptimeProvider);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_counterGroups, "setObject:forKeyedSubscript:", v5, v4);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (id)counterGroupsForPredicate:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSMutableDictionary *counterGroups;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *, void *);
  void *v15;
  id v16;
  id v17;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  counterGroups = self->_counterGroups;
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __53__HMDEventCountersManager_counterGroupsForPredicate___block_invoke;
  v15 = &unk_24E795110;
  v8 = v4;
  v17 = v8;
  v9 = v6;
  v16 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](counterGroups, "enumerateKeysAndObjectsUsingBlock:", &v12);
  v10 = (void *)objc_msgSend(v9, "copy", v12, v13, v14, v15);

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)removeCounterGroupForName:(id)a3
{
  id v4;

  +[HMDEventCounterGroupNameSpecifier specifierWithGroupName:](HMDEventCounterGroupNameSpecifier, "specifierWithGroupName:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDEventCountersManager removeCounterGroupForSpecifier:](self, "removeCounterGroupForSpecifier:", v4);

}

- (void)removeCounterGroupForSpecifier:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDEventCountersManager _removeCounterGroupForSpecifier:](self, "_removeCounterGroupForSpecifier:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)removeCounterGroupsBasedOnPredicate:(id)a3
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (unsigned int (**)(id, _QWORD))a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allKeys](self->_counterGroups, "allKeys");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        if (v4[2](v4, v9))
          -[HMDEventCountersManager _removeCounterGroupForSpecifier:](self, "_removeCounterGroupForSpecifier:", v9, (_QWORD)v10);
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_removeCounterGroupForSpecifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  -[NSMutableDictionary removeObjectForKey:](self->_counterGroups, "removeObjectForKey:", v5);

}

- (void)addObserver:(id)a3 forEventName:(id)a4 requestGroup:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[HMDEventCountersManager counterGroupForName:](self, "counterGroupForName:", a5);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:forEventName:", v9, v8);

}

- (void)incrementEventCounterForEventName:(id)a3 requestGroup:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[HMDEventCountersManager counterGroupForName:](self, "counterGroupForName:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incrementEventCounterForEventName:", v6);

}

- (unint64_t)fetchAggregatedEventCountersForRequestGroup:(id)a3
{
  void *v3;
  unint64_t v4;

  -[HMDEventCountersManager counterGroupForName:](self, "counterGroupForName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "summedEventCounters");

  return v4;
}

- (id)fetchAllEventCounters
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  id v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDEventCountersManager _fetchAllEventCounters](self, "_fetchAllEventCounters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (void)resetAllEventCounters
{
  os_unfair_lock_s *p_lock;
  void *v4;
  id v5;
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
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  self->_pendingSave = 1;
  -[NSMutableDictionary allValues](self->_counterGroups, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "resetEventCounters", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  os_unfair_lock_lock_with_options();
  -[HMDEventCountersManager _save](self, "_save");
  os_unfair_lock_unlock(p_lock);

}

- (void)forceSave
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_pendingSave)
    -[HMDEventCountersManager _save](self, "_save");
  os_unfair_lock_unlock(p_lock);
}

- (void)counterChanged
{
  os_unfair_lock_s *p_lock;
  double v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!self->_pendingSave)
  {
    -[HMMUptimeProvider uptime](self->_uptimeProvider, "uptime");
    if (v4 - self->_lastSaveTime >= self->_saveInterval)
      -[HMDEventCountersManager _save](self, "_save");
  }
  os_unfair_lock_unlock(p_lock);
}

- (id)unarchiveEventCounters
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  HMDEventCountersManager *v11;
  NSObject *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  HMDEventCountersManager *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDEventCountersManager counterStorage](self, "counterStorage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unarchive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __49__HMDEventCountersManager_unarchiveEventCounters__block_invoke;
    v15[3] = &unk_24E795160;
    v16 = v3;
    v17 = self;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
  v10 = (void *)MEMORY[0x227676638](v6, v7, v8, v9);
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v19 = v13;
    v20 = 2112;
    v21 = v3;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_DEBUG, "%{public}@Final restored event counters: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v10);

  return v3;
}

- (HMMUptimeProvider)uptimeProvider
{
  return self->_uptimeProvider;
}

- (HMMCountersManager)bridgedCountersManager
{
  return self->_bridgedCountersManager;
}

- (HMMDateProvider)bridgedDateProvider
{
  return self->_bridgedDateProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bridgedDateProvider, 0);
  objc_storeStrong((id *)&self->_bridgedCountersManager, 0);
  objc_storeStrong((id *)&self->_uptimeProvider, 0);
  objc_storeStrong((id *)&self->_counterStorage, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_counterGroups, 0);
  objc_storeStrong((id *)&self->_persistentStore, 0);
}

void __49__HMDEventCountersManager_unarchiveEventCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HMDEventCounterGroup *v7;
  void *v8;
  HMDEventCounterGroup *v9;
  id v10;

  v5 = a3;
  v6 = a2;
  v7 = [HMDEventCounterGroup alloc];
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v8, "uptimeProvider");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDEventCounterGroup initWithContext:serializedEventCounters:uptimeProvider:](v7, "initWithContext:serializedEventCounters:uptimeProvider:", v8, v5, v10);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v6);
}

void __32__HMDEventCountersManager__save__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  os_unfair_lock_s *v8;
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "bridgedCountersManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "bridgedCountersManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "save");
  }
  else
  {
    objc_msgSend(v3, "counterStorage");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "fetchAllEventCounters");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (v5)
      v7 = v5;
    else
      v7 = MEMORY[0x24BDBD1B8];
    objc_msgSend(v4, "archiveDictionary:", v7);

  }
  v8 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 36);
  os_unfair_lock_lock_with_options();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "uptime");
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = v9;
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  os_unfair_lock_unlock(v8);
}

void __49__HMDEventCountersManager__fetchAllEventCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(v5, "eventCounters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "eventCounters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __53__HMDEventCountersManager_counterGroupsForPredicate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v6);

}

id __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 40), "groupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "statisticsGroupForName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 40), "groupName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "statisticsGroupForName:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 40), "homeUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "groupName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statisticsGroupForHomeUUID:groupName:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __52__HMDEventCountersManager_counterGroupForSpecifier___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 72);
  objc_msgSend(*(id *)(a1 + 40), "accessoryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "groupName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statisticsGroupForAccessoryUUID:homeUUID:groupName:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (NSSet)allowedSpecifierClasses
{
  if (allowedSpecifierClasses__hmf_once_t2 != -1)
    dispatch_once(&allowedSpecifierClasses__hmf_once_t2, &__block_literal_global_222334);
  return (NSSet *)(id)allowedSpecifierClasses__hmf_once_v3;
}

void __50__HMDEventCountersManager_allowedSpecifierClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)allowedSpecifierClasses__hmf_once_v3;
  allowedSpecifierClasses__hmf_once_v3 = v2;

}

@end
