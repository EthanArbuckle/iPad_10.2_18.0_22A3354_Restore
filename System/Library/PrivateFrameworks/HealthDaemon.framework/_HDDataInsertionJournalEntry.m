@implementation _HDDataInsertionJournalEntry

- (id)initWithDataObject:(void *)a3 provenance:
{
  id v6;
  id v7;
  uint64_t v8;

  v6 = a2;
  v7 = a3;
  if (a1)
  {
    v8 = objc_msgSend(a1, "init");
    a1 = (id *)v8;
    if (v8)
    {
      objc_storeStrong((id *)(v8 + 8), a2);
      objc_storeStrong(a1 + 2, a3);
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v5, self->_dataObject);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  HDSourceEntity *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  NSObject *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  HDSourceEntity *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  char v57;
  NSObject *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  NSObject *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  void *v70;
  id v71;
  id obj;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  uint8_t v88[128];
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  id v92;
  _BYTE v93[128];
  uint64_t v94;

  v94 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v76 = a4;
  objc_msgSend(v76, "deviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0;
  objc_msgSend(v6, "deviceEntityForNoDeviceWithError:", &v87);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v87;

  v71 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v69 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
  v73 = v8;
  if (v9)
  {
    v10 = v9;
    v74 = *(id *)v84;
    do
    {
      v11 = 0;
      do
      {
        if (*(id *)v84 != v74)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * v11);
        if (v12)
        {
          v13 = *(id *)(v12 + 16);
          v14 = *(void **)(v12 + 8);
        }
        else
        {
          v13 = 0;
          v14 = 0;
        }
        v15 = v14;
        objc_msgSend(v15, "_sourceBundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "sourceID");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v18 = v7;
          goto LABEL_12;
        }
        objc_msgSend(v76, "sourceManager");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = v7;
        objc_msgSend(v19, "localSourceForBundleIdentifier:error:", v16, &v82);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v82;

        if (v20)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v20, "persistentID"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setSourceID:", v21);

LABEL_12:
          objc_msgSend(v13, "deviceID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v22)
          {
            if (!v70)
            {
              _HKInitializeLogging();
              v34 = *MEMORY[0x1E0CB52B0];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
              {
                *(_WORD *)buf = 0;
                _os_log_error_impl(&dword_1B7802000, v34, OS_LOG_TYPE_ERROR, "missing no device entity!", buf, 2u);
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class(), v68);
              goto LABEL_29;
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v70, "persistentID"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setDeviceID:", v23);

          }
          objc_msgSend(v13, "sourceVersion");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v24)
            objc_msgSend(v13, "setSourceVersion:", &stru_1E6D11BB8);
          objc_msgSend(v13, "sourceID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            if (!v16)
              goto LABEL_40;
            v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%ld"), v16, objc_msgSend(v13, "hash"));
            objc_msgSend(v8, "objectForKeyedSubscript:", v16);
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = (HDSourceEntity *)v27;
              objc_msgSend(v8, "objectForKeyedSubscript:", v26);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v29)
LABEL_33:
                objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, v26);
              objc_msgSend(v71, "objectForKeyedSubscript:", v26);
              v35 = (id)objc_claimAutoreleasedReturnValue();
              if (!v35)
              {
                v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                objc_msgSend(v71, "setObject:forKeyedSubscript:", v35, v26);
                objc_msgSend(v69, "setObject:forKeyedSubscript:", v13, v26);
              }
              if (v12)
                v42 = *(_QWORD *)(v12 + 8);
              else
                v42 = 0;
              objc_msgSend(v35, "addObject:", v42);
              goto LABEL_39;
            }
            v40 = [HDSourceEntity alloc];
            objc_msgSend(v13, "sourceID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = -[HDSQLiteEntity initWithPersistentID:](v40, "initWithPersistentID:", objc_msgSend(v41, "longLongValue"));

            objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, v16);
            goto LABEL_33;
          }
          _HKInitializeLogging();
          v30 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v90 = (uint64_t)v16;
            v91 = 2114;
            v92 = v18;
            v31 = v30;
            v32 = "Missing source for %{public}@: %{public}@.";
LABEL_43:
            _os_log_error_impl(&dword_1B7802000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x16u);
            goto LABEL_25;
          }
          goto LABEL_25;
        }
        _HKInitializeLogging();
        v33 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v90 = (uint64_t)v16;
          v91 = 2114;
          v92 = v18;
          v31 = v33;
          v32 = "missing source for %{public}@: %{public}@";
          goto LABEL_43;
        }
