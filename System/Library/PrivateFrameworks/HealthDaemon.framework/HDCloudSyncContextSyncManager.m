@implementation HDCloudSyncContextSyncManager

- (HDCloudSyncContextSyncManager)initWithProfile:(id)a3
{
  id v4;
  HDCloudSyncContextSyncManager *v5;
  HDCloudSyncContextSyncManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncContextSyncManager;
  v5 = -[HDCloudSyncContextSyncManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)push:(id)a3
{
  id v4;
  HDProfile **p_profile;
  id WeakRetained;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  HDCloudSyncContextSyncPushTask *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  HDCloudSyncContextSyncPushTask *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v4 = a3;
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v7, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v9, &v27, 300.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;

  v12 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 2, 0, 28, 0);
  v13 = [HDCloudSyncContextSyncPushTask alloc];
  v14 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v14, "cloudSyncManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __38__HDCloudSyncContextSyncManager_push___block_invoke;
  v24[3] = &unk_1E6CF1550;
  v25 = v10;
  v26 = v4;
  v16 = v4;
  v17 = v10;
  v18 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v13, "initWithManager:context:accessibilityAssertion:completion:", v15, v12, v17, v24);

  v19 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v19, "daemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cloudSyncCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addManagerTask:", v18);

  -[HDCloudSyncManagerTask progress](v18, "progress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __38__HDCloudSyncContextSyncManager_push___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v5, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)pull:(id)a3
{
  id v4;
  HDProfile **p_profile;
  id WeakRetained;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  HDCloudSyncContextSyncPullTask *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  HDCloudSyncContextSyncPullTask *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;

  v4 = a3;
  p_profile = &self->_profile;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v7, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v9, &v27, 300.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v27;

  v12 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 3, 64, 28, 0);
  v13 = [HDCloudSyncContextSyncPullTask alloc];
  v14 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v14, "cloudSyncManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __38__HDCloudSyncContextSyncManager_pull___block_invoke;
  v24[3] = &unk_1E6CF1550;
  v25 = v10;
  v26 = v4;
  v16 = v4;
  v17 = v10;
  v18 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v13, "initWithManager:context:accessibilityAssertion:completion:", v15, v12, v17, v24);

  v19 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v19, "daemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "cloudSyncCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addManagerTask:", v18);

  -[HDCloudSyncManagerTask progress](v18, "progress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

void __38__HDCloudSyncContextSyncManager_pull___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v5, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

@end
