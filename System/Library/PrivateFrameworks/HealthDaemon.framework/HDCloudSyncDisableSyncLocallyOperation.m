@implementation HDCloudSyncDisableSyncLocallyOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legacyRepositoryProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudSyncCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accountProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__HDCloudSyncDisableSyncLocallyOperation_main__block_invoke;
  v11[3] = &unk_1E6CEB718;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v9, "disableSyncLocallyWithCompletion:", v11);

}

void __46__HDCloudSyncDisableSyncLocallyOperation_main__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[5];
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "cloudSyncManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ownerIdentifierManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__HDCloudSyncDisableSyncLocallyOperation_main__block_invoke_185;
    v9[3] = &unk_1E6CE77C8;
    v9[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v7, "rollOwnerDifferentiatorForReason:completion:", CFSTR("Disabling cloud sync locally."), v9);

  }
  else
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v11 = v5;
      _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "Failed to disable cloud sync: %{public}@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v5);
  }

}

void __46__HDCloudSyncDisableSyncLocallyOperation_main__block_invoke_185(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "Updated owner identifier after disabling cloud sync.", (uint8_t *)&v11, 2u);
    }
    v8 = *(void **)(a1 + 32);
    v9 = 1;
    v10 = 0;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "Failed to update owner differentiator after disabling cloud sync: %{public}@.", (uint8_t *)&v11, 0xCu);
    }
    v8 = *(void **)(a1 + 32);
    v9 = 0;
    v10 = v5;
  }
  objc_msgSend(v8, "finishWithSuccess:error:", v9, v10);

}

@end
