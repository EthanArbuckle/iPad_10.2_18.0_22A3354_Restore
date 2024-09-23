@implementation MTPersistentSyncChangeStore

- (MTPersistentSyncChangeStore)initWithDataModel:(id)a3
{
  id v4;
  MTPersistentSyncChangeStore *v5;
  NSObject *v6;
  void *v7;
  dispatch_queue_t v8;
  uint64_t v9;
  NAScheduler *archiverScheduler;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MTPersistentSyncChangeStore;
  v5 = -[MTPersistentSyncChangeStore init](&v12, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D519E8];
    v8 = dispatch_queue_create("com.apple.MTSyncStore.archive-queue", v6);
    objc_msgSend(v7, "schedulerWithDispatchQueue:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    archiverScheduler = v5->_archiverScheduler;
    v5->_archiverScheduler = (NAScheduler *)v9;

    -[MTPersistentSyncChangeStore setupSyncDataFileForDataModel:](v5, "setupSyncDataFileForDataModel:", v4);
  }

  return v5;
}

- (void)setupSyncDataFileForDataModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPersistentSyncChangeStore setSyncDataPath:](self, "setSyncDataPath:", v9);

  objc_msgSend(v4, "dataFileName");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[MTPersistentSyncChangeStore syncDataPath](self, "syncDataPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTPersistentSyncChangeStore setSyncDataFile:](self, "setSyncDataFile:", v11);

}

- (void)persistChanges:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[MTPersistentSyncChangeStore archiverScheduler](self, "archiverScheduler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46__MTPersistentSyncChangeStore_persistChanges___block_invoke;
  v7[3] = &unk_1E39CB7B0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

void __46__MTPersistentSyncChangeStore_persistChanges___block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  char v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  double v13;
  void *v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "syncDataFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "fileExistsAtPath:", v4);

  if ((v5 & 1) != 0)
    goto LABEL_7;
  MTLogForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *v3;
    objc_msgSend(*v3, "syncDataPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v23 = v7;
    v24 = 2114;
    v25 = v8;
    _os_log_impl(&dword_19AC4E000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ creating sync directory at %{public}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v3, "syncDataPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v21);
  v11 = v21;

  if (!v11)
  {
LABEL_7:
    v11 = -[NSKeyedArchiver initRequiringSecureCoding:]([MTSyncChangeArchiver alloc], "initRequiringSecureCoding:", 1);
    objc_msgSend(v11, "encodeObject:forKey:", *(_QWORD *)(a1 + 40), CFSTR("MTSyncStoragePendingChanges"));
    LODWORD(v13) = 4.0;
    objc_msgSend(v11, "encodeFloat:forKey:", CFSTR("MTSyncStorageVersion"), v13);
    objc_msgSend(v11, "finishEncoding");
    objc_msgSend(v11, "encodedData");
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "syncDataFile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSObject writeToFile:atomically:](v12, "writeToFile:atomically:", v14, 1);

    MTLogForCategory(6);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = *(void **)(a1 + 32);
        v19 = *(void **)(a1 + 40);
        objc_msgSend(v18, "syncDataFile");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v23 = v18;
        v24 = 2114;
        v25 = v19;
        v26 = 2114;
        v27 = v20;
        _os_log_impl(&dword_19AC4E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ wrote pending changes %{public}@ to file %{public}@", buf, 0x20u);

      }
    }
    else if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      __46__MTPersistentSyncChangeStore_persistChanges___block_invoke_cold_1((id *)(a1 + 32), v17);
    }

  }
  else
  {
    MTLogForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __46__MTPersistentSyncChangeStore_persistChanges___block_invoke_cold_2((id *)(a1 + 32), v12);
  }

}

- (id)loadChanges
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  id v10;

  v3 = (void *)objc_opt_new();
  -[MTPersistentSyncChangeStore archiverScheduler](self, "archiverScheduler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__MTPersistentSyncChangeStore_loadChanges__block_invoke;
  v9[3] = &unk_1E39CB7B0;
  v9[4] = self;
  v5 = v3;
  v10 = v5;
  objc_msgSend(v4, "performBlock:", v9);

  v6 = v10;
  v7 = v5;

  return v7;
}

