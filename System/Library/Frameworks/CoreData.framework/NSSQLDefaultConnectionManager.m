@implementation NSSQLDefaultConnectionManager

- (BOOL)handleStoreRequest:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  _QWORD v10[9];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  if (!a3)
    return 1;
  objc_msgSend(*((id *)a3 + 2), "requestType");
  v5 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:]((uint64_t)self);
  if (!v5)
    return 0;
  v6 = (uint64_t)v5;
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)a3, v5);
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__16;
  v15 = __Block_byref_object_dispose__16;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__NSSQLDefaultConnectionManager_handleStoreRequest___block_invoke;
  v10[3] = &unk_1E1EDE810;
  v10[4] = v6;
  v10[5] = a3;
  v10[7] = &v17;
  v10[8] = &v11;
  v10[6] = self;
  -[NSSQLiteConnection performAndWait:](v6, (uint64_t)v10);
  v7 = (void *)v12[5];
  if (v7)
    objc_exception_throw(v7);
  v8 = *((_BYTE *)v18 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)_checkoutConnectionOfType:(uint64_t)a1
{
  NSObject *v2;
  dispatch_time_t v3;
  intptr_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!a1)
    return 0;
  v2 = *(NSObject **)(a1 + 40);
  v3 = dispatch_time(0, 120000000000);
  v4 = dispatch_semaphore_wait(v2, v3);
  v5 = 0;
  if (!v4)
  {
    os_unfair_lock_lock_with_options();
    v6 = (void *)objc_msgSend(*(id *)(a1 + 24), "lastObject");
    v7 = v6;
    if (v6)
    {
      v8 = v6;
      v5 = v7;
      objc_msgSend(*(id *)(a1 + 24), "removeLastObject");
    }
    else
    {
      v5 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
  return v5;
}

uint64_t __52__NSSQLDefaultConnectionManager_handleStoreRequest___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = *(void **)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "executeRequestUsingConnection:", v3);
  -[NSSQLStoreRequestContext setConnection:](*(_QWORD *)(a1 + 40), 0);
  -[NSSQLDefaultConnectionManager _checkinConnection:](*(_QWORD *)(a1 + 48), (uint64_t)v3);

  return objc_msgSend(v2, "drain");
}

- (intptr_t)_checkinConnection:(intptr_t)result
{
  intptr_t v3;

  if (result)
  {
    if (a2)
    {
      v3 = result;
      os_unfair_lock_lock_with_options();
      objc_msgSend(*(id *)(v3 + 24), "addObject:", a2);
      os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 48));
      return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 40));
    }
  }
  return result;
}

uint64_t __72__NSSQLDefaultConnectionManager_enumerateAvailableConnectionsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke_3(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(a1 + 32));
}

void __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_2(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(a1 + 32));
}

void __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke(uint64_t a1)
{
  -[NSSQLiteConnection connect](*(_QWORD *)(a1 + 32));
}

void __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke_2(uint64_t a1)
{
  -[NSSQLiteConnection connect](*(_QWORD *)(a1 + 32));
}

- (void)disconnectAllConnections
{
  NSObject *processingQueue;
  void *v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  v10 = 0;
  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke;
  v4[3] = &unk_1E1EDD0E0;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_barrier_sync(processingQueue, v4);
  v3 = (void *)v6[5];
  if (v3)
    objc_exception_throw(v3);
  _Block_object_dispose(&v5, 8);
}

