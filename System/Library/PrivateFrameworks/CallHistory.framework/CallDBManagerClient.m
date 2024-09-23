@implementation CallDBManagerClient

- (BOOL)willMoveCallsFromTempDatabase
{
  void *v2;
  CallDBMetaInfo *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v33;
  uint8_t buf[16];

  -[CallDBManagerClient tempDBLocation:](self, "tempDBLocation:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [CallDBMetaInfo alloc];
    objc_msgSend(v2, "URLByDeletingLastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CallDBMetaInfo initWithURL:](v3, "initWithURL:", v4);

    if (-[NSObject readDatabaseVersion:](v5, "readDatabaseVersion:", 1) == 34)
    {
      +[CallDBManager modelURL](CallDBManager, "modelURL");
      v6 = objc_claimAutoreleasedReturnValue();
      +[DBManager instanceWithModelURL:](DBManager, "instanceWithModelURL:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "addDataStoreAtLocation:isEncrypted:", v2, 0) & 1) != 0)
      {
        objc_msgSend(v7, "createManagedObjectContext");
        v8 = objc_claimAutoreleasedReturnValue();
        +[DBManager entityDescriptionHavingName:forContext:](DBManager, "entityDescriptionHavingName:forContext:", CFSTR("CallRecord"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = objc_alloc_init(MEMORY[0x1E0C97B48]);
          -[NSObject setEntity:](v10, "setEntity:", v9);
          v33 = 0;
          -[NSObject executeFetchRequest:error:](v8, "executeFetchRequest:error:", v10, &v33);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v33)
          {
            +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "logHandleForDomain:", "ch.calldbm");
            v14 = objc_claimAutoreleasedReturnValue();

            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              -[CallDBManagerClient willMoveCallsFromTempDatabase].cold.3();

            v15 = 0;
          }
          else
          {
            v15 = objc_msgSend(v11, "count") != 0;
          }

        }
        else
        {
          +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logHandleForDomain:", "ch.calldbm");
          v10 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            -[CallDBManagerClient willMoveCallsFromTempDatabase].cold.2((uint64_t)CFSTR("CallRecord"), v10, v26, v27, v28, v29, v30, v31);
          v15 = 0;
        }

      }
      else
      {
        +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "logHandleForDomain:", "ch.calldbm");
        v8 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          -[CallDBManagerClient willMoveCallsFromTempDatabase].cold.4((uint64_t)v2, v8, v19, v20, v21, v22, v23, v24);
        v15 = 0;
      }

    }
    else
    {
      +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logHandleForDomain:", "ch.calldbm");
      v6 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "Temporary data store not used, nothing to move", buf, 2u);
      }
      v15 = 0;
    }

  }
  else
  {
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "logHandleForDomain:", "ch.calldbm");
    v5 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CallDBManagerClient willMoveCallsFromTempDatabase].cold.1();
    v15 = 0;
  }

  return v15;
}

- (id)tempDBLocation:(unsigned __int8 *)a3
{
  return +[CallDBManager getDBLocationIsSandboxed:isTemporary:error:](CallDBManager, "getDBLocationIsSandboxed:isTemporary:error:", 1, 1, a3);
}

- (void)createPermanent
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "MetaInfo says permanent database should be initialized but looks like not", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (id)permDBLocation:(unsigned __int8 *)a3
{
  return +[CallDBManager getDBLocationIsSandboxed:isTemporary:error:](CallDBManager, "getDBLocationIsSandboxed:isTemporary:error:", 1, 0, a3);
}

- (void)handlePermanentCreated
{
  void *v3;
  objc_super v4;

  if (!-[CallDBManager dataStoreType](self, "dataStoreType"))
    -[CallDBManager setNotifyDataStoreChangeReason:](self, "setNotifyDataStoreChangeReason:", 2);
  v4.receiver = self;
  v4.super_class = (Class)CallDBManagerClient;
  -[CallDBManager handlePermanentCreated](&v4, sel_handlePermanentCreated);
  -[CallDBManagerClient helperConnection](self, "helperConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

}

- (void)moveCallsFromTempDatabase
{
  void *v3;
  id v4;

  if (-[CallDBManagerClient willMoveCallsFromTempDatabase](self, "willMoveCallsFromTempDatabase"))
  {
    -[CallDBManagerClient createHelperConnection](self, "createHelperConnection");
    -[CallDBManagerClient helperConnection](self, "helperConnection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "moveCallsFromTempDatabase");

  }
}

- (NSXPCConnection)helperConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 32, 1);
}

- (void)createHelperConnection
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  -[CallDBManagerClient helperConnection](self, "helperConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB3B38]);
    v5 = (void *)objc_msgSend(v4, "initWithMachServiceName:options:", kSyncHelperServiceIdentifier, 0);
    -[CallDBManagerClient setHelperConnection:](self, "setHelperConnection:", v5);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF096F90);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CallDBManagerClient helperConnection](self, "helperConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v6);

    objc_initWeak(&location, self);
    v8 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45__CallDBManagerClient_createHelperConnection__block_invoke;
    v14[3] = &unk_1E6746588;
    objc_copyWeak(&v15, &location);
    -[CallDBManagerClient helperConnection](self, "helperConnection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setInterruptionHandler:", v14);

    v12[0] = v8;
    v12[1] = 3221225472;
    v12[2] = __45__CallDBManagerClient_createHelperConnection__block_invoke_61;
    v12[3] = &unk_1E6746588;
    objc_copyWeak(&v13, &location);
    -[CallDBManagerClient helperConnection](self, "helperConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setInvalidationHandler:", v12);

    -[CallDBManagerClient helperConnection](self, "helperConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "resume");

    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __45__CallDBManagerClient_createHelperConnection__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logHandleForDomain:", "ch.calldbm");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__CallDBManagerClient_createHelperConnection__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_sync_enter(v6);
    objc_msgSend(v6, "createDataStore");
    objc_msgSend(v6, "moveCallsFromTempDatabase");
    objc_sync_exit(v6);

  }
}

