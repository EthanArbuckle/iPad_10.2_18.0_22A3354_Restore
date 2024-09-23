@implementation AKTokenManager

+ (AKTokenManager)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_42);
  return (AKTokenManager *)(id)sharedInstance_sharedInstance_3;
}

void __32__AKTokenManager_sharedInstance__block_invoke()
{
  AKTokenManager *v0;
  void *v1;

  v0 = objc_alloc_init(AKTokenManager);
  v1 = (void *)sharedInstance_sharedInstance_3;
  sharedInstance_sharedInstance_3 = (uint64_t)v0;

}

- (AKTokenManager)init
{
  AKTokenManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *tokenManagerQueue;
  uint64_t v6;
  AAFKeychainManager *keychainManager;
  uint64_t v8;
  NSMutableDictionary *tokenCache;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AKTokenManager;
  v2 = -[AKTokenManager init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.authkit.AKTokenManagerQueue", v3);
    tokenManagerQueue = v2->_tokenManagerQueue;
    v2->_tokenManagerQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = (AAFKeychainManager *)v6;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    tokenCache = v2->_tokenCache;
    v2->_tokenCache = (NSMutableDictionary *)v8;

  }
  return v2;
}

- (BOOL)updateToken:(id)a3 identifier:(id)a4 altDSID:(id)a5 account:(id)a6 credential:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  NSObject *tokenManagerQueue;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  id *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  _AKLogSystem();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:].cold.3();

  if (v15 && v16)
  {
    if (v14)
    {
      v33 = 0;
      v34 = &v33;
      v35 = 0x3032000000;
      v36 = __Block_byref_object_copy__13;
      v37 = __Block_byref_object_dispose__13;
      v38 = 0;
      tokenManagerQueue = self->_tokenManagerQueue;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __74__AKTokenManager_updateToken_identifier_altDSID_account_credential_error___block_invoke;
      v25[3] = &unk_1E2E61260;
      v25[4] = self;
      v26 = v14;
      v27 = v15;
      v28 = v16;
      v31 = &v33;
      v32 = a8;
      v29 = v17;
      v30 = v18;
      dispatch_sync(tokenManagerQueue, v25);
      v21 = v34[5] == 0;

      _Block_object_dispose(&v33, 8);
    }
    else
    {
      _AKLogSystem();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:].cold.2();

      v21 = -[AKTokenManager _deleteTokenWithIdentifer:altDSID:account:credential:error:](self, "_deleteTokenWithIdentifer:altDSID:account:credential:error:", v15, v16, v17, v18, a8);
    }
  }
  else
  {
    _AKLogSystem();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      -[AKTokenManager updateToken:identifier:altDSID:account:credential:error:].cold.1();

    v21 = 0;
  }

  return v21;
}

void __74__AKTokenManager_updateToken_identifier_altDSID_account_credential_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "_updateCacheWithToken:identifier:altDSID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  obj = *(id *)(v6 + 40);
  objc_msgSend(v2, "_updateKeychainWithToken:identifier:altDSID:error:", v3, v4, v5, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40);
  if (v7 && *(_QWORD *)(a1 + 88))
    **(_QWORD **)(a1 + 88) = objc_retainAutorelease(v7);
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setToken:tokenID:account:credential:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));

}

- (BOOL)deleteTokenFromCacheWithIdentifer:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  return -[AKTokenManager _deleteTokenWithIdentifer:altDSID:account:credential:error:](self, "_deleteTokenWithIdentifer:altDSID:account:credential:error:", a3, a4, 0, 0, a5);
}

- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 error:(id *)a6
{
  return -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:](self, "tokenWithIdentifier:altDSID:forAccount:shouldSync:error:", a3, a4, a5, 0, a6);
}

