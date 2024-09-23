@implementation FCCKDatabaseEncryptionStartUpMiddleware

- (id)initWithEncryptionMigrator:(id *)a1
{
  id v4;
  id *v5;
  objc_super v7;

  v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)FCCKDatabaseEncryptionStartUpMiddleware;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5)
      objc_storeStrong(v5 + 1, a2);
  }

  return a1;
}

- (void)performStartUpForDatabase:(id)a3 completion:(id)a4
{
  id *v6;
  id v7;
  id WeakRetained;
  uint64_t v9;
  id v10;
  id *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  _QWORD v17[5];
  id *v18;
  id v19;
  _QWORD v20[5];
  _QWORD aBlock[4];
  id *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = (id *)a3;
  v7 = a4;
  if (!v6 || (WeakRetained = objc_loadWeakRetained(v6 + 2), WeakRetained, !WeakRetained))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("can't perform encryption startup without an encryption delegate"));
      *(_DWORD *)buf = 136315906;
      v25 = "-[FCCKDatabaseEncryptionStartUpMiddleware performStartUpForDatabase:completion:]";
      v26 = 2080;
      v27 = "FCCKDatabaseEncryptionStartUpMiddleware.m";
      v28 = 1024;
      v29 = 54;
      v30 = 2114;
      v31 = v16;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
  }
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke;
  aBlock[3] = &unk_1E463D3F8;
  v10 = v7;
  v23 = v10;
  v11 = v6;
  v22 = v11;
  v12 = _Block_copy(aBlock);
  if (v6 && (v13 = objc_loadWeakRetained(v11 + 2), v13, v13))
  {
    v14 = FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1B90000, v14, OS_LOG_TYPE_DEFAULT, "will fetch desired private database version", buf, 2u);
    }
    v15 = objc_loadWeakRetained(v11 + 2);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_8;
    v17[3] = &unk_1E464B3B0;
    v19 = v12;
    v17[4] = self;
    v18 = v11;
    objc_msgSend(v15, "fetchDesiredVersionForDatabase:completion:", v18, v17);

  }
  else
  {
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_3;
    v20[3] = &unk_1E463B598;
    v20[4] = v12;
    __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_3((uint64_t)v20);
  }

}

uint64_t __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if (!a2)
  {
    v2 = *(_QWORD *)(a1 + 32);
    if (v2)
      *(_BYTE *)(v2 + 8) = 1;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E0CB35C8];
  v5 = *MEMORY[0x1E0CB2D50];
  v6[0] = CFSTR("Encryption startup middleware requires an encryption delegate");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "errorWithDomain:code:userInfo:", CFSTR("FCErrorDomain"), 16, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

}

void __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_8(_QWORD *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  __int128 *v21;
  id v22;
  void *v23;
  FCCKPrivateFetchRecordsOperation *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  FCCKPrivateFetchRecordsOperation *v30;
  __int128 *v31;
  id v32;
  _QWORD v33[6];
  _QWORD aBlock[5];
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  __int128 *v40;
  __int128 buf;
  void (*v42)(uint64_t, void *, void *, void *);
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  uint64_t v48;
  _QWORD v49[8];
  _QWORD v50[4];

  v50[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_2_9;
    v33[3] = &unk_1E463B790;
    v7 = a1[6];
    v33[4] = v5;
    v33[5] = v7;
    __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_2_9((uint64_t)v33);
  }
  else
  {
    v8 = (void *)FCPrivateDataEncryptionLog;
    if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      FCCKPrivateDatabaseVersionString(a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_DEFAULT, "did fetch desired private database version with result: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v12 = a1[4];
    v11 = (void *)a1[5];
    v13 = (void *)a1[6];
    v14 = v11;
    v15 = v13;
    if (v12)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      v16 = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke;
      aBlock[3] = &unk_1E464B518;
      aBlock[4] = v12;
      v17 = v14;
      v35 = v17;
      v18 = v15;
      v36 = v18;
      v19 = _Block_copy(aBlock);
      *(_QWORD *)&buf = v16;
      *((_QWORD *)&buf + 1) = 3221225472;
      v42 = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_2;
      v43 = &unk_1E464B3D8;
      v48 = a2;
      v46 = v19;
      v44 = v12;
      v20 = v17;
      v45 = v20;
      v47 = v18;
      v32 = v19;
      v21 = &buf;
      v39[0] = v16;
      v39[1] = 3221225472;
      v39[2] = __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke;
      v39[3] = &unk_1E464B428;
      v31 = v21;
      v40 = v31;
      v22 = v20;
      v23 = _Block_copy(v39);
      v24 = objc_alloc_init(FCCKPrivateFetchRecordsOperation);
      +[CKRecordID fc_staticSentinelRecordID]();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v50[0] = v25;
      +[CKRecordID fc_staticSecureSentinelRecordID]();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v50[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateFetchRecordsOperation setRecordIDs:](v24, "setRecordIDs:", v27);

      v49[0] = CFSTR("version");
      v49[1] = CFSTR("encryptionKey");
      v49[2] = CFSTR("migratedUnencryptedData");
      v49[3] = CFSTR("deletedUnencryptedData");
      v49[4] = CFSTR("migratedSubscriptions");
      v49[5] = CFSTR("deletedSubscriptions");
      v49[6] = CFSTR("encryptionKey");
      v49[7] = CFSTR("version");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 8);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateFetchRecordsOperation setDesiredKeys:](v24, "setDesiredKeys:", v28);

      -[FCCKPrivateDatabaseOperation setSkipPreflight:](v24, "setSkipPreflight:", 1);
      -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v24, "setHandleIdentityLoss:", 0);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke_2;
      v37[3] = &unk_1E463B570;
      v38 = v23;
      v29 = v23;
      -[FCCKPrivateFetchRecordsOperation setFetchRecordsCompletionBlock:](v24, "setFetchRecordsCompletionBlock:", v37);
      v30 = v24;
      -[FCOperation setQualityOfService:](v30, "setQualityOfService:", 25);
      -[FCOperation setRelativePriority:](v30, "setRelativePriority:", 2);

      -[FCCKPrivateDatabase addOperation:]((uint64_t)v22, v30);
    }

  }
}

