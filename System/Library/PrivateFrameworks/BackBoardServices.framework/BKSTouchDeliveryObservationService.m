@implementation BKSTouchDeliveryObservationService

- (BKSTouchDeliveryObservationService)init
{
  BKSTouchDeliveryObservationService *v2;
  BSMutableIntegerMap *v3;
  BSMutableIntegerMap *touchIdentifierToObserverLists;
  uint64_t v5;
  NSMapTable *observersToTouchIdentifiers;
  uint64_t v7;
  NSHashTable *generalObservers;
  uint64_t Serial;
  OS_dispatch_queue *calloutQueue;
  uint64_t v11;
  OS_dispatch_queue *touchClientQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BKSTouchDeliveryObservationService;
  v2 = -[BKSTouchDeliveryObservationService init](&v14, sel_init);
  if (v2)
  {
    v3 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    touchIdentifierToObserverLists = v2->_touchIdentifierToObserverLists;
    v2->_touchIdentifierToObserverLists = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observersToTouchIdentifiers = v2->_observersToTouchIdentifiers;
    v2->_observersToTouchIdentifiers = (NSMapTable *)v5;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = objc_claimAutoreleasedReturnValue();
    generalObservers = v2->_generalObservers;
    v2->_generalObservers = (NSHashTable *)v7;

    Serial = BSDispatchQueueCreateSerial();
    calloutQueue = v2->_calloutQueue;
    v2->_calloutQueue = (OS_dispatch_queue *)Serial;

    v11 = BSDispatchQueueCreateSerial();
    touchClientQueue = v2->_touchClientQueue;
    v2->_touchClientQueue = (OS_dispatch_queue *)v11;

    -[BKSTouchDeliveryObservationService _connectToTouchDeliveryService](v2, "_connectToTouchDeliveryService");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)BKSTouchDeliveryObservationService;
  -[BKSTouchDeliveryObservationService dealloc](&v3, sel_dealloc);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *touchClientQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  BKLogTouchDeliveryObserver();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEBUG, "add observer", buf, 2u);
  }

  touchClientQueue = self->_touchClientQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__BKSTouchDeliveryObservationService_addObserver___block_invoke;
  v8[3] = &unk_1E1EA1BF8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(touchClientQueue, v8);

}

- (void)addObserver:(id)a3 forTouchIdentifier:(unsigned int)a4
{
  id v6;
  NSObject *v7;
  NSObject *touchClientQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  BKSTouchDeliveryObservationService *v13;
  unsigned int v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  unsigned int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  BKLogTouchDeliveryObserver();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543618;
    v16 = (id)objc_opt_class();
    v17 = 1024;
    v18 = a4;
    v10 = v16;
    _os_log_debug_impl(&dword_18A0F0000, v7, OS_LOG_TYPE_DEBUG, "add observer:%{public}@ for touch:%X", buf, 0x12u);

  }
  touchClientQueue = self->_touchClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__BKSTouchDeliveryObservationService_addObserver_forTouchIdentifier___block_invoke;
  block[3] = &unk_1E1EA1038;
  v12 = v6;
  v13 = self;
  v14 = a4;
  v9 = v6;
  dispatch_sync(touchClientQueue, block);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *touchClientQueue;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  BKSTouchDeliveryObservationService *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BKLogTouchDeliveryObserver();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v13 = (id)objc_opt_class();
    v8 = v13;
    _os_log_debug_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEBUG, "add observer:%{public}@", buf, 0xCu);

  }
  touchClientQueue = self->_touchClientQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__BKSTouchDeliveryObservationService_removeObserver___block_invoke;
  v9[3] = &unk_1E1EA1BF8;
  v10 = v4;
  v11 = self;
  v7 = v4;
  dispatch_sync(touchClientQueue, v9);

}

- (id)_queue_observersForTouchIdentifier:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_touchClientQueue);
  return (id)-[BSMutableIntegerMap objectForKey:](self->_touchIdentifierToObserverLists, "objectForKey:", a3);
}