- (NSSQLDefaultConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5
{
  NSSQLDefaultConnectionManager *v9;
  const char *v10;
  dispatch_qos_class_t v11;
  uint64_t v12;
  unsigned int v13;
  NSObject *v14;
  const char *Name;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  id v30;
  objc_super v32;
  _QWORD v33[5];
  _QWORD v34[9];

  v34[7] = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)NSSQLDefaultConnectionManager;
  v9 = -[NSSQLConnectionManager initWithSQLCore:priority:seedConnection:](&v32, sel_initWithSQLCore_priority_seedConnection_);
  if (!v9)
    return v9;
  v10 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SQLQueue: %@ : %p"), objc_msgSend((id)objc_msgSend(a3, "_persistentStoreCoordinator"), "name"), v9), "cStringUsingEncoding:", 1);
  if (a4 == 1)
  {
    v11 = QOS_CLASS_USER_INITIATED;
  }
  else
  {
    v12 = objc_msgSend(a3, "_persistentStoreCoordinator");
    if (!v12)
      goto LABEL_8;
    v13 = *(_DWORD *)(v12 + 24);
    v11 = (v13 >> 3);
    if (!(v13 >> 3))
      goto LABEL_8;
  }
  v14 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E0C80D50], v11, 0);
  if (!v14)
  {
    Name = sel_getName(a2);
    _NSCoreDataLog(1, (uint64_t)CFSTR("dispatch_queue_attr_make_with_qos_class() returned NULL in %s"), v16, v17, v18, v19, v20, v21, (uint64_t)Name);
LABEL_8:
    v14 = MEMORY[0x1E0C80D50];
  }
  v9->_processingQueue = (OS_dispatch_queue *)dispatch_queue_create(v10, v14);
  dispatch_release(v14);
  v9->_connectionLock._os_unfair_lock_opaque = 0;
  v9->_availableConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v22 = (void *)objc_msgSend((id)objc_msgSend(-[NSSQLConnectionManager sqlCore](v9, "sqlCore"), "options"), "valueForKey:", CFSTR("NSPersistentStoreConnectionPoolMaxSize"));
  if ((unint64_t)+[_PFTask getPhysicalMemory]() < 0x80000001)
    v23 = 2;
  else
    v23 = 3;
  if (v22)
  {
    v24 = objc_msgSend(v22, "integerValue");
    if (v24 <= 1)
      v23 = 1;
    else
      v23 = v24;
  }
  v25 = -[NSSQLConnectionManager sqlCore](v9, "sqlCore");
  v26 = v23 - (a5 != 0);
  if (v25 && (*(_DWORD *)(v25 + 192) & 0x1C) == 8
    || (v27 = -[NSSQLConnectionManager sqlCore](v9, "sqlCore")) != 0 && (*(_DWORD *)(v27 + 192) & 0x1C) == 4)
  {
    v26 -= (unint64_t)v26 > 2;
    v28 = 1;
  }
  else
  {
    v28 = 0;
  }
  if (-[NSMutableArray count](v9->_availableConnections, "count") < v26)
  {
    v29 = MEMORY[0x1E0C809B0];
    do
    {
      v30 = -[NSSQLiteConnection initForSQLCore:]([NSSQLiteConnection alloc], "initForSQLCore:", -[NSSQLConnectionManager sqlCore](v9, "sqlCore"));
      -[NSMutableArray addObject:](v9->_availableConnections, "addObject:", v30);
      if (v28)
      {
        v34[0] = v29;
        v34[1] = 3221225472;
        v34[2] = __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke;
        v34[3] = &unk_1E1EDD520;
        v34[4] = v30;
        -[NSSQLiteConnection performAndWait:]((uint64_t)v30, (uint64_t)v34);
      }

    }
    while (-[NSMutableArray count](v9->_availableConnections, "count") < v26);
  }
  if (a5)
  {
    -[NSMutableArray addObject:](v9->_availableConnections, "addObject:", a5);
    if (v28)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke_2;
      v33[3] = &unk_1E1EDD520;
      v33[4] = a5;
      -[NSSQLiteConnection performAndWait:]((uint64_t)a5, (uint64_t)v33);
    }
  }
  v9->_allConnections = (NSArray *)-[NSMutableArray copy](v9->_availableConnections, "copy");
  v9->_poolCounter = (OS_dispatch_semaphore *)dispatch_semaphore_create(-[NSMutableArray count](v9->_availableConnections, "count"));
  return v9;
}