- (id)tokenWithIdentifier:(id)a3 altDSID:(id)a4 forAccount:(id)a5 shouldSync:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *tokenManagerQueue;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  _QWORD block[5];
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  uint64_t *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  id *v35;
  BOOL v36;
  _QWORD v37[3];
  char v38;
  _QWORD v39[3];
  char v40;
  _QWORD v41[3];
  char v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _QWORD v49[5];
  id v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[5];
  id v54;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  _AKLogSystem();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:].cold.4();

  if (!v12)
  {
    _AKLogSystem();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:].cold.1();

    if (a7)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = -7009;
LABEL_16:
      objc_msgSend(v21, "ak_errorWithCode:", v22);
      v19 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_17:
    v19 = 0;
    goto LABEL_18;
  }
  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
  if (!v13)
  {
    if (v17)
      -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:].cold.2();

    if (a7)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = -7025;
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v17)
    -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:].cold.3();

  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__13;
  v53[4] = __Block_byref_object_dispose__13;
  v54 = 0;
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x3032000000;
  v51[3] = __Block_byref_object_copy__13;
  v51[4] = __Block_byref_object_dispose__13;
  v52 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__13;
  v49[4] = __Block_byref_object_dispose__13;
  v50 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__13;
  v47 = __Block_byref_object_dispose__13;
  v48 = 0;
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v38 = 0;
  tokenManagerQueue = self->_tokenManagerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke;
  block[3] = &unk_1E2E61288;
  v28 = v53;
  block[4] = self;
  v25 = v12;
  v26 = v13;
  v29 = &v43;
  v30 = v41;
  v31 = v51;
  v32 = v39;
  v35 = a7;
  v27 = v14;
  v33 = v49;
  v34 = v37;
  v36 = a6;
  dispatch_sync(tokenManagerQueue, block);
  v19 = (id)v44[5];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(v51, 8);

  _Block_object_dispose(v53, 8);
LABEL_18:

  return v19;
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;

  objc_msgSend(*(id *)(a1 + 32), "_fetchTokenFromCacheWithIdentifier:altDSID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    _AKLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_9();

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "_fetchTokenFromKeychainWithIdentifier:altDSID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 120));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40);
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v9)
  {
    if (v11)
      __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_8();

    +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isTokenCreationTimeEnabled");

    if (v13)
    {
      v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
      if (!v14)
        goto LABEL_13;
      objc_msgSend(v14, "creationDate");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!v15)
        goto LABEL_13;
      v16 = (void *)v15;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "creationDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "creationDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "compare:", v18);

      if (v19 != 1)
      {
        v21 = *(_QWORD *)(a1 + 96);
      }
      else
      {
LABEL_13:
        _AKLogSystem();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_7();

        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
        v21 = *(_QWORD *)(a1 + 80);
      }
      *(_BYTE *)(*(_QWORD *)(v21 + 8) + 24) = 1;
    }
    else
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40));
    }
  }
  else
  {
    if (v11)
      __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_6();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = 1;
    if (*(_QWORD *)(a1 + 120))
    {
      _AKLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_5(a1 + 120, v22, v23, v24, v25, v26, v27, v28);

    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_tokenWithName:forAccount:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 120));
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = v30;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40))
    {
      _AKLogSystem();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_4();

      +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "isTokenCreationTimeEnabled");

      if (v35)
      {
        +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "tokenCreationDateWithIdentifier:forAccount:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), 0);
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        v38 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
        if (!v38)
          goto LABEL_33;
        if (v37)
        {
          objc_msgSend(v38, "creationDate");
          v39 = objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            v40 = (void *)v39;
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "creationDate");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = objc_msgSend(v37, "compare:", v41);

            if (v42 == 1)
            {
LABEL_33:
              _AKLogSystem();
              v43 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
                __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_2();

              +[AKToken tokenWithValue:lifetime:](AKToken, "tokenWithValue:lifetime:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), 0);
              v44 = objc_claimAutoreleasedReturnValue();
              v45 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
              v46 = *(void **)(v45 + 40);
              *(_QWORD *)(v45 + 40) = v44;

            }
          }
        }

      }
      else
      {
        _AKLogSystem();
        v47 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
          __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_3();

        +[AKToken tokenWithValue:lifetime:](AKToken, "tokenWithValue:lifetime:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), 0);
        v48 = objc_claimAutoreleasedReturnValue();
        v49 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        v50 = *(void **)(v49 + 40);
        *(_QWORD *)(v49 + 40) = v48;

      }
    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = 1;
    }
  }
  if (*(_BYTE *)(a1 + 128) && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40))
  {
    _AKLogSystem();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_1((_QWORD *)a1, v51);

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "_updateCacheWithToken:identifier:altDSID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24))
      objc_msgSend(*(id *)(a1 + 32), "_updateKeychainWithToken:identifier:altDSID:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 120));
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
    {
      +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
      v54 = *(_QWORD *)(a1 + 40);
      v55 = *(void **)(a1 + 56);
      objc_msgSend(v55, "credentialWithError:", *(_QWORD *)(a1 + 120));
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "setToken:tokenID:account:credential:", v53, v54, v55, v56);

    }
  }
}

