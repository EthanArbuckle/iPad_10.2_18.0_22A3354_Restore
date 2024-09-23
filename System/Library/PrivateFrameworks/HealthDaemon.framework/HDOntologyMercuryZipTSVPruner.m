@implementation HDOntologyMercuryZipTSVPruner

- (HDOntologyMercuryZipTSVPruner)init
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

- (HDOntologyMercuryZipTSVPruner)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4;
  HDOntologyMercuryZipTSVPruner *v5;
  HDOntologyMercuryZipTSVPruner *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyMercuryZipTSVPruner;
  v5 = -[HDOntologyMercuryZipTSVPruner init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);

  return v6;
}

- (int64_t)pruneEntries:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  char v5;
  void *v7;
  int v8;
  int64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  int v19;
  id v21;
  int64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  HDOntologyMercuryZipTSVPruner *v36;
  uint64_t *v37;
  BOOL v38;
  _BYTE v39[128];
  _QWORD v40[5];

  v5 = a4;
  v40[3] = *MEMORY[0x1E0C80C00];
  v21 = a3;
  if ((v5 & 1) != 0)
    goto LABEL_7;
  if (!self)
  {
    v22 = 0;
    goto LABEL_20;
  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  -[HDOntologyMercuryZipTSVPruner updateCoordinator](self, "updateCoordinator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x1E0C809B0];
  v33 = 3221225472;
  v34 = __55__HDOntologyMercuryZipTSVPruner__shouldPruneWithError___block_invoke;
  v35 = &unk_1E6D03D40;
  v36 = self;
  v37 = &v28;
  v8 = objc_msgSend(v7, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 0, 0, a5, &v32);

  v9 = v8 ? v29[3] : 0;
  _Block_object_dispose(&v28, 8);
  v22 = v9;
  if (v9 == 1)
  {
LABEL_7:
    v40[0] = objc_opt_class();
    v40[1] = objc_opt_class();
    v40[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v25;
      v22 = 1;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(uint64_t **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v16 = objc_msgSend(v10, "count");
          if (!self)
            goto LABEL_17;
          v17 = v12 + i + 1 == v16;
          -[HDOntologyMercuryZipTSVPruner updateCoordinator](self, "updateCoordinator");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = MEMORY[0x1E0C809B0];
          v33 = 3221225472;
          v34 = __78__HDOntologyMercuryZipTSVPruner__pruneElementsFromEntity_isFinalEntity_error___block_invoke;
          v35 = &unk_1E6D03D68;
          v36 = self;
          v37 = v15;
          v38 = v17;
          v19 = objc_msgSend(v18, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, 0, a5, &v32);

          if (!v19)
          {
LABEL_17:
            v22 = 0;
            goto LABEL_19;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v39, 16);
        v12 += i;
        if (v11)
          continue;
        break;
      }
    }
    else
    {
      v22 = 1;
    }
LABEL_19:

  }
LABEL_20:

  return v22;
}

BOOL __55__HDOntologyMercuryZipTSVPruner__shouldPruneWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  uint64_t v12;
  double Current;
  double v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  _BYTE buf[22];
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v7 = v6;
  if (v5)
  {
    v30 = 0;
    objc_msgSend(v6, "graphDatabase");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "underlyingDatabase");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = +[HDSimpleGraphDatabaseMetadataEntity metadataValueForKey:valueOut:database:error:](HDSimpleGraphDatabaseMetadataEntity, "metadataValueForKey:valueOut:database:error:", CFSTR("MercuryZipTSVLastPruneDate"), &v30, v9, a3);
    v11 = v30;

    v12 = 0;
    if (v10)
    {
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v11, "doubleValue");
      if (Current - v14 >= 604800.0)
      {
        v18 = (void *)MEMORY[0x1E0D29840];
        v19 = (void *)MEMORY[0x1E0D29838];
        v20 = v7;
        objc_msgSend(v19, "predicateWithProperty:notEqualToValue:", CFSTR("current_version"), &unk_1E6DFE5E8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = v21;
        objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("schema_type"), *MEMORY[0x1E0CB5750]);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&buf[8] = v22;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "predicateMatchingAllPredicates:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v25 = *MEMORY[0x1E0D29620];
        objc_msgSend(v20, "graphDatabase");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v26, "underlyingDatabase");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        +[HDSQLiteEntity countValueForProperty:predicate:database:error:](HDOntologyShardRegistryEntity, "countValueForProperty:predicate:database:error:", v25, v24, v27, a3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          if (objc_msgSend(v28, "integerValue") >= 1)
            v12 = 1;
          else
            v12 = 2;
        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          HKDiagnosticStringFromDuration();
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          HKDiagnosticStringFromDuration();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v16;
          v32 = 2114;
          v33 = v17;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: skipping prunning because it has only been %{public}@ since the last prune (waiting for %{public}@)", buf, 0x20u);

        }
        v12 = 2;
      }
    }

  }
  else
  {
    v12 = 0;
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v12;
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
}

