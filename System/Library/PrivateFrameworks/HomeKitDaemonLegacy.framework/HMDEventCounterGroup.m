@implementation HMDEventCounterGroup

- (void)incrementEventCounterForEventName:(id)a3 withValue:(unint64_t)a4
{
  id v5;

  -[HMDEventCounterGroup _incrementEventCounterForEventName:withValue:](self, "_incrementEventCounterForEventName:withValue:", a3, a4);
  -[HMDEventCounterGroup context](self, "context");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "counterChanged");

}

- (HMDEventCounterContext)context
{
  return (HMDEventCounterContext *)objc_loadWeakRetained((id *)&self->_context);
}

- (void)_incrementEventCounterForEventName:(id)a3 withValue:(unint64_t)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  unint64_t v17;
  uint64_t v18;

  v6 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDEventCounterGroup _getOrCreateEventCounterForEventName:](self, "_getOrCreateEventCounterForEventName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCount:", objc_msgSend(v8, "count") + a4);
  objc_msgSend(v8, "observers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_msgSend(v8, "count");
    v11 = objc_msgSend(v8, "count");
    WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    objc_msgSend(WeakRetained, "workQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__HMDEventCounterGroup__incrementEventCounterForEventName_withValue___block_invoke;
    v14[3] = &unk_1E89B4728;
    v15 = v9;
    v16 = v6;
    v17 = v10 - a4;
    v18 = v11;
    dispatch_async(v13, v14);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)_getOrCreateEventCounterForEventName:(id)a3
{
  id v4;
  HMDEventCounter *v5;

  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableEventCounters, "objectForKeyedSubscript:", v4);
  v5 = (HMDEventCounter *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(HMDEventCounter);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableEventCounters, "setObject:forKeyedSubscript:", v5, v4);
  }

  return v5;
}

- (void)incrementEventCounterForEventName:(id)a3
{
  -[HMDEventCounterGroup incrementEventCounterForEventName:withValue:](self, "incrementEventCounterForEventName:withValue:", a3, 1);
}

- (HMDEventCounterGroup)initWithContext:(id)a3 serializedEventCounters:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMDEventCounterGroup *v10;

  v6 = (void *)MEMORY[0x1E0D334D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMDEventCounterGroup initWithContext:serializedEventCounters:uptimeProvider:](self, "initWithContext:serializedEventCounters:uptimeProvider:", v8, v7, v9);

  return v10;
}

- (HMDEventCounterGroup)initWithContext:(id)a3 serializedEventCounters:(id)a4 uptimeProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDEventCounterGroup *v11;
  HMDEventCounterGroup *v12;
  uint64_t v13;
  NSMutableDictionary *runningDurationCounters;
  uint64_t v15;
  NSMutableDictionary *mutableEventCounters;
  NSMutableDictionary *v17;
  NSMutableDictionary *v18;
  _QWORD v20[4];
  HMDEventCounterGroup *v21;
  objc_super v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v22.receiver = self;
  v22.super_class = (Class)HMDEventCounterGroup;
  v11 = -[HMDEventCounterGroup init](&v22, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_context, v8);
    objc_storeStrong((id *)&v12->_uptimeProvider, a5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    runningDurationCounters = v12->_runningDurationCounters;
    v12->_runningDurationCounters = (NSMutableDictionary *)v13;

    if (v9)
    {
      v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v9, "count"));
      mutableEventCounters = v12->_mutableEventCounters;
      v12->_mutableEventCounters = (NSMutableDictionary *)v15;

      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __79__HMDEventCounterGroup_initWithContext_serializedEventCounters_uptimeProvider___block_invoke;
      v20[3] = &unk_1E89AFD40;
      v21 = v12;
      objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v20);
      v17 = (NSMutableDictionary *)v21;
    }
    else
    {
      v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = v12->_mutableEventCounters;
      v12->_mutableEventCounters = v18;
    }

  }
  return v12;
}

- (void)addObserver:(id)a3 forEventName:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDEventCounterGroup _getOrCreateEventCounterForEventName:](self, "_getOrCreateEventCounterForEventName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v8, "observers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithCapacity:", objc_msgSend(v10, "count") + 1);

  objc_msgSend(v8, "observers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v8, "observers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObjectsFromArray:", v13);

  }
  objc_msgSend(v11, "addObject:", v15);
  v14 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v8, "setObservers:", v14);

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
  void *v10;
  id v11;

  v11 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDEventCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    -[HMDEventCounterGroup uptimeProvider](self, "uptimeProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uptime");
    objc_msgSend(v7, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventCounterGroup runningDurationCounters](self, "runningDurationCounters");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)pauseDurationCounter:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v5;
  id v6;

  v6 = a3;
  -[HMDEventCounterGroup updateDurationCounter:](self, "updateDurationCounter:");
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDEventCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

  os_unfair_lock_unlock(p_lock);
}