uint64_t __80__FCCKDatabaseEncryptionStartUpMiddleware_performStartUpForDatabase_completion___block_invoke_2_9(uint64_t a1)
{
  NSObject *v2;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = FCPrivateDataEncryptionLog;
  if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_ERROR))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v4;
    _os_log_error_impl(&dword_1A1B90000, v2, OS_LOG_TYPE_ERROR, "failed to fetch desired private database version with error: %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  int v12;
  uint64_t v13;
  void *v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  FCCKSecureDatabaseResetOperation *v23;
  id v24;
  FCCKSecureDatabaseResetOperation *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void (*v36)(void);
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t v41;
  _QWORD *v42;
  id v43;
  _QWORD aBlock[4];
  id v45;
  uint64_t v46;
  id v47;

  v7 = a4;
  v8 = a1[4];
  v9 = a3;
  v10 = a2;
  v11 = v7;
  v37 = v11;
  if (!v10 || !v8)
  {

    v13 = a1[4];
LABEL_10:
    v27 = v10;
    v28 = v9;
    v29 = v37;
    v30 = v29;
    if (v13)
    {
      if (v10)
      {
        v31 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v27) == 0;
        goto LABEL_15;
      }
      if (objc_msgSend(v29, "code") == 2)
      {
        objc_msgSend(v30, "userInfo");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectForKeyedSubscript:", *MEMORY[0x1E0C94940]);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        +[CKRecordID fc_staticSentinelRecordID]();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = objc_msgSend(v35, "fc_isCKUnknownItemError");
LABEL_15:

        if (v31)
        {
          -[FCCKPrivateDatabase reportRecoverableStartUpError:](a1[5], v30);
          v36 = *(void (**)(void))(a1[6] + 16);
LABEL_19:
          v36();
          goto LABEL_20;
        }
LABEL_18:
        v36 = *(void (**)(void))(a1[6] + 16);
        goto LABEL_19;
      }
    }

    goto LABEL_18;
  }
  v12 = objc_msgSend(v11, "fc_hasIdentityLostError");

  v13 = a1[4];
  if (!v12)
    goto LABEL_10;
  v14 = (void *)a1[6];
  v15 = (id)a1[5];
  v16 = v10;
  v17 = v9;
  v18 = v14;
  if (v13)
  {
    v19 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v16);
    if (v15)
      v15[5] = v19;
    v20 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke;
    aBlock[3] = &unk_1E464B518;
    v21 = v15;
    v45 = v21;
    v46 = v13;
    v47 = v18;
    v22 = _Block_copy(aBlock);
    v23 = objc_alloc_init(FCCKSecureDatabaseResetOperation);
    -[FCCKSecureDatabaseResetOperation setDatabase:](v23, "setDatabase:", v21);
    -[FCCKSecureDatabaseResetOperation setDeleteZones:](v23, "setDeleteZones:", 1);
    -[FCCKSecureDatabaseResetOperation setRestoreSecureSentinel:](v23, "setRestoreSecureSentinel:", 0);
    -[FCCKSecureDatabaseResetOperation setRestoreZoneContents:](v23, "setRestoreZoneContents:", 0);
    v38[0] = v20;
    v38[1] = 3221225472;
    v38[2] = __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_3;
    v38[3] = &unk_1E464B568;
    v39 = v16;
    v43 = v22;
    v40 = v17;
    v41 = v13;
    v42 = v21;
    v24 = v22;
    -[FCCKSecureDatabaseResetOperation setResetCompletionHandler:](v23, "setResetCompletionHandler:", v38);
    v25 = v23;
    -[FCOperation setQualityOfService:](v25, "setQualityOfService:", 25);
    -[FCOperation setRelativePriority:](v25, "setRelativePriority:", 2);

    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addOperation:", v25);

  }
