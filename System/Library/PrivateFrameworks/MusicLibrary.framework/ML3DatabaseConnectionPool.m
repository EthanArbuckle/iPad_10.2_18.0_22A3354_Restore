@implementation ML3DatabaseConnectionPool

uint64_t __37__ML3DatabaseConnectionPool_isClosed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 168);
  return result;
}

uint64_t __98__ML3DatabaseConnectionPool__connectionForWriting_useThreadConnection_storeThreadLocalConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setUseCount:", objc_msgSend(*(id *)(a1 + 32), "useCount") + 1);
}

uint64_t __47__ML3DatabaseConnectionPool_checkInConnection___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setUseCount:", objc_msgSend(*(id *)(a1 + 32), "useCount") - 1);
  result = objc_msgSend(*(id *)(a1 + 32), "useCount");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result == 0;
  return result;
}

uint64_t __58__ML3DatabaseConnectionPool__setConnection_forIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;

  v2 = a1[4];
  v3 = *(void **)(a1[5] + 24);
  if (v2)
    return objc_msgSend(v3, "setObject:forKey:", v2, a1[6]);
  else
    return objc_msgSend(v3, "removeObjectForKey:", a1[6]);
}

- (id)_connectionForWriting:(BOOL)a3 useThreadConnection:(BOOL)a4 storeThreadLocalConnection:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  NSObject *serialQueue;
  id v23;
  _QWORD block[4];
  id v26;
  uint8_t buf[4];
  ML3DatabaseConnectionPool *v28;
  uint64_t v29;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v29 = *MEMORY[0x1E0C80C00];
  if (!-[ML3DatabaseConnectionPool isClosed](self, "isClosed"))
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[ML3DatabaseConnectionPool _localConnectionForThread:](self, "_localConnectionForThread:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = 0;
    }
    pthread_mutex_lock(&self->_poolLockMutex);
    while (self->_locked)
      pthread_cond_wait(&self->_poolLockCondition, &self->_poolLockMutex);
    pthread_mutex_unlock(&self->_poolLockMutex);
    if (v11)
    {
      if (!v7
        || (objc_msgSend(v11, "connection"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v12, "isReadOnly"),
            v12,
            !v13))
      {
        v14 = v11;
LABEL_26:
        serialQueue = self->_serialQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __98__ML3DatabaseConnectionPool__connectionForWriting_useThreadConnection_storeThreadLocalConnection___block_invoke;
        block[3] = &unk_1E5B65D80;
        v26 = v14;
        v23 = v14;
        dispatch_sync(serialQueue, block);
        objc_msgSend(v23, "connection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_27;
      }
      buf[0] = 0;
    }
    else
    {
      buf[0] = 0;
      if (!v7)
      {
        v15 = 8;
        if (!self->_maxReaders)
          v15 = 16;
        goto LABEL_19;
      }
    }
    v15 = 16;
LABEL_19:
    v16 = *(id *)((char *)&self->super.isa + v15);
    objc_msgSend(v16, "checkoutConnection:", buf);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (buf[0])
    {
      objc_msgSend(v14, "connection");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_setOwningPool:", self);

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v14, "connection");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "connectionPool:createdNewConnection:", self, v19);

      }
    }
    if (v5)
      -[ML3DatabaseConnectionPool _setLocalConnection:forThread:](self, "_setLocalConnection:forThread:", v14, v9);
    objc_msgSend(v14, "connection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ML3DatabaseConnectionPool _setConnection:forIdentifier:](self, "_setConnection:forIdentifier:", v14, v21);

    goto LABEL_26;
  }
  v9 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v28 = self;
    _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "Database connection pool %{public}@ is closed. You may no longer use it.", buf, 0xCu);
  }
  v10 = 0;
LABEL_27:

  return v10;
}

- (BOOL)isClosed
{
  NSObject *serialQueue;
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
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__ML3DatabaseConnectionPool_isClosed__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_setLocalConnection:(id)a3 forThread:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSObject *serialQueue;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  ML3DatabaseConnectionPool *v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "owningThread");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "owningThread");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionPool.m"), 409, CFSTR("Attempted to store local connection for thread %@ when it's already being marked as stored in thread %@"), v8, v13);

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ML3DatabaseConnectionPool__setLocalConnection_forThread___block_invoke;
  block[3] = &unk_1E5B659D0;
  v16 = v8;
  v17 = v7;
  v18 = self;
  v11 = v7;
  v14 = v8;
  dispatch_sync(serialQueue, block);

}

