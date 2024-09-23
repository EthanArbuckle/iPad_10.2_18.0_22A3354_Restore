@implementation CPLEnginePendingRecordChecks

- (unint64_t)scopeType
{
  return 2;
}

- (BOOL)enqueueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  BOOL v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!_CPLSilentLogging)
  {
    if (__CPLStorageOSLogDomain_onceToken_12657 != -1)
      dispatch_once(&__CPLStorageOSLogDomain_onceToken_12657, &__block_literal_global_12658);
    v7 = __CPLStorageOSLogDomain_result_12659;
    if (os_log_type_enabled((os_log_t)__CPLStorageOSLogDomain_result_12659, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_DEFAULT, "Will need to check these records in the cloud:\n%@", buf, 0xCu);
    }
  }
  -[CPLEngineStorage platformObject](self, "platformObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enqueueCloudScopedIdentifiersToCheck:error:", v6, a4);

  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    -[CPLEngineStorage engineStore](self, "engineStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scopes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "scopeIdentifier", (_QWORD)v22);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "containsObject:", v18) & 1) == 0)
          {
            objc_msgSend(v10, "addObject:", v18);
            objc_msgSend(v12, "scopeWithIdentifier:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19 && !objc_msgSend(v12, "setScopeHasChangesToPullFromTransport:error:", v19, a4))
            {

              v20 = 0;
              goto LABEL_21;
            }

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v15)
          continue;
        break;
      }
    }
    v20 = 1;
LABEL_21:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (id)nextBatchOfRecordsToCheckWithScopeIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextBatchOfRecordsToCheckWithScopeIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)dequeueCloudScopedIdentifiersToCheck:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "dequeueCloudScopedIdentifiersToCheck:error:", v6, a4);

  return (char)a4;
}

- (BOOL)hasRecordsToCheckWithScopeIdentifier:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[CPLEngineStorage platformObject](self, "platformObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasRecordsToCheckWithScopeIdentifier:", v4);

  return v6;
}

- (BOOL)deleteRecordsForScopeIndex:(int64_t)a3 maxCount:(int64_t)a4 deletedCount:(int64_t *)a5 error:(id *)a6
{
  void *v10;

  -[CPLEngineStorage platformObject](self, "platformObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v10, "deleteRecordsForScopeIndex:maxCount:deletedCount:error:", a3, a4, a5, a6);

  return (char)a6;
}

@end