- (BOOL)synchronizeTokensForAltDSID:(id)a3 account:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  id v12;
  id v13;

  v8 = a3;
  v9 = a4;
  v10 = 1;
  v11 = -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:](self, "tokenWithIdentifier:altDSID:forAccount:shouldSync:error:", *MEMORY[0x1E0C8F198], v8, v9, 1, a5);
  v12 = -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:](self, "tokenWithIdentifier:altDSID:forAccount:shouldSync:error:", *MEMORY[0x1E0C8F230], v8, v9, 1, a5);
  v13 = -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:shouldSync:error:](self, "tokenWithIdentifier:altDSID:forAccount:shouldSync:error:", *MEMORY[0x1E0C8F200], v8, v9, 1, a5);
  if (a5)
    v10 = *a5 == 0;

  return v10;
}

- (BOOL)synchronizeTokensForAllAccounts:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allAuthKitAccounts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v20;
    *(_QWORD *)&v8 = 138412290;
    v18 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v5, "altDSIDForAccount:", v12, v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length")
          && !-[AKTokenManager synchronizeTokensForAltDSID:account:error:](self, "synchronizeTokensForAltDSID:account:error:", v13, v12, a3))
        {
          _AKLogSystem();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
          {
            v15 = *a3;
            *(_DWORD *)buf = v18;
            v24 = v15;
            _os_log_debug_impl(&dword_19202F000, v14, OS_LOG_TYPE_DEBUG, "AKTokenManager sync hit an error: %@.", buf, 0xCu);
          }

        }
      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v9);
  }
  if (a3)
    v16 = *a3 == 0;
  else
    v16 = 1;

  return v16;
}

- (id)_tokenKeychainDescriptorForIdentifier:(id)a3 altDSID:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = (objc_class *)MEMORY[0x1E0CF0EA0];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setItemClass:", 1);
  objc_msgSend(v8, "setItemAccessible:", 2);
  objc_msgSend(v8, "setInvisible:", 2);
  objc_msgSend(v8, "setSynchronizable:", 1);
  objc_msgSend(v8, "setUseDataProtection:", 2);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.authkit.tokenManager"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setService:", v9);
  objc_msgSend(v8, "setAccount:", v7);

  objc_msgSend(v8, "setLabel:", v6);
  _AKLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[AKTokenManager _tokenKeychainDescriptorForIdentifier:altDSID:].cold.1((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);

  return v8;
}

