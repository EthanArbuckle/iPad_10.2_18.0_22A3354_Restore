@implementation _HDDataBatchInsertionJournalEntry

- (id)initWithCodableObjectCollection:(void *)a3 provenance:
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

- (void)encodeWithCoder:(id)a3
{
  HDCodableObjectCollection *collection;
  void *v5;
  id v6;

  collection = self->_collection;
  v6 = a3;
  -[HDCodableObjectCollection data](collection, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("codableCollectionData"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_provenance, CFSTR("fullProvenance"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_provenance, 0);
  objc_storeStrong((id *)&self->_collection, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_HDDataBatchInsertionJournalEntry)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HDCodableObjectCollection *v6;
  void *v7;
  void *v8;
  _HDDataBatchInsertionJournalEntry *v9;
  __int128 v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("codableCollectionData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HDCodableObjectCollection initWithData:]([HDCodableObjectCollection alloc], "initWithData:", v5);
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("provenance")))
  {
    +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("provenance")), -1, CFSTR("UnknownDevice"), CFSTR("[8.2, 9.0)"), &v11, &stru_1E6D11BB8, &stru_1E6D11BB8, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_2_0, 0);
LABEL_6:
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!objc_msgSend(v4, "containsValueForKey:", CFSTR("fullProvenance")))
  {
    +[HDDataOriginProvenance dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:](HDDataOriginProvenance, "dataProvenanceWithSyncProvenance:syncIdentity:productType:systemBuild:operatingSystemVersion:sourceVersion:timeZoneName:sourceID:deviceID:contributorReference:", 0, -1, CFSTR("UnknownDevice"), CFSTR("[8.0, 8.2)"), &v11, &stru_1E6D11BB8, &stru_1E6D11BB8, 0, 0, 0, HDDataProvenanceOperatingSystemVersion8_0_0, 0);
    goto LABEL_6;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fullProvenance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v8 = v7;
  v9 = (_HDDataBatchInsertionJournalEntry *)-[_HDDataBatchInsertionJournalEntry initWithCodableObjectCollection:provenance:]((id *)&self->super.super.isa, v6, v7);

  return v9;
}

+ (void)applyEntries:(id)a3 withProfile:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  HDSourceEntity *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  id v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  HDSourceEntity *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  _BOOL8 v75;
  char v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  void *v87;
  id v88;
  id v89;
  id obj;
  id v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  id v105;
  uint8_t v106[128];
  uint8_t buf[4];
  uint64_t v108;
  __int16 v109;
  id v110;
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v94 = a4;
  objc_msgSend(v94, "deviceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0;
  objc_msgSend(v6, "deviceEntityForNoDeviceWithError:", &v105);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v105;

  v87 = (void *)v7;
  if (!v7 && objc_msgSend(v8, "hk_isTransactionInterruptedError"))
  {
    _HKInitializeLogging();
    v9 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "Aborting merge of _HDDataBatchInsertionJournalEntry due to interruption", buf, 2u);
    }
    goto LABEL_108;
  }
  v91 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v89 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v88 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v86 = v5;
  obj = v5;
  v93 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
  if (v93)
  {
    v92 = *(_QWORD *)v102;
    v10 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
LABEL_7:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v102 != v92)
        objc_enumerationMutation(obj);
      v12 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * v11);
      if (v12)
        v13 = *(void **)(v12 + 8);
      else
        v13 = 0;
      v14 = v13;
      objc_msgSend(v14, "sourceBundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v15)
      {
        objc_msgSend(v14, "source");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v15)
        {
          _HKInitializeLogging();
          v55 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "missing collection source identifier during journal application", buf, 2u);
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "daemon");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "autoBugCaptureReporter");
          v32 = (HDSourceEntity *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)MEMORY[0x1E0CB37E8];
          if (v12)
            v57 = *(void **)(v12 + 16);
          else
            v57 = 0;
          v46 = v57;
          objc_msgSend(v56, "numberWithLongLong:", objc_msgSend(v46, "syncProvenance"));
          v42 = (id)objc_claimAutoreleasedReturnValue();
          -[HDSourceEntity reportJournalFailureWithErrorDescription:provenance:error:](v32, "reportJournalFailureWithErrorDescription:provenance:error:", v15, v42, v8);
          goto LABEL_73;
        }
      }
      if (v12)
        v17 = *(void **)(v12 + v10[174]);
      else
        v17 = 0;
      objc_msgSend(v17, "sourceID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = v8;
        if (!v12)
          goto LABEL_38;
      }
      else
      {
        objc_msgSend(v94, "sourceManager");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v8;
        objc_msgSend(v35, "localSourceForBundleIdentifier:error:", v15, &v100);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v100;

        if (!v36)
        {
          _HKInitializeLogging();
          v58 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v108 = (uint64_t)v15;
            v109 = 2114;
            v110 = v19;
            _os_log_error_impl(&dword_1B7802000, v58, OS_LOG_TYPE_ERROR, "missing source for %{public}@: %{public}@", buf, 0x16u);
          }
          if ((objc_msgSend(v19, "hk_isTransactionInterruptedError") & 1) != 0)
          {

            v8 = v19;
LABEL_106:

            goto LABEL_107;
          }
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), objc_opt_class(), v15);
          goto LABEL_69;
        }
        if (v12)
          v37 = *(void **)(v12 + v10[174]);
        else
          v37 = 0;
        v38 = (void *)MEMORY[0x1E0CB37E8];
        v39 = v37;
        objc_msgSend(v38, "numberWithLongLong:", objc_msgSend(v36, "persistentID"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "setSourceID:", v40);

        if (!v12)
        {
LABEL_38:
          v20 = 0;
          goto LABEL_19;
        }
      }
      v20 = *(void **)(v12 + v10[174]);