LABEL_20:

}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  _QWORD v32[5];
  id v33;
  id v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    if (v7)
    {
      v10 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        v11 = v10;
        v12 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v7);
        FCCKPrivateDatabaseVersionString(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[CKRecord fc_sentinel_deletedToDatabaseVersion]((uint64_t)v7);
        FCCKPrivateDatabaseVersionString(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v36 = v13;
        v37 = 2114;
        v38 = v15;
        _os_log_impl(&dword_1A1B90000, v11, OS_LOG_TYPE_DEFAULT, "fetched sentinel with database version=%{public}@, cleaned up to version=%{public}@", buf, 0x16u);

      }
    }
    if (*(_QWORD *)(a1 + 64))
    {
      if (!v7 || !v8 || -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v7) < *(_QWORD *)(a1 + 64))
      {
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_3_14;
        v27[3] = &unk_1E464B3D8;
        v16 = *(id *)(a1 + 48);
        v17 = *(_QWORD *)(a1 + 32);
        v18 = *(void **)(a1 + 40);
        v29 = v16;
        v27[4] = v17;
        v31 = *(_QWORD *)(a1 + 64);
        v28 = v18;
        v30 = *(id *)(a1 + 56);
        v19 = _Block_copy(v27);
        v20 = v19;
        if (v7 && v8)
          (*((void (**)(void *, id, id, _QWORD))v19 + 2))(v19, v7, v8, 0);
        else
          -[FCCKDatabaseEncryptionStartUpMiddleware _createSentinelsIfNeededForDatabase:completion:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v19);

        v24 = v29;
        goto LABEL_17;
      }
      v25 = -[CKRecord fc_sentinel_deletedToDatabaseVersion]((uint64_t)v7);
      v26 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(a1 + 40);
      if (v25 < *(_QWORD *)(a1 + 64))
      {
        v32[0] = MEMORY[0x1E0C809B0];
        v32[1] = 3221225472;
        v32[2] = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_2_13;
        v32[3] = &unk_1E464B518;
        v32[4] = v26;
        v33 = v22;
        v34 = *(id *)(a1 + 56);
        -[FCCKDatabaseEncryptionStartUpMiddleware _deleteOldDataIfDesiredWithSentinel:secureSentinel:database:completion:](v26, v7, v8, v33, v32);

        v24 = v33;
LABEL_17:

        goto LABEL_18;
      }
      v23 = *(void **)(a1 + 56);
      v21 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(void **)(a1 + 40);
      v23 = *(void **)(a1 + 56);
    }
    -[FCCKDatabaseEncryptionStartUpMiddleware _adoptSentinel:secureSentinel:forDatabase:completion:](v21, v7, v8, v22, v23);
    goto LABEL_18;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_18:

}

- (void)_adoptSentinel:(void *)a3 secureSentinel:(void *)a4 forDatabase:(void *)a5 completion:
{
  id v9;
  id v10;
  _QWORD *v11;
  void (**v12)(id, _QWORD);
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  const char *v18;
  const char *v19;
  void *v20;
  const char *v21;
  void *v22;
  SEL v23;
  int v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  if (a1)
  {
    v12 = a5;
    v13 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v9);
    if (v11)
    {
      v11[5] = v13;
      objc_setProperty_atomic(v11, v14, v9, 64);
    }
    v15 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v9);
    v16 = FCPrivateDataEncryptionLog;
    v17 = os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        v24 = 138412546;
        v25 = v9;
        v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Sentinel says migration has finished -- going online with encryption {sentinel: %@, secure sentinel: %@}", (uint8_t *)&v24, 0x16u);
      }
      -[CKRecord fc_sentinel_encryptionKey](v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_setProperty_atomic(v11, v19, v20, 48);

      -[CKRecord fc_secureSentinel_encryptionKey](v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_setProperty_atomic(v11, v21, v22, 56);

    }
    else
    {
      if (v17)
      {
        v24 = 138412546;
        v25 = v9;
        v26 = 2112;
        v27 = v10;
        _os_log_impl(&dword_1A1B90000, v16, OS_LOG_TYPE_DEFAULT, "Sentinel says migration has not finished -- going online without encryption {sentinel: %@, secure sentinel: %@}", (uint8_t *)&v24, 0x16u);
      }
      if (v11)
      {
        objc_setProperty_atomic(v11, v18, 0, 48);
        objc_setProperty_atomic(v11, v23, 0, 56);
      }
    }
    v12[2](v12, 0);

  }
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_2_13(uint64_t a1, void *a2, void *a3)
{
  -[FCCKDatabaseEncryptionStartUpMiddleware _adoptSentinel:secureSentinel:forDatabase:completion:](*(_QWORD *)(a1 + 32), a2, a3, *(void **)(a1 + 40), *(void **)(a1 + 48));
}

