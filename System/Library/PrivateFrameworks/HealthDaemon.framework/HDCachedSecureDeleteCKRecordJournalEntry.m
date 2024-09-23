@implementation HDCachedSecureDeleteCKRecordJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id obj;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          HDPredicateForRecordID(objc_msgSend(v11, "recordID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "database");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v14 = +[HDHealthEntity deleteEntitiesWithPredicate:healthDatabase:error:](HDCachedSecureCKRecordEntity, "deleteEntitiesWithPredicate:healthDatabase:error:", v12, v13, &v30);
          v15 = v30;

          if (!v14)
          {
            _HKInitializeLogging();
            v16 = (void *)*MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              v26 = v16;
              v27 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v36 = v27;
              v37 = 2114;
              v38 = v15;
              v28 = v27;
              _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "Failed to apply %{public}@: %{public}@", buf, 0x16u);

            }
            if ((objc_msgSend(v15, "hk_isTransactionInterruptedError") & 1) != 0)
            {

              goto LABEL_19;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "daemon");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "autoBugCaptureReporter");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "reportJournalFailureWithErrorDescription:provenance:error:", v17, 0, v15);

          }
        }
        else
        {
          _HKInitializeLogging();
          v20 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v21 = v20;
            v22 = (void *)objc_opt_class();
            v23 = v22;
            v24 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v36 = v22;
            v37 = 2114;
            v38 = v24;
            v25 = v24;
            _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "Attempt to apply entry of class %{public}@ via class %{public}@", buf, 0x16u);

          }
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_19:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HDCachedSecureDeleteCKRecordJournalEntry)initWithCoder:(id)a3
{
  id v4;
  HDCachedSecureDeleteCKRecordJournalEntry *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HDCachedSecureDeleteCKRecordJournalEntry;
  v5 = -[HDJournalEntry initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_recordID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("journal_entry_record_id"));

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInt64:forKey:", self->_recordID, CFSTR("journal_entry_record_id"));
}

- (int64_t)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(int64_t)a3
{
  self->_recordID = a3;
}

@end
