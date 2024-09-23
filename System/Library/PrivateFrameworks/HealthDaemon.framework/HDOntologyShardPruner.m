@implementation HDOntologyShardPruner

- (HDOntologyShardPruner)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDOntologyShardPruner)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4;
  HDOntologyShardPruner *v5;
  HDOntologyShardPruner *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyShardPruner;
  v5 = -[HDOntologyShardPruner init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);

  return v6;
}

- (BOOL)pruneOntologyWithOptions:(unint64_t)a3 error:(id *)a4
{
  NSObject *v6;
  void *v7;
  double Current;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id WeakRetained;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  HDOntologyShardPruner *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  char v55;
  id v56;
  NSObject *v57;
  id v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  id v62;
  __CFString *v63;
  id v64;
  void *v65;
  uint64_t v66;
  id v67;
  id v68;
  id v69;
  char v70;
  id v71;
  NSObject *v72;
  void *v73;
  id v74;
  NSObject *v75;
  const __CFString *v76;
  id v77;
  __CFString *v78;
  id v79;
  void *v80;
  id *location;
  char v84;
  id v85;
  unint64_t v86;
  void *v87;
  HDOntologyShardPruner *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  id v93;
  id v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  id v99;
  id v100;
  _BYTE buf[22];
  __int16 v102;
  id v103;
  __int16 v104;
  __CFString *v105;
  _BYTE v106[24];
  void *v107;
  _BYTE v108[20];
  __int16 v109;
  id v110;
  __int16 v111;
  __CFString *v112;
  _BYTE v113[24];
  void *v114;
  id v115;
  _BYTE v116[12];
  __int16 v117;
  uint64_t v118;
  __int16 v119;
  id v120;
  uint64_t v121;

  v121 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogHealthOntology();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HKStringFromHKOntologyPruneOptions();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v7;
    _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Garbage collect and prune ontology with options %{pubic}@", buf, 0x16u);

  }
  Current = CFAbsoluteTimeGetCurrent();
  v94 = 0;
  if (self)
  {
    v9 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("desired_state"), &unk_1E6DF8960, Current);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v10;
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:notEqualToValue:", CFSTR("available_state"), &unk_1E6DFA808);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf[8] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateMatchingAllPredicates:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
    objc_msgSend(WeakRetained, "shardRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "entriesWithPredicate:orderingTerms:error:", v13, 0, &v94);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v86 = a3;
      v17 = objc_loadWeakRetained((id *)&self->_updateCoordinator);
      objc_msgSend(v17, "shardRegistry");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "deleteStagedFilesNotMatchingEntries:error:", v16, &v94);

      if (v19)
      {
        v20 = (void *)MEMORY[0x1E0D29840];
        objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:notEqualToValue:", CFSTR("desired_state"), &unk_1E6DFA808);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v21;
        objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:notEqualToValue:", CFSTR("current_version"), &unk_1E6DFA820);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf[8] = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "predicateMatchingAllPredicates:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = objc_loadWeakRetained((id *)&self->_updateCoordinator);
        objc_msgSend(v25, "shardRegistry");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "entriesWithPredicate:orderingTerms:error:", v24, 0, &v94);
        v27 = objc_claimAutoreleasedReturnValue();

        v90 = (void *)v27;
        if (v27)
        {
          location = (id *)&self->_updateCoordinator;
          v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[HDOntologyShardPruner _importerClassesBySchemaType](self);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v95 = 0u;
          v96 = 0u;
          v97 = 0u;
          v98 = 0u;
          v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v95, buf, 16);
          v30 = MEMORY[0x1E0C809B0];
          v91 = v29;
          if (v29)
          {
            v31 = v86;
            v32 = v86 & 1;
            v84 = 1;
            v89 = *(_QWORD *)v96;
            v87 = v28;
            v88 = self;
            do
            {
              v33 = 0;
              do
              {
                if (*(_QWORD *)v96 != v89)
                  objc_enumerationMutation(v28);
                v34 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v33);
                v35 = (void *)objc_msgSend(v28, "objectForKeyedSubscript:", v34);
                v36 = v34;
                *(_QWORD *)v106 = v30;
                *(_QWORD *)&v106[8] = 3221225472;
                *(_QWORD *)&v106[16] = __56__HDOntologyShardPruner__entriesWithSchemaType_entries___block_invoke;
                v107 = &unk_1E6CE9D08;
                v37 = v36;
                *(_QWORD *)v108 = v37;
                objc_msgSend(v90, "hk_filter:", v106);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v38, "count") | v32)
                {
                  v92 = v38;
                  v39 = v38;
                  v93 = v37;
                  CFAbsoluteTimeGetCurrent();
                  _HKInitializeLogging();
                  HKLogHealthOntology();
                  v40 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                  {
                    HKStringFromHKOntologyPruneOptions();
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v106 = 138544130;
                    *(_QWORD *)&v106[4] = self;
                    *(_WORD *)&v106[12] = 2114;
                    *(_QWORD *)&v106[14] = v93;
                    *(_WORD *)&v106[22] = 2114;
                    v107 = v35;
                    *(_WORD *)v108 = 2114;
                    *(_QWORD *)&v108[2] = v41;
                    _os_log_impl(&dword_1B7802000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: Request to prune content for schema type %{public}@ with %{public}@ %{public}@", v106, 0x2Au);

                  }
                  v99 = 0;
                  v42 = v39;
                  -[HDOntologyShardPruner updateCoordinator](self, "updateCoordinator");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v43, "shardRegistry");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v35, "willPruneEntries:options:shardRegistry:error:", v42, v31, v44, &v99);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = v45;
                  if (v45)
                  {
                    if (objc_msgSend(v45, "count") | v32)
                    {
                      v47 = self;
                      objc_msgSend(MEMORY[0x1E0C99D68], "date");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      v49 = MEMORY[0x1E0C809B0];
                      *(_QWORD *)v113 = MEMORY[0x1E0C809B0];
                      *(_QWORD *)&v113[8] = 3221225472;
                      *(_QWORD *)&v113[16] = __78__HDOntologyShardPruner__pruneEntries_options_schemaType_importerClass_error___block_invoke;
                      v114 = &unk_1E6CE9CA0;
                      v50 = v48;
                      v115 = v50;
                      objc_msgSend(v46, "hk_map:", v113);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();

                      if (objc_msgSend(v44, "insertEntries:error:", v51, &v99))
                      {
                        v52 = v42;
                        v53 = objc_loadWeakRetained(location);
                        v100 = 0;
                        *(_QWORD *)v106 = v49;
                        *(_QWORD *)&v106[8] = 3221225472;
                        *(_QWORD *)&v106[16] = __64__HDOntologyShardPruner__persistPruneRequestMetadataForEntries___block_invoke;
                        v107 = &unk_1E6CE9D30;
                        v54 = v52;
                        *(_QWORD *)v108 = v54;
                        *(_QWORD *)&v108[8] = v47;
                        v55 = objc_msgSend(v53, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, 0, &v100, v106);
                        v56 = v100;

                        if ((v55 & 1) == 0)
                        {
                          _HKInitializeLogging();
                          HKLogHealthOntology();
                          v57 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
                          {
                            v66 = objc_msgSend(v54, "count");
                            *(_DWORD *)v116 = 138543874;
                            *(_QWORD *)&v116[4] = v88;
                            v117 = 2048;
                            v118 = v66;
                            v119 = 2114;
                            v120 = v56;
                            _os_log_error_impl(&dword_1B7802000, v57, OS_LOG_TYPE_ERROR, "%{public}@: error persisting prune request metadata for %ld entries: %{public}@", v116, 0x20u);
                          }

                        }
                        v31 = v86;
                        objc_msgSend(v35, "pruneEntries:options:shardRegistry:error:", v51, v86, v44, &v99);
                        v46 = (void *)objc_claimAutoreleasedReturnValue();
                        self = v88;
                      }
                      else
                      {
                        v46 = 0;
                        self = v47;
                      }

                      v32 = v86 & 1;
                    }
                    else
                    {
                      v51 = v46;
                      v46 = (void *)MEMORY[0x1E0C9AA60];
                    }

                  }
                  v58 = v99;
                  _HKInitializeLogging();
                  HKLogHealthOntology();
                  v59 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
                  {
                    v60 = objc_msgSend(v46, "count");
                    v61 = objc_msgSend(v42, "count");
                    CFAbsoluteTimeGetCurrent();
                    HKDiagnosticStringFromDuration();
                    v62 = (id)objc_claimAutoreleasedReturnValue();
                    v63 = &stru_1E6D11BB8;
                    if (!v46)
                      v63 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(": %@"), v58);
                    *(_DWORD *)v106 = 138544898;
                    *(_QWORD *)&v106[4] = v88;
                    *(_WORD *)&v106[12] = 2114;
                    *(_QWORD *)&v106[14] = v35;
                    *(_WORD *)&v106[22] = 2048;
                    v107 = (void *)v60;
                    *(_WORD *)v108 = 2048;
                    *(_QWORD *)&v108[2] = v61;
                    *(_WORD *)&v108[10] = 2114;
                    *(_QWORD *)&v108[12] = v93;
                    v109 = 2114;
                    v110 = v62;
                    v111 = 2112;
                    v112 = v63;
                    _os_log_impl(&dword_1B7802000, v59, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ pruned %ld out of %ld eligable %{public}@ shards in %{public}@%@", v106, 0x48u);
                    if (!v46)

                    self = v88;
                    v31 = v86;
                    v32 = v86 & 1;
                  }

                  v64 = v58;
                  v65 = v64;
                  if (v64)
                    v94 = objc_retainAutorelease(v64);

                  v28 = v87;
                  v30 = MEMORY[0x1E0C809B0];
                  v38 = v92;
                  if (v46)
                    objc_msgSend(v85, "addObjectsFromArray:", v46);
                  else
                    v84 = 0;

                }
                ++v33;
              }
              while (v91 != v33);
              v91 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v95, buf, 16);
            }
            while (v91);
          }
          else
          {
            v84 = 1;
          }
          v67 = v85;
          v68 = objc_loadWeakRetained(location);
          *(_QWORD *)v116 = 0;
          *(_QWORD *)v106 = v30;
          *(_QWORD *)&v106[8] = 3221225472;
          *(_QWORD *)&v106[16] = __44__HDOntologyShardPruner__markPrunedEntries___block_invoke;
          v107 = &unk_1E6CE9D30;
          *(_QWORD *)v108 = self;
          v69 = v67;
          *(_QWORD *)&v108[8] = v69;
          v70 = objc_msgSend(v68, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, 0, v116, v106);
          v71 = *(id *)v116;

          LOBYTE(v19) = v84;
          if ((v70 & 1) == 0)
          {
            _HKInitializeLogging();
            HKLogHealthOntology();
            v72 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)v113 = 138543618;
              *(_QWORD *)&v113[4] = self;
              *(_WORD *)&v113[12] = 2114;
              *(_QWORD *)&v113[14] = v71;
              _os_log_error_impl(&dword_1B7802000, v72, OS_LOG_TYPE_ERROR, "%{public}@: Unable to mark pruned entries in the shard registry: %{public}@", v113, 0x16u);
            }

          }
        }
        else
        {
          LOBYTE(v19) = 0;
        }

      }
    }
    else
    {

      LOBYTE(v19) = 0;
    }
    v73 = v94;
  }
  else
  {
    v73 = 0;
    LOBYTE(v19) = 0;
  }
  v74 = v73;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v75 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
  {
    if ((v19 & 1) != 0)
      v76 = CFSTR("SUCCESS");
    else
      v76 = CFSTR("FAILURE");
    CFAbsoluteTimeGetCurrent();
    HKDiagnosticStringFromDuration();
    v77 = (id)objc_claimAutoreleasedReturnValue();
    if ((v19 & 1) != 0)
      v78 = &stru_1E6D11BB8;
    else
      v78 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(": %@"), v74);
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v76;
    v102 = 2114;
    v103 = v77;
    v104 = 2114;
    v105 = v78;
    _os_log_impl(&dword_1B7802000, v75, OS_LOG_TYPE_DEFAULT, "%{public}@: Garbage collect and prune ontology %{public}@ in %{public}@%{public}@", buf, 0x2Au);
    if ((v19 & 1) == 0)

  }
  v79 = v74;
  v80 = v79;
  if (v79)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v79);
    else
      _HKLogDroppedError();
  }

  return v19 & 1;
}