- (void)addValue:(unint64_t)a3 toStatisticsName:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id WeakRetained;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;
  unint64_t v17;

  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[HMDEventCounterGroup _getOrCreateEventCounterForEventName:](self, "_getOrCreateEventCounterForEventName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") < a3)
  {
    v8 = objc_msgSend(v7, "count");
    objc_msgSend(v7, "setCount:", a3);
    objc_msgSend(v7, "observers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_context);
      objc_msgSend(WeakRetained, "workQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __50__HMDEventCounterGroup_addValue_toStatisticsName___block_invoke;
      v13[3] = &unk_1E89B4728;
      v14 = v9;
      v15 = v6;
      v16 = v8;
      v17 = a3;
      dispatch_async(v11, v13);

    }
  }

  os_unfair_lock_unlock(&self->_lock);
  -[HMDEventCounterGroup context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "counterChanged");

}

- (unint64_t)fetchEventCounterForEventName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  unint64_t v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableEventCounters, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  os_unfair_lock_unlock(p_lock);
  return v7;
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
  id v13;

  v13 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDEventCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    -[HMDEventCounterGroup uptimeProvider](self, "uptimeProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uptime");
    v10 = v9;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDEventCounterGroup runningDurationCounters](self, "runningDurationCounters");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

    os_unfair_lock_unlock(&self->_lock);
    -[HMDEventCounterGroup addDuration:toCounter:](self, "addDuration:toCounter:", v13, v10 - v7);
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[6];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HMDEventCounterGroup uptimeProvider](self, "uptimeProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uptime");
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  -[HMDEventCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMDEventCounterGroup runningDurationCounters](self, "runningDurationCounters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v13);
        -[HMDEventCounterGroup runningDurationCounters](self, "runningDurationCounters");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v6, v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }

  os_unfair_lock_unlock(&self->_lock);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __49__HMDEventCounterGroup_updateAllDurationCounters__block_invoke;
  v16[3] = &unk_1E89AFD68;
  v16[4] = self;
  *(double *)&v16[5] = v5;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);

}

- (void)addDuration:(double)a3 toCounter:(id)a4
{
  -[HMDEventCounterGroup _incrementEventCounterForEventName:withValue:](self, "_incrementEventCounterForEventName:withValue:", a4, llround(a3));
}

- (double)durationForCounter:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  -[HMDEventCounterGroup updateDurationCounter:](self, "updateDurationCounter:", v4);
  v5 = -[HMDEventCounterGroup fetchEventCounterForEventName:](self, "fetchEventCounterForEventName:", v4);

  return (double)v5;
}

- (NSDictionary)eventCounters
{
  os_unfair_lock_s *p_lock;
  id v4;
  NSMutableDictionary *mutableEventCounters;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  -[HMDEventCounterGroup updateAllDurationCounters](self, "updateAllDurationCounters");
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  mutableEventCounters = self->_mutableEventCounters;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __37__HMDEventCounterGroup_eventCounters__block_invoke;
  v9[3] = &unk_1E89AFD90;
  v6 = v4;
  v10 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableEventCounters, "enumerateKeysAndObjectsUsingBlock:", v9);
  if (objc_msgSend(v6, "count"))
    v7 = (void *)objc_msgSend(v6, "copy");
  else
    v7 = 0;

  os_unfair_lock_unlock(p_lock);
  return (NSDictionary *)v7;
}

