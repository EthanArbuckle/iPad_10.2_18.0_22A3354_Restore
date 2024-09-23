@implementation HDCloudSyncPullChangeRecordOperation

- (HDCloudSyncPullChangeRecordOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("The -%@ method is not available on %@"), v7, objc_opt_class());

  return 0;
}

- (HDCloudSyncPullChangeRecordOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 target:(id)a5 sequenceRecord:(id)a6 changeRecord:(id)a7
{
  id v13;
  id v14;
  id v15;
  HDCloudSyncPullChangeRecordOperation *v16;
  HDCloudSyncPullChangeRecordOperation *v17;
  objc_super v19;

  v13 = a5;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)HDCloudSyncPullChangeRecordOperation;
  v16 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v19, sel_initWithConfiguration_cloudState_, a3, a4);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_target, a5);
    objc_storeStrong((id *)&v17->_sequenceRecord, a6);
    objc_storeStrong((id *)&v17->_changeRecord, a7);
  }

  return v17;
}

+ (int64_t)progressCount
{
  return 200;
}

- (void)main
{
  void *v3;
  void *v4;
  char v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[6];
  _QWORD v27[6];
  BOOL v28;
  _QWORD v29[5];
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncChangeRecord sequenceRecordID](self->_changeRecord, "sequenceRecordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncRecord recordID](self->_sequenceRecord, "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
  {
    v6 = objc_alloc(MEMORY[0x1E0C94E18]);
    -[HDCloudSyncRecord recordID](self->_changeRecord, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithRecordIDs:", v8);

    +[HDCloudSyncChangeRecord assetKeys](HDCloudSyncChangeRecord, "assetKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDCloudSyncChangeRecord nonAssetKeys](HDCloudSyncChangeRecord, "nonAssetKeys");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "arrayByAddingObjectsFromArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDesiredKeys:", v12);

    v13 = -[HDCloudSyncChangeRecord shouldFetchAssetContentInMemory](self->_changeRecord, "shouldFetchAssetContentInMemory");
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v9, "setShouldFetchAssetContentInMemory:", 1);
      objc_msgSend(v9, "setDropInMemoryAssetContentASAP:", 1);
    }
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x3032000000;
    v29[3] = __Block_byref_object_copy__98;
    v29[4] = __Block_byref_object_dispose__98;
    v30 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __44__HDCloudSyncPullChangeRecordOperation_main__block_invoke;
    v27[3] = &unk_1E6CF9138;
    v27[4] = self;
    v27[5] = v29;
    v28 = v14;
    objc_msgSend(v9, "setPerRecordCompletionBlock:", v27);
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __44__HDCloudSyncPullChangeRecordOperation_main__block_invoke_194;
    v26[3] = &unk_1E6CF9160;
    v26[4] = self;
    v26[5] = v29;
    objc_msgSend(v9, "setFetchRecordsCompletionBlock:", v26);
    -[HDCloudSyncOperation configuration](self, "configuration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "cachedCloudState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setOperationCountForAnalytics:", objc_msgSend(v17, "operationCountForAnalytics") + 1);

    -[HDCloudSyncOperation configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "operationGroup");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setGroup:", v19);

    -[HDCloudSyncTarget container](self->_target, "container");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "repository");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "profileIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HDDatabaseForContainer(v20, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "addOperation:", v9);
    _Block_object_dispose(v29, 8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 709, CFSTR("Change record %@ does not match this sequence record (%@)"), self->_changeRecord, self->_sequenceRecord);
    v25 = (id)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v25);

  }
}

void __44__HDCloudSyncPullChangeRecordOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  NSObject *v5;
  void *v8;
  char v9;
  id v10;
  id v11;
  NSObject **v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE buf[24];
  void *v36;
  id v37;
  id v38;
  id *v39;
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    _HKInitializeLogging();
    v5 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
    {
      v27 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v27;
      _os_log_fault_impl(&dword_1B7802000, v5, OS_LOG_TYPE_FAULT, "%{public}@: Multiple calls to perRecordCompletionBlock.", buf, 0xCu);
    }
  }
  else
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_BYTE *)(a1 + 48);
    v10 = a2;
    v28 = a3;
    v11 = a4;
    if (v8)
    {
      objc_msgSend(v8, "updateCompletedProgressCount:", 100);
      _HKInitializeLogging();
      v12 = (NSObject **)MEMORY[0x1E0CB5370];
      v13 = *MEMORY[0x1E0CB5370];
      v14 = *MEMORY[0x1E0CB5370];
      if (v10)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v10;
          _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Persisting fetched change record %{public}@", buf, 0x16u);
        }
        v15 = v10;
        v29 = 0;
        v30 = &v29;
        v31 = 0x3032000000;
        v32 = __Block_byref_object_copy__213;
        v33 = __Block_byref_object_dispose__214;
        v34 = 0;
        v16 = MEMORY[0x1E0C809B0];
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __103__HDCloudSyncPullChangeRecordOperation__zipArchiveExtractorForChangeRecord_assetContentInMemory_error___block_invoke;
        v36 = &unk_1E6CF91B0;
        v40 = v9;
        v39 = &v29;
        v37 = v8;
        v17 = v15;
        v38 = v17;
        if (HKWithAutoreleasePool())
          v18 = v30[5];
        else
          v18 = 0;
        v20 = v18;

        _Block_object_dispose(&v29, 8);
        v21 = 0;
        v19 = v21;
        if (v20)
        {
          v29 = 0;
          +[HDCloudSyncChangeRecord recordWithCKRecord:error:](HDCloudSyncChangeRecord, "recordWithCKRecord:error:", v17, &v29, v28);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = v29;
          if (v22)
          {
            *(_QWORD *)buf = v16;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_2;
            v36 = &unk_1E6CF0678;
            v37 = v22;
            v38 = v8;
            v39 = (id *)v20;
            v8 = _Block_copy(buf);

          }
          else
          {
            _HKInitializeLogging();
            v24 = *v12;
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v8;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v23;
              _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "%{public}@: change record instantiation failed: %{public}@", buf, 0x16u);
            }
            *(_QWORD *)buf = v16;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_200;
            v36 = &unk_1E6CECC80;
            v37 = v23;
            v8 = _Block_copy(buf);
          }

        }
        else
        {
          *(_QWORD *)buf = v16;
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_199;
          v36 = &unk_1E6CF9188;
          v37 = v21;
          v38 = v8;
          v8 = _Block_copy(buf);
          v23 = v37;
        }

      }
      else
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v8;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v11;
          _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch change asset: %{public}@", buf, 0x16u);
        }
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke;
        v36 = &unk_1E6CF0678;
        v37 = v11;
        v38 = v8;
        v39 = (id *)v28;
        v8 = _Block_copy(buf);

        v19 = v37;
      }

    }
    v25 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v26 = *(void **)(v25 + 40);
    *(_QWORD *)(v25 + 40) = v8;

  }
}

void __44__HDCloudSyncPullChangeRecordOperation_main__block_invoke_194(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v23 = *(_QWORD *)(a1 + 32);
      v24 = *(_QWORD *)(v23 + 128);
      *(_DWORD *)buf = 138543874;
      v28 = v23;
      v29 = 2114;
      v30 = v24;
      v31 = 2114;
      v32 = v6;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed record fetch for change %{public}@: %{public}@", buf, 0x20u);
    }
    v8 = *(id **)(a1 + 32);
    objc_msgSend(v8[16], "recordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    -[HDCloudSyncPullChangeRecordOperation _handlePossibleCacheDiscrepancyWithRecordID:fetchError:errorOut:](v8, v9, v6, &v26);
    v10 = v26;

  }
  else
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v14)
    {
      v19 = *(id **)(a1 + 32);
      v20 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v19[16], "recordID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hk_error:format:", 720, CFSTR("Failed to fetch requested change record %@"), v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "finishWithSuccess:error:", 0, v22);

      goto LABEL_7;
    }
    v25 = 0;
    v15 = (*(uint64_t (**)(uint64_t, id *))(v14 + 16))(v14, &v25);
    v10 = v25;
    if (v15)
    {
      _HKInitializeLogging();
      v16 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(_QWORD *)(v17 + 128);
        *(_DWORD *)buf = 138543618;
        v28 = v17;
        v29 = 2114;
        v30 = v18;
        _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: Finished record fetch for change %{public}@", buf, 0x16u);
      }
      v11 = *(void **)(a1 + 32);
      v12 = 1;
      v13 = 0;
      goto LABEL_6;
    }
  }
  v11 = *(void **)(a1 + 32);
  v12 = 0;
  v13 = v10;
LABEL_6:
  objc_msgSend(v11, "finishWithSuccess:error:", v12, v13);

LABEL_7:
}