uint64_t __78__HDOntologyMercuryZipTSVPruner__pruneElementsFromEntity_isFinalEntity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  CFAbsoluteTime Current;
  void *v19;
  void *v20;
  objc_class *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  int v26;
  objc_class *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id *v42;
  void *v43;
  void *v44;
  id v45;
  id *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  char v53;
  id v54;
  NSObject *v55;
  uint64_t v56;
  void *v57;
  uint64_t v59;
  uint64_t v60;
  id *v61;
  void *v62;
  void *v63;
  _QWORD v65[2];
  _BYTE buf[24];
  void *v67;
  id *v68;
  id v69;
  uint64_t v70;
  void *v71;
  CFAbsoluteTime v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = *(id **)(a1 + 32);
  v60 = a1;
  v63 = *(void **)(a1 + 40);
  v6 = v4;
  v61 = v5;
  v62 = v6;
  if (v5)
  {
    v7 = v6;
    v8 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v65[0] = v9;
    v59 = *MEMORY[0x1E0CB5750];
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v65[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateMatchingAllPredicates:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v73 = 0;
    v74 = (uint64_t)&v73;
    v75 = 0x2020000000;
    v76 = 0;
    objc_msgSend(v7, "graphDatabase");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "underlyingDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __69__HDOntologyMercuryZipTSVPruner__requiredSlotsWithTransaction_error___block_invoke;
    v67 = &unk_1E6CEF7F0;
    v68 = &v73;
    LODWORD(v10) = +[HDOntologyShardRegistryEntity enumerateEntriesWithPredicate:orderingTerms:database:error:enumerationHandler:](HDOntologyShardRegistryEntity, "enumerateEntriesWithPredicate:orderingTerms:database:error:enumerationHandler:", v12, 0, v14, a3, buf);

    if ((_DWORD)v10)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(v74 + 24));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = 0;
    }
    _Block_object_dispose(&v73, 8);

    if (v15)
    {
      v16 = objc_msgSend(v15, "unsignedLongLongValue");
      v17 = v7;
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v17, "graphDatabase");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "underlyingDatabase");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v21 = (objc_class *)MEMORY[0x1E0CB3940];
      v22 = v20;
      v23 = [v21 alloc];
      objc_msgSend(v63, "disambiguatedDatabaseTable");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v23, "initWithFormat:", CFSTR("DELETE FROM %@ WHERE (%@ & ?) == 0"), v24, CFSTR("slots"));

      v73 = (id)MEMORY[0x1E0C809B0];
      v74 = 3221225472;
      v75 = (uint64_t)__88__HDOntologyMercuryZipTSVPruner__deleteElementsFromEntity_requiredSlots_database_error___block_invoke;
      v76 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      v77 = v16;
      LODWORD(v24) = objc_msgSend(v22, "executeSQL:error:bindingHandler:enumerationHandler:", v25, a3, &v73, 0);

      if (!(_DWORD)v24)
        goto LABEL_17;
      v26 = objc_msgSend(v22, "getChangesCount");
      v27 = (objc_class *)MEMORY[0x1E0CB3940];
      v28 = v22;
      v29 = [v27 alloc];
      objc_msgSend(v63, "disambiguatedDatabaseTable");
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v29, "initWithFormat:", CFSTR("UPDATE %@ SET %@ = (%@ & ?) WHERE %@ != (%@ & ?)"), v30, CFSTR("slots"), CFSTR("slots"), CFSTR("slots"), CFSTR("slots"));

      v73 = (id)MEMORY[0x1E0C809B0];
      v74 = 3221225472;
      v75 = (uint64_t)__86__HDOntologyMercuryZipTSVPruner__updateElementsOfEntity_requiredSlots_database_error___block_invoke;
      v76 = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      v77 = v16;
      LOBYTE(v30) = objc_msgSend(v28, "executeSQL:error:bindingHandler:enumerationHandler:", v31, a3, &v73, 0);

      if ((v30 & 1) != 0)
      {
        v32 = objc_msgSend(v28, "getChangesCount");
        *(_QWORD *)buf = MEMORY[0x1E0C809B0];
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __90__HDOntologyMercuryZipTSVPruner__pruneElementsFromEntity_requiredSlots_transaction_error___block_invoke;
        v67 = &unk_1E6D03D90;
        v68 = v61;
        v69 = (id)v26;
        v70 = v32;
        v71 = v63;
        v72 = Current;
        objc_msgSend(v28, "onCommit:orRollback:", buf, 0);

        if (!*(_BYTE *)(v60 + 48))
        {
          v56 = 1;
          v57 = v62;
          goto LABEL_20;
        }
        v33 = *(_QWORD *)(v60 + 32);
        v34 = v17;
        if (v33)
        {
          v35 = v34;
          v36 = (void *)MEMORY[0x1E0D29840];
          objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:notEqualToValue:", CFSTR("desired_state"), &unk_1E6DFE600);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v37;
          objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:notEqualToValue:", CFSTR("current_version"), &unk_1E6DFE5E8);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v74 = (uint64_t)v38;
          objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("schema_type"), v59);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = (uint64_t)v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 3);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "predicateMatchingAllPredicates:", v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v42 = (id *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "graphDatabase");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "underlyingDatabase");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __86__HDOntologyMercuryZipTSVPruner__markPrunedShardEntriesAsPrunedWithTransaction_error___block_invoke;
          v67 = &unk_1E6D03DB8;
          v68 = v42;
          v45 = v35;
          v69 = v45;
          v46 = v42;
          LODWORD(v35) = +[HDOntologyShardRegistryEntity enumerateEntriesWithPredicate:orderingTerms:database:error:enumerationHandler:](HDOntologyShardRegistryEntity, "enumerateEntriesWithPredicate:orderingTerms:database:error:enumerationHandler:", v41, 0, v44, a3, buf);

          if ((_DWORD)v35)
          {
            objc_msgSend(v45, "graphDatabase");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
            objc_msgSend(v48, "numberWithDouble:");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "stringValue");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = objc_msgSend(v47, "setMetadataValue:forKey:error:", v50, CFSTR("MercuryZipTSVLastPruneDate"), a3);

            if (v51)
            {
              objc_msgSend(v45, "graphDatabase");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = 0;
              v53 = objc_msgSend(v52, "setMetadataValue:forKey:error:", 0, CFSTR("ontologyAssetVersion"), &v73);
              v54 = v73;

              if ((v53 & 1) == 0)
              {
                _HKInitializeLogging();
                HKLogHealthOntology();
                v55 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138543874;
                  *(_QWORD *)&buf[4] = v33;
                  *(_WORD *)&buf[12] = 2114;
                  *(_QWORD *)&buf[14] = CFSTR("ontologyAssetVersion");
                  *(_WORD *)&buf[22] = 2114;
                  v67 = v54;
                  _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Unable to clear metadata for %{public}@: %{public}@", buf, 0x20u);
                }

              }
              v56 = 1;
              goto LABEL_19;
            }
          }
        }
      }
      else
      {
LABEL_17:

      }
    }
  }
  v56 = 0;
