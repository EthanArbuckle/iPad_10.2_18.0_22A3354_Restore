@implementation CALNPersistentNotificationStorage

+ (id)persistentNotificationStorageWithPath:(id)a3 isProtectedStorage:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:isProtectedStorage:", v6, v4);
  objc_msgSend(v7, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke;
  v14[3] = &unk_24D484760;
  v15 = v6;
  v9 = v7;
  v16 = v9;
  v10 = v6;
  dispatch_sync(v8, v14);

  v11 = v16;
  v12 = v9;

  return v12;
}

void __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t *v3;
  uint64_t v4;
  int v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  char v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  v3 = (uint64_t *)(a1 + 32);
  v5 = objc_msgSend(v2, "fileExistsAtPath:", v4);

  v6 = (void *)v3[1];
  if (v5)
  {
    v17 = 0;
    v7 = objc_msgSend(v6, "_loadNotificationsWithError:", &v17);
    v8 = v17;
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if ((v7 & 1) != 0)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v11 = *v3;
        *(_DWORD *)buf = 138543362;
        v19 = v11;
        v12 = "Persistent notification storage file loaded from path %{public}@.";
LABEL_8:
        _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke_cold_1(v3);
    }
  }
  else
  {
    v16 = 0;
    v13 = objc_msgSend(v6, "_saveNotificationsWithError:", &v16);
    v8 = v16;
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    v10 = v14;
    if ((v13 & 1) != 0)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = *v3;
        *(_DWORD *)buf = 138543362;
        v19 = v15;
        v12 = "Notification storage file did not exist at path = %{public}@. Created a new file.";
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke_cold_2(v3);
    }
  }

}

+ (id)notificationRecordsFromPersistentNotificationStorageWithPath:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v5 = notificationRecordsFromPersistentNotificationStorageWithPath_error__onceToken;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&notificationRecordsFromPersistentNotificationStorageWithPath_error__onceToken, &__block_literal_global_8);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", notificationRecordsFromPersistentNotificationStorageWithPath_error__allowedClasses, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __104__CALNPersistentNotificationStorage_notificationRecordsFromPersistentNotificationStorageWithPath_error___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)notificationRecordsFromPersistentNotificationStorageWithPath_error__allowedClasses;
  notificationRecordsFromPersistentNotificationStorageWithPath_error__allowedClasses = v2;

}

- (CALNPersistentNotificationStorage)initWithPath:(id)a3 isProtectedStorage:(BOOL)a4
{
  id v6;
  CALNPersistentNotificationStorage *v7;
  uint64_t v8;
  NSString *path;
  uint64_t v10;
  CALNInMemoryNotificationStorage *inMemoryStorage;
  id v12;
  const char *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *workQueue;
  objc_super v18;

  v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CALNPersistentNotificationStorage;
  v7 = -[CALNPersistentNotificationStorage init](&v18, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    path = v7->_path;
    v7->_path = (NSString *)v8;

    v7->_protected = a4;
    v10 = objc_opt_new();
    inMemoryStorage = v7->_inMemoryStorage;
    v7->_inMemoryStorage = (CALNInMemoryNotificationStorage *)v10;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = (const char *)objc_msgSend(v12, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create(v13, v14);
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v15;

  }
  return v7;
}

- (void)addNotificationRecord:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNPersistentNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CALNPersistentNotificationStorage_addNotificationRecord___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __59__CALNPersistentNotificationStorage_addNotificationRecord___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "inMemoryStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNotificationRecord:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_saveNotificationsWithError:", 0);
}

- (void)addNotificationRecords:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNPersistentNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__CALNPersistentNotificationStorage_addNotificationRecords___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __60__CALNPersistentNotificationStorage_addNotificationRecords___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "inMemoryStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addNotificationRecords:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_saveNotificationsWithError:", 0);
}

- (id)notificationRecords
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[CALNPersistentNotificationStorage workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__CALNPersistentNotificationStorage_notificationRecords__block_invoke;
  v6[3] = &unk_24D484A08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__CALNPersistentNotificationStorage_notificationRecords__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "inMemoryStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "notificationRecords");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeNotificationRecordsPassingTest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNPersistentNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__CALNPersistentNotificationStorage_removeNotificationRecordsPassingTest___block_invoke;
  block[3] = &unk_24D484A30;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __74__CALNPersistentNotificationStorage_removeNotificationRecordsPassingTest___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "inMemoryStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeNotificationRecordsPassingTest:", *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 32), "_saveNotificationsWithError:", 0);
}

- (void)removeAllNotificationRecords
{
  NSObject *v3;
  _QWORD block[5];

  -[CALNPersistentNotificationStorage workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CALNPersistentNotificationStorage_removeAllNotificationRecords__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __65__CALNPersistentNotificationStorage_removeAllNotificationRecords__block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "inMemoryStorage");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllNotificationRecords");

  return objc_msgSend(*(id *)(a1 + 32), "_saveNotificationsWithError:", 0);
}

- (BOOL)_loadNotificationsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  -[CALNPersistentNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_opt_class();
  -[CALNPersistentNotificationStorage path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationRecordsFromPersistentNotificationStorageWithPath:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Loaded notification records, count = %lu", buf, 0xCu);
    }

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v14);
          -[CALNPersistentNotificationStorage inMemoryStorage](self, "inMemoryStorage", (_QWORD)v18);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addNotificationRecord:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v12);
    }

  }
  return v8 != 0;
}

- (BOOL)_saveNotificationsWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  char v12;
  id v13;
  BOOL v14;
  NSObject *v15;
  id v17;
  id v18;

  -[CALNPersistentNotificationStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CALNPersistentNotificationStorage inMemoryStorage](self, "inMemoryStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (v8)
  {
    if (self->_protected)
      v10 = 1073741825;
    else
      v10 = 268435457;
    -[CALNPersistentNotificationStorage path](self, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    v12 = objc_msgSend(v8, "writeToFile:options:error:", v11, v10, &v17);
    v13 = v17;

    if ((v12 & 1) != 0)
    {
      v14 = 1;
      if (!a3)
        goto LABEL_15;
      goto LABEL_14;
    }
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CALNPersistentNotificationStorage _saveNotificationsWithError:].cold.2(self, (uint64_t)v13, v15);
    v9 = v13;
  }
  else
  {
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[CALNPersistentNotificationStorage _saveNotificationsWithError:].cold.1((uint64_t)v7);
  }

  v14 = 0;
  v13 = v9;
  if (a3)
LABEL_14:
    *a3 = objc_retainAutorelease(v13);
LABEL_15:

  return v14;
}

- (NSString)path
{
  return self->_path;
}

- (CALNInMemoryNotificationStorage)inMemoryStorage
{
  return self->_inMemoryStorage;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_inMemoryStorage, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

void __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v1, v2, "Couldn't read existing persistent notification storage at path %{public}@. Will proceed anyway, which may mean contents will be overwritten. Error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __94__CALNPersistentNotificationStorage_persistentNotificationStorageWithPath_isProtectedStorage___block_invoke_cold_2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v1, v2, "Notification storage file did not exist at path = %{public}@. Creating a new file FAILED with error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveNotificationsWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v1, v2, "Error archiving notifications (%@). error = %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveNotificationsWithError:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_215D9B000, a3, OS_LOG_TYPE_ERROR, "Error writing archived notifications to path = %{public}@, error = %@", (uint8_t *)&v6, 0x16u);

}

@end
