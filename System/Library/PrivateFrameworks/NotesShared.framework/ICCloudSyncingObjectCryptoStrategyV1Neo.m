@implementation ICCloudSyncingObjectCryptoStrategyV1Neo

- (int64_t)intrinsicNotesVersion
{
  return 13;
}

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
  v14[2] = __80__ICCloudSyncingObjectCryptoStrategyV1Neo_initializeCryptoPropertiesFromObject___block_invoke;
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

void __80__ICCloudSyncingObjectCryptoStrategyV1Neo_initializeCryptoPropertiesFromObject___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected")
    && +[ICCryptoStrategyFactory cipherVersionForObject:](ICCryptoStrategyFactory, "cipherVersionForObject:", *(_QWORD *)(a1 + 32)) == 2)
  {
    +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cachedMainKeyForIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      goto LABEL_7;
    goto LABEL_8;
  }
  objc_msgSend(v15, "cloudAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accountData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v15;
  if (v8)
  {
    +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cloudAccount");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accountData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cachedMainKeyForIdentifier:", v13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
LABEL_7:
      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setCachedMainKey:forObject:", v5, v15);

    }
LABEL_8:

    v9 = v15;
  }

}

- (ICEncryptionMetadata)primaryMetadata
{
  void *v2;
  void *v3;

  -[ICCloudSyncingObjectCryptoStrategyV1Neo primaryEncryptionObject](self, "primaryEncryptionObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICEncryptionMetadata *)v3;
}

- (ICEncryptionKey)primaryWrappedKey
{
  void *v2;
  ICEncryptionKey *v3;
  void *v4;
  void *v5;
  ICEncryptionKey *v6;

  -[ICCloudSyncingObjectCryptoStrategyV1Neo primaryEncryptionObject](self, "primaryEncryptionObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = [ICEncryptionKey alloc];
    objc_msgSend(v2, "wrappedEncryptionKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "metadata");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[ICEncryptionKey initWithKeyData:metadata:](v3, "initWithKeyData:metadata:", v4, v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (ICEncryptionObject)primaryEncryptionObject
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
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__ICCloudSyncingObjectCryptoStrategyV1Neo_primaryEncryptionObject__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionObject *)v2;
}

void __66__ICCloudSyncingObjectCryptoStrategyV1Neo_primaryEncryptionObject__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  ICEncryptionObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v3 = a2;
  objc_msgSend(v3, "unappliedEncryptedRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryEncryptedDataFromRecord:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;

  }
  else
  {
    objc_msgSend(v3, "primaryEncryptedData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_8;
  }
  v7 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke_cold_1(v3);

  }
LABEL_8:

}

- (BOOL)isAuthenticated
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
  v4[2] = __58__ICCloudSyncingObjectCryptoStrategyV1Neo_isAuthenticated__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __58__ICCloudSyncingObjectCryptoStrategyV1Neo_isAuthenticated__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedMainKeyForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4 != 0;
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
  v4[2] = __59__ICCloudSyncingObjectCryptoStrategyV1Neo_hasPassphraseSet__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __59__ICCloudSyncingObjectCryptoStrategyV1Neo_hasPassphraseSet__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "unappliedEncryptedRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    objc_msgSend(v5, "primaryEncryptedData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4 != 0;

  }
}

- (NSString)passphraseHint
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
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV1Neo_passphraseHint__block_invoke;
  v4[3] = &unk_1E76C8B08;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV1Neo_passphraseHint__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "primaryMetadata");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "passphraseHint");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)mainKeyForPassphrase:(id)a3
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
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke;
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

