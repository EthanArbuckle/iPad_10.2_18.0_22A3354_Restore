@implementation HDCloudSyncPullReferenceTombstonesOperation

- (BOOL)performWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  BOOL v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  id v46;
  id v48;
  id v49;
  id v50;
  void *v51;
  uint64_t v52;
  id v53;
  _QWORD v54[4];
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD aBlock[4];
  id v60;
  id v61;
  HDCloudSyncPullReferenceTombstonesOperation *v62;
  uint64_t *v63;
  id v64;
  id v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;

  v66 = 0;
  v67 = &v66;
  v68 = 0x2020000000;
  v69 = 0;
  -[HDCloudSyncOperation configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "repository");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "legacyRepositoryProfile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v9 = HDCloudSyncAttachmentReferenceTombstoneEpoch(v8, (uint64_t)&v65);
  v10 = v65;

  v69 = v9;
  if (v67[3])
    v11 = 1;
  else
    v11 = v10 == 0;
  if (v11)
  {
    -[HDCloudSyncOperation configuration](self, "configuration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "cachedCloudState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "repository");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "primaryCKContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "containerIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = 0;
    objc_msgSend(v13, "attachmentZoneForContainerID:error:", v17, &v64);
    v52 = objc_claimAutoreleasedReturnValue();
    v18 = v64;

    v19 = (void *)v52;
    if (!v52 && v18)
    {
      v20 = v18;
      v21 = v20;
      if (a3)
      {
        v22 = 0;
        *a3 = objc_retainAutorelease(v20);
      }
      else
      {
        _HKLogDroppedError();
        v22 = 0;
        v19 = 0;
      }
      goto LABEL_34;
    }
    if (!v52)
    {
      -[HDCloudSyncOperation configuration](self, "configuration");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "repository");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "profileType");

      v19 = 0;
      if (v26 != 1)
      {
        v22 = 1;
LABEL_35:

        goto LABEL_36;
      }
    }
    v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke;
    aBlock[3] = &unk_1E6CF1628;
    v60 = v19;
    v63 = &v66;
    v50 = v27;
    v61 = v50;
    v62 = self;
    v28 = _Block_copy(aBlock);
    +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCloudSyncOperation configuration](self, "configuration");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "accessibilityAssertion");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "contextWithAccessibilityAssertion:", v31);
    v51 = (void *)objc_claimAutoreleasedReturnValue();

    -[HDCloudSyncOperation configuration](self, "configuration");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "repository");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "profile");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "database");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = 0;
    v36 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_3;
    v56[3] = &unk_1E6CF1650;
    v57 = v28;
    v54[0] = v36;
    v54[1] = 3221225472;
    v54[2] = __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_4;
    v54[3] = &unk_1E6CEEAB8;
    v49 = v57;
    v55 = v49;
    LODWORD(v36) = objc_msgSend(v35, "performTransactionWithContext:error:block:inaccessibilityHandler:", v51, &v58, v56, v54);
    v37 = v58;

    if ((_DWORD)v36)
    {
      v48 = v37;
      v38 = v67[3];
      -[HDCloudSyncOperation configuration](self, "configuration");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "repository");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "profile");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "legacyRepositoryProfile");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v10;
      LOBYTE(v38) = HDSetCloudSyncAttachmentReferenceTombstoneEpoch(v38, v42, (uint64_t)&v53);
      v43 = v53;

      if ((v38 & 1) != 0)
      {
        v22 = 1;
        v10 = v43;
        v19 = (void *)v52;
        v44 = v49;
        v21 = v50;
        v37 = v48;
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
      v46 = v43;
      v45 = v46;
      v21 = v50;
      v37 = v48;
      if (!v46)
      {
        v10 = 0;
        v22 = 1;
        v19 = (void *)v52;
        goto LABEL_32;
      }
      if (!a3)
      {
        _HKLogDroppedError();
        v22 = 0;
        v10 = v45;
        v19 = (void *)v52;
        v21 = v50;
        v37 = v48;
        goto LABEL_32;
      }
      v10 = v46;
      v19 = (void *)v52;
      goto LABEL_26;
    }
    v45 = v37;
    if (v45)
    {
      v19 = (void *)v52;
      v21 = v50;
      if (a3)
      {
LABEL_26:
        v45 = objc_retainAutorelease(v45);
        v22 = 0;
        *a3 = v45;
LABEL_32:
        v44 = v49;

        goto LABEL_33;
      }
      _HKLogDroppedError();
      v22 = 0;
    }
    else
    {
      v22 = 1;
    }
    v19 = (void *)v52;
    v21 = v50;
    goto LABEL_32;
  }
  v23 = v10;
  v18 = v23;
  if (a3)
  {
    v22 = 0;
    *a3 = objc_retainAutorelease(v23);
  }
  else
  {
    _HKLogDroppedError();
    v22 = 0;
  }
  v10 = v18;
LABEL_36:

  _Block_object_dispose(&v66, 8);
  return v22;
}

uint64_t __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  HDDeleteAttachmentReferenceOperation *v9;
  HDDeleteAttachmentReferenceOperation *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *, uint64_t);
  void *v20;
  id v21;
  uint64_t v22;

  v5 = *(void **)(a1 + 32);
  v6 = objc_opt_class();
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(*(_QWORD *)(v7 + 8) + 24);
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_2;
  v20 = &unk_1E6CF1600;
  v22 = v7;
  v21 = *(id *)(a1 + 40);
  if (objc_msgSend(v5, "recordsForClass:epoch:error:enumerationHandler:", v6, v8, a3, &v17))
  {
    v9 = [HDDeleteAttachmentReferenceOperation alloc];
    v10 = -[HDDeleteAttachmentReferenceOperation initWithSynchronizedReferences:](v9, "initWithSynchronizedReferences:", *(_QWORD *)(a1 + 40), v17, v18, v19, v20);
    objc_msgSend(*(id *)(a1 + 48), "configuration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "repository");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "legacyRepositoryProfile");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HDJournalableOperation performOrJournalWithProfile:error:](v10, "performOrJournalWithProfile:error:", v14, a3);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  if (v4 <= a3)
    v4 = a3;
  *(_QWORD *)(v3 + 24) = v4;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(a2, "attachmentReferenceTombstones");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

  return 1;
}

uint64_t __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__HDCloudSyncPullReferenceTombstonesOperation_performWithError___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