- (void)_queue_removeObserversForTouchIdentifier:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v3 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_touchClientQueue);
  -[BKSTouchDeliveryObservationService _queue_observersForTouchIdentifier:](self, "_queue_observersForTouchIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      v3 = v3;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          -[NSMapTable objectForKey:](self->_observersToTouchIdentifiers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i), (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "removeValue:", v3);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }
    else
    {
      v3 = v3;
    }

    -[BSMutableIntegerMap removeObjectForKey:](self->_touchIdentifierToObserverLists, "removeObjectForKey:", v3);
  }

}

- (BOOL)_queue_addObserver:(id)a3 forTouchIdentifier:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  BOOL v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_touchClientQueue);
  v7 = a4;
  -[BSMutableIntegerMap objectForKey:](self->_touchIdentifierToObserverLists, "objectForKey:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSMutableIntegerMap setObject:forKey:](self->_touchIdentifierToObserverLists, "setObject:forKey:", v8, v7);
  }
  if ((objc_msgSend(v8, "containsObject:", v6) & 1) == 0)
  {
    objc_msgSend(v8, "addObject:", v6);
    -[NSMapTable objectForKey:](self->_observersToTouchIdentifiers, "objectForKey:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0D017C0]);
      -[NSMapTable setObject:forKey:](self->_observersToTouchIdentifiers, "setObject:forKey:", v9, v6);
    }
    objc_msgSend(v9, "addValue:", v7);

  }
  BKLogTouchDeliveryObserver();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v13 = 138543362;
    v14 = v8;
    _os_log_debug_impl(&dword_18A0F0000, v10, OS_LOG_TYPE_DEBUG, "addObserver:forTouchIdentifier: table:%{public}@", (uint8_t *)&v13, 0xCu);
  }

  v11 = objc_msgSend(v8, "count") == 1;
  return v11;
}

- (BOOL)_queue_removeObserver:(id)a3 forTouchIdentifier:(unsigned int)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  void *v12;
  void *v13;

  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_touchClientQueue);
  v7 = a4;
  -[BSMutableIntegerMap objectForKey:](self->_touchIdentifierToObserverLists, "objectForKey:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && objc_msgSend(v8, "containsObject:", v6))
  {
    objc_msgSend(v9, "removeObject:", v6);
    v10 = objc_msgSend(v9, "count");
    v11 = v10 == 0;
    if (!v10)
      -[BSMutableIntegerMap removeObjectForKey:](self->_touchIdentifierToObserverLists, "removeObjectForKey:", v7);
    -[NSMapTable objectForKey:](self->_observersToTouchIdentifiers, "objectForKey:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "removeValue:", v7);
      if (!objc_msgSend(v13, "count"))
        -[NSMapTable removeObjectForKey:](self->_observersToTouchIdentifiers, "removeObjectForKey:", v6);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_connectToTouchDeliveryService
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[BKSHIDServiceConnection clientConnectionForServiceWithName:](BKSHIDServiceConnection, "clientConnectionForServiceWithName:", CFSTR("BKTouchDeliveryObservation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_storeStrong((id *)&self->_connection, v4);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke;
    v11[3] = &unk_1E1EA1868;
    v11[4] = self;
    objc_msgSend(v4, "configureConnection:", v11);
    BKLogTouchDeliveryObserver();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_18A0F0000, v5, OS_LOG_TYPE_DEBUG, "activating connection to server", buf, 2u);
    }

    objc_msgSend(v4, "activate");
    BKLogTouchDeliveryObserver();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v4, "remoteTarget");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v13 = v10;
      _os_log_debug_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEBUG, "server remote target %{public}@", buf, 0xCu);

    }
    objc_msgSend(v4, "remoteTarget");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("BKSTouchDeliveryObservationService.m"), 244, CFSTR("we must have a remote target"));

    }
  }
  else
  {
    BKLogTouchDeliveryObserver();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_18A0F0000, v9, OS_LOG_TYPE_ERROR, "cannot get connection for service", buf, 2u);
    }

  }
}

