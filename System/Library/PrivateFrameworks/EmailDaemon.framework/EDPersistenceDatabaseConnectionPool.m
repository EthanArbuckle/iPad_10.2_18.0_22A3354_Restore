@implementation EDPersistenceDatabaseConnectionPool

- (EDPersistenceDatabaseConnectionPool)initWithDelegate:(id)a3 maxConcurrentBackgroundReaders:(unint64_t)a4
{
  id v7;
  EDPersistenceDatabaseConnectionPool *v8;
  NSLock *v9;
  NSLock *cacheLock;
  NSLock *v11;
  NSLock *checkoutLock;
  uint64_t v13;
  NSMapTable *checkoutMap;
  NSLock *v15;
  NSLock *writerLock;
  uint64_t v17;
  EFResourcePool *backgroundReaderResources;
  void *v20;
  objc_super v21;

  v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EDPersistenceDatabaseConnectionPool;
  v8 = -[EDPersistenceDatabaseConnectionPool init](&v21, sel_init);
  if (v8)
  {
    if (!a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("EDPersistenceDatabaseConnectionPool.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maxConcurrentBackgroundReaders > 0"));

    }
    objc_storeWeak((id *)&v8->_delegate, v7);
    v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    cacheLock = v8->_cacheLock;
    v8->_cacheLock = v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    checkoutLock = v8->_checkoutLock;
    v8->_checkoutLock = v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v13 = objc_claimAutoreleasedReturnValue();
    checkoutMap = v8->_checkoutMap;
    v8->_checkoutMap = (NSMapTable *)v13;

    v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    writerLock = v8->_writerLock;
    v8->_writerLock = v15;

    v8->_maxConcurrentBackgroundReaders = a4;
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1EF80]), "initWithCount:", v8->_maxConcurrentBackgroundReaders);
    backgroundReaderResources = v8->_backgroundReaderResources;
    v8->_backgroundReaderResources = (EFResourcePool *)v17;

    -[EDPersistenceDatabaseConnectionPool setCacheSize:](v8, "setCacheSize:", v8->_maxConcurrentBackgroundReaders);
  }

  return v8;
}

- (void)setCacheSize:(unint64_t)a3
{
  id v5;
  void *v6;
  NSMutableSet *v7;
  NSMutableSet *cache;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NSLock lock](self->_cacheLock, "lock");
  while (-[NSMutableSet count](self->_cache, "count") > a3)
  {
    -[NSMutableSet anyObject](self->_cache, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);
    -[NSMutableSet removeObject:](self->_cache, "removeObject:", v6);

  }
  if (a3 && !self->_cache)
  {
    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    cache = self->_cache;
    self->_cache = v7;

  }
  self->_cacheSize = a3;
  -[NSLock unlock](self->_cacheLock, "unlock");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v5;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "connection", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "close");

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)checkInConnection:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[NSLock lock](self->_checkoutLock, "lock");
  -[NSMapTable objectForKey:](self->_checkoutMap, "objectForKey:", v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[NSMapTable removeObjectForKey:](self->_checkoutMap, "removeObjectForKey:", v9);
  -[NSLock unlock](self->_checkoutLock, "unlock");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EDPersistenceDatabaseConnectionPool.m"), 200, CFSTR("No connection wrapper found"));

  }
  v6 = objc_msgSend(v5, "type");
  objc_msgSend(v5, "resource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSLock lock](self->_cacheLock, "lock");
  if (objc_msgSend(v5, "generation") == self->_cacheGeneration)
  {
    if (objc_msgSend(v9, "isWriter"))
    {
      objc_storeStrong((id *)&self->_writerConnection, v5);
    }
    else if (-[NSMutableSet count](self->_cache, "count") < self->_cacheSize)
    {
      -[NSMutableSet addObject:](self->_cache, "addObject:", v5);
    }
  }
  else
  {
    objc_msgSend(v9, "close");
  }
  -[NSLock unlock](self->_cacheLock, "unlock");
  -[EDPersistenceDatabaseConnectionPool _unlockForConnectionType:resource:](self, "_unlockForConnectionType:resource:", v6, v7);

}

