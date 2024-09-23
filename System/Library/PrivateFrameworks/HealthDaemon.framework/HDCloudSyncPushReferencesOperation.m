@implementation HDCloudSyncPushReferencesOperation

- (HDCloudSyncPushReferencesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncPushReferencesOperation *v4;
  NSMutableArray *v5;
  NSMutableArray *unsynchronizedReferences;
  NSMutableArray *v7;
  NSMutableArray *referencesToPush;
  NSMutableSet *v9;
  NSMutableSet *attachmentRecordsToPush;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HDCloudSyncPushReferencesOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v12, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unsynchronizedReferences = v4->_unsynchronizedReferences;
    v4->_unsynchronizedReferences = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    referencesToPush = v4->_referencesToPush;
    v4->_referencesToPush = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    attachmentRecordsToPush = v4->_attachmentRecordsToPush;
    v4->_attachmentRecordsToPush = v9;

  }
  return v4;
}

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
  HDCloudSyncCachedZone *attachmentZone;
  HDCloudSyncCachedZone *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  id v27;
  NSMutableArray *referencesToPush;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  HDCloudSyncModifyRecordsOperation *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  HDCloudSyncModifyRecordsOperation *v38;
  HDCloudSyncPushReferencesOperation *v39;
  uint64_t v40;
  id v41;
  char v42;
  HDCloudSyncModifyRecordsOperation *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  _QWORD v47[5];
  id v48;
  uint64_t v49;
  void *v50;
  void *v51;
  HDCloudSyncPushReferencesOperation *v52;

  -[HDCloudSyncOperation configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedCloudState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryCKContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "containerIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v4, "attachmentZoneForContainerID:error:", v8, &v46);
  v9 = (HDCloudSyncCachedZone *)objc_claimAutoreleasedReturnValue();
  v10 = v46;
  attachmentZone = self->_attachmentZone;
  self->_attachmentZone = v9;

  v12 = self->_attachmentZone;
  if (v12)
    v13 = 1;
  else
    v13 = v10 == 0;
  if (v13)
  {
    if (!v12)
    {
      -[HDCloudSyncOperation configuration](self, "configuration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "repository");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "profileType");

      if (v16 != 1)
      {
        v39 = self;
        v40 = 1;
        v41 = 0;
        goto LABEL_12;
      }
    }
    v45 = 0;
    +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accessibilityAssertion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "contextWithAccessibilityAssertion:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](self, "configuration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "repository");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "profile");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "database");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)MEMORY[0x1E0C809B0];
    v48 = (id)MEMORY[0x1E0C809B0];
    v49 = 3221225472;
    v50 = __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke;
    v51 = &unk_1E6CEBC00;
    v52 = self;
    v26 = objc_msgSend(v24, "performTransactionWithContext:error:block:inaccessibilityHandler:", v20, &v45, &v48, 0);

    v27 = v45;
    if ((v26 & 1) == 0)
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v27);
LABEL_20:

      goto LABEL_21;
    }
    referencesToPush = self->_referencesToPush;
    v44[0] = v25;
    v44[1] = 3221225472;
    v44[2] = __42__HDCloudSyncPushReferencesOperation_main__block_invoke;
    v44[3] = &unk_1E6D0CA40;
    v44[4] = self;
    -[NSMutableArray hk_map:](referencesToPush, "hk_map:", v44);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v29, "mutableCopy");

    -[NSMutableSet allObjects](self->_attachmentRecordsToPush, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "addObjectsFromArray:", v31);

    v32 = v30;
    if (objc_msgSend(v32, "count"))
    {
      v33 = [HDCloudSyncModifyRecordsOperation alloc];
      -[HDCloudSyncOperation configuration](self, "configuration");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDCloudSyncOperation configuration](self, "configuration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "repository");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "primaryCKContainer");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v33, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v34, v37, v32, 0);

      v48 = v25;
      v49 = 3221225472;
      v50 = __73__HDCloudSyncPushReferencesOperation__pushToCloudKitAndFinishForRecords___block_invoke;
      v51 = &unk_1E6CE77A0;
      v52 = self;
      -[HDCloudSyncOperation setOnError:](v38, "setOnError:", &v48);
      v47[0] = v25;
      v47[1] = 3221225472;
      v47[2] = __73__HDCloudSyncPushReferencesOperation__pushToCloudKitAndFinishForRecords___block_invoke_198;
      v47[3] = &unk_1E6CE7778;
      v47[4] = self;
      -[HDCloudSyncOperation setOnSuccess:](v38, "setOnSuccess:", v47);
      -[HDCloudSyncOperation start](v38, "start");
LABEL_11:

LABEL_19:
      goto LABEL_20;
    }
    if (-[NSMutableArray count](self->_unsynchronizedReferences, "count"))
    {
      v48 = 0;
      v42 = -[HDCloudSyncPushReferencesOperation _updateReferencesToSynchronizedWithError:](self, (uint64_t)&v48);
      v43 = (HDCloudSyncModifyRecordsOperation *)v48;
      v38 = v43;
      if ((v42 & 1) == 0)
      {
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v43);
        goto LABEL_11;
      }

    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
    goto LABEL_19;
  }
  v39 = self;
  v40 = 0;
  v41 = v10;