void __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  ICEncryptionKey *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "primaryMetadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "passphraseSalt");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    +[ICCipherV1Neo keyForPassphrase:salt:iterationCount:error:](ICCipherV1Neo, "keyForPassphrase:salt:iterationCount:error:", v6, v7, objc_msgSend(v5, "passphraseIterationCount"), &v14);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v14;

    if (!v8)
    {
      v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_2();
      goto LABEL_11;
    }
    v10 = -[ICEncryptionKey initWithKeyData:metadata:]([ICEncryptionKey alloc], "initWithKeyData:metadata:", v8, v5);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
    {
      v13 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_3(v3);
LABEL_11:

    }
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_1(v3);
    v9 = v8;
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
  v7[2] = __63__ICCloudSyncingObjectCryptoStrategyV1Neo_isPassphraseCorrect___block_invoke;
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

void __63__ICCloudSyncingObjectCryptoStrategyV1Neo_isPassphraseCorrect___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "mainKeyForPassphrase:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = objc_msgSend(*(id *)(a1 + 32), "mainKeyDecryptsPrimaryData:", v2);
    v2 = v4;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  }

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
  v7[2] = __70__ICCloudSyncingObjectCryptoStrategyV1Neo_authenticateWithPassphrase___block_invoke;
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

void __70__ICCloudSyncingObjectCryptoStrategyV1Neo_authenticateWithPassphrase___block_invoke(uint64_t a1, void *a2)
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

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__12;
  v20 = __Block_byref_object_dispose__12;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke;
  v12[3] = &unk_1E76C8B58;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

void __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  ICEncryptionObject *v6;
  ICEncryptionObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  ICEncryptionObject *v18;
  void *v19;
  os_log_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  NSObject *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedMainKeyForObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", *(_QWORD *)(a1 + 32));
    v7 = v6;
    if (v6)
    {
      -[ICEncryptionObject wrappedEncryptionKey](v6, "wrappedEncryptionKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 0;
      +[ICCipherV1Neo unwrapKey:withWrapper:error:](ICCipherV1Neo, "unwrapKey:withWrapper:error:", v8, v9, &v28);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v28;

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 40), "keyData");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v11;
        +[ICCipherV1Neo wrapKey:withWrapper:error:](ICCipherV1Neo, "wrapKey:withWrapper:error:", v10, v12, &v27);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v27;

        if (v13)
        {
          objc_msgSend(*(id *)(a1 + 40), "metadata");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "identifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          +[ICEncryptionMetadata makeFromMetadata:forObjectIdentifier:](ICEncryptionMetadata, "makeFromMetadata:forObjectIdentifier:", v15, v16);
          v17 = objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = [ICEncryptionObject alloc];
            -[ICEncryptionObject encryptedData](v7, "encryptedData");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = -[ICEncryptionObject initWithMetadata:wrappedEncryptionKey:encryptedData:](v18, "initWithMetadata:wrappedEncryptionKey:encryptedData:", v17, v13, v19);

            if (v20)
            {
              -[NSObject serialized](v20, "serialized");
              v21 = objc_claimAutoreleasedReturnValue();
              v22 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
              v23 = *(NSObject **)(v22 + 40);
              *(_QWORD *)(v22 + 40) = v21;
            }
            else
            {
              v23 = os_log_create("com.apple.notes", "Crypto");
              if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
                __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_3(v3);

            }
          }
          else
          {
            v23 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
              __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_2(v3);
            v20 = v23;
          }

        }
        else
        {
          v20 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_1();
          v17 = v20;
        }

      }
      else
      {
        v17 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "shortLoggingDescription");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v30 = v26;
          v31 = 2112;
          v32 = v11;
          _os_log_impl(&dword_1BD918000, v17, OS_LOG_TYPE_INFO, "Not rewrapping data because current encryption key cannot be unwrapped {object: %@, error: %@}", buf, 0x16u);

        }
        v13 = v17;
        v14 = v11;
      }

    }
    else
    {
      v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "shortLoggingDescription");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v30 = v25;
        _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_INFO, "Not rewrapping data because encryption object cannot be deserialized {object: %@}", buf, 0xCu);

      }
      v14 = v10;
    }

  }
  else
  {
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v30 = v24;
      _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "Not rewrapping data because main key is missing {object: %@}", buf, 0xCu);

    }
    v7 = (ICEncryptionObject *)v14;
  }

}

