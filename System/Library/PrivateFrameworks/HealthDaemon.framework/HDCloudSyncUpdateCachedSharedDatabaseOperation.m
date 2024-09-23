@implementation HDCloudSyncUpdateCachedSharedDatabaseOperation

- (void)main
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id obj;
  uint64_t v26;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  HDCloudSyncUpdateCachedSharedDatabaseOperation *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "repository");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "syncAvailability");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "shouldSyncSummarySharingPull") & 1) != 0
    || (objc_msgSend(v4, "shouldSyncSummarySharingPush") & 1) != 0)
  {
    v24 = v4;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "repository");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allCKContainers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v26 = *(_QWORD *)v30;
      do
      {
        v11 = 0;
        v12 = v10;
        do
        {
          if (*(_QWORD *)v30 != v26)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v11);
          -[HDCloudSyncOperation configuration](self, "configuration");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "cachedCloudState");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "containerIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sharedCloudDatabase");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "databaseScope");
          v28 = v12;
          v19 = objc_msgSend(v15, "addDatabaseWithContainerIdentifier:databaseScope:error:", v16, v18, &v28);
          v10 = v28;

          if ((v19 & 1) == 0)
          {
            _HKInitializeLogging();
            v20 = (void *)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              v21 = v20;
              objc_msgSend(v13, "containerIdentifier");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v34 = self;
              v35 = 2114;
              v36 = v22;
              v37 = 2114;
              v38 = v10;
              _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@ Failed to update cache with shared database in container %{public}@, error: %{public}@", buf, 0x20u);

            }
            -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v10);
          }
          ++v11;
          v12 = v10;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v39, 16);
      }
      while (v9);
    }
    else
    {
      v10 = 0;
    }

    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
    v4 = v24;
  }
  else
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v34 = self;
      _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping fetching shared database because platform/profile does not support summary sharing", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }

}

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

@end
