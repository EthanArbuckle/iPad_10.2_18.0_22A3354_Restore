@implementation LSDatabaseBuilder

- (LSDatabaseBuilder)initWithIOQueue:(id)a3
{
  id v5;
  LSDatabaseBuilder *v6;
  LSDatabaseBuilder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LSDatabaseBuilder;
  v6 = -[LSDatabaseBuilder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_ioQueue, a3);

  return v7;
}

- (void)seedCryptexContentIfNeeded:(BOOL *)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;

  v5 = MEMORY[0x186DAF208](self, a2);
  v6 = (void *)MEMORY[0x186DAE7A0](v5);
  v8 = 0;
  if (!_LSContextInit(&v8))
  {
    if (-[_LSDatabase cryptexContentChanged]((uint64_t)v8))
    {
      *a3 = 1;
      _LSDatabaseGetSeedingGroup();
      v7 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v7);

      dispatch_async((dispatch_queue_t)self->_ioQueue, &__block_literal_global_23);
    }
    else
    {
      MEMORY[0x186DAF214]();
    }
  }

  objc_autoreleasePoolPop(v6);
}

void __48__LSDatabaseBuilder_seedCryptexContentIfNeeded___block_invoke()
{
  NSObject *v0;

  _LSServer_LSEnumerateAndRegisterAllCryptexContent();
  _LSDatabaseGetSeedingGroup();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v0);

  JUMPOUT(0x186DAF214);
}

- (void)createAndSeedLocalDatabase:(BOOL *)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uid_t v11;
  int v12;
  __CFNotificationCenter *DistributedCenter;
  NSObject *v14;
  NSObject *ioQueue;
  os_unfair_lock_s *v16;
  _QWORD v17[5];
  __int16 v18;
  id v19;
  __int16 v20;
  uint8_t buf[4];
  uid_t v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x186DAF208](self, a2);
  v6 = (void *)MEMORY[0x186DAE7A0](v5);
  v20 = 0;
  v19 = 0;
  v7 = _LSDatabaseCreateFromPersistentStore(7, &v20, &v19);
  v8 = v19;
  if (v7)
  {
    +[LSDBExecutionContext sharedServerInstance]();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[LSDBExecutionContext setServerDatabase:]((uint64_t)v9, v7);

    if (-[_LSDatabase isSeeded]((uint64_t)v7) && (-[_LSDatabase isSeedingComplete]((uint64_t)v7) & 1) != 0)
    {
      _LSDatabaseCommit((uint64_t)v7);
      *a3 = 0;
    }
    else
    {
      _LSDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = getuid();
        v12 = _CFGetEUID();
        *(_DWORD *)buf = 67109376;
        v22 = v11;
        v23 = 1024;
        v24 = v12;
        _os_log_impl(&dword_182882000, v10, OS_LOG_TYPE_DEFAULT, "LSDatabaseBuilder: Seeding database with UID: %d, EUID %d", buf, 0xEu);
      }

      DistributedCenter = CFNotificationCenterGetDistributedCenter();
      CFNotificationCenterPostNotificationWithOptions(DistributedCenter, CFSTR("com.apple.LaunchServices.DatabaseSeedingStart"), 0, 0, 0);
      if ((v20 & 1) == 0)
      {

        _LSResetServer();
        v7 = _LSServer_CopyLocalDatabase(0);
      }
      _LSDatabaseSessionSetSeedingInProgress(1);
      -[_LSDatabase setSeeded:]((uint64_t)v7, 0);
      *a3 = 1;
      MEMORY[0x186DAF208]();
      _LSDatabaseGetSeedingGroup();
      v14 = objc_claimAutoreleasedReturnValue();
      dispatch_group_enter(v14);

      ioQueue = self->_ioQueue;
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __48__LSDatabaseBuilder_createAndSeedLocalDatabase___block_invoke;
      v17[3] = &unk_1E1042C70;
      v18 = v20;
      v17[4] = self;
      dispatch_async(ioQueue, v17);
      if (-[_LSDatabase cryptexContentChanged]((uint64_t)v7))
        _LSServer_LSEnumerateAndRegisterAllCryptexContent();
    }
    +[LSApplicationRestrictionsManager sharedInstance]();
    v16 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
    -[LSApplicationRestrictionsManager beginListeningForChanges](v16);

  }
  else
  {
    _LSDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[LSDatabaseBuilder createAndSeedLocalDatabase:].cold.1((uint64_t)v8, v7);
  }

  objc_autoreleasePoolPop(v6);
  MEMORY[0x186DAF214]();
}

