@implementation HDCloudSyncPushReferenceTombstonesOperation

- (HDCloudSyncPushReferenceTombstonesOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  HDCloudSyncPushReferenceTombstonesOperation *v4;
  NSMutableArray *v5;
  NSMutableArray *unsynchronizedTombstones;
  NSMutableSet *v7;
  NSMutableSet *referenceRecordsToDelete;
  NSMutableSet *v9;
  NSMutableSet *attachmentsRecordsToDelete;
  NSMutableSet *v11;
  NSMutableSet *tombstoneRecordsToPush;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HDCloudSyncPushReferenceTombstonesOperation;
  v4 = -[HDCloudSyncOperation initWithConfiguration:cloudState:](&v14, sel_initWithConfiguration_cloudState_, a3, a4);
  if (v4)
  {
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    unsynchronizedTombstones = v4->_unsynchronizedTombstones;
    v4->_unsynchronizedTombstones = v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    referenceRecordsToDelete = v4->_referenceRecordsToDelete;
    v4->_referenceRecordsToDelete = v7;

    v9 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    attachmentsRecordsToDelete = v4->_attachmentsRecordsToDelete;
    v4->_attachmentsRecordsToDelete = v9;

    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    tombstoneRecordsToPush = v4->_tombstoneRecordsToPush;
    v4->_tombstoneRecordsToPush = v11;

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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  int v46;
  id v47;
  NSMutableSet *tombstoneRecordsToPush;
  id v49;
  NSMutableSet *v50;
  HDCloudSyncModifyRecordsOperation *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HDCloudSyncModifyRecordsOperation *v58;
  void *v59;
  HDCloudSyncPushReferenceTombstonesOperation *v60;
  uint64_t v61;
  id v62;
  NSObject *v63;
  NSObject *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69[5];
  __int128 buf;
  void *v71;
  void *v72;
  HDCloudSyncPushReferenceTombstonesOperation *v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
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
  v68 = 0;
  objc_msgSend(v4, "attachmentZoneForContainerID:error:", v8, &v68);
  v9 = (HDCloudSyncCachedZone *)objc_claimAutoreleasedReturnValue();
  v10 = v68;
  attachmentZone = self->_attachmentZone;
  self->_attachmentZone = v9;

  v12 = self->_attachmentZone;
  if (v12)
    v13 = 1;
  else
    v13 = v10 == 0;
  if (!v13)
  {
    v60 = self;
    v61 = 0;
    v62 = v10;
LABEL_18:
    -[HDCloudSyncOperation finishWithSuccess:error:](v60, "finishWithSuccess:error:", v61, v62);
    goto LABEL_19;
  }
  if (!v12)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "repository");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "profileType");

    if (v16 != 1)
    {
LABEL_17:
      v60 = self;
      v61 = 1;
      v62 = 0;
      goto LABEL_18;
    }
  }
  v66 = v10;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "repository");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "cloudSyncManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "ownerIdentifierManager");
  v21 = objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "repository");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "primaryCKContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v21, "cachedOwnerIdentifierForContainer:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "accessibilityAssertion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contextWithAccessibilityAssertion:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "repository");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "profile");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "database");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v69[0] = 0;
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v71 = __116__HDCloudSyncPushReferenceTombstonesOperation__generateTombstoneRecordsToPushAndReferencesRecordsToDeleteWithError___block_invoke;
  v72 = &unk_1E6CE7950;
  v73 = self;
  v74 = v25;
  v34 = v25;
  LOBYTE(v21) = objc_msgSend(v33, "performTransactionWithContext:error:block:inaccessibilityHandler:", v29, v69, &buf, 0);
  v35 = v69[0];

  if ((v21 & 1) == 0)
  {
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, 0);
    v10 = v66;
    goto LABEL_19;
  }
  if (!-[NSMutableSet count](self->_tombstoneRecordsToPush, "count"))
  {
    _HKInitializeLogging();
    v63 = *MEMORY[0x1E0CB5370];
    v10 = v66;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B7802000, v63, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@ No reference tombstones to push.", (uint8_t *)&buf, 0xCu);
    }
    goto LABEL_17;
  }
  v67 = 0;
  v36 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  +[HDMutableDatabaseTransactionContext contextForReadingProtectedData](HDMutableDatabaseTransactionContext, "contextForReadingProtectedData");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncOperation configuration](self, "configuration");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "accessibilityAssertion");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "contextWithAccessibilityAssertion:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDCloudSyncOperation configuration](self, "configuration");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "repository");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "profile");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "database");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
  *((_QWORD *)&buf + 1) = 3221225472;
  v71 = __122__HDCloudSyncPushReferenceTombstonesOperation__updateRecordsToDeleteBySkippingAttachmentsWithMultipleReferencesWithError___block_invoke;
  v72 = &unk_1E6CE7950;
  v73 = self;
  v45 = v36;
  v74 = v45;
  v46 = objc_msgSend(v44, "performTransactionWithContext:error:block:inaccessibilityHandler:", v40, &v67, &buf, 0);

  if (v46)
    -[NSMutableSet minusSet:](self->_attachmentsRecordsToDelete, "minusSet:", v45);

  v47 = v67;
  if ((v46 & 1) != 0)
  {
    tombstoneRecordsToPush = self->_tombstoneRecordsToPush;
    -[NSMutableSet setByAddingObjectsFromSet:](self->_referenceRecordsToDelete, "setByAddingObjectsFromSet:", self->_attachmentsRecordsToDelete);
    v65 = v47;
    v49 = (id)objc_claimAutoreleasedReturnValue();
    v50 = tombstoneRecordsToPush;
    v51 = [HDCloudSyncModifyRecordsOperation alloc];
    -[HDCloudSyncOperation configuration](self, "configuration");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "repository");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "primaryCKContainer");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet allObjects](v50, "allObjects");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v49, "allObjects");
    v57 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v51, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v52, v55, v56, v57);
    v59 = (void *)MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v71 = __95__HDCloudSyncPushReferenceTombstonesOperation__modifyCloudWithRecordsToSave_recordIDsToDelete___block_invoke;
    v72 = &unk_1E6CE77A0;
    v73 = self;
    -[HDCloudSyncOperation setOnError:](v58, "setOnError:", &buf);
    v69[0] = v59;
    v47 = v65;
    v69[1] = (id)3221225472;
    v69[2] = __95__HDCloudSyncPushReferenceTombstonesOperation__modifyCloudWithRecordsToSave_recordIDsToDelete___block_invoke_199;
    v69[3] = &unk_1E6CE7778;
    v69[4] = self;
    -[HDCloudSyncOperation setOnSuccess:](v58, "setOnSuccess:", v69);
    -[HDCloudSyncOperation start](v58, "start");

  }
  else
  {
    _HKInitializeLogging();
    v64 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = self;
      _os_log_impl(&dword_1B7802000, v64, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@ Failed to skip attachments with multiple references.", (uint8_t *)&buf, 0xCu);
    }
    -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v47);
  }
  v10 = v66;

