@implementation FBKData

+ (id)fixtureInstance
{
  _TtC12FeedbackCore16FBKFixtureLoader *v3;
  void *v4;
  id v5;
  FBKSeedPortalAPI *v6;
  FBKLoginManager *v7;
  void *v8;
  void *v9;

  v3 = [_TtC12FeedbackCore16FBKFixtureLoader alloc];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FBKFixtureLoader initForBundle:](v3, "initForBundle:", v4);

  v6 = -[FBKSeedPortalAPI initWithEnvironment:client:]([FBKSeedPortalAPI alloc], "initWithEnvironment:client:", +[FBKSSharedConstants environment](FBKSharedConstants, "environment"), v5);
  v7 = -[FBKLoginManager initWithAPI:]([FBKLoginManager alloc], "initWithAPI:", v6);
  v8 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLoginManager:api:", v7, v6);
  objc_msgSend(v8, "privateQueueContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKSeedPortalAPI set_managedObjectContext:](v6, "set_managedObjectContext:", v9);

  -[FBKSeedPortalAPI setLoginManager:](v6, "setLoginManager:", v7);
  -[FBKLoginManager setFBKData:](v7, "setFBKData:", v8);

  return v8;
}

+ (FBKData)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__FBKData_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_2 != -1)
    dispatch_once(&sharedInstance_onceToken_2, block);
  return (FBKData *)(id)sharedInstance_sharedInstance_1;
}

void __25__FBKData_sharedInstance__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  uint64_t v10;
  FBKHTTPClient *v11;
  uint64_t v12;
  NSObject *v13;
  FBKSeedPortalAPI *v14;
  FBKLoginManager *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = FBKIsInternalInstall(a1, a2);
  if ((_DWORD)v2)
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __25__FBKData_sharedInstance__block_invoke_cold_1(v4);

  }
  if (!FBKIsInternalInstall(v2, v3))
    goto LABEL_10;
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "environment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("FBK_FIXTURES_ENABLED"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("1"));

  if (v8)
  {
    Log_5();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "FBK Data in fixture mode enabled", (uint8_t *)v19, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "fixtureInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (FBKHTTPClient *)sharedInstance_sharedInstance_1;
    sharedInstance_sharedInstance_1 = v10;
  }
  else
  {
LABEL_10:
    v11 = objc_alloc_init(FBKHTTPClient);
    v12 = +[FBKSSharedConstants environment](FBKSharedConstants, "environment");
    Log_5();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v19[0] = 67109120;
      v19[1] = v12;
      _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_INFO, "Initializing FBK Data with environment [%hd]", (uint8_t *)v19, 8u);
    }

    v14 = -[FBKSeedPortalAPI initWithEnvironment:client:]([FBKSeedPortalAPI alloc], "initWithEnvironment:client:", v12, v11);
    v15 = -[FBKLoginManager initWithAPI:]([FBKLoginManager alloc], "initWithAPI:", v14);
    v16 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithLoginManager:api:", v15, v14);
    v17 = (void *)sharedInstance_sharedInstance_1;
    sharedInstance_sharedInstance_1 = v16;

    -[FBKLoginManager setFBKData:](v15, "setFBKData:", sharedInstance_sharedInstance_1);
    objc_msgSend((id)sharedInstance_sharedInstance_1, "privateQueueContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKSeedPortalAPI set_managedObjectContext:](v14, "set_managedObjectContext:", v18);

    -[FBKSeedPortalAPI setLoginManager:](v14, "setLoginManager:", v15);
  }

}

- (FBKUploadStatusManager)uploadManager
{
  FBKUploadStatusManager *uploadManager;
  void *v4;
  void *v5;
  void *v6;
  FBKUploadStatusManager *v7;
  void *v8;
  void *v9;
  FBKUploadStatusManager *v10;
  FBKUploadStatusManager *v11;

  uploadManager = self->_uploadManager;
  if (!uploadManager)
  {
    objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "environment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("Unit Test Failure"), CFSTR("%s should not be called while unit testing"), "-[FBKData uploadManager]");
    v7 = [FBKUploadStatusManager alloc];
    objc_msgSend(MEMORY[0x24BE2CA50], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[FBKUploadStatusManager initWithData:ded:deviceManager:](v7, "initWithData:ded:deviceManager:", self, v8, v9);
    v11 = self->_uploadManager;
    self->_uploadManager = v10;

    uploadManager = self->_uploadManager;
  }
  return uploadManager;
}

- (FBKData)initWithLoginManager:(id)a3 api:(id)a4
{
  id v7;
  id v8;
  FBKData *v9;
  FBKData *v10;
  NSNotificationCenter *v11;
  NSNotificationCenter *notificationCenter;
  FBKUser *currentUser;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v7 = a3;
  v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)FBKData;
  v9 = -[FBKData init](&v20, sel_init);
  v10 = v9;
  if (v9)
  {
    -[FBKData initCoreData](v9, "initCoreData");
    objc_storeStrong((id *)&v10->_api, a4);
    objc_storeStrong((id *)&v10->_loginManager, a3);
    v11 = (NSNotificationCenter *)objc_alloc_init(MEMORY[0x24BDD16D0]);
    notificationCenter = v10->_notificationCenter;
    v10->_notificationCenter = v11;

    currentUser = v10->_currentUser;
    v10->_currentUser = 0;

    *(_WORD *)&v10->_hasFinishedFirstLoad = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *MEMORY[0x24BDBB458];
    -[FBKData privateQueueContext](v10, "privateQueueContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel_privateQueueContextDidSave_, v15, v16);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKData mainQueueContext](v10, "mainQueueContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v10, sel_mainQueueContextDidSave_, v15, v18);

  }
  return v10;
}

- (id)createPersistentStoreError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[FBKData persistentStoreCoordinatorInternal](self, "persistentStoreCoordinatorInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData persistentStoreType](self, "persistentStoreType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData persistentStoreCoordinatorURL](self, "persistentStoreCoordinatorURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addPersistentStoreWithType:configuration:URL:options:error:", v6, 0, v7, MEMORY[0x24BDBD1B8], a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)initCoreData
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Error locating/creating SQLite store directory.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __23__FBKData_initCoreData__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id obj;

  v2 = *(void **)(a1 + 32);
  +[FBKUser fetchRequest](FBKUser, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "countForFetchRequest:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinatorInternal");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "persistentStores");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "containsObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));

      if (v7)
      {
        objc_msgSend(*(id *)(a1 + 40), "persistentStoreCoordinatorInternal");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "removePersistentStore:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), 0);

      }
    }
    objc_msgSend(*(id *)(a1 + 40), "destroyPersistentStoreWithUrl:", *(_QWORD *)(a1 + 48));
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    v11 = *(void **)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v16 = *(id *)(v12 + 40);
    objc_msgSend(v11, "createPersistentStoreError:", &v16);
    v13 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v12 + 40), v16);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FBKData;
  -[FBKData dealloc](&v4, sel_dealloc);
}

- (BOOL)saveToStore:(id *)a3
{
  void *v5;
  _QWORD v7[5];
  id v8[2];
  id location;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_initWeak(&location, self);
  -[FBKData mainQueueContext](self, "mainQueueContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __23__FBKData_saveToStore___block_invoke;
  v7[3] = &unk_24E159850;
  v7[4] = &v10;
  objc_copyWeak(v8, &location);
  v8[1] = a3;
  objc_msgSend(v5, "performBlockAndWait:", v7);

  LOBYTE(a3) = *((_BYTE *)v11 + 24);
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v10, 8);
  return (char)a3;
}

void __23__FBKData_saveToStore___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mainQueueContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v2, "save:", *(_QWORD *)(a1 + 48));

}

- (void)reduceToFault:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __25__FBKData_reduceToFault___block_invoke;
  v6[3] = &unk_24E156D78;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v6);

}

void __25__FBKData_reduceToFault___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshObject:mergeChanges:", *(_QWORD *)(a1 + 32), 1);

}

- (id)mainQueueObjectFromPrivate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  id v13;
  id location;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  objc_msgSend(v4, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  objc_initWeak(&location, self);
  -[FBKData mainQueueContext](self, "mainQueueContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __38__FBKData_mainQueueObjectFromPrivate___block_invoke;
  v10[3] = &unk_24E159878;
  v12 = &v15;
  objc_copyWeak(&v13, &location);
  v7 = v5;
  v11 = v7;
  objc_msgSend(v6, "performBlockAndWait:", v10);

  v8 = (id)v16[5];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v15, 8);

  return v8;
}

void __38__FBKData_mainQueueObjectFromPrivate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "mainQueueContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectWithID:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)takeMainQueueObject:(id)a3 andContinueWithPrivateQueueObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[FBKData privateQueueContext](self, "privateQueueContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __65__FBKData_takeMainQueueObject_andContinueWithPrivateQueueObject___block_invoke;
  v12[3] = &unk_24E1598A0;
  v10 = v8;
  v13 = v10;
  objc_copyWeak(&v15, &location);
  v11 = v7;
  v14 = v11;
  objc_msgSend(v9, "performBlock:", v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __65__FBKData_takeMainQueueObject_andContinueWithPrivateQueueObject___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  id v5;
  uint8_t buf[16];

  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "privateQueueContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectWithID:", *(_QWORD *)(a1 + 32));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Object ID is nil, cannot continue in private queue context", buf, 2u);
    }

  }
}

- (FBKTeam)personalTeam
{
  void *v3;
  void *v4;
  void *v5;

  -[FBKData currentUser](self, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData mainQueueContext](self, "mainQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKTeam personalTeamForUser:inContext:](FBKTeam, "personalTeamForUser:inContext:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (FBKTeam *)v5;
}

- (FBKTeam)defaultTeam
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[FBKData personalTeam](self, "personalTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "forms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[FBKData personalTeam](self, "personalTeam");
    return (FBKTeam *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FBKData currentUser](self, "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activeTeams");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ded_findWithBlock:", &__block_literal_global_37);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v9, "shortDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "Default team is not personal team. Using [%{public}@]", (uint8_t *)&v12, 0xCu);

    }
    return (FBKTeam *)v9;
  }
}

uint64_t __22__FBKData_defaultTeam__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasContent");
}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  -[FBKData persistentStoreCoordinatorInternal](self, "persistentStoreCoordinatorInternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[FBKData initCoreData](self, "initCoreData");
    -[FBKData privateQueueContext](self, "privateQueueContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKData api](self, "api");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "set_managedObjectContext:", v9);

  }
  objc_msgSend(v6, "pendingConsents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData setPendingConsents:](self, "setPendingConsents:", v11);

  objc_initWeak(&location, self);
  -[FBKData loginManager](self, "loginManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke;
  v15[3] = &unk_24E159938;
  objc_copyWeak(&v18, &location);
  v13 = v6;
  v16 = v13;
  v14 = v7;
  v17 = v14;
  objc_msgSend(v12, "runAfterLogin:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "privateQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_2;
  v5[3] = &unk_24E157510;
  objc_copyWeak(&v8, v2);
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(v4, "performBlock:", v5);

  objc_destroyWeak(&v8);
}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_2(id *a1)
{
  int v2;
  id *v3;
  void (**v4)(_QWORD);
  void *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  int v19;
  int v20;
  id v21;
  id *location;
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  id v27;
  __int16 v28;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v2 = +[FBKSSharedConstants environment](FBKSharedConstants, "environment");
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_3;
  aBlock[3] = &unk_24E159910;
  v3 = a1 + 6;
  location = &v27;
  objc_copyWeak(&v27, a1 + 6);
  v25 = a1[4];
  v28 = v2;
  v26 = a1[5];
  v4 = (void (**)(_QWORD))_Block_copy(aBlock);
  +[FBKUser fetchRequest](FBKUser, "fetchRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "privateQueueContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v7, "executeFetchRequest:error:", v5, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;

  if (v9 || (unint64_t)objc_msgSend(v8, "count", &v27) >= 2)
  {
    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_2_cold_1();
LABEL_5:

    v11 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v11, "resetAllLocalDataWithCompletion:", v4);
LABEL_6:

    goto LABEL_7;
  }
  if (+[FBKSharedConstants hasDifferentLanguageSinceLastLaunch](FBKSharedConstants, "hasDifferentLanguageSinceLastLaunch"))
  {
    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "Language preference changed since last launch. Reseting all data", buf, 2u);
    }
    goto LABEL_5;
  }
  if (objc_msgSend(v8, "count") == 1)
  {
    objc_msgSend(v8, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "environment") == v2
      && (objc_msgSend(v11, "ID"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(a1[4], "participantID"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v12, "isEqualToNumber:", v13),
          v13,
          v12,
          (v14 & 1) != 0))
    {
      Log_5();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_INFO, "same user logging in", buf, 2u);
      }

      v4[2](v4);
    }
    else
    {
      Log_5();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "ID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "intValue");
        v20 = objc_msgSend(v11, "environment");
        *(_DWORD *)buf = 67109376;
        v30 = v19;
        v31 = 1024;
        v32 = v20;
        _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_DEFAULT, "will delete all data from previous user ID [%i] env [%i]", buf, 0xEu);

      }
      v21 = objc_loadWeakRetained(v3);
      objc_msgSend(v21, "resetAllLocalDataWithCompletion:", v4);

    }
    goto LABEL_6;
  }
  Log_5();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_INFO, "no previous user", buf, 2u);
  }

  v4[2](v4);
LABEL_7:

  objc_destroyWeak(location);
}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  __int16 v8;

  +[FBKSharedConstants recordCurrentLanguagePreference](FBKSharedConstants, "recordCurrentLanguagePreference");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "privateQueueContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_4;
  v4[3] = &unk_24E1598E8;
  v5 = *(id *)(a1 + 32);
  v8 = *(_WORD *)(a1 + 56);
  objc_copyWeak(&v7, (id *)(a1 + 48));
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performBlock:", v4);

  objc_destroyWeak(&v7);
}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "participantID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intValue");
    v5 = *(__int16 *)(a1 + 56);
    *(_DWORD *)buf = 67109376;
    v23 = v4;
    v24 = 1024;
    v25 = v5;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "Inserting user with ID [%i] env [%i]", buf, 0xEu);

  }
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(__int16 *)(a1 + 56);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "privateQueueContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKUser createUserFromUserLoginInfo:forEnvironment:inContext:](FBKUser, "createUserFromUserLoginInfo:forEnvironment:inContext:", v6, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v11, "privateQueueContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v12, "save:", &v21);
  v13 = v21;

  v14 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v14, "mainQueueObjectFromPrivate:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_75;
  v17[3] = &unk_24E157510;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  v18 = v15;
  v19 = *(id *)(a1 + 40);
  v16 = v15;
  dispatch_async(MEMORY[0x24BDAC9B8], v17);

  objc_destroyWeak(&v20);
}

uint64_t __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_75(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCurrentUser:", v2);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)didLogOutWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FBKData setCurrentUser:](self, "setCurrentUser:", 0);
  -[FBKData uploadManager](self, "uploadManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__FBKData_didLogOutWithCompletion___block_invoke;
  v7[3] = &unk_24E156DC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "didLogOutWithCompletion:", v7);

}

uint64_t __35__FBKData_didLogOutWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resetAllLocalDataWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isReloadingContentAndFormItems
{
  return -[FBKData isRefreshingForms](self, "isRefreshingForms")
      || -[FBKData isRefreshingContent](self, "isRefreshingContent");
}

- (void)reloadAllContentWithCompletion:(id)a3
{
  -[FBKData reloadDataSkippingContentItems:reloadsTeams:formTat:completion:](self, "reloadDataSkippingContentItems:reloadsTeams:formTat:completion:", 0, 1, 0, a3);
}

- (void)runAfterFormItemsLoad:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[FBKData isReloadingApp](self, "isReloadingApp"))
    -[FBKData setFormReloadCompletion:](self, "setFormReloadCompletion:", v4);
  else
    v4[2]();

}

- (void)fetchFormItemByTat:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  -[FBKData setFetchedAFormByTat:](self, "setFetchedAFormByTat:", 1);
  if (-[FBKData isReloadingApp](self, "isReloadingApp"))
  {
    Log_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[FBKData fetchFormItemByTat:completion:].cold.1();

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __41__FBKData_fetchFormItemByTat_completion___block_invoke;
    v9[3] = &unk_24E157138;
    v9[4] = self;
    v10 = v6;
    v11 = v7;
    -[FBKData runAfterFormItemsLoad:](self, "runAfterFormItemsLoad:", v9);

  }
  else
  {
    -[FBKData actuallyFetchFormItemByTat:completion:](self, "actuallyFetchFormItemByTat:completion:", v6, v7);
  }

}

uint64_t __41__FBKData_fetchFormItemByTat_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "actuallyFetchFormItemByTat:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)actuallyFetchFormItemByTat:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[FBKData setIsRefreshingForms:](self, "setIsRefreshingForms:", 1);
  -[FBKData defaultTeam](self, "defaultTeam");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke;
  v11[3] = &unk_24E159960;
  v11[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  -[FBKData takeMainQueueObject:andContinueWithPrivateQueueObject:](self, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v8, v11);

}

void __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v5[5];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke_2;
  v5[3] = &unk_24E157380;
  v5[4] = v3;
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v3, "_refreshFormItemsForTeam:formTat:withCompletion:", a2, v4, v5);

}

void __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke_3;
  block[3] = &unk_24E157138;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __49__FBKData_actuallyFetchFormItemByTat_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setIsRefreshingForms:", 0);
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDidFetchFormStubs:", 1);

  if (*(_QWORD *)(a1 + 40))
  {
    v3 = *(_QWORD *)(a1 + 48);
    if (v3)
      (*(void (**)(void))(v3 + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "refreshObject:mergeChanges:", v5, 1);

    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bugFormStubs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v13 = CFSTR("formsOrError");
      objc_msgSend(*(id *)(a1 + 32), "currentUser");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bugFormStubs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v9;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "postNotificationName:object:userInfo:", CFSTR("FBKDidRefreshFormStubsNotification"), *(_QWORD *)(a1 + 32), v10);

      v12 = *(_QWORD *)(a1 + 48);
      if (v12)
        (*(void (**)(uint64_t, _QWORD))(v12 + 16))(v12, 0);

    }
  }
}

- (void)feedbackFrameworkLoadDataWithFormTat:(id)a3 orFormID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id WeakRetained;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id buf[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    Log_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "Loading data for Form Preview", (uint8_t *)buf, 2u);
    }

    v12 = objc_initWeak(buf, self);
    WeakRetained = objc_loadWeakRetained(buf);
    objc_msgSend(WeakRetained, "currentUser");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke;
    v15[3] = &unk_24E159988;
    objc_copyWeak(&v18, buf);
    v17 = v10;
    v16 = v9;
    -[FBKData takeMainQueueObject:andContinueWithPrivateQueueObject:](self, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v14, v15);

    objc_destroyWeak(&v18);
    objc_destroyWeak(buf);
  }
  else
  {
    -[FBKData reloadDataSkippingContentItems:reloadsTeams:formTat:completion:](self, "reloadDataSkippingContentItems:reloadsTeams:formTat:completion:", 1, 0, v8, v10);
  }

}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "privateQueueContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BDBB698]);
    +[FBKBugFormStub entity](FBKBugFormStub, "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithEntity:insertIntoManagedObjectContext:", v7, v5);

    objc_msgSend(v8, "setID:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v8, "setName:", CFSTR("Form Preview"));
    +[FBKGroupedDevice currentDevicePlatform](FBKGroupedDevice, "currentDevicePlatform");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setPlatform:", v9);

    objc_msgSend(v8, "setUser:", v3);
    v23 = 0;
    objc_msgSend(v5, "save:", &v23);
    v10 = v23;
    if (v10)
    {
      +[FBKLog data](FBKLog, "data");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_3();

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_87;
      block[3] = &unk_24E156F80;
      v22 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      v12 = v22;
    }
    else
    {
      v14 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v14, "mainQueueObjectFromPrivate:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      +[FBKLog data](FBKLog, "data");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v12)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v27 = v12;
          _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_INFO, "Inserted BugFormStub: %{public}@", buf, 0xCu);
        }

        v19 = MEMORY[0x24BDAC760];
        v17 = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_89;
        v18 = &v19;
      }
      else
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_2();

        v20 = MEMORY[0x24BDAC760];
        v17 = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_88;
        v18 = &v20;
      }
      v18[1] = 3221225472;
      v18[2] = (uint64_t)v17;
      v18[3] = (uint64_t)&unk_24E156F80;
      v18[4] = (uint64_t)*(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], v18);

    }
  }
  else
  {
    +[FBKLog data](FBKLog, "data");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_1();

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_81;
    v24[3] = &unk_24E156F80;
    v25 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x24BDAC9B8], v24);
    v8 = v25;
  }

}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_81(uint64_t a1)
{
  id v2;

  FBKErrorOfType(-1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_87(uint64_t a1)
{
  id v2;

  FBKErrorOfType(-1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_88(uint64_t a1)
{
  id v2;

  FBKErrorOfType(-1);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_89(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isReloadingApp
{
  return -[FBKData isRefreshingForms](self, "isRefreshingForms")
      || -[FBKData isRefreshingTeams](self, "isRefreshingTeams")
      || -[FBKData isRefreshingContent](self, "isRefreshingContent");
}

- (void)reloadDataSkippingContentItems:(BOOL)a3 reloadsTeams:(BOOL)a4 formTat:(id)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  _BOOL4 v15;
  _BOOL4 v16;
  dispatch_group_t v17;
  dispatch_group_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  _QWORD v26[5];
  dispatch_group_t v27;
  id v28;
  dispatch_group_t v29;
  id v30;
  id v31;
  id v32;
  BOOL v33;
  _QWORD v34[4];
  id v35;
  NSObject *v36;
  uint8_t buf[16];

  v7 = a4;
  v10 = a5;
  v11 = a6;
  -[FBKData currentUser](self, "currentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (-[FBKData isRefreshingTeams](self, "isRefreshingTeams"))
    {
      Log_5();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "is refreshing teams in FBKData, cannot refresh again.";
LABEL_13:
        _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      }
    }
    else if (-[FBKData isRefreshingContent](self, "isRefreshingContent"))
    {
      Log_5();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v14 = "is refreshing content in FBKData, cannot refresh again.";
        goto LABEL_13;
      }
    }
    else
    {
      v15 = -[FBKData isRefreshingForms](self, "isRefreshingForms");
      Log_5();
      v13 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
      if (v15)
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          v14 = "is refreshing forms in FBKData, cannot refresh again.";
          goto LABEL_13;
        }
      }
      else
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_DEFAULT, "Reloading teams, content items, forms.", buf, 2u);
        }

        v13 = dispatch_group_create();
        v17 = dispatch_group_create();
        v18 = dispatch_group_create();
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 3);
        +[FBKTimeIntervals sharedInstance](FBKTimeIntervals, "sharedInstance");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "willStartEvent:context:", 9, 0);
        objc_msgSend(v20, "willStartEvent:context:", 7, 0);
        v21 = MEMORY[0x24BDAC760];
        if (v7)
        {
          dispatch_group_enter(v13);
          v34[0] = MEMORY[0x24BDAC760];
          v34[1] = 3221225472;
          v34[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke;
          v34[3] = &unk_24E1599B0;
          v35 = v19;
          v36 = v13;
          -[FBKData refreshTeamsWithCompletion:](self, "refreshTeamsWithCompletion:", v34);

          v21 = MEMORY[0x24BDAC760];
        }
        v26[0] = v21;
        v26[1] = 3221225472;
        v26[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_2;
        v26[3] = &unk_24E159A28;
        v33 = a3;
        v26[4] = self;
        v27 = v18;
        v28 = v19;
        v29 = v17;
        v30 = v10;
        v31 = v20;
        v32 = v11;
        v22 = v20;
        v23 = v17;
        v24 = v19;
        v25 = v18;
        dispatch_group_notify(v13, MEMORY[0x24BDAC9B8], v26);

      }
    }
  }
  else
  {
    Log_5();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FBKData reloadDataSkippingContentItems:reloadsTeams:formTat:completion:].cold.1();
  }

}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;

  objc_msgSend(*(id *)(a1 + 32), "setIsRefreshingForms:", 1);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_3;
  v5[3] = &unk_24E159A00;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v12 = *(_BYTE *)(a1 + 88);
  v5[1] = 3221225472;
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 72);
  v11 = *(id *)(a1 + 80);
  objc_msgSend(v2, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v3, v5);

}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  id obj;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  _QWORD block[5];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "privateQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[FBKTeam personalTeamForUser:inContext:](FBKTeam, "personalTeamForUser:inContext:", v3, v4);

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v18 = v3;
  objc_msgSend(v3, "teams");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  v7 = MEMORY[0x24BDAC760];
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v34;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v10);
        if (!*(_BYTE *)(a1 + 88))
        {
          dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
          v12 = *(void **)(a1 + 32);
          v30[0] = v7;
          v30[1] = 3221225472;
          v30[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_4;
          v30[3] = &unk_24E1599B0;
          v31 = *(id *)(a1 + 48);
          v32 = *(id *)(a1 + 40);
          objc_msgSend(v12, "_refreshContentItemsForTeam:withCompletion:", v11, v30);

        }
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 56));
        v13 = *(void **)(a1 + 32);
        v14 = *(_QWORD *)(a1 + 64);
        v26[0] = v7;
        v26[1] = 3221225472;
        v26[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_5;
        v26[3] = &unk_24E1599D8;
        v27 = *(id *)(a1 + 48);
        v28 = *(id *)(a1 + 56);
        v29 = *(id *)(a1 + 40);
        objc_msgSend(v13, "_refreshFormItemsForTeam:formTat:withCompletion:", v11, v14, v26);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v8);
  }

  v15 = *(NSObject **)(a1 + 56);
  block[0] = v7;
  block[1] = 3221225472;
  block[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_6;
  block[3] = &unk_24E157020;
  block[4] = *(_QWORD *)(a1 + 32);
  v25 = *(id *)(a1 + 72);
  v16 = MEMORY[0x24BDAC9B8];
  dispatch_group_notify(v15, MEMORY[0x24BDAC9B8], block);
  v20[0] = v7;
  v20[1] = 3221225472;
  v20[2] = __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_92;
  v20[3] = &unk_24E1571B0;
  v17 = *(NSObject **)(a1 + 40);
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = *(id *)(a1 + 48);
  v22 = *(id *)(a1 + 72);
  v23 = *(id *)(a1 + 80);
  dispatch_group_notify(v17, v16, v20);

}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_4(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_5(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_6(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void (**v12)(void);
  uint8_t v13[8];
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setIsRefreshingForms:", 0);
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDidFetchFormStubs:", 1);

  Log_5();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "Did reload all Form Items", v13, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "purgeOrphanedForms");
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bugFormStubs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v14 = CFSTR("formsOrError");
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bugFormStubs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)objc_msgSend(*(id *)(a1 + 40), "didEndEvent:", 7);
    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("FBKDidRefreshFormStubsNotification"), *(_QWORD *)(a1 + 32), v8);

    objc_msgSend(*(id *)(a1 + 32), "formReloadCompletion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "formReloadCompletion");
      v12 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v12[2]();

      objc_msgSend(*(id *)(a1 + 32), "setFormReloadCompletion:", 0);
    }

  }
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_92(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[16];

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "Did reload", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "purgeOrphanedEntities");
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "managedObjectContext");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v4, "refreshObject:mergeChanges:", v5, 1);

  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "isInAnyProgram");

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("FBKUserNoPrograms"), *(_QWORD *)(a1 + 32));

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    FBKAggregatedErrorOfType(-1011, *(void **)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 48), "didEndEvent:", 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v24 = (void *)MEMORY[0x24BE2CA48];
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject contentItems](v10, "contentItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v25, "count");
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bugFormStubs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "teams");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v16 = objc_msgSend(*(id *)(a1 + 40), "count");
    objc_msgSend(v9, "startTimeInterval");
    v18 = v17;
    objc_msgSend(v9, "endTimeInterval");
    objc_msgSend(v24, "logDataLoadWithContentItemCount:formItemsCount:teamCount:errorsCount:startedAt:endedAt:", v22, v12, v15, v16, v18, v19);

  }
  else
  {
    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_92_cold_1();
  }

  objc_msgSend(*(id *)(a1 + 32), "setHasFinishedFirstLoad:", 1);
  v20 = *(_QWORD *)(a1 + 56);
  if (v20)
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v8);
  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "postNotificationName:object:", CFSTR("FBKDidReloadAppNotification"), *(_QWORD *)(a1 + 32));

}

