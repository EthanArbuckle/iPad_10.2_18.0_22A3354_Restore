@implementation VSSubscriptionPersistentContainer

- (VSSubscriptionPersistentContainer)init
{
  VSSubscriptionPersistentContainer *v2;
  NSOperationQueue *v3;
  NSOperationQueue *migrationQueue;
  VSOptional *v5;
  VSOptional *viewContext;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSSubscriptionPersistentContainer;
  v2 = -[VSSubscriptionPersistentContainer init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    migrationQueue = v2->_migrationQueue;
    v2->_migrationQueue = v3;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_migrationQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setName:](v2->_migrationQueue, "setName:", CFSTR("com.apple.VideoSubscriberAccount.SubscriptionMigration"));
    v5 = objc_alloc_init(VSOptional);
    viewContext = v2->_viewContext;
    v2->_viewContext = v5;

  }
  return v2;
}

- (NSString)persistentStoreType
{
  NSString *v2;

  v2 = self->_persistentStoreType;
  if (!v2)
    v2 = (NSString *)(id)*MEMORY[0x1E0C979E8];
  return v2;
}

- (NSURL)persistentStoreURL
{
  NSURL *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self->_persistentStoreURL;
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v3, "URLsForDirectory:inDomains:", 14, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("videosubscriptionsd"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("VSSubscriptions.sqlite"), 0);
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to determine persistent store URL."));
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The persistentStoreURL parameter must not be nil."));
      v2 = 0;
    }
  }
  return v2;
}

- (NSURL)subscriptionsPropertyListURL
{
  NSURL *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self->_subscriptionsPropertyListURL;
  if (!v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    objc_msgSend(v3, "URLsForDirectory:inDomains:", 14, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.spotlight"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("subscriptions.plist"), 0);
    v2 = (NSURL *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to determine subscription plist URL."));
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The subscriptionsPropertyListURL parameter must not be nil."));
      v2 = 0;
    }
  }
  return v2;
}

- (void)_removePersistentStore
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke;
  v2[3] = &unk_1E939EDB8;
  v2[4] = self;
  -[VSSubscriptionPersistentContainer performBlockAndWait:](self, "performBlockAndWait:", v2);
}

void __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "didSetupPersistence"))
    objc_msgSend(v3, "unwrapObject:error:", &__block_literal_global_42, &__block_literal_global_25);

}

uint64_t __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "vs_removeAllPersistentStores");
}

void __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  VSErrorLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke_3_cold_1();

}

