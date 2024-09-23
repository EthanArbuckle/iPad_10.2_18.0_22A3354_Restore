@implementation ICCloudSyncingObjectCryptoStrategyV1

- (void)initializeCryptoPropertiesFromObject:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shortLoggingDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Initializing crypto properties from original object… {object: %@, originalObject: %@}", buf, 0x16u);

  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke;
  v14[3] = &unk_1E76C8CE8;
  v9 = v4;
  v15 = v9;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v14);
  v10 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortLoggingDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortLoggingDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_INFO, "Initialized crypto properties from original object {object: %@, originalObject: %@}", buf, 0x16u);

  }
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  os_log_t v13;
  NSObject *v14;
  ICCloudSyncingObjectCryptoStrategyV1 *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  os_log_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id v28;

  v3 = a2;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  v5 = (id *)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedMainKeyForIdentifier:", v7);
  v8 = objc_claimAutoreleasedReturnValue();

  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cloudAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cachedMainKeyForIdentifier:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  if (v8 | v12)
  {
    if (v8)
    {
      v13 = (os_log_t)(id)v8;
      v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_2();
    }
    else
    {
      if (!v12)
      {
        v13 = 0;
        goto LABEL_14;
      }
      v13 = (os_log_t)(id)v12;
      v14 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_3();
    }

LABEL_14:
    -[NSObject keyData](v13, "keyData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject keyData](v13, "keyData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    +[ICCipherV1 wrapKey:withWrapper:error:](ICCipherV1, "wrapKey:withWrapper:error:", v16, v17, &v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (ICCloudSyncingObjectCryptoStrategyV1 *)v28;

    if (v18)
    {
      -[NSObject metadata](v13, "metadata");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCryptoIterationCount:", objc_msgSend(v19, "passphraseIterationCount"));

      -[NSObject metadata](v13, "metadata");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "passphraseSalt");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCryptoSalt:", v21);

      objc_msgSend(v3, "setCryptoWrappedKey:", v18);
      -[NSObject metadata](v13, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "passphraseHint");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPasswordHint:", v23);

      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v24 = (os_log_t)objc_claimAutoreleasedReturnValue();
      -[NSObject setCachedMainKey:forObject:](v24, "setCachedMainKey:forObject:", v13, v3);
    }
    else
    {
      v24 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_1();

    }
    goto LABEL_20;
  }
  if (objc_msgSend(*v5, "isPasswordProtected")
    && !+[ICCryptoStrategyFactory cipherVersionForObject:](ICCryptoStrategyFactory, "cipherVersionForObject:", *v5))
  {
    v25 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_4();

    objc_msgSend(v3, "setCryptoIterationCount:", objc_msgSend(*v5, "cryptoIterationCount"));
    objc_msgSend(*v5, "cryptoSalt");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCryptoSalt:", v26);

    objc_msgSend(*v5, "cryptoWrappedKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCryptoWrappedKey:", v27);

    v15 = -[ICCryptoStrategyBase initWithCloudSyncingObject:]([ICCloudSyncingObjectCryptoStrategyV1 alloc], "initWithCloudSyncingObject:", *v5);
    -[ICCloudSyncingObjectCryptoStrategyV1 passphraseHint](v15, "passphraseHint");
    v13 = (os_log_t)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setPasswordHint:", v13);
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_5(v3);
    v15 = (ICCloudSyncingObjectCryptoStrategyV1 *)v13;
  }
LABEL_20:

}

- (ICEncryptionMetadata)primaryMetadata
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__63;
  v9 = __Block_byref_object_dispose__63;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__ICCloudSyncingObjectCryptoStrategyV1_primaryMetadata__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionMetadata *)v2;
}

void __55__ICCloudSyncingObjectCryptoStrategyV1_primaryMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cryptoSalt");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "cryptoIterationCount");
  objc_msgSend(v3, "passwordHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:](ICEncryptionMetadata, "makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:", v4, v5, v6, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __55__ICCloudSyncingObjectCryptoStrategyV1_primaryMetadata__block_invoke_cold_1(v3);

  }
}

- (ICEncryptionKey)primaryWrappedKey
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__63;
  v9 = __Block_byref_object_dispose__63;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke;
  v4[3] = &unk_1E76C8B08;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionKey *)v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  ICEncryptionKey *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v3 = a2;
  objc_msgSend(v3, "cryptoWrappedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke_cold_1(v3);
    goto LABEL_7;
  }
  v5 = [ICEncryptionKey alloc];
  objc_msgSend(*(id *)(a1 + 32), "primaryMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ICEncryptionKey initWithKeyData:metadata:](v5, "initWithKeyData:metadata:", v4, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke_cold_2(v3);
LABEL_7:

  }
}

- (ICEncryptionObject)primaryEncryptionObject
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__63;
  v9 = __Block_byref_object_dispose__63;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__ICCloudSyncingObjectCryptoStrategyV1_primaryEncryptionObject__block_invoke;
  v4[3] = &unk_1E76C8B08;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionObject *)v2;
}

void __63__ICCloudSyncingObjectCryptoStrategyV1_primaryEncryptionObject__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "unappliedEncryptedRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "primaryEncryptedDataFromRecord:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;

LABEL_4:
    objc_msgSend(*(id *)(a1 + 32), "encryptionObjectWithData:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    goto LABEL_5;
  }
  objc_msgSend(v9, "primaryEncryptedData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    goto LABEL_4;
LABEL_5:

}

- (id)encryptionObjectWithData:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__63;
  v15 = __Block_byref_object_dispose__63;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke;
  v8[3] = &unk_1E76C8BD0;
  v8[4] = self;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  ICEncryptionObject *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "primaryMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_1(v3);
    v5 = v9;
    goto LABEL_12;
  }
  objc_msgSend(v3, "cryptoWrappedKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_2(v3);
    goto LABEL_11;
  }
  v6 = -[ICEncryptionObject initWithMetadata:wrappedEncryptionKey:encryptedData:]([ICEncryptionObject alloc], "initWithMetadata:wrappedEncryptionKey:encryptedData:", v4, v5, *(_QWORD *)(a1 + 40));
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_3(v3);
LABEL_11:

LABEL_12:
  }

}

- (BOOL)saveEncryptedJSON
{
  NSObject *v3;
  NSObject *v4;
  char v5;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICCloudSyncingObjectCryptoStrategyV1 saveEncryptedJSON].cold.1(self, v3);

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke;
  v10[3] = &unk_1E76C8B80;
  v10[4] = self;
  v10[5] = &v11;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v10);
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v12 + 24));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v16 = v8;
    v17 = 2112;
    v19 = 2080;
    v18 = v9;
    v20 = "-[ICCloudSyncingObjectCryptoStrategyV1 saveEncryptedJSON]";
    v21 = 1024;
    v22 = 201;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Saved encrypted values {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  _QWORD v12[4];
  NSObject *v13;
  uint64_t v14;
  _QWORD v15[4];
  NSObject *v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "supportsEncryptedValuesDictionary"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
    {
      objc_msgSend(v3, "serializedValuesToEncrypt");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)objc_opt_class();
        objc_msgSend(v3, "serializedValuesToEncrypt");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = MEMORY[0x1E0C809B0];
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_9;
        v15[3] = &unk_1E76C73F8;
        v16 = v3;
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_2;
        v12[3] = &unk_1E76C7420;
        v8 = v16;
        v9 = *(_QWORD *)(a1 + 40);
        v13 = v8;
        v14 = v9;
        objc_msgSend(v5, "encryptWithMainKeyOfObject:dataToEncrypt:failureHandler:successHandler:", v8, v6, v15, v12);

        v10 = v16;
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        v10 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "shortLoggingDescription");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v18 = v11;
          _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_INFO, "No encrypted values to save — skipping {object: %@}", buf, 0xCu);

        }
      }
    }
    else
    {
      v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_cold_1(v3);
      v4 = v10;
    }

  }
}