- (BOOL)_updateKeychainWithToken:(id)a3 identifier:(id)a4 altDSID:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  AAFKeychainManager *keychainManager;
  id v19;
  BOOL v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  id v30;
  id v31;

  v10 = a4;
  v11 = a5;
  v12 = a3;
  _AKLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[AKTokenManager _updateKeychainWithToken:identifier:altDSID:error:].cold.3();

  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v12, 1, &v31);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v31;
  if (v14)
  {
    -[AKTokenManager _tokenKeychainDescriptorForIdentifier:altDSID:](self, "_tokenKeychainDescriptorForIdentifier:altDSID:", v10, v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF0E98]), "initWithDescriptor:value:", v16, v14);
    keychainManager = self->_keychainManager;
    v30 = 0;
    -[AAFKeychainManager addOrUpdateKeychainItem:error:](keychainManager, "addOrUpdateKeychainItem:error:", v17, &v30);
    v19 = v30;
    v20 = v19 == 0;
    if (v19)
    {
      _AKLogSystem();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        -[AKTokenManager _updateKeychainWithToken:identifier:altDSID:error:].cold.2((uint64_t)v19, v21, v22, v23, v24, v25, v26, v27);

      if (a6)
        *a6 = objc_retainAutorelease(v19);
    }

  }
  else
  {
    _AKLogSystem();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      -[AKTokenManager _updateKeychainWithToken:identifier:altDSID:error:].cold.1();

    v20 = 0;
    if (a6)
      *a6 = objc_retainAutorelease(v15);
  }

  return v20;
}

- (BOOL)_updateCacheWithToken:(id)a3 identifier:(id)a4 altDSID:(id)a5
{
  id v8;
  NSMutableDictionary *tokenCache;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  tokenCache = self->_tokenCache;
  v10 = a4;
  v11 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](tokenCache, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokenCache, "setObject:forKeyedSubscript:", v13, v8);

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenCache, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setObject:forKeyedSubscript:", v11, v10);

  return 1;
}

- (id)_fetchTokenFromKeychainWithIdentifier:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  void *v7;
  AAFKeychainManager *keychainManager;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v19;
  id v20;

  -[AKTokenManager _tokenKeychainDescriptorForIdentifier:altDSID:](self, "_tokenKeychainDescriptorForIdentifier:altDSID:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  keychainManager = self->_keychainManager;
  v20 = 0;
  -[AAFKeychainManager keychainItemForDescriptor:error:](keychainManager, "keychainItemForDescriptor:error:", v7, &v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v20;
  objc_msgSend(v9, "value");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "code") == -25300
    && (objc_msgSend(v10, "domain"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB2F90]),
        v12,
        v13))
  {
    _AKLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[AKTokenManager _fetchTokenFromKeychainWithIdentifier:altDSID:error:].cold.1();
    v15 = 0;
  }
  else
  {
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v19);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v19;
    v14 = v17;
    if (v11)
    {
      v15 = v16;
    }
    else
    {
      v15 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v17);
    }

  }
  return v15;
}

- (id)_fetchTokenFromCacheWithIdentifier:(id)a3 altDSID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenCache, "objectForKeyedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AKTokenManager _fetchTokenFromCacheWithIdentifier:altDSID:].cold.2((uint64_t)v9, v10, v11, v12, v13, v14, v15, v16);
  }
  else
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AKTokenManager _fetchTokenFromCacheWithIdentifier:altDSID:].cold.1();
    v9 = 0;
  }

  return v9;
}

- (BOOL)_deleteTokenWithIdentifer:(id)a3 altDSID:(id)a4 account:(id)a5 credential:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *tokenManagerQueue;
  BOOL v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  _QWORD *v32;
  id *v33;
  _QWORD v34[5];
  id v35;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  _AKLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[AKTokenManager _deleteTokenWithIdentifer:altDSID:account:credential:error:].cold.3();

  if (v13)
  {
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x3032000000;
    v34[3] = __Block_byref_object_copy__13;
    v34[4] = __Block_byref_object_dispose__13;
    v35 = v14;
    tokenManagerQueue = self->_tokenManagerQueue;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __77__AKTokenManager__deleteTokenWithIdentifer_altDSID_account_credential_error___block_invoke;
    v28[3] = &unk_1E2E612B0;
    v28[4] = self;
    v29 = v12;
    v32 = v34;
    v33 = a7;
    v30 = v13;
    v31 = v15;
    dispatch_sync(tokenManagerQueue, v28);
    v18 = a7 == 0;
    if (a7)
    {
      _AKLogSystem();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[AKTokenManager _deleteTokenWithIdentifer:altDSID:account:credential:error:].cold.2((uint64_t)a7, v19, v20, v21, v22, v23, v24, v25);

    }
    _Block_object_dispose(v34, 8);

  }
  else
  {
    _AKLogSystem();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[AKTokenManager _deleteTokenWithIdentifer:altDSID:account:credential:error:].cold.1();

    v18 = 0;
  }

  return v18;
}