- (void)resetContentAndFormItems
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[FBKData currentUser](self, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    -[FBKData currentUser](self, "currentUser");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bugFormStubs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v31 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
          objc_msgSend(v10, "bugForm");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            -[FBKData mainQueueContext](self, "mainQueueContext");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "bugForm");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "deleteObject:", v13);

          }
          -[FBKData mainQueueContext](self, "mainQueueContext");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deleteObject:", v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v7);
    }

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    -[FBKData currentUser](self, "currentUser", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contentItems");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v27;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v27 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
          objc_msgSend(v21, "formResponse");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            -[FBKData mainQueueContext](self, "mainQueueContext");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "formResponse");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "deleteObject:", v24);

          }
          -[FBKData mainQueueContext](self, "mainQueueContext");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "deleteObject:", v21);

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      }
      while (v18);
    }

    -[FBKData saveToStore:](self, "saveToStore:", 0);
  }
}

- (void)refreshContentItems
{
  -[FBKData _refreshContentItemsWithCompletion:](self, "_refreshContentItemsWithCompletion:", 0);
}

- (void)_refreshContentItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FBKData currentUser](self, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __46__FBKData__refreshContentItemsWithCompletion___block_invoke;
  v7[3] = &unk_24E159A50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FBKData takeMainQueueObject:andContinueWithPrivateQueueObject:](self, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v5, v7);

}

void __46__FBKData__refreshContentItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "privateQueueContext");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  +[FBKTeam personalTeamForUser:inContext:](FBKTeam, "personalTeamForUser:inContext:", v4, v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_refreshContentItemsForTeam:withCompletion:", v5, *(_QWORD *)(a1 + 40));
}

- (void)_refreshContentItemsForTeam:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  -[FBKData setIsRefreshingContent:](self, "setIsRefreshingContent:", 1);
  v8 = objc_initWeak(&location, self);
  -[FBKData api](self, "api");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__FBKData__refreshContentItemsForTeam_withCompletion___block_invoke;
  v11[3] = &unk_24E159A78;
  objc_copyWeak(&v13, &location);
  v10 = v7;
  v12 = v10;
  objc_msgSend(v9, "updateContentItemsForTeam:withCompletion:", v6, v11);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __54__FBKData__refreshContentItemsForTeam_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__FBKData__refreshContentItemsForTeam_withCompletion___block_invoke_2;
  block[3] = &unk_24E157510;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __54__FBKData__refreshContentItemsForTeam_withCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  const __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setIsRefreshingContent:", 0);

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDidFetchContentItems:", 1);

  v7 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    if (v6)
    {
      (*(void (**)(void))(v6 + 16))();
      v7 = *(_QWORD *)(a1 + 32);
    }
    v22 = CFSTR("contentItemsOrError");
    v23[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_loadWeakRetained(v2);
    objc_msgSend(v9, "notificationCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_loadWeakRetained(v2);
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("FBKDidRefreshContentItemsNotification"), v11, v8);

  }
  else
  {
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
    }
    else
    {
      v12 = objc_loadWeakRetained(v2);
      objc_msgSend(v12, "mainQueueContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_loadWeakRetained(v2);
      objc_msgSend(v14, "currentUser");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "refreshObject:mergeChanges:", v15, 1);

    }
    v16 = objc_loadWeakRetained(v2);
    objc_msgSend(v16, "notificationCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_loadWeakRetained(v2);
    objc_msgSend(v17, "postNotificationName:object:", CFSTR("FBKLocalDataDidChangeNotification"), v18);

    v21 = objc_loadWeakRetained(v2);
    objc_msgSend(v21, "notificationCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_loadWeakRetained(v2);
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("FBKDidRefreshContentItemsNotification"), v20);

  }
}

- (void)reloadItems:(id)a3 completion:(id)a4
{
  -[FBKData _reloadItems:retryCount:completion:](self, "_reloadItems:retryCount:completion:", a3, 0, a4);
}

- (void)_reloadItems:(id)a3 retryCount:(unint64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  dispatch_time_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  _QWORD block[5];
  id v25;
  id v26;
  unint64_t v27;
  uint8_t buf[4];
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  Log_5();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v29 = "-[FBKData _reloadItems:retryCount:completion:]";
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  if (a4 < 0x28)
  {
    if (-[FBKData isReloadingApp](self, "isReloadingApp"))
    {
      Log_5();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446210;
        v29 = "-[FBKData _reloadItems:retryCount:completion:]";
        _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}s while app is reloading. Will try again later", buf, 0xCu);
      }

      v20 = dispatch_time(0, 250000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __46__FBKData__reloadItems_retryCount_completion___block_invoke;
      block[3] = &unk_24E158978;
      block[4] = self;
      v25 = v8;
      v27 = a4;
      v26 = v9;
      dispatch_after(v20, MEMORY[0x24BDAC9B8], block);

      v21 = v25;
    }
    else
    {
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __46__FBKData__reloadItems_retryCount_completion___block_invoke_2;
      v22[3] = &unk_24E159A50;
      v22[4] = self;
      v23 = v9;
      -[FBKData takeMainQueueObject:andContinueWithPrivateQueueObject:](self, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v8, v22);
      v21 = v23;
    }

  }
  else
  {
    Log_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FBKData _reloadItems:retryCount:completion:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

  }
}

uint64_t __46__FBKData__reloadItems_retryCount_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadItems:retryCount:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56) + 1, *(_QWORD *)(a1 + 48));
}

void __46__FBKData__reloadItems_retryCount_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__FBKData__reloadItems_retryCount_completion___block_invoke_3;
  v4[3] = &unk_24E157380;
  v3 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  objc_msgSend(v5, "_refreshContentItemsForTeam:withCompletion:", a2, v4);

}

void __46__FBKData__reloadItems_retryCount_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__FBKData__reloadItems_retryCount_completion___block_invoke_4;
  block[3] = &unk_24E157358;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __46__FBKData__reloadItems_retryCount_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshObject:mergeChanges:", v4, 1);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40));
  return result;
}

- (void)deleteTargetedSurveyItemFromInboxIfNeeded:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (!+[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA"))
  {
    Log_5();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FBKData deleteTargetedSurveyItemFromInboxIfNeeded:].cold.3();
    goto LABEL_11;
  }
  if (!v4)
  {
    Log_5();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[FBKData deleteTargetedSurveyItemFromInboxIfNeeded:].cold.1();
    goto LABEL_11;
  }
  if ((objc_msgSend(v4, "isTargetedSurvey") & 1) == 0)
  {
    Log_5();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[FBKData deleteTargetedSurveyItemFromInboxIfNeeded:].cold.2();
LABEL_11:

    goto LABEL_12;
  }
  -[FBKData mainQueueContext](self, "mainQueueContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__FBKData_deleteTargetedSurveyItemFromInboxIfNeeded___block_invoke;
  v7[3] = &unk_24E157020;
  v7[4] = self;
  v8 = v4;
  objc_msgSend(v5, "performBlock:", v7);

LABEL_12:
}

void __53__FBKData_deleteTargetedSurveyItemFromInboxIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteObject:", *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v3, "save:", &v6);
  v4 = v6;

  if (v4)
  {
    Log_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __53__FBKData_deleteTargetedSurveyItemFromInboxIfNeeded___block_invoke_cold_1();

  }
}

- (void)refreshFormItems
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "environment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[FBKData setIsRefreshingForms:](self, "setIsRefreshingForms:", 1);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __27__FBKData_refreshFormItems__block_invoke;
    v6[3] = &unk_24E157EB0;
    v6[4] = self;
    -[FBKData _refreshFormItemsWithCompletion:](self, "_refreshFormItemsWithCompletion:", v6);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Basic for item refresh is called, but app is not unit testing."));
  }
}

void __27__FBKData_refreshFormItems__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsRefreshingForms:", 0);
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDidFetchFormStubs:", 1);

  if (v3)
  {
    v11 = CFSTR("formsOrError");
    v12[0] = v3;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("formsOrError");
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bugFormStubs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("FBKDidRefreshFormStubsNotification"), *(_QWORD *)(a1 + 32), v5);

}

- (void)_refreshFormItemsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[FBKData currentUser](self, "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__FBKData__refreshFormItemsWithCompletion___block_invoke;
  v7[3] = &unk_24E159A50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[FBKData takeMainQueueObject:andContinueWithPrivateQueueObject:](self, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v5, v7);

}

void __43__FBKData__refreshFormItemsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "privateQueueContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKTeam personalTeamForUser:inContext:](FBKTeam, "personalTeamForUser:inContext:", v4, v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_refreshFormItemsForTeam:formTat:withCompletion:", v6, 0, *(_QWORD *)(a1 + 40));
}

- (void)_refreshFormItemsForTeam:(id)a3 formTat:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    Log_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[FBKData _refreshFormItemsForTeam:formTat:withCompletion:].cold.1();

  }
  objc_initWeak(&location, self);
  -[FBKData currentUser](self, "currentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke;
  v16[3] = &unk_24E159AF0;
  v16[4] = self;
  v13 = v8;
  v17 = v13;
  v14 = v9;
  v18 = v14;
  v15 = v10;
  v19 = v15;
  objc_copyWeak(&v20, &location);
  -[FBKData takeMainQueueObject:andContinueWithPrivateQueueObject:](self, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v12, v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "api");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_2;
  v7[3] = &unk_24E159AC8;
  v8 = *(id *)(a1 + 56);
  objc_copyWeak(&v9, (id *)(a1 + 64));
  objc_msgSend(v4, "updateFormItemsForUser:inTeam:formTat:withCompletion:", v3, v5, v6, v7);

  objc_destroyWeak(&v9);
}

void __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id v9;

  v4 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_3;
  block[3] = &unk_24E159AA0;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v9);

}

void __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_3(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = (_QWORD *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    Log_5();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_3_cold_1();

    v4 = *(_QWORD *)(a1 + 40);
    if (v4)
      (*(void (**)(uint64_t, _QWORD))(v4 + 16))(v4, *v2);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "currentUser");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bugFormStubs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    Log_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v7, "count");
      v10 = objc_loadWeakRetained((id *)(a1 + 48));
      objc_msgSend(v10, "currentUser");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = 67109376;
      v14[1] = v9;
      v15 = 1024;
      v16 = objc_msgSend(v12, "intValue");
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "[%i] bug forms for user [%i]", (uint8_t *)v14, 0xEu);

    }
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);

  }
}

- (void)purgeOrphanedForms
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Does not use persistent store. Skipping Forms purge", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __29__FBKData_purgeOrphanedForms__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "formID");
}

- (void)purgeOrphanedEntities
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Does not use persistent store. Skipping entities purge", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __32__FBKData_purgeOrphanedEntities__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  id *v5;
  id WeakRetained;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  NSObject *v33;
  void *v34;
  int v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  NSObject *v52;
  void *v53;
  int v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  id v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  int *v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  void *v75;
  int v76;
  void *v77;
  int v78;
  NSObject *v79;
  void *v80;
  id *v81;
  uint64_t v82;
  void *v83;
  id v84;
  int *v85;
  int v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  id v97;
  void *v98;
  void *v99;
  id v100;
  NSObject *v101;
  id v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t m;
  uint64_t v107;
  id v108;
  void *v109;
  id v110;
  void *v111;
  int v112;
  id v113;
  void *v114;
  id v115;
  NSObject *v116;
  NSObject *v117;
  id v118;
  void *v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  uint64_t v130;
  void *v131;
  id v132;
  id v133;
  id obj;
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  id v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  id v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  id v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  id v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  id v160;
  _BYTE v161[128];
  _QWORD v162[4];
  uint8_t buf[4];
  int v164;
  __int16 v165;
  void *v166;
  _BYTE v167[128];
  _BYTE v168[128];
  _QWORD v169[2];
  _BYTE v170[128];
  _BYTE v171[128];
  uint64_t v172;

  v172 = *MEMORY[0x24BDAC8D0];
  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "purge orphaned entities start", buf, 2u);
  }

  +[FBKContentItem fetchRequest](FBKContentItem, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("teams.@count == 0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  objc_msgSend(v3, "setPropertiesToFetch:", &unk_24E18D6D0);
  v5 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "privateQueueContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v160 = 0;
  v128 = v3;
  objc_msgSend(v7, "executeFetchRequest:error:", v3, &v160);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v160;

  if (v9)
  {
    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_5();

  }
  v131 = v9;
  v158 = 0u;
  v159 = 0u;
  v156 = 0u;
  v157 = 0u;
  obj = v8;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v171, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v157;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v157 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * i);
        +[FBKLog net](FBKLog, "net");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v15, "remoteID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "intValue");
          *(_DWORD *)buf = 67109120;
          v164 = v18;
          _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_INFO, "Removing orphan item [%i]", buf, 8u);

        }
        v19 = objc_loadWeakRetained(v5);
        objc_msgSend(v19, "privateQueueContext");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deleteObject:", v15);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v156, v171, 16);
    }
    while (v12);
  }

  +[FBKFilePredicate fetchRequest](FBKFilePredicate, "fetchRequest");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("bugForms.@count == 0"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPredicate:", v22);

  v23 = objc_loadWeakRetained(v5);
  objc_msgSend(v23, "privateQueueContext");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v155 = 0;
  v127 = v21;
  objc_msgSend(v24, "executeFetchRequest:error:", v21, &v155);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v155;

  if (v26)
  {
    Log_5();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_4();

  }
  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  v133 = v25;
  v28 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v152;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v152 != v30)
          objc_enumerationMutation(v133);
        v32 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * j);
        Log_5();
        v33 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v32, "ID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "intValue");
          *(_DWORD *)buf = 67109120;
          v164 = v35;
          _os_log_impl(&dword_21D9A9000, v33, OS_LOG_TYPE_DEFAULT, "Deleting orphan Predicate [%i]", buf, 8u);

        }
        v36 = objc_loadWeakRetained(v5);
        objc_msgSend(v36, "privateQueueContext");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "deleteObject:", v32);

      }
      v29 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
    }
    while (v29);
  }

  +[FBKFileMatcher fetchRequest](FBKFileMatcher, "fetchRequest");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("filePredicates.@count == 0"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v169[0] = v39;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("feedbackFollowups.@count == 0"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v169[1] = v40;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v169, 2);
  v41 = objc_claimAutoreleasedReturnValue();

  v125 = (void *)v41;
  v124 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD14C0]), "initWithType:subpredicates:", 1, v41);
  objc_msgSend(v38, "setPredicate:");
  v42 = objc_loadWeakRetained(v5);
  objc_msgSend(v42, "privateQueueContext");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = 0;
  v126 = v38;
  objc_msgSend(v43, "executeFetchRequest:error:", v38, &v150);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v150;

  if (v45)
  {
    Log_5();
    v46 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_3();

  }
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  v132 = v44;
  v47 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v146, v168, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v147;
    do
    {
      for (k = 0; k != v48; ++k)
      {
        if (*(_QWORD *)v147 != v49)
          objc_enumerationMutation(v132);
        v51 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * k);
        Log_5();
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v51, "ID");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = objc_msgSend(v53, "intValue");
          *(_DWORD *)buf = 67109120;
          v164 = v54;
          _os_log_impl(&dword_21D9A9000, v52, OS_LOG_TYPE_DEFAULT, "Deleting orphan FileMatcher [%i]", buf, 8u);

        }
        v55 = objc_loadWeakRetained(v5);
        objc_msgSend(v55, "privateQueueContext");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "deleteObject:", v51);

      }
      v48 = objc_msgSend(v132, "countByEnumeratingWithState:objects:count:", &v146, v168, 16);
    }
    while (v48);
  }

  +[FBKFormResponse fetchRequest](FBKFormResponse, "fetchRequest");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setPropertiesToFetch:", &unk_24E18D6E8);
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("contentItem == nil"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setPredicate:", v58);

  v59 = objc_loadWeakRetained(v5);
  objc_msgSend(v59, "privateQueueContext");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v145 = 0;
  v123 = v57;
  objc_msgSend(v60, "executeFetchRequest:error:", v57, &v145);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v145;

  v129 = v61;
  if (objc_msgSend(v61, "count"))
  {
    v122 = v62;
    v63 = objc_alloc_init(MEMORY[0x24BDBCE68]);
    objc_msgSend(v63, "setHour:", -1);
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_alloc_init(MEMORY[0x24BDBCE60]);
    v121 = v63;
    objc_msgSend(v64, "dateByAddingComponents:toDate:options:", v63, v65, 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v144 = 0u;
    v142 = 0u;
    v143 = 0u;
    v141 = 0u;
    v67 = v129;
    v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
    if (v68)
    {
      v69 = v68;
      v70 = *(_QWORD *)v142;
      v71 = &dword_21D9A9000;
      do
      {
        v72 = 0;
        v130 = v69;
        do
        {
          if (*(_QWORD *)v142 != v70)
            objc_enumerationMutation(v67);
          v73 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * v72);
          Log_5();
          v74 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v73, "ID");
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v76 = objc_msgSend(v75, "intValue");
            *(_DWORD *)buf = 67109120;
            v164 = v76;
            _os_log_impl(v71, v74, OS_LOG_TYPE_DEFAULT, "Found orphan FR [%i]", buf, 8u);

          }
          objc_msgSend(v73, "createdAt");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v66, "isEarlierThan:", v77);

          if (v78)
          {
            Log_5();
            v79 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v73, "ID");
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              v81 = v5;
              v82 = v70;
              v83 = v66;
              v84 = v67;
              v85 = v71;
              v86 = objc_msgSend(v80, "intValue");
              objc_msgSend(v73, "createdAt");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 67109378;
              v164 = v86;
              v71 = v85;
              v67 = v84;
              v66 = v83;
              v70 = v82;
              v5 = v81;
              v69 = v130;
              v165 = 2114;
              v166 = v87;
              _os_log_impl(v71, v79, OS_LOG_TYPE_DEFAULT, "Orphan FR [%i] was recently created (%{public}@). Will defer deletion.", buf, 0x12u);

            }
          }
          else
          {
            v79 = objc_loadWeakRetained(v5);
            -[NSObject privateQueueContext](v79, "privateQueueContext");
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v88, "deleteObject:", v73);

          }
          ++v72;
        }
        while (v69 != v72);
        v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v141, v167, 16);
      }
      while (v69);
    }

    v62 = v122;
  }

  +[FBKParticipant fetchRequest](FBKParticipant, "fetchRequest");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setPropertiesToFetch:", &unk_24E18D700);
  v90 = (void *)MEMORY[0x24BDD14C0];
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("originatedFeedback.@count == 0"));
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v162[0] = v91;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("assignedFeedback.@count == 0"));
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v162[1] = v92;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("teams.@count == 0"));
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  v162[2] = v93;
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("followups.@count == 0"));
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v162[3] = v94;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v162, 4);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v90, "andPredicateWithSubpredicates:", v95);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setPredicate:", v96);

  v97 = objc_loadWeakRetained(v5);
  objc_msgSend(v97, "privateQueueContext");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = 0;
  objc_msgSend(v98, "executeFetchRequest:error:", v89, &v140);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v140;

  if (v100)
  {
    Log_5();
    v101 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_ERROR))
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_2();

  }
  v138 = 0u;
  v139 = 0u;
  v136 = 0u;
  v137 = 0u;
  v102 = v99;
  v103 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v136, v161, 16);
  if (v103)
  {
    v104 = v103;
    v105 = *(_QWORD *)v137;
    do
    {
      for (m = 0; m != v104; ++m)
      {
        if (*(_QWORD *)v137 != v105)
          objc_enumerationMutation(v102);
        v107 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * m);
        v108 = objc_loadWeakRetained(v5);
        objc_msgSend(v108, "privateQueueContext");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "deleteObject:", v107);

      }
      v104 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v136, v161, 16);
    }
    while (v104);
  }

  v110 = objc_loadWeakRetained(v5);
  objc_msgSend(v110, "privateQueueContext");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v111, "hasChanges");

  if (v112)
  {
    v113 = objc_loadWeakRetained(v5);
    objc_msgSend(v113, "privateQueueContext");
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = v100;
    objc_msgSend(v114, "save:", &v135);
    v115 = v135;

    v100 = v115;
  }
  if (v100)
  {
    Log_5();
    v116 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v116, OS_LOG_TYPE_ERROR))
      __32__FBKData_purgeOrphanedEntities__block_invoke_cold_1();

  }
  Log_5();
  v117 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v117, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v117, OS_LOG_TYPE_INFO, "purge orphaned entities end", buf, 2u);
  }

  v118 = objc_loadWeakRetained(v5);
  objc_msgSend(v118, "notificationCenter");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  v120 = objc_loadWeakRetained(v5);
  objc_msgSend(v119, "postNotificationName:object:", CFSTR("FBKDidPurgeOrphanEntitiesNotification"), v120);

}

- (id)userForUsername:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a3;
  v6 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __37__FBKData_userForUsername_inContext___block_invoke;
  v11[3] = &unk_24E159B80;
  v7 = v5;
  v12 = v7;
  v8 = v6;
  v13 = v8;
  v14 = &v15;
  objc_msgSend(v8, "performBlockAndWait:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __37__FBKData_userForUsername_inContext___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  +[FBKUser fetchRequest](FBKUser, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("username = %@"), a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v3);

  objc_msgSend(v2, "setReturnsObjectsAsFaults:", 0);
  v4 = (void *)a1[5];
  v11 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v2, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5 && objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;
  }
  else
  {
    v10 = *(_QWORD *)(a1[6] + 8);
    v9 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = 0;
  }

}

