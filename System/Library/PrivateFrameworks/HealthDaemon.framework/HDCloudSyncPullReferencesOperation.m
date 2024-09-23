@implementation HDCloudSyncPullReferencesOperation

- (HDCloudSyncPullReferencesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncPullReferencesOperation *v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *attachmentRecordsToFetch;
  NSMutableDictionary *v7;
  NSMutableDictionary *referencesToPersist;
  HDSynchronousTaskGroup *v9;
  HDSynchronousTaskGroup *taskGroup;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncPullReferencesOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v12, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attachmentRecordsToFetch = v4->_attachmentRecordsToFetch;
    v4->_attachmentRecordsToFetch = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    referencesToPersist = v4->_referencesToPersist;
    v4->_referencesToPersist = v7;

    v9 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E0D298C8]);
    taskGroup = v4->_taskGroup;
    v4->_taskGroup = v9;

    -[HDSynchronousTaskGroup setDelegate:](v4->_taskGroup, "setDelegate:", v4);
  }
  return v4;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;
  id v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HDCloudSyncCachedZone *v16;
  id v17;
  HDCloudSyncCachedZone *attachmentZone;
  HDCloudSyncCachedZone *v19;
  void *v20;
  HDCloudSyncPullReferencesOperation *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  char v34;
  id v35;
  void *v36;
  HDMutableDatabaseTransactionContext *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  NSObject *v46;
  char v47;
  id v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  id v53;
  _QWORD v54[5];
  id v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  HDCloudSyncPullReferencesOperation *v60;
  __int16 v61;
  id v62;
  _BYTE v63[24];
  void *v64;
  HDCloudSyncPullReferencesOperation *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  -[HDSynchronousTaskGroup beginTask](self->_taskGroup, "beginTask");
  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "repository");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "legacyRepositoryProfile");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0;
  v7 = HDCloudSyncAttachmentReferenceEpoch(v6, (uint64_t)&v57);
  v8 = v57;
  self->_epoch = v7;

  if (self->_epoch)
    v9 = 1;
  else
    v9 = v8 == 0;
  if (v9)
  {
    v52 = v8;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedCloudState");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "repository");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "primaryCKContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "containerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    objc_msgSend(v11, "attachmentZoneForContainerID:error:", v15, &v56);
    v16 = (HDCloudSyncCachedZone *)objc_claimAutoreleasedReturnValue();
    v17 = v56;
    attachmentZone = self->_attachmentZone;
    self->_attachmentZone = v16;

    v19 = self->_attachmentZone;
    v20 = v17;
    if (!v19 && v17)
    {
      v21 = self;
      v22 = 0;
      v23 = v17;
LABEL_9:
      -[HDCloudSyncOperation finishWithSuccess:error:](v21, "finishWithSuccess:error:", v22, v23);
LABEL_25:
      v8 = v52;

      goto LABEL_26;
    }
    if (!v19)
    {
      -[HDCloudSyncOperation configuration](self, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "repository");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "profileType");

      if (v26 != 1)
      {
        v21 = self;
        v22 = 1;
        v23 = 0;
        goto LABEL_9;
      }
    }
    -[HDCloudSyncOperation configuration](self, "configuration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "accessibilityAssertion");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDatabaseTransactionContext contextForAccessibilityAssertion:](HDDatabaseTransactionContext, "contextForAccessibilityAssertion:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](self, "configuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "repository");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "profile");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "database");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v54[4] = self;
    v55 = 0;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __42__HDCloudSyncPullReferencesOperation_main__block_invoke;
    v54[3] = &unk_1E6CECC80;
    v34 = objc_msgSend(v33, "performWithTransactionContext:error:block:", v29, &v55, v54);
    v35 = v55;

    if ((v34 & 1) == 0)
    {
      -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v35);
LABEL_24:

      goto LABEL_25;
    }
    v51 = v29;
    v36 = v20;
    if (-[NSMutableDictionary count](self->_attachmentRecordsToFetch, "count"))
    {
      v37 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      -[HDCloudSyncOperation configuration](self, "configuration");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "accessibilityAssertion");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMutableDatabaseTransactionContext contextWithAccessibilityAssertion:](v37, "contextWithAccessibilityAssertion:", v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[HDCloudSyncOperation configuration](self, "configuration");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "repository");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "profile");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "database");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = 0;
      *(_QWORD *)v63 = MEMORY[0x1E0C809B0];
      *(_QWORD *)&v63[8] = 3221225472;
      *(_QWORD *)&v63[16] = __68__HDCloudSyncPullReferencesOperation__persistUnsupportedAttachments__block_invoke;
      v64 = &unk_1E6CECC80;
      v65 = self;
      LOBYTE(v37) = objc_msgSend(v44, "performWithTransactionContext:error:block:", v40, &v58, v63);
      v45 = v58;

      if ((v37 & 1) == 0)
      {
        _HKInitializeLogging();
        v46 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v60 = self;
          v61 = 2114;
          v62 = v45;
          _os_log_error_impl(&dword_1B7802000, v46, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to ingest unsupported attachments with error: %{public}@", buf, 0x16u);
        }
      }

      -[HDCloudSyncPullReferencesOperation _fetchAttachmentRecordAssets]((id *)&self->super.super.isa);
    }
    else
    {
      v53 = 0;
      v47 = -[HDCloudSyncPullReferencesOperation _persistPendingReferencesIfNeededWithError:]((id *)&self->super.super.isa, (uint64_t)&v53);
      v48 = v53;
      v49 = v48;
      if ((v47 & 1) == 0)
      {
        _HKInitializeLogging();
        v50 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v63 = 138543618;
          *(_QWORD *)&v63[4] = self;
          *(_WORD *)&v63[12] = 2114;
          *(_QWORD *)&v63[14] = v49;
          _os_log_error_impl(&dword_1B7802000, v50, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to persist pending references, %{public}@", v63, 0x16u);
        }
        -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v49);

        goto LABEL_23;
      }

    }
    -[HDSynchronousTaskGroup finishTask](self->_taskGroup, "finishTask");
