@implementation HDDeleteAttachmentReferenceOperation

- (HDDeleteAttachmentReferenceOperation)initWithReferences:(id)a3
{
  return (HDDeleteAttachmentReferenceOperation *)-[HDDeleteAttachmentReferenceOperation _initWithReferences:cloudStatus:](self, a3, 0);
}

- (_QWORD)_initWithReferences:(uint64_t)a3 cloudStatus:
{
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v5 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)HDDeleteAttachmentReferenceOperation;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v6 = objc_msgSend(v5, "copy");
      v7 = (void *)a1[2];
      a1[2] = v6;

      a1[3] = a3;
    }
  }

  return a1;
}

- (HDDeleteAttachmentReferenceOperation)initWithSynchronizedReferences:(id)a3
{
  return (HDDeleteAttachmentReferenceOperation *)-[HDDeleteAttachmentReferenceOperation _initWithReferences:cloudStatus:](self, a3, 1);
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSArray *references;
  void *v11;
  NSArray *v12;
  void *v13;
  id v14;
  id v15;
  __int128 v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  BOOL v34;
  void *v35;
  void *v36;
  BOOL v37;
  id v39;
  void *v40;
  __int128 v41;
  id v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  id obj;
  id v48;
  HDDeleteAttachmentReferenceOperation *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  id v53;
  _QWORD v54[5];
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[4];
  id v64;
  id v65;
  id v66;
  HDDeleteAttachmentReferenceOperation *v67;
  _QWORD v68[4];
  id v69;
  _QWORD v70[4];
  id v71;
  uint8_t buf[4];
  HDDeleteAttachmentReferenceOperation *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  __int16 v78;
  id v79;
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v46 = a3;
  v8 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v49 = self;
  references = self->_references;
  v70[0] = MEMORY[0x1E0C809B0];
  v70[1] = 3221225472;
  v70[2] = __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke;
  v70[3] = &unk_1E6CF27E8;
  v48 = v9;
  v71 = v48;
  if (+[HDAttachmentReferenceEntity filteredNonTombstoneReferences:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "filteredNonTombstoneReferences:transaction:error:enumerationHandler:", references, v8, a5, v70)&& (!objc_msgSend(v48, "count")|| +[HDAttachmentReferenceEntity deleteReferences:cloudStatus:transaction:error:](HDAttachmentReferenceEntity, "deleteReferences:cloudStatus:transaction:error:", v48, v49->_cloudStatus, v8, a5)))
  {
    objc_msgSend(v48, "hk_map:", &__block_literal_global_237);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v49->_references;
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_3;
    v68[3] = &unk_1E6CFA3C0;
    v42 = v11;
    v69 = v42;
    -[NSArray hk_filter:](v12, "hk_filter:", v68);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v43, "count")
      && !+[HDAttachmentReferenceEntity insertTombstones:cloudStatus:transaction:error:](HDAttachmentReferenceEntity, "insertTombstones:cloudStatus:transaction:error:", v43, v49->_cloudStatus, v8, a5))
    {
      v37 = 0;
    }
    else
    {
      objc_msgSend(v48, "hk_mapToSet:", &__block_literal_global_187_1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v15 = objc_alloc_init(MEMORY[0x1E0CB3620]);
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_5;
      v63[3] = &unk_1E6CECCA8;
      v45 = v14;
      v64 = v45;
      v51 = v46;
      v65 = v51;
      v44 = v15;
      v66 = v44;
      v67 = v49;
      objc_msgSend(v8, "onCommit:orRollback:", v63, 0);
      v61 = 0u;
      v62 = 0u;
      v59 = 0u;
      v60 = 0u;
      obj = v13;
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
      if (v52)
      {
        v50 = *(_QWORD *)v60;
        *(_QWORD *)&v16 = 138544130;
        v41 = v16;
        while (2)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v60 != v50)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v17);
            v55 = 0;
            v56 = &v55;
            v57 = 0x2020000000;
            v58 = 0;
            v54[0] = MEMORY[0x1E0C809B0];
            v54[1] = 3221225472;
            v54[2] = __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_190;
            v54[3] = &unk_1E6CF9E60;
            v54[4] = &v55;
            if (!+[HDAttachmentReferenceEntity enumerateReferencesForAttachmentIdentifier:type:transaction:error:enumerationHandler:](HDAttachmentReferenceEntity, "enumerateReferencesForAttachmentIdentifier:type:transaction:error:enumerationHandler:", v18, 0, v8, a5, v54, v41))
            {
LABEL_28:
              v37 = 0;
LABEL_29:
              _Block_object_dispose(&v55, 8);
              goto LABEL_30;
            }
            if (!*((_BYTE *)v56 + 24))
            {
              _HKInitializeLogging();
              v19 = (id)*MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v18, "UUIDString");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v73 = v49;
                v74 = 2114;
                v75 = v20;
                _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "[attachments] %{public}@: No references remaining. Deleting attachment with identifier %{public}@", buf, 0x16u);

              }
              objc_msgSend(v45, "addObject:", v18);
              objc_msgSend(v51, "attachmentManager");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "unconfirmedFilesDirectoryURL");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "UUIDString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "URLByAppendingPathComponent:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v51, "attachmentManager");
              v25 = objc_claimAutoreleasedReturnValue();
              objc_msgSend((id)v25, "filesDirectoryURL");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "UUIDString");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "URLByAppendingPathComponent:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v53 = 0;
              LOBYTE(v25) = objc_msgSend(v44, "moveItemAtURL:toURL:error:", v28, v24, &v53);
              v29 = v53;
              if ((v25 & 1) == 0)
              {
                _HKInitializeLogging();
                v30 = (id)*MEMORY[0x1E0CB52B0];
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(v28, "path");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "path");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = v41;
                  v73 = v49;
                  v74 = 2114;
                  v75 = v35;
                  v76 = 2114;
                  v77 = v36;
                  v78 = 2114;
                  v79 = v29;
                  _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to move file from %{public}@ -> %{public}@ directory with error %{public}@", buf, 0x2Au);

                }
                if (objc_msgSend(v29, "hk_isCocoaNoSuchFileError"))
                {
                  _HKInitializeLogging();
                  v31 = *MEMORY[0x1E0CB52B0];
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138543618;
                    v73 = v49;
                    v74 = 2114;
                    v75 = v18;
                    _os_log_fault_impl(&dword_1B7802000, v31, OS_LOG_TYPE_FAULT, "[attachments] %{public}@: No such file error for attachment %{public}@", buf, 0x16u);
                  }
                }
                if ((objc_msgSend(v29, "hk_isCocoaNoSuchFileError") & 1) == 0
                  && (objc_msgSend(v29, "hk_isCocoaFileExistsError") & 1) == 0)
                {
                  v39 = v29;
                  v40 = v39;
                  v37 = v39 == 0;
                  if (v39)
                  {
                    if (a5)
                      *a5 = objc_retainAutorelease(v39);
                    else
                      _HKLogDroppedError();
                  }

                  goto LABEL_29;
                }
              }
              HDAttachmentPredicateForAttachmentIdentifier((uint64_t)v18);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v51, "database");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDAttachmentEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", v32, v33, a5);

              if (!v34)
                goto LABEL_28;
            }
            _Block_object_dispose(&v55, 8);
            ++v17;
          }
          while (v52 != v17);
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v80, 16);
          if (v52)
            continue;
          break;
        }
      }
      v37 = 1;