- (id)userForUsername:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[FBKData mainQueueContext](self, "mainQueueContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData userForUsername:inContext:](self, "userForUsername:inContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)refreshUnreadCountWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  -[FBKData loginManager](self, "loginManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loginState");

  if (v6)
  {
    objc_initWeak(&location, self);
    -[FBKData mainQueueContext](self, "mainQueueContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__FBKData_refreshUnreadCountWithCompletion___block_invoke;
    v8[3] = &unk_24E1598A0;
    v8[4] = self;
    objc_copyWeak(&v10, &location);
    v9 = v4;
    objc_msgSend(v7, "performBlock:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
  }

}

void __44__FBKData_refreshUnreadCountWithCompletion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  +[FBKContentItem fetchRequest](FBKContentItem, "fetchRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKContentItem unreadContentItemsPredicateForUser:](FBKContentItem, "unreadContentItemsPredicateForUser:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setPredicate:", v4);

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "mainQueueContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v2, &v14);
  v8 = v14;

  if (v8)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __44__FBKData_refreshUnreadCountWithCompletion___block_invoke_cold_1();

  }
  if (a1[5])
  {
    objc_msgSend(a1[4], "mainQueueContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44__FBKData_refreshUnreadCountWithCompletion___block_invoke_148;
    v11[3] = &unk_24E159BA8;
    v12 = a1[5];
    v13 = v7;
    objc_msgSend(v10, "performBlockAndWait:", v11);

  }
}

uint64_t __44__FBKData_refreshUnreadCountWithCompletion___block_invoke_148(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)updateResolversForLocalBugForms
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  +[FBKBugForm fetchRequest](FBKBugForm, "fetchRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("active = YES"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = objc_initWeak(&location, self);
  -[FBKData privateQueueContext](self, "privateQueueContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __42__FBKData_updateResolversForLocalBugForms__block_invoke;
  v8[3] = &unk_24E159BD0;
  objc_copyWeak(&v10, &location);
  v7 = v3;
  v9 = v7;
  objc_msgSend(v6, "performBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __42__FBKData_updateResolversForLocalBugForms__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "privateQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executeFetchRequest:error:", *(_QWORD *)(a1 + 32), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10++), "updateResolvableQuestions");
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "privateQueueContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v12, "save:", &v15);
  v13 = v15;

  if (v13)
  {
    Log_5();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      __42__FBKData_updateResolversForLocalBugForms__block_invoke_cold_1();

  }
}

- (void)refreshBugFormWithID:(id)a3 fromStub:(id)a4 forTeam:(id)a5 completion:(id)a6
{
  -[FBKData refreshBugFormWithID:fromStub:forTeam:requestPlugIns:appToken:completion:](self, "refreshBugFormWithID:fromStub:forTeam:requestPlugIns:appToken:completion:", a3, a4, a5, 0, 0, a6);
}

- (void)refreshBugFormWithID:(id)a3 fromStub:(id)a4 forTeam:(id)a5 requestPlugIns:(id)a6 appToken:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  FBKData *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_initWeak(&location, self);
  -[FBKData mainQueueContext](self, "mainQueueContext");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke;
  v27[3] = &unk_24E159C20;
  v21 = v15;
  v28 = v21;
  objc_copyWeak(&v35, &location);
  v22 = v14;
  v29 = v22;
  v23 = v19;
  v34 = v23;
  v30 = self;
  v24 = v16;
  v31 = v24;
  v25 = v17;
  v32 = v25;
  v26 = v18;
  v33 = v26;
  objc_msgSend(v20, "performBlock:", v27);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke(uint64_t a1)
{
  id v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _BOOL4 v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "bugForm");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(WeakRetained, "mainQueueContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKBugForm entityName](FBKBugForm, "entityName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "findFeedbackObjectWithEntityName:remoteID:", v5, *(_QWORD *)(a1 + 40));
    v2 = (id)objc_claimAutoreleasedReturnValue();

  }
  v6 = *(void **)(a1 + 32);
  if (v6
    && (objc_msgSend(v6, "bugForm"), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, !v7)
    && v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setBugForm:", v2);
    v8 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v8, "mainQueueContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0;
    objc_msgSend(v9, "save:", &v46);
    v10 = v46;

    if (v10)
    {
      Log_5();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_cold_1(v2);

    }
  }
  else if (!v2)
  {
LABEL_28:
    if (objc_msgSend(*(id *)(a1 + 56), "teamType"))
    {
      objc_msgSend(*(id *)(a1 + 56), "ID");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v34 = 0;
    }
    v27 = objc_loadWeakRetained((id *)(a1 + 88));
    objc_msgSend(v27, "api");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1 + 40);
    v30 = *(_QWORD *)(a1 + 64);
    v31 = *(_QWORD *)(a1 + 72);
    v32 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_152;
    v39[3] = &unk_24E159BF8;
    objc_copyWeak(&v42, (id *)(a1 + 88));
    v41 = *(id *)(a1 + 80);
    v40 = *(id *)(a1 + 32);
    v35[0] = v32;
    v35[1] = 3221225472;
    v35[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_154;
    v35[3] = &unk_24E157070;
    v36 = *(id *)(a1 + 40);
    v33 = *(id *)(a1 + 80);
    v37 = *(_QWORD *)(a1 + 48);
    v38 = v33;
    objc_msgSend(v28, "fetchBugFormWithID:forTeamID:requestPlugIns:appToken:success:error:", v29, v34, v30, v31, v39, v35);

    objc_destroyWeak(&v42);
    v2 = 0;

    goto LABEL_32;
  }
  objc_msgSend(v2, "questionGroups");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count") == 0;

  if (v13)
  {
    Log_5();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
LABEL_27:

      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    v22 = "Bug form has no question groups, fetching from server.";
    v23 = v21;
    v24 = OS_LOG_TYPE_INFO;
LABEL_26:
    _os_log_impl(&dword_21D9A9000, v23, v24, v22, buf, 2u);
    goto LABEL_27;
  }
  v14 = objc_msgSend(v2, "matchesFormStubSignature:", *(_QWORD *)(a1 + 32));
  Log_5();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (v16)
    {
      objc_msgSend(v2, "signatureDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "signatureDescription");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v48 = v25;
      v49 = 2114;
      v50 = v26;
      _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] does not match [%{public}@]", buf, 0x16u);

    }
    Log_5();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v22 = "Cache signature mismatch, will fetch form from server.";
    v23 = v21;
    v24 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_26;
  }
  if (v16)
  {
    objc_msgSend(v2, "signatureDescription");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "signatureDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v48 = v17;
    v49 = 2114;
    v50 = v18;
    _os_log_impl(&dword_21D9A9000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] matches [%{public}@]", buf, 0x16u);

  }
  Log_5();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_DEFAULT, "Proceeding with cached form.", buf, 2u);
  }

  if (*(_QWORD *)(a1 + 80))
  {
    objc_msgSend(*(id *)(a1 + 48), "mainQueueContext");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_151;
    v43[3] = &unk_24E156FA8;
    v45 = *(id *)(a1 + 80);
    v2 = v2;
    v44 = v2;
    objc_msgSend(v20, "performBlockAndWait:", v43);

  }
LABEL_32:

}

uint64_t __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_151(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_152(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD aBlock[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  v4 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_2;
  aBlock[3] = &unk_24E157510;
  objc_copyWeak(&v16, (id *)(a1 + 48));
  v5 = v3;
  v14 = v5;
  v15 = *(id *)(a1 + 40);
  v6 = _Block_copy(aBlock);
  v7 = v6;
  if (*(_QWORD *)(a1 + 32))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v9 = *(_QWORD *)(a1 + 32);
    v10[0] = v4;
    v10[1] = 3221225472;
    v10[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_4;
    v10[3] = &unk_24E159A50;
    v11 = v5;
    v12 = v7;
    objc_msgSend(WeakRetained, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v9, v10);

  }
  else
  {
    (*((void (**)(void *))v6 + 2))(v6);
  }

  objc_destroyWeak(&v16);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_2(id *a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "mainQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_3;
  v5[3] = &unk_24E157510;
  objc_copyWeak(&v8, v2);
  v6 = a1[4];
  v7 = a1[5];
  objc_msgSend(v4, "performBlock:", v5);

  objc_destroyWeak(&v8);
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "setStub:", v3);
  objc_msgSend(*(id *)(a1 + 32), "signature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*v4, "setSignature:", v5);
  }
  else
  {
    objc_msgSend(v3, "signature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v4, "setSignature:", v6);

  }
  objc_msgSend(*v4, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(v7, "save:", &v10);
  v8 = v10;

  if (v8)
  {
    Log_5();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_4_cold_1((id *)(a1 + 32));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_154(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_154_cold_1();

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_155;
    v6[3] = &unk_24E156FA8;
    v8 = *(id *)(a1 + 48);
    v7 = v3;
    objc_msgSend(v5, "performBlockAndWait:", v6);

  }
}

uint64_t __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_155(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)closeFeedbackItems:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[4];
  id v19;
  FBKData *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v17 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v8 = dispatch_group_create();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13);
        dispatch_group_enter(v8);
        v22[0] = MEMORY[0x24BDAC760];
        v22[1] = 3221225472;
        v22[2] = __41__FBKData_closeFeedbackItems_completion___block_invoke;
        v22[3] = &unk_24E1599B0;
        v23 = v7;
        v24 = v8;
        -[FBKData _closeFeedbackItem:completion:](self, "_closeFeedbackItem:completion:", v14, v22);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__FBKData_closeFeedbackItems_completion___block_invoke_2;
  block[3] = &unk_24E157138;
  v19 = v7;
  v20 = self;
  v21 = v17;
  v15 = v17;
  v16 = v7;
  dispatch_group_notify(v8, MEMORY[0x24BDAC9B8], block);

}

void __41__FBKData_closeFeedbackItems_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __41__FBKData_closeFeedbackItems_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(a1 + 32));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    FBKAggregatedErrorOfType(-1009, v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v3, "description");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Refreshing all content, encountered error on close: %{public}@", (uint8_t *)&v7, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "reloadAllContentWithCompletion:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "postNotificationName:object:", CFSTR("FBKLocalDataDidChangeNotification"), *(_QWORD *)(a1 + 40));

    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0);
  }
}

- (void)_closeFeedbackItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  Log_5();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "shortDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v9;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_DEFAULT, "Closing feedback [%{public}@]", buf, 0xCu);

  }
  -[FBKData api](self, "api");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __41__FBKData__closeFeedbackItem_completion___block_invoke;
  v13[3] = &unk_24E157188;
  v14 = v7;
  v12 = v7;
  objc_msgSend(v10, "closeFeedbackItemWithID:withCompletion:", v11, v13);

}

void __41__FBKData__closeFeedbackItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __41__FBKData__closeFeedbackItem_completion___block_invoke_2;
  v6[3] = &unk_24E156FA8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __41__FBKData__closeFeedbackItem_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

- (void)newFormResponseForBugFormStub:(id)a3 inTeam:(id)a4 completion:(id)a5
{
  -[FBKData newFormResponseForBugFormStub:inTeam:requestPlugIns:appToken:completion:](self, "newFormResponseForBugFormStub:inTeam:requestPlugIns:appToken:completion:", a3, a4, 0, 0, a5);
}

- (void)newFormResponseForBugFormStub:(id)a3 inTeam:(id)a4 requestPlugIns:(id)a5 appToken:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _DWORD v20[2];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  +[FBKLog clientHandle](FBKLog, "clientHandle");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v12, "ID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = 67109120;
    v20[1] = objc_msgSend(v18, "intValue");
    _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_DEFAULT, "new form response for bug form stub [%d]", (uint8_t *)v20, 8u);

  }
  objc_msgSend(v12, "ID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData _newFormResponseForBugFormID:formStub:inTeam:requestPlugIns:appToken:completion:](self, "_newFormResponseForBugFormID:formStub:inTeam:requestPlugIns:appToken:completion:", v19, v12, v16, v15, v14, v13);

}

- (void)newFormResponseForBugForm:(id)a3 inTeam:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = a4;
  +[FBKLog clientHandle](FBKLog, "clientHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "ID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = 67109120;
    v14[1] = objc_msgSend(v12, "intValue");
    _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "new form response for bug form [%d]", (uint8_t *)v14, 8u);

  }
  objc_msgSend(v8, "ID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData _newFormResponseForBugFormID:formStub:inTeam:requestPlugIns:appToken:completion:](self, "_newFormResponseForBugFormID:formStub:inTeam:requestPlugIns:appToken:completion:", v13, 0, v10, 0, 0, v9);

}

- (void)_newFormResponseForBugFormID:(id)a3 formStub:(id)a4 inTeam:(id)a5 requestPlugIns:(id)a6 appToken:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  FBKData *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id location;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  objc_initWeak(&location, self);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke;
  v24[3] = &unk_24E159CC0;
  v20 = v14;
  v25 = v20;
  v21 = v19;
  v29 = v21;
  v26 = self;
  v22 = v16;
  v27 = v22;
  objc_copyWeak(&v30, &location);
  v23 = v18;
  v28 = v23;
  -[FBKData refreshBugFormWithID:fromStub:forTeam:requestPlugIns:appToken:completion:](self, "refreshBugFormWithID:fromStub:forTeam:requestPlugIns:appToken:completion:", v20, v15, v22, v17, v23, v24);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  int8x16_t v14;
  _QWORD v15[4];
  id v16;
  id v17;
  int8x16_t v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    objc_msgSend(*(id *)(a1 + 48), "ID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_2;
    v15[3] = &unk_24E159C98;
    objc_copyWeak(&v20, (id *)(a1 + 72));
    v10 = v8;
    v16 = v10;
    v17 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v14 = *(int8x16_t *)(a1 + 32);
    v11 = (id)v14.i64[0];
    v18 = vextq_s8(v14, v14, 8uLL);
    objc_msgSend(WeakRetained, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v5, v15);

    objc_destroyWeak(&v20);
LABEL_8:

    goto LABEL_9;
  }
  Log_5();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_cold_1(a1);

  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_156;
    v21[3] = &unk_24E156FA8;
    v23 = *(id *)(a1 + 64);
    v22 = v7;
    objc_msgSend(v13, "performBlockAndWait:", v21);

    v10 = v23;
    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_156(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  id v30;
  _QWORD v31[5];
  id v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v26 = a2;
  objc_msgSend(v26, "stub");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(WeakRetained, "privateQueueContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKTeam personalTeamForUser:inContext:](FBKTeam, "personalTeamForUser:inContext:", v4, v6);
  v24 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "surveyContentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v26, "surveyContentItem");
  else
    objc_msgSend(v26, "stub");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "teams", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v35;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v35 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "ID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

        if (v16)
        {
          v17 = v14;

          v25 = v17;
          goto LABEL_14;
        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_14:

  v18 = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v18, "api");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_QWORD *)(a1 + 40);
  v21 = MEMORY[0x24BDAC760];
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_3;
  v31[3] = &unk_24E159C70;
  v22 = *(id *)(a1 + 64);
  v31[4] = *(_QWORD *)(a1 + 48);
  v32 = v22;
  objc_copyWeak(&v33, (id *)(a1 + 72));
  v27[0] = v21;
  v27[1] = 3221225472;
  v27[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_5;
  v27[3] = &unk_24E157070;
  v28 = *(id *)(a1 + 56);
  v23 = *(id *)(a1 + 64);
  v29 = *(_QWORD *)(a1 + 48);
  v30 = v23;
  objc_msgSend(v19, "createFormResponseForBugForm:inTeam:appToken:success:error:", v26, v25, v20, v31, v27);

  objc_destroyWeak(&v33);
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_3(id *a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  if (a1[5])
  {
    objc_msgSend(a1[4], "mainQueueContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_4;
    v5[3] = &unk_24E159C48;
    v7 = a1[5];
    objc_copyWeak(&v8, a1 + 6);
    v6 = v3;
    objc_msgSend(v4, "performBlockAndWait:", v5);

    objc_destroyWeak(&v8);
  }

}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, _QWORD))(v2 + 16))(v2, v3, 0);

}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_5_cold_1(a1);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_158;
    v6[3] = &unk_24E156FA8;
    v8 = *(id *)(a1 + 48);
    v7 = v3;
    objc_msgSend(v5, "performBlockAndWait:", v6);

  }
}

uint64_t __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_158(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)refreshFormResponseFromContentItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "ID");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[FBKData refreshFormResponseWithID:contentItem:completion:](self, "refreshFormResponseWithID:contentItem:completion:", v8, v7, v6);

}

- (void)refreshFormResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "ID");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[FBKData refreshFormResponseWithID:contentItem:completion:](self, "refreshFormResponseWithID:contentItem:completion:", v9, v8, v6);
}

- (void)refreshFormResponseOnlyWithID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  FBKData *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FBKData api](self, "api");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x24BDAC760];
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke;
  v16[3] = &unk_24E159D10;
  objc_copyWeak(&v18, &location);
  v16[4] = self;
  v17 = v7;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2_161;
  v12[3] = &unk_24E157070;
  v10 = v6;
  v13 = v10;
  v11 = v17;
  v14 = self;
  v15 = v11;
  objc_msgSend(v8, "updateFormResponseWithID:success:error:", v10, v16, v12);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  int v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "privateQueueContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasChanges");

  if (!v6)
    goto LABEL_7;
  v7 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(v7, "privateQueueContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v8, "save:", &v25);
  v9 = v25;

  if (!v9)
  {
LABEL_7:
    objc_msgSend(a1[4], "mainQueueObjectFromPrivate:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v14, "mainQueueContext");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2;
    v20[3] = &unk_24E159CE8;
    objc_copyWeak(&v24, a1 + 6);
    v12 = v13;
    v21 = v12;
    v16 = a1[5];
    v22 = a1[4];
    v23 = v16;
    objc_msgSend(v15, "performBlock:", v20);

    objc_destroyWeak(&v24);
    v9 = 0;
    goto LABEL_8;
  }
  Log_5();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_cold_1(v9, v10);

  if (a1[5])
  {
    objc_msgSend(a1[4], "mainQueueContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_160;
    v17[3] = &unk_24E156FA8;
    v19 = a1[5];
    v9 = v9;
    v18 = v9;
    objc_msgSend(v11, "performBlockAndWait:", v17);

    v12 = v19;
LABEL_8:

  }
}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2(id *a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "mainQueueContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshObject:mergeChanges:", a1[4], 1);

  if (a1[6])
  {
    objc_msgSend(a1[5], "mainQueueContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_3;
    v5[3] = &unk_24E156FA8;
    v7 = a1[6];
    v6 = a1[4];
    objc_msgSend(v4, "performBlockAndWait:", v5);

  }
}

uint64_t __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_160(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2_161(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2_161_cold_1();

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_162;
    v6[3] = &unk_24E156FA8;
    v8 = *(id *)(a1 + 48);
    v7 = v3;
    objc_msgSend(v5, "performBlockAndWait:", v6);

  }
}

uint64_t __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_162(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)refreshFormResponseWithID:(id)a3 contentItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  FBKData *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  FBKData *v26;
  id v27;
  id v28;
  id v29;
  id buf;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[FBKLog clientHandle](FBKLog, "clientHandle");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = objc_msgSend(v8, "intValue");
    _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_INFO, "refreshing form response [%i]", (uint8_t *)&buf, 8u);
  }

  objc_initWeak(&buf, self);
  objc_msgSend(v9, "singleTeam");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData api](self, "api");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke;
  v23[3] = &unk_24E159DD8;
  objc_copyWeak(&v29, &buf);
  v15 = v12;
  v24 = v15;
  v25 = v8;
  v28 = v10;
  v26 = self;
  v16 = v9;
  v27 = v16;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_5;
  v19[3] = &unk_24E157070;
  v17 = v25;
  v20 = v17;
  v18 = v28;
  v21 = self;
  v22 = v18;
  objc_msgSend(v13, "updateFormResponseWithID:success:error:", v17, v23, v19);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&buf);

}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  objc_msgSend(v3, "formID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2;
  v10[3] = &unk_24E159CC0;
  v6 = *(_QWORD *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 64);
  v8 = *(_QWORD *)(a1 + 48);
  v15 = v7;
  v12 = v8;
  v9 = v3;
  v13 = v9;
  objc_copyWeak(&v16, (id *)(a1 + 72));
  v14 = *(id *)(a1 + 56);
  objc_msgSend(WeakRetained, "refreshBugFormWithID:fromStub:forTeam:completion:", v5, 0, v6, v10);

  objc_destroyWeak(&v16);
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  id WeakRetained;
  void *v13;
  uint64_t v14;
  id *v15;
  NSObject *v16;
  void *v17;
  id *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  id v29;
  uint64_t v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    v8 = MEMORY[0x24BDAC760];
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 3221225472;
    aBlock[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_164;
    aBlock[3] = &unk_24E159D88;
    v27 = *(id *)(a1 + 48);
    objc_copyWeak(&v32, (id *)(a1 + 72));
    v28 = v5;
    v29 = 0;
    v9 = *(id *)(a1 + 64);
    v30 = *(_QWORD *)(a1 + 40);
    v31 = v9;
    v10 = _Block_copy(aBlock);
    v11 = *(_QWORD *)(a1 + 56);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    v13 = WeakRetained;
    if (v11)
    {
      v14 = *(_QWORD *)(a1 + 56);
      v24[0] = v8;
      v24[1] = 3221225472;
      v24[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_173;
      v24[3] = &unk_24E159DB0;
      v25 = v10;
      objc_msgSend(v13, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v14, v24);
      v15 = &v25;
    }
    else
    {
      v19 = WeakRetained;
      objc_msgSend(v19, "currentUser");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      v21[1] = 3221225472;
      v21[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_3;
      v21[3] = &unk_24E159A50;
      v22 = *(id *)(a1 + 48);
      v23 = v10;
      objc_msgSend(v19, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v20, v21);
      v15 = &v22;

      v13 = v23;
    }
    v18 = &v27;

    objc_destroyWeak(&v32);
    goto LABEL_11;
  }
  Log_5();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_cold_1();

  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = MEMORY[0x24BDAC760];
    v33[1] = 3221225472;
    v33[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_163;
    v33[3] = &unk_24E156FA8;
    v18 = &v35;
    v35 = *(id *)(a1 + 64);
    v34 = v7;
    objc_msgSend(v17, "performBlockAndWait:", v33);

LABEL_11:
  }

}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_163(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_164(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setFormResponse:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    Log_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_164_cold_1(a1);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_165;
  v9[3] = &unk_24E159D60;
  v7 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 48);
  objc_copyWeak(&v15, (id *)(a1 + 72));
  v12 = *(id *)(a1 + 40);
  v8 = *(id *)(a1 + 64);
  v13 = *(_QWORD *)(a1 + 56);
  v14 = v8;
  objc_msgSend(WeakRetained, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v7, v9);

  objc_destroyWeak(&v15);
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_165(id *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  id *v31;
  id WeakRetained;
  void *v33;
  int v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  void *v42;
  id v43;
  id *v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  id *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  uint8_t v76[128];
  uint8_t buf[4];
  void *v78;
  __int16 v79;
  void *v80;
  _BYTE v81[128];
  uint64_t v82;

  v82 = *MEMORY[0x24BDAC8D0];
  v46 = a2;
  objc_msgSend(a1[4], "setBugForm:");
  v44 = a1 + 5;
  v45 = a1[5];
  v52 = a1;
  objc_msgSend(a1[4], "answers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v72 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
        Log_5();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v8, "questionID");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "values");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v78 = v13;
          v79 = 2112;
          v80 = v14;
          _os_log_debug_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEBUG, "Existing Answer [%@] -> values: [%@]", buf, 0x16u);

        }
        objc_msgSend(v8, "questionID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          Log_5();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v78 = v8;
            _os_log_fault_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_FAULT, "FBKAnswer [%{public}@] has nil questionID", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(v8, "questionID");
          v12 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, v12);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v81, 16);
    }
    while (v5);
  }

  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  objc_msgSend(v46, "questionGroups");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v68;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v68 != v48)
        {
          v16 = v15;
          objc_enumerationMutation(v47);
          v15 = v16;
        }
        v50 = v15;
        v17 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v15);
        v63 = 0u;
        v64 = 0u;
        v65 = 0u;
        v66 = 0u;
        objc_msgSend(v17, "questions");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v64;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v64 != v20)
                objc_enumerationMutation(v18);
              v22 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
              objc_msgSend(v22, "ID");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "objectForKeyedSubscript:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v24)
              {
                objc_msgSend(v22, "answers");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = v25;
                if (v25)
                  v27 = v25;
                else
                  v27 = (id)objc_opt_new();
                v29 = v27;

                objc_msgSend(v29, "setByAddingObject:", v24);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "setAnswers:", v30);

              }
              else
              {
                v28 = +[FBKAnswer emptyLocalAnswerForQuestion:inFormResponse:](FBKAnswer, "emptyLocalAnswerForQuestion:inFormResponse:", v22, v52[4]);
              }

            }
            v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, v75, 16);
          }
          while (v19);
        }

        v15 = v50 + 1;
      }
      while (v50 + 1 != v49);
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v67, v76, 16);
    }
    while (v49);
  }

  v31 = v52 + 9;
  WeakRetained = objc_loadWeakRetained(v52 + 9);
  objc_msgSend(WeakRetained, "privateQueueContext");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "hasChanges");

  if (v34)
  {
    v35 = objc_loadWeakRetained(v31);
    objc_msgSend(v35, "privateQueueContext");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v45;
    objc_msgSend(v36, "save:", &v62);
    v37 = v62;

  }
  else
  {
    v37 = v45;
  }
  v38 = v37;
  if (v37)
  {
    Log_5();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_165_cold_1(v46, v44, v39);

    if (v52[8])
    {
      objc_msgSend(v52[7], "mainQueueContext");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v53[0] = MEMORY[0x24BDAC760];
      v53[1] = 3221225472;
      v53[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_171;
      v53[3] = &unk_24E156FA8;
      v55 = v52[8];
      v54 = v37;
      objc_msgSend(v40, "performBlockAndWait:", v53);

    }
  }
  else
  {
    v41 = objc_loadWeakRetained(v31);
    objc_msgSend(v41, "mainQueueContext");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v56[0] = MEMORY[0x24BDAC760];
    v56[1] = 3221225472;
    v56[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_169;
    v56[3] = &unk_24E159D38;
    objc_copyWeak(&v61, v31);
    v57 = v52[4];
    v58 = v52[6];
    v43 = v52[8];
    v59 = v52[7];
    v60 = v43;
    objc_msgSend(v42, "performBlock:", v56);

    objc_destroyWeak(&v61);
  }

}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_169(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", *(_QWORD *)(a1 + 32));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "mainQueueContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshObject:mergeChanges:", v9, 1);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "mainQueueContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "refreshObject:mergeChanges:", *(_QWORD *)(a1 + 40), 1);

  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "mainQueueContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_170;
    v10[3] = &unk_24E156FA8;
    v12 = *(id *)(a1 + 56);
    v11 = v9;
    objc_msgSend(v8, "performBlockAndWait:", v10);

  }
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_170(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_171(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_173(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(a2, "formResponseContentItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_4;
  v5[3] = &unk_24E159648;
  v6 = *(id *)(a1 + 32);
  objc_msgSend(v3, "ded_findWithBlock:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  return v5;
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  if (v3)
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_cold_1();

    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_175;
      v6[3] = &unk_24E156FA8;
      v8 = *(id *)(a1 + 48);
      v7 = v3;
      objc_msgSend(v5, "performBlockAndWait:", v6);

    }
  }

}

uint64_t __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_175(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)deleteDraftFromContentItem:(id)a3 shouldSave:(BOOL)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  FBKData *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  BOOL v32;
  _QWORD aBlock[4];
  id v34;
  id v35;
  uint8_t buf[16];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "ID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke;
  aBlock[3] = &unk_24E157380;
  v12 = v10;
  v34 = v12;
  v13 = v9;
  v35 = v13;
  v14 = _Block_copy(aBlock);
  objc_msgSend(v8, "ID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[FBKLog clientHandle](FBKLog, "clientHandle");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "ID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "intValue");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v18;
    _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_DEFAULT, "deleting form response %d", buf, 8u);

  }
  objc_initWeak((id *)buf, self);
  -[FBKData api](self, "api");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v27[1] = 3221225472;
  v27[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_176;
  v27[3] = &unk_24E159E00;
  v20 = v8;
  v28 = v20;
  v29 = v15;
  v32 = a4;
  objc_copyWeak(&v31, (id *)buf);
  v30 = v14;
  v23[0] = v11;
  v23[1] = 3221225472;
  v23[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_178;
  v23[3] = &unk_24E157070;
  v21 = v29;
  v24 = v21;
  v22 = v30;
  v25 = self;
  v26 = v22;
  objc_msgSend(v19, "deleteFormResponseWithID:success:error:", v21, v27, v23);

  objc_destroyWeak(&v31);
  objc_destroyWeak((id *)buf);

}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!v3 && +[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA"))
    +[FBKSharedConstants deleteAttachmentLegalTextForDraftID:](FBKSharedConstants, "deleteAttachmentLegalTextForDraftID:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_176(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  char v9;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_2;
  v4[3] = &unk_24E159E00;
  v3 = v2;
  v5 = v3;
  v6 = *(id *)(a1 + 40);
  v9 = *(_BYTE *)(a1 + 64);
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "performBlock:", v4);

  objc_destroyWeak(&v8);
}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  id v14;
  NSObject *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint8_t buf[4];
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  +[FBKFormResponseStub entityName](FBKFormResponseStub, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(a1 + 40);
  objc_msgSend(v2, "findFeedbackObjectWithEntityName:remoteID:", v3, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    Log_5();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(*v4, "intValue");
      *(_DWORD *)buf = 67109120;
      v24 = v7;
      _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_INFO, "Deleting response stub [%i]", buf, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "deleteObject:", v5);
  }
  v8 = *(void **)(a1 + 32);
  +[FBKFormResponse entityName](FBKFormResponse, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "findFeedbackObjectWithEntityName:remoteID:", v9, *(_QWORD *)(a1 + 40));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    Log_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = objc_msgSend(*v4, "intValue");
      *(_DWORD *)buf = 67109120;
      v24 = v12;
      _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_INFO, "Deleting response [%i]", buf, 8u);
    }

    objc_msgSend(*(id *)(a1 + 32), "deleteObject:", v10);
  }
  if (*(_BYTE *)(a1 + 64))
  {
    v13 = *(void **)(a1 + 32);
    v22 = 0;
    objc_msgSend(v13, "save:", &v22);
    v14 = v22;
    if (v14)
    {
      Log_5();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_2_cold_1();

    }
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(WeakRetained, "currentUser");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = *(void **)(a1 + 32);
      v19 = objc_loadWeakRetained((id *)(a1 + 56));
      objc_msgSend(v19, "currentUser");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "refreshObject:mergeChanges:", v20, 1);

    }
  }
  else
  {
    v14 = 0;
  }
  v21 = *(_QWORD *)(a1 + 48);
  if (v21)
    (*(void (**)(uint64_t, id))(v21 + 16))(v21, v14);

}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_178(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_178_cold_1(a1);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_179;
    v6[3] = &unk_24E156FA8;
    v8 = *(id *)(a1 + 48);
    v7 = v3;
    objc_msgSend(v5, "performBlockAndWait:", v6);

  }
}