uint64_t __48__LSDatabaseBuilder_createAndSeedLocalDatabase___block_invoke(uint64_t a1)
{
  __int16 v2;
  int v3;
  char v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v10[5];
  char v11;
  uint8_t buf[16];

  v2 = *(_WORD *)(a1 + 40);
  if (dispatchEnumerateAndRegisterWithDiagnosticFrame(unsigned short)::onceToken == -1)
  {
    if ((v2 & 0x20) == 0)
      goto LABEL_3;
LABEL_19:
    v3 = __LAUNCH_SERVICES_IS_REBUILDING_THE_DATABASE_BECAUSE_CREATION_FROM_STORE_FAILED__(v2);
LABEL_20:
    v4 = v3;
    if (v3)
      goto LABEL_24;
    goto LABEL_21;
  }
  dispatch_once(&dispatchEnumerateAndRegisterWithDiagnosticFrame(unsigned short)::onceToken, &__block_literal_global_20_0);
  if ((v2 & 0x20) != 0)
    goto LABEL_19;
LABEL_3:
  if ((v2 & 0x10) != 0)
  {
    v3 = __LAUNCH_SERVICES_IS_REBUILDING_THE_DATABASE_BECAUSE_IT_WAS_CORRUPT__(v2);
    goto LABEL_20;
  }
  if ((v2 & 8) != 0)
  {
    v3 = __LAUNCH_SERVICES_IS_REBUILDING_THE_DATABASE_BECAUSE_IT_DID_NOT_EXIST__(v2);
    goto LABEL_20;
  }
  if ((v2 & 4) != 0)
  {
    v3 = __LAUNCH_SERVICES_IS_REBUILDING_THE_DATABASE_BECAUSE_A_RECOVERY_FILE_EXISTED__(v2);
    goto LABEL_20;
  }
  if ((v2 & 0x80) != 0)
  {
    __LAUNCH_SERVICES_IS_REBUILDING_THE_DATABASE_BECAUSE_ALLOC_FAILED_DURING_STORE_CREATION__(v2);
  }
  else if ((v2 & 0x100) != 0)
  {
    __LAUNCH_SERVICES_IS_REBUILDING_THE_DATABASE_BECAUSE_STORE_CREATION_FAILED_UNEXPECTEDLY__(v2);
  }
  else if ((v2 & 0x40) != 0)
  {
    __LAUNCH_SERVICES_IS_REBUILDING_THE_DATABASE_BECAUSE_CREATION_FROM_FRESH_FAILED__(v2);
  }
  else
  {
    if ((v2 & 1) == 0)
    {
      v3 = __LAUNCH_SERVICES_IS_REBUILDING_THE_DATABASE_UNEXPECTEDLY__(v2);
      goto LABEL_20;
    }
    __LAUNCH_SERVICES_IS_REBUILDING_THE_DATABASE_BECAUSE_THE_DATABASE_WAS_CREATED_FRESH__(v2);
  }
LABEL_21:
  _LSDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "LSDatabaseBuilder: MobileInstallation reported PartialResultsReturned = YES, setting incomplete seed flag", buf, 2u);
  }

  v4 = 0;
LABEL_24:
  _LSServer_DatabaseExecutionContext();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __48__LSDatabaseBuilder_createAndSeedLocalDatabase___block_invoke_1;
  v10[3] = &unk_1E1042C48;
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v4;
  -[LSDBExecutionContext syncWrite:]((uint64_t)v6, v10);

  +[_LSInstallProgressService sharedInstance](_LSInstallProgressService, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sendDatabaseRebuiltNotification");

  _LSDatabaseGetSeedingGroup();
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v8);

  return MEMORY[0x186DAF214]();
}

uint64_t __48__LSDatabaseBuilder_createAndSeedLocalDatabase___block_invoke_1(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setSeedingComplete:", *(_BYTE *)(a1 + 40) != 0);
}

- (void)syncWithMI:(void *)a3
{
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  _LSDefaultLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v4, OS_LOG_TYPE_DEFAULT, "Syncing with MI", buf, 2u);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __32__LSDatabaseBuilder_syncWithMI___block_invoke;
  v6[3] = &__block_descriptor_40_e15_v16__0__NSURL_8l;
  v6[4] = a3;
  _LSServer_SyncWithMobileInstallation(v6);
  _LSDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "enumerated and registered MI content", buf, 2u);
  }

}

void __32__LSDatabaseBuilder_syncWithMI___block_invoke(uint64_t a1, id a2)
{
  char *v3;
  uint64_t v4;
  void *__p[2];
  char v6;

  v3 = (char *)objc_msgSend(objc_retainAutorelease(a2), "fileSystemRepresentation");
  v4 = *(_QWORD *)(a1 + 32);
  std::string::basic_string[abi:nn180100]<0>(__p, v3);
  std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string>(v4, (uint64_t)__p, (uint64_t)__p);
  if (v6 < 0)
    operator delete(__p[0]);
}

- (void)setSeedingComplete:(BOOL)a3
{
  _BOOL4 v3;
  _LSDatabase *v4;
  NSObject *v5;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *SharedInstance;
  __CFNotificationCenter *DistributedCenter;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  v4 = (_LSDatabase *)_LSServer_CopyLocalDatabase(0);
  if (v4)
  {
    _LSDatabaseSessionSetSeedingInProgress(0);
    -[_LSDatabase setSeeded:]((uint64_t)v4, 1);
    -[_LSDatabase setSeedingComplete:](v4, v3);
    _LSDatabaseCommit((uint64_t)v4);
    _LSSaveImmediately(1);
  }

  _LSDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109376;
    v9[1] = getpid();
    v10 = 1024;
    v11 = _CFGetEUID();
    _os_log_impl(&dword_182882000, v5, OS_LOG_TYPE_DEFAULT, "[%d]: LSDatabaseBuilder: posting LSNotificationDatabaseSeedingComplete for UID %u", (uint8_t *)v9, 0xEu);
  }

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, CFSTR("com.apple.LaunchServices.DatabaseSeedingComplete"), 0, 0, 0);
  SharedInstance = (void *)__LSDefaultsGetSharedInstance();
  LODWORD(SharedInstance) = objc_msgSend(SharedInstance, "proxyUIDForUID:", getuid()) == 0;
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterPostNotificationWithOptions(DistributedCenter, CFSTR("com.apple.LaunchServices.DatabaseSeedingComplete"), 0, 0, 2 * SharedInstance);
  _LSSetKernelPackageExtensions();
  _LSArmSaveTimer(4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ioQueue, 0);
}

- (void)createAndSeedLocalDatabase:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_182882000, a2, OS_LOG_TYPE_ERROR, "LSDatabaseBuilder: Failed to read database from disk and couldn't create new one: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end
