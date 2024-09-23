@implementation _HDDataDeletionJournalEntry

- (_BYTE)initWithDataObject:(char)a3 restrictSource:
{
  id v6;
  uint64_t v7;

  v6 = a2;
  if (a1)
  {
    v7 = objc_msgSend(a1, "init");
    a1 = (_BYTE *)v7;
    if (v7)
    {
      objc_storeStrong((id *)(v7 + 16), a2);
      a1[8] = a3;
    }
  }

  return a1;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  id obj;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  id v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v41 = a4;
  v44 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v43 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v6;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v52;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v10)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v11);
      if (v12 && *(_BYTE *)(v12 + 8))
      {
        v4 = *(id *)(v12 + 16);
        objc_msgSend(v4, "_sourceBundleIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v43, "objectForKeyedSubscript:", v13);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v15 = (void *)v14;
        }
        else
        {
          objc_msgSend(v41, "sourceManager");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = v9;
          objc_msgSend(v16, "localSourceForBundleIdentifier:copyIfNecessary:error:", v13, 1, &v50);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = v50;

          if (!v15)
          {
            _HKInitializeLogging();
            v20 = *MEMORY[0x1E0CB52B0];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543618;
              v57 = (uint64_t)v13;
              v58 = 2114;
              v59 = v4;
              _os_log_error_impl(&dword_1B7802000, v20, OS_LOG_TYPE_ERROR, "Missing source for %{public}@, skipping: %{public}@", buf, 0x16u);
            }
            if ((objc_msgSend(v4, "hk_isTransactionInterruptedError") & 1) != 0)
            {
              v40 = obj;
              v9 = v4;
LABEL_29:

              goto LABEL_50;
            }
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), objc_opt_class(), v13);
            v17 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "daemon");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "autoBugCaptureReporter");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "reportJournalFailureWithErrorDescription:provenance:error:", v17, 0, v4);

            v9 = v4;
            goto LABEL_19;
          }
          objc_msgSend(v43, "setObject:forKeyedSubscript:", v15, v13);
          v9 = v4;
        }

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = v13;
      objc_msgSend(v44, "objectForKeyedSubscript:", v17);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (!v18)
      {
        v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v44, "setObject:forKeyedSubscript:", v18, v17);
      }
      if (v12)
        v19 = *(_QWORD *)(v12 + 16);
      else
        v19 = 0;
      objc_msgSend(v18, "addObject:", v19);
      v13 = v17;
LABEL_19:

      if (v8 == ++v11)
      {
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
        v8 = v22;
        if (v22)
          goto LABEL_3;
        goto LABEL_31;
      }
    }
  }
  v9 = 0;
LABEL_31:

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend(v44, "allKeys");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v47;
    do
    {
      v26 = 0;
      v27 = v9;
      do
      {
        if (*(_QWORD *)v47 != v25)
          objc_enumerationMutation(v40);
        v28 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * v26);
        _HKInitializeLogging();
        v29 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
        {
          v37 = v29;
          objc_msgSend(v44, "objectForKeyedSubscript:", v28);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "count");
          *(_DWORD *)buf = 134218242;
          v57 = v39;
          v58 = 2112;
          v59 = v28;
          _os_log_debug_impl(&dword_1B7802000, v37, OS_LOG_TYPE_DEBUG, "Deleting %ld objects for source: %@", buf, 0x16u);

        }
        objc_msgSend(v43, "objectForKeyedSubscript:", v28);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "dataManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "objectForKeyedSubscript:", v28);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v13);
          v4 = (id)objc_claimAutoreleasedReturnValue();
          v32 = v4;
        }
        else
        {
          v32 = 0;
        }
        v45 = v27;
        objc_msgSend(v30, "deleteDataObjects:restrictedSourceEntities:failIfNotFound:recursiveDeleteAuthorizationBlock:error:", v31, v32, 0, 0, &v45);
        v9 = v45;

        if (v13)
        if (v9)
        {
          _HKInitializeLogging();
          v33 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v57 = (uint64_t)v28;
            v58 = 2114;
            v59 = v9;
            _os_log_error_impl(&dword_1B7802000, v33, OS_LOG_TYPE_ERROR, "Failed to apply for source: %@: %{public}@", buf, 0x16u);
          }
          if ((objc_msgSend(v9, "hk_isTransactionInterruptedError") & 1) != 0)
            goto LABEL_29;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v28);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "daemon");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "autoBugCaptureReporter");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "reportJournalFailureWithErrorDescription:provenance:error:", v34, 0, v9);

        }
        ++v26;
        v27 = v9;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v46, v55, 16);
    }
    while (v24);
  }
LABEL_50:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDDataDeletionJournalEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _HDDataDeletionJournalEntry *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("restrictSource"));

  v7 = (_HDDataDeletionJournalEntry *)-[_HDDataDeletionJournalEntry initWithDataObject:restrictSource:](self, v5, v6);
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  HKObject *dataObject;
  id v5;

  dataObject = self->_dataObject;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dataObject, CFSTR("dataObject"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_restrictSource, CFSTR("restrictSource"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataObject, 0);
}

@end