- (BOOL)rewrapWithMainKey:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  v5 = -[ICCloudSyncingObjectCryptoStrategyV1Neo sidecarMainKeyCreateIfNeeded](self, "sidecarMainKeyCreateIfNeeded");
  v7.receiver = self;
  v7.super_class = (Class)ICCloudSyncingObjectCryptoStrategyV1Neo;
  LOBYTE(self) = -[ICCryptoStrategyBase rewrapWithMainKey:](&v7, sel_rewrapWithMainKey_, v4);

  return (char)self;
}

- (ICEncryptionKey)sidecarMainKey
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
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke;
  v4[3] = &unk_1E76C8B80;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionKey *)v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  os_log_t v5;
  ICEncryptionKey *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
  {
    if ((objc_msgSend(v3, "supportsEncryptedValuesDictionary") & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "fallbackSidecarMainKey");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      goto LABEL_13;
    }
    NSStringFromSelector(sel_sidecarMainKey);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primitiveValueForEncryptableKey:", v4);
    v5 = (os_log_t)objc_claimAutoreleasedReturnValue();

    if (-[NSObject length](v5, "length"))
    {
      v6 = -[ICEncryptionKey initWithSerializedData:]([ICEncryptionKey alloc], "initWithSerializedData:", v5);
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      {
        v9 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_1(v3);

      }
    }
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_2(v3);

  }
LABEL_13:

}

- (id)sidecarMainKeyCreateIfNeeded
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
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKeyCreateIfNeeded__block_invoke;
  v4[3] = &unk_1E76C8B80;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __71__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKeyCreateIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) == 0)
  {
    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_2(v3);
    v12 = v13;
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "supportsEncryptedValuesDictionary"))
  {
    objc_msgSend(*(id *)(a1 + 32), "sidecarMainKey");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "shortLoggingDescription");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v8;
        _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "Creating sidecar main key from fallback sidecar main key… {object: %@}", (uint8_t *)&v14, 0xCu);

      }
      objc_msgSend(*(id *)(a1 + 32), "fallbackSidecarMainKey");
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "serializedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_sidecarMainKey);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setValue:forEncryptableKey:", v12, v13);
LABEL_10:

    }
  }

}

- (ICEncryptionKey)fallbackSidecarMainKey
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
  v8 = __Block_byref_object_copy__12;
  v9 = __Block_byref_object_dispose__12;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionKey *)v2;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ICEncryptionKey *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;

  v3 = a2;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedMainKeyForObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_1(v3);
    v7 = v13;
    goto LABEL_12;
  }
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICEncryptionMetadata makeForV1NeoSidecarCipherWithObjectIdentifier:](ICEncryptionMetadata, "makeForV1NeoSidecarCipherWithObjectIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_2(v3);
    goto LABEL_11;
  }
  v8 = [ICEncryptionKey alloc];
  objc_msgSend(v5, "keyData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ICEncryptionKey initWithKeyData:metadata:](v8, "initWithKeyData:metadata:", v9, v7);
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_3(v3);
LABEL_11:

LABEL_12:
  }

}