LABEL_19:
      objc_msgSend(v20, "sourceID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v21)
      {
        _HKInitializeLogging();
        v41 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v108 = (uint64_t)v15;
          _os_log_error_impl(&dword_1B7802000, v41, OS_LOG_TYPE_ERROR, "Found a source for identifier %@, but it had no ID; skipping",
            buf,
            0xCu);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), objc_opt_class(), v15);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v94, "daemon");
        v32 = (HDSourceEntity *)objc_claimAutoreleasedReturnValue();
        -[HDSourceEntity autoBugCaptureReporter](v32, "autoBugCaptureReporter");
        v42 = (id)objc_claimAutoreleasedReturnValue();
        v43 = (void *)MEMORY[0x1E0CB37E8];
        if (v12)
          v44 = *(void **)(v12 + 16);
        else
          v44 = 0;
        v45 = v44;
        objc_msgSend(v43, "numberWithLongLong:", objc_msgSend(v45, "syncProvenance"));
        v46 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "reportJournalFailureWithErrorDescription:provenance:error:", v30, v46, v19);

        goto LABEL_72;
      }
      if (v12)
        v22 = *(void **)(v12 + v10[174]);
      else
        v22 = 0;
      objc_msgSend(v22, "deviceID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        if (v12)
          goto LABEL_24;
LABEL_48:
        v24 = 0;
        goto LABEL_25;
      }
      if (v87)
      {
        if (v12)
          v47 = *(void **)(v12 + v10[174]);
        else
          v47 = 0;
        v48 = (void *)MEMORY[0x1E0CB37E8];
        v49 = v47;
        objc_msgSend(v48, "numberWithLongLong:", objc_msgSend(v87, "persistentID"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "setDeviceID:", v50);

        if (!v12)
          goto LABEL_48;
LABEL_24:
        v24 = *(void **)(v12 + v10[174]);
LABEL_25:
        objc_msgSend(v24, "sourceVersion");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v25)
        {
          if (v12)
            v26 = *(void **)(v12 + v10[174]);
          else
            v26 = 0;
          objc_msgSend(v26, "setSourceVersion:", &stru_1E6D11BB8);
        }
        v27 = objc_alloc(MEMORY[0x1E0CB3940]);
        if (v12)
          v28 = *(void **)(v12 + v10[174]);
        else
          v28 = 0;
        v29 = v28;
        v30 = (void *)objc_msgSend(v27, "initWithFormat:", CFSTR("%@-%ld"), v15, objc_msgSend(v29, "hash"));

        objc_msgSend(v89, "objectForKeyedSubscript:", v15);
        v31 = objc_claimAutoreleasedReturnValue();
        if (v31)
        {
          v32 = (HDSourceEntity *)v31;
          objc_msgSend(v89, "objectForKeyedSubscript:", v30);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v33)
          {
            v34 = v89;
            goto LABEL_52;
          }
        }
        else
        {
          v51 = [HDSourceEntity alloc];
          if (v12)
            v52 = *(void **)(v12 + 16);
          else
            v52 = 0;
          objc_msgSend(v52, "sourceID");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[HDSQLiteEntity initWithPersistentID:](v51, "initWithPersistentID:", objc_msgSend(v53, "longLongValue"));

          objc_msgSend(v89, "setObject:forKeyedSubscript:", v32, v15);
          v34 = v89;
LABEL_52:
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v32, v30);
        }
        objc_msgSend(v91, "objectForKeyedSubscript:", v30);
        v42 = (id)objc_claimAutoreleasedReturnValue();
        if (!v42)
        {
          v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v91, "setObject:forKeyedSubscript:", v42, v30);
          if (v12)
            v54 = *(_QWORD *)(v12 + 16);
          else
            v54 = 0;
          objc_msgSend(v88, "setObject:forKeyedSubscript:", v54, v30);
        }
        objc_msgSend(v14, "decodedObjects");
        v46 = (id)objc_claimAutoreleasedReturnValue();
        if (v46)
          objc_msgSend(v42, "addObjectsFromArray:", v46);
        goto LABEL_72;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), objc_opt_class(), v85);
