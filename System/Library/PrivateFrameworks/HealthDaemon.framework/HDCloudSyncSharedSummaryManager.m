@implementation HDCloudSyncSharedSummaryManager

- (HDCloudSyncSharedSummaryManager)initWithProfile:(id)a3
{
  id v4;
  HDCloudSyncSharedSummaryManager *v5;
  HDCloudSyncSharedSummaryManager *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncSharedSummaryManager;
  v5 = -[HDCloudSyncSharedSummaryManager init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (id)setupSharingWithOutgoingSummarySharingEntry:(id)a3 sharingAuthorizations:(id)a4 completion:(id)a5
{
  id v8;
  HDProfile **p_profile;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  HDCloudSyncSharedSummarySetupTask *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  HDCloudSyncSharedSummarySetupTask *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;

  v8 = a5;
  p_profile = &self->_profile;
  v10 = a4;
  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (objc_class *)objc_opt_class();
  NSStringFromClass(v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  objc_msgSend(v13, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v15, &v36, 300.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v36;

  v17 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v17, "cloudSyncManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "prepareForPeriodicSync");

  v19 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 10, 64, 9, 0);
  HKAuthorizationIdentifiersFromSharingAuthorizations();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [HDCloudSyncSharedSummarySetupTask alloc];
  v22 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v22, "cloudSyncManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __112__HDCloudSyncSharedSummaryManager_setupSharingWithOutgoingSummarySharingEntry_sharingAuthorizations_completion___block_invoke;
  v33[3] = &unk_1E6D11090;
  v34 = v16;
  v35 = v8;
  v24 = v8;
  v25 = v16;
  v26 = -[HDCloudSyncSharedSummarySetupTask initWithManager:context:codableEntry:authorizationIdentifiers:accessibilityAssertion:completion:](v21, "initWithManager:context:codableEntry:authorizationIdentifiers:accessibilityAssertion:completion:", v23, v19, v11, v20, v25, v33);

  -[HDCloudSyncManagerTask setPriority:](v26, "setPriority:", 100);
  v27 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v27, "daemon");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "cloudSyncCoordinator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "addManagerTask:", v26);

  -[HDCloudSyncManagerTask progress](v26, "progress");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

void __112__HDCloudSyncSharedSummaryManager_setupSharingWithOutgoingSummarySharingEntry_sharingAuthorizations_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v7 = a4;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  v8 = *(_QWORD *)(a1 + 40);
  if (a3)
  {
    objc_msgSend(v13, "shareSetupMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "participantIdentity");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "userRecordID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recordName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *, _QWORD))(v8 + 16))(v8, v9, v12, 0);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD, _QWORD, id))(v8 + 16))(v8, 0, 0, v7);
  }

}

- (id)synchronizeWithCompletion:(id)a3
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
  HDCloudSyncSharedSummarySynchronizeTask *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  HDCloudSyncSharedSummarySynchronizeTask *v18;
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

  v12 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 19, 64, 27, 0);
  v13 = [HDCloudSyncSharedSummarySynchronizeTask alloc];
  v14 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v14, "cloudSyncManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __61__HDCloudSyncSharedSummaryManager_synchronizeWithCompletion___block_invoke;
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

void __61__HDCloudSyncSharedSummaryManager_synchronizeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v5, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)push:(id)a3
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  HDProfile **p_profile;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  HDCloudSyncSharedSummaryPushTask *v16;
  id v17;
  void *v18;
  id v19;
  HDCloudSyncSharedSummaryPushTask *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t, int, void *);
  void *v31;
  id v32;
  HDCloudSyncSharedSummaryManager *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryManager *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  else
    WeakRetained = 0;
  v7 = objc_msgSend(WeakRetained, "profileType");

  if (v7 == 1)
  {
    p_profile = &self->_profile;
    v9 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v9, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0;
    objc_msgSend(v10, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v12, &v35, 300.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v35;

    v15 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 2, 64, 26, 0);
    v16 = [HDCloudSyncSharedSummaryPushTask alloc];
    v17 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v17, "cloudSyncManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = MEMORY[0x1E0C809B0];
    v29 = 3221225472;
    v30 = __40__HDCloudSyncSharedSummaryManager_push___block_invoke;
    v31 = &unk_1E6D110B8;
    v32 = v13;
    v33 = self;
    v34 = v5;
    v19 = v13;
    v20 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v16, "initWithManager:context:accessibilityAssertion:completion:", v18, v15, v19, &v28);

    v21 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v21, "daemon", v28, v29, v30, v31);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cloudSyncCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addManagerTask:", v20);

    -[HDCloudSyncManagerTask progress](v20, "progress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v37 = self;
      _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Push shared summaries called on non-primary profile. No work needed.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, CFSTR("Push shared summaries called on non-primary profile."));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v26);

    objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

