@implementation NSXPCStoreConnectionManager

void __54__NSXPCStoreConnectionManager_sendMessageWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id *v17;
  id v18;
  uint64_t v19;

  v10 = (id *)-[NSXPCStoreConnectionManager _checkoutConnection:](*(_QWORD *)(a1 + 32), 1);
  if (v10)
  {
    v17 = v10;
    v18 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
    -[NSXPCStoreConnection sendMessageWithContext:]((uint64_t)v17, *(_QWORD *)(a1 + 40));
    v19 = *(_QWORD *)(a1 + 40);
    if (!v19 || !*(_QWORD *)(v19 + 24))
    {
      -[NSXPCStoreConnection disconnect](v17);
      -[NSXPCStoreConnection reconnect](v17);
    }
    -[NSXPCStoreConnectionManager _checkinConnection:](*(_QWORD *)(a1 + 32), v17);
    objc_msgSend(v18, "drain");
  }
  else
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR("manager sendMessageWithContext: unable to checkout connection."), v11, v12, v13, v14, v15, v16, a9);
  }
}

- (intptr_t)_checkinConnection:(intptr_t)result
{
  intptr_t v3;
  os_unfair_lock_s *v4;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      v4 = (os_unfair_lock_s *)(result + 40);
      os_unfair_lock_lock_with_options();
      objc_msgSend(*(id *)(v3 + 8), "addObject:", a2);

      os_unfair_lock_unlock(v4);
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 32));
    }
  }
  return result;
}

- (_QWORD)_checkoutConnection:(uint64_t)a1
{
  NSObject *v4;
  dispatch_time_t v5;
  intptr_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;

  if (!a1)
    return 0;
  v4 = *(NSObject **)(a1 + 32);
  v5 = dispatch_time(0, 120000000000);
  v6 = dispatch_semaphore_wait(v4, v5);
  if (v6)
  {
    _NSCoreDataLog(1, (uint64_t)CFSTR(" NSXPCStoreConnectionManager timed out waiting for a connection - %l"), v7, v8, v9, v10, v11, v12, v6);
    return 0;
  }
  os_unfair_lock_lock_with_options();
  v14 = (_QWORD *)objc_msgSend(*(id *)(a1 + 8), "lastObject");
  v15 = v14;
  if (v14)
  {
    v16 = v14;
    v13 = v15;
    objc_msgSend(*(id *)(a1 + 8), "removeObject:", v15);
  }
  else
  {
    v13 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  if (a2)
    -[NSXPCStoreConnection reconnect](v13);
  return v13;
}

- (void)sendMessageWithContext:(uint64_t)a1
{
  NSObject *v2;
  _QWORD v3[6];

  if (a1)
  {
    if (a2)
    {
      v2 = *(NSObject **)(a1 + 48);
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __54__NSXPCStoreConnectionManager_sendMessageWithContext___block_invoke;
      v3[3] = &unk_1E1EDD430;
      v3[4] = a1;
      v3[5] = a2;
      dispatch_sync(v2, v3);
    }
  }
}

- (id)initForStore:(id)a3
{
  NSXPCStoreConnectionManager *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *allConnections;
  unint64_t v11;
  id v12;
  NSMutableArray *v13;
  const char *v14;
  uint64_t v16;
  id v17;
  id location;
  objc_super v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)NSXPCStoreConnectionManager;
  v4 = -[NSXPCStoreConnectionManager init](&v19, sel_init);
  if (v4)
  {
    v5 = (void *)objc_msgSend((id)objc_msgSend(a3, "URL"), "copy");
    objc_initWeak(&location, a3);
    v6 = (void *)objc_msgSend((id)objc_msgSend(a3, "options"), "valueForKey:", CFSTR("NSPersistentStoreConnectionPoolMaxSize"));
    v7 = +[_PFTask getPhysicalMemory]();
    v8 = 2;
    if (v7 >= 0x80000001)
      v8 = 3;
    if (v6)
    {
      v9 = objc_msgSend(v6, "integerValue");
      if (v9 <= 1)
        v8 = 1;
      else
        v8 = v9;
    }
    v4->_maxConnections = v8;
    allConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v4->_allConnections = allConnections;
    if (v4->_maxConnections)
    {
      v11 = 0;
      do
      {
        v12 = -[NSXPCStoreConnection initForStore:]([NSXPCStoreConnection alloc], "initForStore:", a3);
        if (v12)
          -[NSMutableArray addObject:](v4->_allConnections, "addObject:", v12);

        ++v11;
      }
      while (v11 < v4->_maxConnections);
      allConnections = v4->_allConnections;
    }
    if (!-[NSMutableArray count](allConnections, "count"))
    {
      v16 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("NSXPCStoreConnection failed to initialize any connections for store at %@"), objc_msgSend(a3, "URL"));
      v17 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E0CB2C80], 4224, v16, 0);
      objc_exception_throw(v17);
    }
    v13 = (NSMutableArray *)-[NSMutableArray mutableCopy](v4->_allConnections, "mutableCopy");
    v4->_availableConnections = v13;
    v4->_connectionLock._os_unfair_lock_opaque = 0;
    v4->_poolCounter = (OS_dispatch_semaphore *)dispatch_semaphore_create(-[NSMutableArray count](v13, "count"));
    v14 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("XPCConnectionManager:%p"), a3), "UTF8String");
    v4->_processingQueue = (OS_dispatch_queue *)dispatch_queue_create(v14, MEMORY[0x1E0C80D50]);

    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)dealloc
{
  NSObject *processingQueue;
  NSObject *poolCounter;
  objc_super v5;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  if (processingQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__NSXPCStoreConnectionManager_dealloc__block_invoke;
    block[3] = &unk_1E1EDD520;
    block[4] = self;
    dispatch_barrier_sync(processingQueue, block);
    dispatch_release((dispatch_object_t)self->_processingQueue);
  }

  self->_availableConnections = 0;
  poolCounter = self->_poolCounter;
  if (poolCounter)
  {
    dispatch_release(poolCounter);
    self->_poolCounter = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NSXPCStoreConnectionManager;
  -[NSXPCStoreConnectionManager dealloc](&v5, sel_dealloc);
}

uint64_t __38__NSXPCStoreConnectionManager_dealloc__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[NSXPCStoreConnection disconnect](*(id **)(*((_QWORD *)&v9 + 1) + 8 * i));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  return objc_msgSend(v2, "drain");
}

