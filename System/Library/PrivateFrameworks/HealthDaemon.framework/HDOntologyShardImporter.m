@implementation HDOntologyShardImporter

- (HDOntologyShardImporter)init
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

- (HDOntologyShardImporter)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4;
  HDOntologyShardImporter *v5;
  HDOntologyShardImporter *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  HDOntologyShardImporterObserver *ontologyShardImporterObservers;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDOntologyShardImporter;
  v5 = -[HDOntologyShardImporter init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    NSStringFromProtocol((Protocol *)&unk_1EF1D3A90);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogHealthOntology();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "initWithName:loggingCategory:", v8, v9);
    ontologyShardImporterObservers = v6->_ontologyShardImporterObservers;
    v6->_ontologyShardImporterObservers = (HDOntologyShardImporterObserver *)v10;

  }
  return v6;
}

- (id)_registeredImporterClasses
{
  os_unfair_lock_s *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  os_unfair_lock_s *v27;
  uint64_t v28;
  uint64_t v29;
  id obj;
  uint64_t v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[16];
  _QWORD v42[18];

  v42[16] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = (os_unfair_lock_s *)(a1 + 8);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 8));
  v3 = *(void **)(a1 + 16);
  if (!v3)
  {
    v27 = v2;
    os_unfair_lock_assert_owner(v2);
    v4 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_opt_self();
    v41[0] = *MEMORY[0x1E0CB5740];
    v42[0] = objc_opt_class();
    v41[1] = *MEMORY[0x1E0CB5750];
    v42[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

    v29 = a1;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "daemon");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pluginManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pluginsConformingToProtocol:", &unk_1EF2527B8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allValues");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v11;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    if (v31)
    {
      v12 = *(_QWORD *)v38;
      v28 = *(_QWORD *)v38;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v38 != v12)
            objc_enumerationMutation(obj);
          v32 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          objc_msgSend(v32, "ontologySchemaImporterClasses");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = 0u;
          v34 = 0u;
          v35 = 0u;
          v36 = 0u;
          objc_msgSend(v14, "allKeys");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v34;
            do
            {
              for (j = 0; j != v17; ++j)
              {
                if (*(_QWORD *)v34 != v18)
                  objc_enumerationMutation(v15);
                v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j);
                v21 = objc_msgSend(v14, "objectForKeyedSubscript:", v20);
                if (objc_msgSend(v6, "objectForKeyedSubscript:", v20))
                {
                  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__lock_loadImporterClasses, v29, CFSTR("HDOntologyShardImporter.m"), 294, CFSTR("%@ is attemping to register as importer for %@, but %@ already is registered."), v32, v20, objc_msgSend(v6, "objectForKeyedSubscript:", v20));

                  v12 = v28;
                }
                objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, v20);
              }
              v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v17);
          }

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      }
      while (v31);
    }

    v23 = objc_msgSend(v6, "copy");
    v24 = *(void **)(v29 + 16);
    *(_QWORD *)(v29 + 16) = v23;

    v3 = *(void **)(v29 + 16);
    v2 = v27;
  }
  v25 = v3;
  os_unfair_lock_unlock(v2);
  return v25;
}