void __42__MTPersistentSyncChangeStore_loadChanges__block_invoke(uint64_t a1)
{
  void *v2;
  id *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  float v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  _QWORD v34[4];

  v34[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "syncDataFile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", v4, 0);

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99D50]);
    objc_msgSend(*v3, "syncDataFile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithContentsOfFile:", v7);

    if (v8)
    {
      v27 = 0;
      v9 = (void *)-[MTSyncChangeUnarchiver initForReadingFromData:error:]([MTSyncChangeUnarchiver alloc], "initForReadingFromData:error:", v8, &v27);
      v10 = v27;
      if (v10)
      {
        MTLogForCategory(6);
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_3((uint64_t *)(a1 + 32));

        objc_msgSend(*(id *)(a1 + 32), "_removeSyncDataFile");
        objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x1E0C9AA60]);
      }
      else
      {
        objc_msgSend(v9, "decodeFloatForKey:", CFSTR("MTSyncStorageVersion"));
        if (v15 >= 4.0)
        {
          v18 = (void *)MEMORY[0x1E0C99E60];
          v34[0] = objc_opt_class();
          v34[1] = objc_opt_class();
          v34[2] = objc_opt_class();
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setWithArray:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v20, CFSTR("MTSyncStoragePendingChanges"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          MTLogForCategory(6);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = *v3;
            objc_msgSend(*v3, "syncDataFile");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v29 = v23;
            v30 = 2114;
            v31 = v21;
            v32 = 2114;
            v33 = v24;
            _os_log_impl(&dword_19AC4E000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ read pending changes %{public}@ from file %{public}@", buf, 0x20u);

          }
          v25 = v21;
          if (!v21)
          {
            MTLogForCategory(6);
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_2((uint64_t *)(a1 + 32), v26);

            v25 = (void *)MEMORY[0x1E0C9AA60];
          }
          objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", v25);

        }
        else
        {
          MTLogForCategory(6);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = *v3;
            *(_DWORD *)buf = 138543362;
            v29 = v17;
            _os_log_impl(&dword_19AC4E000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ stored sync version is too old", buf, 0xCu);
          }

          objc_msgSend(*v3, "_removeSyncDataFile");
          objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x1E0C9AA60]);
        }
        objc_msgSend(v9, "finishDecoding");
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x1E0C9AA60]);
    }

  }
  else
  {
    MTLogForCategory(6);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *v3;
      objc_msgSend(*v3, "syncDataFile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v29 = v13;
      v30 = 2114;
      v31 = v14;
      _os_log_impl(&dword_19AC4E000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ had no pending changes in file %{public}@", buf, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "finishWithResult:", MEMORY[0x1E0C9AA60]);
  }
}

- (void)_removeSyncDataFile
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543618;
  v3 = a1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, v1, (uint64_t)v1, "%{public}@ failed to remove bogus pending changes with error %{public}@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_2();
}

- (NAScheduler)archiverScheduler
{
  return self->_archiverScheduler;
}

- (NSString)syncDataPath
{
  return self->_syncDataPath;
}

- (void)setSyncDataPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)syncDataFile
{
  return self->_syncDataFile;
}

- (void)setSyncDataFile:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncDataFile, 0);
  objc_storeStrong((id *)&self->_syncDataPath, 0);
  objc_storeStrong((id *)&self->_archiverScheduler, 0);
}

void __46__MTPersistentSyncChangeStore_persistChanges___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "syncDataFile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, a2, v4, "%{public}@ failed to write pending changes to file %{public}@", v5);

  OUTLINED_FUNCTION_7();
}

void __46__MTPersistentSyncChangeStore_persistChanges___block_invoke_cold_2(id *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "syncDataPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, a2, v4, "%{public}@ failed to write create directory at %{public}@", v5);

  OUTLINED_FUNCTION_7();
}

void __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_1(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v3 = 138543618;
  v4 = v1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, v2, (uint64_t)v2, "%{public}@ caught exception %{public}@ when trying to read pending changes", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

void __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_19AC4E000, a2, OS_LOG_TYPE_ERROR, "%{public}@ got nil pending changes.", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

void __42__MTPersistentSyncChangeStore_loadChanges__block_invoke_cold_3(uint64_t *a1)
{
  uint64_t v1;
  NSObject *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v3 = 138543618;
  v4 = v1;
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_19AC4E000, v2, (uint64_t)v2, "%{public}@ unarchiving failed with error %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_2();
}

@end
