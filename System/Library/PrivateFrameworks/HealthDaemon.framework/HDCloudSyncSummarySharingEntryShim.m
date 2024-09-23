@implementation HDCloudSyncSummarySharingEntryShim

- (HDCloudSyncSummarySharingEntryShim)initWithProfile:(id)a3
{
  id v5;
  HDCloudSyncSummarySharingEntryShim *v6;
  HDCloudSyncSummarySharingEntryShim *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncSummarySharingEntryShim;
  v6 = -[HDCloudSyncSummarySharingEntryShim init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    HKCreateSerialDispatchQueue();
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

  }
  return v7;
}

- (void)disableAllSharingEntriesWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  char v20;
  _QWORD v21[5];
  id v22;

  v6 = a4;
  v7 = a3;
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "contextWithAccessibilityAssertion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setCacheScope:", 1);
  -[HDProfile database](self->_profile, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __91__HDCloudSyncSummarySharingEntryShim_disableAllSharingEntriesWithConfiguration_completion___block_invoke;
  v21[3] = &unk_1E6CEBC00;
  v21[4] = self;
  LOBYTE(v8) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:context:error:block:](HDSummarySharingEntryEntity, "performWriteTransactionWithHealthDatabase:context:error:block:", v11, v10, &v22, v21);
  v13 = v22;

  queue = self->_queue;
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __91__HDCloudSyncSummarySharingEntryShim_disableAllSharingEntriesWithConfiguration_completion___block_invoke_2;
  block[3] = &unk_1E6CEBC78;
  v20 = (char)v8;
  v18 = v13;
  v19 = v6;
  v15 = v13;
  v16 = v6;
  dispatch_async(queue, block);

}

uint64_t __91__HDCloudSyncSummarySharingEntryShim_disableAllSharingEntriesWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sharingEntryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "disableAllSharingEntriesWithError:", a3);

  return v5;
}

uint64_t __91__HDCloudSyncSummarySharingEntryShim_disableAllSharingEntriesWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)sharingEntryExistsWithPredicate:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *queue;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  char v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  id v29;
  _QWORD v30[3];
  char v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityAssertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextWithAccessibilityAssertion:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v31 = 0;
  -[HDProfile database](self->_profile, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  v29 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __95__HDCloudSyncSummarySharingEntryShim_sharingEntryExistsWithPredicate_configuration_completion___block_invoke;
  v26[3] = &unk_1E6CEB640;
  v26[4] = self;
  v16 = v8;
  v27 = v16;
  v28 = v30;
  LOBYTE(v12) = +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDSummarySharingEntryEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v14, v13, &v29, v26);
  v17 = v29;

  queue = self->_queue;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __95__HDCloudSyncSummarySharingEntryShim_sharingEntryExistsWithPredicate_configuration_completion___block_invoke_2;
  v21[3] = &unk_1E6D03810;
  v25 = (char)v12;
  v23 = v10;
  v24 = v30;
  v22 = v17;
  v19 = v17;
  v20 = v10;
  dispatch_async(queue, v21);

  _Block_object_dispose(v30, 8);
}

uint64_t __95__HDCloudSyncSummarySharingEntryShim_sharingEntryExistsWithPredicate_configuration_completion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1[4] + 8), "sharingEntryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "lookupEntryWithPredicate:wasFound:error:", a1[5], *(_QWORD *)(a1[6] + 8) + 24, a3);

  return v6;
}

uint64_t __95__HDCloudSyncSummarySharingEntryShim_sharingEntryExistsWithPredicate_configuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  _BOOL8 v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
    v3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != 0;
  else
    v3 = 0;
  return (*(uint64_t (**)(uint64_t, _BOOL8, BOOL, _QWORD))(v2 + 16))(v2, v3, *(_BYTE *)(a1 + 56) != 0, *(_QWORD *)(a1 + 32));
}

- (void)authorizationIdentifiersForEntriesNotExistingParticipants:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *queue;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  char v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  id v29;
  _QWORD v30[5];
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityAssertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextWithAccessibilityAssertion:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__160;
  v30[4] = __Block_byref_object_dispose__160;
  v31 = 0;
  -[HDProfile database](self->_profile, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __121__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersForEntriesNotExistingParticipants_configuration_completion___block_invoke;
  v26[3] = &unk_1E6CE8DD8;
  v28 = v30;
  v26[4] = self;
  v16 = v8;
  v27 = v16;
  LOBYTE(v12) = +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDSummarySharingEntryEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v14, v13, &v29, v26);
  v17 = v29;

  queue = self->_queue;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __121__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersForEntriesNotExistingParticipants_configuration_completion___block_invoke_2;
  v21[3] = &unk_1E6D03810;
  v23 = v10;
  v24 = v30;
  v25 = (char)v12;
  v22 = v17;
  v19 = v17;
  v20 = v10;
  dispatch_async(queue, v21);

  _Block_object_dispose(v30, 8);
}

BOOL __121__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersForEntriesNotExistingParticipants_configuration_completion___block_invoke(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1[4] + 8), "sharingEntryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationIdentifiersForEntriesNotPresentInSet:error:", a1[5], a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *a3 == 0;
}

uint64_t __121__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersForEntriesNotExistingParticipants_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
}