LABEL_12:
  -[HDCloudSyncOperation finishWithSuccess:error:](v39, "finishWithSuccess:error:", v40, v41);
LABEL_21:

}

id __42__HDCloudSyncPushReferencesOperation_main__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HDCloudSyncAttachmentReferenceRecord *v4;
  void *v5;
  void *v6;
  HDCloudSyncAttachmentReferenceRecord *v7;
  void *v8;

  v3 = a2;
  v4 = [HDCloudSyncAttachmentReferenceRecord alloc];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "zoneIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "zoneIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HDCloudSyncAttachmentReferenceRecord initWithAttachmentReference:zoneID:](v4, "initWithAttachmentReference:zoneID:", v3, v6);

  -[HDCloudSyncRecord record](v7, "record");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

BOOL __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  _BOOL8 v7;
  _QWORD v9[5];

  v5 = a2;
  HDAttachmentReferencePredicateForUnsynchronizedReferences();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke_2;
  v9[3] = &unk_1E6CF27E8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v7 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesWithPredicate:transaction:error:enumerationHandler:", v6, v5, a3, v9);

  return v7;
}

BOOL __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  _BOOL8 v23;
  id v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  id v46;
  uint64_t v47;
  _QWORD *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id v59;
  uint8_t buf[4];
  uint64_t v61;
  __int16 v62;
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "zoneIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "zoneIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncAttachmentReferenceRecord recordIDForReferenceIdentifier:zoneID:](HDCloudSyncAttachmentReferenceRecord, "recordIDForReferenceIdentifier:zoneID:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "attachmentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "zoneIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "zoneIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncAttachmentRecord recordIDForAttachmentIdentifier:zoneID:](HDCloudSyncAttachmentRecord, "recordIDForAttachmentIdentifier:zoneID:", v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "addObject:", v5);
  v16 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "containsRecordWithRecordID:error:", v10, a3);
  if (v16)
  {
    if (v16 != 2)
    {
LABEL_12:
      v23 = 1;
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "addObject:", v5);
    v17 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke_3;
    v58[3] = &unk_1E6CEC6A0;
    v18 = v15;
    v59 = v18;
    if (objc_msgSend(v17, "hk_containsObjectPassingTest:", v58))
    {
LABEL_11:

      goto LABEL_12;
    }
    v19 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    v57 = 0;
    objc_msgSend(v19, "recordForRecordID:class:error:", v18, objc_opt_class(), &v57);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v57;
    if (v21)
    {
      v22 = v21;
      if (a3)
        *a3 = objc_retainAutorelease(v21);
      else
        _HKLogDroppedError();

      goto LABEL_16;
    }
    if (v20)
    {
      v24 = 0;
LABEL_10:
      v25 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
      objc_msgSend(v20, "record");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addObject:", v26);

      goto LABEL_11;
    }
    v48 = a3;
    objc_msgSend(v5, "attachmentIdentifier");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "repository");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "profile");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "legacyRepositoryProfile");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    +[HDAttachmentEntity attachmentWithIdentifier:profile:error:](HDAttachmentEntity, "attachmentWithIdentifier:profile:error:", v49, v30, &v56);
    v31 = objc_claimAutoreleasedReturnValue();
    v22 = v56;

    if (!v31)
    {
      if (!v22)
      {
        _HKInitializeLogging();
        v45 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
        {
          v47 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138543618;
          v61 = v47;
          v62 = 2114;
          v63 = v5;
          _os_log_fault_impl(&dword_1B7802000, v45, OS_LOG_TYPE_FAULT, "%{public}@ No attachment found for reference %{public}@", buf, 0x16u);
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("No attachment found for reference %@"), v5);
        v46 = (id)objc_claimAutoreleasedReturnValue();
        v23 = v46 == 0;
        if (v46)
        {
          if (v48)
            *v48 = objc_retainAutorelease(v46);
          else
            _HKLogDroppedError();
        }

        v22 = 0;
        goto LABEL_17;
      }
      if (v48)
      {
        v22 = objc_retainAutorelease(v22);
        v23 = 0;
        *v48 = v22;
        goto LABEL_17;
      }
      _HKLogDroppedError();
LABEL_16:
      v23 = 0;
LABEL_17:

      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "repository");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "attachmentManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    v53 = (void *)v31;
    objc_msgSend(v33, "fileHandleForAttachment:error:", v31, &v55);
    v34 = objc_claimAutoreleasedReturnValue();
    v35 = v55;

    v36 = (void *)v34;
    if (v34)
    {
      v51 = v35;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "zoneIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "zoneIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v22;
      +[HDCloudSyncAttachmentRecord recordWithAttachment:fileHandle:zoneID:error:](HDCloudSyncAttachmentRecord, "recordWithAttachment:fileHandle:zoneID:error:", v53, v36, v38, &v54);
      v39 = v36;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v54;

      if (v20)
      {

        goto LABEL_10;
      }
      v40 = v53;
      v44 = v24;
      v42 = v44;
      if (v44)
      {
        v43 = v51;
        v36 = v39;
        if (v48)
        {
          v42 = objc_retainAutorelease(v44);
          v23 = 0;
          *v48 = v42;
        }
        else
        {
          _HKLogDroppedError();
          v23 = 0;
        }
        v22 = v42;
      }
      else
      {
        v22 = 0;
        v23 = 1;
        v43 = v51;
        v36 = v39;
      }
    }
    else
    {
      v40 = v53;
      v41 = v35;
      v42 = v41;
      v43 = v35;
      if (v41)
      {
        if (v48)
        {
          v42 = objc_retainAutorelease(v41);
          v23 = 0;
          *v48 = v42;
        }
        else
        {
          _HKLogDroppedError();
          v23 = 0;
        }
      }
      else
      {
        v23 = 1;
      }
    }

    goto LABEL_17;
  }
  v23 = 0;
