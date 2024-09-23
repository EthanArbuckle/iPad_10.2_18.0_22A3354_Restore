@implementation HDSyncRequester

- (HDSyncRequester)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDSyncRequester)initWithProfile:(id)a3
{
  id v4;
  HDSyncRequester *v5;
  HDSyncRequester *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDSyncRequester;
  v5 = -[HDSyncRequester init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (void)requestSyncsWithReason:(id)a3
{
  -[HDSyncRequester requestSyncsWithReason:options:](self, "requestSyncsWithReason:options:", a3, 0);
}

- (void)requestSyncsWithReason:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  int v22;
  id v23;
  void *v24;
  _BYTE v25[24];
  void *v26;
  HDSyncRequester *v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    *(_DWORD *)v25 = 138543618;
    *(_QWORD *)&v25[4] = objc_opt_class();
    *(_WORD *)&v25[12] = 2114;
    *(_QWORD *)&v25[14] = v6;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Requesting syncs for '%{public}@'", v25, 0x16u);

  }
  v9 = _Block_copy(self->_unitTesting_willRequestSyncsHandler);
  v10 = v9;
  if (v9)
    (*((void (**)(void *, id, unint64_t))v9 + 2))(v9, v6, a4);
  v11 = MEMORY[0x1E0C809B0];
  if ((a4 & 1) == 0)
  {
    v12 = v6;
    v13 = objc_alloc_init(MEMORY[0x1E0CB6C58]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "cloudSyncManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6430]), "initWithStateSyncRequest:", v13);
    *(_QWORD *)v25 = v11;
    *(_QWORD *)&v25[8] = 3221225472;
    *(_QWORD *)&v25[16] = __47__HDSyncRequester__requestStateSyncWithReason___block_invoke;
    v26 = &unk_1E6CEB718;
    v27 = self;
    v17 = v12;
    v28 = v17;
    objc_msgSend(v15, "syncWithRequest:reason:completion:", v16, v17, v25);

  }
  v18 = v6;
  v19 = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(v19, "daemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "behavior");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "supportsNanoSync");

  if (v22)
  {
    v23 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v23, "nanoSyncManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)v25 = v11;
    *(_QWORD *)&v25[8] = 3221225472;
    *(_QWORD *)&v25[16] = __46__HDSyncRequester__requestNanoSyncWithReason___block_invoke;
    v26 = &unk_1E6CEB718;
    v27 = self;
    v28 = v18;
    objc_msgSend(v24, "syncHealthDataWithOptions:reason:completion:", 0, v28, v25);

  }
}

void __47__HDSyncRequester__requestStateSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v8 = v6;
    v11 = objc_opt_class();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    v17 = 2114;
    v18 = v5;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] Cloud sync request failure for reason '%{public}@': %{public}@", (uint8_t *)&v13, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    v9 = objc_opt_class();
    v10 = *(_QWORD *)(a1 + 40);
    v13 = 138543618;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cloud sync request success for reason '%{public}@'", (uint8_t *)&v13, 0x16u);
LABEL_4:

  }
LABEL_6:

}

void __46__HDSyncRequester__requestNanoSyncWithReason___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = (void *)*MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (!a2)
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      goto LABEL_6;
    v8 = v6;
    v11 = objc_opt_class();
    v12 = *(_QWORD *)(a1 + 40);
    v13 = 138543874;
    v14 = v11;
    v15 = 2114;
    v16 = v12;
    v17 = 2114;
    v18 = v5;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[%{public}@] NanoSync failure for reason '%{public}@': %{public}@", (uint8_t *)&v13, 0x20u);
    goto LABEL_4;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v6;
    v9 = objc_opt_class();
    v10 = *(_QWORD *)(a1 + 40);
    v13 = 138543618;
    v14 = v9;
    v15 = 2114;
    v16 = v10;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] NanoSync success for reason '%{public}@'", (uint8_t *)&v13, 0x16u);
LABEL_4:

  }
LABEL_6:

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (id)unitTesting_willRequestSyncsHandler
{
  return self->_unitTesting_willRequestSyncsHandler;
}

- (void)setUnitTesting_willRequestSyncsHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_willRequestSyncsHandler, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