- (BOOL)_setupPersistenceIfNeeded:(id *)a3
{
  BOOL v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _UNKNOWN **v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  NSObject *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSPersistentStoreCoordinator *v27;
  NSPersistentStoreCoordinator *persistentStoreCoordinator;
  uint64_t v29;
  NSPersistentStoreCoordinator *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  char v60;
  uint8_t buf[16];
  uint64_t v62;
  _QWORD v63[3];

  v63[1] = *MEMORY[0x1E0C80C00];
  if (!-[VSSubscriptionPersistentContainer didSetupPersistence](self, "didSetupPersistence"))
  {
    v49 = a3;
    VSDefaultLogObject();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D2419000, v6, OS_LOG_TYPE_DEFAULT, "Will setup persistence.", buf, 2u);
    }

    v7 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    -[VSSubscriptionPersistentContainer subscriptionsPropertyListURL](self, "subscriptionsPropertyListURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSubscriptionPersistentContainer persistentStoreURL](self, "persistentStoreURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C97B98], "vs_subscriptionModelForVersion:", 3);
    v10 = objc_claimAutoreleasedReturnValue();
    -[VSSubscriptionPersistentContainer persistentStoreType](self, "persistentStoreType");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v8;
    objc_msgSend(v8, "path");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    if (v11 && v12)
    {
      v14 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to obtain path for sqlite or plist stores."));
      if (!v11)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The sqlitePathOrNil parameter must not be nil."));
      v15 = v11;
      if (!v13)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The plistPathOrNil parameter must not be nil."));
    }
    v55 = v13;
    objc_msgSend(v9, "URLByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unable to determine container for SQL store."));
    v17 = &off_1E939D000;
    v51 = v16;
    objc_msgSend(v16, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "forceUnwrapObject");
    v20 = objc_claimAutoreleasedReturnValue();

    v60 = 0;
    v50 = (void *)v20;
    if ((objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v20, &v60) & 1) != 0)
    {
      if (v60)
      {
        v21 = 0;
        goto LABEL_26;
      }
      VSErrorLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:].cold.4(v24);
      v21 = 0;
    }
    else
    {
      VSDefaultLogObject();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D2419000, v22, OS_LOG_TYPE_DEFAULT, "Will create container directory.", buf, 2u);
      }

      v59 = 0;
      v23 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v20, 1, 0, &v59);
      v21 = v59;
      if ((v23 & 1) != 0)
      {
LABEL_26:
        v52 = (void *)v10;
        if (!objc_msgSend(v7, "fileExistsAtPath:", v55)
          || (objc_msgSend(v7, "fileExistsAtPath:", v11) & 1) != 0
          || -[VSSubscriptionPersistentContainer skipMigration](self, "skipMigration"))
        {
          VSDefaultLogObject();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2419000, v25, OS_LOG_TYPE_DEFAULT, "Did NOT migrate plist data.", buf, 2u);
          }
        }
        else
        {
          VSDefaultLogObject();
          v37 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2419000, v37, OS_LOG_TYPE_DEFAULT, "Will migrate plist data.", buf, 2u);
          }

          objc_msgSend(MEMORY[0x1E0C97B98], "vs_subscriptionModelForVersion:", 0);
          v25 = objc_claimAutoreleasedReturnValue();
          v58 = v21;
          objc_msgSend(MEMORY[0x1E0C97BA0], "inferredMappingModelForSourceModel:destinationModel:error:", v25, v10, &v58);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v58;

          if (!v31)
          {
            VSErrorLogObject();
            v45 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
              -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:].cold.2();

            v5 = 0;
            if (v49)
              *v49 = objc_retainAutorelease(v38);
            v21 = v38;
            goto LABEL_39;
          }
          v39 = v38;
          v47 = v38;
          v40 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97BB0]), "initWithSourceModel:destinationModel:", v25, v10);
          VSSubscriptionPropertyListStoreType();
          v41 = objc_claimAutoreleasedReturnValue();
          v62 = *MEMORY[0x1E0C97998];
          v63[0] = MEMORY[0x1E0C9AAB0];
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, &v62, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v39;
          v48 = v40;
          v43 = (void *)v41;
          LODWORD(v40) = objc_msgSend(v40, "migrateStoreFromURL:type:options:withMappingModel:toDestinationURL:destinationType:destinationOptions:error:", v53, v41, v42, v31, v9, v54, 0, &v57);
          v21 = v57;

          if (!(_DWORD)v40)
          {
            VSErrorLogObject();
            v46 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:].cold.3();

            if (v49)
              *v49 = objc_retainAutorelease(v21);

            v5 = 0;
            goto LABEL_39;
          }
          VSDefaultLogObject();
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2419000, v44, OS_LOG_TYPE_DEFAULT, "Migration of plist data completed successfully.", buf, 2u);
          }

          v10 = (uint64_t)v52;
          v17 = &off_1E939D000;
        }
        v26 = v21;

        v27 = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97C00]), "initWithManagedObjectModel:", v10);
        persistentStoreCoordinator = self->_persistentStoreCoordinator;
        self->_persistentStoreCoordinator = v27;

        v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v29 = MEMORY[0x1E0C9AAB0];
        -[NSObject setObject:forKey:](v25, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C97868]);
        -[NSObject setObject:forKey:](v25, "setObject:forKey:", v29, *MEMORY[0x1E0C978D0]);
        v30 = self->_persistentStoreCoordinator;
        v56 = v21;
        -[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v30, "addPersistentStoreWithType:configuration:URL:options:error:", v54, 0, v9, v25, &v56);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v56;

        v5 = v31 != 0;
        if (v31)
        {
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B88]), "initWithConcurrencyType:", 1);
          objc_msgSend(v32, "setPersistentStoreCoordinator:", self->_persistentStoreCoordinator);
          objc_msgSend(v17[263], "optionalWithObject:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[VSSubscriptionPersistentContainer setViewContext:](self, "setViewContext:", v33);

          -[VSSubscriptionPersistentContainer setDidSetupPersistence:](self, "setDidSetupPersistence:", 1);
          VSDefaultLogObject();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D2419000, v34, OS_LOG_TYPE_DEFAULT, "Did setup persistence.", buf, 2u);
          }

        }
        else
        {
          VSErrorLogObject();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:].cold.1();

          if (v49)
            *v49 = objc_retainAutorelease(v21);
        }
LABEL_39:

        return v5;
      }
      VSErrorLogObject();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        -[VSSubscriptionPersistentContainer _setupPersistenceIfNeeded:].cold.5();
    }

    goto LABEL_26;
  }
  return 1;
}