- (BOOL)importStagedShardFilesWithError:(id *)a3
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  HDOntologyShardImporter *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  void *v29;
  int v30;
  id v31;
  NSObject *v32;
  const __CFString *v33;
  id v34;
  __CFString *v35;
  id v36;
  void *v37;
  __CFString *v38;
  id v39;
  __CFString *v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  uint32_t v45;
  BOOL v46;
  id v47;
  void *v48;
  void *v49;
  NSObject *v50;
  id v51;
  void *v52;
  char v53;
  __CFString *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  id v58;
  id v59;
  HDOntologyShardImporterObserver *ontologyShardImporterObservers;
  id v61;
  id v62;
  void *v63;
  __CFString *v64;
  NSObject *v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  uint64_t v69;
  BOOL v70;
  id *v71;
  id *v72;
  id v73;
  void *v74;
  void *v75;
  id v78;
  HDOntologyShardImporter *obj;
  id *location;
  uint64_t v81;
  uint64_t v82;
  id v84;
  _QWORD v85[16];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE buf[24];
  const __CFString *v91;
  _BYTE v92[30];
  id v93;
  id *v94;
  uint64_t v95;
  uint64_t (*v96)(uint64_t, uint64_t);
  void (*v97)(uint64_t);
  id v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  location = (id *)&self->_updateCoordinator;
  WeakRetained = objc_loadWeakRetained((id *)&self->_updateCoordinator);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "behavior");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "features");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "shardedOntology");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 111, CFSTR("Sharded ontology import is disabled"));
    return 0;
  }
  v8 = self;
  if (!self)
  {
LABEL_62:
    v70 = 0;
    goto LABEL_66;
  }
  v9 = (void *)MEMORY[0x1E0D29840];
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("desired_state"), &unk_1E6DFE7C8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v85[0] = v10;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("available_state"), &unk_1E6DFE7E0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateMatchingAllPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("current_version"), objc_opt_class(), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v86 = v14;
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("desired_state_date"), objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v86 + 1) = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v86, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_loadWeakRetained(location);
  objc_msgSend(v17, "shardRegistry");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "entriesWithPredicate:orderingTerms:error:", v13, v16, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    v8 = 0;
    goto LABEL_62;
  }
  v20 = v19;
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  obj = (HDOntologyShardImporter *)v20;
  v82 = -[HDOntologyShardImporter countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
  if (!v82)
    goto LABEL_55;
  v81 = *(_QWORD *)v87;
  do
  {
    v21 = 0;
    do
    {
      if (*(_QWORD *)v87 != v81)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v21);
      v84 = 0;
      v23 = v22;
      -[HDOntologyShardImporter _registeredImporterClasses]((uint64_t)self);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[__CFString schemaType](v23, "schemaType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)objc_msgSend(v24, "objectForKeyedSubscript:", v25);

      if (!v26)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v23;
          v43 = v42;
          v44 = "%{public}@: No ontology importer class is registered yet to import %{public}@";
          v45 = 22;
          goto LABEL_31;
        }
LABEL_32:

        v46 = 1;
        goto LABEL_33;
      }
      if ((objc_msgSend(v26, "canImportEntry:", v23) & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = self;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v26;
          *(_WORD *)&buf[22] = 2114;
          v91 = v23;
          v43 = v42;
          v44 = "%{public}@: %{public}@ cannot attempt to import entry %{public}@";
          v45 = 32;
LABEL_31:
          _os_log_impl(&dword_1B7802000, v43, OS_LOG_TYPE_DEFAULT, v44, buf, v45);
        }
        goto LABEL_32;
      }
      CFAbsoluteTimeGetCurrent();
      _HKInitializeLogging();
      HKLogHealthOntology();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 2114;
        v91 = v23;
        _os_log_impl(&dword_1B7802000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ will import shard entry %{public}@", buf, 0x20u);
      }

      v28 = objc_loadWeakRetained(location);
      objc_msgSend(v28, "shardRegistry");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 0;
      v30 = objc_msgSend(v26, "importOntologyShardEntry:shardRegistry:error:", v23, v29, &v93);
      v31 = v93;

      _HKInitializeLogging();
      HKLogHealthOntology();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        if (v30)
          v33 = CFSTR("Success");
        else
          v33 = CFSTR("Error");
        CFAbsoluteTimeGetCurrent();
        HKDiagnosticStringFromDuration();
        v34 = (id)objc_claimAutoreleasedReturnValue();
        v35 = &stru_1E6D11BB8;
        if ((v30 & 1) == 0)
          v35 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(": %@"), v31);
        *(_DWORD *)buf = 138544642;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v26;
        *(_WORD *)&buf[22] = 2114;
        v91 = v33;
        *(_WORD *)v92 = 2114;
        *(_QWORD *)&v92[2] = v23;
        *(_WORD *)&v92[10] = 2114;
        *(_QWORD *)&v92[12] = v34;
        *(_WORD *)&v92[20] = 2112;
        *(_QWORD *)&v92[22] = v35;
        _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ %{public}@ importing %{public}@ in %{public}@%@", buf, 0x3Eu);
        if ((v30 & 1) == 0)

      }
      v36 = v31;
      v37 = v36;
      if (v36)
        v84 = objc_retainAutorelease(v36);

      if (v30)
      {
        v38 = v23;
        v93 = 0;
        v94 = &v93;
        v95 = 0x3032000000;
        v96 = __Block_byref_object_copy__190;
        v97 = __Block_byref_object_dispose__190;
        v98 = 0;
        v39 = objc_loadWeakRetained(location);
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __52__HDOntologyShardImporter__markImportedEntry_error___block_invoke;
        v91 = (const __CFString *)&unk_1E6D0E520;
        *(_QWORD *)&v92[16] = &v93;
        *(_QWORD *)v92 = self;
        v40 = v38;
        *(_QWORD *)&v92[8] = v40;
        LODWORD(v38) = objc_msgSend(v39, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, 0, &v84, buf);

        if ((_DWORD)v38)
          v41 = v94[5];
        else
          v41 = 0;
        v58 = v41;

        _Block_object_dispose(&v93, 8);
        v46 = v58 != 0;
        if (v58)
        {
          v59 = v58;
          ontologyShardImporterObservers = self->_ontologyShardImporterObservers;
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __60__HDOntologyShardImporter__notifyImportObserversAboutEntry___block_invoke;
          v91 = (const __CFString *)&unk_1E6D0E548;
          *(_QWORD *)v92 = self;
          v61 = v59;
          *(_QWORD *)&v92[8] = v61;
          -[HDOntologyShardImporterObserver notifyObservers:](ontologyShardImporterObservers, "notifyObservers:", buf);

          v62 = objc_loadWeakRetained(location);
          objc_msgSend(v62, "shardRegistry");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = 0;
          LOBYTE(ontologyShardImporterObservers) = objc_msgSend(v63, "deleteStagedShardFileForEntry:error:", v61, &v93);
          v64 = (__CFString *)v93;

          if ((ontologyShardImporterObservers & 1) == 0)
          {
            _HKInitializeLogging();
            HKLogHealthOntology();
            v65 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v61;
              *(_WORD *)&buf[22] = 2114;
              v91 = v64;
              _os_log_impl(&dword_1B7802000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to delete shard file for entry %{public}@: %{public}@", buf, 0x20u);
            }

          }
        }

      }
      else
      {
        v46 = 0;
      }
