@implementation CSAccessorySiriClientBehaviorMonitor

- (void)_init
{
  NSHashTable *v3;
  NSHashTable *observers;
  void *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *queue;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
  v3 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  observers = self->_observers;
  self->_observers = v3;

  v5 = (void *)MEMORY[0x1E0D19260];
  dispatch_get_global_queue(33, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getSerialQueue:withQualityOfService:andTargetQueue:", CFSTR("com.apple.corespeech.CSAccessorySiriClientBehaviourMonitor"), 33, v8);
  v6 = (OS_dispatch_queue *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  self->_queue = v6;

}

- (CSAccessorySiriClientBehaviorMonitor)init
{
  CSAccessorySiriClientBehaviorMonitor *v2;
  CSAccessorySiriClientBehaviorMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSAccessorySiriClientBehaviorMonitor;
  v2 = -[CSAccessorySiriClientBehaviorMonitor init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[CSAccessorySiriClientBehaviorMonitor _init](v2, "_init");
  return v3;
}

- (void)registerObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__CSAccessorySiriClientBehaviorMonitor_registerObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__CSAccessorySiriClientBehaviorMonitor_unregisterObserver___block_invoke;
    v7[3] = &unk_1E7C292A0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)notifyWillStartStreamWithContext:(id)a3 option:(id)a4 forAccessory:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  CSAccessorySiriClientBehaviorMonitor *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__CSAccessorySiriClientBehaviorMonitor_notifyWillStartStreamWithContext_option_forAccessory___block_invoke;
  v15[3] = &unk_1E7C27E78;
  v16 = v10;
  v17 = self;
  v18 = v8;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(queue, v15);

}

- (void)notifyDidStartStreamWithContext:(id)a3 successfully:(BOOL)a4 option:(id)a5 withEventUUID:(id)a6 forAccessory:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  CSAccessorySiriClientBehaviorMonitor *v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  queue = self->_queue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __119__CSAccessorySiriClientBehaviorMonitor_notifyDidStartStreamWithContext_successfully_option_withEventUUID_forAccessory___block_invoke;
  v21[3] = &unk_1E7C24290;
  v22 = v15;
  v23 = self;
  v27 = a4;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v17 = v14;
  v18 = v13;
  v19 = v12;
  v20 = v15;
  dispatch_async(queue, v21);

}

- (void)notifyWillStopStream:(id)a3 reason:(unint64_t)a4 forAccessory:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CSAccessorySiriClientBehaviorMonitor *v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __81__CSAccessorySiriClientBehaviorMonitor_notifyWillStopStream_reason_forAccessory___block_invoke;
  v13[3] = &unk_1E7C285C0;
  v14 = v9;
  v15 = self;
  v16 = v8;
  v17 = a4;
  v11 = v8;
  v12 = v9;
  dispatch_async(queue, v13);

}

- (void)notifyDidStopStream:(id)a3 reason:(unint64_t)a4 withEventUUID:(id)a5 forAccessory:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  CSAccessorySiriClientBehaviorMonitor *v19;
  id v20;
  id v21;
  unint64_t v22;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __94__CSAccessorySiriClientBehaviorMonitor_notifyDidStopStream_reason_withEventUUID_forAccessory___block_invoke;
  block[3] = &unk_1E7C242B8;
  v18 = v12;
  v19 = self;
  v21 = v11;
  v22 = a4;
  v20 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  dispatch_async(queue, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
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
  objc_storeStrong((id *)&self->_queue, 0);
}

void __94__CSAccessorySiriClientBehaviorMonitor_notifyDidStopStream_reason_withEventUUID_forAccessory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315395;
    v15 = "-[CSAccessorySiriClientBehaviorMonitor notifyDidStopStream:reason:withEventUUID:forAccessory:]_block_invoke";
    v16 = 2113;
    v17 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s accessoryId %{private}@", buf, 0x16u);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "observers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "accessorySiriClientBehaviorMonitor:didStopStream:reason:withEventUUID:forAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __81__CSAccessorySiriClientBehaviorMonitor_notifyWillStopStream_reason_forAccessory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315395;
    v15 = "-[CSAccessorySiriClientBehaviorMonitor notifyWillStopStream:reason:forAccessory:]_block_invoke";
    v16 = 2113;
    v17 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s accessoryId %{private}@", buf, 0x16u);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "observers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "accessorySiriClientBehaviorMonitor:willStopStream:reason:forAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __119__CSAccessorySiriClientBehaviorMonitor_notifyDidStartStreamWithContext_successfully_option_withEventUUID_forAccessory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315395;
    v15 = "-[CSAccessorySiriClientBehaviorMonitor notifyDidStartStreamWithContext:successfully:option:withEventUUID:forAc"
          "cessory:]_block_invoke";
    v16 = 2113;
    v17 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s accessoryId %{private}@", buf, 0x16u);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "observers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "accessorySiriClientBehaviorMonitor:didStartStreamWithContext:successfully:option:withEventUUID:forAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __93__CSAccessorySiriClientBehaviorMonitor_notifyWillStartStreamWithContext_option_forAccessory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint8_t v13[128];
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315395;
    v15 = "-[CSAccessorySiriClientBehaviorMonitor notifyWillStartStreamWithContext:option:forAccessory:]_block_invoke";
    v16 = 2113;
    v17 = v3;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s accessoryId %{private}@", buf, 0x16u);
  }
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "observers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "accessorySiriClientBehaviorMonitor:willStartStreamWithContext:option:forAccessory:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __59__CSAccessorySiriClientBehaviorMonitor_unregisterObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __57__CSAccessorySiriClientBehaviorMonitor_registerObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "observers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2759 != -1)
    dispatch_once(&sharedInstance_onceToken_2759, &__block_literal_global_2760);
  return (id)sharedInstance_accessoryClientBehaviourMonitor;
}

void __54__CSAccessorySiriClientBehaviorMonitor_sharedInstance__block_invoke()
{
  CSAccessorySiriClientBehaviorMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAccessorySiriClientBehaviorMonitor);
  v1 = (void *)sharedInstance_accessoryClientBehaviourMonitor;
  sharedInstance_accessoryClientBehaviourMonitor = (uint64_t)v0;

}

@end
