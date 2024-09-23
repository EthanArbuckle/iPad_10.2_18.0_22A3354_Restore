@implementation HDCloudSyncDeleteStoreOnChildOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  HDCloudSyncDeleteStoresOperation *v15;
  void *v16;
  void *v17;
  HDCloudSyncDeleteStoresOperation *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  uint8_t buf[4];
  HDCloudSyncDeleteStoreOnChildOperation *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "computedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushTargets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[HDCloudSyncOperation profile](self, "profile"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "cloudSyncManager"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isChild"),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v24 = self;
        _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Watch has more than 1 push target", buf, 0xCu);
      }
    }
    -[HDCloudSyncOperation configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "computedState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushTargets");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke;
    v22[3] = &unk_1E6CFCA80;
    v22[4] = self;
    objc_msgSend(v12, "hk_map:", v22);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "count"))
    {
      v15 = [HDCloudSyncDeleteStoresOperation alloc];
      -[HDCloudSyncOperation configuration](self, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation cloudState](self, "cloudState");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HDCloudSyncDeleteStoresOperation initWithConfiguration:cloudState:storeRecordsToDelete:](v15, "initWithConfiguration:cloudState:storeRecordsToDelete:", v16, v17, v14);

      v20[0] = v13;
      v20[1] = 3221225472;
      v20[2] = __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke_2;
      v20[3] = &unk_1E6CE98F8;
      v20[4] = self;
      v21 = v14;
      -[HDCloudSyncOperation setOnSuccess:](v18, "setOnSuccess:", v20);
      v19[0] = v13;
      v19[1] = 3221225472;
      v19[2] = __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke_186;
      v19[3] = &unk_1E6CE77A0;
      v19[4] = self;
      -[HDCloudSyncOperation setOnError:](v18, "setOnError:", v19);
      -[HDCloudSyncOperation start](v18, "start");

    }
    else
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
    }

  }
  else
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
  }

}

id __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  double Current;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "storeRecord");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_4;
  Current = CFAbsoluteTimeGetCurrent();
  objc_msgSend(v5, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  objc_msgSend(v5, "sequenceRecord");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "childRecordCount");

  if (v12 > 500 || Current - v10 > 1814400.0)
  {
    _HKInitializeLogging();
    v14 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v15 = v14;
      objc_msgSend(v5, "description");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR(" max active duration passed");
      v20 = 138543874;
      v21 = v4;
      v22 = 2114;
      if (v12 > 500)
        v18 = CFSTR("record limit crossed");
      v23 = v16;
      v24 = 2114;
      v25 = v18;
      _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Requesting deletion of watch store: %{public}@ due to %{public}@", (uint8_t *)&v20, 0x20u);

    }
    objc_msgSend(v3, "storeRecord");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_4:

    v13 = 0;
  }

  return v13;
}

uint64_t __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    LODWORD(v3) = objc_msgSend(v3, "count");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v4;
    v10 = 1024;
    v11 = (int)v3;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Successfully deleted %d watch stores, deletionDate: %{public}@", (uint8_t *)&v8, 0x1Cu);

  }
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

void __46__HDCloudSyncDeleteStoreOnChildOperation_main__block_invoke_186(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Failed to delete watch stores: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

@end
