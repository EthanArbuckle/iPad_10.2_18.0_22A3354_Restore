@implementation _HDLocationInsertionJournalEntry

- (_QWORD)initWithSeriesPersistentID:(void *)a3 locationData:
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
    v12.super_class = (Class)_HDLocationInsertionJournalEntry;
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

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - insert %lld location datums into %@"), v5, -[NSArray count](self->_data, "count"), self->_seriesIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(obj);
        v10 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v9);
        if (v10)
        {
          v11 = *(id *)(v10 + 16);
          v12 = *(void **)(v10 + 8);
        }
        else
        {
          v11 = 0;
          v12 = 0;
        }
        v13 = v12;
        v28 = 0;
        v14 = +[HDLocationSeriesSampleEntity insertLocationData:seriesIdentifier:profile:error:](HDLocationSeriesSampleEntity, "insertLocationData:seriesIdentifier:profile:error:", v11, v13, v6, &v28);
        v15 = v28;

        if (!v14)
        {
          _HKInitializeLogging();
          v16 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            if (v10)
              v24 = *(_QWORD *)(v10 + 8);
            else
              v24 = 0;
            *(_DWORD *)buf = 138412546;
            v34 = v24;
            v35 = 2114;
            v36 = v15;
            v25 = v16;
            _os_log_error_impl(&dword_1B7802000, v25, OS_LOG_TYPE_ERROR, "Failed to insert journaled location series data: %@ %{public}@", buf, 0x16u);

          }
          if ((objc_msgSend(v15, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            goto LABEL_25;
          }
          v17 = (void *)MEMORY[0x1E0CB3940];
          v18 = objc_opt_class();
          if (v10)
            v19 = *(void **)(v10 + 8);
          else
            v19 = 0;
          v20 = v19;
          objc_msgSend(v17, "stringWithFormat:", CFSTR("%@-%@"), v18, v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v6, "daemon");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "autoBugCaptureReporter");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "reportJournalFailureWithErrorDescription:provenance:error:", v21, 0, v15);

        }
        ++v9;
      }
      while (v7 != v9);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      v7 = v26;
    }
    while (v26);
  }
LABEL_25:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDLocationInsertionJournalEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _HDLocationInsertionJournalEntry *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99E60];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("data"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (_HDLocationInsertionJournalEntry *)-[_HDLocationInsertionJournalEntry initWithSeriesPersistentID:locationData:](self, v5, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_seriesIdentifier, CFSTR("sid"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_data, CFSTR("data"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_seriesIdentifier, 0);
}

@end
