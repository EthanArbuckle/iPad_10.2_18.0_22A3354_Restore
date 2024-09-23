@implementation _HDDeletedSampleInsertionJournalEntry

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  BOOL v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id obj;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    v26 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v10);
        if (v11)
        {
          v12 = *(id *)(v11 + 16);
          v13 = *(void **)(v11 + 24);
        }
        else
        {
          v12 = 0;
          v13 = 0;
        }
        v28 = 0;
        v14 = v13;
        v15 = +[HDDeletedSampleEntity insertCodableDeletedSamples:provenance:profile:error:](HDDeletedSampleEntity, "insertCodableDeletedSamples:provenance:profile:error:", v12, v14, v6, &v28);
        v16 = v28;

        if (!v15)
        {
          _HKInitializeLogging();
          v17 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v34 = v16;
            _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "Failed to insert codable deleted samples: %{public}@", buf, 0xCu);
          }
          if ((objc_msgSend(v16, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            goto LABEL_22;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "daemon");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "autoBugCaptureReporter");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            v21 = *(void **)(v11 + 24);
          else
            v21 = 0;
          v22 = (void *)MEMORY[0x1E0CB37E8];
          v23 = v21;
          objc_msgSend(v22, "numberWithLongLong:", objc_msgSend(v23, "syncProvenance"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "reportJournalFailureWithErrorDescription:provenance:error:", v18, v24, v16);

          v9 = v26;
        }

        ++v10;
      }
      while (v8 != v10);
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
      v8 = v25;
    }
    while (v25);
  }
LABEL_22:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HDCodableObjectCollection *v7;

  v4 = a3;
  v7 = objc_alloc_init(HDCodableObjectCollection);
  v5 = (void *)-[NSArray mutableCopy](self->_samples, "mutableCopy");
  -[HDCodableObjectCollection setDeletedSamples:](v7, "setDeletedSamples:", v5);

  -[HDCodableObjectCollection data](v7, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("codable_objects"));

  objc_msgSend(v4, "encodeObject:forKey:", self->_provenance, CFSTR("provenance"));
}

- (_HDDeletedSampleInsertionJournalEntry)initWithCoder:(id)a3
{
  id v4;
  _HDDeletedSampleInsertionJournalEntry *v5;
  void *v6;
  HDCodableObjectCollection *v7;
  uint64_t v8;
  void *samples;
  void *v10;
  uint64_t v11;
  NSArray *v12;
  uint64_t v13;
  HDDataOriginProvenance *provenance;
  objc_super v16;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_HDDeletedSampleInsertionJournalEntry;
  v5 = -[HDJournalEntry initWithCoder:](&v16, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codable_objects"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = -[HDCodableObjectCollection initWithData:]([HDCodableObjectCollection alloc], "initWithData:", v6);
      -[HDCodableObjectCollection deletedSamples](v7, "deletedSamples");
      v8 = objc_claimAutoreleasedReturnValue();
      samples = v5->_samples;
      v5->_samples = (NSArray *)v8;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C99E60];
      v17[0] = objc_opt_class();
      v17[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
      v7 = (HDCodableObjectCollection *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setWithArray:", v7);
      samples = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", samples, CFSTR("deleted_samples"));
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v5->_samples;
      v5->_samples = (NSArray *)v11;

    }
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provenance"));
    v13 = objc_claimAutoreleasedReturnValue();
    provenance = v5->_provenance;
    v5->_provenance = (HDDataOriginProvenance *)v13;

  }
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_objectCollection, 0);
}

@end