uint64_t __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_9(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_9_cold_1(a1);

  return objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObjectCryptoStrategyV1 saveEncryptedJSON]_block_invoke", 1, 1, CFSTR("Error encrypting JSON"));
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "setEncryptedValuesJSON:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setCryptoInitializationVector:", v8);

  objc_msgSend(*(id *)(a1 + 32), "setCryptoTag:", v9);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (id)encryptData:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__63;
  v15 = __Block_byref_object_dispose__63;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke;
  v8[3] = &unk_1E76C8B58;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = a1[5];
  v6 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_2;
  v12[3] = &unk_1E76C73F8;
  v13 = v3;
  v9[0] = v6;
  v9[1] = 3221225472;
  v9[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_16;
  v9[3] = &unk_1E76D0BA8;
  v7 = a1[6];
  v10 = v13;
  v11 = v7;
  v9[4] = a1[4];
  v8 = v13;
  objc_msgSend(v4, "encryptWithMainKeyOfObject:dataToEncrypt:failureHandler:successHandler:", v8, v5, v12, v9);

}

void __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_2_cold_1(a1);

}

void __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_16(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = *(void **)(a1 + 32);
  v8 = a4;
  v12 = a3;
  objc_msgSend(v7, "encryptionObjectWithData:", a2);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  objc_msgSend(*(id *)(a1 + 40), "setCryptoInitializationVector:", v8);
  objc_msgSend(*(id *)(a1 + 40), "setCryptoTag:", v12);

}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke;
  v11[3] = &unk_1E76D0BD0;
  v14 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke_2;
  v8[3] = &unk_1E76CF2F8;
  v9 = v3;
  v7 = v3;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v4, "encryptFileFromURL:toURL:setTagAndIVHandler:", v5, v6, v8);

}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setCryptoTag:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setCryptoInitializationVector:", v6);

}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4 setTagAndIVHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  ICCloudSyncingObjectCryptoStrategyV1 *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke;
  v15[3] = &unk_1E76D0C20;
  v11 = v8;
  v16 = v11;
  v17 = self;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  v20 = &v21;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v15);
  LOBYTE(self) = *((_BYTE *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return (char)self;
}

void __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  NSObject *v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  id obj;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__63;
  v37 = __Block_byref_object_dispose__63;
  v38 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_2;
  v30[3] = &unk_1E76C7730;
  v32 = &v33;
  v6 = v3;
  v31 = v6;
  objc_msgSend(v4, "performBlockAndWait:", v30);

  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__63;
  v28 = __Block_byref_object_dispose__63;
  v29 = 0;
  v7 = *(_QWORD *)(a1 + 32);
  obj = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v7, 0, &obj);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v29, obj);
  if (v8 && !v25[5])
  {
    v10 = (void *)objc_opt_class();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_19;
    v16[3] = &unk_1E76D0BF8;
    v20 = &v24;
    v17 = *(id *)(a1 + 48);
    v18 = v6;
    v21 = &v33;
    v11 = *(id *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 64);
    v19 = v11;
    v22 = v12;
    objc_msgSend(v10, "encryptWithMainKeyOfObject:dataToEncrypt:failureHandler:successHandler:", v18, v8, 0, v16);

    v9 = v17;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "className");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v34[5];
      v15 = v25[5];
      *(_DWORD *)buf = 138412802;
      v40 = v13;
      v41 = 2112;
      v42 = v14;
      v43 = 2112;
      v44 = v15;
      _os_log_error_impl(&dword_1BD918000, v9, OS_LOG_TYPE_ERROR, "Error loading decrypted file for %@ %@: %@", buf, 0x20u);

    }
  }

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v33, 8);

}

void __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_19(_QWORD *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  NSObject *v16;
  id obj;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1[7] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = 0;
  v11 = a2;

  v12 = a1[4];
  v13 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v13 + 40);
  v14 = objc_msgSend(v11, "writeToURL:options:error:", v12, 1, &obj);

  objc_storeStrong((id *)(v13 + 40), obj);
  if ((v14 & 1) != 0)
  {
    v15 = a1[6];
    if (v15)
      (*(void (**)(uint64_t, id, id))(v15 + 16))(v15, v7, v8);
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_19_cold_1();

  }
}

- (BOOL)loadDecryptedValuesIfNecessary
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__ICCloudSyncingObjectCryptoStrategyV1_loadDecryptedValuesIfNecessary__block_invoke;
  v4[3] = &unk_1E76C8B80;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __70__ICCloudSyncingObjectCryptoStrategyV1_loadDecryptedValuesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
  {
    if ((objc_msgSend(v3, "needsToLoadDecryptedValues") & 1) != 0)
    {
      objc_msgSend(v3, "encryptedValuesJSON");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = *(void **)(a1 + 32);
        objc_msgSend(v3, "encryptedValuesJSON");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "decryptAndMergeEncryptedJSON:", v6);

        objc_msgSend(v3, "setNeedsToLoadDecryptedValues:", 0);
        objc_msgSend(v3, "managedObjectContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "concurrencyType");

        if (v8 == 2)
          objc_msgSend(v3, "mergeUnappliedEncryptedRecord");
      }
      else
      {
        v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "shortLoggingDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = 138412290;
          v14 = v12;
          _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_INFO, "Cannot load decrypted values because encrypted values JSON is nil — succeeding {object: %@}", (uint8_t *)&v13, 0xCu);

        }
        objc_msgSend(v3, "setNeedsToLoadDecryptedValues:", 0);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Cannot load decrypted values because object is not authenticated — failing {object: %@}", (uint8_t *)&v13, 0xCu);

    }
  }

}