LABEL_19:
  v57 = v62;

LABEL_20:
  return v56;
}

uint64_t __69__HDOntologyMercuryZipTSVPruner__requiredSlotsWithTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= 1 << objc_msgSend(a2, "slot");
  return 1;
}

void __90__HDOntologyMercuryZipTSVPruner__pruneElementsFromEntity_requiredSlots_transaction_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogHealthOntology();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    NSStringFromClass(*(Class *)(a1 + 56));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CFAbsoluteTimeGetCurrent();
    HKDiagnosticStringFromDuration();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544386;
    v9 = v3;
    v10 = 2048;
    v11 = v4;
    v12 = 2048;
    v13 = v5;
    v14 = 2114;
    v15 = v6;
    v16 = 2114;
    v17 = v7;
    _os_log_impl(&dword_1B7802000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@: Directly deleted %ld and updated %ld from %{public}@ in %{public}@", (uint8_t *)&v8, 0x34u);

  }
}

uint64_t __88__HDOntologyMercuryZipTSVPruner__deleteElementsFromEntity_requiredSlots_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __86__HDOntologyMercuryZipTSVPruner__updateElementsOfEntity_requiredSlots_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 32));
}

BOOL __86__HDOntologyMercuryZipTSVPruner__markPrunedShardEntriesAsPrunedWithTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  _BOOL8 v6;

  v5 = (void *)objc_msgSend(a2, "copyWithAvailableStateNotImportedForDate:", *(_QWORD *)(a1 + 32));
  v6 = +[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v5, *(_QWORD *)(a1 + 40), a3);

  return v6;
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