- (void)_handlePossibleCacheDiscrepancyWithRecordID:(void *)a3 fetchError:(_QWORD *)a4 errorOut:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (a1)
  {
    v8 = a2;
    objc_msgSend(a1, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cachedCloudState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[14], "container");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "containerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v10, "zoneForRecordID:containerIdentifier:error:", v8, v12, &v25);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v25;
    if (v13)
    {
      objc_msgSend(a1[14], "container");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "repository");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "profileIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      HDDatabaseForContainer(v15, v18);
      v19 = v14;
      v20 = a4;
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1[14], "container");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleCloudError:operation:container:database:", v7, a1, v22, v21);

      a4 = v20;
      v14 = v19;
    }
    else
    {
      _HKInitializeLogging();
      v23 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v27 = a1;
        v28 = 2114;
        v29 = v14;
        _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Failed to lookup zone during cache discrepancy reporting %{public}@", buf, 0x16u);
      }
    }
    v24 = v7;
    if (v24)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v24);
      else
        _HKLogDroppedError();
    }

  }
}

uint64_t __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C947D8]);

  if ((v5 & 1) != 0)
  {
    -[HDCloudSyncPullChangeRecordOperation _handlePossibleCacheDiscrepancyWithRecordID:fetchError:errorOut:](*(id **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 32), a2);
  }
  else
  {
    v6 = *(id *)(a1 + 32);
    if (v6)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v6);
      else
        _HKLogDroppedError();
    }

  }
  return 0;
}

uint64_t __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_199(uint64_t a1, _QWORD *a2)
{
  id v4;

  v4 = *(id *)(a1 + 32);
  if (v4)
  {
    if (a2)
      *a2 = objc_retainAutorelease(v4);
    else
      _HKLogDroppedError();
  }

  return -[HDCloudSyncPullChangeRecordOperation _shouldSucceedWithAssetExtractionError:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
}

- (uint64_t)_shouldSucceedWithAssetExtractionError:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  os_log_t *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  BOOL v25;
  id v26;
  NSObject *v27;
  id v29;
  id v30;
  id v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend((id)a1, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "legacyRepositoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncKeyValueDomainWithProfile(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncPullChangeRecordOperation _assetExtractionFailureCountKey](a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    objc_msgSend(v8, "numberForKey:error:", v9, &v31);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v31;
    v12 = v11;
    v13 = (os_log_t *)MEMORY[0x1E0CB5370];
    if (!v10)
    {
      if (v11)
      {
        _HKInitializeLogging();
        v14 = *v13;
        if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v33 = (uint64_t)v9;
          v34 = 2114;
          v35 = v12;
          _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to get value for %{public}@: %{public}@.", buf, 0x16u);
        }
      }
    }
    v15 = objc_msgSend(v10, "integerValue");

    _HKInitializeLogging();
    v16 = *v13;
    v17 = os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR);
    if (v15 > 1)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138543618;
        v33 = a1;
        v34 = 2114;
        v35 = v3;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: skip record due to multiple failures to extract archive: %{public}@", buf, 0x16u);
      }
      v29 = v3;
      -[HDCloudSyncPullChangeRecordOperation _setAssetExtractionFailureCount:]((void *)a1, 0);
      objc_msgSend(*(id *)(a1 + 128), "decodedSyncAnchorRangeMap");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSyncAnchorMap syncAnchorMapWithSyncAnchorRangeMap:](HDSyncAnchorMap, "syncAnchorMapWithSyncAnchorRangeMap:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 112), "store");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)a1, "configuration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "repository");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "profile");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "legacyRepositoryProfile");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      v25 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:type:store:updatePolicy:resetInvalid:profile:error:](HDSyncAnchorEntity, "updateSyncAnchorsWithMap:type:store:updatePolicy:resetInvalid:profile:error:", v19, 3, v20, 1, 0, v24, &v30);
      v26 = v30;

      if (!v25)
      {
        _HKInitializeLogging();
        v27 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v33 = a1;
          v34 = 2114;
          v35 = v26;
          _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "%{public}@: Failed to update anchors when skipping record due to extraction failures: %{public}@", buf, 0x16u);
        }
      }

      a1 = 1;
      v3 = v29;
    }
    else
    {
      if (v17)
      {
        *(_DWORD *)buf = 138543618;
        v33 = a1;
        v34 = 2114;
        v35 = v3;
        _os_log_error_impl(&dword_1B7802000, v16, OS_LOG_TYPE_ERROR, "%{public}@: zip extraction failed: %{public}@", buf, 0x16u);
      }
      -[HDCloudSyncPullChangeRecordOperation _setAssetExtractionFailureCount:]((void *)a1, v15 + 1);
      a1 = 0;
    }
  }

  return a1;
}

uint64_t __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_200(uint64_t a1, _QWORD *a2)
{
  id v3;

  v3 = *(id *)(a1 + 32);
  if (v3)
  {
    if (a2)
      *a2 = objc_retainAutorelease(v3);
    else
      _HKLogDroppedError();
  }

  return 0;
}