- (id)decryptData:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICCloudSyncingObjectCryptoStrategyV1 *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__63;
  v16 = __Block_byref_object_dispose__63;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_decryptData___block_invoke;
  v8[3] = &unk_1E76C8BD0;
  v5 = v4;
  v10 = self;
  v11 = &v12;
  v9 = v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_decryptData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v3 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__63;
  v17 = __Block_byref_object_dispose__63;
  v18 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_decryptData___block_invoke_2;
  v9[3] = &unk_1E76C8358;
  v12 = &v13;
  v10 = *(id *)(a1 + 32);
  v5 = v3;
  v11 = v5;
  objc_msgSend(v4, "performBlockAndWait:", v9);

  objc_msgSend((id)objc_opt_class(), "decryptWithMainKeyOfObject:encryptedData:fallbackAttemptSuccessCleanupHandler:", v5, v14[5], 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  _Block_object_dispose(&v13, 8);
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_decryptData___block_invoke_2(uint64_t a1)
{
  ICEncryptedData *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v2 = [ICEncryptedData alloc];
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cryptoTag");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "cryptoInitializationVector");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICEncryptedData initWithData:tag:initializationVector:](v2, "initWithData:tag:initializationVector:", v3, v8, v4);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

- (id)decryptedDataFromFileURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__63;
  v15 = __Block_byref_object_dispose__63;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke;
  v8[3] = &unk_1E76CD820;
  v10 = &v11;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke_2;
  v11[3] = &unk_1E76C74E8;
  v5 = a1[4];
  v6 = (void *)a1[5];
  v12 = v3;
  v13 = v5;
  v14 = v6;
  v7 = v3;
  objc_msgSend(v4, "decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:", v7, v11, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

ICEncryptedData *__65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  ICEncryptedData *v9;
  ICEncryptedData *v10;
  NSObject *v11;
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  void *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__63;
  v38 = __Block_byref_object_dispose__63;
  v39 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__63;
  v32 = __Block_byref_object_dispose__63;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__63;
  v26 = __Block_byref_object_dispose__63;
  v27 = 0;
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke_3;
  v16[3] = &unk_1E76D0C48;
  v19 = &v34;
  v3 = *(id *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v17 = v3;
  v18 = v4;
  v20 = &v28;
  v21 = &v22;
  objc_msgSend(v2, "performBlockAndWait:", v16);

  v5 = *(_QWORD *)(a1 + 48);
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v5, 0, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = v7;
  if (!v6 || v7)
  {

    v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "className");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v35[5];
      *(_DWORD *)buf = 138412802;
      v41 = v13;
      v42 = 2112;
      v43 = v14;
      v44 = 2112;
      v45 = v8;
      _os_log_error_impl(&dword_1BD918000, v11, OS_LOG_TYPE_ERROR, "Error loading encrypted file for %@ %@: %@", buf, 0x20u);

    }
    v6 = 0;
    v10 = 0;
  }
  else
  {
    v9 = [ICEncryptedData alloc];
    v10 = -[ICEncryptedData initWithData:tag:initializationVector:](v9, "initWithData:tag:initializationVector:", v6, v23[5], v29[5]);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  return v10;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_decryptedDataFromFileURL___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 40), "fileURLEncryptionCryptoInitialzationVector");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  objc_msgSend(*(id *)(a1 + 40), "fileURLEncryptionCryptoTag");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

+ (id)decryptWithMainKeyOfObject:(id)a3 encryptedData:(id)a4 fallbackAttemptSuccessCleanupHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __118__ICCloudSyncingObjectCryptoStrategyV1_decryptWithMainKeyOfObject_encryptedData_fallbackAttemptSuccessCleanupHandler___block_invoke;
  v12[3] = &unk_1E76D0C70;
  v13 = v8;
  v9 = v8;
  objc_msgSend(a1, "decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:", a3, v12, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __118__ICCloudSyncingObjectCryptoStrategyV1_decryptWithMainKeyOfObject_encryptedData_fallbackAttemptSuccessCleanupHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)decryptWithMainKeyOfObject:(id)a3 encryptedDataPreparationBlock:(id)a4 fallbackAttemptSuccessCleanupHandler:(id)a5
{
  id v7;
  void (**v8)(_QWORD);
  void (**v9)(_QWORD);
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void (**v28)(_QWORD);
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  BOOL v36;
  NSObject *v37;
  NSObject *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  NSObject *v49;
  void (**v50)(_QWORD);
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void (**v81)(_QWORD);
  void *v82;
  void (**v83)(_QWORD);
  void *v84;
  void (**v85)(_QWORD);
  void (**v86)(_QWORD);
  id v87;
  id v88;
  _QWORD v89[4];
  id v90;
  uint64_t *v91;
  uint64_t *v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  char v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t (*v101)(uint64_t, uint64_t);
  void (*v102)(uint64_t);
  id v103;
  uint64_t v104;
  uint64_t *v105;
  uint64_t v106;
  uint64_t (*v107)(uint64_t, uint64_t);
  void (*v108)(uint64_t);
  id v109;
  uint8_t buf[4];
  uint64_t v111;
  __int16 v112;
  uint64_t v113;
  __int16 v114;
  uint64_t v115;
  __int16 v116;
  uint64_t v117;
  __int16 v118;
  uint64_t v119;
  __int16 v120;
  uint64_t v121;
  uint64_t v122;

  v122 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(_QWORD))a4;
  v9 = (void (**)(_QWORD))a5;
  v104 = 0;
  v105 = &v104;
  v106 = 0x3032000000;
  v107 = __Block_byref_object_copy__63;
  v108 = __Block_byref_object_dispose__63;
  v109 = 0;
  v98 = 0;
  v99 = &v98;
  v100 = 0x3032000000;
  v101 = __Block_byref_object_copy__63;
  v102 = __Block_byref_object_dispose__63;
  v103 = 0;
  v94 = 0;
  v95 = &v94;
  v96 = 0x2020000000;
  v97 = 0;
  objc_msgSend(v7, "managedObjectContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __134__ICCloudSyncingObjectCryptoStrategyV1_decryptWithMainKeyOfObject_encryptedDataPreparationBlock_fallbackAttemptSuccessCleanupHandler___block_invoke;
  v89[3] = &unk_1E76CD6E8;
  v91 = &v98;
  v11 = v7;
  v90 = v11;
  v92 = &v104;
  v93 = &v94;
  objc_msgSend(v10, "performBlockAndWait:", v89);

  if (*((_BYTE *)v95 + 24))
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "className");
      objc_claimAutoreleasedReturnValue();
      +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:].cold.5();
    }

    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:]", 1, 1, CFSTR("Attempt to decrypt a V1 unsupported object"));
    v13 = 0;
    goto LABEL_5;
  }
  if (!v99[5])
  {
    v27 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:].cold.1();