- (BOOL)hasSameKeyAsObject:(id)a3
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
  v7[2] = __62__ICCloudSyncingObjectCryptoStrategyV1Neo_hasSameKeyAsObject___block_invoke;
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

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_hasSameKeyAsObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  int v18;
  uint64_t v19;
  BOOL v20;
  id v21;

  objc_msgSend(*(id *)(a1 + 32), "primaryMetadata");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "v1NeoStrategy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primaryMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 40), "cryptoStrategy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primaryMetadata");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v21 && v7)
  {
    objc_msgSend(v21, "passphraseSalt");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "passphraseSalt");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)*MEMORY[0x1E0C9B0D0];
    if ((void *)*MEMORY[0x1E0C9B0D0] == v10)
      v13 = 0;
    else
      v13 = v10;
    v14 = v13;
    if (v12 == v11)
      v15 = 0;
    else
      v15 = v11;
    v16 = v15;
    if (!(v14 | v16))
      goto LABEL_16;
    v17 = (void *)v16;
    if (v14 && v16)
    {
      v18 = objc_msgSend((id)v14, "isEqual:", v16);

      if (v18)
      {
LABEL_16:
        v19 = objc_msgSend(v21, "passphraseIterationCount");
        v20 = v19 == objc_msgSend(v7, "passphraseIterationCount");
LABEL_20:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v20;

        goto LABEL_21;
      }
    }
    else
    {

    }
    v20 = 0;
    goto LABEL_20;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
LABEL_21:

}

- (id)encryptData:(id)a3 encryptionKey:(id)a4 mainKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__12;
  v25 = __Block_byref_object_dispose__12;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke;
  v16[3] = &unk_1E76C8BA8;
  v11 = v9;
  v17 = v11;
  v12 = v10;
  v18 = v12;
  v13 = v8;
  v19 = v13;
  v20 = &v21;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  id v15;
  ICEncryptionObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  id v20;
  id v21;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "keyData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  +[ICCipherV1Neo wrapKey:withWrapper:error:](ICCipherV1Neo, "wrapKey:withWrapper:error:", v4, v5, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICEncryptionMetadata makeFromMetadata:forObjectIdentifier:](ICEncryptionMetadata, "makeFromMetadata:forObjectIdentifier:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 48);
      v12 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v10, "authenticatedData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v7;
      +[ICCipherV1Neo encryptData:withKey:additionalAuthenticatedData:error:](ICCipherV1Neo, "encryptData:withKey:additionalAuthenticatedData:error:", v11, v12, v13, &v20);
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = v20;

      if (v14)
      {
        v16 = -[ICEncryptionObject initWithMetadata:wrappedEncryptionKey:encryptedData:]([ICEncryptionObject alloc], "initWithMetadata:wrappedEncryptionKey:encryptedData:", v10, v6, v14);
        v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v18 = *(void **)(v17 + 40);
        *(_QWORD *)(v17 + 40) = v16;

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        {
LABEL_17:
          v7 = v15;
          goto LABEL_18;
        }
        v19 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_4(v3);
      }
      else
      {
        v19 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_3();
      }

    }
    else
    {
      v19 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_2(v3);
      v14 = v19;
      v15 = v7;
    }

    goto LABEL_17;
  }
  v14 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_1();
  v10 = v14;
LABEL_18:

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
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke;
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

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  NSObject *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedMainKeyForObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "primaryEncryptionObject");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      -[NSObject wrappedEncryptionKey](v6, "wrappedEncryptionKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      +[ICCipherV1Neo unwrapKey:withWrapper:error:](ICCipherV1Neo, "unwrapKey:withWrapper:error:", v8, v9, &v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v20;

      if (!v10)
      {
        v12 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "shortLoggingDescription");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v22 = v13;
          v23 = 2112;
          v24 = v11;
          _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "Cannot unwrap primary encryption key {object: %@, error: %@}", buf, 0x16u);

        }
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v19 = 0;
      objc_msgSend(MEMORY[0x1E0C99D50], "ic_random256BitData:", &v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v19;
      v15 = os_log_create("com.apple.notes", "Crypto");
      v12 = v15;
      if (!v10)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke_cold_1();
        goto LABEL_16;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "shortLoggingDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v22 = v16;
        _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "Generated new encryption key {object: %@}", buf, 0xCu);

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "encryptData:encryptionKey:mainKey:", *(_QWORD *)(a1 + 40), v10, v5);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(NSObject **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;
LABEL_17:

    goto LABEL_18;
  }
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "shortLoggingDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "Cannot encrypt data because object is not authenticated {object: %@}", buf, 0xCu);

  }
  v11 = v7;