void __77__AKTokenManager__deleteTokenWithIdentifer_altDSID_account_credential_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_deleteTokenFromCacheWithIdentifer:altDSID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "_deleteTokenFromKeychainWithIdentifer:altDSID:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    _AKLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __77__AKTokenManager__deleteTokenWithIdentifer_altDSID_account_credential_error___block_invoke_cold_1();

    +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setToken:tokenID:account:credential:", 0, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 56));

  }
}

- (BOOL)_deleteTokenFromKeychainWithIdentifer:(id)a3 altDSID:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AKTokenManager _deleteTokenFromKeychainWithIdentifer:altDSID:error:].cold.2();

  }
  -[AKTokenManager _tokenKeychainDescriptorForIdentifier:altDSID:](self, "_tokenKeychainDescriptorForIdentifier:altDSID:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAFKeychainManager deleteKeychainItemsForDescriptor:error:](self->_keychainManager, "deleteKeychainItemsForDescriptor:error:", v11, a5);
  if (a5)
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[AKTokenManager _deleteTokenFromKeychainWithIdentifer:altDSID:error:].cold.1((uint64_t)a5, v12, v13, v14, v15, v16, v17, v18);

  }
  return a5 == 0;
}

- (BOOL)_deleteTokenFromCacheWithIdentifer:(id)a3 altDSID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenCache, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](self->_tokenCache, "objectForKeyedSubscript:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", 0, v6);

    }
  }
  else
  {
    _AKLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[AKTokenManager _deleteTokenFromCacheWithIdentifer:altDSID:].cold.1();

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_tokenCache, "setObject:forKeyedSubscript:", 0, v7);
  }

  return 1;
}

- (id)synchronizedCredentialForAccount:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v4 = a3;
  _AKLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[AKTokenManager synchronizedCredentialForAccount:].cold.1();

  v20 = 0;
  objc_msgSend(v4, "credentialWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isTokenCacheEnabled");

  if (v9 && v6)
  {
    objc_msgSend(v4, "accountPropertyForKey:", CFSTR("altDSID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x1E0C8F198];
    v19 = 0;
    -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:error:](self, "tokenWithIdentifier:altDSID:forAccount:error:", v11, v10, v4, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *MEMORY[0x1E0C8F230];
    v18 = 0;
    -[AKTokenManager tokenWithIdentifier:altDSID:forAccount:error:](self, "tokenWithIdentifier:altDSID:forAccount:error:", v13, v10, v4, &v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v12, "stringValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCredentialItem:forKey:", v15, v11);

    }
    if (v14)
    {
      objc_msgSend(v14, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setCredentialItem:forKey:", v16, v13);

    }
  }

  return v6;
}

- (AAFKeychainManager)keychainManager
{
  return self->_keychainManager;
}

- (void)setKeychainManager:(id)a3
{
  objc_storeStrong((id *)&self->_keychainManager, a3);
}

- (OS_dispatch_queue)tokenManagerQueue
{
  return self->_tokenManagerQueue;
}

- (void)setTokenManagerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_tokenManagerQueue, a3);
}

- (NSMutableDictionary)tokenCache
{
  return self->_tokenCache;
}

- (void)setTokenCache:(id)a3
{
  objc_storeStrong((id *)&self->_tokenCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenCache, 0);
  objc_storeStrong((id *)&self->_tokenManagerQueue, 0);
  objc_storeStrong((id *)&self->_keychainManager, 0);
}