- (id)_connectionWithType:(unint64_t)a3
{
  _BOOL8 v5;
  id v6;
  unint64_t cacheGeneration;
  _EDPersistenceDatabaseConnectionWrapper *v8;
  _EDPersistenceDatabaseConnectionWrapper *writerConnection;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  id v14;

  v14 = 0;
  v5 = -[EDPersistenceDatabaseConnectionPool _lockForConnectionType:resource:](self, "_lockForConnectionType:resource:", a3, &v14);
  v6 = v14;
  -[NSLock lock](self->_cacheLock, "lock");
  cacheGeneration = self->_cacheGeneration;
  if (v5)
  {
    v8 = self->_writerConnection;
    writerConnection = self->_writerConnection;
    self->_writerConnection = 0;

  }
  else
  {
    -[NSMutableSet anyObject](self->_cache, "anyObject");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v8 = (_EDPersistenceDatabaseConnectionWrapper *)v10;
      -[NSMutableSet removeObject:](self->_cache, "removeObject:");
    }
    else
    {
      v8 = 0;
    }
  }
  -[NSLock unlock](self->_cacheLock, "unlock");
  if (!v8)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "openConnectionIsWriter:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "isValid"))
    {
      v8 = -[_EDPersistenceDatabaseConnectionWrapper initWithConnection:generation:]([_EDPersistenceDatabaseConnectionWrapper alloc], "initWithConnection:generation:", v11, cacheGeneration);
      if (v11)
        goto LABEL_11;
    }
    else
    {

      v8 = 0;
    }
LABEL_13:
    v11 = 0;
    -[EDPersistenceDatabaseConnectionPool _unlockForConnectionType:resource:](self, "_unlockForConnectionType:resource:", a3, v6);
    goto LABEL_14;
  }
  -[_EDPersistenceDatabaseConnectionWrapper connection](v8, "connection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_13;
LABEL_11:
  -[_EDPersistenceDatabaseConnectionWrapper setType:](v8, "setType:", a3);
  -[_EDPersistenceDatabaseConnectionWrapper setResource:](v8, "setResource:", v6);
  -[NSLock lock](self->_checkoutLock, "lock");
  -[NSMapTable setObject:forKey:](self->_checkoutMap, "setObject:forKey:", v8, v11);
  -[NSLock unlock](self->_checkoutLock, "unlock");
LABEL_14:

  return v11;
}

- (BOOL)_lockForConnectionType:(unint64_t)a3 resource:(id *)a4
{
  int *p_writersWaiting;
  unsigned int v6;
  NSObject *v7;
  unsigned int v8;
  unsigned int v9;
  NSObject *v10;
  BOOL v11;
  int *p_backgroundReadersWaiting;
  unsigned int v14;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  int v19;
  unsigned int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a3 == 2)
  {
    p_backgroundReadersWaiting = &self->_backgroundReadersWaiting;
    do
      v14 = __ldaxr((unsigned int *)p_backgroundReadersWaiting);
    while (__stlxr(v14 + 1, (unsigned int *)p_backgroundReadersWaiting));
    _ef_log_EDPersistenceDatabaseConnectionPool();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v19 = 67109120;
      v20 = v14 + 1;
      _os_log_impl(&dword_1D2F2C000, v15, OS_LOG_TYPE_INFO, "waiting for background read connection (%d waiters)", (uint8_t *)&v19, 8u);
    }

    -[EFResourcePool acquireResource](self->_backgroundReaderResources, "acquireResource");
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    do
    {
      v16 = __ldaxr((unsigned int *)p_backgroundReadersWaiting);
      v17 = v16 - 1;
    }
    while (__stlxr(v16 - 1, (unsigned int *)p_backgroundReadersWaiting));
    _ef_log_EDPersistenceDatabaseConnectionPool();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v19 = 67109120;
      v20 = v17;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_INFO, "acquired background read connection (%d waiters)", (uint8_t *)&v19, 8u);
    }
    v11 = 0;
  }
  else
  {
    if (a3)
      return 0;
    p_writersWaiting = &self->_writersWaiting;
    do
      v6 = __ldaxr((unsigned int *)p_writersWaiting);
    while (__stlxr(v6 + 1, (unsigned int *)p_writersWaiting));
    _ef_log_EDPersistenceDatabaseConnectionPool();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 67109120;
      v20 = v6 + 1;
      _os_log_impl(&dword_1D2F2C000, v7, OS_LOG_TYPE_DEFAULT, "waiting for write connection (%d waiters)", (uint8_t *)&v19, 8u);
    }

    -[NSLock lock](self->_writerLock, "lock");
    do
    {
      v8 = __ldaxr((unsigned int *)p_writersWaiting);
      v9 = v8 - 1;
    }
    while (__stlxr(v8 - 1, (unsigned int *)p_writersWaiting));
    _ef_log_EDPersistenceDatabaseConnectionPool();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v19 = 67109120;
      v20 = v9;
      _os_log_impl(&dword_1D2F2C000, v10, OS_LOG_TYPE_DEFAULT, "acquired write connection (%d waiters)", (uint8_t *)&v19, 8u);
    }
    v11 = 1;
  }

  return v11;
}

