@implementation HDOntologyMercuryZipTSVImporter

- (HDOntologyMercuryZipTSVImporter)init
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

+ (BOOL)canImportEntry:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "schemaType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0CB5750];
  if (v5 != (void *)*MEMORY[0x1E0CB5750])
  {
    if (!v6)
    {
      v7 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v4, "schemaType");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v3, "isEqualToString:", v6))
    {
      v7 = 0;
LABEL_6:

      goto LABEL_8;
    }
  }
  v8 = objc_msgSend(v4, "schemaVersion");
  objc_msgSend(v4, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8 == HKCurrentSchemaVersionForShardIdentifier();

  if (v5 != v6)
    goto LABEL_6;
LABEL_8:

  return v7;
}

+ (BOOL)importOntologyShardEntry:(id)a3 shardRegistry:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, void *, _QWORD *);
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "openShardFileForEntry:error:", v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v9, "updateCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __80__HDOntologyMercuryZipTSVImporter_importOntologyShardEntry_shardRegistry_error___block_invoke;
    v19 = &unk_1E6CFD208;
    v23 = a1;
    v20 = v8;
    v12 = v10;
    v21 = v12;
    v22 = v11;
    v13 = v11;
    v14 = objc_msgSend(v13, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, 0, a5, &v16);
    objc_msgSend(v12, "closeFile", v16, v17, v18, v19);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __80__HDOntologyMercuryZipTSVImporter_importOntologyShardEntry_shardRegistry_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v33;
  id v34;
  id v36;
  id *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _BYTE buf[24];
  void *v47;
  id v48;
  id v49;
  id v50;
  uint64_t *v51;
  id *v52;
  uint64_t v53;
  _QWORD v54[5];

  v54[3] = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 48);
  v6 = *(id *)(a1 + 40);
  v7 = v5;
  v8 = a2;
  v9 = v4;
  objc_opt_self();
  v10 = v9;
  v11 = v8;
  v12 = objc_opt_self();
  v13 = objc_msgSend(v10, "slot");
  if (v13 == *MEMORY[0x1E0CB5730])
  {
    v36 = 0;
    +[HDOntologyShardRegistry nextAvailableMercuryZipTSVSlotWithTransaction:error:](HDOntologyShardRegistry, "nextAvailableMercuryZipTSVSlotWithTransaction:error:", v11, &v36);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v36;
    v16 = v15;
    if (v14)
    {
      v17 = objc_msgSend(v10, "copyWithSlot:", objc_msgSend(v14, "integerValue"));
    }
    else
    {
      if (objc_msgSend(v15, "hk_isObjectNotFoundError"))
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v12;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v10;
          *(_WORD *)&buf[22] = 2114;
          v47 = v16;
          _os_log_fault_impl(&dword_1B7802000, v18, OS_LOG_TYPE_FAULT, "%{public}@: Error assigning a slot to %{public}@: %{public}@", buf, 0x20u);
        }

      }
      v19 = v16;
      v20 = v19;
      if (v19)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v19);
        else
          _HKLogDroppedError();
      }

      v17 = 0;
    }

  }
  else
  {
    v17 = (uint64_t)v10;
  }

  if (!v17)
  {
    v27 = 0;
    goto LABEL_28;
  }
  v21 = v6;
  v34 = (id)v17;
  v33 = v7;
  v22 = v11;
  v23 = objc_opt_self();
  v54[0] = CFSTR("nodes");
  v54[1] = CFSTR("attributes");
  v54[2] = CFSTR("relationships");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB7080]), "initWithFileHandle:", v21);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 1;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__122;
  v40 = __Block_byref_object_dispose__122;
  v41 = 0;
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __104__HDOntologyMercuryZipTSVImporter__importShardWithFileHandle_entry_updateCoordinator_transaction_error___block_invoke;
  v47 = &unk_1E6CFD270;
  v26 = v24;
  v53 = v23;
  v48 = v26;
  v51 = &v42;
  v27 = v34;
  v49 = v27;
  v28 = v22;
  v50 = v28;
  v52 = &v36;
  if ((objc_msgSend(v25, "enumerateEntriesWithError:block:", a3, buf) & 1) != 0)
  {
    if (*((_BYTE *)v43 + 24))
    {
      v17 = 1;
      goto LABEL_26;
    }
    v29 = v37[5];
    v30 = v29;
    if (v29)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v29);
      else
        _HKLogDroppedError();
    }

  }
  v17 = 0;
LABEL_26:

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  if ((_DWORD)v17)
  {
    v31 = objc_msgSend(v27, "copyWithAvailableStateImported");

    v17 = +[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v31, v28, a3);
    v27 = (id)v31;
  }
LABEL_28:

  return v17;
}