LABEL_69:
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "daemon");
      v32 = (HDSourceEntity *)objc_claimAutoreleasedReturnValue();
      -[HDSourceEntity autoBugCaptureReporter](v32, "autoBugCaptureReporter");
      v42 = (id)objc_claimAutoreleasedReturnValue();
      if (v12)
        v59 = *(void **)(v12 + 16);
      else
        v59 = 0;
      v60 = (void *)MEMORY[0x1E0CB37E8];
      v61 = v59;
      objc_msgSend(v60, "numberWithLongLong:", objc_msgSend(v61, "syncProvenance"));
      v46 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "reportJournalFailureWithErrorDescription:provenance:error:", v30, v46, v19);

LABEL_72:
      v8 = v19;
LABEL_73:

      ++v11;
      v10 = &OBJC_IVAR___HDDemoDataSleepSampleGenerator__nextSleepDurationSampleTime;
      if (v93 == v11)
      {
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v111, 16);
        v93 = v62;
        if (v62)
          goto LABEL_7;
        break;
      }
    }
  }

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  objc_msgSend(v91, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
  if (v63)
  {
    v64 = v63;
    v65 = *(_QWORD *)v97;
    do
    {
      v66 = 0;
      v67 = v8;
      do
      {
        if (*(_QWORD *)v97 != v65)
          objc_enumerationMutation(obj);
        v68 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v66);
        _HKInitializeLogging();
        v69 = (void *)*MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
        {
          v82 = v69;
          objc_msgSend(v91, "objectForKeyedSubscript:", v68);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = objc_msgSend(v83, "count");
          *(_DWORD *)buf = 134218242;
          v108 = v84;
          v109 = 2112;
          v110 = v68;
          _os_log_debug_impl(&dword_1B7802000, v82, OS_LOG_TYPE_DEBUG, "Inserting %ld objects for source: %@", buf, 0x16u);

        }
        objc_msgSend(v88, "objectForKeyedSubscript:", v68);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "syncIdentity") == -1)
        {
          objc_msgSend(v94, "syncIdentityManager");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v70, "legacySyncIdentity");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "entity");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setSyncIdentity:", objc_msgSend(v72, "persistentID"));

        }
        objc_msgSend(v94, "dataManager");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "objectForKeyedSubscript:", v68);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v75 = objc_msgSend(v14, "syncProvenance") == 0;
        v95 = v67;
        v76 = objc_msgSend(v73, "insertDataObjects:withProvenance:creationDate:skipInsertionFilter:updateSourceOrder:resolveAssociations:error:", v74, v14, 1, v75, 0, &v95, 2.22507386e-308);
        v8 = v95;

        if ((v76 & 1) == 0)
        {
          _HKInitializeLogging();
          v77 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v108 = (uint64_t)v68;
            v109 = 2114;
            v110 = v8;
            _os_log_error_impl(&dword_1B7802000, v77, OS_LOG_TYPE_ERROR, "Failed to apply for source: %@: %{public}@", buf, 0x16u);
          }
          if ((objc_msgSend(v8, "hk_isTransactionInterruptedError") & 1) != 0)
            goto LABEL_106;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v68);
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v94, "daemon");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "autoBugCaptureReporter");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v14, "syncProvenance"));
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v80, "reportJournalFailureWithErrorDescription:provenance:error:", v78, v81, v8);

        }
        ++v66;
        v67 = v8;
      }
      while (v64 != v66);
      v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
    }
    while (v64);
  }
LABEL_107:
  v5 = v86;

LABEL_108:
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
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ - %@"), v5, self->_collection);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
