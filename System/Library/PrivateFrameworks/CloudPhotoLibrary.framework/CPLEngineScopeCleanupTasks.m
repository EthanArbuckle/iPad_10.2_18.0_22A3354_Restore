@implementation CPLEngineScopeCleanupTasks

- (unint64_t)scopeType
{
  return 0;
}

- (BOOL)addCleanupTaskForScopeWithIndex:(int64_t)a3 scopeIdentifier:(id)a4 scopeType:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "addCleanupTaskForScopeWithIndex:scopeIdentifier:scopeType:error:", a3, v10, a5, a6);

  if (v12)
  {
    if (!_CPLSilentLogging)
    {
      __CPLStorageOSLogDomain_7755();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend((id)objc_opt_class(), "scopeTypeDescriptionForScopeType:", a5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412802;
        v17 = v14;
        v18 = 2112;
        v19 = v10;
        v20 = 2048;
        v21 = a3;
        _os_log_impl(&dword_1B03C2000, v13, OS_LOG_TYPE_DEFAULT, "Scheduling cleanup of %@ for %@ as index %ld", (uint8_t *)&v16, 0x20u);

      }
    }
    self->_shouldRequestACleanupToScheduler = 1;
  }

  return v12;
}

- (BOOL)cleanupStepHasMore:(BOOL *)a3 error:(id *)a4
{
  void *v7;
  int64_t v8;
  NSMutableArray *v9;
  char v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  NSMutableArray *remainingStoragesToCleanup;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  int64_t currentCleanupScopeIndex;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  int64_t v28;
  void *v29;
  void *v30;
  int64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint8_t buf[4];
  int64_t v39;
  __int16 v40;
  void *v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v37 = 0;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "nextCleanupTaskScopeIndexOfType:", &v37);

  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *a3 = 1;
    if (self->_currentCleanupScopeIndex != v8)
    {
      -[CPLEngineStorage engineStore](self, "engineStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "storages");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      self->_currentCleanupScopeIndex = v8;
      v13 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v12, "count"));
      remainingStoragesToCleanup = self->_remainingStoragesToCleanup;
      self->_remainingStoragesToCleanup = v13;

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v34;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v34 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            if (objc_msgSend(v20, "isAlive"))
            {
              v21 = objc_msgSend(v20, "scopeType");
              if (v21 == v37)
                -[NSMutableArray addObject:](self->_remainingStoragesToCleanup, "addObject:", v20);
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
        }
        while (v17);
      }

      if (!_CPLSilentLogging)
      {
        __CPLStorageOSLogDomain_7755();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          currentCleanupScopeIndex = self->_currentCleanupScopeIndex;
          -[NSMutableArray valueForKey:](self->_remainingStoragesToCleanup, "valueForKey:", CFSTR("name"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          v39 = currentCleanupScopeIndex;
          v40 = 2114;
          v41 = v24;
          _os_log_impl(&dword_1B03C2000, v22, OS_LOG_TYPE_DEFAULT, "Will cleanup scope index %ld in %{public}@", buf, 0x16u);

        }
      }

    }
    -[NSMutableArray firstObject](self->_remainingStoragesToCleanup, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      v32 = 0;
      if (!objc_msgSend(v25, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", self->_currentCleanupScopeIndex, 1000, &v32, a4))
      {
        v10 = 0;
LABEL_31:

        return v10;
      }
      if (v32)
      {
        if (!_CPLSilentLogging)
        {
          __CPLStorageOSLogDomain_7755();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = v32;
            objc_msgSend(v26, "name");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            v39 = v28;
            v40 = 2114;
            v41 = v29;
            _os_log_impl(&dword_1B03C2000, v27, OS_LOG_TYPE_DEFAULT, "Deleted %ld records in %{public}@", buf, 0x16u);

          }
        }
      }
      else
      {
        -[NSMutableArray removeObjectAtIndex:](self->_remainingStoragesToCleanup, "removeObjectAtIndex:", 0);
      }
    }
    if (-[NSMutableArray count](self->_remainingStoragesToCleanup, "count"))
    {
      v10 = 1;
    }
    else
    {
      -[CPLEngineStorage platformObject](self, "platformObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v30, "deleteCleanupTaskForScopeWithIndex:error:", self->_currentCleanupScopeIndex, a4);

    }
    goto LABEL_31;
  }
  self->_currentCleanupScopeIndex = 0;
  v9 = self->_remainingStoragesToCleanup;
  self->_remainingStoragesToCleanup = 0;

  *a3 = 0;
  return 1;
}

- (BOOL)hasCleanupTasks
{
  void *v2;
  char v3;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasCleanupTasks");

  return v3;
}

- (void)writeTransactionDidSucceed
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPLEngineScopeCleanupTasks;
  -[CPLEngineStorage writeTransactionDidSucceed](&v6, sel_writeTransactionDidSucceed);
  if (self->_shouldRequestACleanupToScheduler)
  {
    -[CPLEngineStorage engineStore](self, "engineStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "engineLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "scheduler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "noteStoreNeedsCleanup");

    self->_shouldRequestACleanupToScheduler = 0;
  }
}

- (void)writeTransactionDidFail
{
  NSMutableArray *remainingStoragesToCleanup;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPLEngineScopeCleanupTasks;
  -[CPLEngineStorage writeTransactionDidFail](&v4, sel_writeTransactionDidFail);
  remainingStoragesToCleanup = self->_remainingStoragesToCleanup;
  self->_remainingStoragesToCleanup = 0;

  self->_currentCleanupScopeIndex = 0;
  self->_shouldRequestACleanupToScheduler = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remainingStoragesToCleanup, 0);
}

+ (id)scopeTypeDescriptionForScopeType:(unint64_t)a3
{
  __CFString *v3;

  if (a3 - 1 >= 3)
    v3 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unknown %lu"), a3);
  else
    v3 = off_1E60D94B8[a3 - 1];
  return v3;
}

@end