LABEL_23:
    v20 = v36;
    v29 = v51;
    goto LABEL_24;
  }
  -[HDSynchronousTaskGroup failTaskWithError:](self->_taskGroup, "failTaskWithError:", v8);
LABEL_26:

}

uint64_t __42__HDCloudSyncPullReferencesOperation_main__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];

  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  v5 = objc_opt_class();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(v6 + 128);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__HDCloudSyncPullReferencesOperation_main__block_invoke_2;
  v9[3] = &unk_1E6CFA398;
  v9[4] = v6;
  return objc_msgSend(v4, "recordsForClass:epoch:error:enumerationHandler:", v5, v7, a2, v9);
}

uint64_t __42__HDCloudSyncPullReferencesOperation_main__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  id v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _QWORD *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = v6;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v8 + 128);
  if (v9 <= a3)
    v9 = a3;
  *(_QWORD *)(v8 + 128) = v9;
  objc_msgSend(v6, "attachmentReference", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  objc_msgSend(v7, "referenceIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  v13 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v7, "attachmentIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithUUIDString:", v14);
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "repository");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "legacyRepositoryProfile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  +[HDAttachmentEntity attachmentWithIdentifier:profile:error:](HDAttachmentEntity, "attachmentWithIdentifier:profile:error:", v15, v19, &v47);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v47;

  if (!v20 && v21)
  {
    if (v43)
    {
      v22 = objc_retainAutorelease(v21);
      v23 = 0;
      *v43 = v22;
      goto LABEL_29;
    }
    _HKLogDroppedError();
    v23 = 0;
LABEL_22:
    v22 = v21;
    goto LABEL_29;
  }
  if (v20)
  {
    v23 = 1;
    goto LABEL_22;
  }
  v24 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  objc_msgSend(v7, "attachmentIdentifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "zoneIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "zoneIdentifier");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncAttachmentRecord recordIDForAttachmentIdentifier:zoneID:](HDCloudSyncAttachmentRecord, "recordIDForAttachmentIdentifier:zoneID:", v25, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v21;
  objc_msgSend(v24, "recordForRecordID:class:error:", v28, objc_opt_class(), &v46);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v46;

  if (v29)
    v30 = 1;
  else
    v30 = v22 == 0;
  v23 = v30;
  if (v30)
  {
    if (v29)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __42__HDCloudSyncPullReferencesOperation_main__block_invoke_189;
      v44[3] = &unk_1E6CFA370;
      v32 = v29;
      v45 = v32;
      v33 = objc_msgSend(v31, "hk_containsObjectPassingTest:", v44);

      if ((v33 & 1) == 0)
      {
        v34 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
        objc_msgSend(v7, "attachmentIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, v35);

      }
    }
    else
    {
      _HKInitializeLogging();
      v36 = (void *)*MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
      {
        v37 = *(_QWORD *)(a1 + 32);
        v38 = v36;
        objc_msgSend(v7, "attachmentIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "referenceIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v49 = v37;
        v50 = 2114;
        v51 = v39;
        v52 = 2114;
        v53 = v40;
        _os_log_fault_impl(&dword_1B7802000, v38, OS_LOG_TYPE_FAULT, "%{public}@ Failed to find attachment record %{public}@ for reference %{public}@ in the cache", buf, 0x20u);

      }
    }
  }
  else if (v43)
  {
    *v43 = objc_retainAutorelease(v22);
  }
  else
  {
    _HKLogDroppedError();
  }

LABEL_29:
  return v23;
}

uint64_t __42__HDCloudSyncPullReferencesOperation_main__block_invoke_189(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "recordID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)_fetchAttachmentRecordAssets
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HDCloudSyncFetchRecordsOperation *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HDCloudSyncFetchRecordsOperation *v14;
  id v15;
  _QWORD v16[5];
  _QWORD v17[5];
  id v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[6];
  _QWORD v22[4];
  _QWORD v23[4];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1[17], "beginTask");
    if (!objc_msgSend(a1[13], "count"))
    {
      objc_msgSend(a1[17], "finishTask");
      return;
    }
    v23[0] = 0;
    v23[1] = v23;
    v23[2] = 0x2020000000;
    v23[3] = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    v22[3] = 0;
    objc_msgSend(a1[13], "allValues");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke;
    v21[3] = &unk_1E6CFA3E8;
    v21[4] = v23;
    v21[5] = v22;
    objc_msgSend(v2, "hk_map:", v21);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "count"))
    {
      if (!v4)
        goto LABEL_10;
    }
    else
    {
      objc_msgSend(a1[13], "allValues");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "recordID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
      if (!v8)
        goto LABEL_10;
    }
    if (objc_msgSend(v4, "count"))
    {
      v9 = [HDCloudSyncFetchRecordsOperation alloc];
      objc_msgSend(a1, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "repository");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "primaryCKContainer");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[HDCloudSyncFetchRecordsOperation initWithConfiguration:container:recordIDs:](v9, "initWithConfiguration:container:recordIDs:", v10, v13, v4);

      v19[0] = v3;
      v19[1] = 3221225472;
      v19[2] = __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_2;
      v19[3] = &unk_1E6CFA410;
      v19[4] = a1;
      v15 = v4;
      v20 = v15;
      -[HDCloudSyncOperation setOnError:](v14, "setOnError:", v19);
      v17[0] = v3;
      v17[1] = 3221225472;
      v17[2] = __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_199;
      v17[3] = &unk_1E6CFA438;
      v17[4] = a1;
      v18 = v15;
      -[HDCloudSyncOperation setOnSuccess:](v14, "setOnSuccess:", v17);
      v16[0] = v3;
      v16[1] = 3221225472;
      v16[2] = __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_201;
      v16[3] = &unk_1E6CFA460;
      v16[4] = a1;
      -[HDCloudSyncFetchRecordsOperation setRecordHandler:](v14, "setRecordHandler:", v16);
      -[HDCloudSyncOperation start](v14, "start");