uint64_t __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_179(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)deleteDraftFromContentItem:(id)a3 completion:(id)a4
{
  -[FBKData deleteDraftFromContentItem:shouldSave:completion:](self, "deleteDraftFromContentItem:shouldSave:completion:", a3, 1, a4);
}

- (void)deleteDraftsFromContentItems:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  FBKData *v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  id v26;
  id v27;
  id v28;
  NSObject *v29;
  id obj;
  _QWORD block[5];
  id v32;
  id v33;
  id v34;
  _QWORD v35[5];
  id v36;
  id v37;
  NSObject *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  int v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v28 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v9 = dispatch_group_create();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  v11 = MEMORY[0x24BDAC760];
  if (v10)
  {
    v12 = v10;
    v13 = *(_QWORD *)v40;
    v29 = v9;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        Log_5();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "ID");
          v17 = v12;
          v18 = v13;
          v19 = v8;
          v20 = v7;
          v21 = self;
          v22 = v11;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "intValue");
          *(_DWORD *)buf = 67109120;
          v44 = v24;
          _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_DEFAULT, "deleting draft [%d]", buf, 8u);

          v11 = v22;
          self = v21;
          v7 = v20;
          v8 = v19;
          v13 = v18;
          v12 = v17;
          v9 = v29;
        }

        dispatch_group_enter(v9);
        v35[0] = v11;
        v35[1] = 3221225472;
        v35[2] = __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke;
        v35[3] = &unk_24E159E28;
        v35[4] = v15;
        v36 = v7;
        v37 = v8;
        v38 = v9;
        -[FBKData deleteDraftFromContentItem:shouldSave:completion:](self, "deleteDraftFromContentItem:shouldSave:completion:", v15, 0, v35);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v12);
  }

  block[0] = v11;
  block[1] = 3221225472;
  block[2] = __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_180;
  block[3] = &unk_24E159E50;
  block[4] = self;
  v32 = v7;
  v33 = v8;
  v34 = v28;
  v25 = v8;
  v26 = v28;
  v27 = v7;
  dispatch_group_notify(v9, MEMORY[0x24BDAC9B8], block);

}

void __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    objc_msgSend(*(id *)(a1 + 48), "addObject:", *(_QWORD *)(a1 + 32));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));

}

void __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_180(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "save:", &v11);
  v3 = v11;

  if (v3)
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_180_cold_1();

  }
  objc_msgSend(*(id *)(a1 + 32), "currentUser");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "refreshObject:mergeChanges:", v7, 1);

  }
  v8 = objc_msgSend(*(id *)(a1 + 40), "count");
  v9 = *(_QWORD *)(a1 + 56);
  if (v8)
  {
    if (v9)
    {
      FBKAggregatedErrorOfType(-1007, *(void **)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, *(_QWORD *)(a1 + 48));

    }
  }
  else if (v9)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v9 + 16))(*(_QWORD *)(a1 + 56), 0, 0);
  }

}

- (void)saveFormResponse:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  int v38;
  void *v40;
  _QWORD v41[5];
  id v42;
  int v43;
  _QWORD v44[5];
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  const __CFString *v51;
  void *v52;
  _QWORD v53[2];
  _QWORD v54[2];
  uint8_t v55[128];
  uint8_t buf[4];
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v37 = a4;
  objc_msgSend(v5, "ID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue");

  +[FBKLog clientHandle](FBKLog, "clientHandle");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v57 = v7;
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_INFO, "saving form response %d", buf, 8u);
  }
  v38 = v7;

  objc_msgSend(v5, "updateExtractedValuesFromAnswers");
  v9 = (void *)MEMORY[0x24BDBCEB8];
  objc_msgSend(v5, "answers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v40 = v5;
  objc_msgSend(v5, "answers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v48;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v48 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v17, "values");
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v17, "values");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
          {

          }
          else
          {
            v21 = objc_msgSend(v17, "isOptedOut");

            if ((v21 & 1) == 0)
              continue;
          }
        }
        else if (!objc_msgSend(v17, "isOptedOut"))
        {
          continue;
        }
        objc_msgSend(v17, "question");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "answerType");

        v24 = (void *)MEMORY[0x24BDBD1A8];
        if (v23 != 5)
        {
          objc_msgSend(v17, "values");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v53[0] = CFSTR("question_id");
        objc_msgSend(v17, "questionID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v53[1] = CFSTR("values");
        v54[0] = v25;
        v54[1] = v24;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)objc_msgSend(v26, "mutableCopy");

        objc_msgSend(v17, "ID");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = objc_msgSend(v28, "integerValue");

        if ((v29 & 0x8000000000000000) == 0)
        {
          objc_msgSend(v17, "ID");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setObject:forKey:", v30, CFSTR("id"));

        }
        if (objc_msgSend(v17, "isOptedOut"))
          objc_msgSend(v27, "setObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("ignore_required"));
        objc_msgSend(v11, "addObject:", v27);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
    }
    while (v14);
  }

  v51 = CFSTR("answers");
  v52 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData api](self, "api");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "ID");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = MEMORY[0x24BDAC760];
  v44[0] = MEMORY[0x24BDAC760];
  v44[1] = 3221225472;
  v44[2] = __39__FBKData_saveFormResponse_completion___block_invoke;
  v44[3] = &unk_24E157138;
  v44[4] = self;
  v45 = v40;
  v46 = v37;
  v41[0] = v34;
  v41[1] = 3221225472;
  v41[2] = __39__FBKData_saveFormResponse_completion___block_invoke_2_192;
  v41[3] = &unk_24E159EA0;
  v43 = v38;
  v41[4] = self;
  v42 = v46;
  v35 = v46;
  v36 = v40;
  objc_msgSend(v32, "saveAnswersForFormResponseWithID:answers:success:error:", v33, v31, v44, v41);

}

void __39__FBKData_saveFormResponse_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "currentUser");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__FBKData_saveFormResponse_completion___block_invoke_2;
  v5[3] = &unk_24E159960;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v3, v5);

}

void __39__FBKData_saveFormResponse_completion___block_invoke_2(id *a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v3 = a2;
  objc_msgSend(a1[4], "privateQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "refreshObject:mergeChanges:", v3, 1);

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  v5 = objc_msgSend(a1[5], "hasChanges");
  v6 = MEMORY[0x24BDAC760];
  if (v5)
  {
    objc_msgSend(a1[5], "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v6;
    v12[1] = 3221225472;
    v12[2] = __39__FBKData_saveFormResponse_completion___block_invoke_3;
    v12[3] = &unk_24E159E78;
    v13 = a1[5];
    v14 = &v15;
    objc_msgSend(v7, "performBlockAndWait:", v12);

  }
  if (v16[5])
  {
    Log_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __39__FBKData_saveFormResponse_completion___block_invoke_2_cold_1();
  }
  else
  {
    objc_msgSend(a1[4], "notificationCenter");
    v8 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v8, "postNotificationName:object:", CFSTR("FBKLocalDataDidChangeNotification"), a1[4]);
  }

  if (a1[6])
  {
    objc_msgSend(a1[4], "mainQueueContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __39__FBKData_saveFormResponse_completion___block_invoke_191;
    v10[3] = &unk_24E156F80;
    v11 = a1[6];
    objc_msgSend(v9, "performBlockAndWait:", v10);

  }
  _Block_object_dispose(&v15, 8);

}

void __39__FBKData_saveFormResponse_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "save:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);

}

uint64_t __39__FBKData_saveFormResponse_completion___block_invoke_191(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __39__FBKData_saveFormResponse_completion___block_invoke_2_192(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __39__FBKData_saveFormResponse_completion___block_invoke_2_192_cold_1();

  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __39__FBKData_saveFormResponse_completion___block_invoke_193;
    v6[3] = &unk_24E156FA8;
    v8 = *(id *)(a1 + 40);
    v7 = v3;
    objc_msgSend(v5, "performBlockAndWait:", v6);

  }
}

uint64_t __39__FBKData_saveFormResponse_completion___block_invoke_193(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)formResponseStubForID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  FBKData *v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FBKData api](self, "api");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __44__FBKData_formResponseStubForID_completion___block_invoke;
  v11[3] = &unk_24E159EC8;
  v9 = v6;
  v12 = v9;
  v10 = v7;
  v14 = v10;
  objc_copyWeak(&v15, &location);
  v13 = self;
  objc_msgSend(v8, "getFormResponseStubWithID:withCompletion:", v9, v11);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

}

void __44__FBKData_formResponseStubForID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  id v18;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__FBKData_formResponseStubForID_completion___block_invoke_2;
    block[3] = &unk_24E157358;
    v16 = a1[4];
    v18 = a1[6];
    v17 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else if (a1[6])
  {
    WeakRetained = objc_loadWeakRetained(a1 + 7);
    objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a1[6])
    {
      objc_msgSend(a1[5], "mainQueueContext");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __44__FBKData_formResponseStubForID_completion___block_invoke_194;
      v11[3] = &unk_24E157200;
      v14 = a1[6];
      v12 = v9;
      v13 = 0;
      objc_msgSend(v10, "performBlockAndWait:", v11);

    }
  }

}

uint64_t __44__FBKData_formResponseStubForID_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __44__FBKData_formResponseStubForID_completion___block_invoke_2_cold_1(a1);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __44__FBKData_formResponseStubForID_completion___block_invoke_194(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)refreshFormResponseStubFromContentItem:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  const char *v16;
  void (**v17)(id, _QWORD, void *);
  id v18;
  void *v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  _QWORD v24[4];
  void (**v25)(id, _QWORD, void *);
  id v26;
  _QWORD aBlock[4];
  id v28;
  id v29;
  id v30;
  id buf[2];
  uint8_t v32[4];
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (objc_msgSend(v6, "isDeleted"))
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBKData refreshFormResponseStubFromContentItem:completion:].cold.1(v6);

    FBKErrorOfType(-1016);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v9);
    goto LABEL_23;
  }
  objc_msgSend(v6, "formResponseStub");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  if (!v10)
  {
    Log_5();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      goto LABEL_16;
    LOWORD(buf[0]) = 0;
    v16 = "No FormResponseStub for ContentItem, fetching.";
    goto LABEL_15;
  }
  objc_msgSend(v10, "updatedAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedAt");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  Log_5();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13 == 1)
  {
    if (v15)
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_INFO, "Content item not updated since last refresh, using existing Core Data object.", (uint8_t *)buf, 2u);
    }

    if (v7)
      ((void (**)(id, void *, void *))v7)[2](v7, v9, 0);
    goto LABEL_23;
  }
  if (v15)
  {
    LOWORD(buf[0]) = 0;
    v16 = "Content item indicates Core Data object is out of date, refreshing FormResponseStub.";
LABEL_15:
    _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_INFO, v16, (uint8_t *)buf, 2u);
  }
LABEL_16:

  objc_initWeak(buf, self);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke;
  aBlock[3] = &unk_24E159F40;
  objc_copyWeak(&v30, buf);
  v17 = v7;
  v29 = v17;
  v18 = v6;
  v28 = v18;
  v19 = _Block_copy(aBlock);
  if (objc_msgSend(v18, "itemType") == 4 || objc_msgSend(v18, "itemType") == 5)
  {
    Log_5();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v18, "ID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");
      *(_DWORD *)v32 = 67109120;
      v33 = v22;
      _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_INFO, "Item is Feedback, need to fetch feedback details for feedback [%i]", v32, 8u);

    }
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_197;
    v24[3] = &unk_24E159F68;
    v25 = v17;
    v26 = v19;
    -[FBKData getFeedbackForContentItem:completion:](self, "getFeedbackForContentItem:completion:", v18, v24);

    v23 = v25;
  }
  else
  {
    objc_msgSend(v18, "ID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v19 + 2))(v19, v23);
  }

  objc_destroyWeak(&v30);
  objc_destroyWeak(buf);
LABEL_23:

}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "api");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_2;
  v7[3] = &unk_24E159F18;
  objc_copyWeak(&v11, a1 + 6);
  v6 = v3;
  v8 = v6;
  v10 = a1[5];
  v9 = a1[4];
  objc_msgSend(v5, "getFormResponseStubWithID:withCompletion:", v6, v7);

  objc_destroyWeak(&v11);
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained(a1 + 7);
  objc_msgSend(WeakRetained, "mainQueueContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3;
  v11[3] = &unk_24E159EF0;
  v9 = v6;
  v12 = v9;
  v10 = v5;
  v13 = v10;
  v14 = a1[4];
  v16 = a1[6];
  objc_copyWeak(&v17, a1 + 7);
  v15 = a1[5];
  objc_msgSend(v8, "performBlock:", v11);

  objc_destroyWeak(&v17);
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  id WeakRetained;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 32);
  if (v2 || !*(_QWORD *)(a1 + 40))
  {
    if ((objc_msgSend(v2, "isFBKErrorWithCode:", -1010) & 1) == 0)
    {
      Log_5();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_1(a1);

    }
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, *(_QWORD *)(a1 + 32));
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 56), "setFormResponseStub:", v6);
    v7 = objc_loadWeakRetained((id *)(a1 + 72));
    objc_msgSend(v7, "mainQueueContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    objc_msgSend(v8, "save:", &v18);
    v9 = v18;

    objc_msgSend(v6, "contentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      +[FBKLog appHandle](FBKLog, "appHandle");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_3();

    }
    objc_msgSend(*(id *)(a1 + 56), "formResponseStub");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      +[FBKLog appHandle](FBKLog, "appHandle");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_2();

    }
    Log_5();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 56), "ID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "intValue");
      *(_DWORD *)buf = 67109120;
      v20 = v16;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_INFO, "Fetched form response stub for ID [%d]", buf, 8u);

    }
    v17 = *(_QWORD *)(a1 + 64);
    if (v17)
      (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v6, 0);

  }
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_197(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v11 = v6;
    if (v7)
    {
      v10 = v11;
      Log_5();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_197_cold_2();

      goto LABEL_12;
    }
  }
  else
  {
    objc_msgSend(v5, "formResponseID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v5, "formResponseID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
      goto LABEL_14;
    }
  }
  Log_5();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_197_cold_1();

  FBKErrorOfType(-8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:
  v14 = *(_QWORD *)(a1 + 32);
  if (v14)
    (*(void (**)(uint64_t, _QWORD, void *))(v14 + 16))(v14, 0, v10);
LABEL_14:

}

- (void)bugFormFromForDraftItem:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "formID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "singleTeam");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__FBKData_bugFormFromForDraftItem_withCompletion___block_invoke;
  v12[3] = &unk_24E159F90;
  v13 = v6;
  v14 = v7;
  v10 = v6;
  v11 = v7;
  -[FBKData refreshBugFormWithID:fromStub:forTeam:completion:](self, "refreshBugFormWithID:fromStub:forTeam:completion:", v8, 0, v9, v12);

}

void __50__FBKData_bugFormFromForDraftItem_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void (*v6)(void);
  NSObject *v7;

  v5 = a3;
  if (a2)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    Log_5();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50__FBKData_bugFormFromForDraftItem_withCompletion___block_invoke_cold_1((id *)a1, v7);

    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v6();

}

- (void)fetchFeedbackStatusForFeedback:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id location;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_initWeak(&location, self);
    -[FBKData api](self, "api");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke;
    v12[3] = &unk_24E159FB8;
    v13 = v6;
    v14 = v7;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v8, "getFeedbackStatusForFeedbackID:completion:", v9, v12);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FBKData fetchFeedbackStatusForFeedback:completion:].cold.1();

    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE312E8], -1001, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v11);

  }
}

void __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_2;
    block[3] = &unk_24E157138;
    v15 = a1[4];
    v16 = v6;
    v17 = a1[5];
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "mainQueueContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_200;
    v9[3] = &unk_24E1573D0;
    objc_copyWeak(&v13, a1 + 6);
    v10 = v5;
    v11 = a1[4];
    v12 = a1[5];
    objc_msgSend(v8, "performBlock:", v9);

    objc_destroyWeak(&v13);
  }

}

uint64_t __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_2_cold_1(a1);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
}

void __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_200(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", *(_QWORD *)(a1 + 32));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setStatus:", v4);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
    (*(void (**)(uint64_t, id, _QWORD))(v3 + 16))(v3, v4, 0);

}

- (void)refreshSurveyFromContentItem:(id)a3 forTeam:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  FBKData *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id buf[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "detailedItem");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_INFO, "no form (Survey) for item, Will fetch", (uint8_t *)buf, 2u);
    }
    goto LABEL_8;
  }
  v12 = v11;
  objc_msgSend(v8, "updatedAt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject updatedAt](v12, "updatedAt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "compare:", v14);

  if (v15 == 1)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v16, OS_LOG_TYPE_INFO, "form (Survey) is stale, will refresh", (uint8_t *)buf, 2u);
    }

LABEL_8:
    objc_msgSend(v8, "ID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(buf, self);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke;
    v19[3] = &unk_24E15A030;
    v18 = v17;
    v20 = v18;
    v24 = v10;
    v21 = self;
    objc_copyWeak(&v25, buf);
    v22 = v8;
    v23 = v9;
    -[FBKData refreshBugFormWithID:fromStub:forTeam:completion:](self, "refreshBugFormWithID:fromStub:forTeam:completion:", v18, 0, v23, v19);

    objc_destroyWeak(&v25);
    objc_destroyWeak(buf);

    v12 = 0;
    goto LABEL_11;
  }
  if (v10)
    (*((void (**)(id, NSObject *, _QWORD))v10 + 2))(v10, v12, 0);
LABEL_11:

}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id *v10;
  id *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && !v6)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 9);
    objc_msgSend(WeakRetained, "mainQueueContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_2;
    v14[3] = &unk_24E15A008;
    v15 = v5;
    v16 = a1[6];
    v17 = a1[7];
    objc_copyWeak(&v20, a1 + 9);
    v18 = a1[5];
    v19 = a1[8];
    objc_msgSend(v9, "performBlock:", v14);
    v10 = &v15;
    v11 = &v16;

    objc_destroyWeak(&v20);
    v12 = v17;
LABEL_8:

    goto LABEL_9;
  }
  Log_5();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_cold_1();

  if (a1[8])
  {
    objc_msgSend(a1[5], "mainQueueContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_202;
    v21[3] = &unk_24E156FA8;
    v10 = &v23;
    v23 = a1[8];
    v11 = &v22;
    v22 = v7;
    objc_msgSend(v12, "performBlockAndWait:", v21);
    goto LABEL_8;
  }
LABEL_9:

}