+ (id)willPruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  return (id)objc_msgSend(a3, "hk_filter:", &__block_literal_global_143, a4, a5, a6);
}

uint64_t __80__HDOntologyMercuryZipTSVImporter_willPruneEntries_options_shardRegistry_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "schemaType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CB5750]);

  return v3;
}

+ (id)pruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  HDOntologyMercuryZipTSVPruner *v13;
  void *v14;
  HDOntologyMercuryZipTSVPruner *v15;
  uint64_t v16;
  id v17;
  void *v18;

  v11 = a3;
  v12 = a5;
  v13 = [HDOntologyMercuryZipTSVPruner alloc];
  objc_msgSend(v12, "updateCoordinator");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[HDOntologyMercuryZipTSVPruner initWithOntologyUpdateCoordinator:](v13, "initWithOntologyUpdateCoordinator:", v14);
  v16 = -[HDOntologyMercuryZipTSVPruner pruneEntries:options:error:](v15, "pruneEntries:options:error:", v11, a4, a6);
  if (!v16)
    goto LABEL_7;
  if (v16 == 2)
  {
    v17 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_8;
  }
  if (v16 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDOntologyMercuryZipTSVImporter.m"), 95, CFSTR("Unreachable code has been executed"));

LABEL_7:
    v17 = 0;
    goto LABEL_8;
  }
  v17 = v11;
LABEL_8:

  return v17;
}

+ (int64_t)purgeableSpaceForUrgency:(int)a3 shardRegistry:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  if (a3 != 4)
    return 0;
  v4 = a4;
  objc_opt_self();
  objc_msgSend(v4, "daemon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "ontologyBackingStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeOfUnderlyingDatabaseInBytes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 >= 0x100000)
    return v8;
  else
    return 0;
}

+ (int64_t)purgeSpaceForUrgency:(int)a3 shardRegistry:(id)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v4 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = objc_msgSend(a1, "purgeableSpaceForUrgency:shardRegistry:", v4, v6);
  if (v7 < 1)
  {
    v8 = 0;
  }
  else
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Cache delete with urgency %d"), v4);
    objc_msgSend(v6, "daemon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "ontologyBackingStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v12 = objc_msgSend(v11, "obliterateWithReason:error:", v9, &v16);
    v13 = v16;

    if ((v12 & 1) == 0)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543874;
        v18 = a1;
        v19 = 2114;
        v20 = v9;
        v21 = 2114;
        v22 = v13;
        _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "%{public}@: error %{public}@: %{public}@", buf, 0x20u);
      }

      v8 = 0;
    }

  }
  return v8;
}

void __104__HDOntologyMercuryZipTSVImporter__importShardWithFileHandle_entry_updateCoordinator_transaction_error___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  int v24;
  id v25;
  NSObject *v26;
  const __CFString *v27;
  id v28;
  __CFString *v29;
  id v30;
  void *v31;
  void *v32;
  const __CFString *v33;
  uint64_t v34;
  id *location;
  id v36;
  id v37;
  id obj;
  id v40;
  id v41;
  _QWORD v42[4];
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint8_t v49[4];
  uint64_t v50;
  __int16 v51;
  const __CFString *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  __CFString *v60;
  _BYTE buf[24];
  void *v62;
  id v63;
  id v64;
  id v65;
  uint64_t *v66;
  _QWORD *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "pathname");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6) & 1) != 0)
  {
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v9 + 40);
    location = (id *)(v9 + 40);
    v40 = v4;
    v10 = v6;
    v11 = v7;
    v12 = v8;
    v13 = objc_opt_self();
    v14 = v10;
    v15 = objc_opt_self();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("nodes"))
      || objc_msgSend(v14, "isEqualToString:", CFSTR("attributes"))
      || objc_msgSend(v14, "isEqualToString:", CFSTR("relationships")))
    {
      objc_opt_class();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", sel__lineImporterClassForFileName_, v15, CFSTR("HDOntologyMercuryZipTSVImporter.m"), 295, CFSTR("Unreachable code has been executed"));

      v21 = 0;
    }

    v22 = v21;
    CFAbsoluteTimeGetCurrent();
    v45 = 0;
    v46 = &v45;
    v47 = 0x2020000000;
    v48 = 0;
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x4010000000;
    v42[3] = &unk_1B805FAAD;
    v43 = xmmword_1B7F41EE8;
    v44 = *(_OWORD *)algn_1B7F41EF8;
    v41 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __96__HDOntologyMercuryZipTSVImporter__importArchiveEntry_filename_ontologyEntry_transaction_error___block_invoke;
    v62 = &unk_1E6CFD298;
    v66 = &v45;
    v68 = v13;
    v23 = v14;
    v63 = v23;
    v69 = v22;
    v36 = v11;
    v64 = v36;
    v37 = v12;
    v65 = v37;
    v67 = v42;
    v24 = objc_msgSend(v40, "enumerateLinesWithError:block:", &v41, buf);
    v25 = v41;
    _HKInitializeLogging();
    HKLogHealthOntology();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      if (v24)
        v27 = CFSTR("Success");
      else
        v27 = CFSTR("Error");
      v33 = v27;
      v34 = v46[3];
      CFAbsoluteTimeGetCurrent();
      HKDiagnosticStringFromDuration();
      v28 = (id)objc_claimAutoreleasedReturnValue();
      if ((v24 & 1) != 0)
        v29 = &stru_1E6D11BB8;
      else
        v29 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR(": %@"), v25);
      *(_DWORD *)v49 = 138544642;
      v50 = v13;
      v51 = 2114;
      v52 = v33;
      v53 = 2048;
      v54 = v34;
      v55 = 2114;
      v56 = v23;
      v57 = 2112;
      v58 = v28;
      v59 = 2112;
      v60 = v29;
      _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: %{public}@ importing %ld lines of %{public}@ in %@%@", v49, 0x3Eu);
      if ((v24 & 1) == 0)

    }
    v30 = v25;
    v31 = v30;
    if (v30)
      obj = objc_retainAutorelease(v30);

    _Block_object_dispose(v42, 8);
    _Block_object_dispose(&v45, 8);

    objc_storeStrong(location, obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v24;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      *a3 = 1;
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

    if (v17)
    {
      HKLogHealthOntology();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = *(_QWORD *)(a1 + 72);
        objc_msgSend(v4, "pathname");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v20;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "%{public}@: skipping unrecognized file: '%{public}@'", buf, 0x16u);

      }
    }
  }

}

