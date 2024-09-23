@implementation HDCloudSyncSharedSummaryParticipantProfileCreationOperation

- (HDCloudSyncSharedSummaryParticipantProfileCreationOperation)initWithConfiguration:(id)a3 participants:(id)a4
{
  id v6;
  HDCloudSyncSharedSummaryParticipantProfileCreationOperation *v7;
  uint64_t v8;
  NSArray *participantRecords;
  HDSynchronousTaskGroup *v10;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncSharedSummaryParticipantProfileCreationOperation;
  v7 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v13, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    participantRecords = v7->_participantRecords;
    v7->_participantRecords = (NSArray *)v8;

    v10 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v7->_taskGroup;
    v7->_taskGroup = v10;

    -[HDSynchronousTaskGroup setDelegate:](v7->_taskGroup, "setDelegate:", v7);
  }

  return v7;
}

- (void)main
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_participantRecords;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    v7 = MEMORY[0x1E0C809B0];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
        v10[0] = v7;
        v10[1] = 3221225472;
        v10[2] = __67__HDCloudSyncSharedSummaryParticipantProfileCreationOperation_main__block_invoke;
        v10[3] = &unk_1E6CE77C8;
        v10[4] = self;
        -[HDCloudSyncSharedSummaryParticipantProfileCreationOperation _createProfileIfNecessaryForParticipant:completion:](self, "_createProfileIfNecessaryForParticipant:completion:", v9, v10);
        ++v8;
      }
      while (v5 != v8);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
}

uint64_t __67__HDCloudSyncSharedSummaryParticipantProfileCreationOperation_main__block_invoke(uint64_t a1, char a2)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if ((a2 & 1) != 0)
    return objc_msgSend(v2, "finishTask");
  else
    return objc_msgSend(v2, "failTaskWithError:");
}

- (void)_createProfileIfNecessaryForParticipant:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  void (**v18)(id, uint64_t, _QWORD);

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  objc_msgSend(v6, "relationshipType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "longValue"))
    goto LABEL_6;
  objc_msgSend(v6, "relationshipDirection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "longValue") != 1)
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v6, "relationshipStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "longValue");

  if (v11 != 1)
  {
LABEL_7:
    v7[2](v7, 1, 0);
    goto LABEL_8;
  }
  objc_msgSend(v6, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contactIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ownerParticipant");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __114__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileIfNecessaryForParticipant_completion___block_invoke;
  v17[3] = &unk_1E6CE77F0;
  v18 = v7;
  -[HDCloudSyncSharedSummaryParticipantProfileCreationOperation _createProfileWithUUID:contactIdentifier:firstName:lastName:ownerParticipant:completion:](self, "_createProfileWithUUID:contactIdentifier:firstName:lastName:ownerParticipant:completion:", v12, v13, v14, v15, v16, v17);

LABEL_8:
}

uint64_t __114__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileIfNecessaryForParticipant_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_createProfileWithUUID:(id)a3 contactIdentifier:(id)a4 firstName:(id)a5 lastName:(id)a6 ownerParticipant:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryParticipantProfileCreationOperation *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0CB6A10], "_profileWithUUID:type:", v14, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "repository");
    v31 = v14;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "cloudSyncShimProvider");
    v23 = v17;
    v24 = v16;
    v25 = v15;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "profileManagementShim");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v25;
    v16 = v24;
    v17 = v23;

    -[HDCloudSyncOperation configuration](self, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke;
    v32[3] = &unk_1E6CE7840;
    v38 = v19;
    v32[4] = self;
    v33 = v20;
    v34 = v15;
    v35 = v16;
    v36 = v23;
    v37 = v18;
    v28 = v20;
    objc_msgSend(v30, "profileExistsForProfileIdentifier:configuration:completion:", v28, v27, v32);

    v14 = v31;
  }
  else
  {
    _HKInitializeLogging();
    v29 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v40 = self;
      v41 = 2114;
      v42 = v14;
      v43 = 2112;
      v44 = v15;
      _os_log_error_impl(&dword_1B7802000, v29, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: No owner participant on sharing entry metadata; unable to create a new local profi"
        "le for accepted sharing entry %{public}@: %@",
        buf,
        0x20u);
    }
    (*((void (**)(id, uint64_t, _QWORD))v19 + 2))(v19, 1, 0);
  }

}

void __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v5 = a3;
  if (a2 == 2)
  {
    v7 = *(void **)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(_QWORD *)(a1 + 56);
    v10 = *(_QWORD *)(a1 + 64);
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_2;
    v17[3] = &unk_1E6CE7818;
    v17[4] = v7;
    v18 = v6;
    v20 = *(id *)(a1 + 80);
    v19 = *(id *)(a1 + 72);
    objc_msgSend(v7, "_createProfileWithProfileIdentifier:contactIdentifier:firstName:lastName:completion:", v18, v8, v9, v10, v17);

    v11 = v18;
LABEL_6:

    goto LABEL_7;
  }
  if (a2)
  {
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_2_186;
    v15[3] = &unk_1E6CE77F0;
    v14 = *(_QWORD *)(a1 + 72);
    v16 = *(id *)(a1 + 80);
    objc_msgSend(v12, "_setUpOwnerParticipantForProfileIdentifier:ownerParticipant:completion:", v13, v14, v15);
    v11 = v16;
    goto LABEL_6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();
LABEL_7:

}

