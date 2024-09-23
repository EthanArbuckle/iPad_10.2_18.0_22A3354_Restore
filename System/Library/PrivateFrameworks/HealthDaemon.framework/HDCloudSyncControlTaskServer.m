@implementation HDCloudSyncControlTaskServer

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB63F0], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  uint64_t v5;
  id v6;

  v5 = *MEMORY[0x1E0CB59B0];
  v6 = a3;
  LOBYTE(v5) = objc_msgSend(v6, "hasRequiredEntitlement:error:", v5, a4);
  LOBYTE(a4) = objc_msgSend(v6, "hasRequiredArrayEntitlement:containing:error:", *MEMORY[0x1E0CB59C0], *MEMORY[0x1E0CB4D88], a4);

  return v5 | a4;
}

- (void)remote_syncWithRequest:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  NSObject *v11;
  id v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  HDCloudSyncControlTaskServer *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = self;
    v26 = 2114;
    v27 = v8;
    v28 = 2114;
    v29 = v9;
    _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Requested: %{public}@ Reason: %{public}@", buf, 0x20u);
  }
  v12 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, HDOptionsForRequest(v8), 1, 0);
  objc_msgSend(v12, "setSyncRequest:", v8);
  v13 = objc_msgSend(v9, "isEqualToString:", CFSTR("hkctl"));
  -[HDStandardTaskServer profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "daemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cloudSyncCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v13)
  {
    v23 = 0;
    v18 = objc_msgSend(v16, "scheduleSyncForAllProfilesViaGatedXPCActivity:context:reason:error:", 0, v12, v9, &v23);
    v19 = v23;
  }
  else
  {
    v22 = 0;
    v18 = objc_msgSend(v16, "scheduleSyncForAllProfilesViaGatedXPCActivity:context:reason:error:", 1, v12, v9, &v22);
    v19 = v22;
  }
  v20 = v19;

  if (v18)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    objc_msgSend(v20, "hk_sanitizedError");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v21);

  }
}

- (id)remote_forceCloudSyncWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  uint8_t buf[4];
  HDCloudSyncControlTaskServer *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  _HKInitializeLogging();
  v9 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    HKCloudSyncOptionsToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKCloudSyncReasonToString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v12;
    _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Triggered by options: %{public}@ reason: %{public}@", buf, 0x20u);

  }
  v13 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 0, a3, a4, 0);
  -[HDStandardTaskServer profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "daemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cloudSyncCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __83__HDCloudSyncControlTaskServer_remote_forceCloudSyncWithOptions_reason_completion___block_invoke;
  v20[3] = &unk_1E6CE77F0;
  v21 = v8;
  v17 = v8;
  objc_msgSend(v16, "syncAllProfilesWithContext:completion:", v13, v20);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

void __83__HDCloudSyncControlTaskServer_remote_forceCloudSyncWithOptions_reason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (id)remote_forceCloudResetWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 8, 0, 4, 0);
  -[HDStandardTaskServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudSyncCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__HDCloudSyncControlTaskServer_remote_forceCloudResetWithCompletion___block_invoke;
  v12[3] = &unk_1E6CE77F0;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "resetAllProfilesWithContext:completion:", v5, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __69__HDCloudSyncControlTaskServer_remote_forceCloudResetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (id)remote_forceCloudSyncDataUploadForProfileWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  HDCloudSyncControlTaskServer *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[HDStandardTaskServer profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "profileIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v8;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Data Upload Triggered for profileIdentifier: %{public}@", buf, 0x16u);

  }
  v9 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 2, 66, 21, 0);
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cloudSyncManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __88__HDCloudSyncControlTaskServer_remote_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke;
  v15[3] = &unk_1E6CE77F0;
  v16 = v4;
  v12 = v4;
  objc_msgSend(v11, "syncWithContext:completion:", v9, v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __88__HDCloudSyncControlTaskServer_remote_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (id)remote_fetchCloudDescriptionWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  v5 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 7, 4, 3, 0);
  -[HDStandardTaskServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cloudSyncCoordinator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__HDCloudSyncControlTaskServer_remote_fetchCloudDescriptionWithCompletion___block_invoke;
  v12[3] = &unk_1E6CFC9F0;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "fetchCloudDescriptionWithContext:completion:", v5, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __75__HDCloudSyncControlTaskServer_remote_fetchCloudDescriptionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a3;
  v8 = a2;
  objc_msgSend(a4, "hk_sanitizedError");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v8, v7, v9);

}

- (void)remote_fetchCloudSyncStatusWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "syncStatusProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __74__HDCloudSyncControlTaskServer_remote_fetchCloudSyncStatusWithCompletion___block_invoke;
  v10[3] = &unk_1E6CFCA18;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "fetchSyncStatusWithCompletion:", v10);

}

void __74__HDCloudSyncControlTaskServer_remote_fetchCloudSyncStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v8 = *(_QWORD *)(a1 + 32);
  v9 = a5;
  v10 = a3;
  objc_msgSend(v10, "lastSuccessfulPushDate");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastSuccessfulPullDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "hk_sanitizedError");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, uint64_t, id, void *, uint64_t, void *))(v8 + 16))(v8, a2, v13, v11, a4, v12);
}

- (id)remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __91__HDCloudSyncControlTaskServer_remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke;
  v12[3] = &unk_1E6CE77F0;
  v13 = v4;
  v9 = v4;
  objc_msgSend(v8, "disableAndDeleteAllSyncDataWithCompletion:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __91__HDCloudSyncControlTaskServer_remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)remote_disableCloudSyncWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__HDCloudSyncControlTaskServer_remote_disableCloudSyncWithCompletion___block_invoke;
  v10[3] = &unk_1E6CE77F0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "disableSyncLocallyWithCompletion:", v10);

}

void __70__HDCloudSyncControlTaskServer_remote_disableCloudSyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)remote_enableCloudSyncWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__HDCloudSyncControlTaskServer_remote_enableCloudSyncWithCompletion___block_invoke;
  v10[3] = &unk_1E6CE77F0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "enableSyncLocallyWithCompletion:", v10);

}

void __69__HDCloudSyncControlTaskServer_remote_enableCloudSyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)remote_accountConfigurationDidChangeWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "daemon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__HDCloudSyncControlTaskServer_remote_accountConfigurationDidChangeWithCompletion___block_invoke;
  v10[3] = &unk_1E6CE77F0;
  v11 = v4;
  v9 = v4;
  objc_msgSend(v8, "accountConfigurationDidChangeWithCompletion:", v10);

}

void __83__HDCloudSyncControlTaskServer_remote_accountConfigurationDidChangeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  id v5;

  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);

}

- (void)remote_oldestSampleStartDateInHealthDatabaseWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, id, _QWORD))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDOldestSampleStartDate(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6, 0);
}

- (id)remote_fetchCloudSyncProgressWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HDStandardTaskServer profile](self, "profile", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cloudSyncCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "syncStatusProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentSyncProgress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)remote_requestDataRefreshWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  HDCloudSyncControlTaskServer *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = self;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Requesting data refresh (#t0)", (uint8_t *)&v8, 0xCu);
  }
  -[HDStandardTaskServer profile](self, "profile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestDataUploadWithCompletion:", v4);

}

@end