void __45__CallDBManagerClient_createHelperConnection__block_invoke_61(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  id v6;

  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "logHandleForDomain:", "ch.calldbm");
  v3 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __45__CallDBManagerClient_createHelperConnection__block_invoke_61_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_sync_enter(v6);
    objc_msgSend(v6, "setHelperConnection:", 0);
    objc_sync_exit(v6);

  }
}

- (void)createTemporary
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "MetaInfo says temporary database should be initialized but looks like not", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (BOOL)validatePermDatabase
{
  void *v2;
  BOOL v3;
  CallDBMetaInfo *v4;
  void *v5;
  CallDBMetaInfo *v6;
  char v8;

  v8 = 0;
  -[CallDBManagerClient permDBLocation:](self, "permDBLocation:", &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (!v8)
  {
    v4 = [CallDBMetaInfo alloc];
    objc_msgSend(v2, "URLByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CallDBMetaInfo initWithURL:](v4, "initWithURL:", v5);

    v3 = -[CallDBMetaInfo validateInfo:](v6, "validateInfo:", 0);
  }

  return v3;
}

- (BOOL)validateTempDatabase
{
  void *v2;
  BOOL v3;
  CallDBMetaInfo *v4;
  void *v5;
  CallDBMetaInfo *v6;
  char v8;

  v8 = 0;
  -[CallDBManagerClient tempDBLocation:](self, "tempDBLocation:", &v8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if (!v8)
  {
    v4 = [CallDBMetaInfo alloc];
    objc_msgSend(v2, "URLByDeletingLastPathComponent");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CallDBMetaInfo initWithURL:](v4, "initWithURL:", v5);

    v3 = -[CallDBMetaInfo validateInfo:](v6, "validateInfo:", 1);
  }

  return v3;
}

- (void)pokeSyncHelperToInitDB
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id buf[2];

  -[CallDBManagerClient createHelperConnection](self, "createHelperConnection");
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "logHandleForDomain:", "ch.calldbm");
  v4 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1B3FA4000, v4, OS_LOG_TYPE_DEFAULT, "Poking sync helper to initialize data store", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[CallDBManagerClient helperConnection](self, "helperConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke;
  v7[3] = &unk_1E67465B0;
  objc_copyWeak(&v8, buf);
  objc_msgSend(v6, "bootUp:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(buf);
}

void __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke(uint64_t a1, unsigned int a2)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logHandleForDomain:", "ch.calldbm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v5;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    getBootUpResultAsString(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543362;
    v16 = v7;
    _os_log_impl(&dword_1B3FA4000, v6, OS_LOG_TYPE_DEFAULT, "Boot up result: %{public}@", (uint8_t *)&v15, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v9 = WeakRetained;
  if (!a2)
  {
    v11 = WeakRetained;
    objc_sync_enter(v11);
    if ((objc_msgSend(v11, "shouldCreateTemporary") & 1) == 0)
      goto LABEL_16;
    if ((objc_msgSend(v11, "validatePermDatabase") & 1) != 0)
    {
      objc_msgSend(v11, "createTemporary");
      goto LABEL_16;
    }
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "logHandleForDomain:", "ch.calldbm");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke_cold_2();
    goto LABEL_15;
  }
  if (a2 == 1)
  {
    v10 = WeakRetained;
    objc_sync_enter(v10);
    if ((objc_msgSend(v10, "shouldCreatePermanent") & 1) == 0)
    {
LABEL_16:
      objc_sync_exit(v9);

      goto LABEL_17;
    }
    if ((objc_msgSend(v10, "validatePermDatabase") & 1) != 0)
    {
      objc_msgSend(v10, "createPermanent");
      goto LABEL_16;
    }
    +[CHLogServer sharedInstance](CHLogServer, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "logHandleForDomain:", "ch.calldbm");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke_cold_1();
LABEL_15:

    goto LABEL_16;
  }
LABEL_17:

}

- (void)setHelperConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (id)syncHelperReadyNotificationRef
{
  return objc_getProperty(self, a2, 40, 1);
}

- (void)setSyncHelperReadyNotificationRef:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_syncHelperReadyNotificationRef, 0);
  objc_storeStrong((id *)&self->_helperConnection, 0);
}

- (void)willMoveCallsFromTempDatabase
{
  OUTLINED_FUNCTION_0(&dword_1B3FA4000, a2, a3, "Failed to add data store at location: %{public}@", a5, a6, a7, a8, 2u);
}

void __45__CallDBManagerClient_createHelperConnection__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Connection to Synchelper interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__CallDBManagerClient_createHelperConnection__block_invoke_61_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Connection to Synchelper invalidated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Permanent database state in client is out of sync with the server.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __45__CallDBManagerClient_pokeSyncHelperToInitDB__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1(&dword_1B3FA4000, v0, v1, "Temporary database state in client is out of sync with the server.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
