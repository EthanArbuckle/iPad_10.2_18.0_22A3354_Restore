@implementation HDObjectAuthorizationJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  id v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v41;
    while (2)
    {
      v11 = 0;
      v38 = v9;
      do
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v6, "syncIdentityManager");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "legacySyncIdentity");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "entity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "persistentID");

          if (objc_msgSend(v12, "syncIdentity") != -1)
            v16 = objc_msgSend(v12, "syncIdentity");
          objc_msgSend(v12, "records");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v12, "syncProvenance");
          v39 = 0;
          v19 = +[HDObjectAuthorizationEntity setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:](HDObjectAuthorizationEntity, "setObjectAuthorizationRecords:syncProvenance:syncIdentity:profile:error:", v17, v18, v16, v6, &v39);
          v20 = v39;

          if (!v19)
          {
            _HKInitializeLogging();
            v21 = (void *)*MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              v35 = v21;
              v36 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v45 = v36;
              v46 = 2114;
              v47 = v20;
              v37 = v36;
              _os_log_error_impl(&dword_1B7802000, v35, OS_LOG_TYPE_ERROR, "Failed to apply %{public}@: %{public}@", buf, 0x16u);

            }
            if ((objc_msgSend(v20, "hk_isTransactionInterruptedError") & 1) != 0)
            {

              goto LABEL_21;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "daemon");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "autoBugCaptureReporter");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v6;
            v26 = v10;
            v27 = v7;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v12, "syncProvenance"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "reportJournalFailureWithErrorDescription:provenance:error:", v22, v28, v20);

            v7 = v27;
            v10 = v26;
            v6 = v25;

          }
          v9 = v38;
        }
        else
        {
          _HKInitializeLogging();
          v29 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v30 = v29;
            v31 = (void *)objc_opt_class();
            v32 = v31;
            v33 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v45 = v31;
            v46 = 2114;
            v47 = v33;
            v34 = v33;
            _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "Attempt to apply entry of class %{public}@ via class %{public}@", buf, 0x16u);

          }
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_21:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDObjectAuthorizationJournalEntry)initWithCoder:(id)a3
{
  id v4;
  HDObjectAuthorizationJournalEntry *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSArray *records;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HDObjectAuthorizationJournalEntry;
  v5 = -[HDJournalEntry initWithCoder:](&v14, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "containsValueForKey:", CFSTR("records"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    if (v6)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("records"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "hk_map:", &__block_literal_global_172);
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("expectedRecords"));
    }
    v11 = objc_claimAutoreleasedReturnValue();
    records = v5->_records;
    v5->_records = (NSArray *)v11;

    v5->_syncProvenance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sp"));
    v5->_syncIdentity = -1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("syncIdentity")))
      v5->_syncIdentity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("syncIdentity"));
  }

  return v5;
}

id __51__HDObjectAuthorizationJournalEntry_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (objc_class *)MEMORY[0x1E0CB6970];
  v3 = a2;
  v4 = objc_alloc_init(v2);
  objc_msgSend(v3, "objectUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObjectUUID:", v5);

  objc_msgSend(v3, "sourceUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSourceUUID:", v6);

  objc_msgSend(v4, "setStatus:", objc_msgSend(v3, "status"));
  objc_msgSend(v3, "modificationDate");
  objc_msgSend(v4, "setModificationDate:");
  objc_msgSend(v3, "sessionUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setSessionUUID:", v7);
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *records;
  id v5;

  records = self->_records;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", records, CFSTR("expectedRecords"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncProvenance, CFSTR("sp"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncIdentity, CFSTR("syncIdentity"));

}

- (NSArray)records
{
  return self->_records;
}

- (void)setRecords:(id)a3
{
  objc_storeStrong((id *)&self->_records, a3);
}

- (double)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(double)a3
{
  self->_modificationDate = a3;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (void)setSyncProvenance:(int64_t)a3
{
  self->_syncProvenance = a3;
}

- (int64_t)syncIdentity
{
  return self->_syncIdentity;
}

- (void)setSyncIdentity:(int64_t)a3
{
  self->_syncIdentity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_records, 0);
}

@end