- (void)_setConnection:(id)a3 forIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *serialQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ML3DatabaseConnectionPool *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__ML3DatabaseConnectionPool__setConnection_forIdentifier___block_invoke;
  block[3] = &unk_1E5B659D0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(serialQueue, block);

}

- (void)checkInConnection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _ML3DatabaseConnectionSubPool *writersSubPool;
  NSObject *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *serialQueue;
  id v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  _ML3DatabaseConnectionSubPool *readersSubPool;
  NSObject *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  int v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD block[4];
  id v39;
  _BYTE *v40;
  uint8_t v41[4];
  ML3DatabaseConnectionPool *v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  _BYTE buf[24];
  _BOOL4 v48;
  _QWORD v49[3];
  _QWORD v50[3];
  void *v51;
  _QWORD v52[3];
  _QWORD v53[3];
  _QWORD v54[2];

  v54[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseConnectionPool _connectionForIdentifier:](self, "_connectionForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (!-[ML3DatabaseConnectionPool isClosed](self, "isClosed")
      || ((objc_msgSend(v7, "connection"),
           v8 = (void *)objc_claimAutoreleasedReturnValue(),
           !objc_msgSend(v8, "isReadOnly"))
        ? (writersSubPool = self->_writersSubPool)
        : (writersSubPool = self->_readersSubPool),
          v16 = -[_ML3DatabaseConnectionSubPool isBusyConnection:](writersSubPool, "isBusyConnection:", v7),
          v8,
          v16))
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionPool.m"), 254, CFSTR("Attempted to return connection %@ not owned by connection pool %@. (Connections in this pool: %@)"), v5, self, self->_identifiersConnectionsMap);

      }
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v48) = 0;
      serialQueue = self->_serialQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __47__ML3DatabaseConnectionPool_checkInConnection___block_invoke;
      block[3] = &unk_1E5B65E48;
      v18 = v7;
      v39 = v18;
      v40 = buf;
      dispatch_sync(serialQueue, block);
      if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        goto LABEL_31;
      objc_msgSend(v18, "owningThread");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19 == 0;

      if (!v20)
      {
        objc_msgSend(v18, "owningThread");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[ML3DatabaseConnectionPool _setLocalConnection:forThread:](self, "_setLocalConnection:forThread:", 0, v21);

        objc_msgSend(v18, "setOwningThread:", 0);
      }
      objc_msgSend(v18, "connection");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "uniqueIdentifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[ML3DatabaseConnectionPool _setConnection:forIdentifier:](self, "_setConnection:forIdentifier:", 0, v23);

      if (-[ML3DatabaseConnectionPool isClosed](self, "isClosed"))
      {
        v24 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v41 = 138543874;
          v42 = self;
          v43 = 2048;
          v44 = v5;
          v45 = 2114;
          v46 = v18;
          _os_log_impl(&dword_1AC149000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ closing connection=%p, wrapper=%{public}@", v41, 0x20u);
        }

        objc_msgSend(v18, "connection");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "isReadOnly");

        readersSubPool = self->_readersSubPool;
        goto LABEL_22;
      }
      objc_msgSend(v18, "connection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isReadOnly");

      if (v31)
      {
        readersSubPool = self->_readersSubPool;
      }
      else
      {
        objc_msgSend(v18, "connection");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "_closeConnectionWhenCheckingIn");

        readersSubPool = self->_writersSubPool;
        if (v33)
        {
LABEL_22:
          -[_ML3DatabaseConnectionSubPool closeConnection:](readersSubPool, "closeConnection:", v18);
LABEL_31:

          _Block_object_dispose(buf, 8);
          goto LABEL_36;
        }
      }
      -[_ML3DatabaseConnectionSubPool checkInConnection:](readersSubPool, "checkInConnection:", v18);
      goto LABEL_31;
    }
    v27 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v5;
      *(_WORD *)&buf[22] = 1024;
      v48 = -[ML3DatabaseConnectionPool isClosed](self, "isClosed");
      _os_log_impl(&dword_1AC149000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Cannot check in connection %{public}@. closed=%{BOOL}u", buf, 0x1Cu);
    }

    v28 = (void *)MEMORY[0x1E0D4D030];
    v49[0] = CFSTR("ML3DatabaseConnection");
    objc_msgSend(v5, "debugDescription");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v50[0] = v11;
    v49[1] = CFSTR("connectionWrapper");
    if (v7)
    {
      objc_msgSend(v7, "debugDescription");
      v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v29 = CFSTR("nil");
    }
    v50[1] = v29;
    v49[2] = CFSTR("ML3DatabaseConnectionPool");
    -[ML3DatabaseConnectionPool debugDescription](self, "debugDescription");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v34;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE40], CFSTR("Bug"), CFSTR("NotCheckingInConnection"), CFSTR("Connection not in busy pool"), 0, v36, 0);

    if (v7)