- (void)observeTouchEventDeliveryDidOccur:(id)a3 response:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v6);
        -[BKSTouchDeliveryObservationService _processTouchEventDeliveryUpdate:](self, "_processTouchEventDeliveryUpdate:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
      }
      while (v9 != v11);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }
  v7[2](v7, 0);

}

- (void)_processTouchEventDeliveryUpdate:(id)a3
{
  id v5;
  NSObject *v6;
  int v7;
  int v8;
  char v9;
  int v10;
  uint64_t v11;
  NSObject *calloutQueue;
  NSObject *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;
  SEL v17;
  int v18;
  int v19;
  int v20;
  char v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  BKLogTouchDeliveryObserver();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v23 = v5;
    _os_log_debug_impl(&dword_18A0F0000, v6, OS_LOG_TYPE_DEBUG, "update: received touch event update %{public}@", buf, 0xCu);
  }

  v7 = objc_msgSend(v5, "touchIdentifier");
  v8 = objc_msgSend(v5, "pid");
  v9 = objc_msgSend(v5, "isDetached");
  v10 = objc_msgSend(v5, "contextID");
  v11 = objc_msgSend(v5, "type");
  if (v11)
  {
    calloutQueue = self->_calloutQueue;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __71__BKSTouchDeliveryObservationService__processTouchEventDeliveryUpdate___block_invoke;
    v14[3] = &unk_1E1EA10F8;
    v14[4] = self;
    v16 = v11;
    v17 = a2;
    v21 = v9;
    v18 = v7;
    v19 = v10;
    v20 = v8;
    v15 = v5;
    dispatch_async(calloutQueue, v14);

  }
  else
  {
    BKLogTouchDeliveryObserver();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v5;
      _os_log_error_impl(&dword_18A0F0000, v13, OS_LOG_TYPE_ERROR, "update: invalid update type %{public}@", buf, 0xCu);
    }

  }
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (BSMutableIntegerMap)touchIdentifierToObserverLists
{
  return self->_touchIdentifierToObserverLists;
}

- (void)setTouchIdentifierToObserverLists:(id)a3
{
  objc_storeStrong((id *)&self->_touchIdentifierToObserverLists, a3);
}

- (NSMapTable)observersToTouchIdentifiers
{
  return self->_observersToTouchIdentifiers;
}

- (void)setObserversToTouchIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_observersToTouchIdentifiers, a3);
}

- (NSHashTable)generalObservers
{
  return self->_generalObservers;
}

- (void)setGeneralObservers:(id)a3
{
  objc_storeStrong((id *)&self->_generalObservers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generalObservers, 0);
  objc_storeStrong((id *)&self->_observersToTouchIdentifiers, 0);
  objc_storeStrong((id *)&self->_touchIdentifierToObserverLists, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_touchClientQueue, 0);
  objc_storeStrong((id *)&self->_calloutQueue, 0);
}

