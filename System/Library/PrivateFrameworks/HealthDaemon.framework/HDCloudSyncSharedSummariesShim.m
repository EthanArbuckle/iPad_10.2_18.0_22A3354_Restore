@implementation HDCloudSyncSharedSummariesShim

- (HDCloudSyncSharedSummariesShim)initWithProfile:(id)a3
{
  id v5;
  HDCloudSyncSharedSummariesShim *v6;
  HDCloudSyncSharedSummariesShim *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDCloudSyncSharedSummariesShim;
  v6 = -[HDCloudSyncSharedSummariesShim init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_profile, a3);

  return v7;
}

- (void)deleteAllSharedSummaryTransactionsWithConfiguration:(id)a3 completion:(id)a4
{
  void (**v6)(id, _BOOL8, id);
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v6 = (void (**)(id, _BOOL8, id))a4;
  v7 = a3;
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextWithAccessibilityAssertion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setCacheScope:", 1);
  objc_msgSend(v7, "repository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v16[4] = self;
  v17 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __97__HDCloudSyncSharedSummariesShim_deleteAllSharedSummaryTransactionsWithConfiguration_completion___block_invoke;
  v16[3] = &unk_1E6CEBC00;
  v14 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:context:error:block:](HDSharedSummaryTransactionEntity, "performWriteTransactionWithHealthDatabase:context:error:block:", v13, v10, &v17, v16);
  v15 = v17;
  v6[2](v6, v14, v15);

}

uint64_t __97__HDCloudSyncSharedSummariesShim_deleteAllSharedSummaryTransactionsWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sharedSummaryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deleteAllTransactionsWithError:", a3);

  return v5;
}

- (void)fetchAllSharedSummaryTransactionsWithRepository:(id)a3 completion:(id)a4
{
  void (**v5)(id, void *, id);
  void *v6;
  void *v7;
  id v8;
  id v9;

  v5 = (void (**)(id, void *, id))a4;
  objc_msgSend(a3, "sharedSummaryManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v6, "fetchAllTransactionsWithError:", &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  v5[2](v5, v7, v8);
}

- (void)prepareAndCommitRepository:(id)a3 transactionWithUUID:(id)a4 sourceDeviceIdentifier:(id)a5 metadata:(id)a6 sharedSummaries:(id)a7 completion:(id)a8
{
  HDProfile *profile;
  void (**v13)(id, uint64_t, id);
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;

  profile = self->_profile;
  v13 = (void (**)(id, uint64_t, id))a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  -[HDProfile sharedSummaryManager](profile, "sharedSummaryManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v19 = objc_msgSend(v18, "prepareAndCommitTransactionWithUUID:sourceDeviceIdentifier:metadata:sharedSummaries:error:", v17, v16, v15, v14, &v21);

  v20 = v21;
  v13[2](v13, v19, v20);

}

- (void)deleteTransactions:(id)a3 completion:(id)a4
{
  HDProfile *profile;
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  profile = self->_profile;
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[HDProfile sharedSummaryManager](profile, "sharedSummaryManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "deleteTransactions:error:", v7, &v11);

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)fetchAllTransactionsWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[6];
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, id))a4;
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityAssertion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contextWithAccessibilityAssertion:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setCacheScope:", 1);
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__42;
  v19 = __Block_byref_object_dispose__42;
  v20 = 0;
  -[HDProfile database](self->_profile, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __83__HDCloudSyncSharedSummariesShim_fetchAllTransactionsWithConfiguration_completion___block_invoke;
  v13[3] = &unk_1E6CEF700;
  v13[4] = self;
  v13[5] = &v15;
  objc_msgSend(v11, "performTransactionWithContext:error:block:inaccessibilityHandler:", v10, &v14, v13, 0);
  v12 = v14;

  v7[2](v7, v16[5], v12);
  _Block_object_dispose(&v15, 8);

}

BOOL __83__HDCloudSyncSharedSummariesShim_fetchAllTransactionsWithConfiguration_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sharedSummaryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchCommittedTransactionsWithError:", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (void)deviceIdentifierWithCompletion:(id)a3
{
  HDProfile *profile;
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  id v8;

  profile = self->_profile;
  v4 = (void (**)(id, void *, id))a3;
  -[HDProfile sharedSummaryManager](profile, "sharedSummaryManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  objc_msgSend(v5, "deviceIdentifierWithError:", &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)summariesFromTransaction:(id)a3 authorizationIdentifiers:(id)a4 completion:(id)a5
{
  id v8;
  objc_class *v9;
  void (**v10)(id, uint64_t, id, id, id);
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v8 = a4;
  v9 = (objc_class *)MEMORY[0x1E0C99DE8];
  v10 = (void (**)(id, uint64_t, id, id, id))a5;
  v11 = a3;
  v12 = objc_alloc_init(v9);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDProfile sharedSummaryManager](self->_profile, "sharedSummaryManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __95__HDCloudSyncSharedSummariesShim_summariesFromTransaction_authorizationIdentifiers_completion___block_invoke;
  v20[3] = &unk_1E6CEF728;
  v21 = v8;
  v22 = v13;
  v23 = v12;
  v15 = v12;
  v16 = v13;
  v17 = v8;
  v18 = objc_msgSend(v14, "enumerateSummariesInTransaction:package:names:includedObjectTypes:error:handler:", v11, 0, 0, 0, &v24, v20);

  v19 = v24;
  v10[2](v10, v18, v15, v16, v19);

}

void __95__HDCloudSyncSharedSummariesShim_summariesFromTransaction_authorizationIdentifiers_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "authorizationIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v10, "authorizationIdentifiers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v5, "hk_containsObjectsInArray:", v7);

    if ((_DWORD)v5)
    {
      v8 = *(void **)(a1 + 40);
      objc_msgSend(v10, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profile, 0);
}

@end
