@implementation HDCloudSyncSharedSummaryPushPruningOperation

- (HDCloudSyncSharedSummaryPushPruningOperation)initWithConfiguration:(id)a3 allRecordsToSave:(id)a4 participantZoneIDsToPush:(id)a5 existingTransactionRecordsByZoneID:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDCloudSyncSharedSummaryPushPruningOperation *v13;
  uint64_t v14;
  NSSet *allRecordsToSave;
  uint64_t v16;
  NSSet *participantZoneIDsWithNewTransactionsToPush;
  uint64_t v18;
  NSDictionary *existingTransactionRecordsByZoneID;
  objc_super v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HDCloudSyncSharedSummaryPushPruningOperation;
  v13 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v21, sel_initWithConfiguration_cloudState_, a3, 0);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    allRecordsToSave = v13->_allRecordsToSave;
    v13->_allRecordsToSave = (NSSet *)v14;

    v16 = objc_msgSend(v11, "copy");
    participantZoneIDsWithNewTransactionsToPush = v13->_participantZoneIDsWithNewTransactionsToPush;
    v13->_participantZoneIDsWithNewTransactionsToPush = (NSSet *)v16;

    v18 = objc_msgSend(v12, "copy");
    existingTransactionRecordsByZoneID = v13->_existingTransactionRecordsByZoneID;
    v13->_existingTransactionRecordsByZoneID = (NSDictionary *)v18;

  }
  return v13;
}

- (void)main
{
  void *v3;
  NSSet *participantZoneIDsWithNewTransactionsToPush;
  NSDictionary *existingTransactionRecordsByZoneID;
  id v6;
  _QWORD v7[5];
  id v8;

  -[NSSet hk_map:](self->_allRecordsToSave, "hk_map:", &__block_literal_global_201);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  participantZoneIDsWithNewTransactionsToPush = self->_participantZoneIDsWithNewTransactionsToPush;
  existingTransactionRecordsByZoneID = self->_existingTransactionRecordsByZoneID;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__HDCloudSyncSharedSummaryPushPruningOperation_main__block_invoke_2;
  v7[3] = &unk_1E6D09DC0;
  v7[4] = self;
  v8 = v3;
  v6 = v3;
  -[HDCloudSyncSharedSummaryPushPruningOperation _findTransactionsToDelete:existingTransactionRecordsByZoneID:completion:](self, "_findTransactionsToDelete:existingTransactionRecordsByZoneID:completion:", participantZoneIDsWithNewTransactionsToPush, existingTransactionRecordsByZoneID, v7);

}

uint64_t __52__HDCloudSyncSharedSummaryPushPruningOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recordID");
}

void __52__HDCloudSyncSharedSummaryPushPruningOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_recordIDsForTransactions:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_minus:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_filterRecordsThatExistInTheCloud:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count") || objc_msgSend(v4, "count"))
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v5, "allObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_modifyRecordsAndFinish:recordIDsToDelete:", v7, v8);

  }
  else
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: [summary-sharing] No records found to push or prune.", (uint8_t *)&v11, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
  }

}

- (void)_findTransactionsToDelete:(id)a3 existingTransactionRecordsByZoneID:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[5];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke;
  v27[3] = &unk_1E6D09E50;
  v13 = v11;
  v28 = v13;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v27);
  -[HDCloudSyncOperation configuration](self, "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "repository");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cloudSyncShimProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sharedSummariesShim");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_5;
  v22[3] = &unk_1E6D09E78;
  v25 = v9;
  v26 = v10;
  v22[4] = self;
  v23 = v13;
  v24 = v8;
  v18 = v9;
  v19 = v8;
  v20 = v13;
  v21 = v10;
  objc_msgSend(v17, "deviceIdentifierWithCompletion:", v22);

}

void __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, void *);
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, void *);
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v31;
  id obj;
  _QWORD v33[4];
  id v34;
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v41;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v41 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v9), "sourceDeviceIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v7);
  }

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v37;
    v14 = MEMORY[0x1E0C809B0];
    v15 = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_2;
    v16 = &unk_1E6CF2160;
    v29 = *(_QWORD *)v37;
    do
    {
      v17 = 0;
      v31 = v12;
      do
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v17);
        v35[0] = v14;
        v35[1] = 3221225472;
        v35[2] = v15;
        v35[3] = v16;
        v35[4] = v18;
        objc_msgSend(v5, "hk_filter:", v35, v29);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v19, "count") >= 2)
        {
          objc_msgSend(v19, "hk_firstSortedObjectWithComparison:", &__block_literal_global_187);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v33[0] = v14;
          v33[1] = 3221225472;
          v33[2] = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_4;
          v33[3] = &unk_1E6D09E28;
          v34 = v20;
          v21 = v5;
          v22 = v14;
          v23 = v15;
          v24 = v20;
          objc_msgSend(v19, "objectsPassingTest:", v33);
          v25 = v16;
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = *(void **)(a1 + 32);
          objc_msgSend(v26, "allObjects");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "addObjectsFromArray:", v28);

          v16 = v25;
          v15 = v23;
          v14 = v22;
          v5 = v21;
          v13 = v29;
          v12 = v31;
        }

        ++v17;
      }
      while (v12 != v17);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    }
    while (v12);
  }

}

uint64_t __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "sourceDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    v7 = 1;
  }
  else if (v5)
  {
    objc_msgSend(v3, "sourceDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v4 = a3;
  objc_msgSend(a2, "record");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "hk_isAfterDate:", v8);

  if (v9)
    return -1;
  else
    return 1;
}

uint64_t __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4) ^ 1;

  return v5;
}