LABEL_18:

}

- (id)encryptSidecarData:(id)a3
{
  id v4;
  id v5;
  void *v6;
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
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptSidecarData___block_invoke;
  v8[3] = &unk_1E76C8BD0;
  v8[4] = self;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  objc_msgSend((id)v12[5], "serialized");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  id v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sidecarMainKeyCreateIfNeeded");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    || (objc_msgSend(*(id *)(a1 + 32), "fallbackSidecarMainKey"),
        (v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random256BitData:", &v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v10;
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 32), "encryptData:encryptionKey:mainKey:", *(_QWORD *)(a1 + 40), v5, v4);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v9 = *(NSObject **)(v8 + 40);
      *(_QWORD *)(v8 + 40) = v7;
    }
    else
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke_cold_1();

    }
  }
  else
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __62__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptSidecarData___block_invoke_cold_1(v3);
    v6 = v4;
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
    -[ICCloudSyncingObjectCryptoStrategyV1Neo saveEncryptedJSON].cold.1(self);

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke;
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
    v20 = "-[ICCloudSyncingObjectCryptoStrategyV1Neo saveEncryptedJSON]";
    v21 = 1024;
    v22 = 570;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Saved encrypted values JSON {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

void __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  os_log_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "encryptedValuesJSON");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "supportsEncryptedValuesDictionary"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
    {
      objc_msgSend(v3, "serializedValuesToEncrypt");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 32), "encryptData:", v5);
        v6 = (os_log_t)objc_claimAutoreleasedReturnValue();
        -[NSObject serialized](v6, "serialized");
        v7 = objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          objc_msgSend(v3, "setEncryptedValuesJSON:", v7);
          objc_msgSend(v3, "applyRandomCryptoGooIfNeeded");
          if (!v4)
            objc_msgSend(v3, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        }
        else
        {
          v9 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke_cold_1(v3);

        }
      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        v7 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "shortLoggingDescription");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = 138412290;
          v11 = v8;
          _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "No encrypted values JSON to save — skipping {object: %@}", (uint8_t *)&v10, 0xCu);

        }
        v6 = v7;
      }

    }
    else
    {
      v6 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke_cold_2(v3);
      v5 = v6;
    }

  }
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  ICCloudSyncingObjectCryptoStrategyV1Neo *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyDecryptsPrimaryData___block_invoke;
  v7[3] = &unk_1E76C8B58;
  v5 = v4;
  v8 = v5;
  v9 = self;
  v10 = &v11;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v7);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __70__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyDecryptsPrimaryData___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cipherVersion");

  if (v3 == 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "primaryWrappedKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "keyData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "keyData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 0;
      +[ICCipherV1Neo unwrapKey:withWrapper:error:](ICCipherV1Neo, "unwrapKey:withWrapper:error:", v6, v7, &v10);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v10;

      if (v8)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
}

- (id)decryptObject:(id)a3 encryptionKey:(id)a4 mainKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__12;
  v23 = __Block_byref_object_dispose__12;
  v24 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke;
  v15[3] = &unk_1E76C8BD0;
  v11 = v8;
  v16 = v11;
  v18 = &v19;
  v12 = v9;
  v17 = v12;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v15);
  v13 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v13;
}

void __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  id v17;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke_cold_2();
    v13 = 0;
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 32), "encryptedData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "metadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "authenticatedData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[ICCipherV1Neo decryptData:withKey:additionalAuthenticatedData:error:](ICCipherV1Neo, "decryptData:withKey:additionalAuthenticatedData:error:", v8, v9, v11, &v17);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v17;
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v12;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v16 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke_cold_1();
LABEL_8:

  }
}