uint64_t __104__HDCloudSyncPullChangeRecordOperation__continuationForFetchedRecord_recordID_inMemoryAsset_fetchError___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject **v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  id *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  NSObject *v51;
  char v52;
  id v53;
  NSObject *v54;
  uint64_t v55;
  _QWORD *v58;
  id obj;
  _QWORD v60[4];
  id v61;
  id *v62;
  uint64_t v63;
  uint64_t (*v64)(uint64_t, uint64_t);
  void (*v65)(uint64_t);
  id v66;
  uint64_t v67;
  uint64_t *v68;
  uint64_t v69;
  char v70;
  _BYTE buf[24];
  void *v72;
  id *v73;
  id v74;
  id v75;
  id v76;
  id *v77;
  uint64_t *v78;
  _QWORD *v79;
  _QWORD v80[5];

  v80[2] = *MEMORY[0x1E0C80C00];
  CFAbsoluteTimeGetCurrent();
  v3 = (NSObject **)MEMORY[0x1E0CB5370];
  v4 = os_signpost_id_make_with_pointer((os_log_t)*MEMORY[0x1E0CB5370], *(const void **)(a1 + 32));
  _HKInitializeLogging();
  v5 = *v3;
  if (os_signpost_enabled(v5))
  {
    v6 = v5;
    v7 = v6;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      objc_msgSend(*(id *)(a1 + 40), "configuration");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "descriptionForSignpost");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v9;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v4, "cloud-sync-persist-asset", "%{public}@", buf, 0xCu);

    }
  }
  v11 = *(id **)(a1 + 40);
  v10 = *(void **)(a1 + 48);
  v12 = objc_msgSend(*(id *)(a1 + 32), "protocolVersion", a2);
  v13 = v10;
  if (v11)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v11;
      _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: persist asset archive", buf, 0xCu);
    }
    objc_msgSend(v11[14], "store");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "syncStoreForEpoch:", objc_msgSend(v11[15], "baselineEpoch"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if ((int)objc_msgSend(v16, "protocolVersion") >= (int)v12)
    {
      objc_msgSend(v16, "syncStoreForProtocolVersion:", v12);
      v20 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v20;
    }
    else
    {
      _HKInitializeLogging();
      v17 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v18 = v17;
        v19 = objc_msgSend(v16, "protocolVersion");
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = (int)v12;
        *(_WORD *)&buf[22] = 2048;
        v72 = (void *)v19;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: Change record has protocol version %ld, which is later than store protocol version %ld. Attempting pull and will re-ingest upon upgrade.", buf, 0x20u);

      }
    }
    objc_msgSend(v13, "numberOfEntriesWithError:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", objc_msgSend(v21, "integerValue"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        objc_msgSend(v11, "progress");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addChild:withPendingUnitCount:", v23, 100);

      }
    }
    else
    {
      v23 = 0;
    }
    v67 = 0;
    v68 = &v67;
    v69 = 0x2020000000;
    v70 = 1;
    v61 = 0;
    v62 = &v61;
    v63 = 0x3032000000;
    v64 = __Block_byref_object_copy__213;
    v65 = __Block_byref_object_dispose__214;
    v66 = 0;
    v60[0] = 0;
    v60[1] = v60;
    v60[2] = 0x2020000000;
    v60[3] = 0;
    v25 = (void *)MEMORY[0x1E0C99E60];
    v80[0] = objc_opt_class();
    v80[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v80, 2);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWithArray:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = v62 + 5;
    obj = v62[5];
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke;
    v72 = &unk_1E6CF9228;
    v73 = v11;
    v77 = &v61;
    v29 = v27;
    v74 = v29;
    v78 = &v67;
    v30 = v16;
    v75 = v30;
    v79 = v60;
    v31 = v23;
    v76 = v31;
    LODWORD(v11) = objc_msgSend(v13, "enumerateEntriesWithError:block:", &obj, buf);
    objc_storeStrong(v28, obj);
    *((_BYTE *)v68 + 24) = (_BYTE)v11;
    if ((v11 & 1) != 0)
    {
      v32 = 0;
    }
    else
    {
      v33 = v62[5];
      v32 = v33;
      if (v33)
        v34 = objc_retainAutorelease(v33);

    }
    _Block_object_dispose(v60, 8);
    _Block_object_dispose(&v61, 8);

    _Block_object_dispose(&v67, 8);
  }
  else
  {
    v32 = 0;
  }

  v35 = v32;
  _HKInitializeLogging();
  v36 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
  {
    v37 = *(_QWORD *)(a1 + 32);
    v38 = *(_QWORD *)(a1 + 40);
    v39 = v36;
    CFAbsoluteTimeGetCurrent();
    HKDiagnosticStringFromDuration();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v37;
    *(_WORD *)&buf[22] = 2114;
    v72 = v40;
    _os_log_impl(&dword_1B7802000, v39, OS_LOG_TYPE_INFO, "%{public}@: persisted %@ in %{public}@", buf, 0x20u);

  }
  _HKInitializeLogging();
  v41 = (void *)*MEMORY[0x1E0CB5370];
  if (os_signpost_enabled((os_log_t)*MEMORY[0x1E0CB5370]))
  {
    v42 = v41;
    v43 = v42;
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      objc_msgSend(*(id *)(a1 + 40), "configuration");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "descriptionForSignpost");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = (_DWORD)v11;
      *(_WORD *)&buf[8] = 2114;
      *(_QWORD *)&buf[10] = v45;
      _os_signpost_emit_with_name_impl(&dword_1B7802000, v43, OS_SIGNPOST_INTERVAL_END, v4, "cloud-sync-persist-asset", "success=%{BOOL}d, %{public}@", buf, 0x12u);

    }
  }
  if (!(_DWORD)v11)
  {
    if (v35)
    {
      v35 = v35;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 122, CFSTR("Asset extraction failed without producing an error."));
      v35 = (id)objc_claimAutoreleasedReturnValue();
      if (!v35)
      {
LABEL_46:
        v55 = -[HDCloudSyncPullChangeRecordOperation _shouldSucceedWithAssetExtractionError:](*(_QWORD *)(a1 + 40), v35);
        goto LABEL_47;
      }
    }
    if (v58)
      *v58 = objc_retainAutorelease(v35);
    else
      _HKLogDroppedError();

    goto LABEL_46;
  }
  v47 = *(void **)(a1 + 40);
  v46 = (id *)(a1 + 40);
  -[HDCloudSyncPullChangeRecordOperation _setAssetExtractionFailureCount:](v47, 0);
  v48 = *v46;
  if (*v46)
  {
    objc_msgSend(*v46, "profile");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncKeyValueDomainWithProfile(v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    v51 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v48;
      _os_log_impl(&dword_1B7802000, v51, OS_LOG_TYPE_INFO, "%{public}@: Recording pull operation applied changes", buf, 0xCu);
    }
    v61 = 0;
    v52 = objc_msgSend(v50, "setNumber:forKey:error:", MEMORY[0x1E0C9AAB0], CFSTR("HDCloudSyncHasPullAppliedChange"), &v61);
    v53 = v61;
    if ((v52 & 1) == 0)
    {
      _HKInitializeLogging();
      v54 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v53;
        _os_log_error_impl(&dword_1B7802000, v54, OS_LOG_TYPE_ERROR, "Failed to record pull operation applied changes: %{public}@.", buf, 0xCu);
      }
    }

  }
  v55 = 1;
