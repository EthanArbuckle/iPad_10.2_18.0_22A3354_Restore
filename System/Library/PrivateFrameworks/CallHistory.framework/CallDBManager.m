@implementation CallDBManager

- (BOOL)notifyDataStoreChanged
{
  CallDBManager *v2;
  int v3;
  BOOL v4;
  BOOL v5;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[CallDBManager dataStoreType](v2, "dataStoreType");
  if (v3)
  {
    if (v3 != 1)
    {
      v5 = 0;
      goto LABEL_11;
    }
    if (!-[CallDBManager notifyDataStoreChangeReason](v2, "notifyDataStoreChangeReason"))
    {
      v5 = 1;
      goto LABEL_11;
    }
    v4 = -[CallDBManager notifyDataStoreChangeReason](v2, "notifyDataStoreChangeReason") == 2;
  }
  else
  {
    v4 = -[CallDBManager notifyDataStoreChangeReason](v2, "notifyDataStoreChangeReason") == 1;
  }
  v5 = v4;
LABEL_11:
  objc_sync_exit(v2);

  return v5;
}

- (unsigned)notifyDataStoreChangeReason
{
  return self->_notifyDataStoreChangeReason;
}

- (void)handlePermanentCreated
{
  void *v3;
  void *v4;

  -[CallDBManager dbManager](self, "dbManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CallDBManager tempDBLocation:](self, "tempDBLocation:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeDataStoreAtLocation:", v4);

  -[CallDBManager setDataStoreType:](self, "setDataStoreType:", 1);
  -[CallDBManager moveCallsFromTempDatabase](self, "moveCallsFromTempDatabase");
}

+ (id)getDBLocationIsSandboxed:(BOOL)a3 isTemporary:(BOOL)a4 error:(unsigned __int8 *)a5
{
  _BOOL4 v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  v5 = a4;
  if (a3)
    getAppSupportDirSandboxed(CFSTR("CallHistoryDB"), a5);
  else
    getAppSupportDir(a1, a2, a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = CFSTR("CallHistory");
    if (v5)
      v7 = CFSTR("CallHistoryTemp");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@/%@.%@"), CFSTR("CallHistoryDB"), v7, CFSTR("storedata"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)setDataStoreType:(unsigned __int8)a3
{
  self->_dataStoreType = a3;
}

- (void)createDataStore
{
  CallDBManager *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  _QWORD v17[5];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  -[CallDBManager deviceObserver](v2, "deviceObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isBootLockEnabled");

  if (v4)
  {
    if (-[CallDBManager shouldCreateTemporary](v2, "shouldCreateTemporary"))
    {
      -[CallDBManager dbManager](v2, "dbManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "fPersistentStoreCoordinator");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __32__CallDBManager_createDataStore__block_invoke;
      v17[3] = &unk_1E6746460;
      v17[4] = v2;
      objc_msgSend(v6, "performBlockAndWait:", v17);

      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logHandleForDomain:", "ch.calldbm");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v8;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        getBoolAsString(-[CallDBManager dataStoreType](v2, "dataStoreType") == 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v19 = v10;
        _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "Initialized temporary data store: %{public}@", buf, 0xCu);

      }
LABEL_8:

    }
  }
  else if (-[CallDBManager shouldCreatePermanent](v2, "shouldCreatePermanent"))
  {
    -[CallDBManager dbManager](v2, "dbManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fPersistentStoreCoordinator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __32__CallDBManager_createDataStore__block_invoke_30;
    v16[3] = &unk_1E6746460;
    v16[4] = v2;
    objc_msgSend(v12, "performBlockAndWait:", v16);

    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "logHandleForDomain:", "ch.calldbm");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v14;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      getBoolAsString(-[CallDBManager dataStoreType](v2, "dataStoreType") == 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_1B3FA4000, v9, OS_LOG_TYPE_DEFAULT, "Initialized permanent data store: %{public}@", buf, 0xCu);

    }
    goto LABEL_8;
  }
  objc_sync_exit(v2);

}

- (id)createManagedObjectContext
{
  void *v2;
  void *v3;

  -[CallDBManager dbManager](self, "dbManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "createManagedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (DBManager)dbManager
{
  return self->_dbManager;
}

- (BOOL)shouldCreatePermanent
{
  return !-[CallDBManager dataStoreType](self, "dataStoreType")
      || -[CallDBManager dataStoreType](self, "dataStoreType") == 2;
}

- (unsigned)dataStoreType
{
  return self->_dataStoreType;
}

- (CHDeviceObserver)deviceObserver
{
  return self->_deviceObserver;
}

- (CallDBManager)init
{
  CHDeviceObserver *v3;
  CallDBManager *v4;

  v3 = objc_alloc_init(CHDeviceObserver);
  v4 = -[CallDBManager initWithDeviceObserver:](self, "initWithDeviceObserver:", v3);

  return v4;
}

+ (id)modelURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("CallHistory"), CFSTR("momd"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logHandleForDomain:", "ch.calldbm");
    v6 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[CallDBManager modelURL].cold.1(v6);

    v4 = 0;
  }

  return v4;
}

- (CallDBManager)initWithDeviceObserver:(id)a3
{
  id v5;
  CallDBManager *v6;
  CallDBManager *v7;
  void *v8;
  uint64_t v9;
  DBManager *dbManager;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CallDBManager;
  v6 = -[CallDBManager init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_dataStoreType = 2;
    +[CallDBManager modelURL](CallDBManager, "modelURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[DBManager instanceWithModelURL:](DBManager, "instanceWithModelURL:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    dbManager = v7->_dbManager;
    v7->_dbManager = (DBManager *)v9;

    v7->_notifyDataStoreChangeReason = 3;
    if (objc_msgSend(v5, "isBootLockEnabled"))
    {
      objc_storeStrong((id *)&v7->_deviceObserver, a3);
      -[CHDelegateManager addDelegate:queue:](v7->_deviceObserver, "addDelegate:queue:", v7, MEMORY[0x1E0C80D38]);
    }
  }

  return v7;
}

uint64_t __32__CallDBManager_createDataStore__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createTemporary");
}

uint64_t __32__CallDBManager_createDataStore__block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createPermanent");
}

- (void)createPermanent
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1B3FA4000, v2, v3, "%{public}@ in a subclass is not overridden", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_0();
}