- (void)_deleteOldDataIfDesiredWithSentinel:(void *)a3 secureSentinel:(void *)a4 database:(void *)a5 completion:
{
  id v9;
  id v10;
  id *v11;
  id v12;
  id WeakRetained;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t v17;
  id *v18;
  id v19;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1)
  {
    if (v11)
      WeakRetained = objc_loadWeakRetained(v11 + 2);
    else
      WeakRetained = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __114__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataIfDesiredWithSentinel_secureSentinel_database_completion___block_invoke;
    v14[3] = &unk_1E464B4A0;
    v19 = v12;
    v15 = v9;
    v16 = v10;
    v17 = a1;
    v18 = v11;
    objc_msgSend(WeakRetained, "fetchCleanupToVersionForDatabase:completion:", v18, v14);

  }
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_3_14(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  void (**v8)(id, void *, void *, _QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  void *v20;
  SEL v21;
  const char *v22;
  void *v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  NSObject *v27;
  _BOOL4 v28;
  FCCKDatabaseMigrationOperation *v29;
  void *v30;
  id v31;
  const char *v32;
  FCCKDatabaseMigrationOperation *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, void *, void *);
  void *v40;
  id v41;
  uint64_t v42;
  void (**v43)(id, void *, void *, _QWORD);
  _QWORD aBlock[4];
  id v45;
  uint64_t *v46;
  _BYTE buf[24];
  void *v48;
  id v49;
  id v50;
  uint64_t v51;
  _QWORD *v52;
  id v53;
  int64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    v8 = (void (**)(id, void *, void *, _QWORD))*(id *)(a1 + 48);
    v8[2](v8, a2, a3, a4);
  }
  else
  {
    v10 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    v11 = MEMORY[0x1E0C809B0];
    v37 = MEMORY[0x1E0C809B0];
    v38 = 3221225472;
    v39 = __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_5;
    v40 = &unk_1E464B518;
    v12 = *(_QWORD *)(a1 + 64);
    v43 = (void (**)(id, void *, void *, _QWORD))*(id *)(a1 + 56);
    v13 = *(id *)(a1 + 40);
    v14 = *(_QWORD *)(a1 + 32);
    v41 = v13;
    v42 = v14;
    v15 = a2;
    v16 = a3;
    v17 = v9;
    v18 = &v37;
    if (v10)
    {
      if (-[CKRecord fc_sentinel_databaseVersion]((uint64_t)v15) >= v12)
      {
        v39((uint64_t)v18, v15, v16, 0);
      }
      else
      {
        v19 = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v15);
        if (v17)
        {
          v17[4] = v19;
          v17[5] = v12;
          -[CKRecord fc_sentinel_encryptionKey](v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(v17, v21, v20, 48);
        }
        else
        {
          -[CKRecord fc_sentinel_encryptionKey](v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }

        -[CKRecord fc_secureSentinel_encryptionKey](v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_setProperty_atomic(v17, v22, v23, 56);

        aBlock[0] = v11;
        aBlock[1] = 3221225472;
        aBlock[2] = __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_2;
        aBlock[3] = &unk_1E464B400;
        v24 = v17;
        v45 = v24;
        v25 = v18;
        v46 = v25;
        v35 = _Block_copy(aBlock);
        v26 = *(_QWORD *)(v10 + 8);
        v27 = FCPrivateDataEncryptionLog;
        v28 = os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT);
        if (v26)
        {
          if (v28)
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v15;
            _os_log_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEFAULT, "Sentinel is valid and migration is needed: %@", buf, 0xCu);
          }
          v29 = objc_alloc_init(FCCKDatabaseMigrationOperation);
          -[FCCKDatabaseMigrationOperation setDatabase:]((uint64_t)v29, v24);
          -[FCCKDatabaseMigrationOperation setMigrator:]((uint64_t)v29, *(void **)(v10 + 8));
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          *(_QWORD *)&buf[8] = 3221225472;
          *(_QWORD *)&buf[16] = __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_16;
          v48 = &unk_1E464B478;
          v30 = v35;
          v53 = v35;
          v49 = v15;
          v31 = v16;
          v54 = v12;
          v50 = v31;
          v51 = v10;
          v52 = v24;
          if (v29)
            objc_setProperty_nonatomic_copy(v29, v32, buf, 384);
          v33 = v29;
          -[FCOperation setQualityOfService:](v33, "setQualityOfService:", 25);
          -[FCOperation setRelativePriority:](v33, "setRelativePriority:", 2);

          objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "addOperation:", v33);

        }
        else
        {
          if (v28)
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v24;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v15;
            _os_log_impl(&dword_1A1B90000, v27, OS_LOG_TYPE_DEFAULT, "Sentinel is valid and migration is not needed {database: %@, sentinel: %@}", buf, 0x16u);
          }
          v33 = (FCCKDatabaseMigrationOperation *)objc_msgSend(v15, "copy", v35, v37, v38);
          -[CKRecord setFc_sentinel_databaseVersion:](v33, v12);
          -[CKRecord setFc_sentinel_deletedToDatabaseVersion:](v33, v12);
          v39((uint64_t)v25, v33, v16, 0);
          v30 = v36;
        }

      }
    }

    v8 = v43;
  }

}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__tryToStartUpDatabase_targetVersion_completion___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;

  v9 = a2;
  v7 = a3;
  v8 = a4;
  if (FCCKDatabaseStartUpResultFromError(v8) == 1)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    if (v8)
      -[FCCKPrivateDatabase reportEncryptionMigrationError:](*(_QWORD *)(a1 + 32), v8);
    -[FCCKDatabaseEncryptionStartUpMiddleware _adoptSentinel:secureSentinel:forDatabase:completion:](*(_QWORD *)(a1 + 40), v9, v7, *(void **)(a1 + 32), *(void **)(a1 + 48));
  }

}