void __71__BKSTouchDeliveryObservationService__processTouchEventDeliveryUpdate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint64_t v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD block[7];
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint8_t v49[128];
  uint8_t buf[4];
  _BYTE v51[14];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__7391;
  v47 = __Block_byref_object_dispose__7392;
  v48 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy__7391;
  v41 = __Block_byref_object_dispose__7392;
  v42 = 0;
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__BKSTouchDeliveryObservationService__processTouchEventDeliveryUpdate___block_invoke_79;
  block[3] = &unk_1E1EA10D0;
  v36 = *(_DWORD *)(a1 + 64);
  block[4] = v2;
  block[5] = &v43;
  block[6] = &v37;
  dispatch_sync(v3, block);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  objc_msgSend((id)v44[5], "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v52, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(a1 + 48);
        if (v8)
        {
          v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (v8 == 1)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              BKLogTouchDeliveryObserver();
              v11 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
              {
                v14 = *(_DWORD *)(a1 + 64);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v51 = v14;
                *(_WORD *)&v51[4] = 2114;
                *(_QWORD *)&v51[6] = v9;
                _os_log_debug_impl(&dword_18A0F0000, v11, OS_LOG_TYPE_DEBUG, "update: up for %X to pid:%{public}@", buf, 0x12u);
              }

              objc_msgSend(v9, "touchUpOccuredForIdentifier:detached:context:pid:", *(unsigned int *)(a1 + 64), *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 68), *(unsigned int *)(a1 + 72));
            }
          }
          else if (v8 == 2 && (objc_opt_respondsToSelector() & 1) != 0)
          {
            BKLogTouchDeliveryObserver();
            v10 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            {
              v13 = *(_DWORD *)(a1 + 64);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v51 = v13;
              *(_WORD *)&v51[4] = 2114;
              *(_QWORD *)&v51[6] = v9;
              _os_log_debug_impl(&dword_18A0F0000, v10, OS_LOG_TYPE_DEBUG, "update: detach for %X to %{public}@", buf, 0x12u);
            }

            objc_msgSend(v9, "touchDetachedForIdentifier:context:pid:", *(unsigned int *)(a1 + 64), *(unsigned int *)(a1 + 68), *(unsigned int *)(a1 + 72));
          }
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("BKSTouchDeliveryObservationService.m"), 291, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v31, v52, 16);
    }
    while (v5);
  }

  if (objc_msgSend((id)v38[5], "count"))
  {
    v26 = *(id *)(a1 + 40);
    if (*(_DWORD *)(a1 + 64))
    {
      v15 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");

      objc_msgSend(v15, "setTouchIdentifier:", 0);
      v26 = v15;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    objc_msgSend((id)v38[5], "objectEnumerator");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v49, 16);
    if (v17)
    {
      v18 = *(_QWORD *)v28;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v28 != v18)
            objc_enumerationMutation(v16);
          v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v19);
          if ((objc_msgSend((id)v44[5], "containsObject:", v20) & 1) == 0)
          {
            v21 = *(_QWORD *)(a1 + 48);
            if (v21)
            {
              if (v21 == 1)
              {
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  BKLogTouchDeliveryObserver();
                  v23 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138543362;
                    *(_QWORD *)v51 = v20;
                    _os_log_debug_impl(&dword_18A0F0000, v23, OS_LOG_TYPE_DEBUG, "update: up to %{public}@", buf, 0xCu);
                  }

                  objc_msgSend(v20, "touchUpOccuredForIdentifier:detached:context:pid:", 0, *(unsigned __int8 *)(a1 + 76), *(unsigned int *)(a1 + 68), *(unsigned int *)(a1 + 72));
                }
              }
              else if (v21 == 2 && (objc_opt_respondsToSelector() & 1) != 0)
              {
                BKLogTouchDeliveryObserver();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138543362;
                  *(_QWORD *)v51 = v20;
                  _os_log_debug_impl(&dword_18A0F0000, v22, OS_LOG_TYPE_DEBUG, "update: detach to %{public}@", buf, 0xCu);
                }

                objc_msgSend(v20, "touchDetachedForIdentifier:context:pid:", 0, *(unsigned int *)(a1 + 68), *(unsigned int *)(a1 + 72));
              }
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("BKSTouchDeliveryObservationService.m"), 322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NO"));

            }
          }
          ++v19;
        }
        while (v17 != v19);
        v25 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v49, 16);
        v17 = v25;
      }
      while (v25);
    }

  }
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
}