LABEL_33:

      v47 = v84;
      v48 = v47;
      if (!v46)
      {
        if (objc_msgSend(v47, "hk_isCocoaNoSuchFileError"))
        {
          v49 = (void *)-[__CFString copyWithAvailableState:](v23, "copyWithAvailableState:", 1);
          _HKInitializeLogging();
          HKLogHealthOntology();
          v50 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = self;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v49;
            _os_log_impl(&dword_1B7802000, v50, OS_LOG_TYPE_DEFAULT, "%{public}@: Entry previously marked 'staged' wasn't found on device and has been re-marked as 'on remote', %{public}@", buf, 0x16u);
          }

          v51 = objc_loadWeakRetained(location);
          objc_msgSend(v51, "shardRegistry");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = 0;
          v53 = objc_msgSend(v52, "insertEntry:error:", v49, &v93);
          v54 = (__CFString *)v93;

          if ((v53 & 1) == 0)
          {
            _HKInitializeLogging();
            HKLogHealthOntology();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543874;
              *(_QWORD *)&buf[4] = self;
              *(_WORD *)&buf[12] = 2114;
              *(_QWORD *)&buf[14] = v49;
              *(_WORD *)&buf[22] = 2114;
              v91 = v54;
              _os_log_impl(&dword_1B7802000, v55, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to persist entry %{public}@: %{public}@", buf, 0x20u);
            }

          }
        }
        v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error importing %@"), v23);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:underlyingError:", 100, v56, v48);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "addObject:", v57);

      }
      ++v21;
    }
    while (v82 != v21);
    v66 = -[HDOntologyShardImporter countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v86, v85, 16);
    v82 = v66;
  }
  while (v66);
LABEL_55:

  v67 = v78;
  v68 = objc_msgSend(v67, "count");
  v69 = v68;
  v70 = v68 < 1;
  if (v68 >= 1)
  {
    v71 = (id *)MEMORY[0x1E0CB3388];
    if (v68 != 1)
      v71 = (id *)MEMORY[0x1E0CB2F70];
    v72 = (id *)*v71;
    if (v69 == 1)
    {
      objc_msgSend(v67, "firstObject");
      v73 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v73 = v67;
    }
    v74 = v73;
    v93 = (id)*MEMORY[0x1E0CB2D50];
    v94 = v72;
    *(_QWORD *)buf = CFSTR("Error importing ontology files");
    *(_QWORD *)&buf[8] = v73;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v93, 2);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:userInfo:", a3, 100, v75);

  }
  v8 = obj;
LABEL_66:

  return v70;
}

- (void)addOntologyShardImporterObserver:(id)a3 queue:(id)a4
{
  -[HDOntologyShardImporterObserver registerObserver:queue:](self->_ontologyShardImporterObservers, "registerObserver:queue:", a3, a4);
}

- (void)removeOntologyShardImporterObserver:(id)a3
{
  -[HDOntologyShardImporterObserver unregisterObserver:](self->_ontologyShardImporterObservers, "unregisterObserver:", a3);
}

BOOL __52__HDOntologyShardImporter__markImportedEntry_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;

  v5 = a1[4];
  v6 = (void *)a1[5];
  v7 = a2;
  if (v5)
  {
    v8 = v6;
    WeakRetained = objc_loadWeakRetained((id *)(v5 + 32));
    objc_msgSend(WeakRetained, "shardRegistry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "schemaType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v8, "schemaVersion");

    v20 = 0;
    LODWORD(v8) = objc_msgSend(v10, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v11, v12, v13, &v20, v7, a3);
    v14 = v20;

    v15 = 0;
    if ((_DWORD)v8)
    {
      v16 = (void *)objc_msgSend(v14, "copyWithAvailableStateImported");
      if (+[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v16, v7, a3))
      {
        v15 = v16;
      }
      else
      {
        v15 = 0;
      }

    }
  }
  else
  {
    v15 = 0;
  }

  v17 = *(_QWORD *)(a1[6] + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v15;

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

uint64_t __60__HDOntologyShardImporter__notifyImportObserversAboutEntry___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "ontologyShardImporter:didImportEntry:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (HDOntologyUpdateCoordinator)updateCoordinator
{
  return (HDOntologyUpdateCoordinator *)objc_loadWeakRetained((id *)&self->_updateCoordinator);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_updateCoordinator);
  objc_storeStrong((id *)&self->_ontologyShardImporterObservers, 0);
  objc_storeStrong((id *)&self->_lock_importerClassesBySchemaType, 0);
}

@end
