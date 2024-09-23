@implementation _ML3DatabaseConnectionSubPool

- (void)checkInConnection:(id)a3 returnToPool:(BOOL)a4
{
  id v6;
  NSObject *checkinQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  checkinQueue = self->_checkinQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64___ML3DatabaseConnectionSubPool_checkInConnection_returnToPool___block_invoke;
  block[3] = &unk_1E5B65AA0;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_sync(checkinQueue, block);

}

- (id)checkoutConnection:(BOOL *)a3
{
  NSObject *checkoutQueue;
  id v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__20513;
  v16 = __Block_byref_object_dispose__20514;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  checkoutQueue = self->_checkoutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52___ML3DatabaseConnectionSubPool_checkoutConnection___block_invoke;
  block[3] = &unk_1E5B65A78;
  block[4] = self;
  block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(checkoutQueue, block);
  if (a3)
    *a3 = *((_BYTE *)v9 + 24);
  v5 = (id)v13[5];
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

- (void)checkInConnection:(id)a3
{
  -[_ML3DatabaseConnectionSubPool checkInConnection:returnToPool:](self, "checkInConnection:returnToPool:", a3, 1);
}

- (void)setUseReadOnlyConnections:(BOOL)a3
{
  self->_useReadOnlyConnections = a3;
}

- (void)setUseDistantConnections:(BOOL)a3
{
  self->_useDistantConnections = a3;
}

- (void)setConnectionsJournalingMode:(unint64_t)a3
{
  self->_connectionsJournalingMode = a3;
}

- (_ML3DatabaseConnectionSubPool)initWithDatabasePath:(id)a3 maxConcurrentConnections:(unint64_t)a4
{
  id v6;
  _ML3DatabaseConnectionSubPool *v7;
  uint64_t v8;
  NSString *databasePath;
  dispatch_queue_t v10;
  OS_dispatch_queue *checkoutQueue;
  dispatch_queue_t v12;
  OS_dispatch_queue *checkinQueue;
  dispatch_queue_t v14;
  OS_dispatch_queue *serialQueue;
  dispatch_semaphore_t v16;
  OS_dispatch_semaphore *waitingSemaphore;
  NSMutableSet *v18;
  NSMutableSet *availableConnections;
  NSMutableSet *v20;
  NSMutableSet *busyConnections;
  const char *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  _QWORD handler[4];
  id v32;
  id location;
  objc_super v34;

  v6 = a3;
  v34.receiver = self;
  v34.super_class = (Class)_ML3DatabaseConnectionSubPool;
  v7 = -[_ML3DatabaseConnectionSubPool init](&v34, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    databasePath = v7->_databasePath;
    v7->_databasePath = (NSString *)v8;

    v7->_maxConcurrentConnections = a4;
    *(_WORD *)&v7->_useReadOnlyConnections = 0;
    v10 = dispatch_queue_create("com.apple.MusicLibrary._ML3DatabaseConnectionSubPool.checkoutQueue", 0);
    checkoutQueue = v7->_checkoutQueue;
    v7->_checkoutQueue = (OS_dispatch_queue *)v10;

    v12 = dispatch_queue_create("com.apple.MusicLibrary._ML3DatabaseConnectionSubPool.checkinQueue", 0);
    checkinQueue = v7->_checkinQueue;
    v7->_checkinQueue = (OS_dispatch_queue *)v12;

    v14 = dispatch_queue_create("com.apple.MusicLibrary._ML3DatabaseConnectionSubPool.serialQueue", 0);
    serialQueue = v7->_serialQueue;
    v7->_serialQueue = (OS_dispatch_queue *)v14;

    v16 = dispatch_semaphore_create(v7->_maxConcurrentConnections);
    waitingSemaphore = v7->_waitingSemaphore;
    v7->_waitingSemaphore = (OS_dispatch_semaphore *)v16;

    v18 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    availableConnections = v7->_availableConnections;
    v7->_availableConnections = v18;

    v20 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    busyConnections = v7->_busyConnections;
    v7->_busyConnections = v20;

    if (!__daemonProcessInfo)
    {
      objc_initWeak(&location, v7);
      v22 = (const char *)objc_msgSend(CFSTR("MLMediaLibraryWillDeleteDatabaseNotification"), "UTF8String");
      v23 = MEMORY[0x1E0C80D38];
      v24 = MEMORY[0x1E0C80D38];
      v25 = MEMORY[0x1E0C809B0];
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __79___ML3DatabaseConnectionSubPool_initWithDatabasePath_maxConcurrentConnections___block_invoke;
      handler[3] = &unk_1E5B65A28;
      objc_copyWeak(&v32, &location);
      notify_register_dispatch(v22, &v7->_willDeleteDatabaseNotifyToken, v23, handler);
      v26 = MEMORY[0x1E0C80D38];

      v28[0] = v25;
      v28[1] = 3221225472;
      v28[2] = __79___ML3DatabaseConnectionSubPool_initWithDatabasePath_maxConcurrentConnections___block_invoke_181;
      v28[3] = &unk_1E5B65A50;
      objc_copyWeak(&v30, &location);
      v29 = v6;
      notify_register_dispatch("HSCachesClearedNotification", &v7->_homeSharingCachesClearedNotifyToken, v26, v28);

      objc_destroyWeak(&v30);
      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }

  return v7;
}

- (_ML3DatabaseConnectionSubPool)init
{
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("-init is unsupported. use -initWithDatabasePath:maxConcurrentConnections:"));

  return 0;
}

- (void)dealloc
{
  dispatch_semaphore_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v13;
  _QWORD v14[4];
  dispatch_semaphore_t v15;
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_busyConnections, "count"))
  {
    v4 = dispatch_semaphore_create(0);
    v5 = (void *)MEMORY[0x1E0D4D030];
    v6 = *MEMORY[0x1E0D4CE40];
    v16[0] = CFSTR("BusyConnectionCount");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableSet count](self->_busyConnections, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("DatabaseConnectionPool");
    v17[0] = v7;
    -[_ML3DatabaseConnectionSubPool debugDescription](self, "debugDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __40___ML3DatabaseConnectionSubPool_dealloc__block_invoke;
    v14[3] = &unk_1E5B65D80;
    v15 = v4;
    v11 = v4;
    objc_msgSend(v5, "snapshotWithDomain:type:subType:context:triggerThresholdValues:events:completion:", v6, CFSTR("Bug"), CFSTR("ConnectionPoolInBadState"), CFSTR("Deallocating with active connections"), 0, v10, v14);

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  if (-[NSMutableSet count](self->_busyConnections, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3DatabaseConnectionPool.m"), 551, CFSTR("deallocating pool %@ has %lld active connections"), self, -[NSMutableSet count](self->_busyConnections, "count"));

  }
  notify_cancel(self->_homeSharingCachesClearedNotifyToken);
  notify_cancel(self->_willDeleteDatabaseNotifyToken);
  -[_ML3DatabaseConnectionSubPool closeConnectionsAndWaitForBusyConnections:](self, "closeConnectionsAndWaitForBusyConnections:", 0);
  v13.receiver = self;
  v13.super_class = (Class)_ML3DatabaseConnectionSubPool;
  -[_ML3DatabaseConnectionSubPool dealloc](&v13, sel_dealloc);
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("ML3DatabaseConnectionSubPool=%p, maxConcurrentConnections=%lu, useReadOnlyConnections=%d, useDistantConnections=%d"), self, self->_maxConcurrentConnections, self->_useReadOnlyConnections, self->_useDistantConnections);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  -[NSMutableSet debugDescription](self->_availableConnections, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("availableConnections=%@"), v4);

  objc_msgSend(v3, "appendString:", CFSTR("\n"));
  -[NSMutableSet debugDescription](self->_busyConnections, "debugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("busyConnections=%@"), v5);

  return v3;
}

- (BOOL)isClosedWithNoActiveOrBusyConnections
{
  NSObject *checkinQueue;
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
  checkinQueue = self->_checkinQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70___ML3DatabaseConnectionSubPool_isClosedWithNoActiveOrBusyConnections__block_invoke;
  v5[3] = &unk_1E5B65E48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(checkinQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)closeConnection:(id)a3
{
  id v4;
  NSObject *checkinQueue;
  id v6;
  _QWORD block[4];
  id v8;
  _ML3DatabaseConnectionSubPool *v9;

  v4 = a3;
  checkinQueue = self->_checkinQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49___ML3DatabaseConnectionSubPool_closeConnection___block_invoke;
  block[3] = &unk_1E5B65EB8;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(checkinQueue, block);

}

- (void)closeConnectionsAndWaitForBusyConnections:(BOOL)a3
{
  id v4;
  NSObject *v5;
  _ML3DatabaseConnectionSubPool *v6;
  int v7;
  int v8;
  NSObject *serialQueue;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  id v19;
  int v20;
  void *v21;
  id obj;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD block[5];
  id v29;
  uint64_t *v30;
  BOOL v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint8_t buf[4];
  _ML3DatabaseConnectionSubPool *v37;
  __int16 v38;
  _BYTE v39[10];
  int v40;
  _BYTE v41[128];
  uint64_t v42;

  v23 = a3;
  v42 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v5 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[_ML3DatabaseConnectionSubPool debugDescription](self, "debugDescription");
    v6 = (_ML3DatabaseConnectionSubPool *)(id)objc_claimAutoreleasedReturnValue();
    v7 = -[NSMutableSet count](self->_availableConnections, "count");
    v8 = -[NSMutableSet count](self->_busyConnections, "count");
    *(_DWORD *)buf = 138543874;
    v37 = v6;
    v38 = 1024;
    *(_DWORD *)v39 = v7;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v8;
    _os_log_impl(&dword_1AC149000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ closeConnectionsAndWaitForBusyConnections _availableConnections (count) = %d, _busyConnections (count) = %d", buf, 0x18u);

  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75___ML3DatabaseConnectionSubPool_closeConnectionsAndWaitForBusyConnections___block_invoke;
  block[3] = &unk_1E5B65AC8;
  block[4] = self;
  v31 = v23;
  v10 = v4;
  v29 = v10;
  v30 = &v32;
  dispatch_sync(serialQueue, block);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", self->_maxConcurrentConnections);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 && *((_BYTE *)v33 + 24) && self->_maxConcurrentConnections)
  {
    v12 = 0;
    do
    {
      buf[0] = 0;
      -[_ML3DatabaseConnectionSubPool checkoutConnection:](self, "checkoutConnection:", buf);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(v10, "addObject:", v13);
        if (buf[0])
          objc_msgSend(v11, "addObject:", v13);
      }

      ++v12;
    }
    while (self->_maxConcurrentConnections > v12);
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v41, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        v18 = os_log_create("com.apple.amp.medialibrary", "Default_Oversize");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v17, "debugDescription");
          v19 = (id)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v11, "containsObject:", v17);
          *(_DWORD *)buf = 138543874;
          v37 = self;
          v38 = 2114;
          *(_QWORD *)v39 = v19;
          *(_WORD *)&v39[8] = 1024;
          v40 = v20 ^ 1;
          _os_log_impl(&dword_1AC149000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ closing open connection=%{public}@, returnToPool=%{BOOL}u", buf, 0x1Cu);

        }
        objc_msgSend(v17, "connection");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "close");

        if (v23)
          -[_ML3DatabaseConnectionSubPool checkInConnection:returnToPool:](self, "checkInConnection:returnToPool:", v17, objc_msgSend(v11, "containsObject:", v17) ^ 1);
      }
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v41, 16);
    }
    while (v14);
  }

  _Block_object_dispose(&v32, 8);
}

