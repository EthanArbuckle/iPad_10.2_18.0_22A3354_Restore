@implementation HDOntologyManifestUpdater

- (HDOntologyManifestUpdater)init
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

- (HDOntologyManifestUpdater)initWithOntologyUpdateCoordinator:(id)a3
{
  id v4;
  HDOntologyManifestUpdater *v5;
  HDOntologyManifestUpdater *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDOntologyManifestUpdater;
  v5 = -[HDOntologyManifestUpdater init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_updateCoordinator, v4);

  return v6;
}

- (void)updateManifestWithURL:(id)a3 session:(id)a4 completion:(id)a5
{
  id v8;
  HDOntologyUpdateCoordinator **p_updateCoordinator;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id WeakRetained;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  _BYTE buf[24];
  void *v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v47 = a4;
  v8 = a5;
  p_updateCoordinator = &self->_updateCoordinator;
  v10 = a3;
  v48 = 0;
  v11 = objc_loadWeakRetained((id *)p_updateCoordinator);
  v12 = v10;
  objc_opt_self();
  objc_msgSend(v11, "shardRegistry");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x1E0CB5700];
  v15 = *MEMORY[0x1E0CB5740];
  v49 = 0;
  v16 = objc_msgSend(v13, "entryWithIdentifier:schemaType:schemaVersion:entryOut:transaction:error:", v14, v15, 1, &v49, 0, &v48);
  v17 = v49;

  if (!v16)
  {
    v27 = 0;
    goto LABEL_16;
  }
  if (!v17)
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB69B0]), "initWithIdentifier:schemaType:schemaVersion:availableURL:", v14, v15, 1, v12);
  v17 = v17;
  v18 = v11;
  v46 = objc_opt_self();
  objc_msgSend(v18, "shardRegistry");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0;
  v51 = 0;
  v20 = objc_msgSend(v19, "stagedShardFileEntryForEntry:entryOut:error:", v17, &v51, &v50);
  v21 = v51;
  v22 = v50;

  if ((v20 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v46;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v22;
      _os_log_impl(&dword_1B7802000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to determine if there is already a staged manifest file: %{public}@", buf, 0x16u);
    }

  }
  if (v21)
  {
    v24 = objc_msgSend(v21, "availableVersion");
    v25 = v17;
    if (v24 > objc_msgSend(v17, "availableVersion"))
    {
      v26 = objc_msgSend(v17, "copyWithAvailableVersion:availableState:", objc_msgSend(v21, "availableVersion"), objc_msgSend(v21, "availableState"));
LABEL_14:
      v25 = (void *)v26;

      objc_msgSend(v18, "shardRegistry");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDOntologyManifestUpdater _insertAndLogFailureForEntry:registry:](v46, v25, v28);

    }
  }
  else
  {
    v25 = v17;
    if (objc_msgSend(v17, "availableState") == 2)
    {
      v26 = objc_msgSend(v17, "copyWithAvailableState:", 1);
      goto LABEL_14;
    }
  }
  v27 = v25;

LABEL_16:
  v29 = v48;

  v30 = v47;
  if (v27)
  {
    WeakRetained = objc_loadWeakRetained((id *)p_updateCoordinator);
    v32 = v27;
    v33 = v47;
    v34 = WeakRetained;
    v35 = v8;
    v36 = (void *)objc_opt_self();
    objc_msgSend(v32, "availableURL");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "manifestVersionURLForManifestURL:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C92C80], "requestWithURL:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __91__HDOntologyManifestUpdater__updateManifestWithEntry_session_updateCoordinator_completion___block_invoke;
    v53 = &unk_1E6CF9D98;
    v58 = v35;
    v59 = v36;
    v54 = v39;
    v55 = v32;
    v56 = v34;
    v57 = v33;
    v40 = v33;
    v41 = v34;
    v42 = v32;
    v43 = v35;
    v44 = v39;
    objc_msgSend(v40, "dataTaskWithRequest:completionHandler:", v44, buf);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "resume");

    v30 = v47;
  }
  else
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v29);
  }

}

+ (id)manifestURLWithBaseURL:(id)a3
{
  return (id)objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("manifest.csv"));
}

+ (id)manifestVersionURLForManifestURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingString:", CFSTR("-version.json"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (void)_insertAndLogFailureForEntry:(void *)a3 registry:
{
  id v4;
  id v5;
  uint64_t v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v6 = objc_opt_self();
  v10 = 0;
  v7 = objc_msgSend(v5, "insertEntry:error:", v4, &v10);

  v8 = v10;
  if ((v7 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v12 = v6;
      v13 = 2114;
      v14 = v4;
      v15 = 2114;
      v16 = v8;
      _os_log_impl(&dword_1B7802000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Unable to persist entry %{public}@: %{public}@", buf, 0x20u);
    }

  }
}

void __91__HDOntologyManifestUpdater__updateManifestWithEntry_session_updateCoordinator_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void (*v17)(void);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 72);
  v9 = *(void **)(a1 + 32);
  v36 = 0;
  LOBYTE(a3) = +[HDOntologyManifestUpdater _handleTaskError:response:request:error:](v8, a4, a3, v9, &v36);
  v10 = v36;
  if ((a3 & 1) != 0)
  {
    v35 = 0;
    v11 = v7;
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v11, 0, &v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v14 = 0;
      goto LABEL_12;
    }
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("version"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v14 = v13;
LABEL_11:

LABEL_12:
        v15 = v35;
        if (v14)
        {
          v16 = objc_msgSend(v14, "integerValue");
          if (v16 > objc_msgSend(*(id *)(a1 + 40), "currentVersion"))
          {
            if (v16 == objc_msgSend(*(id *)(a1 + 40), "availableVersion")
              && objc_msgSend(*(id *)(a1 + 40), "availableState") == 2)
            {
              +[HDOntologyManifestUpdater _importStagedManifestFileWithEntry:updateCoordinator:completion:](*(_QWORD *)(a1 + 72), *(void **)(a1 + 40), *(void **)(a1 + 48), *(void **)(a1 + 64));
            }
            else
            {
              v18 = (void *)objc_msgSend(*(id *)(a1 + 40), "copyWithAvailableVersion:availableState:", v16, 1);
              v20 = *(void **)(a1 + 48);
              v19 = *(void **)(a1 + 56);
              v21 = *(void **)(a1 + 64);
              v22 = v18;
              v23 = v20;
              v24 = v21;
              v34 = v19;
              v25 = objc_opt_self();
              v26 = (void *)MEMORY[0x1E0C92C80];
              objc_msgSend(v22, "availableURL");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "requestWithURL:", v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v37[0] = MEMORY[0x1E0C809B0];
              v37[1] = 3221225472;
              v37[2] = __93__HDOntologyManifestUpdater__downloadManifestWithEntry_session_updateCoordinator_completion___block_invoke;
              v37[3] = &unk_1E6CF9DC0;
              v41 = v24;
              v42 = v25;
              v38 = v28;
              v39 = v22;
              v40 = v23;
              v29 = v23;
              v30 = v22;
              v31 = v24;
              v32 = v28;
              objc_msgSend(v34, "downloadTaskWithRequest:completionHandler:", v32, v37);
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v33, "resume");
            }
            goto LABEL_21;
          }
          v17 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
        }
        else
        {
          v17 = *(void (**)(void))(*(_QWORD *)(a1 + 64) + 16);
        }
        v17();
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v35, 3, CFSTR("Value for key 'version' is of class '%@', but expected kind of NSNumber"), objc_opt_class());
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &v35, 3, CFSTR("No value for expected key 'version'"));
    }
    v14 = 0;
    goto LABEL_11;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
LABEL_22:

}

+ (BOOL)_handleTaskError:(void *)a3 response:(void *)a4 request:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  id v12;
  uint64_t v13;
  id v14;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_opt_self();
  if (v8)
  {
    if (a5)
    {
      v11 = 0;
      *a5 = objc_retainAutorelease(v8);
    }
    else
    {
      _HKLogDroppedError();
      v11 = 0;
    }
  }
  else
  {
    v12 = v9;
    v13 = objc_msgSend(v12, "statusCode");
    v11 = (unint64_t)(v13 - 200) < 0x64;
    if ((unint64_t)(v13 - 200) >= 0x64)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_HTTPErrorRepresentingResponse:request:", v12, v10);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (a5)
          *a5 = objc_retainAutorelease(v14);
        else
          _HKLogDroppedError();
      }

    }
  }

  return v11;
}

+ (void)_importStagedManifestFileWithEntry:(void *)a3 updateCoordinator:(void *)a4 completion:
{
  void (**v6)(id, _BOOL8, id);
  id v7;
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  id v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = a2;
  objc_opt_self();
  v13 = 0;
  v9 = v7;
  v10 = v8;
  objc_opt_self();
  v11 = +[HDOntologyManifestImporter importManifestWithEntry:updateCoordinator:error:](HDOntologyManifestImporter, "importManifestWithEntry:updateCoordinator:error:", v10, v9, &v13);

  v12 = v13;
  v6[2](v6, v11, v12);

}

void __93__HDOntologyManifestUpdater__downloadManifestWithEntry_session_updateCoordinator_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  id v24;

  v7 = a2;
  v8 = *(_QWORD *)(a1 + 64);
  v9 = *(void **)(a1 + 32);
  v24 = 0;
  LOBYTE(a3) = +[HDOntologyManifestUpdater _handleTaskError:response:request:error:](v8, a4, a3, v9, &v24);
  v10 = v24;
  if ((a3 & 1) != 0)
  {
    v11 = *(void **)(a1 + 40);
    v12 = *(void **)(a1 + 48);
    v23 = 0;
    v13 = v11;
    v14 = v12;
    v15 = v7;
    objc_opt_self();
    objc_msgSend(v14, "shardRegistry");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "stageShardFileWithLocalURL:entry:error:", v15, v13, &v23);

    v18 = 0;
    if (v17)
    {
      v19 = (void *)objc_msgSend(v13, "copyWithAvailableState:", 2, v23);
      objc_msgSend(v14, "shardRegistry");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "insertEntry:error:", v19, &v23);

      if (v21)
        v18 = v19;
      else
        v18 = 0;

    }
    v22 = v23;
    if (v18)
      +[HDOntologyManifestUpdater _importStagedManifestFileWithEntry:updateCoordinator:completion:](*(_QWORD *)(a1 + 64), v18, *(void **)(a1 + 48), *(void **)(a1 + 56));
    else
      (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

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