- (id)decryptData:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICCloudSyncingObjectCryptoStrategyV1Neo *v10;
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
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke;
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

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  ICEncryptionObject *v6;
  void *v7;
  NSObject *v8;
  ICEncryptionObject *v9;
  NSObject *p_super;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;

  v3 = a2;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedMainKeyForObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", *(_QWORD *)(a1 + 32));
    if (!v6)
    {
      p_super = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_2(v3);
      v8 = p_super;
      goto LABEL_25;
    }
    objc_msgSend(v3, "unappliedEncryptedRecord");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "primaryEncryptedDataFromRecord:", v7);
    v8 = objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", v8);
      if (!v9)
      {
        v9 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
          __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_4(v3);
        p_super = &v9->super;
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
    }
    else
    {
      v9 = 0;
    }
    -[ICEncryptionObject wrappedEncryptionKey](v9, "wrappedEncryptionKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[ICEncryptionObject wrappedEncryptionKey](v6, "wrappedEncryptionKey");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    objc_msgSend(v5, "keyData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    +[ICCipherV1Neo unwrapKey:withWrapper:error:](ICCipherV1Neo, "unwrapKey:withWrapper:error:", v14, v15, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    p_super = v20;

    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "decryptObject:encryptionKey:mainKey:", v6, v16, v5);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v19 = *(NSObject **)(v18 + 40);
      *(_QWORD *)(v18 + 40) = v17;
    }
    else
    {
      v19 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_3();

    }
    goto LABEL_24;
  }
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_1(v3);
  v6 = (ICEncryptionObject *)v8;
LABEL_26:

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
  v14 = __Block_byref_object_copy__12;
  v15 = __Block_byref_object_dispose__12;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke;
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

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  ICEncryptionObject *v6;
  ICEncryptionObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  BOOL v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "sidecarMainKey");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "fallbackSidecarMainKey");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v4 | v5)
  {
    v6 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", *(_QWORD *)(a1 + 40));
    v7 = v6;
    if (v6)
    {
      if (v4)
      {
        -[ICEncryptionObject wrappedEncryptionKey](v6, "wrappedEncryptionKey");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v4, "keyData");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = 0;
        +[ICCipherV1Neo unwrapKey:withWrapper:error:](ICCipherV1Neo, "unwrapKey:withWrapper:error:", v8, v9, &v25);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v25;

        if (v10)
        {
          objc_msgSend(*(id *)(a1 + 32), "decryptObject:encryptionKey:mainKey:", v7, v10, v4);
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v14 = *(NSObject **)(v13 + 40);
          *(_QWORD *)(v13 + 40) = v12;
        }
        else
        {
          v14 = os_log_create("com.apple.notes", "Crypto");
          v18 = os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG);
          if (v5)
          {
            if (v18)
              __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_3();
          }
          else if (v18)
          {
            __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_4();
          }

        }
      }
      else
      {
        v11 = 0;
      }
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        v19 = 1;
      else
        v19 = v5 == 0;
      if (v19)
        goto LABEL_27;
      -[ICEncryptionObject wrappedEncryptionKey](v7, "wrappedEncryptionKey");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v5, "keyData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v11;
      +[ICCipherV1Neo unwrapKey:withWrapper:error:](ICCipherV1Neo, "unwrapKey:withWrapper:error:", v20, v21, &v24);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v24;

      if (v17)
      {
        objc_msgSend(*(id *)(a1 + 32), "decryptObject:encryptionKey:mainKey:", v7, v17, v4);
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v15 = *(NSObject **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;
      }
      else
      {
        v15 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_2();

      }
    }
    else
    {
      v15 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_1(v3);
      v16 = 0;
      v17 = v15;
    }

    v11 = v16;
