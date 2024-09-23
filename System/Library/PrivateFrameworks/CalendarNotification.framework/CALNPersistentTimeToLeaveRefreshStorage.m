@implementation CALNPersistentTimeToLeaveRefreshStorage

+ (id)persistentStorageWithPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPath:", v4);
  objc_msgSend(v5, "workQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke;
  v12[3] = &unk_24D484760;
  v13 = v4;
  v7 = v5;
  v14 = v7;
  v8 = v4;
  dispatch_sync(v6, v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

void __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke(uint64_t a1)
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
    v7 = objc_msgSend(v6, "_loadDataWithError:", &v17);
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
        v12 = "Time to Leave refresh storage file loaded from path %{public}@.";
LABEL_8:
        _os_log_impl(&dword_215D9B000, v10, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke_cold_1(v3);
    }
  }
  else
  {
    v16 = 0;
    v13 = objc_msgSend(v6, "_saveDataWithError:", &v16);
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
        v12 = "Time to Leave refresh storage file did not exist at path = %{public}@. Created a new file.";
        goto LABEL_8;
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke_cold_2(v3);
    }
  }

}

+ (id)timeToLeaveRefreshDataFromPersistentStorageWithPath:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;

  v5 = timeToLeaveRefreshDataFromPersistentStorageWithPath_error__onceToken;
  v6 = a3;
  if (v5 != -1)
    dispatch_once(&timeToLeaveRefreshDataFromPersistentStorageWithPath_error__onceToken, &__block_literal_global_24);
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", timeToLeaveRefreshDataFromPersistentStorageWithPath_error__allowedClasses, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __101__CALNPersistentTimeToLeaveRefreshStorage_timeToLeaveRefreshDataFromPersistentStorageWithPath_error___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v4, 3);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1, v4, v5);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)timeToLeaveRefreshDataFromPersistentStorageWithPath_error__allowedClasses;
  timeToLeaveRefreshDataFromPersistentStorageWithPath_error__allowedClasses = v2;

}

- (CALNPersistentTimeToLeaveRefreshStorage)initWithPath:(id)a3
{
  id v4;
  CALNPersistentTimeToLeaveRefreshStorage *v5;
  uint64_t v6;
  NSString *path;
  uint64_t v8;
  CALNInMemoryTimeToLeaveRefreshStorage *inMemoryStorage;
  id v10;
  const char *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *workQueue;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CALNPersistentTimeToLeaveRefreshStorage;
  v5 = -[CALNPersistentTimeToLeaveRefreshStorage init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v8 = objc_opt_new();
    inMemoryStorage = v5->_inMemoryStorage;
    v5->_inMemoryStorage = (CALNInMemoryTimeToLeaveRefreshStorage *)v8;

    objc_opt_class();
    CalGenerateQualifiedIdentifierWithClassAndSubdomain();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (const char *)objc_msgSend(v10, "UTF8String");

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create(v11, v12);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v13;

  }
  return v5;
}

- (id)refreshDates
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
  v10 = __Block_byref_object_copy__8;
  v11 = __Block_byref_object_dispose__8;
  v12 = 0;
  -[CALNPersistentTimeToLeaveRefreshStorage workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__CALNPersistentTimeToLeaveRefreshStorage_refreshDates__block_invoke;
  v6[3] = &unk_24D484A08;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __55__CALNPersistentTimeToLeaveRefreshStorage_refreshDates__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "inMemoryStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshDates");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)addRefreshDate:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[CALNPersistentTimeToLeaveRefreshStorage workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__CALNPersistentTimeToLeaveRefreshStorage_addRefreshDate_withIdentifier___block_invoke;
  block[3] = &unk_24D484800;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

uint64_t __73__CALNPersistentTimeToLeaveRefreshStorage_addRefreshDate_withIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRefreshDate:withIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)refreshDateWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
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
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  -[CALNPersistentTimeToLeaveRefreshStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__CALNPersistentTimeToLeaveRefreshStorage_refreshDateWithIdentifier___block_invoke;
  block[3] = &unk_24D4847B0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __69__CALNPersistentTimeToLeaveRefreshStorage_refreshDateWithIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "inMemoryStorage");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "refreshDateWithIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)removeRefreshDateWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  -[CALNPersistentTimeToLeaveRefreshStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __75__CALNPersistentTimeToLeaveRefreshStorage_removeRefreshDateWithIdentifier___block_invoke;
  block[3] = &unk_24D484760;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(v5, block);

}

uint64_t __75__CALNPersistentTimeToLeaveRefreshStorage_removeRefreshDateWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeRefreshDateWithIdentifier:", *(_QWORD *)(a1 + 40));
}

