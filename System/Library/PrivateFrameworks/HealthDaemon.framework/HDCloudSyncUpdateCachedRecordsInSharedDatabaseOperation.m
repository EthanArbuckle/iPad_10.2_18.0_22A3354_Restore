@implementation HDCloudSyncUpdateCachedRecordsInSharedDatabaseOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  HDCloudSyncUpdateCachedRecordsInSharedDatabaseOperation *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "syncAvailability");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "shouldSyncSummarySharingPull") & 1) != 0
    || (objc_msgSend(v5, "shouldSyncSummarySharingPush") & 1) != 0)
  {
    -[HDCloudSyncUpdateCachedRecordsOperation taskGroup](self, "taskGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginTask");

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HDCloudSyncOperation configuration](self, "configuration", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "repository");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allCKContainers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v14, "sharedCloudDatabase");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncUpdateCachedRecordsOperation fetchRecordZoneChangesForContainer:database:](self, "fetchRecordZoneChangesForContainer:database:", v14, v15);

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    -[HDCloudSyncUpdateCachedRecordsOperation taskGroup](self, "taskGroup");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "finishTask");

  }
  else
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v24 = self;
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping fetching records in shared database because platform/profile does not support summary sharing", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }

}

@end