LABEL_30:

    }
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3) ^ 1;

  return v4;
}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "attachmentIdentifier");
}

void __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_5(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  os_log_t *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  os_log_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  __int128 v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v23;
    v7 = (os_log_t *)MEMORY[0x1E0CB52B0];
    *(_QWORD *)&v4 = 138543874;
    v20 = v4;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v8);
        objc_msgSend(*(id *)(a1 + 40), "attachmentManager", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "unconfirmedFilesDirectoryURL");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "UUIDString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v11, "URLByAppendingPathComponent:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = *(void **)(a1 + 48);
        v21 = 0;
        LOBYTE(v11) = objc_msgSend(v14, "removeItemAtURL:error:", v13, &v21);
        v15 = v21;
        if ((v11 & 1) == 0)
        {
          _HKInitializeLogging();
          v16 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
          {
            v17 = *(_QWORD *)(a1 + 56);
            v18 = v16;
            objc_msgSend(v13, "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v20;
            v27 = v17;
            v7 = (os_log_t *)MEMORY[0x1E0CB52B0];
            v28 = 2114;
            v29 = v19;
            v30 = 2114;
            v31 = v15;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to delete file from path %{public}@ with error %{public}@", buf, 0x20u);

          }
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    }
    while (v5);
  }

}

uint64_t __77__HDDeleteAttachmentReferenceOperation_performWithProfile_transaction_error___block_invoke_190(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDDeleteAttachmentReferenceOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  HDDeleteAttachmentReferenceOperation *v7;
  HDDeleteAttachmentReferenceOperation *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("delete_attachment_references"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cloud_status"));

  if (v6)
    v7 = -[HDDeleteAttachmentReferenceOperation initWithSynchronizedReferences:](self, "initWithSynchronizedReferences:", v5);
  else
    v7 = -[HDDeleteAttachmentReferenceOperation initWithReferences:](self, "initWithReferences:", v5);
  v8 = v7;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HDDeleteAttachmentReferenceOperation;
  v4 = a3;
  -[HDJournalEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_references, CFSTR("delete_attachment_references"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_cloudStatus, CFSTR("cloud_status"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_references, 0);
}

@end