- (void)removeRefreshDates
{
  NSObject *v3;
  _QWORD block[5];

  -[CALNPersistentTimeToLeaveRefreshStorage workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CALNPersistentTimeToLeaveRefreshStorage_removeRefreshDates__block_invoke;
  block[3] = &unk_24D484738;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __61__CALNPersistentTimeToLeaveRefreshStorage_removeRefreshDates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeData");
}

- (void)_addRefreshDate:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[CALNPersistentTimeToLeaveRefreshStorage workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[CALNPersistentTimeToLeaveRefreshStorage inMemoryStorage](self, "inMemoryStorage");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v9, "addRefreshDate:withIdentifier:", v6, v7);

  v12 = 0;
  LOBYTE(v9) = -[CALNPersistentTimeToLeaveRefreshStorage _saveDataWithError:](self, "_saveDataWithError:", &v12);
  v10 = v12;
  if ((v9 & 1) == 0)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v14 = v10;
      v15 = 2114;
      v16 = v7;
      v17 = 2112;
      v18 = v6;
      _os_log_error_impl(&dword_215D9B000, v11, OS_LOG_TYPE_ERROR, "Could not save time to leave refresh date. error = %{public}@, identifier = %{public}@, data = %@", buf, 0x20u);
    }

  }
}

- (void)_removeRefreshDateWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  id v9;

  v4 = a3;
  -[CALNPersistentTimeToLeaveRefreshStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CALNPersistentTimeToLeaveRefreshStorage inMemoryStorage](self, "inMemoryStorage");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v6, "removeRefreshDateWithIdentifier:", v4);

  v9 = 0;
  LOBYTE(v6) = -[CALNPersistentTimeToLeaveRefreshStorage _saveDataWithError:](self, "_saveDataWithError:", &v9);
  v7 = v9;
  if ((v6 & 1) == 0)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CALNPersistentTimeToLeaveRefreshStorage _removeRefreshDateWithIdentifier:].cold.1((uint64_t)v7, (uint64_t)v4, v8);

  }
}

- (void)_removeData
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_215D9B000, a2, OS_LOG_TYPE_ERROR, "Could not save after removing time to leave refresh dates. error = %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

- (BOOL)_loadDataWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD v11[5];
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[CALNPersistentTimeToLeaveRefreshStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_opt_class();
  -[CALNPersistentTimeToLeaveRefreshStorage path](self, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeToLeaveRefreshDataFromPersistentStorageWithPath:error:", v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v13 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_215D9B000, v9, OS_LOG_TYPE_DEFAULT, "Loaded time to leave refresh timer dates, count = %lu", buf, 0xCu);
    }

    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__CALNPersistentTimeToLeaveRefreshStorage__loadDataWithError___block_invoke;
    v11[3] = &unk_24D485358;
    v11[4] = self;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
  }

  return v8 != 0;
}

void __62__CALNPersistentTimeToLeaveRefreshStorage__loadDataWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "inMemoryStorage");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addRefreshDate:withIdentifier:", v5, v6);

}

- (BOOL)_saveDataWithError:(id *)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  BOOL v13;
  NSObject *v14;
  id v16;
  id v17;

  -[CALNPersistentTimeToLeaveRefreshStorage workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[CALNPersistentTimeToLeaveRefreshStorage inMemoryStorage](self, "inMemoryStorage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refreshDates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;
  if (v8)
  {
    -[CALNPersistentTimeToLeaveRefreshStorage path](self, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v9;
    v11 = objc_msgSend(v8, "writeToFile:options:error:", v10, 268435457, &v16);
    v12 = v16;

    if ((v11 & 1) != 0)
    {
      v13 = 1;
      if (!a3)
        goto LABEL_12;
      goto LABEL_11;
    }
    +[CALNLogSubsystem defaultCategory](CALNLogSubsystem, "defaultCategory");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CALNPersistentTimeToLeaveRefreshStorage _saveDataWithError:].cold.2(self, (uint64_t)v12, v14);
    v9 = v12;
  }
  else
  {
    +[CALNLogSubsystem calendar](CALNLogSubsystem, "calendar");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CALNPersistentTimeToLeaveRefreshStorage _saveDataWithError:].cold.1((uint64_t)v7);
  }

  v13 = 0;
  v12 = v9;
  if (a3)
LABEL_11:
    *a3 = objc_retainAutorelease(v12);
LABEL_12:

  return v13;
}

- (NSString)path
{
  return self->_path;
}

- (CALNInMemoryTimeToLeaveRefreshStorage)inMemoryStorage
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

void __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke_cold_1(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v1, v2, "Couldn't read existing persistent time to leave refresh storage at path %{public}@. Will proceed anyway, which may mean contents will be overwritten. Error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

void __69__CALNPersistentTimeToLeaveRefreshStorage_persistentStorageWithPath___block_invoke_cold_2(_QWORD *a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v1, v2, "Time to leave refresh storage file did not exist at path = %{public}@. Creating a new file FAILED with error: %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_removeRefreshDateWithIdentifier:(NSObject *)a3 .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, a2, a3, "Could not save after removing time to leave refresh date. error = %{public}@, identifier = %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveDataWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0(&dword_215D9B000, v1, v2, "Error archiving time to leave refresh dates (%@). error = %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1_0();
}

- (void)_saveDataWithError:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
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
  _os_log_error_impl(&dword_215D9B000, a3, OS_LOG_TYPE_ERROR, "Error writing archived data to path = %{public}@, error = %@", (uint8_t *)&v6, 0x16u);

}

@end