- (void)updateToken:identifier:altDSID:account:credential:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Missing required inputs. Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)updateToken:identifier:altDSID:account:credential:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Token is nil. Let's delete the token.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)updateToken:identifier:altDSID:account:credential:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager attempting to update token.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)tokenWithIdentifier:altDSID:forAccount:shouldSync:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_19202F000, v0, OS_LOG_TYPE_ERROR, "AKTokenManager missing required inputs (tokenIdentifier). Skipping.", v1, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)tokenWithIdentifier:altDSID:forAccount:shouldSync:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager missing required inputs (altDSID). Skipping.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)tokenWithIdentifier:altDSID:forAccount:shouldSync:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "AKTokenManager fetching tokens for tokenIdentifier:%@ altDSID:%@");
  OUTLINED_FUNCTION_1();
}

- (void)tokenWithIdentifier:altDSID:forAccount:shouldSync:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager attempting to fetch token.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_1(_QWORD *a1, NSObject *a2)
{
  int v2;
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(a1[10] + 8) + 24);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(a1[12] + 8) + 24);
  v4 = *(unsigned __int8 *)(*(_QWORD *)(a1[14] + 8) + 24);
  v5[0] = 67109632;
  v5[1] = v2;
  v6 = 1024;
  v7 = v3;
  v8 = 1024;
  v9 = v4;
  _os_log_debug_impl(&dword_19202F000, a2, OS_LOG_TYPE_DEBUG, "AKTokenManager: shouldUpdateCache:%d, shouldUpdateKeychain:%d, shouldUpdateAccountCredential:%d", (uint8_t *)v5, 0x14u);
  OUTLINED_FUNCTION_1();
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: token from Accounts has newer creation date. Picking this one.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: Token creation time not enabled. Defaulting to choose token from account credential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: found token from account credential.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "AKTokenManager: error fetching from keychain: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: didn't find token in keychain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: token from keychain has newer creation date. Picking this one.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: found token in keychain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __74__AKTokenManager_tokenWithIdentifier_altDSID_forAccount_shouldSync_error___block_invoke_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: found token in cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_tokenKeychainDescriptorForIdentifier:(uint64_t)a3 altDSID:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "AKTokenManager keychainDescriptorService:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateKeychainWithToken:identifier:altDSID:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "Unable to archive token", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_updateKeychainWithToken:(uint64_t)a3 identifier:(uint64_t)a4 altDSID:(uint64_t)a5 error:(uint64_t)a6 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "AKTokenManager: update in keychain hit an error: %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_updateKeychainWithToken:identifier:altDSID:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager attempting to save token to keychain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_fetchTokenFromKeychainWithIdentifier:altDSID:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_1(&dword_19202F000, v0, v1, "%@: Token not found in keychain (%@)");
  OUTLINED_FUNCTION_1();
}

- (void)_fetchTokenFromCacheWithIdentifier:altDSID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: no tokens for this altDSID in cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_fetchTokenFromCacheWithIdentifier:(uint64_t)a3 altDSID:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "AKTokenManager: token from cache is %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteTokenWithIdentifer:altDSID:account:credential:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: missing required inputs.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_deleteTokenWithIdentifer:(uint64_t)a3 altDSID:(uint64_t)a4 account:(uint64_t)a5 credential:(uint64_t)a6 error:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "AKTokenManager: error deleting token: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteTokenWithIdentifer:altDSID:account:credential:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: attempting to delete token from keychain", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __77__AKTokenManager__deleteTokenWithIdentifer_altDSID_account_credential_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: we received an Account, deleting from there as well.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_deleteTokenFromKeychainWithIdentifer:(uint64_t)a3 altDSID:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_19202F000, a2, a3, "AKTokenManager: error deleting in keychain: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_deleteTokenFromKeychainWithIdentifer:altDSID:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: tokenIdentifier is nil, so we'll clear all tokens for this adsid from keychain.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)_deleteTokenFromCacheWithIdentifer:altDSID:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: tokenIdentifier is nil, so we'll clear all tokens for this adsid from cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

- (void)synchronizedCredentialForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5(&dword_19202F000, v0, v1, "AKTokenManager: Synchronizing Credential", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

@end