- (void)_createSentinelsIfNeededForDatabase:(void *)a3 completion:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  FCCKPrivateSaveRecordsOperation *v15;
  void *v16;
  FCCKPrivateSaveRecordsOperation *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, void *);
  void *v21;
  id v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "fc_randomDataWithLength:", 32);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "fc_randomDataWithLength:", 32);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v7)
      v10 = v8 == 0;
    else
      v10 = 1;
    if (!v10)
    {
      v11 = objc_alloc(MEMORY[0x1E0C95048]);
      +[CKRecordID fc_staticSentinelRecordID]();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithRecordType:recordID:", CFSTR("Sentinel"), v12);

      -[CKRecord setFc_sentinel_encryptionKey:](v13, v7);
      -[CKRecord setFc_sentinel_version:](v13, 1);
      +[CKRecord secureSentinelRecordWithEncryptionKey:](MEMORY[0x1E0C95048], v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
      v23[0] = v13;
      v23[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[FCCKPrivateSaveRecordsOperation setRecordsToSave:](v15, "setRecordsToSave:", v16);

      -[FCCKPrivateSaveRecordsOperation setSavePolicy:](v15, "setSavePolicy:", 0);
      -[FCCKPrivateDatabaseOperation setSkipPreflight:](v15, "setSkipPreflight:", 1);
      -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v15, "setHandleIdentityLoss:", 0);
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __90__FCCKDatabaseEncryptionStartUpMiddleware__createSentinelsIfNeededForDatabase_completion___block_invoke;
      v21 = &unk_1E4644930;
      v22 = v6;
      -[FCCKPrivateSaveRecordsOperation setSaveRecordsCompletionBlock:](v15, "setSaveRecordsCompletionBlock:", &v18);
      v17 = v15;
      -[FCOperation setQualityOfService:](v17, "setQualityOfService:", 25, v18, v19, v20, v21);
      -[FCOperation setRelativePriority:](v17, "setRelativePriority:", 2);

      -[FCCKPrivateDatabase addOperation:]((uint64_t)v5, v17);
    }

  }
}

void __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v15 = a2;
  if (v7)
    *(_QWORD *)(v7 + 32) = 0;
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    *(_QWORD *)(v11 + 40) = 0;
    v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_setProperty_atomic(v12, v10, 0, 48);
      v14 = *(void **)(a1 + 32);
      if (v14)
        objc_setProperty_atomic(v14, v13, 0, 56);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_16(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v5;
  FCCKPrivateSaveRecordsOperation *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (a4)
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    -[CKRecord setFc_sentinel_databaseVersion:](v5, *(_QWORD *)(a1 + 72));
    v6 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    v16[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateSaveRecordsOperation setRecordsToSave:](v6, "setRecordsToSave:", v7);

    -[FCCKPrivateSaveRecordsOperation setSavePolicy:](v6, "setSavePolicy:", 1);
    -[FCCKPrivateDatabaseOperation setSkipPreflight:](v6, "setSkipPreflight:", 1);
    -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v6, "setHandleIdentityLoss:", 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_2_19;
    v10[3] = &unk_1E464B450;
    v8 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 48);
    v11 = v5;
    v12 = v8;
    v13 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    v14 = *(id *)(a1 + 32);
    v9 = v5;
    -[FCCKPrivateSaveRecordsOperation setSaveRecordsCompletionBlock:](v6, "setSaveRecordsCompletionBlock:", v10);
    -[FCCKDatabaseEncryptionStartUpMiddleware _associateChildOperation:](*(_QWORD *)(a1 + 48), v6);
    -[FCCKPrivateDatabase addOperation:](*(_QWORD *)(a1 + 56), v6);

  }
}

void __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_2_19(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  if (objc_msgSend(a2, "count") == 1)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(a1 + 48);
    v9 = *(void **)(a1 + 56);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_3;
    v10[3] = &unk_1E464B428;
    v11 = *(id *)(a1 + 72);
    -[FCCKDatabaseEncryptionStartUpMiddleware _deleteOldDataIfDesiredWithSentinel:secureSentinel:database:completion:](v6, v7, v8, v9, v10);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  }

}

uint64_t __105__FCCKDatabaseEncryptionStartUpMiddleware__migrateToVersion_sentinel_secureSentinel_database_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_associateChildOperation:(uint64_t)a1
{
  id v2;

  if (a1)
  {
    v2 = a2;
    objc_msgSend(v2, "setQualityOfService:", 25);
    objc_msgSend(v2, "setRelativePriority:", 2);

  }
}