- (void)_performBlock:(id)a3 andWait:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  BOOL v12;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D8236758]();
  -[VSSubscriptionPersistentContainer migrationQueue](self, "migrationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke;
  v10[3] = &unk_1E93A0BC0;
  v10[4] = self;
  v12 = v4;
  v9 = v6;
  v11 = v9;
  objc_msgSend(v8, "addOperationWithBlock:", v10);
  if (v4)
    objc_msgSend(v8, "waitUntilAllOperationsAreFinished");

  objc_autoreleasePoolPop(v7);
}

void __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  id *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  void *v16;
  id v17;
  _QWORD v18[4];
  void *v19;
  id v20;
  id v21;

  v2 = (void *)MEMORY[0x1D8236758]();
  v3 = *(void **)(a1 + 32);
  v21 = 0;
  v4 = objc_msgSend(v3, "_setupPersistenceIfNeeded:", &v21);
  v5 = v21;
  v6 = v5;
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "viewContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "forceUnwrapObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_BYTE *)(a1 + 48))
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke_2;
      v18[3] = &unk_1E939F1A8;
      v9 = &v20;
      v10 = *(id *)(a1 + 40);
      v11 = &v19;
      v19 = v8;
      v20 = v10;
      objc_msgSend(v8, "performBlockAndWait:", v18);
    }
    else
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke_3;
      v15[3] = &unk_1E939F1A8;
      v9 = &v17;
      v14 = *(id *)(a1 + 40);
      v11 = &v16;
      v16 = v8;
      v17 = v14;
      objc_msgSend(v8, "performBlock:", v15);
    }

    v13 = *v9;
  }
  else
  {
    if (!v5)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The errorOrNil parameter must not be nil."));
    v12 = *(_QWORD *)(a1 + 40);
    v13 = v6;
    +[VSFailable failableWithError:](VSFailable, "failableWithError:", v13);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v12 + 16))(v12, v8);
  }

  objc_autoreleasePoolPop(v2);
}

void __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

void __59__VSSubscriptionPersistentContainer__performBlock_andWait___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  +[VSFailable failableWithObject:](VSFailable, "failableWithObject:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

- (void)performBlock:(id)a3
{
  -[VSSubscriptionPersistentContainer _performBlock:andWait:](self, "_performBlock:andWait:", a3, 0);
}

- (void)performBlockAndWait:(id)a3
{
  -[VSSubscriptionPersistentContainer _performBlock:andWait:](self, "_performBlock:andWait:", a3, 1);
}

- (NSOperationQueue)migrationQueue
{
  return self->_migrationQueue;
}

- (void)setMigrationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_migrationQueue, a3);
}

- (BOOL)didSetupPersistence
{
  return self->_didSetupPersistence;
}

- (void)setDidSetupPersistence:(BOOL)a3
{
  self->_didSetupPersistence = a3;
}

- (NSPersistentStoreCoordinator)persistentStoreCoordinator
{
  return self->_persistentStoreCoordinator;
}

- (void)setPersistentStoreCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, a3);
}

- (VSOptional)viewContext
{
  return self->_viewContext;
}

- (void)setViewContext:(id)a3
{
  objc_storeStrong((id *)&self->_viewContext, a3);
}

- (BOOL)skipMigration
{
  return self->_skipMigration;
}

- (void)setSkipMigration:(BOOL)a3
{
  self->_skipMigration = a3;
}

- (void)setPersistentStoreType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setPersistentStoreURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setSubscriptionsPropertyListURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionsPropertyListURL, 0);
  objc_storeStrong((id *)&self->_persistentStoreURL, 0);
  objc_storeStrong((id *)&self->_persistentStoreType, 0);
  objc_storeStrong((id *)&self->_viewContext, 0);
  objc_storeStrong((id *)&self->_persistentStoreCoordinator, 0);
  objc_storeStrong((id *)&self->_migrationQueue, 0);
}

void __59__VSSubscriptionPersistentContainer__removePersistentStore__block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error unwrapping context: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupPersistenceIfNeeded:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Error adding persistent store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupPersistenceIfNeeded:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to infer mapping model: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupPersistenceIfNeeded:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to migrate store: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_setupPersistenceIfNeeded:(os_log_t)log .cold.4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D2419000, log, OS_LOG_TYPE_ERROR, "Container file exists, but is not a directory.", v1, 2u);
}

- (void)_setupPersistenceIfNeeded:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2(&dword_1D2419000, v0, v1, "Unable to create container directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