LABEL_47:

  return v55;
}

- (void)_setAssetExtractionFailureCount:(void *)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repository");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v5, "profile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "legacyRepositoryProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    HDCloudSyncKeyValueDomainWithProfile(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncPullChangeRecordOperation _assetExtractionFailureCountKey]((uint64_t)a1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    LOBYTE(v5) = objc_msgSend(v8, "setNumber:forKey:error:", v10, v9, &v13);
    v11 = v13;

    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v15 = v9;
        v16 = 2114;
        v17 = v11;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "Failed to set value for %{public}@: %{public}@.", buf, 0x16u);
      }
    }

  }
}

uint64_t __103__HDCloudSyncPullChangeRecordOperation__zipArchiveExtractorForChangeRecord_assetContentInMemory_error___block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v4;
  id *v5;
  uint64_t v6;
  void *v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  os_log_t v17;
  void *v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  char v28;
  id v29;
  id v30;
  int v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  NSObject *v52;
  id *v53;
  id v54;
  id v55;
  __CFString *v56;
  uint64_t v57;
  void *v58;
  NSObject *v60;
  id *v61;
  id v62;
  int v63;
  int *v64;
  char *v65;
  NSObject *v66;
  id *v67;
  int v68;
  int *v69;
  char *v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  _QWORD v79[2];
  _QWORD v80[2];
  uint8_t buf[4];
  id *v82;
  __int16 v83;
  _QWORD v84[4];

  *(_QWORD *)((char *)&v84[2] + 2) = *MEMORY[0x1E0C80C00];
  v5 = *(id **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  if (*(_BYTE *)(a1 + 56))
  {
    if (!v5)
    {
      v37 = 0;
      goto LABEL_57;
    }
    +[HDCloudSyncChangeRecord changesetArchiveContentDataForCKRecord:error:](HDCloudSyncChangeRecord, "changesetArchiveContentDataForCKRecord:error:", v4, a2);
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      _HKInitializeLogging();
      v8 = (os_log_t *)MEMORY[0x1E0CB5370];
      v9 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        *(_DWORD *)buf = 138543618;
        v82 = v5;
        v83 = 2048;
        v84[0] = objc_msgSend(v7, "length");
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: fetched asset data size (%lu)", buf, 0x16u);

      }
      if ((unint64_t)objc_msgSend(v7, "length") <= 0x40000)
      {
        v39 = objc_msgSend(v7, "copy");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "UUIDString");
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_self();
        v12 = objc_alloc_init(MEMORY[0x1E0CB3620]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("syncarchive-%@"), v11);
        v13 = objc_claimAutoreleasedReturnValue();
        v75 = v11;

        objc_msgSend(v12, "temporaryDirectory");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = (void *)v13;
        objc_msgSend(v14, "URLByAppendingPathComponent:", v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URLByAppendingPathExtension:", CFSTR("zip"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        _HKInitializeLogging();
        v17 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEBUG))
        {
          v52 = v17;
          objc_msgSend(v16, "path");
          v53 = (id *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v82 = v53;
          _os_log_debug_impl(&dword_1B7802000, v52, OS_LOG_TYPE_DEBUG, "Creating asset file %{public}@", buf, 0xCu);

        }
        objc_msgSend(v16, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v12, "createFileAtPath:contents:attributes:", v18, 0, 0);

        v73 = v12;
        if ((v19 & 1) != 0)
        {
          v78 = 0;
          objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForUpdatingURL:error:", v16, &v78);
          v20 = (id)objc_claimAutoreleasedReturnValue();
          v21 = v78;
          v22 = v21;
          if (v20)
          {
            v72 = v21;
            if (fcntl(objc_msgSend(v20, "fileDescriptor"), 48, 1))
            {
              _HKInitializeLogging();
              v23 = (void *)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
              {
                v60 = v23;
                objc_msgSend(v16, "path");
                v61 = (id *)objc_claimAutoreleasedReturnValue();
                v62 = v12;
                v63 = *__error();
                v64 = __error();
                v65 = strerror(*v64);
                *(_DWORD *)buf = 138543874;
                v82 = v61;
                v83 = 1024;
                LODWORD(v84[0]) = v63;
                v12 = v62;
                WORD2(v84[0]) = 2082;
                *(_QWORD *)((char *)v84 + 6) = v65;
                _os_log_error_impl(&dword_1B7802000, v60, OS_LOG_TYPE_ERROR, "Error setting F_NOCACHE on file at %{public}@ failed (%d): %{public}s", buf, 0x1Cu);

              }
            }
            v24 = *MEMORY[0x1E0CB2AB8];
            v25 = *MEMORY[0x1E0CB2AA8];
            v79[0] = *MEMORY[0x1E0CB2AD8];
            v79[1] = v25;
            v80[0] = v24;
            v80[1] = &unk_1E6DFC4D0;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 2);
            v26 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "path");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = 0;
            v71 = (void *)v26;
            v28 = objc_msgSend(v12, "setAttributes:ofItemAtPath:error:", v26, v27, &v77);
            v29 = v77;

            if ((v28 & 1) != 0)
            {
              objc_msgSend(v16, "path");
              v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v31 = unlink((const char *)objc_msgSend(v30, "fileSystemRepresentation"));

              if (v31)
              {
                _HKInitializeLogging();
                v32 = (void *)*MEMORY[0x1E0CB5370];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
                {
                  v66 = v32;
                  objc_msgSend(v16, "path");
                  v67 = (id *)objc_claimAutoreleasedReturnValue();
                  v68 = *__error();
                  v69 = __error();
                  v70 = strerror(*v69);
                  *(_DWORD *)buf = 138543874;
                  v82 = v67;
                  v83 = 1024;
                  LODWORD(v84[0]) = v68;
                  WORD2(v84[0]) = 2082;
                  *(_QWORD *)((char *)v84 + 6) = v70;
                  _os_log_error_impl(&dword_1B7802000, v66, OS_LOG_TYPE_ERROR, "Error unlinking file at %{public}@ failed (%d): %{public}s", buf, 0x1Cu);

                }
              }
              v33 = v20;
              v34 = v71;
              v22 = v72;
            }
            else
            {
              v48 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v16, "path");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "stringWithFormat:", CFSTR("Error setting protection class for %@"), v49);
              v50 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 102, v50, v29);
              v51 = (id)objc_claimAutoreleasedReturnValue();
              if (v51)
              {
                if (a2)
                  *a2 = objc_retainAutorelease(v51);
                else
                  _HKLogDroppedError();
              }

              v33 = 0;
              v34 = v71;
              v22 = v72;
            }
          }
          else
          {
            objc_msgSend(v16, "path");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "removeItemAtPath:error:", v45, 0);

            v46 = (void *)MEMORY[0x1E0CB3940];
            objc_msgSend(v16, "path");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "stringWithFormat:", CFSTR("Failed to create fileHandle at %@"), v47);
            v34 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 102, v34, v22);
            v29 = (id)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              if (a2)
                *a2 = objc_retainAutorelease(v29);
              else
                _HKLogDroppedError();
            }

            v33 = 0;
          }

        }
        else
        {
          v41 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(v16, "path");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "hk_error:format:", 102, CFSTR("Error creating file at %@"), v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();

          v44 = v43;
          v20 = v44;
          if (v44)
          {
            if (a2)
            {
              v20 = objc_retainAutorelease(v44);
              v33 = 0;
              *a2 = v20;
            }
            else
            {
              _HKLogDroppedError();
              v33 = 0;
            }
            v22 = v20;
          }
          else
          {
            v22 = 0;
            v33 = 0;
          }
        }

        v54 = v5[13];
        v5[13] = v33;

        v55 = v5[13];
        if (!v55)
        {
          v37 = 0;
          v38 = v7;
          goto LABEL_56;
        }
        objc_msgSend(v55, "writeData:", v7);
        objc_msgSend(v5[13], "fileDescriptor");
        mmapFileDescriptor();
        v39 = objc_claimAutoreleasedReturnValue();
      }
      v38 = (void *)v39;

      if (v38)
      {
        if (objc_msgSend(v38, "length"))
        {
          v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB7080]), "initWithData:", v38);