LABEL_19:
}

BOOL __116__HDCloudSyncPushReferenceTombstonesOperation__generateTombstoneRecordsToPushAndReferencesRecordsToDeleteWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a2;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__130;
  v21 = __Block_byref_object_dispose__130;
  v22 = 0;
  HDAttachmentReferencePredicateForUnsynchronizedTombstones();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __116__HDCloudSyncPushReferenceTombstonesOperation__generateTombstoneRecordsToPushAndReferencesRecordsToDeleteWithError___block_invoke_186;
  v14[3] = &unk_1E6CFED48;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v16 = &v17;
  v14[4] = v7;
  v15 = v8;
  v9 = +[HDAttachmentReferenceEntity enumerateReferencesWithPredicate:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesWithPredicate:transaction:error:enumerationHandler:", v6, v5, a3, v14);

  if (v9)
  {
    v10 = (void *)v18[5];
    if (v10)
    {
      v11 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
      objc_msgSend(v10, "record");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v12);

    }
  }

  _Block_object_dispose(&v17, 8);
  return v9;
}

uint64_t __116__HDCloudSyncPushReferenceTombstonesOperation__generateTombstoneRecordsToPushAndReferencesRecordsToDeleteWithError___block_invoke_186(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  HDCloudSyncAttachmentReferenceTombstoneRecord *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  HDCloudSyncAttachmentReferenceTombstoneRecord *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  HDCloudSyncAttachmentReferenceTombstoneRecord *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  BOOL v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  id v70;
  NSObject *v71;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  _QWORD v87[4];
  _BYTE buf[24];
  void *v89;
  id v90;
  _QWORD *v91;
  uint64_t *v92;
  uint64_t v93;

  v93 = *MEMORY[0x1E0C80C00];
  v77 = a2;
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v5)
  {
    v75 = a3;
    v6 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v87[0] = 0;
      v87[1] = v87;
      v87[2] = 0x2020000000;
      v87[3] = 0;
      v81 = 0;
      v82 = &v81;
      v83 = 0x3032000000;
      v84 = __Block_byref_object_copy__130;
      v85 = __Block_byref_object_dispose__130;
      v86 = 0;
      v8 = *(void **)(v6 + 136);
      v9 = objc_opt_class();
      v80 = 0;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __101__HDCloudSyncPushReferenceTombstonesOperation_tombstoneRecordToPushForZoneWithOwnerIdentifier_error___block_invoke;
      v89 = &unk_1E6CFED70;
      v10 = v7;
      v90 = v10;
      v91 = v87;
      v92 = &v81;
      v11 = objc_msgSend(v8, "recordsForClass:epoch:error:enumerationHandler:", v9, 0, &v80, buf);
      v12 = v80;
      v13 = v12;
      if ((v11 & 1) != 0)
      {
        v14 = (void *)v82[5];
        if (!v14)
        {
          v15 = [HDCloudSyncAttachmentReferenceTombstoneRecord alloc];
          objc_msgSend(*(id *)(v6 + 136), "zoneIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "zoneIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = -[HDCloudSyncAttachmentReferenceTombstoneRecord initWithOwnerIdentifier:recordIndex:zoneID:](v15, "initWithOwnerIdentifier:recordIndex:zoneID:", v10, 0, v17);
          v19 = (void *)v82[5];
          v82[5] = v18;

          v14 = (void *)v82[5];
        }
        if (objc_msgSend(v14, "attachmentReferenceTombstoneCount") >= 10000)
        {
          v20 = objc_msgSend((id)v82[5], "recordIndex");
          v21 = [HDCloudSyncAttachmentReferenceTombstoneRecord alloc];
          objc_msgSend(*(id *)(v6 + 136), "zoneIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "zoneIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[HDCloudSyncAttachmentReferenceTombstoneRecord initWithOwnerIdentifier:recordIndex:zoneID:](v21, "initWithOwnerIdentifier:recordIndex:zoneID:", v10, v20 + 1, v23);
          v25 = (void *)v82[5];
          v82[5] = v24;

        }
        v26 = (id)v82[5];
        v27 = 0;
      }
      else
      {
        if (v12)
        {
          v27 = objc_retainAutorelease(v12);

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Failed to retrieve tombstone record from cache."));
          v28 = (id)objc_claimAutoreleasedReturnValue();
          v27 = v28;
          if (v28)
            v29 = objc_retainAutorelease(v28);

        }
        v26 = 0;
      }

      _Block_object_dispose(&v81, 8);
      _Block_object_dispose(v87, 8);

    }
    else
    {
      v27 = 0;
      v26 = 0;
    }

    v30 = v27;
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v26;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v70 = v30;
      v51 = v70;
      if (v70)
      {
        if (v75)
        {
          v51 = objc_retainAutorelease(v70);
          v52 = 0;
          *v75 = v51;
        }
        else
        {
          _HKLogDroppedError();
          v52 = 0;
        }
        v47 = v51;
      }
      else
      {
        v47 = 0;
        v52 = 1;
      }
      goto LABEL_46;
    }

    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  }
  if (objc_msgSend(v5, "attachmentReferenceTombstoneCount") >= 10000)
  {
    v33 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "record");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObject:", v34);

    v35 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "recordIndex");
    v36 = [HDCloudSyncAttachmentReferenceTombstoneRecord alloc];
    objc_msgSend(*(id *)(a1 + 40), "string");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "zoneIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "zoneIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = -[HDCloudSyncAttachmentReferenceTombstoneRecord initWithOwnerIdentifier:recordIndex:zoneID:](v36, "initWithOwnerIdentifier:recordIndex:zoneID:", v37, v35 + 1, v39);
    v41 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v42 = *(void **)(v41 + 40);
    *(_QWORD *)(v41 + 40) = v40;

  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addAttachmentReferenceTombstone:", v77);
  objc_msgSend(v77, "identifier");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "UUIDString");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "zoneIdentifier");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "zoneIdentifier");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDCloudSyncAttachmentReferenceRecord recordIDForReferenceIdentifier:zoneID:](HDCloudSyncAttachmentReferenceRecord, "recordIDForReferenceIdentifier:zoneID:", v44, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  v79 = 0;
  objc_msgSend(v48, "recordForRecordID:class:error:", v47, objc_opt_class(), &v79);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v79;
  v51 = v50;
  if (v49 || !v50)
  {
    if (v49)
    {
      objc_msgSend(v49, "attachmentIdentifier");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 136), "zoneIdentifier");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "zoneIdentifier");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDCloudSyncAttachmentRecord recordIDForAttachmentIdentifier:zoneID:](HDCloudSyncAttachmentRecord, "recordIDForAttachmentIdentifier:zoneID:", v53, v55);
      v76 = (void *)objc_claimAutoreleasedReturnValue();

      v56 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
      v78 = 0;
      objc_msgSend(v56, "recordForRecordID:class:error:", v76, objc_opt_class(), &v78);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v58 = v78;
      v59 = v58;
      if (v57)
        v60 = 1;
      else
        v60 = v58 == 0;
      v52 = v60;
      if (v60)
      {
        if (v57)
        {
          v62 = *(_QWORD *)(a1 + 32);
          v61 = a1 + 32;
          v63 = *(void **)(v62 + 112);
          objc_msgSend(v49, "record");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "recordID");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "addObject:", v65);

          v66 = *(void **)(*(_QWORD *)v61 + 120);
          objc_msgSend(v57, "record");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "recordID");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "addObject:", v68);

          objc_msgSend(*(id *)(*(_QWORD *)v61 + 104), "addObject:", v77);
        }
        else
        {
          _HKInitializeLogging();
          v71 = *MEMORY[0x1E0CB5370];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_FAULT))
          {
            v74 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v74;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v49;
            _os_log_fault_impl(&dword_1B7802000, v71, OS_LOG_TYPE_FAULT, "[attachments] %{public}@ Missing attachment record for corresponding reference %{public}@.", buf, 0x16u);
          }
        }
      }

    }
    else
    {
      _HKInitializeLogging();
      v69 = *MEMORY[0x1E0CB5370];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
      {
        v73 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v73;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v77;
        _os_log_error_impl(&dword_1B7802000, v69, OS_LOG_TYPE_ERROR, "[attachments] %{public}@ Failed to find record for reference %{public}@.", buf, 0x16u);
      }
      v52 = 1;
    }
  }
  else
  {
    v52 = 0;
  }