- (void)enumerateAvailableConnectionsWithBlock:(id)a3
{
  id v5;
  os_unfair_lock_s *p_connectionLock;
  NSMutableArray *availableConnections;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  _QWORD v13[6];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  availableConnections = self->_availableConnections;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](availableConnections, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(availableConnections);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        v13[0] = v10;
        v13[1] = 3221225472;
        v13[2] = __72__NSSQLDefaultConnectionManager_enumerateAvailableConnectionsWithBlock___block_invoke;
        v13[3] = &unk_1E1EDE8A0;
        v13[4] = v12;
        v13[5] = a3;
        -[NSSQLiteConnection performAndWait:](v12, (uint64_t)v13);
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](availableConnections, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  os_unfair_lock_unlock(p_connectionLock);
  objc_msgSend(v5, "drain");
}

uint64_t __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  unint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t m;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t n;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[5];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  os_unfair_lock_lock_with_options();
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  if (v4)
  {
    for (i = 0; i < v4; ++i)
    {
      v6 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:](*(_QWORD *)(a1 + 32));
      if (v6)
      {
        objc_msgSend(v3, "addObject:", v6);

      }
      else
      {
        os_unfair_lock_lock_with_options();
        v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
      }
    }
  }
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v37;
    do
    {
      for (j = 0; j != v7; ++j)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v3);
        -[NSSQLiteConnection performAndWait:](*(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j), (uint64_t)&__block_literal_global_50);
      }
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v7);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v33;
    do
    {
      for (k = 0; k != v10; ++k)
      {
        if (*(_QWORD *)v33 != v11)
          objc_enumerationMutation(v3);
        v13 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * k);
        if (v13)
        {

          *(_QWORD *)(v13 + 208) = 0;
        }
      }
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
    }
    while (v10);
  }
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v29;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      for (m = 0; m != v14; ++m)
      {
        if (*(_QWORD *)v29 != v15)
          objc_enumerationMutation(v3);
        v18 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * m);
        v27[0] = v16;
        v27[1] = 3221225472;
        v27[2] = __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke_3;
        v27[3] = &unk_1E1EDD520;
        v27[4] = v18;
        -[NSSQLiteConnection performAndWait:](v18, (uint64_t)v27);
      }
      v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    }
    while (v14);
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v40, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v24;
    do
    {
      for (n = 0; n != v19; ++n)
      {
        if (*(_QWORD *)v24 != v20)
          objc_enumerationMutation(v3);
        -[NSSQLDefaultConnectionManager _checkinConnection:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * n));
      }
      v19 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v40, 16);
    }
    while (v19);
  }
  objc_msgSend(v3, "removeAllObjects");
  return objc_msgSend(v2, "drain");
}

- (void)dealloc
{
  NSObject *processingQueue;
  NSArray *allConnections;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  NSObject *poolCounter;
  objc_super v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD block[5];
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  processingQueue = self->_processingQueue;
  if (processingQueue)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __40__NSSQLDefaultConnectionManager_dealloc__block_invoke;
    block[3] = &unk_1E1EDD520;
    block[4] = self;
    dispatch_barrier_sync(processingQueue, block);
    dispatch_release((dispatch_object_t)self->_processingQueue);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    allConnections = self->_allConnections;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](allConnections, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(allConnections);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v13[0] = v8;
          v13[1] = 3221225472;
          v13[2] = __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_3;
          v13[3] = &unk_1E1EDD520;
          v13[4] = v10;
          -[NSSQLiteConnection performAndWait:](v10, (uint64_t)v13);
        }
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](allConnections, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
      }
      while (v6);
    }

    self->_allConnections = 0;
  }

  self->_availableConnections = 0;
  poolCounter = self->_poolCounter;
  if (poolCounter)
  {
    dispatch_release(poolCounter);
    self->_poolCounter = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)NSSQLDefaultConnectionManager;
  -[NSSQLConnectionManager dealloc](&v12, sel_dealloc);
}

uint64_t __40__NSSQLDefaultConnectionManager_dealloc__block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t result;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v12;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        v10[0] = v6;
        v10[1] = 3221225472;
        v10[2] = __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_2;
        v10[3] = &unk_1E1EDD520;
        v10[4] = v8;
        -[NSSQLiteConnection performAndWait:](v8, (uint64_t)v10);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  result = objc_msgSend(v2, "drain");
  if ((_DWORD)v4)
    objc_exception_rethrow();
  return result;
}