uint64_t __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_202(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  id v20;
  id *location;
  id *block;
  void (**blocka)(_QWORD);
  void *v24;
  id obj;
  _QWORD v26[5];
  NSObject *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD aBlock[5];
  id v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setSurveyContentItem:", *(_QWORD *)(a1 + 40));
  block = (id *)a1;
  objc_msgSend(*(id *)(a1 + 32), "completedResponsesContentItemsForTeam:", *(_QWORD *)(a1 + 48));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEF0]), "initWithCapacity:", objc_msgSend(v2, "count"));
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v37 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        WeakRetained = objc_loadWeakRetained(block + 9);
        objc_msgSend(WeakRetained, "mainQueueContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        +[FBKFeedback entityName](FBKFeedback, "entityName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "ID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "findFeedbackObjectWithEntityName:remoteID:", v9, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
          objc_msgSend(v24, "addObject:", v6);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
    }
    while (v3);
  }

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_3;
  aBlock[3] = &unk_24E159CE8;
  v12 = block + 9;
  location = &v35;
  objc_copyWeak(&v35, block + 9);
  v13 = block[8];
  aBlock[4] = block[7];
  v34 = v13;
  v33 = block[4];
  blocka = (void (**)(_QWORD))_Block_copy(aBlock);
  if (objc_msgSend(v24, "count"))
  {
    v14 = dispatch_group_create();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v15 = v24;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16, &v35);
    if (v16)
    {
      v17 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v29 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          dispatch_group_enter(v14);
          v20 = objc_loadWeakRetained(v12);
          v26[0] = MEMORY[0x24BDAC760];
          v26[1] = 3221225472;
          v26[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_5;
          v26[3] = &unk_24E159FE0;
          v26[4] = v19;
          v27 = v14;
          objc_msgSend(v20, "getFeedbackForContentItem:completion:", v19, v26);

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v16);
    }

    dispatch_group_notify(v14, MEMORY[0x24BDAC9B8], blocka);
  }
  else
  {
    blocka[2](blocka);
  }

  objc_destroyWeak(location);
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "mainQueueContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_4;
  v4[3] = &unk_24E157358;
  v4[4] = *(_QWORD *)(a1 + 32);
  v6 = *(id *)(a1 + 48);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v3, "performBlock:", v4);

}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_4(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void (*v5)(void);
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "save:", &v6);
  v3 = v6;

  v4 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v5 = *(void (**)(void))(v4 + 16);
LABEL_5:
    v5();
    goto LABEL_6;
  }
  if (v4)
  {
    v5 = *(void (**)(void))(v4 + 16);
    goto LABEL_5;
  }
LABEL_6:

}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[FBKLog appHandle](FBKLog, "appHandle");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_5_cold_1();
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "ID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = 67109120;
    v8[1] = objc_msgSend(v7, "intValue");
    _os_log_impl(&dword_21D9A9000, v6, OS_LOG_TYPE_INFO, "refreshed survey Feedback [%i]", (uint8_t *)v8, 8u);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));

}

- (void)getFeedbackForContentItem:(id)a3 completion:(id)a4
{
  -[FBKData getFeedbackForContentItem:forceRefresh:completion:](self, "getFeedbackForContentItem:forceRefresh:completion:", a3, 0, a4);
}

- (void)getFeedbackForContentItem:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  if (v6)
  {
    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "ID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v11;
      _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "Content item for feedback [%{public}@] is forced fetching.", buf, 0xCu);

    }
LABEL_14:

    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __61__FBKData_getFeedbackForContentItem_forceRefresh_completion___block_invoke;
    v22[3] = &unk_24E15A080;
    objc_copyWeak(&v24, &location);
    v23 = v9;
    -[FBKData takeMainQueueObject:andContinueWithPrivateQueueObject:](self, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v8, v22);

    objc_destroyWeak(&v24);
    goto LABEL_15;
  }
  objc_msgSend(v8, "feedback");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    Log_5();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "ID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v20;
      _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "Content item has no feedback object for ID [%{public}@], fetching.", buf, 0xCu);

    }
    goto LABEL_14;
  }
  objc_msgSend(v8, "feedback");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "updatedAt");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "updatedAt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "compare:", v15) == 1;

  Log_5();
  v10 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!v16)
  {
    if (v17)
    {
      objc_msgSend(v8, "ID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v21;
      _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "Content item for feedback ID [%{public}@] is out of date, fetching.", buf, 0xCu);

    }
    goto LABEL_14;
  }
  if (v17)
  {
    objc_msgSend(v8, "ID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v18;
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_INFO, "Content item for feedback ID [%{public}@] has not changed, returning Core Data object.", buf, 0xCu);

  }
  if (v9)
  {
    objc_msgSend(v8, "feedback");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *, _QWORD))v9 + 2))(v9, v19, 0);

  }
LABEL_15:
  objc_destroyWeak(&location);

}

void __61__FBKData_getFeedbackForContentItem_forceRefresh_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  void *v9;
  void *v10;
  _QWORD aBlock[4];
  id v12;
  id v13;
  id v14;

  v3 = a2;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__FBKData_getFeedbackForContentItem_forceRefresh_completion___block_invoke_2;
  aBlock[3] = &unk_24E15A058;
  v4 = (id *)(a1 + 40);
  objc_copyWeak(&v14, (id *)(a1 + 40));
  v5 = v3;
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v6 = _Block_copy(aBlock);
  v7 = objc_msgSend(v5, "itemType");
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "api");
  if (v7 == 5)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "feedbackForSurveyFeedbackID:completion:", v10, v6);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "ID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "feedbackForFeedbackID:completion:", v10, v6);
  }

  objc_destroyWeak(&v14);
}

void __61__FBKData_getFeedbackForContentItem_forceRefresh_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 48);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_didGetFeedback:error:withContentItem:completion:", v7, v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)getFeedbackForFeedbackID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FBKData api](self, "api");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__FBKData_getFeedbackForFeedbackID_completion___block_invoke;
  v10[3] = &unk_24E15A0A8;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "feedbackForFeedbackID:completion:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __47__FBKData_getFeedbackForFeedbackID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_didGetFeedback:error:withContentItem:completion:", v7, v6, 0, *(_QWORD *)(a1 + 32));

}

- (void)getFeedbackForFormResponseID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FBKData api](self, "api");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __51__FBKData_getFeedbackForFormResponseID_completion___block_invoke;
  v10[3] = &unk_24E15A0A8;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "feedbackForFormResponseID:completion:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __51__FBKData_getFeedbackForFormResponseID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_didGetFeedback:error:withContentItem:completion:", v7, v6, 0, *(_QWORD *)(a1 + 32));

}

- (void)getFeedbackForFollowupID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FBKData api](self, "api");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__FBKData_getFeedbackForFollowupID_completion___block_invoke;
  v10[3] = &unk_24E15A0A8;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  objc_msgSend(v8, "feedbackForFollowupID:completion:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __47__FBKData_getFeedbackForFollowupID_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;

  v5 = (id *)(a1 + 40);
  v6 = a3;
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_didGetFeedback:error:withContentItem:completion:", v7, v6, 0, *(_QWORD *)(a1 + 32));

}

- (void)_didGetFeedback:(id)a3 error:(id)a4 withContentItem:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  FBKData *v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[FBKData currentUser](self, "currentUser");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke;
  v19[3] = &unk_24E15A0D0;
  v23 = v10;
  v24 = v13;
  v20 = v11;
  v21 = self;
  v22 = v12;
  v15 = v10;
  v16 = v12;
  v17 = v13;
  v18 = v11;
  -[FBKData takeMainQueueObject:andContinueWithPrivateQueueObject:](self, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v14, v19);

}

void __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v3 = a2;
  v4 = v3;
  if (!*(_QWORD *)(a1 + 32))
  {
    v6 = *(void **)(a1 + 48);
    if (v6)
    {
      v7 = v6;
    }
    else
    {
      objc_msgSend(v3, "feedbackContentItems");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_3;
      v20[3] = &unk_24E159648;
      v21 = *(id *)(a1 + 56);
      objc_msgSend(v8, "ded_findWithBlock:", v20);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
        Log_5();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_cold_1((id *)(a1 + 56));
        v7 = 0;
        goto LABEL_14;
      }
    }
    objc_msgSend(*(id *)(a1 + 56), "setContentItem:", v7);
    objc_msgSend(*(id *)(a1 + 56), "managedObjectContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v9, "save:", &v19);
    v10 = v19;

    if (v10)
    {
      Log_5();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_cold_2();

    }
LABEL_14:

    objc_msgSend(*(id *)(a1 + 40), "mainQueueObjectFromPrivate:", *(_QWORD *)(a1 + 56));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "managedObjectContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_205;
    v15[3] = &unk_24E157200;
    v18 = *(id *)(a1 + 64);
    v16 = v12;
    v17 = *(id *)(a1 + 32);
    v14 = v12;
    objc_msgSend(v13, "performBlock:", v15);

    goto LABEL_15;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_2;
    v22[3] = &unk_24E156FA8;
    v24 = *(id *)(a1 + 64);
    v23 = *(id *)(a1 + 32);
    objc_msgSend(v5, "performBlockAndWait:", v22);

  }
LABEL_15:

}

uint64_t __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "ID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToNumber:", v4);

  return v5;
}

uint64_t __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_205(_QWORD *a1)
{
  uint64_t result;

  result = a1[6];
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, a1[4], a1[5]);
  return result;
}

- (void)getFormResponseStubForFeedback:(id)a3 completion:(id)a4
{
  -[FBKData getFormResponseStubForFeedback:forceRefresh:completion:](self, "getFormResponseStubForFeedback:forceRefresh:completion:", a3, 0, a4);
}

- (void)getFormResponseStubForFeedback:(id)a3 forceRefresh:(BOOL)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  void (**v25)(id, void *, _QWORD);
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (a4)
    goto LABEL_7;
  objc_msgSend(v8, "formResponseStub");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
    goto LABEL_7;
  v11 = (void *)v10;
  objc_msgSend(v8, "formResponseStub");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "updatedAt");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "updatedAt");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v13, "compare:", v15);

  if (v16 == 1)
  {
    Log_5();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "ID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v27 = objc_msgSend(v18, "longValue");
      _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_INFO, "Using cached content item for feedback [%ld]", buf, 0xCu);

    }
    objc_msgSend(v8, "formResponseStub");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v19, 0);
  }
  else
  {
LABEL_7:
    Log_5();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "ID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134217984;
      v27 = objc_msgSend(v21, "longValue");
      _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_INFO, "Feedback [%ld] has stale or nil Response Stub, refreshing from server.", buf, 0xCu);

    }
    objc_msgSend(v8, "formResponseID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __66__FBKData_getFormResponseStubForFeedback_forceRefresh_completion___block_invoke;
    v23[3] = &unk_24E15A0F8;
    v25 = v9;
    v24 = v8;
    -[FBKData formResponseStubForID:completion:](self, "formResponseStubForID:completion:", v22, v23);

    v19 = v25;
  }

}

void __66__FBKData_getFormResponseStubForFeedback_forceRefresh_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;
  void (*v15)(void);
  NSObject *v16;
  id v17;

  v5 = a2;
  v6 = a3;
  if (v5 || (v14 = *(_QWORD *)(a1 + 40)) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "contentItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setFormResponseStub:", v5);

    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "contentItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "refreshObject:mergeChanges:", v9, 1);

    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v10, "save:", &v17);
    v11 = v17;

    v12 = *(_QWORD *)(a1 + 40);
    if (v11)
    {
      if (v12)
      {
        v13 = *(void (**)(void))(v12 + 16);
LABEL_10:
        v13();
      }
    }
    else if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
      goto LABEL_10;
    }

    goto LABEL_16;
  }
  if (v6)
  {
    v15 = *(void (**)(void))(v14 + 16);
  }
  else
  {
    Log_5();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __66__FBKData_getFormResponseStubForFeedback_forceRefresh_completion___block_invoke_cold_1();

    v15 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v15();
LABEL_16:

}

- (void)getAllContentForFeedback:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  NSObject *v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  unint64_t i;
  void *v28;
  BOOL v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  id v37;
  id v38;
  id v39;
  NSObject *group;
  void *v42;
  _QWORD block[4];
  id v44;
  id v45;
  _QWORD *v46;
  _QWORD v47[4];
  NSObject *v48;
  _QWORD *v49;
  _QWORD v50[4];
  NSObject *v51;
  _QWORD *v52;
  _QWORD v53[5];
  id v54;
  uint8_t buf[4];
  int v56;
  __int16 v57;
  int v58;
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v39 = a4;
  v6 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v5, "feedbackFollowups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("remoteID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v8);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__3;
  v53[4] = __Block_byref_object_dispose__3;
  v54 = 0;
  group = dispatch_group_create();
  objc_msgSend(v5, "contentItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "formResponseStub");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v5, "contentItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "formResponseStub");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updatedAt");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentItem");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updatedAt");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "compare:", v15) == -1;

    if (!v16)
    {
      Log_5();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "formResponseID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "intValue");
        objc_msgSend(v5, "ID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "intValue");
        *(_DWORD *)buf = 67109376;
        v56 = v19;
        v57 = 1024;
        v58 = v21;
        _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_INFO, "Using cached Response Stub with ID [%i] for feedback [%i]", buf, 0xEu);

      }
      goto LABEL_9;
    }
  }
  else
  {

  }
  Log_5();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "formResponseID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "intValue");
    objc_msgSend(v5, "ID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "intValue");
    *(_DWORD *)buf = 67109376;
    v56 = v24;
    v57 = 1024;
    v58 = v26;
    _os_log_impl(&dword_21D9A9000, v22, OS_LOG_TYPE_DEFAULT, "Will fetch Response Stub with ID [%i] for feedback [%i]", buf, 0xEu);

  }
  dispatch_group_enter(group);
  v50[0] = MEMORY[0x24BDAC760];
  v50[1] = 3221225472;
  v50[2] = __47__FBKData_getAllContentForFeedback_completion___block_invoke;
  v50[3] = &unk_24E15A120;
  v52 = v53;
  v51 = group;
  -[FBKData getFormResponseStubForFeedback:completion:](self, "getFormResponseStubForFeedback:completion:", v5, v50);
  v17 = v51;
LABEL_9:

  for (i = 0; ; ++i)
  {
    objc_msgSend(v5, "feedbackFollowupIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "count") > i;

    if (!v29)
      break;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", i);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v42, "containsObject:", v30) & 1) == 0)
    {
      Log_5();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v5, "feedbackFollowupIDs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndexedSubscript:", i);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "intValue");
        objc_msgSend(v5, "ID");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "intValue");
        *(_DWORD *)buf = 67109376;
        v56 = v34;
        v57 = 1024;
        v58 = v36;
        _os_log_impl(&dword_21D9A9000, v31, OS_LOG_TYPE_DEFAULT, "Will fetch FFU with ID [%i] for feedback [%i]", buf, 0xEu);

      }
      dispatch_group_enter(group);
      v47[0] = MEMORY[0x24BDAC760];
      v47[1] = 3221225472;
      v47[2] = __47__FBKData_getAllContentForFeedback_completion___block_invoke_207;
      v47[3] = &unk_24E15A148;
      v49 = v53;
      v48 = group;
      -[FBKData getFeedbackFollowupForFeedback:atIndex:completion:](self, "getFeedbackFollowupForFeedback:atIndex:completion:", v5, i, v47);

    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__FBKData_getAllContentForFeedback_completion___block_invoke_2;
  block[3] = &unk_24E15A170;
  v44 = v5;
  v45 = v39;
  v46 = v53;
  v37 = v39;
  v38 = v5;
  dispatch_group_notify(group, MEMORY[0x24BDAC9B8], block);

  _Block_object_dispose(v53, 8);
}

void __47__FBKData_getAllContentForFeedback_completion___block_invoke(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __47__FBKData_getAllContentForFeedback_completion___block_invoke_207(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

uint64_t __47__FBKData_getAllContentForFeedback_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refreshAllObjects");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return result;
}

- (void)getFeedbackFollowupForFeedback:(id)a3 atIndex:(unint64_t)a4 completion:(id)a5
{
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  char v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  unint64_t v47;
  _QWORD v48[4];
  id v49;
  uint8_t buf[4];
  unint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v43 = a5;
  +[FBKLog ffu](FBKLog, "ffu");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "ID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v51 = a4;
    v52 = 2048;
    v53 = objc_msgSend(v9, "unsignedIntegerValue");
    _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_INFO, "Getting FFU at index [%lu] for FB [%lu]", buf, 0x16u);

  }
  objc_msgSend(v7, "feedbackFollowups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  v12 = MEMORY[0x24BDAC760];
  if (v11 <= a4)
  {
    v16 = 0;
LABEL_22:
    objc_msgSend(v7, "feedbackFollowupIDs", self);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectAtIndexedSubscript:", a4);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v12;
    v44[1] = 3221225472;
    v44[2] = __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke_210;
    v44[3] = &unk_24E15A1C0;
    v46 = v43;
    v45 = v7;
    v47 = a4;
    objc_msgSend(v42, "feedbackFollowupForID:completion:", v40, v44);

    v14 = v46;
    goto LABEL_23;
  }
  objc_msgSend(v7, "feedbackFollowupIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndexedSubscript:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "feedbackFollowups");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndexedSubscript:", a4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[FBKLog ffu](FBKLog, "ffu");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "ID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unsignedIntegerValue");
    v20 = objc_msgSend(v14, "unsignedIntegerValue");
    objc_msgSend(v16, "ID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "unsignedIntegerValue");
    *(_DWORD *)buf = 134218752;
    v51 = a4;
    v52 = 2048;
    v53 = v19;
    v54 = 2048;
    v55 = v20;
    v12 = MEMORY[0x24BDAC760];
    v56 = 2048;
    v57 = v22;
    _os_log_impl(&dword_21D9A9000, v17, OS_LOG_TYPE_INFO, "FFU ID at index [%lu] for FB [%lu] is [%lu]. FFU ID through relationship has ID [%lu]", buf, 0x2Au);

  }
  objc_msgSend(v16, "ID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v14, "isEqualToNumber:", v23);

  if ((v24 & 1) == 0)
  {

    objc_msgSend(v7, "feedbackFollowups");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v12;
    v48[1] = 3221225472;
    v48[2] = __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke;
    v48[3] = &unk_24E15A198;
    v49 = v14;
    v26 = objc_msgSend(v25, "indexOfObjectPassingTest:", v48);

    if (v26 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = 0;
    }
    else
    {
      objc_msgSend(v7, "feedbackFollowups");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectAtIndexedSubscript:", v26);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (!v16)
  {
    Log_5();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v36 = objc_msgSend(v14, "unsignedIntegerValue");
      *(_DWORD *)buf = 134217984;
      v51 = v36;
      _os_log_impl(&dword_21D9A9000, v32, OS_LOG_TYPE_INFO, "Followup [%lu] was not in Core Data cache, fetching.", buf, 0xCu);
    }
    goto LABEL_21;
  }
  objc_msgSend(v16, "updatedAt");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentItem");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "updatedAt");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v28, "compare:", v30);

  Log_5();
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
  if (v31 != 1)
  {
    if (v33)
    {
      objc_msgSend(v16, "ID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "unsignedIntegerValue");
      *(_DWORD *)buf = 134217984;
      v51 = v38;
      _os_log_impl(&dword_21D9A9000, v32, OS_LOG_TYPE_INFO, "Followup [%lu] is out of date, fetching.", buf, 0xCu);

    }
LABEL_21:

    goto LABEL_22;
  }
  if (v33)
  {
    objc_msgSend(v16, "ID", self);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "unsignedIntegerValue");
    *(_DWORD *)buf = 134217984;
    v51 = v35;
    _os_log_impl(&dword_21D9A9000, v32, OS_LOG_TYPE_INFO, "Followup [%lu] is not stale, using local cache", buf, 0xCu);

  }
  (*((void (**)(id, void *, _QWORD))v43 + 2))(v43, v16, 0);
LABEL_23:

}

uint64_t __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToNumber:", v3);

  return v4;
}

void __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke_210(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void (*v12)(void);
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void (*v20)(void);
  NSObject *v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v11 = *(_QWORD *)(a1 + 40);
    if (v6 && v11)
    {
      v12 = *(void (**)(void))(v11 + 16);
    }
    else
    {
      if (!v11)
        goto LABEL_23;
      Log_5();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke_210_cold_1();

      v12 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v12();
    goto LABEL_23;
  }
  objc_msgSend(*(id *)(a1 + 32), "feedbackFollowups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "feedbackFollowups");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    v10 = *(_QWORD *)(a1 + 48);
    if (v10 >= objc_msgSend(v9, "count"))
      objc_msgSend(v9, "addObject:", v5);
    else
      objc_msgSend(v9, "insertObject:atIndex:", v5, *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(*(id *)(a1 + 32), "setFeedbackFollowups:", v13);

  }
  else
  {
    v23[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setFeedbackFollowups:", v9);
  }

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentItem");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "user");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "refreshObject:mergeChanges:", v16, 1);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v17, "save:", &v22);
  v18 = v22;

  v19 = *(_QWORD *)(a1 + 40);
  if (v18)
  {
    if (v19)
    {
      v20 = *(void (**)(void))(v19 + 16);
LABEL_16:
      v20();
    }
  }
  else if (v19)
  {
    v20 = *(void (**)(void))(v19 + 16);
    goto LABEL_16;
  }

LABEL_23:
}

- (void)updateTask:(id)a3 withSubmissionStage:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  FBKData *v11;
  unint64_t v12;

  v6 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __42__FBKData_updateTask_withSubmissionStage___block_invoke;
  v9[3] = &unk_24E1590B8;
  v11 = self;
  v12 = a4;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "performBlockAndWait:", v9);

}

void __42__FBKData_updateTask_withSubmissionStage___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  unint64_t v7;
  const char *v8;
  unint64_t v9;
  const char *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "taskIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "intValue");
    objc_msgSend(*(id *)(a1 + 32), "formID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");
    v7 = objc_msgSend(*(id *)(a1 + 32), "localSubmissionStage");
    if (v7 > 8)
      v8 = "Unknown";
    else
      v8 = off_24E15A690[v7];
    v9 = *(_QWORD *)(a1 + 48);
    if (v9 > 8)
      v10 = "Unknown";
    else
      v10 = off_24E15A690[v9];
    *(_DWORD *)buf = 67109890;
    v23 = v4;
    v24 = 1024;
    v25 = v6;
    v26 = 2080;
    v27 = v8;
    v28 = 2080;
    v29 = v10;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_INFO, "Changing upload task [%d] for form [%d] state from [%s] to [%s]", buf, 0x22u);

  }
  objc_msgSend(*(id *)(a1 + 32), "setLocalSubmissionStage:", *(_QWORD *)(a1 + 48));
  if (objc_msgSend(*(id *)(a1 + 32), "hasChanges"))
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v11, "save:", &v21);
    v12 = v21;

    objc_msgSend(*(id *)(a1 + 32), "formResponse");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "formResponse");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "refreshObject:mergeChanges:", v15, 1);

    }
    objc_msgSend(*(id *)(a1 + 32), "feedbackFollowup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "feedbackFollowup");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "refreshObject:mergeChanges:", v18, 1);

    }
    if (v12)
    {
      Log_5();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __42__FBKData_updateTask_withSubmissionStage___block_invoke_cold_1();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "filerForm");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:](v19, "postNotificationName:object:", CFSTR("FBKFormUploadStatusChangeNotification"), v20);

      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "_logUploadTasks");

}

- (void)deleteUploadForTask:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  FBKData *v16;
  id v17;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "taskIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__FBKData_deleteUploadForTask_completion___block_invoke;
  v13[3] = &unk_24E1571B0;
  v14 = v6;
  v15 = v8;
  v16 = self;
  v17 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  objc_msgSend(v9, "performBlock:", v13);

}

void __42__FBKData_deleteUploadForTask_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  _QWORD *v34;
  id v35;
  id v36;
  _QWORD v37[5];
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__3;
  v37[4] = __Block_byref_object_dispose__3;
  v38 = 0;
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "fileURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 == 0;

    if (v4)
    {
      v15 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "fileURL");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      objc_msgSend(v5, "removeItemAtURL:error:", v6, &v36);
      v7 = v36;

      if (v7)
      {
        Log_5();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(a1 + 32), "fileURL");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "path");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = *(_QWORD *)(a1 + 40);
          objc_msgSend(v7, "localizedDescription");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v40 = v25;
          v41 = 2114;
          v42 = v26;
          v43 = 2114;
          v44 = v27;
          _os_log_error_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_ERROR, "upload task: %{public}@ failed to remove file %{public}@ with error: %{public}@", buf, 0x20u);

        }
      }

      objc_msgSend(*(id *)(a1 + 32), "fileURL");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "URLByDeletingPathExtension");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLByDeletingPathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v10) = objc_msgSend(v12, "fileExistsAtPath:", v13);

      if ((_DWORD)v10)
      {
        objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = 0;
        objc_msgSend(v14, "removeItemAtURL:error:", v11, &v35);
        v15 = v35;

        if (v15)
        {
          Log_5();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            v17 = *(_QWORD *)(a1 + 40);
            objc_msgSend(v15, "localizedDescription");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            __42__FBKData_deleteUploadForTask_completion___block_invoke_cold_1(v17, v18, (uint64_t)buf, v16);
          }

        }
      }
      else
      {
        v15 = 0;
      }

    }
    v19 = *(void **)(a1 + 32);
    if (v19)
    {
      objc_msgSend(v19, "managedObjectContext");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __42__FBKData_deleteUploadForTask_completion___block_invoke_211;
      v28[3] = &unk_24E15A210;
      v29 = *(id *)(a1 + 32);
      v34 = v37;
      v15 = v15;
      v30 = v15;
      v21 = *(id *)(a1 + 40);
      v22 = *(_QWORD *)(a1 + 48);
      v23 = *(void **)(a1 + 56);
      v31 = v21;
      v32 = v22;
      v33 = v23;
      objc_msgSend(v20, "performBlock:", v28);

    }
  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(v37, 8);

}