- (int64_t)purgeableSpaceForUrgency:(int)a3 volume:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int64_t v23;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  HDOntologyShardPruner *v30;
  id *location;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  HDOntologyShardPruner *v38;
  __int16 v39;
  _BYTE v40[14];
  __int16 v41;
  uint64_t v42;
  uint8_t v43[4];
  HDOntologyShardPruner *v44;
  __int16 v45;
  int64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 != 4)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 138543618;
      v44 = self;
      v45 = 1024;
      LODWORD(v46) = a3;
      v20 = "%{public}@: Non-maximum urgency request for purgable space for urgency %d";
      v21 = v19;
      v22 = 18;
LABEL_20:
      _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, v20, v43, v22);
    }
LABEL_21:
    v23 = 0;
    goto LABEL_22;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("/private/var/mobile")) & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 138543618;
      v44 = self;
      v45 = 2114;
      v46 = (int64_t)v7;
      v20 = "%{public}@: No purgable space for requested volume %{public}@";
      v21 = v19;
      v22 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (self)
  {
    v29 = v7;
    -[HDOntologyShardPruner _importerClassesBySchemaType](self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    -[HDOntologyShardPruner _orderedSchemaTypes](self);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    v30 = self;
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v34;
      location = (id *)&self->_updateCoordinator;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v34 != v12)
            objc_enumerationMutation(obj);
          v14 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            WeakRetained = objc_loadWeakRetained(location);
            objc_msgSend(WeakRetained, "shardRegistry");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v14, "purgeableSpaceForUrgency:shardRegistry:", 4, v16);

            _HKInitializeLogging();
            HKLogHealthOntology();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138544130;
              v38 = v30;
              v39 = 2114;
              *(_QWORD *)v40 = v14;
              *(_WORD *)&v40[8] = 1024;
              *(_DWORD *)&v40[10] = 4;
              v41 = 2048;
              v42 = v17;
              _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ urgency %d purgable space %llu", buf, 0x26u);
            }

            v11 += v17;
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    self = v30;
    v25 = objc_loadWeakRetained((id *)&v30->_updateCoordinator);
    objc_msgSend(v25, "shardRegistry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "purgeableSpaceForStagedShards");

    _HKInitializeLogging();
    HKLogHealthOntology();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v38 = v30;
      v39 = 1024;
      *(_DWORD *)v40 = 4;
      *(_WORD *)&v40[4] = 2048;
      *(_QWORD *)&v40[6] = v27;
      _os_log_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@: staged files urgency %d purgable space %llu", buf, 0x1Cu);
    }

    v23 = v27 + v11;
    v7 = v29;
  }
  else
  {
    v23 = 0;
  }
  _HKInitializeLogging();
  HKLogHealthOntology();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v43 = 138543618;
    v44 = self;
    v45 = 2048;
    v46 = v23;
    _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Maximum urgency request for purgable space: %llu bytes", v43, 0x16u);
  }
