@implementation HDInsertAttachmentOperation

- (HDInsertAttachmentOperation)initWithAttachmentReferences:(id)a3 attachment:(id)a4 fileOnDisk:(BOOL)a5
{
  id v8;
  id v9;
  HDInsertAttachmentOperation *v10;
  uint64_t v11;
  HDAttachment *attachment;
  uint64_t v13;
  NSArray *attachmentReferences;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HDInsertAttachmentOperation;
  v10 = -[HDInsertAttachmentOperation init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    attachment = v10->_attachment;
    v10->_attachment = (HDAttachment *)v11;

    v13 = objc_msgSend(v8, "copy");
    attachmentReferences = v10->_attachmentReferences;
    v10->_attachmentReferences = (NSArray *)v13;

    v10->_fileOnDisk = a5;
  }

  return v10;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  NSArray *attachmentReferences;
  HDAttachment *attachment;
  NSArray *v26;
  HDAttachment *v27;
  id v28;
  void *v29;
  id v30;
  NSArray *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  id v42;
  uint8_t v43;
  void *v44;
  char v45;
  id v46;
  void *v47;
  NSObject *v49;
  HDAttachment *v50;
  id v51;
  id v52;
  HDAttachment *v53;
  id v54;
  HDInsertAttachmentOperation *v56;
  id v57;
  _QWORD v58[5];
  id v59;
  id v60;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  uint8_t buf[4];
  HDInsertAttachmentOperation *v69;
  __int16 v70;
  uint64_t v71;
  __int16 v72;
  id v73;
  uint8_t v74[4];
  HDInsertAttachmentOperation *v75;
  __int16 v76;
  HDAttachment *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v7 = (objc_class *)MEMORY[0x1E0CB3620];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(v9, "attachmentManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unconfirmedFilesDirectoryURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAttachment identifier](self->_attachment, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UUIDString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "attachmentManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "filesDirectoryURL");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDAttachment identifier](self->_attachment, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "URLByAppendingPathComponent:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __68__HDInsertAttachmentOperation_performWithProfile_transaction_error___block_invoke;
  v58[3] = &unk_1E6CECCA8;
  v58[4] = self;
  v21 = v10;
  v59 = v21;
  v22 = v15;
  v60 = v22;
  v23 = v20;
  v61 = v23;
  objc_msgSend(v8, "onCommit:orRollback:", v58, 0);
  attachmentReferences = self->_attachmentReferences;
  v56 = self;
  attachment = self->_attachment;
  v26 = attachmentReferences;
  v27 = attachment;
  v28 = v8;
  v67 = 0;
  +[HDAttachmentEntity _insertIfDoesNotExistAttachment:transaction:error:](HDAttachmentEntity, "_insertIfDoesNotExistAttachment:transaction:error:", v27, v28, &v67);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v67;

  if (v29)
  {
    v53 = v27;
    v54 = v22;
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v31 = v26;
    v32 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v64;
      v51 = v23;
      v52 = v21;
      while (2)
      {
        v35 = 0;
        v36 = v30;
        do
        {
          if (*(_QWORD *)v64 != v34)
            objc_enumerationMutation(v31);
          v37 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v35);
          v62 = v36;
          +[HDAttachmentReferenceEntity _insertIfDoesNotExistReference:transaction:error:](HDAttachmentReferenceEntity, "_insertIfDoesNotExistReference:transaction:error:", v37, v28, &v62);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = v62;

          if (!v38)
          {
            _HKInitializeLogging();
            v39 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v69 = v56;
              v70 = 2114;
              v71 = v37;
              v72 = 2114;
              v73 = v30;
              _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to insert reference %{public}@. Reverting attachment storage. %{public}@", buf, 0x20u);
            }
            v40 = v30;
            v30 = v40;
            v23 = v51;
            v21 = v52;
            v22 = v54;
            if (v40)
            {
              if (a5)
                *a5 = objc_retainAutorelease(v40);
              else
                _HKLogDroppedError();
            }

            buf[0] = v30 == 0;
            goto LABEL_23;
          }
          ++v35;
          v36 = v30;
        }
        while (v33 != v35);
        v33 = -[NSArray countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
        v23 = v51;
        v21 = v52;
        if (v33)
          continue;
        break;
      }
    }

    buf[0] = 1;
    v22 = v54;
LABEL_23:
    v27 = v53;
  }
  else
  {
    _HKInitializeLogging();
    v41 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v74 = 138543874;
      v75 = v56;
      v76 = 2114;
      v77 = v27;
      v78 = 2114;
      v79 = v30;
      _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to insert attachment %{public}@, %{public}@", v74, 0x20u);
    }
    v42 = v30;
    v30 = v42;
    if (v42)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v42);
      else
        _HKLogDroppedError();
    }

    buf[0] = v30 == 0;
  }

  v43 = buf[0];
  if ((v43 & 1) == 0 && v56->_fileOnDisk)
  {
    objc_msgSend(v22, "path");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v45 = objc_msgSend(v21, "removeItemAtPath:error:", v44, &v57);
    v46 = v57;

    if ((v45 & 1) == 0)
    {
      _HKInitializeLogging();
      v47 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v49 = v47;
        objc_msgSend(v22, "path");
        v50 = (HDAttachment *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v74 = 138543874;
        v75 = v56;
        v76 = 2114;
        v77 = v50;
        v78 = 2114;
        v79 = v46;
        _os_log_error_impl(&dword_1B7802000, v49, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to remove file at %{public}@, %{public}@", v74, 0x20u);

      }
    }

  }
  return v43;
}

void __68__HDInsertAttachmentOperation_performWithProfile_transaction_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1[4] + 32))
  {
    v2 = (void *)a1[5];
    v3 = a1[6];
    v4 = a1[7];
    v13 = 0;
    v5 = objc_msgSend(v2, "moveItemAtURL:toURL:error:", v3, v4, &v13);
    v6 = v13;
    if ((v5 & 1) == 0)
    {
      _HKInitializeLogging();
      v7 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v8 = a1[4];
        v9 = (void *)a1[6];
        v10 = v7;
        objc_msgSend(v9, "path");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)a1[7], "path");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v15 = v8;
        v16 = 2114;
        v17 = v11;
        v18 = 2114;
        v19 = v12;
        v20 = 2114;
        v21 = v6;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to move file from %{public}@ -> %{public}@ directory, %{public}@", buf, 0x2Au);

      }
    }

  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertAttachmentOperation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HDInsertAttachmentOperation *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachment"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("attachment_references"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("file_on_disk"));
  v11 = -[HDInsertAttachmentOperation initWithAttachmentReferences:attachment:fileOnDisk:](self, "initWithAttachmentReferences:attachment:fileOnDisk:", v9, v5, v10);

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  HDAttachment *attachment;
  id v5;

  attachment = self->_attachment;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", attachment, CFSTR("attachment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachmentReferences, CFSTR("attachment_references"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_fileOnDisk, CFSTR("file_on_disk"));

}

- (id)transactionContext
{
  void *v3;
  void *v4;

  +[HDMutableDatabaseTransactionContext contextForWritingProtectedData](HDMutableDatabaseTransactionContext, "contextForWritingProtectedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contextWithAccessibilityAssertion:", self->_assertion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
  objc_storeStrong((id *)&self->_attachmentReferences, 0);
  objc_storeStrong((id *)&self->_attachment, 0);
}

@end