LABEL_11:
      _Block_object_dispose(v22, 8);
      _Block_object_dispose(v23, 8);
      return;
    }
LABEL_10:
    objc_msgSend(a1[17], "finishTask");
    goto LABEL_11;
  }
}

- (uint64_t)_persistPendingReferencesIfNeededWithError:(id *)a1
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD v16[5];

  if (!a1)
    return 0;
  objc_msgSend(a1[14], "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (!v5)
    return 1;
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accessibilityAssertion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contextWithAccessibilityAssertion:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "repository");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__HDCloudSyncPullReferencesOperation__persistPendingReferencesIfNeededWithError___block_invoke;
  v16[3] = &unk_1E6CECC80;
  v16[4] = a1;
  v14 = objc_msgSend(v13, "performWithTransactionContext:error:block:", v9, a2, v16);

  return v14;
}

uint64_t __68__HDCloudSyncPullReferencesOperation__persistUnsupportedAttachments__block_invoke(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
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
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  _QWORD *v39;
  id obj;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (v42)
  {
    v39 = a2;
    v41 = *(_QWORD *)v57;
    while (2)
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v57 != v41)
          objc_enumerationMutation(obj);
        v44 = v4;
        v5 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v4);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allValues");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __68__HDCloudSyncPullReferencesOperation__persistUnsupportedAttachments__block_invoke_2;
        v55[3] = &unk_1E6CFA3C0;
        v43 = v5;
        v55[4] = v5;
        objc_msgSend(v6, "hk_filter:", v55);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
        v45 = v8;
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v52;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v52 != v11)
                objc_enumerationMutation(v45);
              v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
              objc_msgSend(*(id *)(a1 + 32), "configuration");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "repository");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "attachmentManager");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v17 = objc_msgSend(v16, "supportedSchemaVersionForReference:", v13);

              if (!v17 || v17 >= objc_msgSend(v13, "schemaVersion"))
              {
                v34 = v45;
                v23 = v45;
                goto LABEL_25;
              }
            }
            v8 = v45;
            v10 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v61, 16);
            if (v10)
              continue;
            break;
          }
        }

        objc_msgSend(*(id *)(a1 + 32), "configuration");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "repository");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "attachmentManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "attachment");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0;
        v22 = objc_msgSend(v20, "insertAttachmentReferences:attachment:error:", v8, v21, &v50);
        v23 = v50;

        if ((v22 & 1) == 0)
        {
          v36 = v23;
          v37 = v36;
          if (v36)
          {
            if (v39)
              *v39 = objc_retainAutorelease(v36);
            else
              _HKLogDroppedError();
          }

          v35 = 0;
          goto LABEL_33;
        }
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v24 = v8;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v47 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
              objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "identifier");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "UUIDString");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "removeObjectForKey:", v31);

            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v46, v60, 16);
          }
          while (v26);
        }

        v32 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
        objc_msgSend(v43, "attachmentIdentifier");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "removeObjectForKey:", v33);

        v34 = v45;