LABEL_56:

          goto LABEL_57;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("has data size (%lu)"), objc_msgSend(v38, "length"));
        v56 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v56 = CFSTR("is nil");
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a2, 3, CFSTR("cloud sync archive data %@"), v56);

    }
    else
    {
      v38 = 0;
    }
    v37 = 0;
    goto LABEL_56;
  }
  v35 = v4;
  if (v5)
  {
    +[HDCloudSyncChangeRecord changesetArchiveFileHandleForCKRecord:error:](HDCloudSyncChangeRecord, "changesetArchiveFileHandleForCKRecord:error:", v35, a2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (v36)
    {
      v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB7080]), "initWithFileHandle:", v36);
    }
    else
    {
      +[HDCloudSyncChangeRecord changesetArchiveURLForCKRecord:error:](HDCloudSyncChangeRecord, "changesetArchiveURLForCKRecord:error:", v35, a2);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
        v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB7080]), "initWithURL:", v40);
      else
        v37 = 0;

    }
  }
  else
  {
    v37 = 0;
  }

LABEL_57:
  v57 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v58 = *(void **)(v57 + 40);
  *(_QWORD *)(v57 + 40) = v37;

  return 1;
}

void __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  int v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, _QWORD *);
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id obj;
  _BYTE buf[24];
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    objc_msgSend(v3, "pathname");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: persist change set file %{public}@", buf, 0x16u);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v24 = __Block_byref_object_copy__213;
  v25 = __Block_byref_object_dispose__214;
  v26 = 0;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v8 + 40);
  v9 = MEMORY[0x1E0C809B0];
  v10 = v3;
  v21 = *(id *)(a1 + 40);
  v11 = HKWithAutoreleasePool();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v11)
  {
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v20 = *(id *)(v12 + 40);
    v14 = v9;
    v15 = 3221225472;
    v16 = __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke_220;
    v17 = &unk_1E6CF9200;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 48);
    v13 = HKWithAutoreleasePool();
    objc_storeStrong((id *)(v12 + 40), v20);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v13;

  }
  objc_msgSend(*(id *)(a1 + 56), "setCompletedUnitCount:", ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24), v14, v15, v16, v17, v18);

  _Block_object_dispose(buf, 8);
}