void __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_3(uint64_t a1)
{
  -[NSSQLiteConnection disconnect](*(_QWORD *)(a1 + 32));
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __57__NSSQLDefaultConnectionManager_setExclusiveLockingMode___block_invoke;
  v3[3] = &__block_descriptor_33_e28_v16__0__NSSQLiteConnection_8l;
  v4 = a3;
  -[NSSQLDefaultConnectionManager scheduleConnectionsBarrier:](self, "scheduleConnectionsBarrier:", v3);
}

uint64_t __57__NSSQLDefaultConnectionManager_setExclusiveLockingMode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setExclusiveLockingMode:", *(unsigned __int8 *)(a1 + 32));
}

- (void)scheduleBarrierBlock:(id)a3
{
  NSObject *processingQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__NSSQLDefaultConnectionManager_scheduleBarrierBlock___block_invoke;
  block[3] = &unk_1E1EDE858;
  block[4] = self;
  block[5] = a3;
  block[6] = &v6;
  dispatch_barrier_sync(processingQueue, block);
  v4 = (void *)v7[5];
  if (v4)
    objc_exception_throw(v4);
  _Block_object_dispose(&v6, 8);
}

uint64_t __54__NSSQLDefaultConnectionManager_scheduleBarrierBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  unint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  uint64_t v11;
  uint64_t k;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  os_unfair_lock_lock_with_options();
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  if (v4)
  {
    for (i = 0; i < v4; ++i)
    {
      v6 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:](*(_QWORD *)(a1 + 32));
      if (v6)
      {
        objc_msgSend(v3, "addObject:", v6);

      }
      else
      {
        os_unfair_lock_lock_with_options();
        v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
      }
    }
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v7; ++j)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v3);
        -[NSSQLiteConnection performAndWait:](*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j), (uint64_t)&__block_literal_global_43);
      }
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      for (k = 0; k != v10; ++k)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v3);
        -[NSSQLDefaultConnectionManager _checkinConnection:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * k));
      }
      v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }
  objc_msgSend(v3, "removeAllObjects");
  return objc_msgSend(v2, "drain");
}

- (void)scheduleConnectionsBarrier:(id)a3
{
  NSObject *processingQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke;
  block[3] = &unk_1E1EDE858;
  block[4] = self;
  block[5] = a3;
  block[6] = &v6;
  dispatch_barrier_sync(processingQueue, block);
  v4 = (void *)v7[5];
  if (v4)
    objc_exception_throw(v4);
  _Block_object_dispose(&v6, 8);
}

uint64_t __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  unint64_t v4;
  unint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t j;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t k;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  os_unfair_lock_lock_with_options();
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
  if (v4)
  {
    for (i = 0; i < v4; ++i)
    {
      v6 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:](*(_QWORD *)(a1 + 32));
      if (v6)
      {
        objc_msgSend(v3, "addObject:", v6);

      }
      else
      {
        os_unfair_lock_lock_with_options();
        v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count");
        os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 48));
      }
    }
  }
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v23;
    v9 = MEMORY[0x1E0C809B0];
    do
    {
      for (j = 0; j != v7; ++j)
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v3);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
        v21[0] = v9;
        v21[1] = 3221225472;
        v21[2] = __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke_2;
        v21[3] = &unk_1E1EDE8A0;
        v12 = *(_QWORD *)(a1 + 40);
        v21[4] = v11;
        v21[5] = v12;
        -[NSSQLiteConnection performAndWait:](v11, (uint64_t)v21);
      }
      v7 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v7);
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v18;
    do
    {
      for (k = 0; k != v13; ++k)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v3);
        -[NSSQLDefaultConnectionManager _checkinConnection:](*(_QWORD *)(a1 + 32), *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * k));
      }
      v13 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v26, 16);
    }
    while (v13);
  }
  objc_msgSend(v3, "removeAllObjects");
  return objc_msgSend(v2, "drain");
}

uint64_t __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