LABEL_22:

  return v23;
}

- (int64_t)purgeSpaceForUrgency:(int)a3 volume:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  uint32_t v22;
  int64_t v23;
  id v25;
  void *v26;
  void *v27;
  HDOntologyShardPruner *v28;
  id *location;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  HDOntologyShardPruner *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  uint64_t v42;
  uint8_t v43[4];
  HDOntologyShardPruner *v44;
  __int16 v45;
  int64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 != 4)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 138543618;
      v44 = self;
      v45 = 1024;
      LODWORD(v46) = a3;
      v20 = "%{public}@: Non-maximum urgency request request to purge space for urgency %d";
      v21 = v19;
      v22 = 18;
LABEL_20:
      _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, v20, v43, v22);
    }
LABEL_21:
    v23 = 0;
    goto LABEL_22;
  }
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("/private/var/mobile")) & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v43 = 138543618;
      v44 = self;
      v45 = 2114;
      v46 = (int64_t)v7;
      v20 = "%{public}@: Nothing to purge for requested volume %{public}@";
      v21 = v19;
      v22 = 22;
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if (self)
  {
    v27 = v7;
    -[HDOntologyShardPruner _importerClassesBySchemaType](self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    -[HDOntologyShardPruner _orderedSchemaTypes](self);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    v28 = self;
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v32;
      location = (id *)&self->_updateCoordinator;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(obj);
          v14 = (void *)objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            WeakRetained = objc_loadWeakRetained(location);
            objc_msgSend(WeakRetained, "shardRegistry");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v14, "purgeSpaceForUrgency:shardRegistry:", 4, v16);

            _HKInitializeLogging();
            HKLogHealthOntology();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138544130;
              v36 = v28;
              v37 = 2114;
              v38 = v14;
              v39 = 1024;
              v40 = 4;
              v41 = 2048;
              v42 = v17;
              _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ urgency %d request to purge space %llu", buf, 0x26u);
            }

            v11 += v17;
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    self = v28;
    v25 = objc_loadWeakRetained((id *)&v28->_updateCoordinator);
    objc_msgSend(v25, "shardRegistry");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v26, "purgeSpaceForStagedShards") + v11;

    v7 = v27;
  }
  else
  {
    v23 = 0;
  }
  _HKInitializeLogging();
  HKLogHealthOntology();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v43 = 138543618;
    v44 = self;
    v45 = 2048;
    v46 = v23;
    _os_log_impl(&dword_1B7802000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Maximum urgency request to purge space: %llu bytes", v43, 0x16u);
  }