void __114__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataIfDesiredWithSentinel_secureSentinel_database_completion___block_invoke(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  void (*v8)(_QWORD *, id, uint64_t, uint64_t);
  id v9;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  SEL v22;
  const char *v23;
  void *v24;
  _QWORD *v25;
  NSObject *v26;
  id v27;
  void *v28;
  FCCKPrivateDeleteRecordZonesOperation *v29;
  FCCKPrivateDeleteRecordZonesOperation *v30;
  void *v31;
  id v32;
  void *v33;
  FCCKPrivateBatchedDeleteRecordsOperation *v34;
  FCCKPrivateBatchedDeleteRecordsOperation *v35;
  void *v36;
  NSObject *v37;
  id v38;
  id v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  id v46;
  _QWORD *v47;
  id v48;
  _QWORD v49[4];
  NSObject *v50;
  _QWORD *v51;
  _QWORD v52[4];
  NSObject *v53;
  _QWORD *v54;
  _QWORD v55[5];
  id v56;
  _QWORD v57[5];
  id v58;
  _QWORD aBlock[4];
  id v60;
  id v61;
  __int128 block;
  void (*v63)(uint64_t);
  void *v64;
  id v65;
  id v66;
  uint64_t v67;
  _QWORD *v68;
  id v69;
  _QWORD *v70;
  _QWORD *v71;
  uint64_t v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (_QWORD *)a1[8];
    v7 = (void *)a1[4];
    v6 = a1[5];
    v8 = (void (*)(_QWORD *, id, uint64_t, uint64_t))v5[2];
    v47 = v5;
    v9 = v7;
    v8(v47, v9, v6, a3);

  }
  else
  {
    v11 = -[CKRecord fc_sentinel_databaseVersion](a1[4]);
    if (a2 >= v11)
      v12 = v11;
    else
      v12 = a2;
    if (-[CKRecord fc_sentinel_deletedToDatabaseVersion](a1[4]) >= v12)
    {
      v40 = (void *)FCPrivateDataEncryptionLog;
      if (os_log_type_enabled((os_log_t)FCPrivateDataEncryptionLog, OS_LOG_TYPE_DEFAULT))
      {
        v41 = a1[4];
        v42 = v40;
        v43 = -[CKRecord fc_sentinel_deletedToDatabaseVersion](v41);
        FCCKPrivateDatabaseVersionString(v43);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(block) = 138543362;
        *(_QWORD *)((char *)&block + 4) = v44;
        _os_log_impl(&dword_1A1B90000, v42, OS_LOG_TYPE_DEFAULT, "Data cleanup is unnecessary because we've cleaned up to version=%{public}@", (uint8_t *)&block, 0xCu);

      }
      (*(void (**)(void))(a1[8] + 16))();
    }
    else
    {
      v13 = (void *)a1[5];
      v15 = a1[6];
      v14 = (void *)a1[7];
      v16 = (void *)a1[8];
      v17 = (id)a1[4];
      v48 = v13;
      v18 = v14;
      v46 = v16;
      if (v15)
      {
        v19 = -[CKRecord fc_sentinel_deletedToDatabaseVersion]((uint64_t)v17);
        v20 = -[CKRecord fc_sentinel_deletedToDatabaseVersion]((uint64_t)v17);
        if (v18)
        {
          v18[4] = v20;
          v18[5] = -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v17);
          -[CKRecord fc_sentinel_encryptionKey](v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_setProperty_atomic(v18, v22, v21, 48);
        }
        else
        {
          -[CKRecord fc_sentinel_databaseVersion]((uint64_t)v17);
          -[CKRecord fc_sentinel_encryptionKey](v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }

        -[CKRecord fc_secureSentinel_encryptionKey](v48);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_setProperty_atomic(v18, v23, v24, 56);

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke;
        aBlock[3] = &unk_1E464B400;
        v25 = v18;
        v60 = v25;
        v61 = v46;
        v45 = _Block_copy(aBlock);
        v57[0] = 0;
        v57[1] = v57;
        v57[2] = 0x3032000000;
        v57[3] = __Block_byref_object_copy__90;
        v57[4] = __Block_byref_object_dispose__90;
        v58 = 0;
        v55[0] = 0;
        v55[1] = v55;
        v55[2] = 0x3032000000;
        v55[3] = __Block_byref_object_copy__90;
        v55[4] = __Block_byref_object_dispose__90;
        v56 = 0;
        v26 = dispatch_group_create();
        v27 = *(id *)(v15 + 8);
        FCCKDatabaseZoneIDsToDeleteAfterMigration(v19, v12, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v28, "count"))
        {
          v29 = objc_alloc_init(FCCKPrivateDeleteRecordZonesOperation);
          -[FCCKPrivateDatabaseOperation setDatabase:](v29, "setDatabase:", v25);
          -[FCCKPrivateDeleteRecordZonesOperation setRecordZoneIDsToDelete:](v29, "setRecordZoneIDsToDelete:", v28);
          -[FCCKPrivateDatabaseOperation setSkipPreflight:](v29, "setSkipPreflight:", 1);
          -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v29, "setHandleIdentityLoss:", 0);
          dispatch_group_enter(v26);
          v52[0] = MEMORY[0x1E0C809B0];
          v52[1] = 3221225472;
          v52[2] = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_24;
          v52[3] = &unk_1E464B4C8;
          v54 = v57;
          v53 = v26;
          -[FCCKPrivateDeleteRecordZonesOperation setDeleteRecordZonesCompletionBlock:](v29, "setDeleteRecordZonesCompletionBlock:", v52);
          v30 = v29;
          -[FCOperation setQualityOfService:](v30, "setQualityOfService:", 25);
          -[FCOperation setRelativePriority:](v30, "setRelativePriority:", 2);

          objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addOperation:", v30);

        }
        v32 = *(id *)(v15 + 8);
        FCCKDatabaseRecordIDsToDeleteAfterMigration(v19, v12, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v33, "count"))
        {
          v34 = objc_alloc_init(FCCKPrivateBatchedDeleteRecordsOperation);
          -[FCCKPrivateBatchedDeleteRecordsOperation setDatabase:](v34, "setDatabase:", v25);
          -[FCCKPrivateBatchedDeleteRecordsOperation setRecordIDsToDelete:](v34, "setRecordIDsToDelete:", v33);
          -[FCCKPrivateBatchedDeleteRecordsOperation setSkipPreflight:](v34, "setSkipPreflight:", 1);
          -[FCCKPrivateBatchedDeleteRecordsOperation setHandleIdentityLoss:](v34, "setHandleIdentityLoss:", 0);
          dispatch_group_enter(v26);
          v49[0] = MEMORY[0x1E0C809B0];
          v49[1] = 3221225472;
          v49[2] = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_2;
          v49[3] = &unk_1E464B4C8;
          v51 = v55;
          v50 = v26;
          -[FCCKPrivateBatchedDeleteRecordsOperation setDeleteRecordsCompletionBlock:](v34, "setDeleteRecordsCompletionBlock:", v49);
          v35 = v34;
          -[FCOperation setQualityOfService:](v35, "setQualityOfService:", 25);
          -[FCOperation setRelativePriority:](v35, "setRelativePriority:", 2);

          objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addOperation:", v35);

        }
        dispatch_get_global_queue(25, 0);
        v37 = objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&block = MEMORY[0x1E0C809B0];
        *((_QWORD *)&block + 1) = 3221225472;
        v63 = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_3;
        v64 = &unk_1E464B4F0;
        v70 = v57;
        v71 = v55;
        v38 = v17;
        v72 = v12;
        v65 = v38;
        v69 = v45;
        v66 = v48;
        v67 = v15;
        v68 = v25;
        v39 = v45;
        dispatch_group_notify(v26, v37, &block);

        _Block_object_dispose(v55, 8);
        _Block_object_dispose(v57, 8);

      }
    }
  }
}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v7;
  id v8;
  id v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  void *v14;
  id v15;

  v7 = *(_QWORD *)(a1 + 32);
  v8 = a4;
  v9 = a3;
  v15 = a2;
  if (v7)
    *(_QWORD *)(v7 + 32) = 0;
  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
  {
    *(_QWORD *)(v11 + 40) = 0;
    v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_setProperty_atomic(v12, v10, 0, 48);
      v14 = *(void **)(a1 + 32);
      if (v14)
        objc_setProperty_atomic(v14, v13, 0, 56);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_24(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_2(uint64_t a1, int a2, id obj)
{
  id v5;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), obj);
  v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));

}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  FCCKPrivateSaveRecordsOperation *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  if (v2 && !objc_msgSend(v2, "fc_isCKUnknownItemError")
    || (v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40)) != 0
    && !objc_msgSend(v3, "fc_isCKUnknownItemError"))
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
    if (!v7)
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
    v8 = *(_QWORD *)(a1 + 56);
    v9 = v7;
    -[FCCKPrivateDatabase reportPostMigrationCleanupError:](v8, v9);
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

  }
  else
  {
    v4 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
    -[CKRecord setFc_sentinel_deletedToDatabaseVersion:](v4, *(_QWORD *)(a1 + 88));
    v5 = objc_alloc_init(FCCKPrivateSaveRecordsOperation);
    v14[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCCKPrivateSaveRecordsOperation setRecordsToSave:](v5, "setRecordsToSave:", v6);

    -[FCCKPrivateSaveRecordsOperation setSavePolicy:](v5, "setSavePolicy:", 1);
    -[FCCKPrivateDatabaseOperation setSkipPreflight:](v5, "setSkipPreflight:", 1);
    -[FCCKPrivateDatabaseOperation setHandleIdentityLoss:](v5, "setHandleIdentityLoss:", 0);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_4;
    v10[3] = &unk_1E463D7F8;
    v13 = *(id *)(a1 + 64);
    v11 = *(id *)(a1 + 40);
    v12 = *(id *)(a1 + 32);
    -[FCCKPrivateSaveRecordsOperation setSaveRecordsCompletionBlock:](v5, "setSaveRecordsCompletionBlock:", v10);
    -[FCCKDatabaseEncryptionStartUpMiddleware _associateChildOperation:](*(_QWORD *)(a1 + 48), v5);
    -[FCCKPrivateDatabase addOperation:](*(_QWORD *)(a1 + 56), v5);

  }
}

