@implementation HDCloudSyncVerifyAttachmentManagementRecordOperation

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  unsigned __int8 v24;
  HDCloudSyncAttachmentManagementRecord *v25;
  void *v26;
  void *v27;
  id v28;
  HDCloudSyncModifyRecordsOperation *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HDCloudSyncModifyRecordsOperation *v34;
  id v35;
  void *v36;
  void *v37;
  char v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  NSObject *v46;
  unsigned __int8 v47;
  id v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  unsigned int v61;
  id v62;
  void *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _QWORD v69[5];
  id v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  id v77;
  _QWORD v78[5];
  id v79;
  _BYTE buf[24];
  void *v81;
  HDCloudSyncVerifyAttachmentManagementRecordOperation *v82;
  id v83;
  _QWORD v84[4];

  v84[1] = *MEMORY[0x1E0C80C00];
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
  v77 = 0;
  objc_msgSend(v4, "attachmentZoneForContainerID:error:", v8, &v77);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v77;

  if (v9 || !v10)
  {
    if (!v9)
    {
      -[HDCloudSyncOperation configuration](self, "configuration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "repository");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "profileType") == 1;

      if (!v13)
      {
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
        goto LABEL_42;
      }
    }
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__136;
    v75 = __Block_byref_object_dispose__136;
    v76 = 0;
    v14 = objc_opt_class();
    v15 = MEMORY[0x1E0C809B0];
    v69[4] = &v71;
    v70 = 0;
    v69[0] = MEMORY[0x1E0C809B0];
    v69[1] = 3221225472;
    v69[2] = __60__HDCloudSyncVerifyAttachmentManagementRecordOperation_main__block_invoke;
    v69[3] = &unk_1E6CFFAB8;
    v16 = objc_msgSend(v9, "recordsForClass:epoch:error:enumerationHandler:", v14, 0, &v70, v69);
    v17 = v70;
    v63 = v17;
    if ((v16 & 1) == 0)
    {
      -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v17);
LABEL_41:
      _Block_object_dispose(&v71, 8);

      goto LABEL_42;
    }
    if (v72[5])
    {
      -[HDCloudSyncOperation configuration](self, "configuration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "repository");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "profile");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "legacyRepositoryProfile");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0;
      HDCloudSyncAttachmentManagementUUID(v21, (uint64_t)&v67);
      v62 = (id)objc_claimAutoreleasedReturnValue();
      v22 = v67;

      if (v22)
      {
        _HKInitializeLogging();
        v23 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v22;
          _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to fetch local attachment management UUID, %{public}@", buf, 0x16u);
        }
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v22);
      }
      else
      {
        v36 = (void *)v72[5];
        if (!v62)
        {
          objc_msgSend(v36, "UUID");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDCloudSyncOperation configuration](self, "configuration");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "repository");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "profile");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "legacyRepositoryProfile");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0;
          v45 = HDSetCloudSyncAttachmentManagementUUID(v40, v44, (uint64_t)&v66);
          v22 = v66;

          if ((v45 & 1) == 0)
          {
            _HKInitializeLogging();
            v46 = (id)*MEMORY[0x1E0CB5370];
            if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend((id)v72[5], "UUID");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v57;
              *(_WORD *)&buf[22] = 2114;
              v81 = v22;
              _os_log_error_impl(&dword_1B7802000, v46, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set previously nil local management UUID %{public}@, %{public}@", buf, 0x20u);

            }
          }
          -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v45, v22);

          goto LABEL_40;
        }
        objc_msgSend(v36, "UUID");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v62, "isEqual:", v37);

        if ((v38 & 1) != 0)
        {
          -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 1, 0);
          v22 = 0;
        }
        else
        {
          v65 = 0;
          v47 = -[HDCloudSyncVerifyAttachmentManagementRecordOperation _updateAllAttachmentReferencesToUnsynchronizedWithError:](self, (uint64_t)&v65);
          v48 = v65;
          if ((v47 & 1) != 0)
          {
            objc_msgSend((id)v72[5], "UUID");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = v48;
            -[HDCloudSyncOperation configuration](self, "configuration");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "repository");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "profile");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "legacyRepositoryProfile");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = 0;
            v61 = HDSetCloudSyncAttachmentManagementUUID(v49, v54, (uint64_t)&v64);
            v22 = v64;

            if ((v61 & 1) == 0)
            {
              _HKInitializeLogging();
              v55 = (id)*MEMORY[0x1E0CB5370];
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend((id)v72[5], "UUID");
                v58 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543874;
                *(_QWORD *)&buf[4] = self;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v58;
                *(_WORD *)&buf[22] = 2114;
                v81 = v22;
                _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to set previously nil local management UUID %{public}@, %{public}@", buf, 0x20u);

              }
            }
            -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", v61, v22);
          }
          else
          {
            _HKInitializeLogging();
            v50 = v48;
            v56 = *MEMORY[0x1E0CB5370];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v50;
              _os_log_error_impl(&dword_1B7802000, v56, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to update local attachment references to state unsynchronized, %{public}@", buf, 0x16u);
            }
            -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v50);
            v22 = 0;
          }

        }
      }
    }
    else
    {
      v68 = 0;
      v24 = -[HDCloudSyncVerifyAttachmentManagementRecordOperation _updateAllAttachmentReferencesToUnsynchronizedWithError:](self, (uint64_t)&v68);
      v22 = v68;
      if ((v24 & 1) == 0)
      {
        _HKInitializeLogging();
        v39 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v22;
          _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to update local attachment references to state unsynchronized, %{public}@", buf, 0x16u);
        }
        -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v22);
        goto LABEL_40;
      }
      v25 = [HDCloudSyncAttachmentManagementRecord alloc];
      objc_msgSend(v9, "zoneIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "zoneIdentifier");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = -[HDCloudSyncAttachmentManagementRecord initInZoneID:](v25, "initInZoneID:", v27);

      v62 = v28;
      if (self)
      {
        v29 = [HDCloudSyncModifyRecordsOperation alloc];
        -[HDCloudSyncOperation configuration](self, "configuration");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCloudSyncOperation configuration](self, "configuration");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "repository");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "primaryCKContainer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "record");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v84[0] = v32;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[HDCloudSyncModifyRecordsOperation initWithConfiguration:container:recordsToSave:recordIDsToDelete:](v29, "initWithConfiguration:container:recordsToSave:recordIDsToDelete:", v59, v31, v33, 0);

        *(_QWORD *)buf = v15;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __101__HDCloudSyncVerifyAttachmentManagementRecordOperation__modifyCloudKitAndFinishWithManagementRecord___block_invoke;
        v81 = &unk_1E6CFFB00;
        v82 = self;
        v35 = v62;
        v83 = v35;
        -[HDCloudSyncOperation setOnError:](v34, "setOnError:", buf);
        v78[0] = v15;
        v78[1] = 3221225472;
        v78[2] = __101__HDCloudSyncVerifyAttachmentManagementRecordOperation__modifyCloudKitAndFinishWithManagementRecord___block_invoke_190;
        v78[3] = &unk_1E6CFBD50;
        v78[4] = self;
        v79 = v35;
        -[HDCloudSyncOperation setOnSuccess:](v34, "setOnSuccess:", v78);
        -[HDCloudSyncOperation start](v34, "start");

      }
    }