- (void)disconnectAllConnections:(uint64_t)a1
{
  NSObject *v2;
  void *v3;
  _QWORD block[6];
  char v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  if (a1)
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3052000000;
    v9 = __Block_byref_object_copy__39;
    v10 = __Block_byref_object_dispose__39;
    v11 = 0;
    v2 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke;
    block[3] = &unk_1E1EE0AE0;
    v5 = a2;
    block[4] = a1;
    block[5] = &v6;
    dispatch_barrier_sync(v2, block);
    v3 = (void *)v7[5];
    if (v3)
      objc_exception_throw(v3);
    _Block_object_dispose(&v6, 8);
  }
}

uint64_t __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  unint64_t i;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  uint64_t v13;
  uint64_t v14;
  uint64_t m;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  os_unfair_lock_lock_with_options();
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
  if (v4)
  {
    for (i = 0; i < v4; ++i)
    {
      v6 = -[NSXPCStoreConnectionManager _checkoutConnection:](*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
      if (v6)
      {
        objc_msgSend(v3, "addObject:", v6);
      }
      else
      {
        os_unfair_lock_lock_with_options();
        v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count");
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 40));
      }
    }
  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v7; ++j)
      {
        if (*(_QWORD *)v27 != v8)
          objc_enumerationMutation(v3);
        -[NSXPCStoreConnection disconnect](*(id **)(*((_QWORD *)&v26 + 1) + 8 * j));
      }
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v7);
  }
  if (*(_BYTE *)(a1 + 48))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v23;
      do
      {
        for (k = 0; k != v10; ++k)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v3);
          -[NSXPCStoreConnectionManager _checkinConnection:](*(_QWORD *)(a1 + 32), *(void **)(*((_QWORD *)&v22 + 1) + 8 * k));
        }
        v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
      }
      while (v10);
    }
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v19;
      do
      {
        for (m = 0; m != v13; ++m)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v3);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * m);
          if (v16)
          {
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 32));

          }
        }
        v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
      }
      while (v13);
    }
  }
  objc_msgSend(v3, "removeAllObjects");
  return objc_msgSend(v2, "drain");
}

@end
