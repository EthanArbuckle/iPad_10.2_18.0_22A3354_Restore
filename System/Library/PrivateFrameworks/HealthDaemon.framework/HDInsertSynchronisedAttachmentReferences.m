@implementation HDInsertSynchronisedAttachmentReferences

- (HDInsertSynchronisedAttachmentReferences)initWithAttachmentReferences:(id)a3
{
  id v4;
  HDInsertSynchronisedAttachmentReferences *v5;
  uint64_t v6;
  NSArray *attachmentReferences;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDInsertSynchronisedAttachmentReferences;
  v5 = -[HDInsertSynchronisedAttachmentReferences init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attachmentReferences = v5->_attachmentReferences;
    v5->_attachmentReferences = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)performWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  char v17;
  NSObject *v18;
  id v19;
  void *v20;
  NSObject *v21;
  id v22;
  HDInsertSynchronisedAttachmentReferences *v24;
  id *v25;
  NSArray *obj;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint8_t buf[4];
  HDInsertSynchronisedAttachmentReferences *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = self->_attachmentReferences;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
  if (!v8)
  {
    v17 = 1;
    goto LABEL_28;
  }
  v9 = (id *)v8;
  v24 = self;
  v25 = a5;
  v10 = *(_QWORD *)v30;
  while (2)
  {
    a5 = 0;
    do
    {
      if (*(_QWORD *)v30 != v10)
        objc_enumerationMutation(obj);
      v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)a5);
      v28 = 0;
      +[HDAttachmentReferenceEntity _insertIfDoesNotExistReference:transaction:error:](HDAttachmentReferenceEntity, "_insertIfDoesNotExistReference:transaction:error:", v11, v7, &v28);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v28;

      if (!v12)
      {
        _HKInitializeLogging();
        v18 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v35 = v24;
          v36 = 2114;
          v37 = v11;
          v38 = 2114;
          v39 = v13;
          _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to ingest reference %{public}@, %{public}@", buf, 0x20u);
        }
        v19 = v13;
        v13 = v19;
        if (v19)
        {
          if (v25)
          {
            v13 = objc_retainAutorelease(v19);
            LOBYTE(a5) = 0;
            *v25 = v13;
          }
          else
          {
            _HKLogDroppedError();
            LOBYTE(a5) = 0;
          }
          v20 = v13;
        }
        else
        {
          v20 = 0;
          LOBYTE(a5) = 1;
        }
        goto LABEL_27;
      }
      v33 = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0;
      v15 = +[HDAttachmentReferenceEntity setCloudStatus:references:transaction:error:](HDAttachmentReferenceEntity, "setCloudStatus:references:transaction:error:", 1, v14, v7, &v27);
      v16 = v27;

      if (!v15)
      {
        _HKInitializeLogging();
        v21 = *MEMORY[0x1E0CB5370];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543874;
          v35 = v24;
          v36 = 2114;
          v37 = v11;
          v38 = 2114;
          v39 = v16;
          _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "[attachments] %{public}@: Failed to update cloud status to synchronized for reference %{public}@, %{public}@", buf, 0x20u);
        }
        v22 = v16;
        v20 = v22;
        LOBYTE(a5) = v22 == 0;
        if (v22)
        {
          if (v25)
            *v25 = objc_retainAutorelease(v22);
          else
            _HKLogDroppedError();
        }

LABEL_27:
        v17 = 0;
        goto LABEL_28;
      }

      a5 = (id *)((char *)a5 + 1);
    }
    while (v9 != a5);
    v9 = (id *)-[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v40, 16);
    v17 = 1;
    if (v9)
      continue;
    break;
  }
LABEL_28:

  return (v17 | a5) & 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDInsertSynchronisedAttachmentReferences)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  HDInsertSynchronisedAttachmentReferences *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("attachment_references"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HDInsertSynchronisedAttachmentReferences initWithAttachmentReferences:](self, "initWithAttachmentReferences:", v8);
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_attachmentReferences, CFSTR("attachment_references"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentReferences, 0);
}

@end