BOOL __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke_218(_QWORD *a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v17 = 0;
  objc_msgSend(v2, "dataWithError:", &v17);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v17;
  if (v3)
  {
    v5 = a1[6];
    v16 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "hk_unarchivedObjectOfClasses:forKey:data:error:", v5, CFSTR("changes"), v3, &v16);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v16;
    v8 = *(_QWORD *)(a1[7] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v6;

    if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40))
    {
      v10 = 0;
    }
    else
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v15 = a1[5];
        *(_DWORD *)buf = 138543618;
        v19 = v15;
        v20 = 2114;
        v21 = v7;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Failed to unarchive changes: %{public}@", buf, 0x16u);
      }
      v10 = 1;
    }

  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v14 = a1[5];
      *(_DWORD *)buf = 138543618;
      v19 = v14;
      v20 = 2114;
      v21 = v4;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Failed to extract data from archive: %{public}@", buf, 0x16u);
    }
    v10 = 1;
  }

  return v10 == 0;
}

uint64_t __90__HDCloudSyncPullChangeRecordOperation__persistFetchedArchiveAsset_protocolVersion_error___block_invoke_220(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDMutableDatabaseTransactionContext *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v22;
  uint64_t v23;
  id v24;
  _BYTE buf[24];
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v24 = 0;
  v7 = v5;
  v8 = v4;
  if (v6)
  {
    objc_msgSend((id)v6, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "repository");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "profile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "legacyRepositoryProfile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(HDMutableDatabaseTransactionContext);
    -[HDMutableDatabaseTransactionContext setJournalType:](v13, "setJournalType:", 2);
    -[HDMutableDatabaseTransactionContext setCacheScope:](v13, "setCacheScope:", 1);
    objc_msgSend((id)v6, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessibilityAssertion");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      -[HDMutableDatabaseTransactionContext addAccessibilityAssertion:](v13, "addAccessibilityAssertion:", v15);
    objc_msgSend(v12, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __70__HDCloudSyncPullChangeRecordOperation__applySyncChanges_store_error___block_invoke;
    v26 = &unk_1E6CF1370;
    v27 = v12;
    v28 = v7;
    v29 = v6;
    v30 = v8;
    v17 = v12;
    v6 = objc_msgSend(v16, "performWithTransactionContext:error:block:", v13, &v24, buf);

  }
  v18 = v24;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v22;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v23;
      *(_WORD *)&buf[22] = 2114;
      v26 = v18;
      _os_log_error_impl(&dword_1B7802000, v19, OS_LOG_TYPE_ERROR, "%{public}@: Error applying sync changes to store %{public}@ with error %{public}@", buf, 0x20u);
    }
    **(_BYTE **)(a1 + 56) = 1;
    v20 = v18;
    if (v20)
    {
      if (a2)
        *a2 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

  }
  return v6;
}

uint64_t __70__HDCloudSyncPullChangeRecordOperation__applySyncChanges_store_error___block_invoke(id *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  int v8;
  uint64_t v9;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "syncEngine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = a1[5];
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v11 = a1[4];
        v12 = v2;
        v13 = a1[7];
        v8 = HKWithAutoreleasePool();

        if (!v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

uint64_t __70__HDCloudSyncPullChangeRecordOperation__applySyncChanges_store_error___block_invoke_2(uint64_t *a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend((id)a1[4], "syncEntityClassForProfile:", a1[5]))
  {
    v4 = a1[4];
    v5 = (void *)a1[7];
    v6 = a1[8];
    v16 = 0;
    v7 = objc_msgSend(v5, "applySyncChange:forStore:error:", v4, v6, &v16);
    v8 = v16;
    if ((v7 & 1) == 0)
    {
      _HKInitializeLogging();
      v9 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v15 = a1[4];
        *(_DWORD *)buf = 138543618;
        v18 = v15;
        v19 = 2114;
        v20 = v8;
        _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "failed to apply request change %{public}@: %{public}@", buf, 0x16u);
      }
      v10 = v8;
      if (v10)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v10);
        else
          _HKLogDroppedError();
      }

    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[6];
      v13 = (void *)a1[4];
      *(_DWORD *)buf = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      _os_log_impl(&dword_1B7802000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: cannot apply change %{public}@ because it is for an unknown (possibly future) sync entity.", buf, 0x16u);
    }
    return 1;
  }
  return v7;
}

- (id)_assetExtractionFailureCountKey
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 112), "storeRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("%@%@"), CFSTR("FailedAssetExtractionCount-"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (HDCloudSyncTarget)target
{
  return self->_target;
}

- (HDCloudSyncSequenceRecord)sequenceRecord
{
  return self->_sequenceRecord;
}

- (HDCloudSyncChangeRecord)changeRecord
{
  return self->_changeRecord;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changeRecord, 0);
  objc_storeStrong((id *)&self->_sequenceRecord, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_fileHandle, 0);
}

@end