LABEL_25:

        v4 = v44 + 1;
      }
      while (v44 + 1 != v42);
      v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
      if (v42)
        continue;
      break;
    }
  }
  v35 = 1;
LABEL_33:

  return v35;
}

uint64_t __68__HDCloudSyncPullReferencesOperation__persistUnsupportedAttachments__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "attachmentIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6);

  return v7;
}

id __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = v3;
  if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) <= 99
    && (v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), objc_msgSend(v3, "fileSize") + v5 <= 104857600))
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += objc_msgSend(v4, "fileSize");
    objc_msgSend(v4, "recordID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = 138543874;
    v9 = v6;
    v10 = 2114;
    v11 = v7;
    v12 = 2114;
    v13 = v4;
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to fetch recordIDs %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "failTaskWithError:", v4);

}

uint64_t __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_199(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    v5 = v2;
    v7 = 138543618;
    v8 = v4;
    v9 = 2048;
    v10 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Successfully fetched %lu records", (uint8_t *)&v7, 0x16u);

  }
  -[HDCloudSyncPullReferencesOperation _fetchAttachmentRecordAssets](*(_QWORD *)(a1 + 32));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "finishTask");
}

uint64_t __66__HDCloudSyncPullReferencesOperation__fetchAttachmentRecordAssets__block_invoke_201(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  HDMutableDatabaseTransactionContext *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unsigned int v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  id v39;
  uint64_t v40;
  id v41;
  _QWORD v42[4];
  id v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
  {
    +[HDCloudSyncRecord recordWithCKRecord:error:](HDCloudSyncAttachmentRecord, "recordWithCKRecord:error:", a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(*(id *)(v3 + 112), "allValues");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __66__HDCloudSyncPullReferencesOperation__ingestAssetForRecord_error___block_invoke;
      v42[3] = &unk_1E6CFA3C0;
      v33 = v5;
      v7 = v5;
      v43 = v7;
      objc_msgSend(v6, "hk_filter:", v42);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      objc_msgSend((id)v3, "configuration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessibilityAssertion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMutableDatabaseTransactionContext contextWithAccessibilityAssertion:](v9, "contextWithAccessibilityAssertion:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)v3, "configuration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "repository");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "profile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __66__HDCloudSyncPullReferencesOperation__ingestAssetForRecord_error___block_invoke_2;
      v38[3] = &unk_1E6CF0678;
      v39 = v7;
      v40 = v3;
      v17 = v8;
      v41 = v17;
      v32 = (void *)v12;
      v31 = objc_msgSend(v16, "performWithTransactionContext:error:block:", v12, a3, v38);

      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v35;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v35 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v24 = *(void **)(v3 + 112);
            objc_msgSend(v23, "identifier");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "UUIDString");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "removeObjectForKey:", v26);

            v27 = *(void **)(v3 + 104);
            objc_msgSend(v23, "attachmentIdentifier");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "UUIDString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "removeObjectForKey:", v29);

          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v34, v44, 16);
        }
        while (v20);
      }

      v5 = v33;
      v3 = v31;
    }
    else
    {
      v3 = 0;
    }

  }
  return v3;
}