void __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  id v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v22 = v5;
  if (v5)
  {
    v21 = v6;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = *(id *)(a1 + 48);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)MEMORY[0x1E0C99E20];
          objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setWithSet:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v23[0] = MEMORY[0x1E0C809B0];
            v23[1] = 3221225472;
            v23[2] = __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_190;
            v23[3] = &unk_1E6CF2160;
            v24 = v22;
            objc_msgSend(v15, "hk_filter:", v23);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = *(void **)(a1 + 40);
            objc_msgSend(v16, "allObjects");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "addObjectsFromArray:", v18);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    v7 = v21;
  }
  else
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v31 = v20;
      v32 = 2114;
      v33 = v7;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Error fetching device identifier. Unable to attempt to prune previously existing transactions for this device. %{public}@", buf, 0x16u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

uint64_t __120__HDCloudSyncSharedSummaryPushPruningOperation__findTransactionsToDelete_existingTransactionRecordsByZoneID_completion___block_invoke_190(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "sourceDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    v7 = 1;
  }
  else if (v5)
  {
    objc_msgSend(v3, "sourceDeviceIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_recordIDsForTransactions:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    v8 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v10, "summaryIdentifiers");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v8;
        v16[1] = 3221225472;
        v16[2] = __74__HDCloudSyncSharedSummaryPushPruningOperation__recordIDsForTransactions___block_invoke;
        v16[3] = &unk_1E6D09EA0;
        v16[4] = v10;
        objc_msgSend(v11, "hk_map:", v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "recordID");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v13);

        objc_msgSend(v4, "addObjectsFromArray:", v12);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

  return v4;
}

id __74__HDCloudSyncSharedSummaryPushPruningOperation__recordIDsForTransactions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncSharedSummaryRecord recordIDWithZoneID:UUID:](HDCloudSyncSharedSummaryRecord, "recordIDWithZoneID:UUID:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_filterRecordsThatExistInTheCloud:(id)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__HDCloudSyncSharedSummaryPushPruningOperation__filterRecordsThatExistInTheCloud___block_invoke;
  v4[3] = &unk_1E6CEC6A0;
  v4[4] = self;
  objc_msgSend(a3, "hk_filter:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __82__HDCloudSyncSharedSummaryPushPruningOperation__filterRecordsThatExistInTheCloud___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HDCloudSyncCachedZone *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "zoneID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "repository");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryCKContainer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "containerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncZoneIdentifier identifierForZone:container:scope:](HDCloudSyncZoneIdentifier, "identifierForZone:container:scope:", v5, v9, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [HDCloudSyncCachedZone alloc];
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "repository");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityAssertion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDCloudSyncCachedZone initForZoneIdentifier:repository:accessibilityAssertion:](v11, "initForZoneIdentifier:repository:accessibilityAssertion:", v10, v13, v15);

  objc_msgSend(v3, "recordID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v18 = objc_msgSend(v16, "containsRecordWithRecordID:error:", v17, &v26);
  v19 = v26;

  if (v18 != 1)
  {
    if (v18)
    {
      v21 = 1;
      goto LABEL_7;
    }
    _HKInitializeLogging();
    v20 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = v20;
      objc_msgSend(v3, "recordID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v23;
      v29 = 2114;
      v30 = v25;
      v31 = 2114;
      v32 = v19;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@ [summary-sharing] Failed to fetch status of summary record %{public}@, %{public}@", buf, 0x20u);

    }
  }
  v21 = 0;
LABEL_7:

  return v21;
}

- (void)_modifyRecordsAndFinish:(id)a3 recordIDsToDelete:(id)a4
{
  id v6;
  id v7;
  HDCloudSyncModifyRecordsOperation *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDCloudSyncModifyRecordsOperation *v13;
  uint64_t v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v6 = a4;
  v7 = a3;
  v8 = [HDCloudSyncModifyRecordsOperation alloc];
  -[HDCloudSyncOperation configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "repository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryCKContainer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v8, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v9, v12, v7, v6);

  -[HDCloudSyncModifyRecordsOperation setPermitNonAtomicZoneSaves:](v13, "setPermitNonAtomicZoneSaves:", 1);
  v14 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __90__HDCloudSyncSharedSummaryPushPruningOperation__modifyRecordsAndFinish_recordIDsToDelete___block_invoke;
  v16[3] = &unk_1E6CE77A0;
  v16[4] = self;
  -[HDCloudSyncOperation setOnError:](v13, "setOnError:", v16);
  v15[0] = v14;
  v15[1] = 3221225472;
  v15[2] = __90__HDCloudSyncSharedSummaryPushPruningOperation__modifyRecordsAndFinish_recordIDsToDelete___block_invoke_199;
  v15[3] = &unk_1E6CE7778;
  v15[4] = self;
  -[HDCloudSyncOperation setOnSuccess:](v13, "setOnSuccess:", v15);
  -[HDCloudSyncOperation start](v13, "start");

}

void __90__HDCloudSyncSharedSummaryPushPruningOperation__modifyRecordsAndFinish_recordIDsToDelete___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138543618;
    v8 = v6;
    v9 = 2114;
    v10 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Failed to modify records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

uint64_t __90__HDCloudSyncSharedSummaryPushPruningOperation__modifyRecordsAndFinish_recordIDsToDelete___block_invoke_199(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_existingTransactionRecordsByZoneID, 0);
  objc_storeStrong((id *)&self->_participantZoneIDsWithNewTransactionsToPush, 0);
  objc_storeStrong((id *)&self->_allRecordsToSave, 0);
  objc_storeStrong((id *)&self->_participant, 0);
  objc_storeStrong((id *)&self->_authorizationIdentifiers, 0);
}

@end
