@implementation _HDKeyValueJournalEntry

- (_HDKeyValueJournalEntry)initWithValue:(id)a3 key:(id)a4 domain:(id)a5 category:(int64_t)a6 provenance:(int64_t)a7 syncIdentity:(int64_t)a8 updatePolicy:(int64_t)a9 modificationDate:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  _HDKeyValueJournalEntry *v21;
  _HDKeyValueJournalEntry *v22;
  uint64_t v23;
  NSString *key;
  uint64_t v25;
  NSString *domain;
  objc_super v28;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a10;
  v28.receiver = self;
  v28.super_class = (Class)_HDKeyValueJournalEntry;
  v21 = -[_HDKeyValueJournalEntry init](&v28, sel_init);
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_value, a3);
    v23 = objc_msgSend(v18, "copy");
    key = v22->_key;
    v22->_key = (NSString *)v23;

    v25 = objc_msgSend(v19, "copy");
    domain = v22->_domain;
    v22->_domain = (NSString *)v25;

    v22->_category = a6;
    v22->_provenance = a7;
    v22->_syncIdentity = a8;
    v22->_updatePolicy = a9;
    objc_storeStrong((id *)&v22->_modificationDate, a10);
  }

  return v22;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  objc_class *v14;
  BOOL v15;
  void *v17;
  __CFString *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  objc_class *v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSObject *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  id v44;
  __CFString *v45;
  uint64_t v46;
  void *v47;
  id obj;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  id v63;
  void *v64;
  void *v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v5;
  v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
  v7 = 0;
  if (v50)
  {
    v49 = *(_QWORD *)v55;
    v47 = v6;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v55 != v49)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * v8);
        if (v9)
        {
          v10 = *(_QWORD *)(v9 + 32);
          v11 = *(id *)(v9 + 16);
          v12 = *(void **)(v9 + 8);
        }
        else
        {
          v11 = 0;
          v10 = 0;
          v12 = 0;
        }
        v13 = v12;
        v14 = +[HDKeyValueEntity _entityClassForKeyValueCategory:](HDKeyValueEntity, "_entityClassForKeyValueCategory:", v10);
        if (v14)
          v15 = v11 == 0;
        else
          v15 = 1;
        v51 = v13;
        v52 = v11;
        if (v15 || v13 == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v39 = v17;
            v40 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543362;
            v59 = v40;
            v41 = v40;
            _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "%{public}@: Invalid entity/key/value set", buf, 0xCu);

          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
          v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (!v7)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 3, v18);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v6, "daemon");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "autoBugCaptureReporter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v9)
            v21 = *(_QWORD *)(v9 + 40);
          else
            v21 = 0;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "reportJournalFailureWithErrorDescription:provenance:error:", v18, v22, v7);
          goto LABEL_41;
        }
        v23 = v14;
        if (!v9)
        {
          v18 = &stru_1E6D11BB8;
          v45 = &stru_1E6D11BB8;
          v25 = 0;
          goto LABEL_31;
        }
        v24 = *(__CFString **)(v9 + 24);
        if (!v24)
          v24 = &stru_1E6D11BB8;
        v18 = v24;
        v25 = *(_QWORD *)(v9 + 48);
        if (v25 == -2)
        {
          objc_msgSend(v6, "syncIdentityManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "currentSyncIdentity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_30;
        }
        if (v25 == -1)
        {
          objc_msgSend(v6, "syncIdentityManager");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "legacySyncIdentity");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
          v28 = v27;
          objc_msgSend(v27, "entity");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v29, "persistentID");

        }
LABEL_31:
        v64 = v52;
        v65 = v51;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v65, &v64, 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v31 = *(id *)(v9 + 56);
          v32 = *(_QWORD *)(v9 + 40);
          v33 = *(_QWORD *)(v9 + 64);
        }
        else
        {
          v32 = 0;
          v31 = 0;
          v33 = 0;
        }
        v6 = v47;
        v53 = v7;
        v34 = -[objc_class _insertKeysAndValues:modificationDate:domain:category:provenance:syncIdentity:updatePolicy:profile:error:](v23, "_insertKeysAndValues:modificationDate:domain:category:provenance:syncIdentity:updatePolicy:profile:error:", v30, v31, v18, v10, v32, v25, v33, v47, &v53);
        v35 = v53;

        if ((v34 & 1) != 0)
        {
          v7 = v35;
          goto LABEL_42;
        }
        _HKInitializeLogging();
        v36 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          v42 = v36;
          v43 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138543874;
          v59 = v43;
          v60 = 2048;
          v61 = v10;
          v62 = 2114;
          v63 = v35;
          v44 = v43;
          _os_log_error_impl(&dword_1B7802000, v42, OS_LOG_TYPE_ERROR, "%{public}@: Failed to apply value of category %ld, %{public}@", buf, 0x20u);

        }
        if ((objc_msgSend(v35, "hk_isTransactionInterruptedError") & 1) != 0)
        {

          v7 = v35;
          goto LABEL_52;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), objc_opt_class(), v10);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "daemon");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "autoBugCaptureReporter");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v37 = *(_QWORD *)(v9 + 40);
        else
          v37 = 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "reportJournalFailureWithErrorDescription:provenance:error:", v19, v38, v35);

        v7 = v35;
LABEL_41:

LABEL_42:
        ++v8;
      }
      while (v50 != v8);
      v46 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v66, 16);
      v50 = v46;
    }
    while (v46);
  }
LABEL_52:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDKeyValueJournalEntry)initWithCoder:(id)a3
{
  id v4;
  _HDKeyValueJournalEntry *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSSecureCoding *value;
  uint64_t v14;
  NSString *key;
  uint64_t v16;
  NSString *domain;
  uint64_t v18;
  NSDate *modificationDate;
  uint64_t v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_HDKeyValueJournalEntry;
  v5 = -[_HDKeyValueJournalEntry init](&v22, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("value"));
    v12 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSSecureCoding *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("key"));
    v14 = objc_claimAutoreleasedReturnValue();
    key = v5->_key;
    v5->_key = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("domain"));
    v16 = objc_claimAutoreleasedReturnValue();
    domain = v5->_domain;
    v5->_domain = (NSString *)v16;

    v5->_category = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("category"));
    v5->_provenance = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("provenance"));
    v5->_syncIdentity = -1;
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("sync_identity")))
      v5->_syncIdentity = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sync_identity"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mod_date"));
    v18 = objc_claimAutoreleasedReturnValue();
    modificationDate = v5->_modificationDate;
    v5->_modificationDate = (NSDate *)v18;

    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("updatePolicy")))
      v20 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("updatePolicy"));
    else
      v20 = 2;
    v5->_updatePolicy = v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSSecureCoding *value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_key, CFSTR("key"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_domain, CFSTR("domain"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_category, CFSTR("category"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_provenance, CFSTR("provenance"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_syncIdentity, CFSTR("sync_identity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("mod_date"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_updatePolicy, CFSTR("updatePolicy"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_key, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end