LABEL_35:

    goto LABEL_36;
  }
  v10 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = 0;
    *(_WORD *)&buf[22] = 1024;
    v48 = -[ML3DatabaseConnectionPool isClosed](self, "isClosed");
    _os_log_impl(&dword_1AC149000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Cannot check in connection %{public}@ as we don't have a valid connection wrapper. closed=%{BOOL}u", buf, 0x1Cu);
  }

  v11 = CFSTR("nil");
  v12 = (void *)MEMORY[0x1E0D4D030];
  v53[0] = CFSTR("nil");
  v52[0] = CFSTR("ML3DatabaseConnection");
  v52[1] = CFSTR("connectionWrapper");
  if (v7)
  {
    objc_msgSend(v7, "debugDescription");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v53[1] = v11;
  v52[2] = CFSTR("ML3DatabaseConnectionPool");
  -[ML3DatabaseConnectionPool debugDescription](self, "debugDescription");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v53[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", *MEMORY[0x1E0D4CE40], CFSTR("Bug"), CFSTR("NotCheckingInConnection"), CFSTR("No connection wrapper"), 0, v15, 0);

  if (v7)
    goto LABEL_35;
LABEL_36:

}

- (id)_connectionForIdentifier:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20513;
  v16 = __Block_byref_object_dispose__20514;
  v17 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ML3DatabaseConnectionPool__connectionForIdentifier___block_invoke;
  block[3] = &unk_1E5B65CF0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(serialQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __55__ML3DatabaseConnectionPool__localConnectionForThread___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "threadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ML3DatabaseConnectionPoolThreadStorageKey"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v3;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "owningThread");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == *(void **)(a1 + 32))
    goto LABEL_8;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "borrowingThread");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == *(void **)(a1 + 32))
  {

    goto LABEL_8;
  }
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("ML3DatabaseConnectionPool.m"), 402, CFSTR("Connection subpool stored a thread-contested connection %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
LABEL_8:

  }
}

