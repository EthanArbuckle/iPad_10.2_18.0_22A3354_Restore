@implementation HDOntologyManifestImporter

- (HDOntologyManifestImporter)init
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
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "schemaType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB5740];
  if (v4 == (void *)*MEMORY[0x1E0CB5740])
  {
    LOBYTE(v5) = objc_msgSend(v3, "schemaVersion") == 1;
  }
  else if (v5)
  {
    objc_msgSend(v3, "schemaType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v5))
      LOBYTE(v5) = objc_msgSend(v3, "schemaVersion") == 1;
    else
      LOBYTE(v5) = 0;

  }
  return v5;
}

+ (BOOL)importManifestWithEntry:(id)a3 updateCoordinator:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v9, "shardRegistry");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "openShardFileForEntry:error:", v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __78__HDOntologyManifestImporter_importManifestWithEntry_updateCoordinator_error___block_invoke;
    v23[3] = &unk_1E6CFD208;
    v27 = a1;
    v12 = v8;
    v24 = v12;
    v13 = v9;
    v25 = v13;
    v14 = v11;
    v26 = v14;
    v15 = objc_msgSend(v13, "performOntologyTransactionForWrite:databaseTransaction:error:transactionHandler:", 1, 0, a5, v23);
    objc_msgSend(v14, "closeFile");
    if (v15)
    {
      v16 = v12;
      v17 = v13;
      v18 = objc_opt_self();
      objc_msgSend(v17, "shardRegistry");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = 0;
      LOBYTE(v17) = objc_msgSend(v19, "deleteStagedShardFileForEntry:error:", v16, &v28);
      v20 = v28;

      if ((v17 & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v30 = v18;
          v31 = 2114;
          v32 = v16;
          v33 = 2114;
          v34 = v20;
          _os_log_impl(&dword_1B7802000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: After import unable to delete staged file for %{public}@: %{public}@", buf, 0x20u);
        }

      }
    }

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

BOOL __78__HDOntologyManifestImporter_importManifestWithEntry_updateCoordinator_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  int v19;
  void *v20;
  _BOOL8 v21;
  uint64_t v23;
  uint64_t v24;
  BOOL (*v25)(uint64_t, void *, uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  uint64_t v30;

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = a2;
  v9 = v6;
  v10 = v5;
  objc_opt_self();
  v11 = v10;
  v12 = v8;
  v13 = v9;
  v14 = objc_opt_self();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __96__HDOntologyManifestImporter__importManifestWithFileHandle_updateCoordinator_transaction_error___block_invoke;
  v26 = &unk_1E6D11950;
  v27 = v11;
  v28 = v12;
  v29 = v15;
  v30 = v14;
  v16 = v15;
  v17 = v12;
  v18 = v11;
  v19 = objc_msgSend(v13, "hk_enumerateLinesWithError:handler:", a3, &v23);

  if (v19)
  {
    v20 = (void *)objc_msgSend(v7, "copyWithAvailableStateImported", v23, v24, v25, v26);
    v21 = +[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v20, v17, a3);

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

+ (id)willPruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)pruneEntries:(id)a3 options:(unint64_t)a4 shardRegistry:(id)a5 error:(id *)a6
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)importOntologyShardEntry:(id)a3 shardRegistry:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a4, "updateCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(a1, "importManifestWithEntry:updateCoordinator:error:", v8, v9, a5);

  return (char)a5;
}

BOOL __96__HDOntologyManifestImporter__importManifestWithFileHandle_updateCoordinator_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  id v32;
  id v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58[2];

  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(id *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = a2;
  objc_opt_self();
  +[_HDOntologyManifestItem manifestItemFromLine:error:](_HDOntologyManifestItem, "manifestItemFromLine:error:", v10, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = v11;
    v13 = v7;
    v54 = v8;
    v56 = a3;
    v14 = v8;
    v53 = v9;
    v57 = v9;
    objc_opt_self();
    objc_msgSend(v13, "shardRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "schemaType");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v58[0] = 0;
    v18 = v14;
    v19 = objc_msgSend(v15, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v16, v17, objc_msgSend(v12, "schemaVersion"), v58, v14, v56);
    v20 = v58[0];

    v55 = v20;
    if (!v19)
    {
      v31 = 0;
      v9 = v53;
      v8 = v54;
LABEL_12:

      goto LABEL_13;
    }
    v49 = v13;
    v50 = v7;
    if (v20)
    {
      v47 = v18;
      v45 = v57;
      v21 = v12;
      v22 = v20;
      objc_opt_self();
      v51 = objc_msgSend(v21, "version");
      objc_msgSend(v21, "region");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "locale");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "URL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "checksum");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v21, "size");

      objc_msgSend(v22, "updatedCopyWithAvailableVersion:availableRegion:availableLocale:availableURL:availableChecksum:availableSize:date:", v51, v23, v24, v25, v26, v27, v45);
      v28 = objc_claimAutoreleasedReturnValue();

      v29 = v22;
      if ((id)v28 == v22)
      {
        v31 = 1;
        v13 = v49;
        v7 = v50;
        v9 = v53;
        v8 = v54;
        goto LABEL_11;
      }
      v29 = (void *)v28;
      v13 = v49;
      v7 = v50;
      v9 = v53;
      v8 = v54;
      v30 = v56;
    }
    else
    {
      v32 = v57;
      v44 = v18;
      v46 = v18;
      v33 = v12;
      objc_opt_self();
      v52 = objc_alloc(MEMORY[0x1E0CB69B0]);
      objc_msgSend(v33, "identifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "schemaType");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v33, "schemaVersion");
      v34 = objc_msgSend(v33, "version");
      objc_msgSend(v33, "region");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "locale");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "URL");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "checksum");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v33, "size");

      v39 = v34;
      v7 = v50;
      v28 = objc_msgSend(v52, "initWithIdentifier:schemaType:schemaVersion:availableVersion:availableRegion:availableLocale:availableURL:availableChecksum:availableSize:date:", v48, v42, v43, v39, v35, v36, v41, v37, v38, v32);

      v18 = v44;
      v30 = v56;

      v13 = v49;
      v29 = v46;

      v47 = (id)v28;
      v9 = v53;
      v8 = v54;
    }
    v31 = +[HDOntologyShardRegistry insertEntry:transaction:error:](HDOntologyShardRegistry, "insertEntry:transaction:error:", v28, v18, v30);
LABEL_11:

    goto LABEL_12;
  }
  v31 = 0;
LABEL_13:

  return v31;
}

@end