LABEL_37:
    v13 = 0;
    goto LABEL_38;
  }
  v8[2](v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isValid"))
  {
    if (v13)
    {
      if ((objc_msgSend(v13, "isValid") & 1) != 0)
      {
LABEL_5:
        v14 = 0;
        goto LABEL_40;
      }
      v27 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:].cold.4();
      goto LABEL_38;
    }
    v27 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:].cold.3();
    goto LABEL_37;
  }
  v15 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v81 = v9;
    v16 = v105[5];
    objc_msgSend(v13, "tag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "hash");
    objc_msgSend(v13, "initializationVector");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "hash");
    objc_msgSend(v13, "data");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "hash");
    *(_DWORD *)buf = 138413058;
    v111 = v16;
    v112 = 2048;
    v113 = v18;
    v114 = 2048;
    v115 = v20;
    v116 = 2048;
    v117 = v22;
    _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_INFO, "Decrypting %@ tag.hash=%lu initializationVector.hash=%lu encryptedData.hash=%lu", buf, 0x2Au);

    v9 = v81;
  }

  objc_msgSend(v13, "data");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v99[5];
  objc_msgSend(v13, "tag");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "initializationVector");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0;
  +[ICCipherV1 decryptData:withKey:tag:initializationVector:error:](ICCipherV1, "decryptData:withKey:tag:initializationVector:error:", v23, v24, v25, v26, &v88);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v88;

  if (v14 && !v27)
  {
    v27 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v28 = v9;
      v74 = v105[5];
      objc_msgSend(v13, "tag");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v82, "hash");
      objc_msgSend(v13, "initializationVector");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v76, "hash");
      objc_msgSend(v13, "data");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "length");
      v32 = objc_msgSend(v14, "length");
      v33 = objc_msgSend(v14, "hash");
      *(_DWORD *)buf = 138413570;
      v111 = v74;
      v112 = 2048;
      v113 = v72;
      v114 = 2048;
      v115 = v29;
      v116 = 2048;
      v117 = v31;
      v118 = 2048;
      v119 = v32;
      v120 = 2048;
      v121 = v33;
      _os_log_impl(&dword_1BD918000, v27, OS_LOG_TYPE_INFO, "Decrypted %@ tag.hash=%lu initializationVector.hash=%lu. encryptedData.length=%lu decryptedData.length=%lu decryptedData.hash=%lu", buf, 0x3Eu);

      v9 = v28;
    }

    goto LABEL_39;
  }

  v34 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    v85 = v9;
    v60 = v105[5];
    objc_msgSend(v13, "tag");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v79, "hash");
    objc_msgSend(v13, "initializationVector");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "hash");
    objc_msgSend(v13, "data");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "length");
    *(_DWORD *)buf = 138413314;
    v111 = v60;
    v112 = 2048;
    v113 = v61;
    v114 = 2048;
    v115 = v63;
    v116 = 2048;
    v117 = v65;
    v118 = 2112;
    v119 = (uint64_t)v27;
    _os_log_error_impl(&dword_1BD918000, v34, OS_LOG_TYPE_ERROR, "Failed to decrypt %@ with tag.hash=%lu initializationVector.hash=%lu. encryptedData.length=%lu error=%@", buf, 0x34u);

    v9 = v85;
  }

  objc_msgSend(v13, "fallbackTag");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_39;
  objc_msgSend(v13, "fallbackInitializationVector");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35 == 0;

  if (v36)
  {
LABEL_38:
    v14 = 0;
LABEL_39:

    goto LABEL_40;
  }
  v37 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    +[ICCloudSyncingObjectCryptoStrategyV1 decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:].cold.2(v37);

  v38 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    v83 = v9;
    v39 = v105[5];
    objc_msgSend(v13, "fallbackTag");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v77, "hash");
    objc_msgSend(v13, "fallbackInitializationVector");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "hash");
    objc_msgSend(v13, "data");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "hash");
    *(_DWORD *)buf = 138413058;
    v111 = v39;
    v112 = 2048;
    v113 = v40;
    v114 = 2048;
    v115 = v42;
    v116 = 2048;
    v117 = v44;
    _os_log_impl(&dword_1BD918000, v38, OS_LOG_TYPE_INFO, "Decrypting %@ fallbackTag.hash=%lu fallbackInitializationVector.hash=%lu encryptedData.hash=%lu", buf, 0x2Au);

    v9 = v83;
  }

  objc_msgSend(v13, "data");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v99[5];
  objc_msgSend(v13, "fallbackTag");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fallbackInitializationVector");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0;
  +[ICCipherV1 decryptData:withKey:tag:initializationVector:error:](ICCipherV1, "decryptData:withKey:tag:initializationVector:error:", v45, v46, v47, v48, &v87);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v87;

  if (!v14 || v27)
  {

    v59 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
    {
      v86 = v9;
      v66 = v105[5];
      objc_msgSend(v13, "tag");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = objc_msgSend(v80, "hash");
      objc_msgSend(v13, "initializationVector");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "hash");
      objc_msgSend(v13, "data");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = objc_msgSend(v70, "length");
      *(_DWORD *)buf = 138413314;
      v111 = v66;
      v112 = 2048;
      v113 = v67;
      v114 = 2048;
      v115 = v69;
      v116 = 2048;
      v117 = v71;
      v118 = 2112;
      v119 = (uint64_t)v27;
      _os_log_error_impl(&dword_1BD918000, v59, OS_LOG_TYPE_ERROR, "Failed to decrypt %@ with fallbackTag.hash=%lu fallbackInitializationVector.hash=%lu. encryptedData.length=%lu error=%@", buf, 0x34u);

      v9 = v86;
    }

    goto LABEL_38;
  }
  v49 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
  {
    v50 = v9;
    v75 = v105[5];
    objc_msgSend(v13, "fallbackTag");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = objc_msgSend(v84, "hash");
    objc_msgSend(v13, "fallbackInitializationVector");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v78, "hash");
    objc_msgSend(v13, "data");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "length");
    v54 = objc_msgSend(v14, "length");
    v55 = objc_msgSend(v14, "hash");
    *(_DWORD *)buf = 138413570;
    v111 = v75;
    v112 = 2048;
    v113 = v73;
    v114 = 2048;
    v115 = v51;
    v116 = 2048;
    v117 = v53;
    v118 = 2048;
    v119 = v54;
    v120 = 2048;
    v121 = v55;
    _os_log_impl(&dword_1BD918000, v49, OS_LOG_TYPE_INFO, "Decrypted %@ fallbackTag.hash=%lu fallbackInitializationVector.hash=%lu. encryptedData.length=%lu decryptedData.length=%lu decryptedData.hash=%lu", buf, 0x3Eu);

    v9 = v50;
  }

  if (v9)
    v9[2](v9);
LABEL_40:
  v56 = v90;
  v57 = v14;

  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);

  _Block_object_dispose(&v104, 8);
  return v57;
}

uint64_t __134__ICCloudSyncingObjectCryptoStrategyV1_decryptWithMainKeyOfObject_encryptedDataPreparationBlock_fallbackAttemptSuccessCleanupHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t result;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unwrappedKey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  result = objc_msgSend(*(id *)(a1 + 32), "isUnsupported");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (id)encryptSidecarData:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__63;
  v15 = __Block_byref_object_dispose__63;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke;
  v8[3] = &unk_1E76C8B58;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[5];
  _QWORD v9[4];
  NSObject *v10;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
  {
    v4 = (void *)objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_24;
    v9[3] = &unk_1E76C73F8;
    v10 = v3;
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_2;
    v8[3] = &unk_1E76D0C98;
    v8[4] = *(_QWORD *)(a1 + 48);
    objc_msgSend(v4, "encryptWithMainKeyOfObject:dataToEncrypt:failureHandler:successHandler:", v10, v5, v9, v8);
    v7 = v10;
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_cold_1();

  }
}

uint64_t __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_24()
{
  NSObject *v0;

  v0 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_24_cold_1();

  return objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObjectCryptoStrategyV1 encryptSidecarData:]_block_invoke", 1, 1, CFSTR("Error encrypting V1 sidecar data"));
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v7 = (objc_class *)MEMORY[0x1E0C99DF0];
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v14 = objc_alloc_init(v7);
  objc_msgSend(v14, "appendData:", v9);

  objc_msgSend(v14, "appendData:", v8);
  objc_msgSend(v14, "appendData:", v10);

  v11 = objc_msgSend(v14, "copy");
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v11;

}

- (id)decryptSidecarData:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__63;
  v15 = __Block_byref_object_dispose__63;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke;
  v8[3] = &unk_1E76C8B58;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  NSObject *v10;
  uint64_t v11;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 40), "length") >= 0x20)
    {
      v5 = (void *)objc_opt_class();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_28;
      v9[3] = &unk_1E76D0CC0;
      v10 = *(id *)(a1 + 40);
      v11 = 32;
      objc_msgSend(v5, "decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:", v3, v9, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      v4 = v10;
      goto LABEL_9;
    }
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_cold_1();
  }
  else
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_cold_2();
  }

LABEL_9:
}