LABEL_22:

  return v23;
}

- (id)_importerClassesBySchemaType
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "updateCoordinator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "importer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importerClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_orderedSchemaTypes
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "updateCoordinator");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "importer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "importerClasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __78__HDOntologyShardPruner__pruneEntries_options_schemaType_importerClass_error___block_invoke(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "copyWithCurrentVersionUndeterminedForDate:", *(_QWORD *)(a1 + 32));
}

uint64_t __44__HDOntologyShardPruner__orderedSchemaTypes__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  int v6;
  unsigned int v7;

  v4 = *MEMORY[0x1E0CB5750];
  v5 = a3;
  v6 = objc_msgSend(a2, "isEqualToString:", v4);
  v7 = objc_msgSend(v5, "isEqualToString:", v4);

  if (v6 ^ 1 | v7)
    return (v6 ^ 1) & v7;
  else
    return -1;
}

uint64_t __56__HDOntologyShardPruner__entriesWithSchemaType_entries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "schemaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v4 == v5)
  {
    v7 = 1;
  }
  else if (v5)
  {
    objc_msgSend(v3, "schemaType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __44__HDOntologyShardPruner__markPrunedEntries___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  void *v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  id v23;
  uint64_t v24;
  id obj;
  id *location;
  uint64_t v27;
  void *v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE buf[12];
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v29 = a2;
  v24 = v3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v23 = v4;
    obj = v4;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
    if (v5)
    {
      v6 = v5;
      location = (id *)(v3 + 8);
      v27 = *(_QWORD *)v32;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v32 != v27)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v7);
          v30 = 0;
          v9 = v8;
          v10 = v28;
          v11 = v29;
          WeakRetained = objc_loadWeakRetained(location);
          objc_msgSend(WeakRetained, "shardRegistry");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "schemaType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v9, "schemaVersion");
          *(_QWORD *)buf = 0;
          v17 = objc_msgSend(v13, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v14, v15, v16, buf, v11, &v30);

          if (v17)
          {
            v18 = (void *)objc_msgSend(v9, "copyWithAvailableStateNotImportedForDate:", v10);
            v19 = +[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v18, v11, &v30);

          }
          else
          {
            v19 = 0;
          }

          v20 = v30;
          if (!v19)
          {
            _HKInitializeLogging();
            HKLogHealthOntology();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = v24;
              v36 = 2114;
              v37 = v9;
              v38 = 2114;
              v39 = v20;
              _os_log_error_impl(&dword_1B7802000, v21, OS_LOG_TYPE_ERROR, "%{public}@: Unable to mark pruned entry \"%{public}@\" in the shard registry: %{public}@", buf, 0x20u);
            }

          }
          ++v7;
        }
        while (v6 != v7);
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      }
      while (v6);
    }

    v4 = v23;
  }

  return 1;
}

uint64_t __64__HDOntologyShardPruner__persistPruneRequestMetadataForEntries___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v21;
  id obj;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKDiagnosticStringFromDate();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v21 = a1;
  obj = *(id *)(a1 + 32);
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v24 + 1) + 8 * v9);
        objc_opt_self();
        v11 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "schemaType");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v10, "schemaVersion");

        v15 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("pruneRequest-%@:%@:%ld"), v12, v13, v14);
        objc_msgSend(v3, "graphDatabase");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 0;
        LOBYTE(v11) = objc_msgSend(v16, "setMetadataValue:forKey:error:", v5, v15, &v23);
        v17 = v23;

        if ((v11 & 1) == 0)
        {
          _HKInitializeLogging();
          HKLogHealthOntology();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            v19 = *(_QWORD *)(v21 + 40);
            *(_DWORD *)buf = 138543874;
            v29 = v19;
            v30 = 2114;
            v31 = v15;
            v32 = 2114;
            v33 = v17;
            _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@: Unable to set metdata value for key \"%{public}@\": %{public}@", buf, 0x20u);
          }

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v7);
  }

  return 1;
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  return (HDOntologyUpdateCoordinator *)objc_loadWeakRetained((id *)&self->_updateCoordinator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
}

@end