uint64_t __66__HDCloudSyncPullReferencesOperation__ingestAssetForRecord_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "attachmentIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "attachmentIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

uint64_t __66__HDCloudSyncPullReferencesOperation__ingestAssetForRecord_error___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  HDInsertSynchronisedAttachmentReferences *v11;
  NSObject *v12;
  HDInsertSynchronisedAttachmentReferences *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  HDInsertSynchronisedAttachmentReferences *v23;
  HDInsertSynchronisedAttachmentReferences *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  HDInsertSynchronisedAttachmentReferences *v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "hasAssetData"))
  {
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "repository");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attachmentManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "assetData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0;
    v10 = objc_msgSend(v6, "insertAttachmentReferences:attachment:fileData:encrypt:error:", v7, v8, v9, 0, &v42);
    v11 = (HDInsertSynchronisedAttachmentReferences *)v42;

    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      v12 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v31 = *(void **)(a1 + 32);
        v30 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v44 = v30;
        v45 = 2114;
        v46 = v31;
        v47 = 2114;
        v48 = v11;
        _os_log_error_impl(&dword_1B7802000, v12, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to ingest attachment record %{public}@, %{public}@", buf, 0x20u);
      }
      v13 = v11;
      v14 = v13 == 0;
      if (!v13)
        goto LABEL_17;
      if (a2)
        goto LABEL_7;
LABEL_16:
      _HKLogDroppedError();
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  v15 = (void *)MEMORY[0x1E0CB3608];
  objc_msgSend(*(id *)(a1 + 32), "assetURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  objc_msgSend(v15, "fileHandleForReadingFromURL:error:", v16, &v41);
  v13 = (HDInsertSynchronisedAttachmentReferences *)objc_claimAutoreleasedReturnValue();
  v11 = (HDInsertSynchronisedAttachmentReferences *)v41;

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "repository");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "attachmentManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "attachment");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v22 = objc_msgSend(v19, "insertAttachmentReferences:attachment:fileHandle:encrypt:error:", v20, v21, v13, 0, &v40);
    v23 = (HDInsertSynchronisedAttachmentReferences *)v40;

    -[HDInsertSynchronisedAttachmentReferences closeFile](v13, "closeFile");
    if (!v22)
    {
      _HKInitializeLogging();
      v28 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v39 = *(void **)(a1 + 32);
        v38 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        v44 = v38;
        v45 = 2114;
        v46 = v39;
        v47 = 2114;
        v48 = v23;
        _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to ingest attachment record %{public}@, %{public}@", buf, 0x20u);
      }
      v24 = v23;
      v14 = v24 == 0;
      if (v24)
      {
        if (a2)
          *a2 = objc_retainAutorelease(v24);
        else
          _HKLogDroppedError();
      }

      goto LABEL_25;
    }

