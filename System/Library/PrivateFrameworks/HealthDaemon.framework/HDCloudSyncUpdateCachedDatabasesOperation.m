@implementation HDCloudSyncUpdateCachedDatabasesOperation

- (void)main
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id obj;
  uint64_t v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  HDCloudSyncUpdateCachedDatabasesOperation *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allCKContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v21 = *(_QWORD *)v25;
    while (2)
    {
      v8 = 0;
      v9 = v7;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v8);
        -[HDCloudSyncOperation configuration](self, "configuration");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cachedCloudState");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containerIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "privateCloudDatabase");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "databaseScope");
        v23 = v9;
        v16 = objc_msgSend(v12, "addDatabaseWithContainerIdentifier:databaseScope:error:", v13, v15, &v23);
        v7 = v23;

        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
          {
            v18 = v17;
            objc_msgSend(v10, "containerIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v29 = self;
            v30 = 2114;
            v31 = v19;
            v32 = 2114;
            v33 = v7;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update cache with private database in container %{public}@, error: %{public}@", buf, 0x20u);

          }
          -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v7);

          goto LABEL_15;
        }
        ++v8;
        v9 = v7;
      }
      while (v6 != v8);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }

  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
LABEL_15:

}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

@end
