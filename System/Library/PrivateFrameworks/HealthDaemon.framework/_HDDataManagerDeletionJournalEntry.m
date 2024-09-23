@implementation _HDDataManagerDeletionJournalEntry

+ (BOOL)supportsSecureCoding
{
  return 1;
}

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
  void *v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v6, "dataManager");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "UUIDCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v15 = objc_msgSend(v12, "deleteObjectsWithUUIDCollection:configuration:error:", v13, v14, &v25);
        v16 = v25;

        if ((v15 & 1) == 0)
        {
          _HKInitializeLogging();
          v17 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v21 = v17;
            v22 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543618;
            v31 = v22;
            v32 = 2114;
            v33 = v16;
            v23 = v22;
            _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "Failed to apply %{public}@: %{public}@", buf, 0x16u);

          }
          if ((objc_msgSend(v16, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            goto LABEL_15;
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
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_15:

}

- (_HDDataManagerDeletionJournalEntry)initWithConfiguration:(id)a3 objectUUIDs:(id)a4
{
  id v6;
  id v7;
  _HDDataManagerDeletionJournalEntry *v8;
  uint64_t v9;
  HDDataDeletionConfiguration *configuration;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_HDDataManagerDeletionJournalEntry;
  v8 = -[_HDDataManagerDeletionJournalEntry init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (HDDataDeletionConfiguration *)v9;

    objc_storeStrong((id *)&v8->_UUIDCollection, a4);
  }

  return v8;
}

- (_HDDataManagerDeletionJournalEntry)initWithCoder:(id)a3
{
  id v4;
  _HDDataManagerDeletionJournalEntry *v5;
  uint64_t v6;
  HDDataDeletionConfiguration *configuration;
  void *v8;
  uint64_t v9;
  HKUUIDCollection *UUIDCollection;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  HKUUIDCollection *v15;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_HDDataManagerDeletionJournalEntry;
  v5 = -[HDJournalEntry initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("configuration"));
    v6 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (HDDataDeletionConfiguration *)v6;

    v8 = (void *)MEMORY[0x1BCCACAC4]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuids_data"));
    v9 = objc_claimAutoreleasedReturnValue();
    UUIDCollection = v5->_UUIDCollection;
    v5->_UUIDCollection = (HKUUIDCollection *)v9;

    if (!v5->_UUIDCollection)
    {
      v11 = (void *)MEMORY[0x1E0C99E60];
      v18[0] = objc_opt_class();
      v18[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithArray:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("object_uuids"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v5->_UUIDCollection;
      v5->_UUIDCollection = (HKUUIDCollection *)v14;

    }
    objc_autoreleasePoolPop(v8);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HDDataManagerDeletionJournalEntry;
  -[HDJournalEntry encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  v5 = (void *)MEMORY[0x1BCCACAC4](objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("configuration")));
  -[HKUUIDCollection hk_dataForAllUUIDs](self->_UUIDCollection, "hk_dataForAllUUIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("uuids_data"));

  objc_autoreleasePoolPop(v5);
}

- (HKUUIDCollection)UUIDCollection
{
  return self->_UUIDCollection;
}

- (HDDataDeletionConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_UUIDCollection, 0);
}

@end
