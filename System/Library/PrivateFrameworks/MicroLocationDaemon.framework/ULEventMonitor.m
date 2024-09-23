@implementation ULEventMonitor

- (ULEventMonitor)init
{
  ULEventMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ULEventMonitor;
  v2 = -[ULEventMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.milod.ULEventMonitor", v3);
    -[ULEventMonitor setQueue:](v2, "setQueue:", v4);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULEventMonitor setObserversMap:](v2, "setObserversMap:", v5);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[ULEventMonitor observersMap](self, "observersMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[ULEventMonitor stopMonitoring:](self, "stopMonitoring:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  v9.receiver = self;
  v9.super_class = (Class)ULEventMonitor;
  -[ULEventMonitor dealloc](&v9, sel_dealloc);
}

- (void)addObserver:(id)a3 selector:(SEL)a4 eventName:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  ULEventMonitor *v16;
  id v17;
  SEL v18;

  v8 = a3;
  v9 = a5;
  -[ULEventMonitor queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v10);

  -[ULEventMonitor queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__ULEventMonitor_addObserver_selector_eventName___block_invoke;
  block[3] = &unk_2511D4540;
  v15 = v8;
  v16 = self;
  v17 = v9;
  v18 = a4;
  v12 = v9;
  v13 = v8;
  dispatch_sync(v11, block);

}

void __49__ULEventMonitor_addObserver_selector_eventName___block_invoke(uint64_t a1)
{
  ULObserverRecord *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  objc_class *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = -[ULObserverRecord initWithObserver:selector:]([ULObserverRecord alloc], "initWithObserver:selector:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "observersMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  if (v4)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __49__ULEventMonitor_addObserver_selector_eventName___block_invoke_2;
    v15[3] = &unk_2511D4518;
    v5 = *(id *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 56);
    v17 = &v19;
    v18 = v6;
    v16 = v5;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);
    if (!*((_BYTE *)v20 + 24))
      objc_msgSend(v4, "addObject:", v2);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "observersMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 48));

    objc_msgSend(*(id *)(a1 + 40), "startMonitoring:", *(_QWORD *)(a1 + 48));
  }
  if (!*((_BYTE *)v20 + 24))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_32);
    v9 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "getNumberOfObserversForEventName:", v12));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      v27 = 2112;
      v28 = v13;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_DEFAULT, "Adding observer: %@, eventName: %@, numberOfObservers: %@", buf, 0x20u);

    }
    objc_msgSend(*(id *)(a1 + 40), "latestEventAfterAddingObserverForEventName:", *(_QWORD *)(a1 + 48));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      objc_msgSend(*(id *)(a1 + 40), "postEvent:", v14);

  }
  _Block_object_dispose(&v19, 8);

}

void __49__ULEventMonitor_addObserver_selector_eventName___block_invoke_2(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "observer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 == (void *)a1[4])
  {
    v8 = objc_msgSend(v10, "selector");
    v9 = a1[6];

    if (v8 == v9)
    {
      *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
      *a4 = 1;
    }
  }
  else
  {

  }
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[ULEventMonitor queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ULEventMonitor_removeObserver___block_invoke;
  block[3] = &unk_2511D2CA8;
  block[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __33__ULEventMonitor_removeObserver___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "observersMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__ULEventMonitor_removeObserver___block_invoke_2;
  v5[3] = &unk_2511D4590;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

}

void __33__ULEventMonitor_removeObserver___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "observersMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __33__ULEventMonitor_removeObserver___block_invoke_3;
  v9[3] = &unk_2511D4568;
  v10 = *(id *)(a1 + 40);
  v11 = v5;
  v6 = *(_QWORD *)(a1 + 32);
  v12 = v3;
  v13 = v6;
  v7 = v3;
  v8 = v5;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v9);

}

void __33__ULEventMonitor_removeObserver___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  objc_msgSend(v6, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v6);
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_32);
    v9 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v12;
      v18 = 2112;
      v19 = v13;
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_2419D9000, v10, OS_LOG_TYPE_DEFAULT, "Removing observer: %@, eventName: %@, numberOfObservers: %@", (uint8_t *)&v16, 0x20u);

    }
    if (!objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 56), "stopMonitoring:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(a1 + 56), "observersMap");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "removeObjectForKey:", *(_QWORD *)(a1 + 48));

    }
    *a4 = 1;
  }

}

- (void)removeObserver:(id)a3 fromEventName:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ULEventMonitor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  -[ULEventMonitor queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__ULEventMonitor_removeObserver_fromEventName___block_invoke;
  block[3] = &unk_2511D2218;
  block[4] = self;
  v13 = v7;
  v14 = v6;
  v10 = v6;
  v11 = v7;
  dispatch_sync(v9, block);

}

void __47__ULEventMonitor_removeObserver_fromEventName___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  objc_class *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__6;
  v22 = __Block_byref_object_dispose__6;
  objc_msgSend(*(id *)(a1 + 32), "observersMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v23 = (id)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v3 = (void *)v19[5];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__ULEventMonitor_removeObserver_fromEventName___block_invoke_29;
  v10[3] = &unk_2511D45B8;
  v11 = *(id *)(a1 + 48);
  v12 = &v18;
  v13 = &v14;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v10);
  if (*((_BYTE *)v15 + 24))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_32);
    v4 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 40);
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "getNumberOfObserversForEventName:", v7));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v25 = v6;
      v26 = 2112;
      v27 = v7;
      v28 = 2112;
      v29 = v8;
      _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_DEFAULT, "Removing observer: %@, eventName: %@, numberOfObservers: %@", buf, 0x20u);

    }
    if (!objc_msgSend((id)v19[5], "count"))
    {
      objc_msgSend(*(id *)(a1 + 32), "stopMonitoring:", *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(a1 + 32), "observersMap");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

    }
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

}

void __47__ULEventMonitor_removeObserver_fromEventName___block_invoke_29(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;

  objc_msgSend(a2, "observer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)a1[4];

  if (v7 == v8)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "removeObjectAtIndex:", a3);
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)postEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ULEventMonitor observersMap](self, "observersMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __28__ULEventMonitor_postEvent___block_invoke;
  v10[3] = &unk_2511D45E0;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __28__ULEventMonitor_postEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  objc_msgSend(v3, "observer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "selector");

  objc_msgSend(v5, "performSelector:withObject:", v4, *(_QWORD *)(a1 + 32));
}

- (unint64_t)getNumberOfObserversForEventName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v4 = a3;
  -[ULEventMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[ULEventMonitor observersMap](self, "observersMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  return v8;
}

- (id)latestEventAfterAddingObserverForEventName:(id)a3
{
  return 0;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableDictionary)observersMap
{
  return self->_observersMap;
}

- (void)setObserversMap:(id)a3
{
  objc_storeStrong((id *)&self->_observersMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