ICEncryptedData *__59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_28(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  ICEncryptedData *v5;

  objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 0, 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 16, 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 32, objc_msgSend(*(id *)(a1 + 32), "length") - *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ICEncryptedData initWithData:tag:initializationVector:]([ICEncryptedData alloc], "initWithData:tag:initializationVector:", v4, v2, v3);

  return v5;
}

- (BOOL)encryptSidecarFileFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  ICCloudSyncingObjectCryptoStrategyV1 *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3600]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke;
  v13[3] = &unk_1E76D0D10;
  v9 = v8;
  v14 = v9;
  v10 = v6;
  v15 = v10;
  v16 = self;
  v11 = v7;
  v17 = v11;
  v18 = &v19;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v13);
  LOBYTE(self) = *((_BYTE *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  return (char)self;
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t v15;
  id v16;

  v3 = a2;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[2] = __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2;
  v12[3] = &unk_1E76D0CE8;
  v4 = (void *)a1[7];
  v12[4] = a1[6];
  v5 = (void *)a1[4];
  v6 = a1[5];
  v16 = 0;
  v12[1] = 3221225472;
  v7 = v4;
  v8 = a1[8];
  v13 = v7;
  v15 = v8;
  v9 = v3;
  v14 = v9;
  objc_msgSend(v5, "coordinateReadingItemAtURL:options:error:byAccessor:", v6, 1, &v16, v12);
  v10 = v16;
  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_cold_1();

  }
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;

  v12 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", a2, 0, &v12);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v12;
  if (!objc_msgSend(v3, "length"))
  {
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_1();

    goto LABEL_11;
  }
  objc_msgSend(*(id *)(a1 + 32), "encryptSidecarData:", v3);
  v5 = objc_claimAutoreleasedReturnValue();
  if (!-[NSObject length](v5, "length"))
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_2();

LABEL_11:
    v8 = v4;
    goto LABEL_15;
  }
  v6 = *(_QWORD *)(a1 + 40);
  v11 = v4;
  v7 = -[NSObject writeToURL:options:error:](v5, "writeToURL:options:error:", v6, 1, &v11);
  v8 = v11;

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_3();

  }
LABEL_15:

}

- (NSData)fileURLEncryptionCryptoTag
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__63;
  v9 = __Block_byref_object_dispose__63;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__ICCloudSyncingObjectCryptoStrategyV1_fileURLEncryptionCryptoTag__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSData *)v2;
}

void __66__ICCloudSyncingObjectCryptoStrategyV1_fileURLEncryptionCryptoTag__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "cryptoTag");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (NSData)fileURLEncryptionCryptoInitialzationVector
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__63;
  v9 = __Block_byref_object_dispose__63;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __82__ICCloudSyncingObjectCryptoStrategyV1_fileURLEncryptionCryptoInitialzationVector__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSData *)v2;
}

void __82__ICCloudSyncingObjectCryptoStrategyV1_fileURLEncryptionCryptoInitialzationVector__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "cryptoInitializationVector");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (void)encryptWithMainKeyOfObject:(id)a3 dataToEncrypt:(id)a4 failureHandler:(id)a5 successHandler:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __111__ICCloudSyncingObjectCryptoStrategyV1_encryptWithMainKeyOfObject_dataToEncrypt_failureHandler_successHandler___block_invoke;
  v12[3] = &unk_1E76D0D38;
  v13 = v10;
  v11 = v10;
  objc_msgSend(a1, "encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:", a3, v12, a5, a6);

}

id __111__ICCloudSyncingObjectCryptoStrategyV1_encryptWithMainKeyOfObject_dataToEncrypt_failureHandler_successHandler___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (void)encryptWithMainKeyOfObject:(id)a3 dataPreparationBlock:(id)a4 failureHandler:(id)a5 successHandler:(id)a6
{
  id v9;
  void (**v10)(_QWORD);
  void (**v11)(_QWORD);
  void (**v12)(id, void *, id, NSObject *);
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  uint64_t v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  NSObject *v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void (**)(_QWORD))a4;
  v11 = (void (**)(_QWORD))a5;
  v12 = (void (**)(id, void *, id, NSObject *))a6;
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__63;
  v49 = __Block_byref_object_dispose__63;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__63;
  v43 = __Block_byref_object_dispose__63;
  v44 = 0;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  objc_msgSend(v9, "managedObjectContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __118__ICCloudSyncingObjectCryptoStrategyV1_encryptWithMainKeyOfObject_dataPreparationBlock_failureHandler_successHandler___block_invoke;
  v30[3] = &unk_1E76CD6E8;
  v32 = &v39;
  v14 = v9;
  v31 = v14;
  v33 = &v45;
  v34 = &v35;
  objc_msgSend(v13, "performBlockAndWait:", v30);

  if (*((_BYTE *)v36 + 24))
  {
    v15 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "className");
      objc_claimAutoreleasedReturnValue();
      +[ICCloudSyncingObjectCryptoStrategyV1 encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:].cold.3();
    }

    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "+[ICCloudSyncingObjectCryptoStrategyV1 encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:]", 1, 1, CFSTR("Attempt to encrypt a V1 unsupported object"));
    goto LABEL_22;
  }
  if (!v40[5])
  {
    v22 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "className");
      objc_claimAutoreleasedReturnValue();
      +[ICCloudSyncingObjectCryptoStrategyV1 encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:].cold.1();
    }
    v16 = v22;
    goto LABEL_21;
  }
  v10[2](v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v20 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "className");
      objc_claimAutoreleasedReturnValue();
      +[ICCloudSyncingObjectCryptoStrategyV1 encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:].cold.2();
    }
    v22 = v20;
    goto LABEL_20;
  }
  v17 = v40[5];
  v28 = 0;
  v29 = 0;
  v27 = 0;
  +[ICCipherV1 encryptData:withKey:tag:initializationVector:error:](ICCipherV1, "encryptData:withKey:tag:initializationVector:error:", v16, v17, &v29, &v28, &v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v29;
  v20 = v28;
  v21 = v27;
  v22 = v21;
  if (!v18 || v21)
  {
    v23 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v14, "className");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v46[5];
      *(_DWORD *)buf = 138412802;
      v52 = v24;
      v53 = 2112;
      v54 = v25;
      v55 = 2112;
      v56 = v22;
      v26 = (void *)v24;
      _os_log_error_impl(&dword_1BD918000, v23, OS_LOG_TYPE_ERROR, "Error encrypting data for %@ %@: %@", buf, 0x20u);

    }
LABEL_20:

LABEL_21:
LABEL_22:
    if (v11)
      v11[2](v11);
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_25;
  }

  if (v12)
    v12[2](v12, v18, v19, v20);
LABEL_25:

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
}