void __42__FBKData_deleteUploadForTask_completion___block_invoke_211(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD block[5];
  id v18;
  id v19;
  uint8_t buf[4];
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "taskIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteObject:", *(_QWORD *)(a1 + 32));

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v19 = *(id *)(v6 + 40);
  objc_msgSend(v5, "save:", &v19);
  objc_storeStrong((id *)(v6 + 40), v19);

  v7 = *(_QWORD *)(a1 + 40);
  Log_5();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = MEMORY[0x24BDAC760];
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __42__FBKData_deleteUploadForTask_completion___block_invoke_211_cold_1();

  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v21 = v3;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_DEFAULT, "Deleted upload task [%i]", buf, 8u);
    }

    block[0] = v10;
    block[1] = 3221225472;
    block[2] = __42__FBKData_deleteUploadForTask_completion___block_invoke_212;
    block[3] = &unk_24E157020;
    block[4] = *(_QWORD *)(a1 + 56);
    v18 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 56), "mainQueueContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v10;
    v14[1] = 3221225472;
    v14[2] = __42__FBKData_deleteUploadForTask_completion___block_invoke_2;
    v14[3] = &unk_24E15A1E8;
    v12 = *(id *)(a1 + 64);
    v13 = *(_QWORD *)(a1 + 72);
    v15 = v12;
    v16 = v13;
    objc_msgSend(v11, "performBlockAndWait:", v14);

  }
}

void __42__FBKData_deleteUploadForTask_completion___block_invoke_212(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "notificationCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("FBKLocalDataDidDeleteUploadTask"), *(_QWORD *)(a1 + 40));

}

uint64_t __42__FBKData_deleteUploadForTask_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

- (void)prepareFilerFormForSubmission:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "uploadTask");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = (void *)MEMORY[0x24BDBB658];
    +[FBKUploadTask entityName](FBKUploadTask, "entityName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBKData mainQueueContext](self, "mainQueueContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "insertNewObjectForEntityForName:inManagedObjectContext:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setTaskIdentifier:", &unk_24E18CC98);
    objc_msgSend(v8, "setFileURL:", 0);
    objc_msgSend(v8, "setLocalSubmissionStage:", 0);
    objc_msgSend(v9, "setUploadTask:", v8);

  }
}

- (void)clearUploadTasksWithIdentifier:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  unint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  Log_5();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v29 = a3;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_INFO, "clearing upload tasks with identifier %lu", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDBB678], "fetchRequestWithEntityName:", CFSTR("UploadTask"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD1758];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateWithFormat:", CFSTR("taskIdentifier = %@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v9);

  objc_msgSend(v6, "setIncludesPropertyValues:", 0);
  -[FBKData mainQueueContext](self, "mainQueueContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v6, &v26);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v26;

  if (v12)
  {
    Log_5();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FBKData clearUploadTasksWithIdentifier:].cold.2();
  }
  else
  {
    if (!objc_msgSend(v11, "count"))
      goto LABEL_7;
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v11;
    v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v14)
    {
      v15 = v14;
      v21 = v11;
      v16 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i);
          Log_5();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            -[FBKData clearUploadTasksWithIdentifier:].cold.1((uint64_t)buf, v18);

          -[FBKData mainQueueContext](self, "mainQueueContext");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "deleteObject:", v18);

        }
        v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v15);
      v11 = v21;
    }
  }

LABEL_7:
}

- (id)allActiveUploadTasksInContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v13;

  v3 = (void *)MEMORY[0x24BDBB678];
  v4 = a3;
  +[FBKUploadTask entityName](FBKUploadTask, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v6, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v8)
  {
    Log_5();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[FBKData allActiveUploadTasksInContext:].cold.3(v8, v9);
LABEL_11:

    v11 = (id)MEMORY[0x24BDBD1A8];
    goto LABEL_12;
  }
  if (!v7 || !objc_msgSend(v7, "count"))
  {
    Log_5();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[FBKData allActiveUploadTasksInContext:].cold.1();
    goto LABEL_11;
  }
  Log_5();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[FBKData allActiveUploadTasksInContext:].cold.2();

  v11 = v7;
LABEL_12:

  return v11;
}

- (void)getFileDownloadURLForFilePromise:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;

  v6 = a3;
  v7 = a4;
  if (v6 && (objc_msgSend(v6, "UUIDString"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v8, v8))
  {
    -[FBKData api](self, "api");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__FBKData_getFileDownloadURLForFilePromise_completion___block_invoke;
    v12[3] = &unk_24E15A238;
    v13 = v7;
    objc_msgSend(v9, "getFileDownloadURLForFilePromiseUUID:completion:", v10, v12);

  }
  else
  {
    Log_5();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[FBKData getFileDownloadURLForFilePromise:completion:].cold.1();

    (*((void (**)(id, _QWORD, _QWORD))v7 + 2))(v7, 0, 0);
  }

}

void __55__FBKData_getFileDownloadURLForFilePromise_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    Log_5();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __55__FBKData_getFileDownloadURLForFilePromise_completion___block_invoke_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (id)_followupSubmissionBodyWithFlags:(unint64_t)a3 responses:(id)a4
{
  char v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = a4;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 5);
  v7 = v6;
  if (v5)
    objc_msgSend(v6, "setObject:forKey:", v5, CFSTR("responses"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4 & 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("ignore_required"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v4 & 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("used_filer"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("answers_complete"));
  return v7;
}

- (void)createUnsolicitedFeedbackFollowupForItem:(id)a3 completion:(id)a4
{
  -[FBKData createFeedbackFollowupOfType:forItem:completion:](self, "createFeedbackFollowupOfType:forItem:completion:", 0, a3, a4);
}

- (void)createFeedbackFollowupOfType:(unint64_t)a3 forItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  FBKData *v28;
  id v29;
  unint64_t v30;
  _QWORD v31[4];
  id v32;
  FBKData *v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;
  id buf;
  __int16 v43;
  int v44;
  __int16 v45;
  unint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v8, "itemType") == 4)
  {
    objc_msgSend(v8, "feedback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "formResponseID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "ID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 7)
    {
      objc_msgSend(v8, "formResponse");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "ID");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3)
      {
        v17 = v11;
        if (v11)
        {
LABEL_11:
          Log_5();
          v19 = objc_claimAutoreleasedReturnValue();
          v20 = v19;
          if (v12)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              LODWORD(buf) = 67109632;
              HIDWORD(buf) = objc_msgSend(v17, "unsignedIntValue");
              v43 = 1024;
              v44 = objc_msgSend(v12, "unsignedIntValue");
              v45 = 2048;
              v46 = a3;
              _os_log_impl(&dword_21D9A9000, v20, OS_LOG_TYPE_DEFAULT, "Creating FFU on FR [%u] FB [%u] type [%lu]", (uint8_t *)&buf, 0x18u);
            }

            objc_initWeak(&buf, self);
            -[FBKData api](self, "api");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = MEMORY[0x24BDAC760];
            v31[0] = MEMORY[0x24BDAC760];
            v31[1] = 3221225472;
            v31[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_229;
            v31[3] = &unk_24E15A260;
            objc_copyWeak(&v35, &buf);
            v32 = v8;
            v33 = self;
            v34 = v9;
            v26[0] = v22;
            v26[1] = 3221225472;
            v26[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_232;
            v26[3] = &unk_24E15A288;
            v27 = v17;
            v30 = a3;
            v28 = self;
            v29 = v34;
            objc_msgSend(v21, "createFollowupWithType:forFeedbackWithID:success:error:", a3, v12, v31, v26);

            objc_destroyWeak(&v35);
            objc_destroyWeak(&buf);
          }
          else
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              -[FBKData createFeedbackFollowupOfType:forItem:completion:].cold.2();

            if (v9)
            {
              -[FBKData mainQueueContext](self, "mainQueueContext");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v36[0] = MEMORY[0x24BDAC760];
              v36[1] = 3221225472;
              v36[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_228;
              v36[3] = &unk_24E156F80;
              v37 = v9;
              objc_msgSend(v25, "performBlockAndWait:", v36);

            }
          }
LABEL_24:

          goto LABEL_25;
        }
LABEL_16:
        Log_5();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          -[FBKData createFeedbackFollowupOfType:forItem:completion:].cold.1();

        if (v9)
        {
          -[FBKData mainQueueContext](self, "mainQueueContext");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x24BDAC760];
          v38[1] = 3221225472;
          v38[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_227;
          v38[3] = &unk_24E156F80;
          v39 = v9;
          objc_msgSend(v24, "performBlockAndWait:", v38);

        }
        goto LABEL_24;
      }
      objc_msgSend(v8, "feedback");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "formResponseID");
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v17 = (void *)v14;

    objc_msgSend(v8, "ID");
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v18;
    if (v17)
      goto LABEL_11;
    goto LABEL_16;
  }
  Log_5();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    -[FBKData createFeedbackFollowupOfType:forItem:completion:].cold.3();

  if (v9)
  {
    -[FBKData mainQueueContext](self, "mainQueueContext");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke;
    v40[3] = &unk_24E156F80;
    v41 = v9;
    objc_msgSend(v16, "performBlockAndWait:", v40);

    v17 = v41;
LABEL_25:

  }
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE312E8], -6, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_227(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE312E8], -6, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_228(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BE312E8], -6, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, id))(v1 + 16))(v1, 0, v2);

}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_229(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "mainQueueContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2;
  v8[3] = &unk_24E159D38;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v6 = v3;
  v9 = v6;
  v10 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = v7;
  objc_msgSend(v5, "performBlockAndWait:", v8);

  objc_destroyWeak(&v13);
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "feedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addFollowup:", v3);

  objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasChanges");

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v7, "save:", &v14);
    v8 = v14;

    if (v8)
    {
      Log_5();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_cold_1();

    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 48), "mainQueueContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_230;
    v11[3] = &unk_24E156FA8;
    v13 = *(id *)(a1 + 56);
    v12 = v3;
    objc_msgSend(v10, "performBlockAndWait:", v11);

  }
}

uint64_t __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_230(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_232(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_232_cold_1(a1);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_233;
    v6[3] = &unk_24E156FA8;
    v8 = *(id *)(a1 + 48);
    v7 = v3;
    objc_msgSend(v5, "performBlockAndWait:", v6);

  }
}

uint64_t __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_233(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

- (void)respondToFollowup:(id)a3 withResponses:(id)a4 collector:(id)a5 optingOut:(BOOL)a6 completion:(id)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  FBKData *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  FBKData *v36;
  id v37;
  id v38;
  id location[2];

  v8 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  objc_initWeak(location, self);
  v16 = objc_msgSend(v14, "hasFilePromises");
  v17 = 4;
  if (!v8)
    v17 = 0;
  v18 = 10;
  if (!v16)
    v18 = 1;
  -[FBKData _followupSubmissionBodyWithFlags:responses:](self, "_followupSubmissionBodyWithFlags:responses:", v18 | v17, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData addDeviceDataToSubmissionInfo:withCollector:](self, "addDeviceDataToSubmissionInfo:withCollector:", v19, v14);
  v28 = v13;
  objc_msgSend(v12, "ID");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained(location);
  objc_msgSend(WeakRetained, "api");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "feedback");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "ID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke;
  v34[3] = &unk_24E15A260;
  objc_copyWeak(&v38, location);
  v25 = v14;
  v35 = v25;
  v36 = self;
  v37 = v15;
  v30[0] = v24;
  v30[1] = 3221225472;
  v30[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_5;
  v30[3] = &unk_24E15A2B0;
  v26 = v29;
  v31 = v26;
  v32 = self;
  v27 = v37;
  v33 = v27;
  objc_msgSend(v21, "sendFollowupResponseWithData:forFollowupID:feedbackID:success:error:", v19, v26, v23, v34, v30);

  objc_destroyWeak(&v38);
  objc_destroyWeak(location);

}

void __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "mainQueueContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_2;
  v8[3] = &unk_24E159D38;
  objc_copyWeak(&v13, (id *)(a1 + 56));
  v6 = v3;
  v9 = v6;
  v10 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 40);
  v12 = v7;
  objc_msgSend(v5, "performBlock:", v8);

  objc_destroyWeak(&v13);
}

void __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id *v9;
  id *v10;
  _QWORD *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;

  v2 = (id *)(a1 + 64);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", *(_QWORD *)(a1 + 32));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(WeakRetained) = objc_msgSend(*(id *)(a1 + 40), "hasFilePromises");
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("FBKLocalDataDidChangeNotification"), v6);

  v7 = *(_QWORD *)(a1 + 56);
  if ((_DWORD)WeakRetained)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 48), "mainQueueContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_3;
      v16[3] = &unk_24E156FA8;
      v9 = &v18;
      v18 = *(id *)(a1 + 56);
      v10 = &v17;
      v17 = v12;
      v11 = v16;
LABEL_6:
      objc_msgSend(v8, "performBlockAndWait:", v11);

    }
  }
  else if (v7)
  {
    objc_msgSend(*(id *)(a1 + 48), "mainQueueContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_4;
    v13[3] = &unk_24E156FA8;
    v9 = &v15;
    v15 = *(id *)(a1 + 56);
    v10 = &v14;
    v14 = v12;
    v11 = v13;
    goto LABEL_6;
  }

}

uint64_t __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

uint64_t __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_5_cold_1(a1, v4);

  objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_235;
  v8[3] = &unk_24E157138;
  v6 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "addOperationWithBlock:", v8);

}

uint64_t __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_235(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "reloadAllContentWithCompletion:", 0);
  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "Refreshing all content, encountered error on respond to FFU: %{public}@", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)deleteUnsolicitedFollowup:(id)a3 withFeedbackItem:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id location;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD aBlock[5];
  id v39;
  id v40;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke;
  aBlock[3] = &unk_24E15A300;
  aBlock[4] = self;
  v12 = v9;
  v39 = v12;
  v13 = v8;
  v40 = v13;
  v14 = _Block_copy(aBlock);
  objc_msgSend(v12, "feedback");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contentItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "formResponseStub");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17 && (objc_msgSend(v17, "ID"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v18, v18))
  {
    objc_initWeak(&location, self);
    -[FBKData api](self, "api");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "ID");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "feedback");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "ID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v11;
    v30[1] = 3221225472;
    v30[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_2_238;
    v30[3] = &unk_24E15A350;
    v31 = v10;
    v32 = v14;
    objc_copyWeak(&v33, &location);
    v26[0] = v11;
    v26[1] = 3221225472;
    v26[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_4;
    v26[3] = &unk_24E15A3A0;
    v27 = v32;
    v28 = v31;
    objc_copyWeak(&v29, &location);
    objc_msgSend(v25, "deleteFollowupWithID:feedbackID:success:error:", v19, v21, v30, v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v33);

    objc_destroyWeak(&location);
  }
  else
  {
    Log_5();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[FBKData deleteUnsolicitedFollowup:withFeedbackItem:completion:].cold.1();

    if (v10)
    {
      -[FBKData mainQueueContext](self, "mainQueueContext");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = v11;
      v35[1] = 3221225472;
      v35[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_237;
      v35[3] = &unk_24E15A328;
      v36 = v10;
      v37 = v14;
      objc_msgSend(v23, "performBlockAndWait:", v35);

    }
    -[FBKData notificationCenter](self, "notificationCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "postNotificationName:object:", CFSTR("FBKLocalDataDidChangeNotification"), self);

  }
}

id __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke(id *a1)
{
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  objc_msgSend(a1[4], "mainQueueContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__3;
  v15 = __Block_byref_object_dispose__3;
  v16 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_2;
  v6[3] = &unk_24E15A2D8;
  v7 = a1[5];
  v8 = a1[6];
  v3 = v2;
  v9 = v3;
  v10 = &v11;
  objc_msgSend(v3, "performBlockAndWait:", v6);
  v4 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v4;
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "feedback");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "deleteFollowup:", *(_QWORD *)(a1 + 40));

  v3 = *(void **)(a1 + 48);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v3, "save:", &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_237(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_2_238(id *a1)
{
  _QWORD block[4];
  id v3;
  id v4;
  id v5;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_3;
  block[3] = &unk_24E15A350;
  v3 = a1[4];
  v4 = a1[5];
  objc_copyWeak(&v5, a1 + 6);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  objc_destroyWeak(&v5);

}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id *v4;
  void *v5;
  id v6;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  }
  v4 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v4);
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("FBKLocalDataDidChangeNotification"), v6);

}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_4(id *a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5;
  v5[3] = &unk_24E15A378;
  v6 = v3;
  v7 = a1[4];
  v8 = a1[5];
  v4 = v3;
  objc_copyWeak(&v9, a1 + 6);
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v9);

}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5_cold_2();

  (*(void (**)(void))(a1[5] + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5_cold_1();

  }
  v5 = a1[6];
  if (v5)
    (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, a1[4]);
  v6 = (id *)(a1 + 7);
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "notificationCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained(v6);
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("FBKLocalDataDidChangeNotification"), v9);

}

- (void)feedbackFollowupForID:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  -[FBKData api](self, "api");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__FBKData_feedbackFollowupForID_completion___block_invoke;
  v10[3] = &unk_24E15A3C8;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v10[4] = self;
  v11 = v9;
  objc_msgSend(v8, "getFeedbackFollowupWithID:completion:", v6, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __44__FBKData_feedbackFollowupForID_completion___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v9 = a2;
  v5 = a3;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a1[5])
  {
    objc_msgSend(a1[4], "mainQueueContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __44__FBKData_feedbackFollowupForID_completion___block_invoke_2;
    v10[3] = &unk_24E157200;
    v13 = a1[5];
    v11 = v6;
    v12 = v5;
    objc_msgSend(v8, "performBlockAndWait:", v10);

  }
}

uint64_t __44__FBKData_feedbackFollowupForID_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)createEnhancedLoggingFollowupForItem:(id)a3 completion:(id)a4
{
  -[FBKData createFeedbackFollowupOfType:forItem:completion:](self, "createFeedbackFollowupOfType:forItem:completion:", 7, a3, a4);
}

- (void)refreshAnnouncementFromContentItem:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id buf[2];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "detailedItem");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v9, OS_LOG_TYPE_INFO, "no announcement for item, Will fetch", (uint8_t *)buf, 2u);
    }
    goto LABEL_8;
  }
  v9 = v8;
  objc_msgSend(v6, "updatedAt");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject updatedAt](v9, "updatedAt");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "compare:", v11);

  if (v12 == 1)
  {
    +[FBKLog appHandle](FBKLog, "appHandle");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v13, OS_LOG_TYPE_INFO, "announcement is stale, will refresh", (uint8_t *)buf, 2u);
    }

LABEL_8:
    objc_initWeak(buf, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke;
    v14[3] = &unk_24E15A418;
    objc_copyWeak(&v17, buf);
    v15 = v6;
    v16 = v7;
    -[FBKData takeMainQueueObject:andContinueWithPrivateQueueObject:](self, "takeMainQueueObject:andContinueWithPrivateQueueObject:", v15, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak(buf);
    v9 = 0;
    goto LABEL_11;
  }
  if (v7)
    (*((void (**)(id, NSObject *, _QWORD))v7 + 2))(v7, v9, 0);
LABEL_11:

}

void __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "api");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_2;
  v6[3] = &unk_24E15A3F0;
  v7 = a1[4];
  v8 = a1[5];
  objc_copyWeak(&v9, a1 + 6);
  objc_msgSend(v5, "fetchAnnouncementForContentItem:withCompletion:", v3, v6);

  objc_destroyWeak(&v9);
}

void __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_2(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_3;
    block[3] = &unk_24E157358;
    v18 = a1[4];
    v20 = a1[5];
    v19 = v6;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

    v7 = v18;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(WeakRetained, "mainQueueObjectFromPrivate:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_loadWeakRetained(a1 + 6);
    objc_msgSend(v10, "mainQueueContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_239;
    v12[3] = &unk_24E159CE8;
    objc_copyWeak(&v16, a1 + 6);
    v13 = a1[4];
    v15 = a1[5];
    v7 = v9;
    v14 = v7;
    objc_msgSend(v11, "performBlock:", v12);

    objc_destroyWeak(&v16);
  }

}

uint64_t __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_3_cold_1(a1);

  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_239(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t result;
  _DWORD v7[2];
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "mainQueueContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "refreshObject:mergeChanges:", *(_QWORD *)(a1 + 32), 1);

  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "ID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = 67109120;
    v7[1] = objc_msgSend(v5, "intValue");
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_INFO, "Did fetch announcement [%i]", (uint8_t *)v7, 8u);

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 40), 0);
  return result;
}

- (void)markAnnouncementRead:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  FBKData *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  FBKData *v20;
  id v21;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData api](self, "api");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke;
  v18[3] = &unk_24E157138;
  v19 = v6;
  v20 = self;
  v21 = v7;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke_4;
  v14[3] = &unk_24E157070;
  v16 = self;
  v17 = v21;
  v15 = v8;
  v11 = v21;
  v12 = v8;
  v13 = v6;
  objc_msgSend(v9, "acknowledgeAnnouncementWithID:success:error:", v12, v18, v14);

}

void __43__FBKData_markAnnouncementRead_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke_2;
  v6[3] = &unk_24E157138;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  objc_msgSend(v2, "performBlock:", v6);

}

void __43__FBKData_markAnnouncementRead_completion___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;

  objc_msgSend(a1[4], "setUnread:", 0);
  objc_msgSend(a1[4], "contentItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAsRead");

  if ((objc_msgSend(a1[4], "hasChanges") & 1) != 0
    || (objc_msgSend(a1[4], "contentItem"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "hasChanges"),
        v3,
        v4))
  {
    objc_msgSend(a1[4], "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v5, "save:", &v12);
    v6 = v12;

    if (v6)
      goto LABEL_6;
    objc_msgSend(a1[5], "notificationCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("FBKLocalDataDidChangeNotification"), a1[5]);

  }
  v6 = 0;
LABEL_6:
  if (a1[6])
  {
    objc_msgSend(a1[5], "mainQueueContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke_3;
    v9[3] = &unk_24E156FA8;
    v11 = a1[6];
    v10 = v6;
    objc_msgSend(v8, "performBlockAndWait:", v9);

  }
}

uint64_t __43__FBKData_markAnnouncementRead_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __43__FBKData_markAnnouncementRead_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __43__FBKData_markAnnouncementRead_completion___block_invoke_4_cold_1(a1);

  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __43__FBKData_markAnnouncementRead_completion___block_invoke_241;
    v6[3] = &unk_24E156FA8;
    v8 = *(id *)(a1 + 48);
    v7 = v3;
    objc_msgSend(v5, "performBlockAndWait:", v6);

  }
}

uint64_t __43__FBKData_markAnnouncementRead_completion___block_invoke_241(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)recordConsentResponseForConsent:(id)a3 response:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  NSObject *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  FBKData *v19;
  id v20;
  BOOL v21;
  _QWORD v22[4];
  id v23;
  FBKData *v24;
  id v25;
  BOOL v26;
  uint8_t buf[4];
  const __CFString *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v6 = a4;
  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  Log_5();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v11 = CFSTR("YES");
    else
      v11 = CFSTR("NO");
    objc_msgSend(v8, "ID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v28 = v11;
    v29 = 1024;
    v30 = objc_msgSend(v12, "intValue");
    _os_log_impl(&dword_21D9A9000, v10, OS_LOG_TYPE_DEFAULT, "User responded [%{public}@] to consent with ID [%d]", buf, 0x12u);

  }
  -[FBKData setPendingConsents:](self, "setPendingConsents:", 0);
  -[FBKData api](self, "api");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke;
  v22[3] = &unk_24E157110;
  v26 = v6;
  v23 = v8;
  v24 = self;
  v25 = v9;
  v17[0] = v14;
  v17[1] = 3221225472;
  v17[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_6;
  v17[3] = &unk_24E15A440;
  v21 = v6;
  v18 = v23;
  v19 = self;
  v20 = v25;
  v15 = v25;
  v16 = v23;
  objc_msgSend(v13, "respondToConsent:didAgree:success:error:", v16, v6, v22, v17);

}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;
  id v8;
  char v9;

  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_2;
  v5[3] = &unk_24E157110;
  v9 = *(_BYTE *)(a1 + 56);
  v2 = *(id *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(a1 + 48);
  v6 = v2;
  v7 = v3;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[5];
  id v8;

  if (*(_BYTE *)(a1 + 56) || !objc_msgSend(*(id *)(a1 + 32), "isRequired"))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPendingConsents:", 0);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x24BDAC760];
      v5[1] = 3221225472;
      v5[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_5;
      v5[3] = &unk_24E156F80;
      v6 = *(id *)(a1 + 48);
      objc_msgSend(v4, "performBlockAndWait:", v5);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "loginManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_3;
    v7[3] = &unk_24E156DC8;
    v3 = *(void **)(a1 + 48);
    v7[4] = *(_QWORD *)(a1 + 40);
    v8 = v3;
    objc_msgSend(v2, "logOutIfNeededAndRun:", v7);

  }
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setPendingConsents:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_4;
    v3[3] = &unk_24E156F80;
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "performBlockAndWait:", v3);

  }
}