void __71__BKSTouchDeliveryObservationService__processTouchEventDeliveryUpdate___block_invoke_79(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (*(_DWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_observersForTouchIdentifier:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "copy");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

    objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserversForTouchIdentifier:", *(unsigned int *)(a1 + 56));
  }
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  uint8_t buf[16];

  v3 = a2;
  BKLogTouchDeliveryObserver();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_18A0F0000, v4, OS_LOG_TYPE_DEBUG, "configured client service", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF61980);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D017E0], "protocolForProtocol:", &unk_1EDF66440);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D03430], "interfaceWithIdentifier:", CFSTR("BKTouchDeliveryObservation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setServer:", v6);
  objc_msgSend(v7, "setClient:", v5);
  objc_msgSend(v3, "setInterface:", v7);
  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(MEMORY[0x1E0D03478], "userInitiated");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v8);

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_69;
  v9[3] = &unk_1E1EA1800;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInterruptionHandler:", v9);
  objc_msgSend(v3, "setInvalidationHandler:", &__block_literal_global_72);

}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_69(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[5];
  uint8_t buf[16];

  BKLogTouchDeliveryObserver();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_18A0F0000, v2, OS_LOG_TYPE_ERROR, "service interruption -- attempting to reconnect", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_70;
  block[3] = &unk_1E1EA15A8;
  block[4] = v3;
  dispatch_async(v4, block);
}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint8_t v4[16];

  v2 = a2;
  BKLogTouchDeliveryObserver();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v4 = 0;
    _os_log_error_impl(&dword_18A0F0000, v3, OS_LOG_TYPE_ERROR, "backboardd must be going down, exiting", v4, 2u);
  }

  exit(0);
}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_70(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_2;
  v5[3] = &unk_1E1EA1088;
  v5[4] = v2;
  objc_msgSend(v3, "enumerateKeysWithBlock:", v5);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteTarget");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObservesAllTouches:", MEMORY[0x1E0C9AAB0]);

  }
}

void __68__BKSTouchDeliveryObservationService__connectToTouchDeliveryService__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteTarget");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObservesTouch:withIdentifier:", MEMORY[0x1E0C9AAB0], v3);

}

void __53__BKSTouchDeliveryObservationService_removeObserver___block_invoke(int8x16_t *a1)
{
  void *v2;
  void *v3;
  id v4;
  int8x16_t v5;
  id v6;
  _QWORD v7[4];
  int8x16_t v8;

  if (a1[2].i64[0])
  {
    objc_msgSend(*(id *)(a1[2].i64[1] + 48), "removeObject:");
    if (!objc_msgSend(*(id *)(a1[2].i64[1] + 48), "count"))
    {
      objc_msgSend(*(id *)(a1[2].i64[1] + 24), "remoteTarget");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObservesAllTouches:", MEMORY[0x1E0C9AAA0]);

    }
    objc_msgSend(*(id *)(a1[2].i64[1] + 40), "objectForKey:", a1[2].i64[0]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)objc_msgSend(v3, "copy");

    if (v6)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __53__BKSTouchDeliveryObservationService_removeObserver___block_invoke_2;
      v7[3] = &unk_1E1EA1060;
      v5 = a1[2];
      v4 = (id)v5.i64[0];
      v8 = vextq_s8(v5, v5, 8uLL);
      objc_msgSend(v6, "enumerateWithBlock:", v7);

    }
  }
}

void __53__BKSTouchDeliveryObservationService_removeObserver___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  if (objc_msgSend(*(id *)(a1 + 32), "_queue_removeObserver:forTouchIdentifier:", *(_QWORD *)(a1 + 40), a2))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteTarget");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObservesTouch:withIdentifier:", MEMORY[0x1E0C9AAA0], v4);

  }
}

void __69__BKSTouchDeliveryObservationService_addObserver_forTouchIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "_queue_addObserver:forTouchIdentifier:", v1, *(unsigned int *)(a1 + 48)))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "remoteTarget");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 48));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObservesTouch:withIdentifier:", MEMORY[0x1E0C9AAB0], v3);

    }
  }
}

void __50__BKSTouchDeliveryObservationService_addObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "addObject:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") == 1)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "remoteTarget");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObservesAllTouches:", MEMORY[0x1E0C9AAB0]);

  }
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7440 != -1)
    dispatch_once(&sharedInstance_onceToken_7440, &__block_literal_global_7441);
  return (id)sharedInstance___shared;
}

void __52__BKSTouchDeliveryObservationService_sharedInstance__block_invoke()
{
  BKSTouchDeliveryObservationService *v0;
  void *v1;

  v0 = objc_alloc_init(BKSTouchDeliveryObservationService);
  v1 = (void *)sharedInstance___shared;
  sharedInstance___shared = (uint64_t)v0;

}

@end