- (BOOL)shouldCreateTemporary
{
  return -[CallDBManager dataStoreType](self, "dataStoreType") == 2;
}

- (void)createTemporary
{
  void *v3;
  void *v4;
  NSObject *v5;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandleForDomain:", "ch.calldbm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CallDBManager createPermanent].cold.1(a2);

}

- (id)tempDBLocation:(unsigned __int8 *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "ch.calldbm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CallDBManager createPermanent].cold.1(a2);

  return 0;
}

- (id)permDBLocation:(unsigned __int8 *)a3
{
  void *v4;
  void *v5;
  NSObject *v6;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "ch.calldbm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[CallDBManager createPermanent].cold.1(a2);

  return 0;
}

- (void)moveCallsFromTempDatabase
{
  void *v3;
  void *v4;
  NSObject *v5;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandleForDomain:", "ch.calldbm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[CallDBManager createPermanent].cold.1(a2);

}

+ (id)dataStoreName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("CallHistory"), CFSTR("storedata"));
}

- (void)handleTemporaryCreated
{
  -[CallDBManager setDataStoreType:](self, "setDataStoreType:", 0);
}

- (void)didChangeBootLockEnabledForDeviceObserver:(id)a3
{
  CallDBManager *v4;
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[CallDBManager createDataStore](self, "createDataStore");
  v4 = self;
  objc_sync_enter(v4);
  -[CallDBManager deviceObserver](v4, "deviceObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isBootLockEnabled");

  if ((v6 & 1) == 0)
    -[CallDBManager setDeviceObserver:](v4, "setDeviceObserver:", 0);
  objc_sync_exit(v4);

}

- (void)setDbManager:(id)a3
{
  objc_storeStrong((id *)&self->_dbManager, a3);
}

- (void)setNotifyDataStoreChangeReason:(unsigned __int8)a3
{
  self->_notifyDataStoreChangeReason = a3;
}

- (void)setDeviceObserver:(id)a3
{
  objc_storeStrong((id *)&self->_deviceObserver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceObserver, 0);
  objc_storeStrong((id *)&self->_dbManager, 0);
}

+ (void)modelURL
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3FA4000, log, OS_LOG_TYPE_ERROR, "Bundle location not found", v1, 2u);
}

@end
