@implementation INSAnalytics

- (id)_init
{
  INSAnalytics *v2;
  uint64_t v3;
  NSHashTable *observers;
  dispatch_queue_t v5;
  OS_dispatch_queue *observerQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)INSAnalytics;
  v2 = -[INSAnalytics init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithWeakObjects");
    v3 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = dispatch_queue_create("INSAnalyticsObserversQueue", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __28__INSAnalytics_addObserver___block_invoke;
  v7[3] = &unk_24C4B9828;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *observerQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __31__INSAnalytics_removeObserver___block_invoke;
  v7[3] = &unk_24C4B9828;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(observerQueue, v7);

}

- (void)logEventWithType:(int64_t)a3 context:(id)a4 contextNoCopy:(BOOL)a5
{
  id v8;
  NSObject *observerQueue;
  id v10;
  _QWORD v11[5];
  id v12;
  int64_t v13;
  BOOL v14;

  v8 = a4;
  observerQueue = self->_observerQueue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __55__INSAnalytics_logEventWithType_context_contextNoCopy___block_invoke;
  v11[3] = &unk_24C4B95A8;
  v12 = v8;
  v13 = a3;
  v11[4] = self;
  v14 = a5;
  v10 = v8;
  dispatch_async(observerQueue, v11);

}

- (id)contextDictionaryForCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[INSAnalytics dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analytics:contextDictionaryForCommand:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)contextDictionaryForError:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[INSAnalytics dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "analytics:contextDictionaryForError:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (INSAnalyticsDataSource)dataSource
{
  return (INSAnalyticsDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_observerQueue, 0);
}

void __55__INSAnalytics_logEventWithType_context_contextNoCopy___block_invoke(uint64_t a1)
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
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "analytics:needsToLogEventWithType:context:contextNoCopy:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __31__INSAnalytics_removeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __28__INSAnalytics_addObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

+ (id)sharedAnalytics
{
  if (sharedAnalytics_onceToken != -1)
    dispatch_once(&sharedAnalytics_onceToken, &__block_literal_global);
  return (id)sharedAnalytics_analytics;
}

void __31__INSAnalytics_sharedAnalytics__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[INSAnalytics _init]([INSAnalytics alloc], "_init");
  v1 = (void *)sharedAnalytics_analytics;
  sharedAnalytics_analytics = (uint64_t)v0;

}

@end