void __113__FCCKDatabaseEncryptionStartUpMiddleware__deleteOldDataUpToVersion_sentinel_secureSentinel_database_completion___block_invoke_4(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = objc_msgSend(v9, "count");
  v7 = a1[6];
  if (v6 == 1)
  {
    objc_msgSend(v9, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD, _QWORD))(v7 + 16))(v7, v8, a1[4], 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, id))(v7 + 16))(a1[6], a1[5], a1[4], v5);
  }

}

uint64_t __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v11 = a3;
  v5 = a2;
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fc_firstObjectPassingTest:", &__block_literal_global_189);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "fc_firstObjectPassingTest:", &__block_literal_global_29_3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && v9)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    if (objc_msgSend(v11, "fc_isCKUnknownItemError"))
      v10 = 0;
    else
      v10 = v11;
    (*(void (**)(_QWORD, void *, void *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v7, v9, v10);
  }

}

uint64_t __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Sentinel"));

  return v3;
}

uint64_t __82__FCCKDatabaseEncryptionStartUpMiddleware__fetchSentinelsWithDatabase_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SentinelSecure"));

  return v3;
}

void __90__FCCKDatabaseEncryptionStartUpMiddleware__createSentinelsIfNeededForDatabase_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  v5 = a2;
  objc_msgSend(v5, "fc_firstObjectPassingTest:", &__block_literal_global_33_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fc_firstObjectPassingTest:", &__block_literal_global_34_2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v11 = *MEMORY[0x1E0C949B8];
    +[CKRecordID fc_staticSentinelRecordID]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fc_underlyingCKErrorUserInfoValueForKey:forItemID:", v11, v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      goto LABEL_3;
LABEL_9:
    v13 = *MEMORY[0x1E0C949B8];
    +[CKRecordID fc_staticSecureSentinelRecordID]();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fc_underlyingCKErrorUserInfoValueForKey:forItemID:", v13, v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_3;
  }
  if (!v7)
    goto LABEL_9;
