@implementation HDDatabaseConnectionPool

- (void)checkInConnection:(id)a3 flushImmediately:(BOOL)a4
{
  id v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  int *p_count;
  unsigned int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  -[HDDatabaseConnectionPool _removeDatabaseFromCheckoutMap:]((uint64_t)self, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)v8;
  if (v8)
  {
    a2 = *(SEL *)(v8 + 40);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseConnectionPool.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseWrapper != nil"));

    LOBYTE(a2) = 0;
  }
  -[NSCondition lock](self->_cacheCondition, "lock");
  if (a4
    || (unint64_t)-[NSMutableSet count](self->_cache, "count") >= self->_cacheSize
    || (!v9 ? (v10 = 0) : (v10 = v9[3]), v10 != self->_cacheGeneration))
  {
    p_count = &self->_count;
    do
      v12 = __ldaxr((unsigned int *)p_count);
    while (__stlxr(v12 - 1, (unsigned int *)p_count));
    -[NSCondition signal](self->_cacheCondition, "signal");
    -[NSCondition unlock](self->_cacheCondition, "unlock");
    v18[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDDatabaseConnectionPool _didFlushDatabases:]((uint64_t)self, v13);

  }
  else
  {
    -[NSMutableSet addObject:](self->_cache, "addObject:", v9);
    -[NSCondition signal](self->_cacheCondition, "signal");
    -[NSCondition unlock](self->_cacheCondition, "unlock");
  }
  if (v9)
    v14 = v9[2];
  else
    v14 = 0;
  dispatch_group_leave(v14);
  -[HDDatabaseConnectionPool _semaphoreForCheckOutOptions:]((char *)self, (char)a2);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
    dispatch_semaphore_signal(v15);

}

- (int64_t)checkedOutDatabaseCount
{
  os_unfair_lock_s *p_checkoutLock;
  int64_t v4;

  p_checkoutLock = &self->_checkoutLock;
  os_unfair_lock_lock(&self->_checkoutLock);
  v4 = -[NSMapTable count](self->_checkoutMap, "count");
  os_unfair_lock_unlock(p_checkoutLock);
  return v4;
}

- (id)checkOutConnectionWithOptions:(unint64_t)a3 error:(id *)a4
{
  NSObject *v7;
  NSObject *v8;
  void *cacheGeneration;
  OS_dispatch_group *v10;
  __uint64_t *v11;
  id WeakRetained;
  void *v13;
  int *p_count;
  unsigned int v15;
  _opaque_pthread_t *v16;
  void *v17;
  id v18;
  void *v21;

  if ((~(_BYTE)a3 & 0xC) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseConnectionPool.m"), 129, CFSTR("Cannot both prefer a cached connection and require a new one."));

  }
  -[HDDatabaseConnectionPool _semaphoreForCheckOutOptions:]((char *)self, a3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  -[NSCondition lock](self->_cacheCondition, "lock");
  cacheGeneration = (void *)self->_cacheGeneration;
  v10 = self->_flushGroup;
  if ((a3 & 4) != 0)
  {
    while (!-[NSMutableSet count](self->_cache, "count")
         && (void *)self->_cacheGeneration == cacheGeneration
         && -[HDDatabaseConnectionPool count](self, "count") >= 1)
      -[NSCondition wait](self->_cacheCondition, "wait");
  }
  if ((a3 & 8) != 0)
  {
    v11 = 0;
  }
  else
  {
    -[NSMutableSet anyObject](self->_cache, "anyObject");
    v11 = (__uint64_t *)objc_claimAutoreleasedReturnValue();
    if (v11)
      -[NSMutableSet removeObject:](self->_cache, "removeObject:", v11);
  }
  dispatch_group_enter((dispatch_group_t)v10);
  -[NSCondition unlock](self->_cacheCondition, "unlock");
  if (v11)
    goto LABEL_19;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = (void *)objc_msgSend(WeakRetained, "newConnectionForPool:error:", self, a4);

  if (v13)
  {
    p_count = &self->_count;
    do
      v15 = __ldaxr((unsigned int *)p_count);
    while (__stlxr(v15 + 1, (unsigned int *)p_count));
    v11 = (__uint64_t *)-[_HDDatabaseConnectionWrapper initWithConnection:flushGroup:generation:]((id *)[_HDDatabaseConnectionWrapper alloc], v13, v10, cacheGeneration);

    if (!v11)
    {
      -[HDDatabaseConnectionPool _addDatabaseWrapperToCheckoutMap:]((uint64_t)self, 0);
      v17 = 0;
      goto LABEL_20;
    }
LABEL_19:
    v16 = pthread_self();
    pthread_threadid_np(v16, v11 + 4);
    v11[5] = a3;
    -[HDDatabaseConnectionPool _addDatabaseWrapperToCheckoutMap:]((uint64_t)self, v11);
    v17 = (void *)v11[1];
LABEL_20:
    v18 = v17;

    goto LABEL_21;
  }
  dispatch_group_leave((dispatch_group_t)v10);
  if (v8)
    dispatch_semaphore_signal(v8);
  v18 = 0;
LABEL_21:

  return v18;
}

- (char)_semaphoreForCheckOutOptions:(char *)a1
{
  uint64_t v2;

  if (a1)
  {
    if ((a2 & 1) != 0)
    {
      v2 = 80;
    }
    else
    {
      if ((a2 & 2) != 0)
        return (char *)0;
      v2 = 72;
    }
    a1 = (char *)*(id *)&a1[v2];
  }
  return a1;
}

- (void)_addDatabaseWrapperToCheckoutMap:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  _QWORD *v4;
  uint64_t v5;

  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 60);
    v4 = a2;
    os_unfair_lock_lock(v3);
    if (v4)
      v5 = v4[1];
    else
      v5 = 0;
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKey:", v4, v5);

    os_unfair_lock_unlock(v3);
  }
}

