@implementation HDCloudSyncUpdateCachedZonesInSharedDatabaseOperation

+ (BOOL)shouldLogAtOperationStart
{
  return 0;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t v28[128];
  uint8_t buf[4];
  HDCloudSyncUpdateCachedZonesInSharedDatabaseOperation *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "shouldSyncSummarySharingPull") & 1) != 0
    || (objc_msgSend(v5, "shouldSyncSummarySharingPush") & 1) != 0)
  {
    -[HDCloudSyncUpdateCachedZonesOperation taskGroup](self, "taskGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginTask");

    -[HDCloudSyncOperation configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "repository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allCKContainers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v11 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v12 = v11;
      v13 = objc_msgSend(v10, "count");
      objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v30 = self;
      v31 = 2048;
      v32 = v13;
      v33 = 2114;
      v34 = v14;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning zone fetches for shared databases in %ld containers: %{public}@", buf, 0x20u);

    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v10;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          objc_msgSend(v20, "sharedCloudDatabase", (_QWORD)v24);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncUpdateCachedZonesOperation fetchChangesForContainer:database:](self, "fetchChangesForContainer:database:", v20, v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v17);
    }

    -[HDCloudSyncUpdateCachedZonesOperation taskGroup](self, "taskGroup");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "finishTask");

  }
  else
  {
    _HKInitializeLogging();
    v23 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v30 = self;
      _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping fetching records in shared database because platform/profile does not support summary sharing", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }

}

@end