LABEL_27:

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
  v4[2] = __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke;
  v4[3] = &unk_1E76C8B80;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v8;
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Cannot load decrypted values because object is not authenticated — failing {object: %@}", (uint8_t *)&v12, 0xCu);

    }
    goto LABEL_19;
  }
  if ((objc_msgSend(v3, "needsToLoadDecryptedValues") & 1) != 0)
  {
    objc_msgSend(v3, "encryptedValuesJSON");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "decryptData:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v3, "deserializeAndMergeValues:", v5);
        objc_msgSend(v3, "setNeedsToLoadDecryptedValues:", 0);
        objc_msgSend(v3, "managedObjectContext");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "concurrencyType");

        if (v7 == 2)
          objc_msgSend(v3, "mergeUnappliedEncryptedRecord");
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }
      else
      {
        v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke_cold_1(v3);

      }
    }
    else
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "shortLoggingDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Cannot load decrypted values because encrypted values JSON is nil — succeeding {object: %@}", (uint8_t *)&v12, 0xCu);

      }
      objc_msgSend(v3, "setNeedsToLoadDecryptedValues:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
LABEL_19:

    goto LABEL_20;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_20:

}

- (BOOL)isRecordAuthenticated:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  ICCloudSyncingObjectCryptoStrategyV1Neo *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__ICCloudSyncingObjectCryptoStrategyV1Neo_isRecordAuthenticated___block_invoke;
  v7[3] = &unk_1E76C8BD0;
  v5 = v4;
  v9 = self;
  v10 = &v11;
  v8 = v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v7);
  LOBYTE(self) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)self;
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_isRecordAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  ICEncryptionObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  NSObject *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "primaryEncryptedDataFromRecord:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", v3);
    if (v4)
    {
      +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "object");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cachedMainKeyForObject:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
      {
LABEL_15:

        goto LABEL_16;
      }
      -[ICEncryptionObject wrappedEncryptionKey](v4, "wrappedEncryptionKey");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keyData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      +[ICCipherV1Neo unwrapKey:withWrapper:error:](ICCipherV1Neo, "unwrapKey:withWrapper:error:", v8, v9, &v15);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v15;

      if (v10)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        v12 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 40), "object");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "shortLoggingDescription");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v17 = v14;
          v18 = 2112;
          v19 = v11;
          _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "Cannot unwrap encryption key {object: %@, error: %@}", buf, 0x16u);

        }
      }

    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __65__ICCloudSyncingObjectCryptoStrategyV1Neo_isRecordAuthenticated___block_invoke_cold_1(a1);
      v7 = v11;
    }

    goto LABEL_15;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_16:

}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
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
    -[ICCloudSyncingObjectCryptoStrategyV1Neo mergeEncryptedDataFromRecord:].cold.1(self);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72__ICCloudSyncingObjectCryptoStrategyV1Neo_mergeEncryptedDataFromRecord___block_invoke;
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
    v25 = "-[ICCloudSyncingObjectCryptoStrategyV1Neo mergeEncryptedDataFromRecord:]";
    v26 = 1024;
    v27 = 860;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Merged encrypted data from record {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __72__ICCloudSyncingObjectCryptoStrategyV1Neo_mergeEncryptedDataFromRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "isAuthenticated")
    && (objc_msgSend(*(id *)(a1 + 32), "isRecordAuthenticated:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "loadDecryptedValuesIfNecessary");
    objc_msgSend(*(id *)(a1 + 40), "ic_inlineableDataAssetForKeyPrefix:", CFSTR("EncryptedValues"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "decryptData:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        objc_msgSend(v3, "deserializeAndMergeValues:", v5);
        if (objc_msgSend(*(id *)(a1 + 32), "saveEncryptedJSON"))
          objc_msgSend(v3, "setUnappliedEncryptedRecord:", 0);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        v8 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke_cold_1(v3);

      }
    }
    else
    {
      v6 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "shortLoggingDescription");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412290;
        v10 = v7;
        _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Not merging empty encrypted values JSON {object: %@}", (uint8_t *)&v9, 0xCu);

      }
      objc_msgSend(v3, "setUnappliedEncryptedRecord:", 0);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }

  }
  else
  {
    objc_msgSend(v3, "setUnappliedEncryptedRecord:", *(_QWORD *)(a1 + 40));
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
  v7[2] = __70__ICCloudSyncingObjectCryptoStrategyV1Neo_recordHasChangedPassphrase___block_invoke;
  v7[3] = &unk_1E76C8B80;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __70__ICCloudSyncingObjectCryptoStrategyV1Neo_recordHasChangedPassphrase___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  ICEncryptionObject *v4;
  void *v5;
  ICEncryptionObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  BOOL v15;
  char v16;
  id v17;

  v17 = a2;
  objc_msgSend(v17, "primaryEncryptedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", v3);
  else
    v4 = 0;
  objc_msgSend(v17, "primaryEncryptedDataFromRecord:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", v5);
  else
    v6 = 0;
  -[ICEncryptionObject wrappedEncryptionKey](v4, "wrappedEncryptionKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICEncryptionObject wrappedEncryptionKey](v6, "wrappedEncryptionKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v7)
    v10 = 0;
  else
    v10 = v7;
  v11 = v10;
  if (v9 == v8)
    v12 = 0;
  else
    v12 = v8;
  v13 = v12;
  v14 = (void *)v13;
  if (v11 | v13)
  {
    if (v11)
      v15 = v13 == 0;
    else
      v15 = 1;
    if (v15)
      v16 = 1;
    else
      v16 = objc_msgSend((id)v11, "isEqual:", v13) ^ 1;
  }
  else
  {
    v16 = 0;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v16;
}

void __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot retrieve primary encryption metadata {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot generate main key data for passphrase {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_3(void *a1)
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

void __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Not rewrapping data because encryption key cannot be wrapped {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create metadata {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __78__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptedData_rewrappedWithMainKey___block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping data because encryption object cannot be serialized {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot deserialize sidecar main key {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __57__ICCloudSyncingObjectCryptoStrategyV1Neo_sidecarMainKey__block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Cannot retrieve sidecar main key because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Cannot create fallback sidecar main key because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create fallback sidecar metadata {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_fallbackSidecarMainKey__block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create fallback sidecar main key {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot wrap new encryption key {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot encrypt data {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __77__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData_encryptionKey_mainKey___block_invoke_cold_4(void *a1)
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

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptData___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot generate new encryption key {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_encryptSidecarData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot retrieve sidecar main key {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)saveEncryptedJSON
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Saving encrypted values JSON… {object: %@}%s:%d", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

void __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot serialize encrypted values JSON — failing {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __60__ICCloudSyncingObjectCryptoStrategyV1Neo_saveEncryptedJSON__block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot save encrypted values JSON because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot decrypt data {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __79__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptObject_encryptionKey_mainKey___block_invoke_cold_2()
{
  id *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "metadata");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Cannot decrypt data because object identifier doesn't match {object: %@, metadata: %@}", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_2();
}

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt data because object is not authenticated {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot deserialize encryption object {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot unwrap encryption key and there is no unapplied record {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __55__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptData___block_invoke_cold_4(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot deserialize record encryption object {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot deserialize sidecar encryption object {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Cannot unwrap sidecar encryption key using fallback key {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Cannot unwrap sidecar encryption key — trying fallback key {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __62__ICCloudSyncingObjectCryptoStrategyV1Neo_decryptSidecarData___block_invoke_cold_4()
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
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Cannot unwrap sidecar encryption key {object: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __73__ICCloudSyncingObjectCryptoStrategyV1Neo_loadDecryptedValuesIfNecessary__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt encrypted values JSON — failing {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV1Neo_isRecordAuthenticated___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(*(id *)(a1 + 40), "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v3, v4, "Cannot deserialize record primary encrypted data — treating as unauthenticated {object: %@}", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)mergeEncryptedDataFromRecord:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Merging encrypted data from record… {object: %@}%s:%d", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

@end