void __59__ML3DatabaseConnectionPool__setLocalConnection_forThread___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "threadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("ML3DatabaseConnectionPoolThreadStorageKey"));
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v10;
  if (!v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(*(id *)(a1 + 32), "threadDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v11, CFSTR("ML3DatabaseConnectionPoolThreadStorageKey"));

    v3 = v11;
  }
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40);
  v12 = v3;
  if (!*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(v3, "removeObjectForKey:", v5);
    goto LABEL_10;
  }
  objc_msgSend(v3, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    goto LABEL_7;
  objc_msgSend(v6, "connection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isReadOnly");

  if (v9)
  {
    objc_msgSend(v7, "setOwningThread:", 0);
LABEL_7:
    objc_msgSend(v12, "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 40));
    objc_msgSend(*(id *)(a1 + 40), "setOwningThread:", *(_QWORD *)(a1 + 32));
  }

LABEL_10:
}

- (id)_localConnectionForThread:(id)a3
{
  id v5;
  NSObject *serialQueue;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  ML3DatabaseConnectionPool *v12;
  uint64_t *v13;
  SEL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__20513;
  v19 = __Block_byref_object_dispose__20514;
  v20 = 0;
  serialQueue = self->_serialQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__ML3DatabaseConnectionPool__localConnectionForThread___block_invoke;
  v10[3] = &unk_1E5B659F8;
  v11 = v5;
  v12 = self;
  v13 = &v15;
  v14 = a2;
  v7 = v5;
  dispatch_sync(serialQueue, v10);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)readerConnection
{
  return -[ML3DatabaseConnectionPool _connectionForWriting:useThreadConnection:storeThreadLocalConnection:](self, "_connectionForWriting:useThreadConnection:storeThreadLocalConnection:", 0, 1, 1);
}

void __54__ML3DatabaseConnectionPool__connectionForIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (ML3DatabaseConnectionPool)initWithDatabasePath:(id)a3 maxReaders:(unint64_t)a4 maxWriters:(unint64_t)a5
{
  id v9;
  ML3DatabaseConnectionPool *v10;
  uint64_t v11;
  NSString *databasePath;
  _ML3DatabaseConnectionSubPool *v13;
  _ML3DatabaseConnectionSubPool *readersSubPool;
  _ML3DatabaseConnectionSubPool *v15;
  _ML3DatabaseConnectionSubPool *writersSubPool;
  NSMutableDictionary *v17;
  NSMutableDictionary *identifiersConnectionsMap;
  dispatch_queue_t v19;
  OS_dispatch_queue *serialQueue;
  NSUUID *v21;
  NSUUID *poolStorageKey;
  void *v24;
  void *v25;
  objc_super v26;

  v9 = a3;
  v26.receiver = self;
  v26.super_class = (Class)ML3DatabaseConnectionPool;
  v10 = -[ML3DatabaseConnectionPool init](&v26, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    databasePath = v10->_databasePath;
    v10->_databasePath = (NSString *)v11;

    v10->_maxReaders = a4;
    v10->_maxWriters = a5;
    v10->_connectionsJournalingMode = 1;
    v10->_useDistantWriterConnections = __daemonProcessInfo == 0;
    v13 = -[_ML3DatabaseConnectionSubPool initWithDatabasePath:maxConcurrentConnections:]([_ML3DatabaseConnectionSubPool alloc], "initWithDatabasePath:maxConcurrentConnections:", v10->_databasePath, v10->_maxReaders);
    readersSubPool = v10->_readersSubPool;
    v10->_readersSubPool = v13;

    -[_ML3DatabaseConnectionSubPool setUseReadOnlyConnections:](v10->_readersSubPool, "setUseReadOnlyConnections:", 1);
    -[_ML3DatabaseConnectionSubPool setUseDistantConnections:](v10->_readersSubPool, "setUseDistantConnections:", 0);
    -[_ML3DatabaseConnectionSubPool setConnectionsJournalingMode:](v10->_readersSubPool, "setConnectionsJournalingMode:", v10->_connectionsJournalingMode);
    v15 = -[_ML3DatabaseConnectionSubPool initWithDatabasePath:maxConcurrentConnections:]([_ML3DatabaseConnectionSubPool alloc], "initWithDatabasePath:maxConcurrentConnections:", v10->_databasePath, v10->_maxWriters);
    writersSubPool = v10->_writersSubPool;
    v10->_writersSubPool = v15;

    -[_ML3DatabaseConnectionSubPool setUseReadOnlyConnections:](v10->_writersSubPool, "setUseReadOnlyConnections:", 0);
    -[_ML3DatabaseConnectionSubPool setUseDistantConnections:](v10->_writersSubPool, "setUseDistantConnections:", v10->_useDistantWriterConnections);
    -[_ML3DatabaseConnectionSubPool setConnectionsJournalingMode:](v10->_writersSubPool, "setConnectionsJournalingMode:", v10->_connectionsJournalingMode);
    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    identifiersConnectionsMap = v10->_identifiersConnectionsMap;
    v10->_identifiersConnectionsMap = v17;

    v19 = dispatch_queue_create("com.apple.MusicLibrary.ML3DatabaseConectionPool.serialQueue", 0);
    serialQueue = v10->_serialQueue;
    v10->_serialQueue = (OS_dispatch_queue *)v19;

    v21 = (NSUUID *)objc_alloc_init(MEMORY[0x1E0CB3A28]);
    poolStorageKey = v10->_poolStorageKey;
    v10->_poolStorageKey = v21;

    v10->_closed = 0;
    if (pthread_cond_init(&v10->_poolLockCondition, 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("ML3DatabaseConnectionPool.m"), 86, CFSTR("Failed to initialize condition variable."));

    }
    if (pthread_mutex_init(&v10->_poolLockMutex, 0))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("ML3DatabaseConnectionPool.m"), 89, CFSTR("Failed to initialize mutex."));

    }
  }

  return v10;
}