LABEL_40:
    goto LABEL_41;
  }
  -[HDCloudSyncOperation finishWithSuccess:error:](self, "finishWithSuccess:error:", 0, v10);
LABEL_42:

}

uint64_t __60__HDCloudSyncVerifyAttachmentManagementRecordOperation_main__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

- (void)_updateAllAttachmentReferencesToUnsynchronizedWithError:(void *)result
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  if (result)
  {
    v3 = result;
    +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "configuration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityAssertion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "contextWithAccessibilityAssertion:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "repository");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "profile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "performTransactionWithContext:error:block:inaccessibilityHandler:", v7, a2, &__block_literal_global_167, 0);

    return (void *)v12;
  }
  return result;
}

BOOL __112__HDCloudSyncVerifyAttachmentManagementRecordOperation__updateAllAttachmentReferencesToUnsynchronizedWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[HDAttachmentReferenceEntity setCloudStatus:transaction:error:](HDAttachmentReferenceEntity, "setCloudStatus:transaction:error:", 0, a2, a3);
}

void __101__HDCloudSyncVerifyAttachmentManagementRecordOperation__modifyCloudKitAndFinishWithManagementRecord___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(a1 + 40);
    v8 = v5;
    objc_msgSend(v6, "recordID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v9;
    v14 = 2114;
    v15 = v4;
    _os_log_error_impl(&dword_1B7802000, v8, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to modify management attachment record %{public}@, %{public}@", (uint8_t *)&v10, 0x20u);

  }
  objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", 0, v4);

}

void __101__HDCloudSyncVerifyAttachmentManagementRecordOperation__modifyCloudKitAndFinishWithManagementRecord___block_invoke_190(uint64_t a1)
{
  os_log_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  os_log_t v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  v2 = (os_log_t *)MEMORY[0x1E0CB5370];
  v3 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    v6 = v3;
    objc_msgSend(v4, "recordID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v25 = v5;
    v26 = 2114;
    v27 = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: Successfully modified management attachment record %{public}@", buf, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "repository");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "legacyRepositoryProfile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v13 = HDSetCloudSyncAttachmentManagementUUID(v8, v12, (uint64_t)&v23);
  v14 = v23;

  if ((v13 & 1) != 0)
  {
    v15 = *(void **)(a1 + 32);
    v16 = 1;
    v17 = 0;
  }
  else
  {
    _HKInitializeLogging();
    v18 = *v2;
    if (os_log_type_enabled(*v2, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(a1 + 32);
      v19 = *(void **)(a1 + 40);
      v21 = v18;
      objc_msgSend(v19, "UUID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v25 = v20;
      v26 = 2114;
      v27 = v22;
      v28 = 2114;
      v29 = v14;
      _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to persist local attachment management UUID %{public}@, %{public}@", buf, 0x20u);

    }
    v15 = *(void **)(a1 + 32);
    v16 = 0;
    v17 = v14;
  }
  objc_msgSend(v15, "finishWithSuccess:error:", v16, v17);

}

@end