- (void)handleDiagnostic:(id)a3
{
  id v4;
  NSObject *serialQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___ML3DatabaseConnectionSubPool_handleDiagnostic___block_invoke;
  block[3] = &unk_1E5B65EB8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(serialQueue, block);

}

- (BOOL)isBusyConnection:(id)a3
{
  id v4;
  NSObject *checkinQueue;
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
  checkinQueue = self->_checkinQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50___ML3DatabaseConnectionSubPool_isBusyConnection___block_invoke;
  block[3] = &unk_1E5B65CF0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(checkinQueue, block);
  LOBYTE(checkinQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)checkinQueue;
}

- (void)_handleDatabaseDeletion
{
  NSObject *v3;
  int v4;
  _ML3DatabaseConnectionSubPool *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.amp.medialibrary", "Default");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1AC149000, v3, OS_LOG_TYPE_DEFAULT, "Connection subpool %{public}@ closing all connections.", (uint8_t *)&v4, 0xCu);
  }

  -[_ML3DatabaseConnectionSubPool closeConnectionsAndWaitForBusyConnections:](self, "closeConnectionsAndWaitForBusyConnections:", 0);
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (unint64_t)maxConcurrentConnections
{
  return self->_maxConcurrentConnections;
}

- (BOOL)useReadOnlyConnections
{
  return self->_useReadOnlyConnections;
}

- (BOOL)useDistantConnections
{
  return self->_useDistantConnections;
}

- (unint64_t)connectionsJournalingMode
{
  return self->_connectionsJournalingMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_busyConnections, 0);
  objc_storeStrong((id *)&self->_availableConnections, 0);
  objc_storeStrong((id *)&self->_waitingSemaphore, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_checkinQueue, 0);
  objc_storeStrong((id *)&self->_checkoutQueue, 0);
}

@end