- (id)writerConnection
{
  return -[ML3DatabaseConnectionPool _connectionForWriting:useThreadConnection:storeThreadLocalConnection:](self, "_connectionForWriting:useThreadConnection:storeThreadLocalConnection:", 1, 1, 1);
}

- (ML3DatabaseConnectionPool)initWithDatabasePath:(id)a3 maxReaders:(unint64_t)a4
{
  return -[ML3DatabaseConnectionPool initWithDatabasePath:maxReaders:maxWriters:](self, "initWithDatabasePath:maxReaders:maxWriters:", a3, a4, 1);
}

- (ML3DatabaseConnectionPool)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-init is unsupported. Use -initWithDatabasePath: instead."));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  if (!-[ML3DatabaseConnectionPool isClosed](self, "isClosed"))
    -[ML3DatabaseConnectionPool lockAndCloseAllConnectionsForTermination](self, "lockAndCloseAllConnectionsForTermination");
  pthread_cond_destroy(&self->_poolLockCondition);
  pthread_mutex_destroy(&self->_poolLockMutex);
  v3.receiver = self;
  v3.super_class = (Class)ML3DatabaseConnectionPool;
  -[ML3DatabaseConnectionPool dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("ML3DatabaseConnectionPool=%p, maxReaders=%d, maxWriters=%d, journalingMode=%d, useDistantWriterConnections=%d, closed=%d"), self, self->_maxReaders, self->_maxWriters, self->_connectionsJournalingMode, self->_useDistantWriterConnections, self->_closed);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  -[_ML3DatabaseConnectionSubPool debugDescription](self->_readersSubPool, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("readerSubPool=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  -[_ML3DatabaseConnectionSubPool debugDescription](self->_writersSubPool, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("writerSubPool=%@"), v5);

  return v3;
}

- (void)setConnectionsJournalingMode:(unint64_t)a3
{
  self->_connectionsJournalingMode = a3;
  -[_ML3DatabaseConnectionSubPool setConnectionsJournalingMode:](self->_readersSubPool, "setConnectionsJournalingMode:");
  -[_ML3DatabaseConnectionSubPool setConnectionsJournalingMode:](self->_writersSubPool, "setConnectionsJournalingMode:", self->_connectionsJournalingMode);
}

- (BOOL)useDistantWriterConnections
{
  return self->_useDistantWriterConnections;
}

- (void)setUseDistantWriterConnections:(BOOL)a3
{
  self->_useDistantWriterConnections = a3;
  -[_ML3DatabaseConnectionSubPool closeConnectionsAndWaitForBusyConnections:](self->_writersSubPool, "closeConnectionsAndWaitForBusyConnections:", 1);
  -[_ML3DatabaseConnectionSubPool setUseDistantConnections:](self->_writersSubPool, "setUseDistantConnections:", self->_useDistantWriterConnections);
}

- (BOOL)isCurrentThreadConnectionInTransaction
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseConnectionPool _localConnectionForThread:](self, "_localConnectionForThread:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInTransaction");

  return v6;
}

- (void)closeAllConnections
{
  NSObject *v3;
  int v4;
  ML3DatabaseConnectionPool *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (-[ML3DatabaseConnectionPool isClosed](self, "isClosed"))
  {
    v3 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 138543362;
      v5 = self;
      _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Database connection pool %{public}@ is closed. You may no longer use it.", (uint8_t *)&v4, 0xCu);
    }

  }
  else
  {
    -[ML3DatabaseConnectionPool _closeAllConnectionsAndWaitForBusyConnections:](self, "_closeAllConnectionsAndWaitForBusyConnections:", 1);
  }
}

- (void)lock
{
  _opaque_pthread_mutex_t *p_poolLockMutex;

  p_poolLockMutex = &self->_poolLockMutex;
  pthread_mutex_lock(&self->_poolLockMutex);
  self->_locked = 1;
  pthread_mutex_unlock(p_poolLockMutex);
}

