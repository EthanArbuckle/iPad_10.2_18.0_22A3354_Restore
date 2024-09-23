@implementation DNDSKeybag

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_38);
  return (id)sharedInstance_shared_0;
}

void __28__DNDSKeybag_sharedInstance__block_invoke()
{
  DNDSKeybag *v0;
  void *v1;

  v0 = objc_alloc_init(DNDSKeybag);
  v1 = (void *)sharedInstance_shared_0;
  sharedInstance_shared_0 = (uint64_t)v0;

}

- (DNDSKeybag)init
{
  DNDSKeybag *v2;
  uint64_t v3;
  OS_dispatch_queue *calloutQueue;
  uint64_t v5;
  OS_dispatch_queue *queue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)DNDSKeybag;
  v2 = -[DNDSKeybag init](&v8, sel_init);
  if (v2)
  {
    v3 = BSDispatchQueueCreateWithQualityOfService();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)v3;

    v5 = BSDispatchQueueCreateWithQualityOfService();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v2->_queue_hasUnlockedSinceBoot = MKBDeviceUnlockedSinceBoot() != 0;
    -[DNDSKeybag _beginObservingKeybag](v2, "_beginObservingKeybag");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  MKBEventsUnregister();
  v3.receiver = self;
  v3.super_class = (Class)DNDSKeybag;
  -[DNDSKeybag dealloc](&v3, sel_dealloc);
}

- (BOOL)isLocked
{
  unsigned int v2;

  v2 = MKBGetDeviceLockState();
  return (v2 < 5) & (0x16u >> v2);
}

- (BOOL)hasUnlockedSinceBoot
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__DNDSKeybag_hasUnlockedSinceBoot__block_invoke;
  v5[3] = &unk_1E86A5948;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__DNDSKeybag_hasUnlockedSinceBoot__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (BOOL)_hasUnlockedSinceBootForObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__DNDSKeybag__hasUnlockedSinceBootForObserver___block_invoke;
  block[3] = &unk_1E86A6C20;
  block[4] = self;
  v9 = v4;
  v10 = &v11;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

void __47__DNDSKeybag__hasUnlockedSinceBootForObserver___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__DNDSKeybag__hasUnlockedSinceBootForObserver___block_invoke_2;
  v5[3] = &unk_1E86A84C0;
  v6 = *(id *)(a1 + 40);
  v3 = objc_msgSend(v2, "bs_containsObjectPassingTest:", v5);

  v4 = 48;
  if (v3)
    v4 = 32;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + v4);

}

BOOL __47__DNDSKeybag__hasUnlockedSinceBootForObserver___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__DNDSKeybag_addObserver___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __26__DNDSKeybag_addObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)addPriorityObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__DNDSKeybag_addPriorityObserver___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __34__DNDSKeybag_addPriorityObserver___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  return objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__DNDSKeybag_removeObserver___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __29__DNDSKeybag_removeObserver___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 40);
    *(_QWORD *)(v2 + 40) = 0;

  }
}

- (void)_beginObservingKeybag
{
  id v3;
  id location;

  objc_initWeak(&location, self);
  objc_copyWeak(&v3, &location);
  self->_mbkEvent = (_MKBEvent *)MKBEventsRegister();
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __35__DNDSKeybag__beginObservingKeybag__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!a2)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_handleFirstUnlock");
    goto LABEL_5;
  }
  if (a2 == 1)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "_queue_handleKeybagStatusChanged");
LABEL_5:
    WeakRetained = v4;
  }

}

- (void)_queue_handleKeybagStatusChanged
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *calloutQueue;
  id v14;
  _QWORD v15[4];
  id v16;
  DNDSKeybag *v17;
  uint8_t buf[16];

  -[NSHashTable allObjects](self->_queue_priorityObservers, "allObjects");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = MEMORY[0x1E0C9AA60];
  if (v3)
    v6 = (void *)v3;
  else
    v6 = (void *)MEMORY[0x1E0C9AA60];
  v7 = v6;

  -[NSHashTable allObjects](self->_queue_observers, "allObjects");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = v8;
  else
    v10 = v5;
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = DNDSLogKeybag;
  if (os_log_type_enabled((os_log_t)DNDSLogKeybag, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CB895000, v12, OS_LOG_TYPE_DEFAULT, "State changed", buf, 2u);
  }
  calloutQueue = self->_calloutQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__DNDSKeybag__queue_handleKeybagStatusChanged__block_invoke;
  v15[3] = &unk_1E86A59E8;
  v16 = v11;
  v17 = self;
  v14 = v11;
  dispatch_async(calloutQueue, v15);

}

void __46__DNDSKeybag__queue_handleKeybagStatusChanged__block_invoke(uint64_t a1)
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
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "keybagDidChangeState:", *(_QWORD *)(a1 + 40), (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)_queue_handleFirstUnlock
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *calloutQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  DNDSKeybag *v11;
  id v12;
  id v13;
  id buf[2];

  v3 = DNDSLogKeybag;
  if (os_log_type_enabled((os_log_t)DNDSLogKeybag, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "First unlock occurred", (uint8_t *)buf, 2u);
  }
  -[NSHashTable allObjects](self->_queue_priorityObservers, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable allObjects](self->_queue_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(buf, self);
  calloutQueue = self->_calloutQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke;
  v9[3] = &unk_1E86A8510;
  objc_copyWeak(&v13, buf);
  v10 = v4;
  v11 = self;
  v12 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(calloutQueue, v9);

  objc_destroyWeak(&v13);
  objc_destroyWeak(buf);
}

void __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD block[5];
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = *((_QWORD *)WeakRetained + 2);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke_2;
    block[3] = &unk_1E86A5970;
    block[4] = v3;
    dispatch_sync(v4, block);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "keybagDidUnlockForTheFirstTime:", *(_QWORD *)(a1 + 40));
          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
      }
      while (v7);
    }

    v11 = v3[2];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke_3;
    v22[3] = &unk_1E86A5970;
    v22[4] = v3;
    dispatch_sync(v11, v22);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = *(id *)(a1 + 48);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "keybagDidUnlockForTheFirstTime:", *(_QWORD *)(a1 + 40), (_QWORD)v18);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v28, 16);
      }
      while (v14);
    }

  }
}

uint64_t __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 1;
  return result;
}

uint64_t __38__DNDSKeybag__queue_handleFirstUnlock__block_invoke_3(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_priorityObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

@end