- (unint64_t)summedEventCounters
{
  os_unfair_lock_s *p_lock;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HMDEventCounterGroup updateAllDurationCounters](self, "updateAllDurationCounters");
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allValues](self->_mutableEventCounters, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "count");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (unint64_t)maxCounterName:(id *)a3
{
  NSMutableDictionary *mutableEventCounters;
  unint64_t v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  -[HMDEventCounterGroup updateAllDurationCounters](self, "updateAllDurationCounters");
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__82623;
  v17 = __Block_byref_object_dispose__82624;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  os_unfair_lock_lock_with_options();
  mutableEventCounters = self->_mutableEventCounters;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__HMDEventCounterGroup_maxCounterName___block_invoke;
  v8[3] = &unk_1E89AFDB8;
  v8[4] = &v9;
  v8[5] = &v13;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](mutableEventCounters, "enumerateKeysAndObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(&self->_lock);
  if (a3)
    *a3 = objc_retainAutorelease((id)v14[5]);
  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (BOOL)_resetEventCounterForEventName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  BOOL v11;
  void *v12;
  HMDEventCounterGroup *v13;
  NSObject *v14;
  void *v15;
  _QWORD block[4];
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_mutableEventCounters, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && (v7 = objc_msgSend(v5, "count"), objc_msgSend(v6, "setCount:", 0), v7))
  {
    objc_msgSend(v6, "observers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_context);
      objc_msgSend(WeakRetained, "workQueue");
      v10 = objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __55__HMDEventCounterGroup__resetEventCounterForEventName___block_invoke;
        block[3] = &unk_1E89BE2F0;
        v18 = v8;
        v19 = v4;
        v20 = v7;
        dispatch_async(v10, block);

      }
      else
      {
        v12 = (void *)MEMORY[0x1D17BA0A0]();
        v13 = self;
        HMFGetOSLogHandle();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v15;
          _os_log_impl(&dword_1CD062000, v14, OS_LOG_TYPE_ERROR, "%{public}@Can't call observers; context has been deallocated",
            buf,
            0xCu);

        }
        objc_autoreleasePoolPop(v12);
      }

    }
    else
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_mutableEventCounters, "setObject:forKeyedSubscript:", 0, v4);
    }

    v11 = 1;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)resetEventCounters
{
  os_unfair_lock_s *p_lock;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMutableDictionary allKeys](self->_mutableEventCounters, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v5 |= -[HMDEventCounterGroup _resetEventCounterForEventName:](self, "_resetEventCounterForEventName:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[HMDEventCounterGroup uptimeProvider](self, "uptimeProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uptime");
  objc_msgSend(v9, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allKeys](self->_runningDurationCounters, "allKeys", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v12);
        v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15);
        -[HMDEventCounterGroup runningDurationCounters](self, "runningDurationCounters");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v11, v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(p_lock);
  if ((v5 & 1) != 0)
  {
    -[HMDEventCounterGroup context](self, "context");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "counterChanged");

  }
}

- (void)forceSave
{
  id v2;

  -[HMDEventCounterGroup context](self, "context");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceSave");

}

- (HMMUptimeProvider)uptimeProvider
{
  return self->_uptimeProvider;
}

- (NSMutableDictionary)mutableEventCounters
{
  return self->_mutableEventCounters;
}

- (NSMutableDictionary)runningDurationCounters
{
  return self->_runningDurationCounters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningDurationCounters, 0);
  objc_storeStrong((id *)&self->_mutableEventCounters, 0);
  objc_storeStrong((id *)&self->_uptimeProvider, 0);
  objc_destroyWeak((id *)&self->_context);
}

void __55__HMDEventCounterGroup__resetEventCounterForEventName___block_invoke(uint64_t a1)
{
  notifyObservers(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), 0);
}

void __39__HMDEventCounterGroup_maxCounterName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unint64_t v6;
  unint64_t v7;
  id v8;

  v8 = a2;
  v6 = objc_msgSend(a3, "count");
  if (v6 > *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v7;
  }

}

void __37__HMDEventCounterGroup_eventCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setValue:forKey:", v7, v8);

  }
}

void __49__HMDEventCounterGroup_updateAllDurationCounters__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  double v5;
  double v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(double *)(a1 + 40);
  v7 = a2;
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v4, "addDuration:toCounter:", v7, v5 - v6);

}

void __50__HMDEventCounterGroup_addValue_toStatisticsName___block_invoke(uint64_t a1)
{
  notifyObservers(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __69__HMDEventCounterGroup__incrementEventCounterForEventName_withValue___block_invoke(uint64_t a1)
{
  notifyObservers(*(void **)(a1 + 32), *(void **)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __79__HMDEventCounterGroup_initWithContext_serializedEventCounters_uptimeProvider___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  HMDEventCounter *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "unsignedIntegerValue"))
  {
    v6 = -[HMDEventCounter initWithCount:]([HMDEventCounter alloc], "initWithCount:", objc_msgSend(v5, "unsignedIntegerValue"));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setObject:forKeyedSubscript:", v6, v7);

  }
}

@end