void __40__HDCloudSyncSharedSummaryManager_push___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  if (a3)
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      v9 = v7;
      -[HDCloudSyncSharedSummaryManager _localKeyValueDomain](v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v11 = objc_msgSend(v10, "setDate:forKey:error:", v9, CFSTR("MostRecentPushDate"), &v15);

      v12 = v15;
      if ((v11 & 1) == 0)
      {
        _HKInitializeLogging();
        v13 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v17 = v6;
          v18 = 2114;
          v19 = v12;
          _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to set most recent push date: %{public}@", buf, 0x16u);
        }
      }

    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (id)pull:(id)a3
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  HDProfile **p_profile;
  id v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  HDCloudSyncSharedSummaryPullTask *v16;
  id v17;
  void *v18;
  id v19;
  HDCloudSyncSharedSummaryPullTask *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryManager *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  else
    WeakRetained = 0;
  v7 = objc_msgSend(WeakRetained, "profileType");

  if (v7 == 2)
  {
    p_profile = &self->_profile;
    v9 = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(v9, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v10, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v12, &v31, 300.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v31;

    v15 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 3, 64, 25, 0);
    v16 = [HDCloudSyncSharedSummaryPullTask alloc];
    v17 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v17, "cloudSyncManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __40__HDCloudSyncSharedSummaryManager_pull___block_invoke;
    v28[3] = &unk_1E6CF1550;
    v29 = v13;
    v30 = v5;
    v19 = v13;
    v20 = -[HDCloudSyncManagerPipelineTask initWithManager:context:accessibilityAssertion:completion:](v16, "initWithManager:context:accessibilityAssertion:completion:", v18, v15, v19, v28);

    v21 = objc_loadWeakRetained((id *)p_profile);
    objc_msgSend(v21, "daemon");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cloudSyncCoordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addManagerTask:", v20);

    -[HDCloudSyncManagerTask progress](v20, "progress");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    _HKInitializeLogging();
    v25 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1B7802000, v25, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Pull shared summaries called on non-summary sharing profile. No work needed.", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, CFSTR("Pull shared summaries called on non-summary sharing profile."));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v5 + 2))(v5, 0, v26);

    objc_msgSend(MEMORY[0x1E0CB38A8], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

void __40__HDCloudSyncSharedSummaryManager_pull___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v5, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)revokeParticipantWithOutgoingSummarySharingEntry:(id)a3 completion:(id)a4
{
  id v6;
  HDProfile **p_profile;
  id v8;
  id WeakRetained;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  HDCloudSyncSharedSummaryRevokeParticipantTask *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  HDCloudSyncSharedSummaryRevokeParticipantTask *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  v6 = a4;
  p_profile = &self->_profile;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v10, "takeAccessibilityAssertionWithOwnerIdentifier:timeout:error:", v12, &v30, 300.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v30;

  v15 = -[HDCloudSyncContext initForPurpose:options:reason:xpcActivity:]([HDCloudSyncContext alloc], "initForPurpose:options:reason:xpcActivity:", 19, 64, 11, 0);
  v16 = [HDCloudSyncSharedSummaryRevokeParticipantTask alloc];
  v17 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v17, "cloudSyncManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __95__HDCloudSyncSharedSummaryManager_revokeParticipantWithOutgoingSummarySharingEntry_completion___block_invoke;
  v27[3] = &unk_1E6D110E0;
  v28 = v13;
  v29 = v6;
  v19 = v6;
  v20 = v13;
  v21 = -[HDCloudSyncSharedSummaryRevokeParticipantTask initWithManager:context:codableEntry:accessibilityAssertion:completion:](v16, "initWithManager:context:codableEntry:accessibilityAssertion:completion:", v18, v15, v8, v20, v27);

  -[HDCloudSyncManagerTask setPriority:](v21, "setPriority:", 100);
  v22 = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(v22, "daemon");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "cloudSyncCoordinator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addManagerTask:", v21);

  -[HDCloudSyncManagerTask progress](v21, "progress");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

void __95__HDCloudSyncSharedSummaryManager_revokeParticipantWithOutgoingSummarySharingEntry_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a4;
  objc_msgSend(v5, "invalidate");
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (HDKeyValueDomain)_localKeyValueDomain
{
  HDKeyValueDomain *v2;
  id WeakRetained;
  HDKeyValueDomain *v4;

  v2 = [HDKeyValueDomain alloc];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  v4 = -[HDKeyValueDomain initWithCategory:domainName:profile:](v2, "initWithCategory:domainName:profile:", 0, CFSTR("CloudSyncSharedSummary"), WeakRetained);

  return v4;
}

- (void)scheduleBackgroundPush
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryManager *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    -[HDCloudSyncSharedSummaryManager _localKeyValueDomain]((uint64_t)self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v3, "dateForKey:error:", CFSTR("MostRecentPushDate"), &v19);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v19;
    v6 = v5;
    if (v4 || !v5)
    {
      v8 = v4;
    }
    else
    {
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v21 = self;
        v22 = 2114;
        v23 = v6;
        _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to lookup most recent sync date; using now: %{public}@",
          buf,
          0x16u);
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v8;

    objc_msgSend(v17, "timeIntervalSinceReferenceDate", v17);
  }
  else
  {
    objc_msgSend(0, "timeIntervalSinceReferenceDate", 0);
  }
  v10 = v9 + 7200.0;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v13 = v10 - v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cloudSyncCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "scheduleSharedSummaryPushWithMaximumDelay:", fmax(v13, 30.0));

}

- (void)scheduleUrgentPush
{
  void *v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudSyncCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scheduleSharedSummaryPushWithMaximumDelay:", *(double *)&_urgentLatency);

}

+ (void)unitTesting_setUrgentLatency:(double)a3
{
  _urgentLatency = *(_QWORD *)&a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

@end
