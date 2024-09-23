@implementation HDCachedSecureCKRecordJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
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
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = objc_msgSend(v12, "recordID");
          objc_msgSend(v12, "recordData");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = 0;
          v15 = +[HDCachedSecureCKRecordEntity insertOrUpdateWithRecordID:recordData:profile:error:](HDCachedSecureCKRecordEntity, "insertOrUpdateWithRecordID:recordData:profile:error:", v13, v14, v6, &v30);
          v16 = v30;

          if (!v15)
          {
            _HKInitializeLogging();
            v17 = (void *)*MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              v27 = v17;
              v28 = (void *)objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v36 = v28;
              v37 = 2114;
              v38 = v16;
              v29 = v28;
              _os_log_error_impl(&dword_1B7802000, v27, OS_LOG_TYPE_ERROR, "Failed to apply %{public}@: %{public}@", buf, 0x16u);

            }
            if ((objc_msgSend(v16, "hk_isTransactionInterruptedError") & 1) != 0)
            {

              goto LABEL_19;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "daemon");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "autoBugCaptureReporter");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "reportJournalFailureWithErrorDescription:provenance:error:", v18, 0, v16);

          }
        }
        else
        {
          _HKInitializeLogging();
          v21 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v22 = v21;
            v23 = (void *)objc_opt_class();
            v24 = v23;
            v25 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v36 = v23;
            v37 = 2114;
            v38 = v25;
            v26 = v25;
            _os_log_error_impl(&dword_1B7802000, v22, OS_LOG_TYPE_ERROR, "Attempt to apply entry of class %{public}@ via class %{public}@", buf, 0x16u);

          }
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
      if (v9)
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

- (HDCachedSecureCKRecordJournalEntry)initWithCoder:(id)a3
{
  id v4;
  HDCachedSecureCKRecordJournalEntry *v5;
  uint64_t v6;
  NSData *recordData;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDCachedSecureCKRecordJournalEntry;
  v5 = -[HDJournalEntry initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    v5->_recordID = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("journal_entry_record_id"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("journal_entry_record_data"));
    v6 = objc_claimAutoreleasedReturnValue();
    recordData = v5->_recordData;
    v5->_recordData = (NSData *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t recordID;
  id v5;

  recordID = self->_recordID;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", recordID, CFSTR("journal_entry_record_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordData, CFSTR("journal_entry_record_data"));

}

- (int64_t)recordID
{
  return self->_recordID;
}

- (void)setRecordID:(int64_t)a3
{
  self->_recordID = a3;
}

- (NSData)recordData
{
  return self->_recordData;
}

- (void)setRecordData:(id)a3
{
  objc_storeStrong((id *)&self->_recordData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordData, 0);
}

@end
