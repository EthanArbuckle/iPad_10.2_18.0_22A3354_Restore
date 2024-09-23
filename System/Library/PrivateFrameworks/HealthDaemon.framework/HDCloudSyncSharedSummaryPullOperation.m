@implementation HDCloudSyncSharedSummaryPullOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  HDSynchronousTaskGroup *v8;
  HDSynchronousTaskGroup *taskGroup;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  HDSynchronousTaskGroup *v25;
  id v26;
  HDInsertSharedSummaryTransactionOperation *v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  HDSynchronousTaskGroup *v31;
  void *v32;
  id v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  _BYTE buf[12];
  __int16 v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "healthAppHiddenOrNotInstalled");

  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@ Health App is hidden or not installed", buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }
  else
  {
    v8 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = self->_taskGroup;
    self->_taskGroup = v8;

    -[HDSynchronousTaskGroup setDelegate:](self->_taskGroup, "setDelegate:", self);
    -[HDCloudSyncOperation configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedCloudState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    objc_msgSend(v11, "zonesByIdentifierWithError:", &v39);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v39;

    if (v12 || !v13)
    {
      objc_msgSend(v12, "hk_filter:", &__block_literal_global_52);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");
      _HKInitializeLogging();
      v17 = *MEMORY[0x1E0CB5370];
      v18 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT);
      if (v16)
      {
        v33 = v13;
        if (v18)
        {
          v19 = v17;
          v20 = objc_msgSend(v15, "count");
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          v42 = 2048;
          v43 = v20;
          _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Starting ingest from %lu zones", buf, 0x16u);

        }
        -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v32 = v15;
        objc_msgSend(v15, "allKeys");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v36 != v23)
                objc_enumerationMutation(obj);
              v25 = self->_taskGroup;
              v26 = *(id *)(*((_QWORD *)&v35 + 1) + 8 * i);
              -[HDSynchronousTaskGroup beginTask](v25, "beginTask");
              v27 = -[HDInsertSharedSummaryTransactionOperation initWithZoneIdentifier:]([HDInsertSharedSummaryTransactionOperation alloc], "initWithZoneIdentifier:", v26);

              -[HDCloudSyncOperation profile](self, "profile");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)buf = 0;
              v29 = -[HDJournalableOperation performOrJournalWithProfile:error:](v27, "performOrJournalWithProfile:error:", v28, buf);
              v30 = *(id *)buf;

              v31 = self->_taskGroup;
              if (v29)
                -[HDSynchronousTaskGroup finishTask](v31, "finishTask");
              else
                -[HDSynchronousTaskGroup failTaskWithError:](v31, "failTaskWithError:", v30);

            }
            v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
          }
          while (v22);
        }

        -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
        v13 = v33;
        v15 = v32;
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = self;
          _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: No zones to pull.", buf, 0xCu);
        }
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
      }

    }
    else
    {
      _HKInitializeLogging();
      v14 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        v42 = 2114;
        v43 = (uint64_t)v13;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@ Failed to get cached zones, %{public}@", buf, 0x16u);
      }
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v13);
    }

  }
}

BOOL __45__HDCloudSyncSharedSummaryPullOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  id v5;
  _BOOL8 v6;
  uint64_t v8;
  id v9;

  v2 = a2;
  objc_msgSend(v2, "zoneIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = 0;
  v4 = objc_msgSend(v3, "hd_isSharedSummaryZoneIDForUserIdentifier:syncCircleIdentifier:", &v9, &v8);
  v5 = v9;

  if (v4)
    v6 = objc_msgSend(v2, "scope") == 3;
  else
    v6 = 0;

  return v6;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v5, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
}

@end
