@implementation _HDSampleTypesDeletionEntry

- (_QWORD)initWithSourceIDs:(void *)a3 types:
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_HDSampleTypesDeletionEntry;
    a1 = objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      v7 = objc_msgSend(v5, "copy");
      v8 = (void *)a1[1];
      a1[1] = v7;

      v9 = objc_msgSend(v6, "copy");
      v10 = (void *)a1[2];
      a1[2] = v9;

    }
  }

  return a1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
  if (v7)
  {
    v8 = v7;
    v24 = *(_QWORD *)v27;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9);
        if (v10)
        {
          v11 = *(id *)(v10 + 8);
          v12 = *(void **)(v10 + 16);
        }
        else
        {
          v11 = 0;
          v12 = 0;
        }
        v13 = v12;
        objc_msgSend(v11, "hk_map:", &__block_literal_global_358);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dataManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        v16 = objc_msgSend(v15, "deleteSamplesWithTypes:sourceEntities:recursiveDeleteAuthorizationBlock:error:", v13, v14, 0, &v25);
        v17 = v25;

        if ((v16 & 1) == 0)
        {
          _HKInitializeLogging();
          v18 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412802;
            v31 = v11;
            v32 = 2112;
            v33 = v13;
            v34 = 2114;
            v35 = v17;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "Failed to delete samples for deleted source identifiers (%@) and types (%@): %{public}@.", buf, 0x20u);
          }
          if ((objc_msgSend(v17, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            goto LABEL_19;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@,%@"), objc_opt_class(), v11, v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "daemon");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "autoBugCaptureReporter");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "reportJournalFailureWithErrorDescription:provenance:error:", v19, 0, v17);

        }
        ++v9;
      }
      while (v8 != v9);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      v8 = v22;
    }
    while (v22);
  }
LABEL_19:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDSampleTypesDeletionEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _HDSampleTypesDeletionEntry *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v17[0] = objc_opt_class();
  v17[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v7, CFSTR("sids"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    }
    v8 = v10;

  }
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("types"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (_HDSampleTypesDeletionEntry *)-[_HDSampleTypesDeletionEntry initWithSourceIDs:types:](self, v8, v14);

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  NSSet *sourceIDs;
  id v5;

  sourceIDs = self->_sourceIDs;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", sourceIDs, CFSTR("sids"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_types, CFSTR("types"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_types, 0);
  objc_storeStrong((id *)&self->_sourceIDs, 0);
}

@end