uint64_t __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  char v13;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_7;
  block[3] = &unk_24E1572B8;
  v9 = v3;
  v13 = *(_BYTE *)(a1 + 56);
  v4 = *(id *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v12 = v6;
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_7(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  _QWORD v9[5];
  id v10;

  Log_5();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_7_cold_1();

  if (*(_BYTE *)(a1 + 64) || !objc_msgSend(*(id *)(a1 + 40), "isRequired"))
  {
    objc_msgSend(*(id *)(a1 + 48), "setPendingConsents:", 0);
    if (!*(_QWORD *)(a1 + 56))
      return;
    objc_msgSend(*(id *)(a1 + 48), "mainQueueContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_3_248;
    v7[3] = &unk_24E156F80;
    v8 = *(id *)(a1 + 56);
    objc_msgSend(v6, "performBlockAndWait:", v7);

    v5 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "loginManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_246;
    v9[3] = &unk_24E156DC8;
    v4 = *(void **)(a1 + 56);
    v9[4] = *(_QWORD *)(a1 + 48);
    v10 = v4;
    objc_msgSend(v3, "logOutIfNeededAndRun:", v9);

    v5 = v10;
  }

}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_246(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setPendingConsents:", 0);
  if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_2_247;
    v3[3] = &unk_24E156F80;
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "performBlockAndWait:", v3);

  }
}

uint64_t __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_2_247(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_3_248(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)destroyPersistentStoreWithUrl:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;

  v4 = a3;
  -[FBKData persistentStoreCoordinatorInternal](self, "persistentStoreCoordinatorInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBKData persistentStoreType](self, "persistentStoreType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v5, "destroyPersistentStoreAtURL:withType:options:error:", v4, v6, MEMORY[0x24BDBD1B8], &v9);

  v7 = v9;
  if (v7)
  {
    Log_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FBKData destroyPersistentStoreWithUrl:].cold.1();

  }
}

+ (void)addFetchedFormResponseProperty:(id)a3 forAnswersWithRole:(id)a4 toModel:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "entitiesByName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("FormResponse"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc_init(MEMORY[0x24BDBB680]);
  objc_msgSend(v12, "setName:", v9);

  v17 = CFSTR("role");
  v18[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setUserInfo:", v13);
  objc_msgSend(v11, "properties");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByAddingObject:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProperties:", v15);

  objc_msgSend(v7, "fetchRequestTemplateForName:", CFSTR("AnswersWithRole"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setFetchOffset:", 0);
  objc_msgSend(v12, "setFetchRequest:", v16);

}

- (id)managedObjectModel
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__FBKData_managedObjectModel__block_invoke;
  block[3] = &unk_24E156D78;
  block[4] = self;
  if (managedObjectModel_onceToken != -1)
    dispatch_once(&managedObjectModel_onceToken, block);
  return (id)managedObjectModel_managedObjectModel;
}

void __29__FBKData_managedObjectModel__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;

  objc_msgSend(*(id *)(a1 + 32), "bundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "URLForResource:withExtension:", CFSTR("Feedback"), CFSTR("momd"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB6B0]), "initWithContentsOfURL:", v2);
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "modelWithFormResponsePropertiesFromModel:", v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)managedObjectModel_managedObjectModel;
    managedObjectModel_managedObjectModel = v4;

  }
  else
  {
    Log_5();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __29__FBKData_managedObjectModel__block_invoke_cold_1();

  }
}

+ (id)modelWithFormResponsePropertiesFromModel:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(a1, "addFetchedFormResponseProperty:forAnswersWithRole:toModel:", CFSTR("titleAnswers"), CFSTR(":title"), v4);
  objc_msgSend(a1, "addFetchedFormResponseProperty:forAnswersWithRole:toModel:", CFSTR("problemDescriptionAnswers"), CFSTR(":description"), v4);
  objc_msgSend(a1, "addFetchedFormResponseProperty:forAnswersWithRole:toModel:", CFSTR("issueAreaAnswers"), CFSTR(":area"), v4);
  objc_msgSend(a1, "addFetchedFormResponseProperty:forAnswersWithRole:toModel:", CFSTR("issueTypeAnswers"), CFSTR(":type"), v4);
  return v4;
}

- (void)privateQueueContextDidSave:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location[2];

  v4 = a3;
  -[FBKData loginManager](self, "loginManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loginState");

  if (v6)
  {
    objc_initWeak(location, self);
    -[FBKData mainQueueContext](self, "mainQueueContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __38__FBKData_privateQueueContextDidSave___block_invoke;
    v9[3] = &unk_24E159BD0;
    objc_copyWeak(&v11, location);
    v10 = v4;
    objc_msgSend(v7, "performBlock:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    Log_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_INFO, "logged out will not merge private into main context", (uint8_t *)location, 2u);
    }

  }
}

void __38__FBKData_privateQueueContextDidSave___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "mainQueueContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeChangesFromContextDidSaveNotification:", *(_QWORD *)(a1 + 32));

}

- (void)mainQueueContextDidSave:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id location[2];

  v4 = a3;
  -[FBKData loginManager](self, "loginManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "loginState");

  if (v6)
  {
    objc_initWeak(location, self);
    -[FBKData privateQueueContext](self, "privateQueueContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__FBKData_mainQueueContextDidSave___block_invoke;
    v9[3] = &unk_24E159BD0;
    objc_copyWeak(&v11, location);
    v10 = v4;
    objc_msgSend(v7, "performBlock:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(location);
  }
  else
  {
    Log_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_21D9A9000, v8, OS_LOG_TYPE_INFO, "logged out will not merge main into private context", (uint8_t *)location, 2u);
    }

  }
}

void __35__FBKData_mainQueueContextDidSave___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "privateQueueContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mergeChangesFromContextDidSaveNotification:", *(_QWORD *)(a1 + 32));

}

- (id)persistentStoreType
{
  _BOOL4 v2;
  id *v3;

  v2 = +[FBKSharedConstants usesPersistentStore](FBKSharedConstants, "usesPersistentStore");
  v3 = (id *)MEMORY[0x24BDBB418];
  if (v2)
    v3 = (id *)MEMORY[0x24BDBB580];
  return *v3;
}

- (id)bundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (void)resetAllLocalDataWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id buf[2];

  v4 = a3;
  Log_5();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "Resetting local data", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[FBKData privateQueueContext](self, "privateQueueContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__FBKData_resetAllLocalDataWithCompletion___block_invoke;
  v8[3] = &unk_24E157510;
  objc_copyWeak(&v10, buf);
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v6, "performBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(buf);

}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  id v10;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "privateQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "mainQueueContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2;
  v8[3] = &unk_24E157510;
  objc_copyWeak(&v10, v2);
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  objc_msgSend(v6, "performBlock:", v8);

  objc_destroyWeak(&v10);
}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  NSObject *v27;
  id v28;
  id v29;
  id v30;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "mainQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "setIsRefreshingContent:", 0);

  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "setIsRefreshingForms:", 0);

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "persistentStoreCoordinatorInternal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "persistentStores");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_loadWeakRetained(v2);
  objc_msgSend(v11, "persistentStoreCoordinatorInternal");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLForPersistentStore:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_loadWeakRetained(v2);
  objc_msgSend(v14, "persistentStoreCoordinatorInternal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v15, "removePersistentStore:error:", v10, &v30);
  v16 = v30;

  if (v16)
  {
    Log_5();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_3();

  }
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v18 = objc_claimAutoreleasedReturnValue();
  -[NSObject environment](v18, "environment");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("FBK_UNIT_TEST"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

LABEL_7:
    goto LABEL_12;
  }
  objc_msgSend(*(id *)(a1 + 32), "persistentStoreType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEqualToString:", *MEMORY[0x24BDBB418]);

  if ((v22 & 1) == 0)
  {

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0;
    objc_msgSend(v23, "removeItemAtURL:error:", v13, &v29);
    v16 = v29;

    if (v16)
    {
      Log_5();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_2();
      goto LABEL_7;
    }
  }
LABEL_12:

  v24 = objc_loadWeakRetained(v2);
  v28 = 0;
  v25 = (id)objc_msgSend(v24, "createPersistentStoreError:", &v28);
  v26 = v28;

  if (v26)
  {
    Log_5();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_1();

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)deleteEntityWithRequest:(id)a3 inContext:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v12;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BDBB5E8];
  v7 = a3;
  v8 = (void *)objc_msgSend([v6 alloc], "initWithFetchRequest:", v7);

  v12 = 0;
  v9 = (id)objc_msgSend(v5, "executeRequest:error:", v8, &v12);
  v10 = v12;

  return v10;
}

- (id)persistentStoreCoordinatorURL
{
  void *v2;
  void *v3;

  +[FBKFileManager applicationSupportDirectory](FBKFileManager, "applicationSupportDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("feedback.sqlite"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_logUploadTasks
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "logging all upload tasks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)beginSubmissionForFormResponse:(id)a3 withCollector:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  FBKData *v25;
  id v26;
  id v27;
  int v28;
  char v29;
  _QWORD aBlock[4];
  id v31;
  id v32;
  uint8_t buf[4];
  int v34;
  __int16 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "ID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  v13 = objc_msgSend(v9, "hasFilePromises");
  +[FBKLog clientHandle](FBKLog, "clientHandle");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v34 = v12;
    v35 = 1024;
    v36 = v13;
    _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "user did begin feedback submission for form [%d], has files? [%d]", buf, 0xEu);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCreatedAt:", v15);

  v16 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke;
  aBlock[3] = &unk_24E157380;
  v17 = v8;
  v31 = v17;
  v32 = v10;
  v18 = v10;
  v19 = _Block_copy(aBlock);
  -[FBKData prepareFilerFormForSubmission:](self, "prepareFilerFormForSubmission:", v17);
  v23[0] = v16;
  v23[1] = 3221225472;
  v23[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2;
  v23[3] = &unk_24E15A490;
  v28 = v12;
  v24 = v17;
  v25 = self;
  v29 = v13;
  v26 = v9;
  v27 = v19;
  v20 = v9;
  v21 = v19;
  v22 = v17;
  -[FBKData saveFormResponse:completion:](self, "saveFormResponse:completion:", v22, v23);

}

void __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (!v4 && +[FBKSharedConstants isRunningInFBA](FBKSharedConstants, "isRunningInFBA"))
  {
    objc_msgSend(*(id *)(a1 + 32), "ID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    +[FBKSharedConstants deleteAttachmentLegalTextForDraftID:](FBKSharedConstants, "deleteAttachmentLegalTextForDraftID:", v3);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int8x16_t v12;
  int8x16_t v13;
  _QWORD v14[4];
  int8x16_t v15;
  id v16;
  id v17;
  int v18;
  char v19;
  _QWORD v20[4];
  int8x16_t v21;
  id v22;
  id v23;
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_3;
    v14[3] = &unk_24E15A468;
    v19 = *(_BYTE *)(a1 + 68);
    v18 = *(_DWORD *)(a1 + 64);
    v12 = *(int8x16_t *)(a1 + 32);
    v7 = (id)v12.i64[0];
    v15 = vextq_s8(v12, v12, 8uLL);
    v16 = *(id *)(a1 + 48);
    v17 = *(id *)(a1 + 56);
    objc_msgSend(v6, "performBlockAndWait:", v14);

    v8 = (void *)v15.i64[1];
LABEL_10:

    goto LABEL_11;
  }
  if (!FBKSErrorContainsSP2ErrorCode())
  {
    +[FBKLog clientHandle](FBKLog, "clientHandle");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2_cold_1(a1, v3);

    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_274;
    v20[3] = &unk_24E159E50;
    v13 = *(int8x16_t *)(a1 + 32);
    v11 = (id)v13.i64[0];
    v21 = vextq_s8(v13, v13, 8uLL);
    v23 = *(id *)(a1 + 56);
    v22 = v3;
    objc_msgSend(v10, "performBlockAndWait:", v20);

    v8 = (void *)v21.i64[1];
    goto LABEL_10;
  }
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    v25 = v5;
    _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Failed due to authentication error while submitting response [%i]. FBK will retry with device token", buf, 8u);
  }

LABEL_11:
}

void __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_274(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = a1[4];
  objc_msgSend(a1[5], "uploadTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTask:withSubmissionStage:", v3, 5);

  if (a1[7])
  {
    objc_msgSend(a1[4], "mainQueueContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2_275;
    v5[3] = &unk_24E156FA8;
    v7 = a1[7];
    v6 = a1[6];
    objc_msgSend(v4, "performBlockAndWait:", v5);

  }
}

uint64_t __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2_275(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_3(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  int v5;
  int v7;
  int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 68);
  Log_5();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = *(_DWORD *)(a1 + 64);
      v8 = 67109120;
      v9 = v5;
      _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "form [%i] has files, will begin upload", (uint8_t *)&v8, 8u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "beginFileSubmissionForFilerForm:withCollector:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (v4)
    {
      v7 = *(_DWORD *)(a1 + 64);
      v8 = 67109120;
      v9 = v7;
      _os_log_impl(&dword_21D9A9000, v3, OS_LOG_TYPE_DEFAULT, "no files, making form [%i] as complete", (uint8_t *)&v8, 8u);
    }

    return objc_msgSend(*(id *)(a1 + 32), "markFormResponseComplete:withFiles:collector:completion:", *(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
}

- (void)beginFileSubmissionForFilerForm:(id)a3 withCollector:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  char isKindOfClass;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD aBlock[4];
  id v25;
  id v26;
  FBKData *v27;
  id v28;
  uint8_t buf[4];
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  Log_5();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "filerFormID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109120;
    v30 = objc_msgSend(v12, "intValue");
    _os_log_impl(&dword_21D9A9000, v11, OS_LOG_TYPE_DEFAULT, "beginning file submission with form %d", buf, 8u);

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v14 = MEMORY[0x24BDAC760];
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke;
  aBlock[3] = &unk_24E1571B0;
  v15 = v9;
  v25 = v15;
  v16 = v8;
  v26 = v16;
  v27 = self;
  v17 = v10;
  v28 = v17;
  v18 = _Block_copy(aBlock);
  v19 = v18;
  if ((isKindOfClass & 1) != 0)
  {
    v20[0] = v14;
    v20[1] = 3221225472;
    v20[2] = __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_279;
    v20[3] = &unk_24E15A520;
    v21 = v16;
    v22 = v17;
    v23 = v19;
    -[FBKData markFormResponseComplete:withFiles:collector:completion:](self, "markFormResponseComplete:withFiles:collector:completion:", v21, 1, v15, v20);

  }
  else
  {
    (*((void (**)(void *))v18 + 2))(v18);
  }

}

void __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = (void *)a1[4];
  v2 = (void *)a1[5];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_2;
  v7[3] = &unk_24E15A4F8;
  v4 = v2;
  v5 = a1[6];
  v6 = (void *)a1[7];
  v8 = v4;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v3, "commitAllFilesForForm:withCompletion:", v4, v7);

}

void __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "ded_selectItemsPassingTest:", &__block_literal_global_277);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[FBKSharedConstants tracksFileUploadsLocally](FBKSharedConstants, "tracksFileUploadsLocally"))
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "filerFormID");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v26 = v5;
      _os_log_impl(&dword_21D9A9000, v4, OS_LOG_TYPE_DEFAULT, "Tracking file uploads locally for FilerForm [%{public}@]", buf, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 32), "uploadTask");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addFBKSessionsWithDEDSessions:", v3);

    objc_msgSend(*(id *)(a1 + 32), "filerFormID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "uploadTask");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTaskIdentifier:", v7);

    v9 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "uploadTask");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateTask:withSubmissionStage:", v10, 2);

    objc_msgSend(*(id *)(a1 + 40), "notificationCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "postNotificationName:object:", CFSTR("FBKLocalDataDidChangeNotification"), *(_QWORD *)(a1 + 40));

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v12 = v3;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v21;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v21 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v16);
          objc_msgSend(*(id *)(a1 + 40), "uploadManager", (_QWORD)v20);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setUploadDelegate:", v18);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v14);
    }

    objc_msgSend(*(id *)(a1 + 40), "uploadManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "trackUploadIfNeeded:", *(_QWORD *)(a1 + 32));

  }
  else if (!objc_msgSend(*(id *)(a1 + 32), "filerFormType") && objc_msgSend(v3, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "storeUploadWithFormResponse:bugSessions:", *(_QWORD *)(a1 + 32), v3);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

BOOL __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  objc_msgSend(v2, "filePromises");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  +[FBKLog ded](FBKLog, "ded");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v2, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "did commit session [%{public}@] with [%i] promises", (uint8_t *)&v10, 0x12u);

  }
  if (!v4)
  {
    +[FBKLog ded](FBKLog, "ded");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      _os_log_impl(&dword_21D9A9000, v7, OS_LOG_TYPE_DEFAULT, "session [%{public}@] has no promises, will not track", (uint8_t *)&v10, 0xCu);

    }
  }

  return v4 != 0;
}

void __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_279(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    Log_5();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_279_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)markFormResponseComplete:(id)a3 withFiles:(BOOL)a4 collector:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  _BOOL8 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v29[4];
  id v30;
  FBKData *v31;
  id v32;
  int v33;
  _QWORD v34[4];
  id v35;
  FBKData *v36;
  id v37;
  id v38;
  int v39;
  BOOL v40;
  uint8_t buf[4];
  int v42;
  __int16 v43;
  _BOOL4 v44;
  uint64_t v45;

  v8 = a4;
  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a5;
  v28 = a6;
  +[FBKLog clientHandle](FBKLog, "clientHandle");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "ID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109376;
    v42 = objc_msgSend(v13, "intValue");
    v43 = 1024;
    v44 = v8;
    _os_log_impl(&dword_21D9A9000, v12, OS_LOG_TYPE_DEFAULT, "marking form response [%i] complete with files [%i]", buf, 0xEu);

  }
  objc_msgSend(v10, "ID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "intValue");

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
  v16 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v16;
  if (objc_msgSend(v10, "collectsFiles"))
  {
    v17 = v8;
    -[FBKData addDeviceDataToSubmissionInfo:withCollector:](self, "addDeviceDataToSubmissionInfo:withCollector:", v16, v11);
  }
  else
  {
    +[FBKLog clientHandle](FBKLog, "clientHandle");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      -[FBKData markFormResponseComplete:withFiles:collector:completion:].cold.1();
    v17 = v8;

  }
  -[FBKData api](self, "api");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bugForm");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "ID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke;
  v34[3] = &unk_24E15A468;
  v39 = v15;
  v40 = v17;
  v35 = v10;
  v36 = self;
  v37 = v11;
  v38 = v28;
  v29[0] = v23;
  v29[1] = 3221225472;
  v29[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_7;
  v29[3] = &unk_24E15A598;
  v33 = v15;
  v30 = v35;
  v31 = self;
  v32 = v38;
  v24 = v38;
  v25 = v35;
  v26 = v11;
  objc_msgSend(v19, "markCompleteForFormResponseWithID:bugFormID:withFiles:metadata:success:error:", v20, v22, v17, v27, v34, v29);

}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  int v11;
  char v12;

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2;
  v6[3] = &unk_24E15A468;
  v3 = *(id *)(a1 + 32);
  v11 = *(_DWORD *)(a1 + 64);
  v12 = *(_BYTE *)(a1 + 68);
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(a1 + 48);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v2, "performBlockAndWait:", v6);

}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "setCompleted:", 1);
  +[FBKLog clientHandle](FBKLog, "clientHandle");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109120;
    v32 = v3;
    _os_log_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEFAULT, "did mark form response [%d] complete", buf, 8u);
  }

  if (!*(_BYTE *)(a1 + 68))
  {
    v4 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "uploadTask");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateTask:withSubmissionStage:", v5, 0);

    v6 = *(void **)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "uploadTask");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deleteUploadForTask:completion:", v7, 0);

  }
  v8 = *(id *)(a1 + 48);
  objc_msgSend(v8, "deferredAttachmentCollections");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "anyObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allMatchers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "filePredicate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = *(void **)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "contentItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_282;
      v22[3] = &unk_24E15A570;
      v16 = &v26;
      v17 = *(id *)(a1 + 56);
      v18 = *(_QWORD *)(a1 + 40);
      v26 = v17;
      v22[4] = v18;
      v23 = v8;
      v24 = *(id *)(a1 + 32);
      v25 = v13;
      objc_msgSend(v14, "createEnhancedLoggingFollowupForItem:completion:", v15, v22);

    }
    else
    {
      Log_5();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_cold_1();

      if (!*(_QWORD *)(a1 + 56))
        goto LABEL_15;
      objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v27[0] = MEMORY[0x24BDAC760];
      v27[1] = 3221225472;
      v27[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_281;
      v27[3] = &unk_24E156F80;
      v16 = &v28;
      v28 = *(id *)(a1 + 56);
      objc_msgSend(v21, "performBlockAndWait:", v27);

    }
LABEL_15:

    goto LABEL_16;
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "mainQueueContext");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_280;
    v29[3] = &unk_24E156F80;
    v30 = *(id *)(a1 + 56);
    objc_msgSend(v19, "performBlockAndWait:", v29);

    v13 = v30;
    goto LABEL_15;
  }