LABEL_13:

  return v23;
}

uint64_t __86__HDCloudSyncPushReferencesOperation__generateReferenceAndAttachmentRecordsWithError___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "recordID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (uint64_t)_updateReferencesToSynchronizedWithError:(void *)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[5];

  if (!a1)
    return 0;
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityAssertion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextWithAccessibilityAssertion:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "configuration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "repository");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__HDCloudSyncPushReferencesOperation__updateReferencesToSynchronizedWithError___block_invoke;
  v14[3] = &unk_1E6CEBC00;
  v14[4] = a1;
  v12 = objc_msgSend(v11, "performTransactionWithContext:error:block:inaccessibilityHandler:", v7, a2, v14, 0);

  return v12;
}

void __73__HDCloudSyncPushReferencesOperation__pushToCloudKitAndFinishForRecords___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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
    _os_log_error_impl(&dword_1B7802000, v5, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to modify records: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

void __73__HDCloudSyncPushReferencesOperation__pushToCloudKitAndFinishForRecords___block_invoke_198(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v14 = 0;
  v3 = -[HDCloudSyncPushReferencesOperation _updateReferencesToSynchronizedWithError:](v2, (uint64_t)&v14);
  v4 = v14;
  if ((v3 & 1) != 0)
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 112);
      v8 = v5;
      v9 = objc_msgSend(v7, "count");
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count");
      *(_DWORD *)buf = 138543874;
      v16 = v6;
      v17 = 2048;
      v18 = v9;
      v19 = 2048;
      v20 = v10;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Successfully pushed %lu reference and %lu attachments records", buf, 0x20u);

    }
    v11 = *(void **)(a1 + 32);
    v12 = 1;
    v13 = 0;
  }
  else
  {
    v11 = *(void **)(a1 + 32);
    v12 = 0;
    v13 = v4;
  }
  objc_msgSend(v11, "finishWithSuccess:error:", v12, v13);

}

BOOL __79__HDCloudSyncPushReferencesOperation__updateReferencesToSynchronizedWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAttachmentReferenceEntity setCloudStatus:references:transaction:error:](HDAttachmentReferenceEntity, "setCloudStatus:references:transaction:error:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentZone, 0);
  objc_storeStrong((id *)&self->_attachmentRecordsToPush, 0);
  objc_storeStrong((id *)&self->_referencesToPush, 0);
  objc_storeStrong((id *)&self->_unsynchronizedReferences, 0);
}

@end