LABEL_3:
  if (v6 && v7)
  {
    v8 = v6;
    v9 = v7;
    v10 = 0;
  }
  else
  {
    v8 = v6;
    v9 = v7;
    v10 = v15;
  }
  (*(void (**)(_QWORD, void *, void *, id))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), v8, v9, v10);

}

uint64_t __90__FCCKDatabaseEncryptionStartUpMiddleware__createSentinelsIfNeededForDatabase_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("Sentinel"));

  return v3;
}

uint64_t __90__FCCKDatabaseEncryptionStartUpMiddleware__createSentinelsIfNeededForDatabase_completion___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "recordType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SentinelSecure"));

  return v3;
}

void __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  const char *v8;
  id v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  id v14;

  v14 = a2;
  v7 = a3;
  v9 = a4;
  v10 = *(_QWORD *)(a1 + 32);
  if (v10)
  {
    *(_QWORD *)(v10 + 40) = 0;
    v11 = *(void **)(a1 + 32);
    if (v11)
    {
      objc_setProperty_atomic(v11, v8, 0, 48);
      v13 = *(void **)(a1 + 32);
      if (v13)
        objc_setProperty_atomic(v13, v12, 0, 56);
    }
  }
  if (v7 || !-[CKRecord fc_sentinel_databaseVersion]((uint64_t)v14))
    -[FCCKDatabaseEncryptionStartUpMiddleware _adoptSentinel:secureSentinel:forDatabase:completion:](*(_QWORD *)(a1 + 40), v14, v7, *(void **)(a1 + 32), *(void **)(a1 + 48));
  else
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;

  v3 = a2;
  if (-[CKRecord fc_sentinel_databaseVersion](*(_QWORD *)(a1 + 32)))
  {
    v5 = *(_QWORD *)(a1 + 48);
    v4 = *(void **)(a1 + 56);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_4;
    v7[3] = &unk_1E464B518;
    v8 = v4;
    v6 = *(id *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 48);
    v10 = v6;
    -[FCCKDatabaseEncryptionStartUpMiddleware _createSentinelsIfNeededForDatabase:completion:](v5, v8, v7);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }

}

void __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  const char *v11;
  void *v12;
  void *v13;
  FCCKSecureDatabaseResetOperation *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5 && v6)
  {
    -[CKRecord fc_sentinel_encryptionKey](v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    if (v10)
      objc_setProperty_atomic(v10, v8, v9, 48);

    -[CKRecord fc_secureSentinel_encryptionKey](v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(void **)(a1 + 32);
    if (v13)
      objc_setProperty_atomic(v13, v11, v12, 56);

    v14 = objc_alloc_init(FCCKSecureDatabaseResetOperation);
    -[FCCKSecureDatabaseResetOperation setDatabase:](v14, "setDatabase:", *(_QWORD *)(a1 + 32));
    -[FCCKSecureDatabaseResetOperation setDeleteZones:](v14, "setDeleteZones:", 0);
    -[FCCKSecureDatabaseResetOperation setRestoreSecureSentinel:](v14, "setRestoreSecureSentinel:", 0);
    -[FCCKSecureDatabaseResetOperation setRestoreZoneContents:](v14, "setRestoreZoneContents:", 1);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_5;
    v16[3] = &unk_1E464B540;
    v19 = *(id *)(a1 + 48);
    v17 = v5;
    v18 = v7;
    -[FCCKSecureDatabaseResetOperation setResetCompletionHandler:](v14, "setResetCompletionHandler:", v16);
    -[FCCKDatabaseEncryptionStartUpMiddleware _associateChildOperation:](*(_QWORD *)(a1 + 40), v14);
    objc_msgSend(MEMORY[0x1E0CB3828], "fc_sharedConcurrentQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addOperation:", v14);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __110__FCCKDatabaseEncryptionStartUpMiddleware__handleIdentityLossWithDatabase_sentinel_secureSentinel_completion___block_invoke_5(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encryptionMigrator, 0);
}

@end