- (id)_removeDatabaseFromCheckoutMap:(uint64_t)a1
{
  id v3;
  void *v4;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
    objc_msgSend(*(id *)(a1 + 64), "objectForKey:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1 + 64), "removeObjectForKey:", v3);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_didFlushDatabases:(uint64_t)a1
{
  id WeakRetained;
  id v4;

  v4 = a2;
  if (a1 && objc_msgSend(v4, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(WeakRetained, "databasePool:didFlushConnections:", a1, v4);

  }
}

- (HDDatabaseConnectionPool)initWithConcurrentReaderLimit:(int64_t)a3 delegate:(id)a4
{
  id v7;
  HDDatabaseConnectionPool *v8;
  NSCondition *v9;
  NSCondition *cacheCondition;
  NSMutableSet *v11;
  NSMutableSet *cache;
  dispatch_group_t v13;
  OS_dispatch_group *flushGroup;
  uint64_t v15;
  NSMapTable *checkoutMap;
  dispatch_semaphore_t v17;
  OS_dispatch_semaphore *writerSemaphore;
  dispatch_semaphore_t v19;
  OS_dispatch_semaphore *readerSemaphore;
  void *v21;
  void *v23;
  objc_super v24;

  v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDDatabaseConnectionPool;
  v8 = -[HDDatabaseConnectionPool init](&v24, sel_init);
  if (v8)
  {
    if (a3 <= 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("HDDatabaseConnectionPool.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("concurrentReaderLimit > 0"));

    }
    objc_storeWeak((id *)&v8->_delegate, v7);
    v9 = (NSCondition *)objc_alloc_init(MEMORY[0x24BDD14C8]);
    cacheCondition = v8->_cacheCondition;
    v8->_cacheCondition = v9;

    v8->_cacheSize = a3 + 1;
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    cache = v8->_cache;
    v8->_cache = v11;

    v13 = dispatch_group_create();
    flushGroup = v8->_flushGroup;
    v8->_flushGroup = (OS_dispatch_group *)v13;

    v8->_checkoutLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v15 = objc_claimAutoreleasedReturnValue();
    checkoutMap = v8->_checkoutMap;
    v8->_checkoutMap = (NSMapTable *)v15;

    v8->_concurrentReaderLimit = a3;
    v17 = dispatch_semaphore_create(1);
    writerSemaphore = v8->_writerSemaphore;
    v8->_writerSemaphore = (OS_dispatch_semaphore *)v17;

    v19 = dispatch_semaphore_create(v8->_concurrentReaderLimit);
    readerSemaphore = v8->_readerSemaphore;
    v8->_readerSemaphore = (OS_dispatch_semaphore *)v19;

    +[HDDiagnosticManager sharedDiagnosticManager](HDDiagnosticManager, "sharedDiagnosticManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObject:", v8);

  }
  return v8;
}

- (void)dealloc
{
  id v3;
  void *v4;
  objc_super v5;

  v3 = -[HDDatabaseConnectionPool flush](self, "flush");
  +[HDDiagnosticManager sharedDiagnosticManager](HDDiagnosticManager, "sharedDiagnosticManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", self);

  v5.receiver = self;
  v5.super_class = (Class)HDDatabaseConnectionPool;
  -[HDDatabaseConnectionPool dealloc](&v5, sel_dealloc);
}

- (int64_t)count
{
  return (int)atomic_load((unsigned int *)&self->_count);
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (int64_t)concurrentReaderLimit
{
  return self->_concurrentReaderLimit;
}

- (id)flush
{
  id v3;
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSMutableSet *v12;
  NSMutableSet *cache;
  OS_dispatch_group *v14;
  OS_dispatch_group *v15;
  OS_dispatch_group *flushGroup;
  int *p_count;
  int v18;
  unsigned int v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[NSCondition lock](self->_cacheCondition, "lock");
  if (-[NSMutableSet count](self->_cache, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = self->_cache;
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v8);
          if (v9)
            v10 = *(_QWORD *)(v9 + 8);
          else
            v10 = 0;
          objc_msgSend(v3, "addObject:", v10, (_QWORD)v21);
          ++v8;
        }
        while (v6 != v8);
        v11 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        v6 = v11;
      }
      while (v11);
    }

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    cache = self->_cache;
    self->_cache = v12;

  }
  v14 = self->_flushGroup;
  v15 = (OS_dispatch_group *)dispatch_group_create();
  flushGroup = self->_flushGroup;
  self->_flushGroup = v15;

  ++self->_cacheGeneration;
  p_count = &self->_count;
  v18 = objc_msgSend(v3, "count");
  do
    v19 = __ldaxr((unsigned int *)p_count);
  while (__stlxr(v19 - v18, (unsigned int *)p_count));
  -[NSCondition broadcast](self->_cacheCondition, "broadcast");
  -[NSCondition unlock](self->_cacheCondition, "unlock");
  -[HDDatabaseConnectionPool _didFlushDatabases:]((uint64_t)self, v3);

  return v14;
}

- (id)currentFlushGroup
{
  OS_dispatch_group *v3;

  -[NSCondition lock](self->_cacheCondition, "lock");
  v3 = self->_flushGroup;
  -[NSCondition unlock](self->_cacheCondition, "unlock");
  return v3;
}

- (id)diagnosticDescription
{
  void *v3;
  os_unfair_lock_s *p_checkoutLock;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  __CFString *v14;
  __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  NSMutableSet *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  _QWORD *v26;
  const __CFString *v27;
  os_unfair_lock_s *v29;
  HDDatabaseConnectionPool *v30;
  id obj;
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
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  p_checkoutLock = &self->_checkoutLock;
  os_unfair_lock_lock(&self->_checkoutLock);
  if (-[NSMapTable count](self->_checkoutMap, "count"))
  {
    v29 = &self->_checkoutLock;
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%lu connections in use:"), -[NSMapTable count](self->_checkoutMap, "count"));
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v30 = self;
    -[NSMapTable objectEnumerator](self->_checkoutMap, "objectEnumerator");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v37;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v37 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD **)(*((_QWORD *)&v36 + 1) + 8 * v8);
          if (v9)
          {
            v10 = v9[4];
            v11 = objc_opt_class();
            v12 = v9[5];
            v13 = CFSTR("reader (high prio)");
            if ((v12 & 2) == 0)
              v13 = CFSTR("reader");
            if ((v12 & 1) != 0)
              v14 = CFSTR("writer");
            else
              v14 = (__CFString *)v13;
            v15 = v14;
            v16 = v9[1];
          }
          else
          {
            v11 = objc_opt_class();
            v15 = 0;
            v10 = 0;
            v16 = 0;
          }
          objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t<%@:%p>: %@ %p on thread 0x%X (%llu)"), v11, v9, v15, v16, v10, v10);

          ++v8;
        }
        while (v6 != v8);
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        v6 = v17;
      }
      while (v17);
    }

    objc_msgSend(v3, "appendString:", CFSTR("\n"));
    p_checkoutLock = v29;
    self = v30;
  }
  os_unfair_lock_unlock(p_checkoutLock);
  -[NSCondition lock](self->_cacheCondition, "lock");
  v18 = -[NSMutableSet count](self->_cache, "count");
  if (v18)
  {
    v19 = "s";
    if (v18 == 1)
      v19 = "";
    objc_msgSend(v3, "appendFormat:", CFSTR("\n\t%lu cached connection%s:"), v18, v19);
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v20 = self->_cache;
    v21 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v33;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v33 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD **)(*((_QWORD *)&v32 + 1) + 8 * v24);
          if (v25)
            v25 = (_QWORD *)v25[1];
          v26 = v25;
          objc_msgSend(v3, "appendFormat:", CFSTR("\n\t\t<%@:%p>"), objc_opt_class(), v26);

          ++v24;
        }
        while (v22 != v24);
        v22 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      }
      while (v22);
    }

    v27 = CFSTR("\n");
  }
  else
  {
    v27 = CFSTR("\n\tNo cached connections\n");
  }
  objc_msgSend(v3, "appendString:", v27);
  -[NSCondition unlock](self->_cacheCondition, "unlock");
  return v3;
}

- (HDDatabaseConnectionPoolDelegate)delegate
{
  return (HDDatabaseConnectionPoolDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_writerSemaphore, 0);
  objc_storeStrong((id *)&self->_readerSemaphore, 0);
  objc_storeStrong((id *)&self->_checkoutMap, 0);
  objc_storeStrong((id *)&self->_flushGroup, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheCondition, 0);
}

@end
