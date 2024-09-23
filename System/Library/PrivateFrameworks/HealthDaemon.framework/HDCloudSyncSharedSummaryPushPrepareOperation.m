@implementation HDCloudSyncSharedSummaryPushPrepareOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HDCloudSyncCachedZone *v9;
  id v10;
  HDCloudSyncCachedZone *privateMetadataZone;
  HDCloudSyncCachedZone *v12;
  BOOL v13;
  HDCloudSyncSharedSummaryPushPrepareOperation *v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  _QWORD v18[5];
  id v19;
  uint8_t buf[4];
  HDCloudSyncSharedSummaryPushPrepareOperation *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedCloudState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryCKContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v6, "privateMetadataZoneForContainerID:error:", v8, &v19);
  v9 = (HDCloudSyncCachedZone *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  privateMetadataZone = self->_privateMetadataZone;
  self->_privateMetadataZone = v9;

  v12 = self->_privateMetadataZone;
  if (v12)
    v13 = 1;
  else
    v13 = v10 == 0;
  if (!v13)
  {
    v14 = self;
    v15 = 0;
    v16 = v10;
LABEL_11:
    -[HDCloudSyncOperation finishWithSuccess:error:](v14, "finishWithSuccess:error:", v15, v16);
    goto LABEL_12;
  }
  if (!v12)
  {
    _HKInitializeLogging();
    v17 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_1B7802000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] The metadata zone does not exist. Unable to continue push operation.", buf, 0xCu);
    }
    v14 = self;
    v15 = 1;
    v16 = 0;
    goto LABEL_11;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke;
  v18[3] = &unk_1E6CF3370;
  v18[4] = self;
  -[HDCloudSyncSharedSummaryPushPrepareOperation _fetchAllTransactionsWithCompletion:](self, "_fetchAllTransactionsWithCompletion:", v18);
LABEL_12:

}

void __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6;
  id *v7;
  _QWORD *v8;
  uint64_t v9;
  _QWORD v10[5];

  v6 = a2;
  v7 = *(id **)(a1 + 32);
  if (v6)
  {
    objc_storeStrong(v7 + 13, a2);
    v8 = *(_QWORD **)(a1 + 32);
    v9 = v8[16];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke_2;
    v10[3] = &unk_1E6CF3370;
    v10[4] = v8;
    objc_msgSend(v8, "_pendingAndAcceptedParticipantRecordsInZone:completion:", v9, v10);
  }
  else
  {
    objc_msgSend(v7, "finishWithSuccess:error:", 0, a3);
  }

}

void __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  _QWORD v14[5];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  if (!v6)
  {
    v9 = *(void **)(a1 + 32);
    v10 = 0;
    v11 = v7;
LABEL_8:
    objc_msgSend(v9, "finishWithSuccess:error:", v10, v11);
    goto LABEL_9;
  }
  if (!objc_msgSend(v6, "count"))
  {
    _HKInitializeLogging();
    v12 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v16 = v13;
      _os_log_impl(&dword_1B7802000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] No pending or accepted participants found", buf, 0xCu);
    }
    v9 = *(void **)(a1 + 32);
    v10 = 1;
    v11 = 0;
    goto LABEL_8;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 112), a2);
  v8 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke_183;
  v14[3] = &unk_1E6CF3348;
  v14[4] = v8;
  objc_msgSend(v8, "_fetchAuthorizationIdentifiersByContactIdentifierForParticipants:completion:", v6, v14);
LABEL_9:

}

void __52__HDCloudSyncSharedSummaryPushPrepareOperation_main__block_invoke_183(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id *v7;
  id v8;
  id *v9;
  uint64_t v10;
  id v11;

  v6 = a2;
  v7 = *(id **)(a1 + 32);
  v11 = v6;
  if (v6)
  {
    objc_storeStrong(v7 + 15, a2);
    v8 = a3;
    v9 = *(id **)(a1 + 32);
    v10 = 1;
  }
  else
  {
    v8 = a3;
    v9 = v7;
    v10 = 0;
  }
  objc_msgSend(v9, "finishWithSuccess:error:", v10, v8);

}

- (void)_fetchAllTransactionsWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cloudSyncShimProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sharedSummariesShim");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAllTransactionsWithCompletion___block_invoke;
  v11[3] = &unk_1E6CF3398;
  v12 = v4;
  v10 = v4;
  objc_msgSend(v8, "fetchAllTransactionsWithConfiguration:completion:", v9, v11);

}

uint64_t __84__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAllTransactionsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_pendingAndAcceptedParticipantRecordsInZone:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v6 = a4;
  v7 = a3;
  v21 = 0;
  objc_msgSend(v7, "recordsForClass:error:", objc_opt_class(), &v21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v21;
  if (v8)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "repository");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "cloudSyncShimProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "summarySharingEntryShim");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "hk_filter:", &__block_literal_global_67);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_map:", &__block_literal_global_188);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_3;
    v18[3] = &unk_1E6CF3420;
    v18[4] = self;
    v19 = v14;
    v20 = v6;
    v17 = v14;
    objc_msgSend(v13, "pauseStatusForEntriesWithUUIDs:configuration:completion:", v15, v16, v18);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v6 + 2))(v6, 0, v9);
  }

}

BOOL __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  void *v6;
  unint64_t v7;

  v2 = a2;
  objc_msgSend(v2, "relationshipDirection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "longValue");

  if (v4 == 1)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v2, "relationshipStatus");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "longValue");

    v5 = v7 < 2;
  }

  return v5;
}

uint64_t __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUID");
}

void __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_3(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138543618;
      v14 = v10;
      v15 = 2114;
      v16 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to read pause status for participants with error %{public}@.", buf, 0x16u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    v8 = (void *)a1[5];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_189;
    v11[3] = &unk_1E6CF2110;
    v12 = v5;
    objc_msgSend(v8, "hk_filter:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(a1[6] + 16))();

  }
}

uint64_t __103__HDCloudSyncSharedSummaryPushPrepareOperation__pendingAndAcceptedParticipantRecordsInZone_completion___block_invoke_189(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsObject:", v5))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", MEMORY[0x1E0C9AAA0]);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_fetchAuthorizationIdentifiersByContactIdentifierForParticipants:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  objc_msgSend(a3, "hk_mapToSet:", &__block_literal_global_190);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudSyncShimProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "summarySharingEntryShim");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __124__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAuthorizationIdentifiersByContactIdentifierForParticipants_completion___block_invoke_2;
  v14[3] = &unk_1E6CF3468;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v11, "authorizationIdentifiersByContactIdentifierForParticipants:configuration:completion:", v7, v12, v14);

}

uint64_t __124__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAuthorizationIdentifiersByContactIdentifierForParticipants_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "contactIdentifier");
}

uint64_t __124__HDCloudSyncSharedSummaryPushPrepareOperation__fetchAuthorizationIdentifiersByContactIdentifierForParticipants_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSArray)allTransactions
{
  return self->_allTransactions;
}

- (NSArray)pendingAndAcceptedParticipants
{
  return self->_pendingAndAcceptedParticipants;
}

- (NSDictionary)authorizationIdentifiersByContactIdentifier
{
  return self->_authorizationIdentifiersByContactIdentifier;
}

- (HDCloudSyncCachedZone)privateMetadataZone
{
  return self->_privateMetadataZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateMetadataZone, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiersByContactIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingAndAcceptedParticipants, 0);
  objc_storeStrong((id *)&self->_allTransactions, 0);
}

@end