uint64_t __96__HDOntologyMercuryZipTSVImporter__importArchiveEntry_filename_ontologyEntry_transaction_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  _BOOL4 v8;
  HDOntologyTSVScanner *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (objc_msgSend(v5, "length"))
  {
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) != 1
      || !objc_msgSend(*(id *)(a1 + 80), "isHeaderLine:", v5))
    {
      v9 = -[HDOntologyTSVScanner initWithString:]([HDOntologyTSVScanner alloc], "initWithString:", v5);
      v13 = *(void **)(a1 + 80);
      v14 = objc_msgSend(*(id *)(a1 + 40), "slot");
      objc_msgSend(*(id *)(a1 + 48), "graphDatabase");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 32;
      v28 = 0;
      LOBYTE(v14) = objc_msgSend(v13, "importLineWithScanner:slot:graphDatabase:context:error:", v9, v14, v15, v16, &v28);
      v17 = v28;

      if ((v14 & 1) != 0)
      {
        v7 = 1;
      }
      else
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v26 = *(_QWORD *)(a1 + 72);
          v27 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138544130;
          v30 = v26;
          v31 = 2114;
          v32 = v27;
          v33 = 2114;
          v34 = v5;
          v35 = 2114;
          v36 = v17;
          _os_log_error_impl(&dword_1B7802000, v23, OS_LOG_TYPE_ERROR, "%{public}@: Importing %{public}@ unable to parse line \"%{public}@\" error: %{public}@", buf, 0x2Au);
        }

        v24 = v17;
        if (v24)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v24);
          else
            _HKLogDroppedError();
        }

        v7 = 0;
      }

      goto LABEL_21;
    }
    _HKInitializeLogging();
    HKLogHealthOntology();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = 1;
    v8 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);

    if (v8)
    {
      HKLogHealthOntology();
      v9 = (HDOntologyTSVScanner *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_INFO))
      {
        v10 = *(_QWORD *)(a1 + 72);
        v11 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v30 = v10;
        v31 = 2114;
        v32 = v11;
        v33 = 2112;
        v34 = v5;
        v12 = "%{public}@: header line in %{public}@: @\"%@\";
LABEL_12:
        v7 = 1;
        _os_log_impl(&dword_1B7802000, &v9->super, OS_LOG_TYPE_INFO, v12, buf, 0x20u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v18 = objc_claimAutoreleasedReturnValue();
    v7 = 1;
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

    if (v19)
    {
      HKLogHealthOntology();
      v9 = (HDOntologyTSVScanner *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_INFO))
      {
        v20 = *(_QWORD *)(a1 + 72);
        v21 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        v22 = *(void **)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        v30 = v20;
        v31 = 2048;
        v32 = v21;
        v33 = 2114;
        v34 = v22;
        v12 = "%{public}@: empty line %ld in %{public}@";
        goto LABEL_12;
      }
LABEL_21:

    }
  }

  return v7;
}

@end
