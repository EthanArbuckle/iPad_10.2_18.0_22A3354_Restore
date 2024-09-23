@implementation HDHRHealthKitSyncManager

- (HDHRHealthKitSyncManager)initWithProfile:(id)a3
{
  id v5;
  HDHRHealthKitSyncManager *v6;
  HDHRHealthKitSyncManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDHRHealthKitSyncManager;
  v6 = -[HDHRHealthKitSyncManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_profile, a3);

  return v7;
}

- (void)triggerImmediateSyncWithReason:(id)a3 loggingCategory:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  HDHRHealthKitSyncManager *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  HDHRHealthKitSyncManager *v25;
  id v26;

  v6 = a3;
  v7 = a4;
  -[HDProfile nanoSyncManager](self->_profile, "nanoSyncManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), self, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke;
  v23[3] = &unk_1E87EF8E0;
  v11 = v7;
  v24 = v11;
  v25 = self;
  v12 = v6;
  v26 = v12;
  objc_msgSend(v8, "syncHealthDataWithOptions:reason:completion:", 0, v9, v23);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6388]), "initWithPush:pull:lite:", 1, 0, 1);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6430]), "initWithChangesSyncRequest:", v13);
  -[HDProfile cloudSyncManager](self->_profile, "cloudSyncManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[%@] %@"), self, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v10;
  v19[1] = 3221225472;
  v19[2] = __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke_190;
  v19[3] = &unk_1E87EF8E0;
  v20 = v11;
  v21 = self;
  v22 = v12;
  v17 = v12;
  v18 = v11;
  objc_msgSend(v15, "syncWithRequest:reason:completion:", v14, v16, v19);

}

void __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = a1[4];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[5];
      v8 = a1[6];
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      _os_log_impl(&dword_1CC29C000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync completed after %{public}@", (uint8_t *)&v9, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke_cold_1((uint64_t)a1, (uint64_t)v5, v6);
  }

}

void __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke_190(_QWORD *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = a1[4];
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = a1[5];
      v9 = a1[6];
      v15 = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      v10 = "[%{public}@] Cloud sync request completed after %{public}@";
      v11 = v6;
      v12 = 22;
LABEL_6:
      _os_log_impl(&dword_1CC29C000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
    }
  }
  else if (v7)
  {
    v13 = a1[5];
    v14 = a1[6];
    v15 = 138543874;
    v16 = v13;
    v17 = 2114;
    v18 = v14;
    v19 = 2114;
    v20 = v5;
    v10 = "[%{public}@] Cloud sync request failed after %{public}@: %{public}@";
    v11 = v6;
    v12 = 32;
    goto LABEL_6;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
}

void __75__HDHRHealthKitSyncManager_triggerImmediateSyncWithReason_loggingCategory___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = 138543874;
  v6 = v3;
  v7 = 2114;
  v8 = v4;
  v9 = 2114;
  v10 = a2;
  _os_log_error_impl(&dword_1CC29C000, log, OS_LOG_TYPE_ERROR, "[%{public}@] NanoSync failed after %{public}@: %{public}@", (uint8_t *)&v5, 0x20u);
}

@end