LABEL_11:
    v11 = -[HDInsertSynchronisedAttachmentReferences initWithAttachmentReferences:]([HDInsertSynchronisedAttachmentReferences alloc], "initWithAttachmentReferences:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "configuration");
    v13 = (HDInsertSynchronisedAttachmentReferences *)objc_claimAutoreleasedReturnValue();
    -[HDInsertSynchronisedAttachmentReferences repository](v13, "repository");
    v24 = (HDInsertSynchronisedAttachmentReferences *)objc_claimAutoreleasedReturnValue();
    -[HDInsertSynchronisedAttachmentReferences profile](v24, "profile");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "legacyRepositoryProfile");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HDJournalableOperation performOrJournalWithProfile:error:](v11, "performOrJournalWithProfile:error:", v26, a2);

LABEL_25:
    goto LABEL_26;
  }
  _HKInitializeLogging();
  v27 = (void *)*MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
  {
    v34 = a1 + 32;
    v32 = *(void **)(a1 + 32);
    v33 = *(_QWORD *)(v34 + 8);
    v35 = v27;
    objc_msgSend(v32, "assetURL");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "path");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v44 = v33;
    v45 = 2114;
    v46 = v37;
    v47 = 2114;
    v48 = v11;
    _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to retreive fileHandle for %{public}@, %{public}@", buf, 0x20u);

  }
  v13 = v11;
  v14 = v13 == 0;
  if (!v13)
    goto LABEL_17;
  if (!a2)
    goto LABEL_16;
LABEL_7:
  *a2 = objc_retainAutorelease(v13);
LABEL_17:
  v11 = v13;
LABEL_26:

  return v14;
}

uint64_t __81__HDCloudSyncPullReferencesOperation__persistPendingReferencesIfNeededWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  HDInsertSynchronisedAttachmentReferences *v4;
  void *v5;
  HDInsertSynchronisedAttachmentReferences *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = [HDInsertSynchronisedAttachmentReferences alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDInsertSynchronisedAttachmentReferences initWithAttachmentReferences:](v4, "initWithAttachmentReferences:", v5);

  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "repository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "legacyRepositoryProfile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDJournalableOperation performOrJournalWithProfile:error:](v6, "performOrJournalWithProfile:error:", v10, a2);

  return v11;
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  char v10;
  id v11;
  int64_t epoch;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  HDCloudSyncPullReferencesOperation *v19;
  _BOOL8 v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  HDCloudSyncPullReferencesOperation *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    v24 = 0;
    v10 = -[HDCloudSyncPullReferencesOperation _persistPendingReferencesIfNeededWithError:]((id *)&self->super.super.isa, (uint64_t)&v24);
    v11 = v24;
    if ((v10 & 1) == 0)
    {
      _HKInitializeLogging();
      v21 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v26 = self;
        v27 = 2114;
        v28 = v11;
        _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to persist pending references, %{public}@", buf, 0x16u);
      }
      v19 = self;
      v20 = 0;
      goto LABEL_9;
    }
    v22 = v8;
    epoch = self->_epoch;
    -[HDCloudSyncOperation configuration](self, "configuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "repository");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "legacyRepositoryProfile");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v17 = HDSetCloudSyncAttachmentReferenceEpoch(epoch, v16, (uint64_t)&v23);
    v18 = v23;

    if (!v17)
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v18);

      v8 = v22;
      goto LABEL_10;
    }

    v8 = v22;
  }
  objc_msgSend(v9, "firstObject");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v19 = self;
  v20 = v6;
LABEL_9:
  -[HDCloudSyncOperation finishWithSuccess:error:](v19, "finishWithSuccess:error:", v20, v11);
LABEL_10:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);
  objc_storeStrong((id *)&self->_attachmentZone, 0);
  objc_storeStrong((id *)&self->_referencesToPersist, 0);
  objc_storeStrong((id *)&self->_attachmentRecordsToFetch, 0);
}

@end