void __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _HKInitializeLogging();
  v6 = *MEMORY[0x1E0CB5370];
  v7 = *MEMORY[0x1E0CB5370];
  if ((a2 & 1) != 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v18 = v8;
      v19 = 2114;
      v20 = v9;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Created local profile for identifier %{public}@", buf, 0x16u);
    }
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_185;
    v15[3] = &unk_1E6CE77F0;
    v12 = *(_QWORD *)(a1 + 48);
    v16 = *(id *)(a1 + 56);
    objc_msgSend(v10, "_setUpOwnerParticipantForProfileIdentifier:ownerParticipant:completion:", v11, v12, v15);

  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2114;
      v20 = v14;
      v21 = 2114;
      v22 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to create profile for identifier %{public}@: %{public}@", buf, 0x20u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

uint64_t __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_185(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __151__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithUUID_contactIdentifier_firstName_lastName_ownerParticipant_completion___block_invoke_2_186(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_setUpOwnerParticipantForProfileIdentifier:(id)a3 ownerParticipant:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  int v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  _QWORD v28[5];
  id v29;
  void (**v30)(id, uint64_t, _QWORD);
  id v31;
  id v32;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryParticipantProfileCreationOperation *v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t, _QWORD))a5;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "repository");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cloudSyncShimProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "profileManagementShim");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "repository");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "profileManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "profileForIdentifier:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "cloudSyncManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v19, "shareOwnerParticipantWithError:", &v32);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v32;

  if (v20)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v20 = v9;
    objc_msgSend(v18, "cloudSyncManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    v23 = objc_msgSend(v22, "setShareOwnerParticipant:error:", v20, &v31);
    v27 = v31;

    _HKInitializeLogging();
    v24 = *MEMORY[0x1E0CB5370];
    v25 = *MEMORY[0x1E0CB5370];
    if (v23)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v34 = self;
        v35 = 2114;
        v36 = v20;
        _os_log_impl(&dword_1B7802000, v24, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Stored owner participant: %{public}@", buf, 0x16u);
      }
      v10[2](v10, 1, 0);
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v34 = self;
        v35 = 2114;
        v36 = v27;
        _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to store owner participant: %{public}@", buf, 0x16u);
      }
      -[HDCloudSyncOperation configuration](self, "configuration", v27);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __134__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__setUpOwnerParticipantForProfileIdentifier_ownerParticipant_completion___block_invoke;
      v28[3] = &unk_1E6CE7868;
      v28[4] = self;
      v29 = v8;
      v30 = v10;
      objc_msgSend(v14, "deleteProfile:configuration:completion:", v29, v26, v28);

    }
  }

}

void __134__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__setUpOwnerParticipantForProfileIdentifier_ownerParticipant_completion___block_invoke(_QWORD *a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v7 = a1[4];
      v8 = a1[5];
      v9 = 138543874;
      v10 = v7;
      v11 = 2114;
      v12 = v8;
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to delete profile for identifier %{public}@: %{public}@", (uint8_t *)&v9, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }

}

- (void)_createProfileWithProfileIdentifier:(id)a3 contactIdentifier:(id)a4 firstName:(id)a5 lastName:(id)a6 completion:(id)a7
{
  id v12;
  __CFString *v13;
  id v14;
  id v15;
  __CFString *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  __CFString *v25;
  _QWORD v26[5];
  id v27;

  v12 = a4;
  v13 = (__CFString *)a5;
  v14 = a6;
  v15 = a7;
  v16 = v13;
  if (!v13)
  {
    if (v14)
      v16 = &stru_1E6D11BB8;
    else
      v16 = (__CFString *)v12;
  }
  v25 = v13;
  v17 = a3;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "repository");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cloudSyncShimProvider");
  v20 = v12;
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "profileManagementShim");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __147__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithProfileIdentifier_contactIdentifier_firstName_lastName_completion___block_invoke;
  v26[3] = &unk_1E6CE7890;
  v26[4] = self;
  v27 = v15;
  v24 = v15;
  objc_msgSend(v22, "createProfileForIdentifier:firstName:lastName:configuration:completion:", v17, v16, v14, v23, v26);

}

void __147__HDCloudSyncSharedSummaryParticipantProfileCreationOperation__createProfileWithProfileIdentifier_contactIdentifier_firstName_lastName_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _HKInitializeLogging();
  v7 = *MEMORY[0x1E0CB5370];
  v8 = *MEMORY[0x1E0CB5370];
  if (v5)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v9;
      v14 = 2114;
      v15 = v5;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Created local profile for identifier %{public}@", (uint8_t *)&v12, 0x16u);
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138543874;
      v13 = v11;
      v14 = 2114;
      v15 = 0;
      v16 = 2114;
      v17 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to create profile for identifier %{public}@: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    v10 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v10();

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
  objc_storeStrong((id *)&self->_participantRecords, 0);
}

@end