uint64_t __118__ICCloudSyncingObjectCryptoStrategyV1_encryptWithMainKeyOfObject_dataPreparationBlock_failureHandler_successHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t result;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unwrappedKey");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  result = objc_msgSend(*(id *)(a1 + 32), "isUnsupported");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __69__ICCloudSyncingObjectCryptoStrategyV1_mergeEncryptedDataFromRecord___block_invoke;
  v7[3] = &unk_1E76C8B58;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __69__ICCloudSyncingObjectCryptoStrategyV1_mergeEncryptedDataFromRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "ic_inlineableDataAssetForKeyPrefix:", CFSTR("EncryptedValues"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "loadDecryptedValuesIfNecessary");
    objc_msgSend(v3, "mergeCryptoTagAndInitializationVectorFromRecord:", *(_QWORD *)(a1 + 40));
    if (!v4)
      goto LABEL_6;
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "className");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Merging encrypted values from cloud for %@ (%@)", (uint8_t *)&v8, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "decryptAndMergeEncryptedJSON:", v4);
    if (objc_msgSend(*(id *)(a1 + 32), "saveEncryptedJSON"))
    {
LABEL_6:
      objc_msgSend(v3, "setUnappliedEncryptedRecord:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
  else
  {
    objc_msgSend(v3, "setUnappliedEncryptedRecord:", *(_QWORD *)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (void)decryptAndMergeEncryptedJSON:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ICCloudSyncingObjectCryptoStrategyV1_decryptAndMergeEncryptedJSON___block_invoke;
  v6[3] = &unk_1E76C8BF8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v6);

}

void __69__ICCloudSyncingObjectCryptoStrategyV1_decryptAndMergeEncryptedJSON___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "className");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Merging encrypted JSON for %@ (%@)", (uint8_t *)&v9, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "decryptData:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v3, "deserializeAndMergeValues:", v7);
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __69__ICCloudSyncingObjectCryptoStrategyV1_decryptAndMergeEncryptedJSON___block_invoke_cold_1(v3, v8);

    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICCloudSyncingObjectCryptoStrategyV1 decryptAndMergeEncryptedJSON:]_block_invoke", 1, 1, CFSTR("Error decrypting JSON"));
  }

}

- (BOOL)recordHasChangedPassphrase:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ICCloudSyncingObjectCryptoStrategyV1_recordHasChangedPassphrase___block_invoke;
  v7[3] = &unk_1E76C8B80;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __67__ICCloudSyncingObjectCryptoStrategyV1_recordHasChangedPassphrase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  char v13;
  id v14;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CryptoWrappedKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ICCheckedDynamicCast();
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "cryptoWrappedKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (id)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v5)
    v7 = 0;
  else
    v7 = v5;
  v8 = v7;
  if (v6 == v14)
    v9 = 0;
  else
    v9 = v14;
  v10 = v9;
  v11 = (void *)v10;
  if (v8 | v10)
  {
    if (v8)
      v12 = v10 == 0;
    else
      v12 = 1;
    if (v12)
      v13 = 1;
    else
      v13 = objc_msgSend((id)v8, "isEqual:", v10) ^ 1;
  }
  else
  {
    v13 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v13;
}

- (id)unwrappedKey
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__63;
  v9 = __Block_byref_object_dispose__63;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__ICCloudSyncingObjectCryptoStrategyV1_unwrappedKey__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_unwrappedKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedMainKeyForObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "className");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v13;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "Could not get main key to decrypt %@ (%@)", buf, 0x16u);

    }
    v9 = v12;
    goto LABEL_9;
  }
  objc_msgSend(v3, "cryptoWrappedKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  +[ICCipherV1 unwrapKey:withWrapper:error:](ICCipherV1, "unwrapKey:withWrapper:error:", v6, v7, &v15);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v8;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __52__ICCloudSyncingObjectCryptoStrategyV1_unwrappedKey__block_invoke_cold_1();

LABEL_9:
  }

}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ICCloudSyncingObjectCryptoStrategyV1_mainKeyDecryptsPrimaryData___block_invoke;
  v7[3] = &unk_1E76CD820;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __67__ICCloudSyncingObjectCryptoStrategyV1_mainKeyDecryptsPrimaryData___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "canMainKey:decryptObject:", *(_QWORD *)(a1 + 40), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)canMainKey:(id)a3 decryptObject:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  NSObject *v17;
  id v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "cipherVersion");

  if (v8)
  {
    v9 = 0;
  }
  else
  {
    objc_opt_class();
    ICDynamicCast();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cryptoVerifier");
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;

    }
    else
    {
      objc_msgSend(v6, "cryptoWrappedKey");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        v9 = 1;
        goto LABEL_18;
      }
    }
    objc_msgSend(v5, "keyData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[ICCipherV1 unwrapKey:withWrapper:error:](ICCipherV1, "unwrapKey:withWrapper:error:", v12, v13, &v19);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v19;

    if (v15)
      v16 = 1;
    else
      v16 = v14 == 0;
    v9 = !v16;
    if (v16)
    {
      v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[ICCloudSyncingObjectCryptoStrategyV1 canMainKey:decryptObject:].cold.1();

    }
  }
LABEL_18:

  return v9;
}

- (void)rewrapKeyWithNewMainKey:(id)a3 salt:(id)a4 iterationCount:(unint64_t)a5 hint:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __89__ICCloudSyncingObjectCryptoStrategyV1_rewrapKeyWithNewMainKey_salt_iterationCount_hint___block_invoke;
  v16[3] = &unk_1E76D0D60;
  v16[4] = self;
  v17 = v10;
  v19 = v12;
  v20 = a5;
  v18 = v11;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v16);

}

void __89__ICCloudSyncingObjectCryptoStrategyV1_rewrapKeyWithNewMainKey_salt_iterationCount_hint___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  ICEncryptionKey *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "unwrappedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v21 = 0;
    +[ICCipherV1 wrapKey:withWrapper:error:](ICCipherV1, "wrapKey:withWrapper:error:", v4, v5, &v21);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v6)
    {
      objc_msgSend(v3, "setCryptoIterationCount:", *(_QWORD *)(a1 + 64));
      objc_msgSend(v3, "setCryptoSalt:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v3, "setCryptoWrappedKey:", v6);
      objc_msgSend(v3, "setPasswordHint:", *(_QWORD *)(a1 + 56));
      objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Rewrapped object"));
      objc_msgSend(v3, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v3, "passwordHint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:](ICEncryptionMetadata, "makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:", v8, v9, v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        v13 = -[ICEncryptionKey initWithKeyData:metadata:]([ICEncryptionKey alloc], "initWithKeyData:metadata:", *(_QWORD *)(a1 + 40), v12);
      else
        v13 = 0;
      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setCachedMainKey:forObject:", v13, v3);

    }
    else
    {
      v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_opt_class();
        v18 = v17;
        objc_msgSend(v3, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v17;
        v24 = 2112;
        v25 = v19;
        v26 = 2112;
        v27 = v7;
        _os_log_impl(&dword_1BD918000, &v13->super, OS_LOG_TYPE_INFO, "Could not re-wrap key for %@ (%@, %@)", buf, 0x20u);

      }
      v12 = v13;
    }

  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v14 = (void *)objc_opt_class();
      v15 = v14;
      objc_msgSend(v3, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v14;
      v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Could not unwrap key for %@ (%@)", buf, 0x16u);

    }
    v7 = v6;
  }

}

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a3;
  if (-[ICCloudSyncingObjectCryptoStrategyV1 isAuthenticated](self, "isAuthenticated"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (BOOL)rewrapWithMainKey:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICCloudSyncingObjectCryptoStrategyV1 rewrapWithMainKey:].cold.1(self, v5);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E76C8B58;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v13);
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortLoggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v17 + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v21 = v11;
    v22 = 2112;
    v24 = 2080;
    v23 = v12;
    v25 = "-[ICCloudSyncingObjectCryptoStrategyV1 rewrapWithMainKey:]";
    v26 = 1024;
    v27 = 939;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped object with main key {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  const char *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isUnsupported"))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      v6 = "Not rewrapping object because it is unsupported {object: %@}";
LABEL_7:
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, v6, buf, 0xCu);

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v3, "needsInitialFetchFromCloud"))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v5;
      v6 = "Not rewrapping object because it needs initial fetch {object: %@}";
      goto LABEL_7;
    }