LABEL_25:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), objc_opt_class(), v16);
LABEL_29:
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "daemon");
        v28 = (HDSourceEntity *)objc_claimAutoreleasedReturnValue();
        -[HDSourceEntity autoBugCaptureReporter](v28, "autoBugCaptureReporter");
        v35 = (id)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x1E0CB37E8];
        if (v12)
          v37 = *(void **)(v12 + 16);
        else
          v37 = 0;
        v38 = v37;
        objc_msgSend(v36, "numberWithLongLong:", objc_msgSend(v38, "syncProvenance"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "reportJournalFailureWithErrorDescription:provenance:error:", v26, v39, v18);

        v8 = v73;
LABEL_39:

LABEL_40:
        v7 = v18;

        ++v11;
      }
      while (v10 != v11);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
      v10 = v43;
    }
    while (v43);
  }

  v80 = 0u;
  v81 = 0u;
  v78 = 0u;
  v79 = 0u;
  objc_msgSend(v71, "allKeys");
  v75 = (id)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
  if (v44)
  {
    v45 = v44;
    v46 = *(_QWORD *)v79;
    while (2)
    {
      v47 = 0;
      v48 = v7;
      do
      {
        if (*(_QWORD *)v79 != v46)
          objc_enumerationMutation(v75);
        v49 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v47);
        _HKInitializeLogging();
        v50 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
        {
          v65 = v50;
          objc_msgSend(v71, "objectForKeyedSubscript:", v49);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v67 = objc_msgSend(v66, "count");
          *(_DWORD *)buf = 134218242;
          v90 = v67;
          v91 = 2112;
          v92 = v49;
          _os_log_debug_impl(&dword_1B7802000, v65, OS_LOG_TYPE_DEBUG, "Inserting %ld objects for source: %@", buf, 0x16u);

        }
        objc_msgSend(v69, "objectForKeyedSubscript:", v49);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v51, "syncIdentity") == -1)
        {
          objc_msgSend(v76, "syncIdentityManager");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "legacySyncIdentity");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "entity");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "setSyncIdentity:", objc_msgSend(v54, "persistentID"));

        }
        objc_msgSend(v76, "dataManager");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectForKeyedSubscript:", v49);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = v48;
        v57 = objc_msgSend(v55, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", v56, v51, 1, 1, 0, &v77, 2.22507386e-308);
        v7 = v77;

        if ((v57 & 1) == 0)
        {
          _HKInitializeLogging();
          v58 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v90 = (uint64_t)v49;
            v91 = 2114;
            v92 = v7;
            _os_log_error_impl(&dword_1B7802000, v58, OS_LOG_TYPE_ERROR, "Failed to apply for source: %@: %{public}@", buf, 0x16u);
          }
          if ((objc_msgSend(v7, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            v8 = v73;
            goto LABEL_66;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v49);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v76, "daemon");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "autoBugCaptureReporter");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v69, "objectForKeyedSubscript:", v49);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "numberWithLongLong:", objc_msgSend(v63, "syncProvenance"));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "reportJournalFailureWithErrorDescription:provenance:error:", v59, v64, v7);

        }
        ++v47;
        v48 = v7;
        v8 = v73;
      }
      while (v45 != v47);
      v45 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v78, v88, 16);
      if (v45)
        continue;
      break;
    }
  }
LABEL_66:

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDDataInsertionJournalEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _HDDataInsertionJournalEntry *v8;
  __int128 v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dataObject"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("source")))
  {
    if (objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("source")) == 16)
      +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 1, -1, CFSTR("UnknownDevice"), CFSTR("[8.0, 8.2)"), &v10, &stru_1E6D11BB8, &stru_1E6D11BB8, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_0_0, 0);
    else
      +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, -1, CFSTR("UnknownDevice"), CFSTR("[8.0, 8.2)"), &v10, &stru_1E6D11BB8, &stru_1E6D11BB8, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_0_0, 0);
  }
  else
  {
    if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("provenance")))
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullProvenance"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("provenance")), -1, CFSTR("UnknownDevice"), CFSTR("[8.2, 9.0)"), &v10, &stru_1E6D11BB8, &stru_1E6D11BB8, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_2_0, 0);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v7 = v6;
  v8 = (_HDDataInsertionJournalEntry *)-[_HDDataInsertionJournalEntry initWithDataObject:provenance:]((id *)&self->super.super.isa, v5, v6);

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  HKObject *dataObject;
  id v5;

  dataObject = self->_dataObject;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", dataObject, CFSTR("dataObject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_provenance, CFSTR("fullProvenance"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_dataObject, 0);
}

@end