LABEL_46:
  return v52;
}

uint64_t __101__HDCloudSyncPushReferenceTombstonesOperation_tombstoneRecordToPushForZoneWithOwnerIdentifier_error___block_invoke(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  int v6;

  v4 = a2;
  objc_msgSend(v4, "ownerIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", a1[4]);

  if (v6 && objc_msgSend(v4, "recordIndex") >= *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v4, "recordIndex");
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  }

  return 1;
}

uint64_t __122__HDCloudSyncPushReferenceTombstonesOperation__updateRecordsToDeleteBySkippingAttachmentsWithMultipleReferencesWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id obj;
  uint64_t v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  uint64_t v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v21 = a1;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 120);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v28;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v23 = 0;
        v24 = &v23;
        v25 = 0x2020000000;
        v26 = 0;
        v10 = objc_alloc(MEMORY[0x1E0CB3A28]);
        +[HDCloudSyncAttachmentRecord attachmentIdentifierForRecordID:](HDCloudSyncAttachmentRecord, "attachmentIdentifierForRecordID:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v10, "initWithUUIDString:", v11);

        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __122__HDCloudSyncPushReferenceTombstonesOperation__updateRecordsToDeleteBySkippingAttachmentsWithMultipleReferencesWithError___block_invoke_2;
        v22[3] = &unk_1E6CF9E60;
        v22[4] = &v23;
        if (!+[HDAttachmentReferenceEntity enumerateReferencesForAttachmentIdentifier:type:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesForAttachmentIdentifier:type:transaction:error:enumerationHandler:", v12, 0, v5, a3, v22))
        {

          _Block_object_dispose(&v23, 8);
          v18 = 0;
          goto LABEL_15;
        }
        if (*((_BYTE *)v24 + 24))
        {
          _HKInitializeLogging();
          v13 = (id)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            v14 = a3;
            v15 = v5;
            v16 = *(_QWORD *)(v21 + 32);
            objc_msgSend(v12, "UUIDString");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v32 = v16;
            v33 = 2114;
            v34 = v17;
            _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Skipping deletion for attachment with multiple references %{public}@", buf, 0x16u);

            v5 = v15;
            a3 = v14;
          }

          objc_msgSend(*(id *)(v21 + 40), "addObject:", v9);
        }

        _Block_object_dispose(&v23, 8);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      if (v6)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_15:

  return v18;
}

uint64_t __122__HDCloudSyncPushReferenceTombstonesOperation__updateRecordsToDeleteBySkippingAttachmentsWithMultipleReferencesWithError___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

void __95__HDCloudSyncPushReferenceTombstonesOperation__modifyCloudWithRecordsToSave_recordIDsToDelete___block_invoke(uint64_t a1, uint64_t a2, void *a3)
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

void __95__HDCloudSyncPushReferenceTombstonesOperation__modifyCloudWithRecordsToSave_recordIDsToDelete___block_invoke_199(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  _BYTE buf[24];
  void *v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v22 = 0;
  if (!v2)
  {
    v12 = 0;
    goto LABEL_7;
  }
  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextWithAccessibilityAssertion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "repository");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __88__HDCloudSyncPushReferenceTombstonesOperation__updateTombstonesToSynchronizedWithError___block_invoke;
  v24 = &unk_1E6CEBC00;
  v25 = v2;
  v11 = objc_msgSend(v10, "performTransactionWithContext:error:block:inaccessibilityHandler:", v6, &v22, buf, 0);

  v12 = v22;
  if ((v11 & 1) == 0)
  {
LABEL_7:
    v19 = *(void **)(a1 + 32);
    v20 = 0;
    v21 = v12;
    goto LABEL_8;
  }
  _HKInitializeLogging();
  v13 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 112);
    v16 = v13;
    v17 = objc_msgSend(v15, "count");
    v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "count");
    *(_DWORD *)buf = 138543874;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v17;
    *(_WORD *)&buf[22] = 2048;
    v24 = (void *)v18;
    _os_log_impl(&dword_1B7802000, v16, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Successfully deleted %lu reference and %lu attachments records", buf, 0x20u);

  }
  v19 = *(void **)(a1 + 32);
  v20 = 1;
  v21 = 0;
LABEL_8:
  objc_msgSend(v19, "finishWithSuccess:error:", v20, v21);

}

BOOL __88__HDCloudSyncPushReferenceTombstonesOperation__updateTombstonesToSynchronizedWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAttachmentReferenceEntity setCloudStatus:references:transaction:error:](HDAttachmentReferenceEntity, "setCloudStatus:references:transaction:error:", 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104), a2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentZone, 0);
  objc_storeStrong((id *)&self->_tombstoneRecordsToPush, 0);
  objc_storeStrong((id *)&self->_attachmentsRecordsToDelete, 0);
  objc_storeStrong((id *)&self->_referenceRecordsToDelete, 0);
  objc_storeStrong((id *)&self->_unsynchronizedTombstones, 0);
}

@end