LABEL_14:
    v7 = v4;
    goto LABEL_15;
  }
  if ((objc_msgSend(v3, "mergeUnappliedEncryptedRecord") & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(v3);
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "unwrappedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 40), "keyData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    +[ICCipherV1 wrapKey:withWrapper:error:](ICCipherV1, "wrapKey:withWrapper:error:", v7, v8, &v17);
    v9 = objc_claimAutoreleasedReturnValue();
    v4 = v17;

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 40), "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCryptoIterationCount:", objc_msgSend(v10, "passphraseIterationCount"));

      objc_msgSend(*(id *)(a1 + 40), "metadata");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "passphraseSalt");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCryptoSalt:", v12);

      objc_msgSend(*(id *)(a1 + 40), "metadata");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "passphraseHint");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setPasswordHint:", v14);

      objc_msgSend(v3, "setCryptoWrappedKey:", v9);
      objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Rewrapped object"));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1();

    }
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v15;
      _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Not rewrapping data because unwrapped key is missing {object: %@}", buf, 0xCu);

    }
    v4 = v9;
  }

LABEL_15:
}

- (BOOL)hasSameKeyAsObject:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ICCloudSyncingObjectCryptoStrategyV1_hasSameKeyAsObject___block_invoke;
  v7[3] = &unk_1E76C8B08;
  v9 = &v10;
  v5 = v4;
  v8 = v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_hasSameKeyAsObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "cryptoSalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cryptoSalt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToData:", v4))
  {
    v5 = objc_msgSend(v7, "cryptoIterationCount");
    v6 = v5 == objc_msgSend(*(id *)(a1 + 32), "cryptoIterationCount");
  }
  else
  {
    v6 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v6;

}

- (void)rewrapAndDivergeKeyUsingPassphrase:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  ICCloudSyncingObjectCryptoStrategyV1 *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke;
  v6[3] = &unk_1E76C8BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v6);

}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "shortLoggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v25 = v5;
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Diverging key for object: %@", buf, 0xCu);

  }
  v23 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", &v23);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v23;
  if (v6)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v22 = v7;
    +[ICCipherV1 keyForPassphrase:salt:iterationCount:error:](ICCipherV1, "keyForPassphrase:salt:iterationCount:error:", v8, v6, 20000, &v22);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v22;

    if (v9)
    {
      v21 = v10;
      objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", &v21);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v21;

      if (v11)
      {
        v20 = v12;
        +[ICCipherV1 wrapKey:withWrapper:error:](ICCipherV1, "wrapKey:withWrapper:error:", v11, v9, &v20);
        v13 = objc_claimAutoreleasedReturnValue();
        v10 = v20;

        if (v13)
        {
          v14 = *(void **)(a1 + 40);
          objc_msgSend(v3, "passwordHint");
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "rewrapKeyWithNewMainKey:salt:iterationCount:hint:", v9, v6, 20000, v15);

          objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Diverged object"));
          objc_msgSend(v3, "managedObjectContext");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 0;
          LOBYTE(v15) = objc_msgSend(v16, "save:", &v19);
          v17 = v19;

          if ((v15 & 1) == 0)
          {
            v18 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_5();

          }
        }
        else
        {
          v17 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_4();
        }

      }
      else
      {
        v13 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_3();
        v10 = v12;
      }

    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_2();
    }

    v7 = v10;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_1();
  }

}

- (BOOL)hasPassphraseSet
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__ICCloudSyncingObjectCryptoStrategyV1_hasPassphraseSet__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __56__ICCloudSyncingObjectCryptoStrategyV1_hasPassphraseSet__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  BOOL v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "cryptoSalt");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = 1;
  else
    v4 = objc_msgSend(v5, "cryptoIterationCount") != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;

}

- (NSString)passphraseHint
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__63;
  v9 = __Block_byref_object_dispose__63;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__ICCloudSyncingObjectCryptoStrategyV1_passphraseHint__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __54__ICCloudSyncingObjectCryptoStrategyV1_passphraseHint__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v3 = a2;
  NSStringFromSelector(sel_passwordHint);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primitiveValueForKey:", v7);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (BOOL)isAuthenticated
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__ICCloudSyncingObjectCryptoStrategyV1_isAuthenticated__block_invoke;
  v4[3] = &unk_1E76C8B08;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __55__ICCloudSyncingObjectCryptoStrategyV1_isAuthenticated__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "hasPassphraseSet") & 1) != 0)
  {
    +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedMainKeyForObject:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v4 != 0;

  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }

}

- (id)mainKeyForPassphrase:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__63;
  v15 = __Block_byref_object_dispose__63;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke;
  v8[3] = &unk_1E76C8B80;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  ICEncryptionKey *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "cryptoSalt");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cryptoSalt");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "cryptoIterationCount");
    objc_msgSend(v3, "passwordHint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:](ICEncryptionMetadata, "makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:", v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_1(v3);
      v13 = v12;
      goto LABEL_16;
    }
    v10 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "cryptoSalt");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    +[ICCipherV1 keyForPassphrase:salt:iterationCount:error:](ICCipherV1, "keyForPassphrase:salt:iterationCount:error:", v10, v11, objc_msgSend(v3, "cryptoIterationCount"), &v19);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v19;

    if (v12)
    {
      v14 = -[ICEncryptionKey initWithKeyData:metadata:]([ICEncryptionKey alloc], "initWithKeyData:metadata:", v12, v9);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v16 = *(void **)(v15 + 40);
      *(_QWORD *)(v15 + 40) = v14;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
LABEL_16:

        goto LABEL_17;
      }
      v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_3(v3);
    }
    else
    {
      v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_2();
    }

    goto LABEL_16;
  }
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "shortLoggingDescription");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v18;
    _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "Cannot create main key for passphrase because object doesn't have crypto salt {object: %@}", buf, 0xCu);

  }
  v9 = v13;
LABEL_17:

}

- (BOOL)authenticateWithPassphrase:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__ICCloudSyncingObjectCryptoStrategyV1_authenticateWithPassphrase___block_invoke;
  v7[3] = &unk_1E76C8B58;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __67__ICCloudSyncingObjectCryptoStrategyV1_authenticateWithPassphrase___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mainKeyForPassphrase:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "mainKeyDecryptsPrimaryData:", v3) & 1) != 0)
    {
      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "setCachedMainKey:forObject:", v3, v9);
      v7 = *(_QWORD *)(a1 + 48);
      v6 = a1 + 48;
      *(_BYTE *)(*(_QWORD *)(v7 + 8) + 24) = v5;

    }
    else
    {
      v8 = *(_QWORD *)(a1 + 48);
      v6 = a1 + 48;
      *(_BYTE *)(*(_QWORD *)(v8 + 8) + 24) = 0;
    }
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)v6 + 8) + 24))
      objc_msgSend(v9, "mergeUnappliedEncryptedRecord");
  }

}

