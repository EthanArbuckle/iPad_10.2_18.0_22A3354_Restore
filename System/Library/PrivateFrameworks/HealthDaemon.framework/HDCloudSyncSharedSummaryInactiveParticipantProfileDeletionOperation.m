@implementation HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation

- (HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation)initWithConfiguration:(id)a3 participants:(id)a4
{
  id v6;
  HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation *v7;
  uint64_t v8;
  NSArray *participantRecords;
  HDSynchronousTaskGroup *v10;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation;
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
  uint64_t v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  NSArray *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation *v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = 112;
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v22 = self;
  v4 = self->_participantRecords;
  v24 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v27;
    v5 = MEMORY[0x1E0C809B0];
    v6 = __75__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation_main__block_invoke;
    v7 = &unk_1E6CE77C8;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v23)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        objc_msgSend(v9, "relationshipDirection");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "longValue") == 1)
        {
          objc_msgSend(v9, "relationshipType");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v11, "longValue"))
          {
            objc_msgSend(v9, "relationshipStatus");
            v14 = v7;
            v15 = v6;
            v16 = v5;
            v17 = v4;
            v18 = v3;
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v19, "longValue");

            v3 = v18;
            v4 = v17;
            v5 = v16;
            v6 = v15;
            v7 = v14;

            if (v21 == 1)
              goto LABEL_12;
            goto LABEL_10;
          }

        }
LABEL_10:
        objc_msgSend(v9, "relationshipStatus");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "longValue");

        if (v13)
        {
          objc_msgSend(*(id *)((char *)&v22->super.super.isa + v3), "beginTask");
          v25[0] = v5;
          v25[1] = 3221225472;
          v25[2] = v6;
          v25[3] = v7;
          v25[4] = v22;
          -[HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation _deleteLocalProfileIfNecessaryForParticipant:completion:](v22, "_deleteLocalProfileIfNecessaryForParticipant:completion:", v9, v25);
        }
LABEL_12:
        ++v8;
      }
      while (v24 != v8);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v24 = v20;
    }
    while (v20);
  }

  objc_msgSend(*(id *)((char *)&v22->super.super.isa + v3), "finishTask");
}

uint64_t __75__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "failTaskWithError:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "finishTask");
}

- (void)_deleteLocalProfileIfNecessaryForParticipant:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation *v23;
  void (**v24)(id, uint64_t, _QWORD);

  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  v7 = (void *)MEMORY[0x1E0CB6A10];
  objc_msgSend(a3, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_profileWithUUID:type:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "repository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profileIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqual:", v12);

  if (v13)
  {
    v6[2](v6, 1, 0);
  }
  else
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "repository");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cloudSyncShimProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "profileManagementShim");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __127__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation__deleteLocalProfileIfNecessaryForParticipant_completion___block_invoke;
    v20[3] = &unk_1E6CEA250;
    v24 = v6;
    v21 = v17;
    v22 = v9;
    v23 = self;
    v19 = v17;
    objc_msgSend(v19, "profileExistsForProfileIdentifier:configuration:completion:", v22, v18, v20);

  }
}

void __127__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation__deleteLocalProfileIfNecessaryForParticipant_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void (*v6)(void);
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (a2 == 2)
  {
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  else
  {
    if (a2)
    {
      v7 = *(void **)(a1 + 32);
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "configuration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __127__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation__deleteLocalProfileIfNecessaryForParticipant_completion___block_invoke_2;
      v10[3] = &unk_1E6CE77F0;
      v11 = *(id *)(a1 + 56);
      objc_msgSend(v7, "deleteProfile:configuration:completion:", v8, v9, v10);

      goto LABEL_7;
    }
    v6 = *(void (**)(void))(*(_QWORD *)(a1 + 56) + 16);
  }
  v6();
LABEL_7:

}

uint64_t __127__HDCloudSyncSharedSummaryInactiveParticipantProfileDeletionOperation__deleteLocalProfileIfNecessaryForParticipant_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
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