LABEL_16:

}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_280(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_281(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_282(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    v9 = *(_QWORD *)(a1 + 40);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_4;
    v12[3] = &unk_24E15A548;
    v10 = *(id *)(a1 + 64);
    v11 = *(_QWORD *)(a1 + 32);
    v16 = v10;
    v12[4] = v11;
    v13 = *(id *)(a1 + 48);
    v14 = v5;
    v15 = *(id *)(a1 + 56);
    +[FBKDEDHelper completeEnhancedLoggingWithFollowup:devicesController:completion:](FBKDEDHelper, "completeEnhancedLoggingWithFollowup:devicesController:completion:", v14, v9, v12);

    v8 = v16;
    goto LABEL_5;
  }
  if (*(_QWORD *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_3;
    v17[3] = &unk_24E156FA8;
    v19 = *(id *)(a1 + 64);
    v18 = v6;
    objc_msgSend(v7, "performBlockAndWait:", v17);

    v8 = v19;
LABEL_5:

  }
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v11 = a2;
  v5 = a3;
  if (v5)
  {
    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = MEMORY[0x24BDAC760];
      v14[1] = 3221225472;
      v14[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_5;
      v14[3] = &unk_24E156FA8;
      v7 = &v16;
      v16 = *(id *)(a1 + 64);
      v15 = v5;
      objc_msgSend(v6, "performBlockAndWait:", v14);

      v8 = v15;
LABEL_6:

    }
  }
  else
  {
    +[FBKEnhancedLoggingPersistence sharedInstance](FBKEnhancedLoggingPersistence, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "contentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "saveSessionForContentItem:followup:filePredicate:devices:", v10, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v11);

    if (*(_QWORD *)(a1 + 64))
    {
      objc_msgSend(*(id *)(a1 + 32), "mainQueueContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_6;
      v12[3] = &unk_24E156F80;
      v7 = &v13;
      v13 = *(id *)(a1 + 64);
      objc_msgSend(v8, "performBlockAndWait:", v12);
      goto LABEL_6;
    }
  }

}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  void *v7;
  id v8;
  int8x16_t v9;
  _QWORD v10[4];
  int8x16_t v11;
  id v12;
  id v13;
  uint8_t buf[4];
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  Log_5();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_7_cold_1();

  if (FBKSErrorContainsSP2ErrorCode())
  {
    Log_5();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_DWORD *)(a1 + 56);
      *(_DWORD *)buf = 67109120;
      v15 = v6;
      _os_log_impl(&dword_21D9A9000, v5, OS_LOG_TYPE_DEFAULT, "Failed due to authentication error while marking response [%i] complete. FBK will retry with device token", buf, 8u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_285;
    v10[3] = &unk_24E159E50;
    v9 = *(int8x16_t *)(a1 + 32);
    v8 = (id)v9.i64[0];
    v11 = vextq_s8(v9, v9, 8uLL);
    v13 = *(id *)(a1 + 48);
    v12 = v3;
    objc_msgSend(v7, "performBlockAndWait:", v10);

  }
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_285(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = a1[4];
  objc_msgSend(a1[5], "uploadTask");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "updateTask:withSubmissionStage:", v3, 7);

  if (a1[7])
  {
    objc_msgSend(a1[4], "mainQueueContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_286;
    v5[3] = &unk_24E156FA8;
    v7 = a1[7];
    v6 = a1[6];
    objc_msgSend(v4, "performBlockAndWait:", v5);

  }
}

uint64_t __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_286(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)beginSubmissionForFollowup:(id)a3 withResponses:(id)a4 didOptOut:(BOOL)a5 withCollector:(id)a6 completion:(id)a7
{
  _BOOL8 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  int v18;
  NSObject *v19;
  _BOOL4 v20;
  id *v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  int v31;
  BOOL v32;
  uint8_t buf[4];
  int v34;
  uint64_t v35;

  v9 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  objc_msgSend(v12, "ID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  v18 = objc_msgSend(v14, "hasFilePromises");
  Log_5();
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      *(_DWORD *)buf = 67109120;
      v34 = v17;
      _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_DEFAULT, "FFU [%i] submission with files", buf, 8u);
    }

    -[FBKData prepareFilerFormForSubmission:](self, "prepareFilerFormForSubmission:", v12);
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke;
    v26[3] = &unk_24E15A5C0;
    v31 = v17;
    v21 = &v30;
    v30 = v15;
    v27 = v12;
    v28 = v13;
    v29 = v14;
    v32 = v9;
    v22 = v15;
    -[FBKData beginFileSubmissionForFilerForm:withCollector:completion:](self, "beginFileSubmissionForFilerForm:withCollector:completion:", v27, v29, v26);

  }
  else
  {
    if (v20)
    {
      *(_DWORD *)buf = 67109120;
      v34 = v17;
      _os_log_impl(&dword_21D9A9000, v19, OS_LOG_TYPE_DEFAULT, "FFU [%i] submission without files", buf, 8u);
    }

    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_288;
    v24[3] = &unk_24E159018;
    v21 = &v25;
    v25 = v15;
    v23 = v15;
    -[FBKData respondToFollowup:withResponses:collector:optingOut:completion:](self, "respondToFollowup:withResponses:collector:optingOut:completion:", v12, v13, v14, v9, v24);
  }

}

void __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  if (v3)
  {
    +[FBKLog ffu](FBKLog, "ffu");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_cold_1();

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    +[FBKData sharedInstance](FBKData, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(unsigned __int8 *)(a1 + 68);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_287;
    v10[3] = &unk_24E159018;
    v9 = *(_QWORD *)(a1 + 48);
    v11 = *(id *)(a1 + 56);
    objc_msgSend(v5, "respondToFollowup:withResponses:collector:optingOut:completion:", v6, v7, v9, v8, v10);

  }
}

uint64_t __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_287(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_288(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)addDeviceDataToSubmissionInfo:(id)a3 withCollector:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[FBKData localDeviceForSubmission](self, "localDeviceForSubmission");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("Unknown");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("from_identifier"));

  if (v7)
  {
    objc_msgSend(v7, "deviceDataForSubmission");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("devices"));
    -[NSObject ded_mapWithBlock:](v12, "ded_mapWithBlock:", &__block_literal_global_296);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    Log_5();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138543362;
      v16 = v13;
      _os_log_impl(&dword_21D9A9000, v14, OS_LOG_TYPE_DEFAULT, "Will send devices: %{public}@", (uint8_t *)&v15, 0xCu);
    }

  }
  else
  {
    Log_5();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[FBKData addDeviceDataToSubmissionInfo:withCollector:].cold.1();
  }

}

uint64_t __55__FBKData_addDeviceDataToSubmissionInfo_withCollector___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("identifier"));
}

- (id)localDeviceForSubmission
{
  void *v2;
  void *v3;

  +[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "thisDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)deleteFilePromiseWithUUID:(id)a3 object:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[FBKData api](self, "api");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke;
  v15[3] = &unk_24E15A650;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  objc_msgSend(v11, "deleteFilePromiseWithUUID:completion:", v13, v15);

}

void __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v3 = a2;
  objc_msgSend(a1[4], "mainQueueContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2;
  v7[3] = &unk_24E15A628;
  v8 = v3;
  v9 = a1[5];
  v10 = v4;
  v11 = a1[6];
  v12 = a1[7];
  v5 = v4;
  v6 = v3;
  objc_msgSend(v5, "performBlock:", v7);

}

uint64_t __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2(_QWORD *a1)
{
  void **v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v10;

  if (a1[4])
    return (*(uint64_t (**)(void))(a1[8] + 16))();
  v2 = (void **)(a1 + 5);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = (uint64_t)&unk_24E18CCB0;
    v4 = *v2;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      Log_5();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2_cold_2();

      goto LABEL_10;
    }
    v4 = *v2;
    v3 = 14;
  }
  objc_msgSend(v4, "setStatusEnum:", v3);
LABEL_10:
  v6 = (void *)a1[6];
  v10 = 0;
  objc_msgSend(v6, "save:", &v10);
  v7 = v10;
  if (v7)
  {
    Log_5();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2_cold_1();

  }
  return (*(uint64_t (**)(void))(a1[8] + 16))();
}

- (NSManagedObjectContext)mainQueueContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 16, 1);
}

- (NSManagedObjectContext)privateQueueContext
{
  return (NSManagedObjectContext *)objc_getProperty(self, a2, 24, 1);
}

- (FBKLoginManager)loginManager
{
  return self->_loginManager;
}

- (void)setLoginManager:(id)a3
{
  objc_storeStrong((id *)&self->_loginManager, a3);
}

- (FBKSeedPortalAPI)api
{
  return self->_api;
}

- (void)setApi:(id)a3
{
  objc_storeStrong((id *)&self->_api, a3);
}

- (NSNotificationCenter)notificationCenter
{
  return self->_notificationCenter;
}

- (void)setNotificationCenter:(id)a3
{
  objc_storeStrong((id *)&self->_notificationCenter, a3);
}

- (BOOL)isRefreshingContent
{
  return self->_isRefreshingContent;
}

- (void)setIsRefreshingContent:(BOOL)a3
{
  self->_isRefreshingContent = a3;
}

- (BOOL)isRefreshingForms
{
  return self->_isRefreshingForms;
}

- (void)setIsRefreshingForms:(BOOL)a3
{
  self->_isRefreshingForms = a3;
}

- (FBKUser)currentUser
{
  return self->_currentUser;
}

- (void)setCurrentUser:(id)a3
{
  objc_storeStrong((id *)&self->_currentUser, a3);
}

- (NSArray)pendingConsents
{
  return self->_pendingConsents;
}

- (void)setPendingConsents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingConsents, a3);
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinatorInternal
{
  return self->_persistentStoreCoordinatorInternal;
}

- (void)setPersistentStoreCoordinatorInternal:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinatorInternal, a3);
}

- (id)formReloadCompletion
{
  return self->_formReloadCompletion;
}

- (void)setFormReloadCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)hasFinishedFirstLoad
{
  return self->_hasFinishedFirstLoad;
}

- (void)setHasFinishedFirstLoad:(BOOL)a3
{
  self->_hasFinishedFirstLoad = a3;
}

- (BOOL)fetchedAFormByTat
{
  return self->_fetchedAFormByTat;
}

- (void)setFetchedAFormByTat:(BOOL)a3
{
  self->_fetchedAFormByTat = a3;
}

- (void)setUploadManager:(id)a3
{
  objc_storeStrong((id *)&self->_uploadManager, a3);
}

- (BOOL)isRefreshingTeams
{
  return self->_isRefreshingTeams;
}

- (void)setIsRefreshingTeams:(BOOL)a3
{
  self->_isRefreshingTeams = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uploadManager, 0);
  objc_storeStrong(&self->_formReloadCompletion, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinatorInternal, 0);
  objc_storeStrong((id *)&self->_pendingConsents, 0);
  objc_storeStrong((id *)&self->_currentUser, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_api, 0);
  objc_storeStrong((id *)&self->_loginManager, 0);
  objc_storeStrong((id *)&self->_privateQueueContext, 0);
  objc_storeStrong((id *)&self->_mainQueueContext, 0);
}

- (void)storeUploadWithFormResponse:(id)a3 bugSessions:(id)a4
{
  char *v6;
  FBKData *v7;

  sub_21DA6CCD8();
  sub_21DA6CD14();
  sub_21DAC49D8();
  v6 = (char *)a3;
  v7 = self;
  sub_21DA6CD5C(v6);

  swift_bridgeObjectRelease();
}

- (void)refreshTeamsWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (*v7)();
  FBKData *v8;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v5;
    v7 = sub_21DA3C198;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  v8 = self;
  sub_21DA9F7E0((uint64_t)v7, v6);
  sub_21DA589F8((uint64_t)v7);

}

- (void)promoteFeedback:(id)a3 toTeam:(id)a4 completion:(id)a5
{
  uint64_t (*v7)();
  unint64_t v8;
  uint64_t v9;
  id v10;
  FBKData *v11;

  v7 = (uint64_t (*)())_Block_copy(a5);
  sub_21DA3BF58(0, &qword_255398F00);
  v8 = sub_21DAC496C();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = sub_21DA3C198;
  }
  else
  {
    v9 = 0;
  }
  v10 = a4;
  v11 = self;
  sub_21DAA0040(v8, v10, (uint64_t)v7, v9);
  sub_21DA589F8((uint64_t)v7);

  swift_bridgeObjectRelease();
}

- (void)demoteFeedback:(id)a3 completion:(id)a4
{
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t (*v8)();
  FBKData *v9;

  v5 = _Block_copy(a4);
  sub_21DA3BF58(0, &qword_255398F00);
  v6 = sub_21DAC496C();
  if (v5)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v5;
    v8 = sub_21DA3C198;
  }
  else
  {
    v8 = 0;
    v7 = 0;
  }
  v9 = self;
  sub_21DAA0650(v6, (uint64_t)v8, v7);
  sub_21DA589F8((uint64_t)v8);

  swift_bridgeObjectRelease();
}

- (void)refreshParticipantsWithTeam:(id)a3 completion:(id)a4
{
  uint64_t (*v6)();
  uint64_t v7;
  id v8;
  FBKData *v9;

  v6 = (uint64_t (*)())_Block_copy(a4);
  if (v6)
  {
    v7 = swift_allocObject();
    *(_QWORD *)(v7 + 16) = v6;
    v6 = sub_21DA3C198;
  }
  else
  {
    v7 = 0;
  }
  v8 = a3;
  v9 = self;
  sub_21DAA12D0(v8, (uint64_t)v6, v7);
  sub_21DA589F8((uint64_t)v6);

}

- (void)assignFeedback:(id)a3 toParticipant:(id)a4 completion:(id)a5
{
  void (*v7)(id);
  unint64_t v8;
  uint64_t v9;
  id v10;
  FBKData *v11;

  v7 = (void (*)(id))_Block_copy(a5);
  sub_21DA3BF58(0, &qword_255398F00);
  v8 = sub_21DAC496C();
  if (v7)
  {
    v9 = swift_allocObject();
    *(_QWORD *)(v9 + 16) = v7;
    v7 = (void (*)(id))sub_21DA3B9EC;
  }
  else
  {
    v9 = 0;
  }
  v10 = a4;
  v11 = self;
  sub_21DAA2448(v8, v10, v7, v9);
  sub_21DA589F8((uint64_t)v7);

  swift_bridgeObjectRelease();
}

void __25__FBKData_sharedInstance__block_invoke_cold_1(NSObject *a1)
{
  void *v2;
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  +[FBKFileManager applicationSupportDirectory](FBKFileManager, "applicationSupportDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_27(&dword_21D9A9000, a1, OS_LOG_TYPE_DEBUG, "FBK App Support Dir: %@", v4);

  OUTLINED_FUNCTION_5_2();
}

void __48__FBKData_didLogInWithLoginUserInfo_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Found invalid user, will reset all data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)fetchFormItemByTat:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Handling form item fetch by tat. Will run after load", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_21D9A9000, v0, v1, "Nil private queue context. Cannot load data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_21D9A9000, v0, v1, "Failed to save load form item from main queue context. Cannot load data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __68__FBKData_feedbackFrameworkLoadDataWithFormTat_orFormID_completion___block_invoke_cold_3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_21D9A9000, v0, OS_LOG_TYPE_FAULT, "Failed to save private queue context. Cannot load data. [%{public}@]", v1, 0xCu);
  OUTLINED_FUNCTION_7();
}

- (void)reloadDataSkippingContentItems:reloadsTeams:formTat:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "no currentUser in FBKData, cannot continue.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __74__FBKData_reloadDataSkippingContentItems_reloadsTeams_formTat_completion___block_invoke_92_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_17(&dword_21D9A9000, v0, v1, "FBKTimeIntervalEvent is nil. Cannot track reload event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_reloadItems:(uint64_t)a3 retryCount:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, a1, a3, "[%{public}s reached max retry count", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)deleteTargetedSurveyItemFromInboxIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Nil targeted survey ContentItem. Cannot delete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deleteTargetedSurveyItemFromInboxIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Not targeted survey. Will not delete content item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)deleteTargetedSurveyItemFromInboxIfNeeded:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Not running in FBA. No need to delete survey content item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__FBKData_deleteTargetedSurveyItemFromInboxIfNeeded___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_23(&dword_21D9A9000, v0, v1, "[%{public}s] failed to save [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_refreshFormItemsForTeam:formTat:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_25();
  OUTLINED_FUNCTION_23(&dword_21D9A9000, v0, v1, "[%{public}s] using form tat [%{public}@]", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_7();
}

void __59__FBKData__refreshFormItemsForTeam_formTat_withCompletion___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to refresh bug forms with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to save after purging orphaned entities: [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to fetch Participants to remove: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to fetch FileMatchers to purge: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to fetch FilePredicates to purge: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __32__FBKData_purgeOrphanedEntities__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to fetch ContentItems to purge: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __44__FBKData_refreshUnreadCountWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to refresh unread count with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __42__FBKData_updateResolversForLocalBugForms__block_invoke_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_27(&dword_21D9A9000, v0, OS_LOG_TYPE_DEBUG, "Error saving local resolver updates: %@", v1);
  OUTLINED_FUNCTION_7();
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19(v2, v3);
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v4, v5, "failed to save while refreshing form [%i] with error %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5_2();
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_4_cold_1(id *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19(v2, v3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v4, v5, "Failed to save after fetching form with ID [%i]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __84__FBKData_refreshBugFormWithID_fromStub_forTeam_requestPlugIns_appToken_completion___block_invoke_154_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v1, v2, "Could not update Form [%d]: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v1, v2, "API failed to refresh bug form when creating new response for form [%i]", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

void __91__FBKData__newFormResponseForBugFormID_formStub_inTeam_requestPlugIns_appToken_completion___block_invoke_5_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v1, v2, "API failed to create new response for form [%i]", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "Error saving form response: %{public}@", v5);

  OUTLINED_FUNCTION_2_1();
}

void __52__FBKData_refreshFormResponseOnlyWithID_completion___block_invoke_2_161_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v1, v2, "Error fetching formResponse (refreshFormResponseOnly) with ID [%d] %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v1, v2, "Error fetching formResponse with ID [%d] %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_2_164_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*(id *)(a1 + 32), "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19(v2, v3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v4, v5, "Could not find matching item for response [%i]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __60__FBKData_refreshFormResponseWithID_contentItem_completion___block_invoke_165_cold_1(void *a1, id *a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  _DWORD v8[6];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "ID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  objc_msgSend(*a2, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 67109378;
  v8[1] = v6;
  OUTLINED_FUNCTION_22();
  _os_log_error_impl(&dword_21D9A9000, a3, OS_LOG_TYPE_ERROR, "Error fetching Bug Form with ID=%d: %{public}@", (uint8_t *)v8, 0x12u);

  OUTLINED_FUNCTION_5_2();
}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_2_cold_1()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_16();
  objc_msgSend(*v0, "intValue");
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v1, v2, "Failed to save after deleting draft with id [%i] with error: %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __60__FBKData_deleteDraftFromContentItem_shouldSave_completion___block_invoke_178_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v1, v2, "Deleting draft with ID [%i] failed", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

void __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_16();
  objc_msgSend((id)OUTLINED_FUNCTION_20(v1), "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21(v2, v3);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v4, v5, "Failed to delete item [%i] with error [%@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_2();
}

void __51__FBKData_deleteDraftsFromContentItems_completion___block_invoke_180_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to save after bulk deleting drafts with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __39__FBKData_saveFormResponse_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Local FR save failed with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __39__FBKData_saveFormResponse_completion___block_invoke_2_192_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8_0(&dword_21D9A9000, v0, v1, "Remote FR save failed [%i]", v2);
  OUTLINED_FUNCTION_1();
}

void __44__FBKData_formResponseStubForID_completion___block_invoke_2_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v1, v2, "Fetching form response stub failed for ID [%d].", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

- (void)refreshFormResponseStubFromContentItem:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "ID");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unsignedIntValue");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v2, v3, "Draft item [%u] is deleted. Cannot refresh FormResponseStub.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(*(id *)(a1 + 48), "intValue");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v1, v2, "Updating form response stub failed for Form Response ID [%d].", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Item to FormResponseStub relationship is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_3_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "FormResponseStub to Item relationship is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_197_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Failed to fetch Feedback for FormResponseStub loading: Error [Cannot find Form Response ID]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__FBKData_refreshFormResponseStubFromContentItem_completion___block_invoke_197_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to fetch Feedback for FormResponseStub loading: Error [%@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __50__FBKData_bugFormFromForDraftItem_withCompletion___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v2;
  void *v5;
  const char *v6;
  int v7;
  void *v8;
  const char *v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;

  objc_msgSend((id)OUTLINED_FUNCTION_20((uint64_t)a1), "formID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = OUTLINED_FUNCTION_21(v5, v6);
  objc_msgSend(a1[4], "ID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 67109376;
  v10[1] = v7;
  v11 = 1024;
  v12 = OUTLINED_FUNCTION_19(v8, v9);
  _os_log_error_impl(&dword_21D9A9000, a2, OS_LOG_TYPE_ERROR, "Failed to refresh form [%i] for item [%i]", (uint8_t *)v10, 0xEu);

  OUTLINED_FUNCTION_5_2();
}

- (void)fetchFeedbackStatusForFeedback:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Requested feedback status but feedback is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __53__FBKData_fetchFeedbackStatusForFeedback_completion___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend((id)OUTLINED_FUNCTION_20(a1), "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21(v2, v3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v4, v5, "Updating status failed for Feedback [%{public}d]. Error: [%{public}@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_2();
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v0);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v1, v2, "Update Survey [%i] failed with error %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __59__FBKData_refreshSurveyFromContentItem_forTeam_completion___block_invoke_5_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_16();
  objc_msgSend((id)OUTLINED_FUNCTION_20(v1), "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21(v2, v3);
  OUTLINED_FUNCTION_1_4();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v4, v5, "failed to refresh Feedback with ID [%i] error %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_2();
}

void __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19(v2, v3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v4, v5, "Could not find matching item for feedback with id [%i]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __60__FBKData__didGetFeedback_error_withContentItem_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Save error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __66__FBKData_getFormResponseStubForFeedback_forceRefresh_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "No FR stub was found for feedback, but also no error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__FBKData_getFeedbackFollowupForFeedback_atIndex_completion___block_invoke_210_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "No feedback followup was found for feedback, but also no error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __42__FBKData_updateTask_withSubmissionStage___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "UploadTask MOC save failed with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __42__FBKData_deleteUploadForTask_completion___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_4(&dword_21D9A9000, a4, a3, "upload task: %{public}@ failed to delete enclosing directory with error: %{public}@", (uint8_t *)a3);

}

void __42__FBKData_deleteUploadForTask_completion___block_invoke_211_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_16();
  objc_msgSend(*(id *)(v1 + 48), "intValue");
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)v0 + 8) + 40), "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v3, v4, "Error deleting upload task: %d error: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_5_2();
}

- (void)clearUploadTasksWithIdentifier:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _DWORD *v3;
  uint8_t *v4;
  void *v5;
  int v6;

  objc_msgSend((id)OUTLINED_FUNCTION_6(a1, a2), "taskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");
  *(_DWORD *)v4 = 67109120;
  *v3 = v6;
  _os_log_debug_impl(&dword_21D9A9000, v2, OS_LOG_TYPE_DEBUG, "deleting upload task with identifier [%i]", v4, 8u);

  OUTLINED_FUNCTION_8();
}

- (void)clearUploadTasksWithIdentifier:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Fetch request for clearing existing tasks failed with error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)allActiveUploadTasksInContext:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "did not find any upload tasks, done.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)allActiveUploadTasksInContext:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "found upload tasks", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)allActiveUploadTasksInContext:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v4, "failed to fetch Upload Tasks with error : %{public}@", v5);

  OUTLINED_FUNCTION_2_1();
}

- (void)getFileDownloadURLForFilePromise:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "FilePromise or FilePromise UUID was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__FBKData_getFileDownloadURLForFilePromise_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "File download errored out: %{public}@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)createFeedbackFollowupOfType:forItem:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Tried to add an unsolicited follow-up to item without FormResponse ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)createFeedbackFollowupOfType:forItem:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Tried to add an unsolicited follow-up to item without Feedback ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)createFeedbackFollowupOfType:forItem:completion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Tried to add an unsolicited follow-up to non Feedback type content item", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Error saving: [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __59__FBKData_createFeedbackFollowupOfType_forItem_completion___block_invoke_2_232_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend((id)OUTLINED_FUNCTION_20(a1), "unsignedIntValue");
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v1, v2, "Could not create FFU on FR [%u] type [%lu]", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

void __74__FBKData_respondToFollowup_withResponses_collector_optingOut_completion___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  objc_msgSend((id)OUTLINED_FUNCTION_20(a1), "unsignedIntegerValue");
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_1(&dword_21D9A9000, a2, v3, "Could not send response for followup [%lu]", v4);
  OUTLINED_FUNCTION_2_1();
}

- (void)deleteUnsolicitedFollowup:withFeedbackItem:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "tried to delete ffu with nil FR ID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Also failed to delete FFU locally: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __65__FBKData_deleteUnsolicitedFollowup_withFeedbackItem_completion___block_invoke_5_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "failed to delete ffu server side with error: [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __57__FBKData_refreshAnnouncementFromContentItem_completion___block_invoke_3_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*(id *)(a1 + 32), "ID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_19(v2, v3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v4, v5, "Update announcement [%i] failed", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __43__FBKData_markAnnouncementRead_completion___block_invoke_4_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_15(a1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_5_3(&dword_21D9A9000, v1, v2, "Announcement [%d] acknowledgement failed.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_7();
}

void __63__FBKData_recordConsentResponseForConsent_response_completion___block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Error recording consent: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)destroyPersistentStoreWithUrl:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Error scrubbing outdated local store.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __29__FBKData_managedObjectModel__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "Failed to create managed object model.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to add persistent store: [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to remove persistent store URL: [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __43__FBKData_resetAllLocalDataWithCompletion___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Failed to remove persistent store: [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __67__FBKData_beginSubmissionForFormResponse_withCollector_completion___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "localizedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v3, v4, "Error saving form response [%d]: %{public}@", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_5_2();
}

void __68__FBKData_beginFileSubmissionForFilerForm_withCollector_completion___block_invoke_279_cold_1()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_16();
  objc_msgSend((id)OUTLINED_FUNCTION_20(v1), "filerFormID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_21(v2, v3);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_0_5(&dword_21D9A9000, v4, v5, "Failed to mark answers complete on [%i] with error [%{public}@]", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_5_2();
}

- (void)markFormResponseComplete:withFiles:collector:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2(&dword_21D9A9000, v0, v1, "Surveys do not save device info", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8_0(&dword_21D9A9000, v0, v1, "Failed to start EL session because configuration file predicate was not found. formID [%i]", v2);
  OUTLINED_FUNCTION_1();
}

void __67__FBKData_markFormResponseComplete_withFiles_collector_completion___block_invoke_7_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8_0(&dword_21D9A9000, v0, v1, "Failed to mark FR [%i] completed", v2);
  OUTLINED_FUNCTION_1();
}

void __87__FBKData_beginSubmissionForFollowup_withResponses_didOptOut_withCollector_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[8];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_28();
  OUTLINED_FUNCTION_8_0(&dword_21D9A9000, v0, v1, "error on begin file submission for FFU [%i]", v2);
  OUTLINED_FUNCTION_1();
}

- (void)addDeviceDataToSubmissionInfo:withCollector:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21D9A9000, v0, v1, "No collector given. Cannot build device data.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5_0();
  v3 = 2114;
  v4 = v0;
  OUTLINED_FUNCTION_4(&dword_21D9A9000, v1, (uint64_t)v1, "Failed to save file promise [%{public}@] with error [%{public}@]", v2);
  OUTLINED_FUNCTION_7();
}

void __55__FBKData_deleteFilePromiseWithUUID_object_completion___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1_2(&dword_21D9A9000, v0, v1, "Unknown type sent. Cannot update file promise [%{public}@]", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