- (BOOL)isPassphraseCorrect:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__ICCloudSyncingObjectCryptoStrategyV1_isPassphraseCorrect___block_invoke;
  v7[3] = &unk_1E76C8B58;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __60__ICCloudSyncingObjectCryptoStrategyV1_isPassphraseCorrect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "mainKeyForPassphrase:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "canMainKey:decryptObject:", v3, v4);

}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_17();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v3, "Cannot wrap encryption key {object: %@, error: %@}", v4);

  OUTLINED_FUNCTION_2();
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_2()
{
  id *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v4, v5, "Initializing object from original object's main key {object: %@, originalObject: %@}", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_3()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v5, v6, "Initializing object from original account's main key {object: %@, account: %@}", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_2();
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_4()
{
  id *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v4, v5, "Initializing object from original object's crypto goo {object: %@, originalObject: %@}", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __77__ICCloudSyncingObjectCryptoStrategyV1_initializeCryptoPropertiesFromObject___block_invoke_cold_5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot initialize crypto properties {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __55__ICCloudSyncingObjectCryptoStrategyV1_primaryMetadata__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create primary metadata {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create primary wrapped key because object doesn't have key data {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_primaryWrappedKey__block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create primary wrapped key {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create primary encryption object because object doesn't have primary metadata {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create primary encryption object because object doesn't have key data {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV1_encryptionObjectWithData___block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot serialize encryption object {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)saveEncryptedJSON
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412802;
  v6 = v3;
  OUTLINED_FUNCTION_3_3();
  v7 = 170;
  OUTLINED_FUNCTION_21_0(&dword_1BD918000, a2, v4, "Saving encrypted values… {object: %@}%s:%d", (uint8_t *)&v5);

}

void __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot save encrypted values because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __57__ICCloudSyncingObjectCryptoStrategyV1_saveEncryptedJSON__block_invoke_9_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt values JSON {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __52__ICCloudSyncingObjectCryptoStrategyV1_encryptData___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt data {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __84__ICCloudSyncingObjectCryptoStrategyV1_encryptFileFromURL_toURL_setTagAndIVHandler___block_invoke_19_cold_1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(*(id *)(v0 + 40), "className");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v2, v3, "Error writing decrypted file for %@ %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_7();
}

+ (void)decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_1BD918000, v1, v2, "Trying to access decrypted data with no unwrapped key for %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

+ (void)decryptWithMainKeyOfObject:(os_log_t)log encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Unable to decrypt object - Falling back to decrypting with fallback tag and initializationVector", v1, 2u);
}

+ (void)decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.3()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_1BD918000, v1, v2, "Failed to create encryptedData for %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

+ (void)decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.4()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  int v3;
  uint64_t v4;

  OUTLINED_FUNCTION_5_4(*MEMORY[0x1E0C80C00]);
  v3 = 138412290;
  v4 = v0;
  OUTLINED_FUNCTION_6(&dword_1BD918000, v1, v2, "Invalid encryptedData for %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1_0();
}

+ (void)decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:.cold.5()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_11_1(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_10(&dword_1BD918000, v6, v4, "Attempting to decrypt a V1 unsupported object %@ %@", v5);

  OUTLINED_FUNCTION_1_6();
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "className");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v4, v5, "Not authenticated to encrypt V1 sidecar data for %@ (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarData___block_invoke_24_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_6_0();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 32), "className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 32), "ic_loggingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v5, "Error encrypting V1 sidecar data for %@ (%@)", v6);

  OUTLINED_FUNCTION_2();
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_cold_1()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v2, "className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ic_loggingIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "length");
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Error decrypting V1 sidecar data for %@ (%@): data length is unexpectedly short: %lu", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_7();
}

void __59__ICCloudSyncingObjectCryptoStrategyV1_decryptSidecarData___block_invoke_cold_2()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "className");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v4, v5, "Not authenticated to decrypt V1 sidecar data for %@ (%@)", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v1, "className");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "ic_loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Error coordinating access to sidecar file for encryption for %@ %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(*(id *)(v1 + 48), "className");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 48), "ic_loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Error loading sidecar file for encryption for %@ %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  OUTLINED_FUNCTION_6_0();
  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(v2 + 48), "className");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v1 + 48), "ic_loggingIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v5, "Error encrypting sidecar file data for %@ %@", v6);

  OUTLINED_FUNCTION_2();
}

void __72__ICCloudSyncingObjectCryptoStrategyV1_encryptSidecarFileFromURL_toURL___block_invoke_2_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(*(id *)(v1 + 48), "className");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(v0 + 48), "ic_loggingIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Error writing encrypted sidecar file for %@ %@: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

+ (void)encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_11_1(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_10(&dword_1BD918000, v6, v4, "No key when encrypting data for %@ %@", v5);

  OUTLINED_FUNCTION_1_6();
}

+ (void)encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_11_1(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_10(&dword_1BD918000, v6, v4, "Error executing dataPreparationBlock for %@ (%@)", v5);

  OUTLINED_FUNCTION_1_6();
}

+ (void)encryptWithMainKeyOfObject:dataPreparationBlock:failureHandler:successHandler:.cold.3()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_13_3();
  OUTLINED_FUNCTION_11_1(v1, 5.778e-34, v2, v3);
  OUTLINED_FUNCTION_10(&dword_1BD918000, v6, v4, "Attempting to encrypt a V1 unsupported object %@ %@", v5);

  OUTLINED_FUNCTION_1_6();
}

void __69__ICCloudSyncingObjectCryptoStrategyV1_decryptAndMergeEncryptedJSON___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "className");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cryptoTag");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");
  objc_msgSend(a1, "cryptoInitializationVector");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138413058;
  v10 = v4;
  v11 = 2112;
  v12 = v5;
  v13 = 2048;
  v14 = v7;
  v15 = 2048;
  v16 = objc_msgSend(v8, "hash");
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Error decrypting JSON for %@ (%@) tag.hash=%lu initializationVector.hash=%lu", (uint8_t *)&v9, 0x2Au);

}

void __52__ICCloudSyncingObjectCryptoStrategyV1_unwrappedKey__block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_3_2();
  objc_msgSend(v1, "className");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_30();
  OUTLINED_FUNCTION_1_5(&dword_1BD918000, v4, v5, "Failed to unwrap text key for %@ (%@): %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_7();
}

- (void)canMainKey:decryptObject:.cold.1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Cannot unwrap crypto passphrase verifier {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = v4;
  OUTLINED_FUNCTION_3_3();
  v8 = 891;
  OUTLINED_FUNCTION_21_0(&dword_1BD918000, a2, v5, "Rewrapping object with main key… {object: %@}%s:%d", (uint8_t *)&v6);

  OUTLINED_FUNCTION_7();
}

void __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_17();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v3, "Not rewrapping data because encryption key cannot be wrapped {object: %@, error: %@}", v4);

  OUTLINED_FUNCTION_2();
}

void __58__ICCloudSyncingObjectCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping data because merging unapplied record failed {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error generating salt for new password: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error generating new account key: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error generating new unwrapped verifier: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error wrapping account key verifier: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __75__ICCloudSyncingObjectCryptoStrategyV1_rewrapAndDivergeKeyUsingPassphrase___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Error saving context after setting password: %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create encryption metadata {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_17();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v3, "Cannot generate main key data for passphrase {object: %@, error: %@}", v4);

  OUTLINED_FUNCTION_2();
}

void __61__ICCloudSyncingObjectCryptoStrategyV1_mainKeyForPassphrase___block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create encryption main key {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