- (void)unlock
{
  _opaque_pthread_mutex_t *p_poolLockMutex;

  p_poolLockMutex = &self->_poolLockMutex;
  pthread_mutex_lock(&self->_poolLockMutex);
  self->_locked = 0;
  pthread_cond_broadcast(&self->_poolLockCondition);
  pthread_mutex_unlock(p_poolLockMutex);
}

- (void)lockAndCloseAllConnectionsForTermination
{
  -[ML3DatabaseConnectionPool setClosed:](self, "setClosed:", 1);
  -[ML3DatabaseConnectionPool lock](self, "lock");
  -[ML3DatabaseConnectionPool _closeAllConnectionsAndWaitForBusyConnections:](self, "_closeAllConnectionsAndWaitForBusyConnections:", 1);
}

- (void)setClosed:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD block[5];

  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ML3DatabaseConnectionPool_setClosed___block_invoke;
  block[3] = &unk_1E5B65D80;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

- (BOOL)ownsConnection:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ML3DatabaseConnectionPool _connectionForIdentifier:](self, "_connectionForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 != 0;

  return (char)self;
}

- (BOOL)isClosedWithNoActiveOrBusyConnections
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  NSObject *v6;
  int v8;
  ML3DatabaseConnectionPool *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = -[ML3DatabaseConnectionPool isClosed](self, "isClosed");
  v4 = -[_ML3DatabaseConnectionSubPool isClosedWithNoActiveOrBusyConnections](self->_readersSubPool, "isClosedWithNoActiveOrBusyConnections");
  v5 = -[_ML3DatabaseConnectionSubPool isClosedWithNoActiveOrBusyConnections](self->_writersSubPool, "isClosedWithNoActiveOrBusyConnections");
  v6 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138544130;
    v9 = self;
    v10 = 1024;
    v11 = v3;
    v12 = 1024;
    v13 = v4;
    v14 = 1024;
    v15 = v5;
    _os_log_impl(&dword_1AC149000, v6, OS_LOG_TYPE_DEFAULT, "Connection pool %{public}@ isClosed=%{BOOL}u, readerSubPoolClosed=%{BOOL}u, readerSubPoolClosed=%{BOOL}u.", (uint8_t *)&v8, 0x1Eu);
  }

  return v3 && v4 && v5;
}

- (void)_closeAllConnectionsAndWaitForBusyConnections:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int v6;
  ML3DatabaseConnectionPool *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138543618;
    v7 = self;
    v8 = 1024;
    v9 = v3;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Closing all connections and wait for busy connection=%{BOOL}u.", (uint8_t *)&v6, 0x12u);
  }

  -[_ML3DatabaseConnectionSubPool closeConnectionsAndWaitForBusyConnections:](self->_readersSubPool, "closeConnectionsAndWaitForBusyConnections:", v3);
  -[_ML3DatabaseConnectionSubPool closeConnectionsAndWaitForBusyConnections:](self->_writersSubPool, "closeConnectionsAndWaitForBusyConnections:", v3);
}

- (id)_generateDiagnostic
{
  _ML3MutableDatabaseConnectionPoolDiagnostic *v3;

  v3 = objc_alloc_init(_ML3MutableDatabaseConnectionPoolDiagnostic);
  -[_ML3DatabaseConnectionSubPool handleDiagnostic:](self->_readersSubPool, "handleDiagnostic:", v3);
  -[_ML3DatabaseConnectionSubPool handleDiagnostic:](self->_writersSubPool, "handleDiagnostic:", v3);
  return v3;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (ML3DatabaseConnectionPoolDelegate)delegate
{
  return (ML3DatabaseConnectionPoolDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)maxReaders
{
  return self->_maxReaders;
}

- (unint64_t)maxWriters
{
  return self->_maxWriters;
}

- (unint64_t)connectionsJournalingMode
{
  return self->_connectionsJournalingMode;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_poolStorageKey, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_identifiersConnectionsMap, 0);
  objc_storeStrong((id *)&self->_writersSubPool, 0);
  objc_storeStrong((id *)&self->_readersSubPool, 0);
}

uint64_t __39__ML3DatabaseConnectionPool_setClosed___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 168) = 1;
  return result;
}

@end