- (void)pauseStatusForEntriesWithUUIDs:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityAssertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "contextWithAccessibilityAssertion:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDProfile database](self->_profile, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__HDCloudSyncSummarySharingEntryShim_pauseStatusForEntriesWithUUIDs_configuration_completion___block_invoke;
  v18[3] = &unk_1E6D03860;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v15 = v9;
  v16 = v8;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDSummarySharingEntryEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v14, v13, &v21, v18);
  v17 = v21;

}

uint64_t __94__HDCloudSyncSummarySharingEntryShim_pauseStatusForEntriesWithUUIDs_configuration_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sharingEntryManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __94__HDCloudSyncSummarySharingEntryShim_pauseStatusForEntriesWithUUIDs_configuration_completion___block_invoke_2;
  v5[3] = &unk_1E6D03838;
  v3 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "pauseStatusesForUUIDS:completion:", v3, v5);

  return 1;
}

uint64_t __94__HDCloudSyncSummarySharingEntryShim_pauseStatusForEntriesWithUUIDs_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)authorizationIdentifiersByContactIdentifierForParticipants:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *queue;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD *v24;
  char v25;
  _QWORD v26[5];
  id v27;
  _QWORD *v28;
  id v29;
  _QWORD v30[5];
  id v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityAssertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextWithAccessibilityAssertion:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__160;
  v30[4] = __Block_byref_object_dispose__160;
  v31 = 0;
  -[HDProfile database](self->_profile, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __122__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersByContactIdentifierForParticipants_configuration_completion___block_invoke;
  v26[3] = &unk_1E6CE8DD8;
  v28 = v30;
  v26[4] = self;
  v16 = v8;
  v27 = v16;
  LOBYTE(v12) = +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDSummarySharingEntryEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v14, v13, &v29, v26);
  v17 = v29;

  queue = self->_queue;
  v21[0] = v15;
  v21[1] = 3221225472;
  v21[2] = __122__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersByContactIdentifierForParticipants_configuration_completion___block_invoke_2;
  v21[3] = &unk_1E6D03810;
  v23 = v10;
  v24 = v30;
  v25 = (char)v12;
  v22 = v17;
  v19 = v17;
  v20 = v10;
  dispatch_async(queue, v21);

  _Block_object_dispose(v30, 8);
}

BOOL __122__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersByContactIdentifierForParticipants_configuration_completion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1[4] + 8), "sharingEntryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationIdentifiersByContactIdentifiersForOutgoingPendingAndAcceptedParticipants:error:", a1[5], a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

uint64_t __122__HDCloudSyncSummarySharingEntryShim_authorizationIdentifiersByContactIdentifierForParticipants_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32));
}

- (void)codableEntryWithUUID:(id)a3 configuration:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  NSObject *queue;
  id v19;
  id v20;
  _QWORD block[4];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;
  _QWORD *v27;
  id v28;
  _QWORD v29[5];
  id v30;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessibilityAssertion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "contextWithAccessibilityAssertion:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__160;
  v29[4] = __Block_byref_object_dispose__160;
  v30 = 0;
  -[HDProfile database](self->_profile, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __84__HDCloudSyncSummarySharingEntryShim_codableEntryWithUUID_configuration_completion___block_invoke;
  v25[3] = &unk_1E6CE8DD8;
  v27 = v29;
  v25[4] = self;
  v16 = v8;
  v26 = v16;
  +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDSummarySharingEntryEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v14, v13, &v28, v25);
  v17 = v28;

  queue = self->_queue;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __84__HDCloudSyncSummarySharingEntryShim_codableEntryWithUUID_configuration_completion___block_invoke_2;
  block[3] = &unk_1E6D03888;
  v23 = v10;
  v24 = v29;
  v22 = v17;
  v19 = v17;
  v20 = v10;
  dispatch_async(queue, block);

  _Block_object_dispose(v29, 8);
}

BOOL __84__HDCloudSyncSummarySharingEntryShim_codableEntryWithUUID_configuration_completion___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(a1[4] + 8), "sharingEntryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "codableEntryWithUUID:errorOut:", a1[5], a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

uint64_t __84__HDCloudSyncSummarySharingEntryShim_codableEntryWithUUID_configuration_completion___block_invoke_2(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), a1[4]);
}

- (void)insertOrReplaceCodableSharingEntries:(id)a3 shouldResolveCNContact:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  HDProfile *profile;
  id v10;
  void *v11;
  char v12;
  NSObject *queue;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  char v19;
  id v20;

  v5 = a4;
  v8 = a5;
  if (a3)
  {
    profile = self->_profile;
    v10 = a3;
    -[HDProfile sharingEntryManager](profile, "sharingEntryManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v12 = objc_msgSend(v11, "insertOrReplaceCodableEntries:shouldResolveCNContact:error:", v10, v5, &v20);

    a3 = v20;
  }
  else
  {
    v12 = 1;
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __109__HDCloudSyncSummarySharingEntryShim_insertOrReplaceCodableSharingEntries_shouldResolveCNContact_completion___block_invoke;
  v16[3] = &unk_1E6CEBC78;
  v19 = v12;
  v17 = a3;
  v18 = v8;
  v14 = a3;
  v15 = v8;
  dispatch_async(queue, v16);

}

uint64_t __109__HDCloudSyncSummarySharingEntryShim_insertOrReplaceCodableSharingEntries_shouldResolveCNContact_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
