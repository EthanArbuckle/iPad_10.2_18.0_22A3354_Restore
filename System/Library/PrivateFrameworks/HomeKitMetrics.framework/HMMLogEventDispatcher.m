@implementation HMMLogEventDispatcher

- (void)submitLogEvent:(id)a3 error:(id)a4
{
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setError:", a4);
  -[HMMLogEventDispatcher submitLogEvent:](self, "submitLogEvent:", v6);

}

uint64_t __40__HMMLogEventDispatcher_submitLogEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processAndSubmitLogEvents");
}

- (id)_getOrCreateObserversForEventClass:(Class)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSMapTable objectForKey:](self->_observersByClass, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_observersByClass, "setObject:forKey:", v5, a3);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[NSMapTable keyEnumerator](self->_observersByProtocol, "keyEnumerator", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          if (-[objc_class conformsToProtocol:](a3, "conformsToProtocol:", v11))
          {
            -[NSMapTable objectForKey:](self->_observersByProtocol, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  v13 = v5;

  return v13;
}

- (void)submitLogEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  HMMLogEventDispatcher *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  dispatch_block_t v15;
  _QWORD block[5];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "markEndTime");
  -[HMMLogEventDispatcher dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5 || objc_msgSend(v5, "isSubmissionEnabled"))
  {
    v7 = objc_msgSend(v4, "confirmSubmission");
    v8 = (void *)MEMORY[0x1D17B78FC]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v12;
        v19 = 2112;
        v20 = objc_opt_class();
        _os_log_impl(&dword_1CD029000, v11, OS_LOG_TYPE_INFO, "%{public}@Submitting event: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
      os_unfair_lock_lock_with_options();
      -[NSMutableArray addObject:](v9->_pendingLogEvents, "addObject:", v4);
      -[HMMLogEventDispatcher _checkPendingLogEventBuffer](v9, "_checkPendingLogEventBuffer");
      if (v9->_isProcessingPending)
      {
        os_unfair_lock_unlock(&v9->_lock);
      }
      else
      {
        v9->_isProcessingPending = 1;
        os_unfair_lock_unlock(&v9->_lock);
        -[HMMLogEventDispatcher clientQueue](v9, "clientQueue");
        v14 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __40__HMMLogEventDispatcher_submitLogEvent___block_invoke;
        block[3] = &unk_1E898A590;
        block[4] = v9;
        v15 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
        dispatch_async(v14, v15);

      }
    }
    else
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        v19 = 2112;
        v20 = objc_opt_class();
        _os_log_impl(&dword_1CD029000, v11, OS_LOG_TYPE_ERROR, "%{public}@Event %@ was already submitted", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v8);
    }
  }

}

- (HMMLogEventDispatchingDataSource)dataSource
{
  return (HMMLogEventDispatchingDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (HMMLogEventDispatcher)init
{
  HMMLogEventDispatcher *v2;
  uint64_t v3;
  NSMapTable *observersByClass;
  uint64_t v5;
  NSMapTable *observersByProtocol;
  uint64_t v7;
  NSMutableArray *pendingLogEvents;
  const char *v9;
  NSObject *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *clientQueue;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMMLogEventDispatcher;
  v2 = -[HMMLogEventDispatcher init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    observersByClass = v2->_observersByClass;
    v2->_observersByClass = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observersByProtocol = v2->_observersByProtocol;
    v2->_observersByProtocol = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    pendingLogEvents = v2->_pendingLogEvents;
    v2->_pendingLogEvents = (NSMutableArray *)v7;

    v2->_shouldFault = 1;
    v9 = (const char *)HMMDispatchQueueName(v2, CFSTR("LogEventQueue"));
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v10, QOS_CLASS_BACKGROUND, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v9, v11);
    clientQueue = v2->_clientQueue;
    v2->_clientQueue = (OS_dispatch_queue *)v12;

  }
  return v2;
}

- (void)addObserver:(id)a3 forEventClass:(Class)a4
{
  void *v5;
  id v6;
  void *v7;
  Class v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a3;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMLogEventDispatcher addObserver:forEventClasses:](self, "addObserver:forEventClasses:", v6, v7, v8, v9);

}

- (void)addObserver:(id)a3 forEventClasses:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  HMMLogEventDispatcher *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[HMMLogEventDispatcher clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__HMMLogEventDispatcher_addObserver_forEventClasses___block_invoke;
  block[3] = &unk_1E898A7D0;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, block);

}

- (void)addObserver:(id)a3 forProtocol:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMMLogEventDispatcher clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__HMMLogEventDispatcher_addObserver_forProtocol___block_invoke;
  block[3] = &unk_1E898A7D0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[HMMLogEventDispatcher clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__HMMLogEventDispatcher_removeObserver___block_invoke;
  block[3] = &unk_1E898A788;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

- (void)handleMemoryPressureState:(int64_t)a3
{
  os_unfair_lock_s *p_lock;

  if (a3 == 2)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    -[HMMLogEventDispatcher _checkPendingLogEventBuffer](self, "_checkPendingLogEventBuffer");
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_checkPendingLogEventBuffer
{
  void *v3;
  HMMLogEventDispatcher *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)-[NSMutableArray count](self->_pendingLogEvents, "count") >= 0x400 && self->_shouldFault)
  {
    v3 = (void *)MEMORY[0x1D17B78FC]();
    v4 = self;
    HMFGetOSLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_pendingLogEvents, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1CD029000, v5, OS_LOG_TYPE_FAULT, "%{public}@TOO MANY PENDING LOG EVENTS: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    self->_shouldFault = 0;
  }
}

- (void)processAndSubmitLogEvents
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  HMMLogEventDispatcher *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableArray copy](self->_pendingLogEvents, "copy");
  -[NSMutableArray removeAllObjects](self->_pendingLogEvents, "removeAllObjects");
  *(_WORD *)&self->_isProcessingPending = 256;
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1D17B78FC]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    _os_log_impl(&dword_1CD029000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to submit [%@] events", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__HMMLogEventDispatcher_processAndSubmitLogEvents__block_invoke;
  v10[3] = &unk_1E898A5B8;
  v10[4] = v6;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v10);

}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_observersByProtocol, 0);
  objc_storeStrong((id *)&self->_observersByClass, 0);
  objc_storeStrong((id *)&self->_pendingLogEvents, 0);
}

void __50__HMMLogEventDispatcher_processAndSubmitLogEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "prepareForObservation");
  objc_msgSend(*(id *)(a1 + 32), "_getOrCreateObserversForEventClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend(v4, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "didReceiveEventFromDispatcher:", v3);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

void __40__HMMLogEventDispatcher_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t k;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v30 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = *(void **)(a1 + 40);

        if (v9 == v10)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v5);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v2;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v13);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectEnumerator", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    do
    {
      for (k = 0; k != v18; ++k)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * k), "removeObject:", *(_QWORD *)(a1 + 40));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v21, v33, 16);
    }
    while (v18);
  }

}

void __49__HMMLogEventDispatcher_addObserver_forProtocol___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKey:", a1[5], a1[6]);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1[4] + 24), "keyEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "conformsToProtocol:", a1[6]))
        {
          objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "addObject:", a1[5]);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

void __53__HMMLogEventDispatcher_addObserver_forEventClasses___block_invoke(uint64_t a1)
{
  id v2;
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

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
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
        objc_msgSend(*(id *)(a1 + 40), "_getOrCreateObserversForEventClass:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 48));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

@end