- (void)_unlockForConnectionType:(unint64_t)a3 resource:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = v6;
  if (a3 == 2)
  {
    -[EFResourcePool releaseResource:](self->_backgroundReaderResources, "releaseResource:", v6);
  }
  else if (!a3)
  {
    -[NSLock unlock](self->_writerLock, "unlock");
  }

}

- (id)backgroundReaderConnection
{
  return -[EDPersistenceDatabaseConnectionPool _connectionWithType:](self, "_connectionWithType:", 2);
}

- (id)readerConnection
{
  return -[EDPersistenceDatabaseConnectionPool _connectionWithType:](self, "_connectionWithType:", 1);
}

- (id)writerConnection
{
  return -[EDPersistenceDatabaseConnectionPool _connectionWithType:](self, "_connectionWithType:", 0);
}

void ___ef_log_EDPersistenceDatabaseConnectionPool_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.email", "EDPersistenceDatabaseConnectionPool");
  v1 = (void *)_ef_log_EDPersistenceDatabaseConnectionPool_log;
  _ef_log_EDPersistenceDatabaseConnectionPool_log = (uint64_t)v0;

}

- (EDPersistenceDatabaseConnectionPool)init
{
  -[EDPersistenceDatabaseConnectionPool doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __assert_rtn("-[EDPersistenceDatabaseConnectionPool init]", "EDPersistenceDatabaseConnectionPool.m", 63, "0");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[EDPersistenceDatabaseConnectionPool setCacheSize:](self, "setCacheSize:", 0);
  -[_EDPersistenceDatabaseConnectionWrapper connection](self->_writerConnection, "connection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "close");

  v4.receiver = self;
  v4.super_class = (Class)EDPersistenceDatabaseConnectionPool;
  -[EDPersistenceDatabaseConnectionPool dealloc](&v4, sel_dealloc);
}

- (void)flush
{
  id v3;
  NSMutableSet *v4;
  NSMutableSet *cache;
  _EDPersistenceDatabaseConnectionWrapper *writerConnection;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[NSLock lock](self->_cacheLock, "lock");
  if (-[NSMutableSet count](self->_cache, "count"))
  {
    objc_msgSend(v3, "unionSet:", self->_cache);
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    cache = self->_cache;
    self->_cache = v4;

  }
  if (self->_writerConnection)
  {
    objc_msgSend(v3, "addObject:");
    writerConnection = self->_writerConnection;
    self->_writerConnection = 0;

  }
  ++self->_cacheGeneration;
  -[NSLock unlock](self->_cacheLock, "unlock");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "connection", (_QWORD)v12);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "close");

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (unint64_t)cacheSize
{
  unint64_t cacheSize;

  -[NSLock lock](self->_cacheLock, "lock");
  cacheSize = self->_cacheSize;
  -[NSLock unlock](self->_cacheLock, "unlock");
  return cacheSize;
}

- (unint64_t)maxConcurrentReaders
{
  return self->_maxConcurrentBackgroundReaders;
}

- (unint64_t)backgroundReadersWaiting
{
  return self->_backgroundReadersWaiting;
}

- (unint64_t)writersWaiting
{
  return self->_writersWaiting;
}

- (EDPersistenceDatabaseConnectionPoolDelegate)delegate
{
  return (EDPersistenceDatabaseConnectionPoolDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)maxConcurrentBackgroundReaders
{
  return self->_maxConcurrentBackgroundReaders;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundReaderResources, 0);
  objc_storeStrong((id *)&self->_writerConnection, 0);
  objc_storeStrong((id *)&self->_writerLock, 0);
  objc_storeStrong((id *)&self->_checkoutMap, 0);
  objc_storeStrong((id *)&self->_checkoutLock, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheLock, 0);
}

@end
