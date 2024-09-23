@implementation ICCloudSyncingObjectCryptoStrategyV2

- (ICEncryptionMetadata)primaryMetadata
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
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__ICCloudSyncingObjectCryptoStrategyV2_primaryMetadata__block_invoke;
  v4[3] = &unk_1E76C8B08;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionMetadata *)v2;
}

void __55__ICCloudSyncingObjectCryptoStrategyV2_primaryMetadata__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentAccountKeyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICEncryptionMetadata makeForV2CipherWithObjectIdentifier:accountKeyIdentifier:](ICEncryptionMetadata, "makeForV2CipherWithObjectIdentifier:accountKeyIdentifier:", v4, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __55__ICCloudSyncingObjectCryptoStrategyV2_primaryMetadata__block_invoke_cold_1(v3);

  }
}

- (ICEncryptionKey)primaryWrappedKey
{
  return 0;
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
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__ICCloudSyncingObjectCryptoStrategyV2_primaryEncryptionObject__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionObject *)v2;
}

void __63__ICCloudSyncingObjectCryptoStrategyV2_primaryEncryptionObject__block_invoke(uint64_t a1, void *a2)
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
      __63__ICCloudSyncingObjectCryptoStrategyV2_primaryEncryptionObject__block_invoke_cold_1(v3);

  }
LABEL_8:

}

- (BOOL)hasSameKeyAsObject:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  ICCloudSyncingObjectCryptoStrategyV2 *v9;
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
  v7[2] = __59__ICCloudSyncingObjectCryptoStrategyV2_hasSameKeyAsObject___block_invoke;
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

void __59__ICCloudSyncingObjectCryptoStrategyV2_hasSameKeyAsObject___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  char v23;
  id v24;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "v2Strategy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v24 = v4;
  }
  else
  {
    objc_opt_class();
    objc_msgSend(*(id *)(a1 + 32), "cryptoStrategy");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v24 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(*(id *)(a1 + 40), "primaryMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountKeyIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "currentAccountKeyIdentifier");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v24, "primaryMetadata");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accountKeyIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v15 = v13;
  }
  else
  {
    objc_msgSend(v24, "currentAccountKeyIdentifier");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;

  v17 = (void *)*MEMORY[0x1E0C9B0D0];
  if ((void *)*MEMORY[0x1E0C9B0D0] == v11)
    v18 = 0;
  else
    v18 = v11;
  v19 = v18;
  if (v17 == v16)
    v20 = 0;
  else
    v20 = v16;
  v21 = v20;
  v22 = (void *)v21;
  if (v19 | v21)
  {
    v23 = 0;
    if (v19 && v21)
      v23 = objc_msgSend((id)v19, "isEqual:", v21);
  }
  else
  {
    v23 = 1;
  }

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v23;
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
    -[ICCloudSyncingObjectCryptoStrategyV2 saveEncryptedJSON].cold.1(self, v3);

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ICCloudSyncingObjectCryptoStrategyV2_saveEncryptedJSON__block_invoke;
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
    v20 = "-[ICCloudSyncingObjectCryptoStrategyV2 saveEncryptedJSON]";
    v21 = 1024;
    v22 = 129;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Saved encrypted values JSON {object: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

void __57__ICCloudSyncingObjectCryptoStrategyV2_saveEncryptedJSON__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "supportsEncryptedValuesDictionary"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
    {
      objc_msgSend(v3, "serializedValuesToEncrypt");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        objc_msgSend(*(id *)(a1 + 32), "encryptData:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "serializeToEncryptedValuesJSON:", v5);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

      }
      else
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        v6 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "shortLoggingDescription");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = 138412290;
          v9 = v7;
          _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "No encrypted values JSON to save — skipping {object: %@}", (uint8_t *)&v8, 0xCu);

        }
      }
    }
    else
    {
      v4 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __57__ICCloudSyncingObjectCryptoStrategyV2_saveEncryptedJSON__block_invoke_cold_1(v3);

    }
  }

}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  ICCloudSyncingObjectCryptoStrategyV2 *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke;
  v11[3] = &unk_1E76C8BA8;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = self;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v11);
  LOBYTE(self) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)self;
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;

  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_1(v3);
    goto LABEL_10;
  }
  if (!*(_QWORD *)(a1 + 40))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_2(v3);
LABEL_10:
    v5 = v4;
    goto LABEL_15;
  }
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v5 || !v4)
  {
    v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_3();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "encryptData:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 48), "serialize:toURL:", v6, *(_QWORD *)(a1 + 40));
  }

LABEL_15:
}

- (int64_t)intrinsicNotesVersion
{
  return 9;
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
  v4[2] = __70__ICCloudSyncingObjectCryptoStrategyV2_loadDecryptedValuesIfNecessary__block_invoke;
  v4[3] = &unk_1E76C8B80;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __70__ICCloudSyncingObjectCryptoStrategyV2_loadDecryptedValuesIfNecessary__block_invoke(uint64_t a1, void *a2)
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
  ICCloudSyncingObjectCryptoStrategyV2 *v10;
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
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICCloudSyncingObjectCryptoStrategyV2_decryptData___block_invoke;
  v8[3] = &unk_1E76C8B58;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_decryptData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ICEncryptionObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v8;
      _os_log_impl(&dword_1BD918000, &v4->super, OS_LOG_TYPE_INFO, "input is nil when calling decryptData: for %@", (uint8_t *)&v10, 0xCu);

    }
    goto LABEL_11;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isAuthenticated"))
  {
    v4 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", *(_QWORD *)(a1 + 32));
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "decryptObject:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    else
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __52__ICCloudSyncingObjectCryptoStrategyV2_decryptData___block_invoke_cold_1(v3);

    }
LABEL_11:

  }
}

- (id)decryptedDataFromFileURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICCloudSyncingObjectCryptoStrategyV2 *v10;
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
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__ICCloudSyncingObjectCryptoStrategyV2_decryptedDataFromFileURL___block_invoke;
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

void __65__ICCloudSyncingObjectCryptoStrategyV2_decryptedDataFromFileURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  BOOL v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 0, &v12);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v6)
      v7 = 1;
    else
      v7 = v5 == 0;
    if (v7)
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __65__ICCloudSyncingObjectCryptoStrategyV2_decryptedDataFromFileURL___block_invoke_cold_1();

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "decryptData:", v5);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v11 = *(NSObject **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = v9;
    }

  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "fileURL is nil when trying to decrypt for %@", buf, 0xCu);

    }
    v6 = v5;
  }

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
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke;
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

void __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) == 0)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke_cold_2();
    v4 = v8;
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "encryptData:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serialized");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke_cold_1();

LABEL_9:
  }

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
  v14 = __Block_byref_object_copy__8;
  v15 = __Block_byref_object_dispose__8;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke;
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

void __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke_cold_2();
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "decryptData:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke_cold_1();
LABEL_7:

  }
}

- (id)encryptedDataFromRecord:(id)a3
{
  return (id)objc_msgSend(a3, "ic_inlineableDataAssetForKeyPrefix:", CFSTR("EncryptedValues"));
}

- (BOOL)isRecordAuthenticated:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAuthenticatedWithDevicePassword"))
    v6 = -[ICCloudSyncingObjectCryptoStrategyV2 canAuthenticateRecord:](self, "canAuthenticateRecord:", v4);
  else
    v6 = 0;

  return v6;
}

- (BOOL)canAuthenticateRecord:(id)a3
{
  void *v4;
  ICEncryptionObject *v5;
  os_log_t p_super;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  NSObject *v11;
  uint8_t v13[16];

  -[ICCloudSyncingObjectCryptoStrategyV2 encryptedDataFromRecord:](self, "encryptedDataFromRecord:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", v4);
    p_super = &v5->super;
    if (v5)
    {
      -[ICEncryptionObject metadata](v5, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountKeyIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8)
      {

        -[ICCloudSyncingObjectCryptoStrategyV2 accountKeyWithIdentifier:createIfNotExist:](self, "accountKeyWithIdentifier:createIfNotExist:", v8, 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9 != 0;

        p_super = (os_log_t)v8;
        goto LABEL_12;
      }
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ICCloudSyncingObjectCryptoStrategyV2 canAuthenticateRecord:].cold.2();
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[ICCloudSyncingObjectCryptoStrategyV2 canAuthenticateRecord:].cold.1();
    }

    v10 = 0;
    goto LABEL_12;
  }
  p_super = os_log_create("com.apple.notes", "Crypto");
  v10 = 1;
  if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_1BD918000, p_super, OS_LOG_TYPE_INFO, "No encrypted data when in isRecordAuthenticated:", v13, 2u);
  }
LABEL_12:

  return v10;
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
  v7[2] = __69__ICCloudSyncingObjectCryptoStrategyV2_mergeEncryptedDataFromRecord___block_invoke;
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

void __69__ICCloudSyncingObjectCryptoStrategyV2_mergeEncryptedDataFromRecord___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isRecordAuthenticated:", *(_QWORD *)(a1 + 40)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "ic_inlineableDataAssetForKeyPrefix:", CFSTR("EncryptedValues"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "loadDecryptedValuesIfNecessary");
    if (!v4)
      goto LABEL_6;
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v6;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Merging encrypted values from cloud for %@", (uint8_t *)&v7, 0xCu);

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
  _QWORD v6[4];
  id v7;
  ICCloudSyncingObjectCryptoStrategyV2 *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __69__ICCloudSyncingObjectCryptoStrategyV2_decryptAndMergeEncryptedJSON___block_invoke;
  v6[3] = &unk_1E76C8BF8;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v6);

}

void __69__ICCloudSyncingObjectCryptoStrategyV2_decryptAndMergeEncryptedJSON___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = os_log_create("com.apple.notes", "Crypto");
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      objc_msgSend(v3, "className");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "shortLoggingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "Merging encrypted JSON for %@ (%@)", (uint8_t *)&v11, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 40), "decryptData:", *(_QWORD *)(a1 + 32));
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "deserializeAndMergeValues:", v5);
    }
    else
    {
      v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __69__ICCloudSyncingObjectCryptoStrategyV2_decryptAndMergeEncryptedJSON___block_invoke_cold_1(v3);

    }
  }
  else
  {
    if (v6)
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "encryptedJSON is nil when trying to decrypt for %@", (uint8_t *)&v11, 0xCu);

    }
  }

}

- (BOOL)recordHasChangedPassphrase:(id)a3
{
  return 0;
}

- (BOOL)mainKeyDecryptsPrimaryData:(id)a3
{
  return 0;
}

- (id)encryptedData:(id)a3 rewrappedWithMainKey:(id)a4
{
  return 0;
}

- (BOOL)rewrapDataAtURL:(id)a3 withMainKey:(id)a4
{
  return 0;
}

- (BOOL)rewrapWithMainKey:(id)a3
{
  return 0;
}

- (BOOL)canAuthenticate
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
  v4[2] = __55__ICCloudSyncingObjectCryptoStrategyV2_canAuthenticate__block_invoke;
  v4[3] = &unk_1E76C8B80;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __55__ICCloudSyncingObjectCryptoStrategyV2_canAuthenticate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "primaryEncryptedData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  if (v3)
    objc_msgSend(v4, "accountKeyIdentifier");
  else
    objc_msgSend(v4, "currentAccountKeyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "accountKeyWithIdentifier:createIfNotExist:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v8, "unappliedEncryptedRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "canAuthenticateRecord:", v7);
      else
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;

    }
  }

}

- (BOOL)isAuthenticated
{
  void *v3;
  BOOL v4;

  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isAuthenticatedWithDevicePassword"))
    v4 = -[ICCloudSyncingObjectCryptoStrategyV2 canAuthenticate](self, "canAuthenticate");
  else
    v4 = 0;

  return v4;
}

- (BOOL)authenticateWithPassphrase:(id)a3
{
  return 0;
}

- (id)accountIdentifier
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
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV2_accountIdentifier__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV2_accountIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  objc_msgSend(v3, "cloudAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __57__ICCloudSyncingObjectCryptoStrategyV2_accountIdentifier__block_invoke_cold_1();

  }
}

- (NSString)accountDsid
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
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ICCloudSyncingObjectCryptoStrategyV2_accountDsid__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __51__ICCloudSyncingObjectCryptoStrategyV2_accountDsid__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend(v3, "cloudAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "accountType") == 1)
  {
    objc_msgSend(v4, "dsid");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = CFSTR("local");
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __51__ICCloudSyncingObjectCryptoStrategyV2_accountDsid__block_invoke_cold_1();

  }
}

- (BOOL)isInICloudAccount
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
  v4[2] = __57__ICCloudSyncingObjectCryptoStrategyV2_isInICloudAccount__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __57__ICCloudSyncingObjectCryptoStrategyV2_isInICloudAccount__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "cloudAccount");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "accountType") == 1;

}

- (BOOL)shouldSpoofAccountKey
{
  return objc_msgSend(MEMORY[0x1E0D641E0], "isRunningUnitTests");
}

- (NSString)accountKeyIdentifier
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
  v8 = __Block_byref_object_copy__8;
  v9 = __Block_byref_object_dispose__8;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke;
  v4[3] = &unk_1E76C8B30;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSString *)v2;
}

void __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  ICEncryptionObject *v5;
  ICEncryptionObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;

  v3 = a2;
  objc_msgSend(v3, "primaryEncryptedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[ICEncryptionObject initWithSerializedData:]([ICEncryptionObject alloc], "initWithSerializedData:", v4);
    v6 = v5;
    if (v5)
    {
      -[ICEncryptionObject metadata](v5, "metadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "accountKeyIdentifier");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke_cold_1(v3);

    }
  }

}

- (NSString)currentAccountKeyIdentifier
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  ICCloudSyncingObjectCryptoStrategyV2 *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (-[ICCloudSyncingObjectCryptoStrategyV2 shouldSpoofAccountKey](self, "shouldSpoofAccountKey"))
    return (NSString *)CFSTR("e76073b6-5080-49e8-bee4-876f4c63a95f");
  -[ICCloudSyncingObjectCryptoStrategyV2 accountIdentifier](self, "accountIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICCloudSyncingObjectCryptoStrategyV2 accountDsid](self, "accountDsid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__8;
    v18 = __Block_byref_object_dispose__8;
    v19 = 0;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke;
    v9[3] = &unk_1E76C8C20;
    v10 = v5;
    v13 = &v14;
    v11 = v4;
    v12 = self;
    -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v9);
    v7 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObjectCryptoStrategyV2 currentAccountKeyIdentifier].cold.1();

    v7 = 0;
  }

  return (NSString *)v7;
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("currentAccountKeyIdentifierCipherV2"), *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICKeychain stringForIdentifier:account:isSynced:](ICKeychain, "stringForIdentifier:account:isSynced:", v2, *(_QWORD *)(a1 + 32), 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = a1 + 56;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v27 = v8;
      _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "currentAccountKeyIdentifier for account identifier %@ doesn't exist, generating a new one.", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)v4 + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_4();

    objc_msgSend(*(id *)(a1 + 48), "accountKeyWithIdentifier:createIfNotExist:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = os_log_create("com.apple.notes", "Crypto");
    v16 = v15;
    if (v14)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_3();

      v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v18 = *(_QWORD *)(a1 + 32);
      v25 = 0;
      v19 = +[ICKeychain setString:forIdentifier:account:shouldSync:error:](ICKeychain, "setString:forIdentifier:account:shouldSync:error:", v17, v2, v18, 1, &v25);
      v20 = v25;
      if (v20 || !v19)
      {
        v21 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_2();

        v22 = *(_QWORD *)(*(_QWORD *)v4 + 8);
        v23 = *(void **)(v22 + 40);
        *(_QWORD *)(v22 + 40) = 0;

      }
    }
    else
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_1();

      v24 = *(_QWORD *)(*(_QWORD *)v4 + 8);
      v20 = *(id *)(v24 + 40);
      *(_QWORD *)(v24 + 40) = 0;
    }

  }
}

+ (NSMutableDictionary)accountKeyByIdentifier
{
  id v2;
  void *v3;

  if (accountKeyByIdentifier)
  {
    v2 = (id)accountKeyByIdentifier;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)accountKeyByIdentifier;
  accountKeyByIdentifier = (uint64_t)v2;

  return (NSMutableDictionary *)(id)accountKeyByIdentifier;
}

- (id)accountKeyWithIdentifier:(id)a3 createIfNotExist:(BOOL)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  id v24;
  id v25;
  id v26;
  ICCloudSyncingObjectCryptoStrategyV2 *v27;
  uint64_t *v28;
  BOOL v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  v6 = a3;
  if (-[ICCloudSyncingObjectCryptoStrategyV2 shouldSpoofAccountKey](self, "shouldSpoofAccountKey"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_dataFromHexString:", CFSTR("5bc7dbbe cf8be96a aa12f008 4324368a bc99a2b2 35753242 b096322d 743799dc"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "accountKeyByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v8);
    objc_msgSend((id)objc_opt_class(), "accountKeyByIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend((id)objc_opt_class(), "accountKeyByIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v6);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      objc_sync_exit(v8);
    }
    else
    {
      objc_sync_exit(v8);

      -[ICCloudSyncingObjectCryptoStrategyV2 accountIdentifier](self, "accountIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICCloudSyncingObjectCryptoStrategyV2 accountDsid](self, "accountDsid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v30 = 0;
        v31 = &v30;
        v32 = 0x3032000000;
        v33 = __Block_byref_object_copy__8;
        v34 = __Block_byref_object_dispose__8;
        v35 = 0;
        v20 = MEMORY[0x1E0C809B0];
        v21 = 3221225472;
        v22 = __82__ICCloudSyncingObjectCryptoStrategyV2_accountKeyWithIdentifier_createIfNotExist___block_invoke;
        v23 = &unk_1E76C8C48;
        v28 = &v30;
        v14 = v6;
        v24 = v14;
        v25 = v13;
        v29 = a4;
        v26 = v8;
        v27 = self;
        -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", &v20);
        objc_msgSend((id)objc_opt_class(), "accountKeyByIdentifier", v20, v21, v22, v23);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_sync_enter(v15);
        v16 = v31[5];
        objc_msgSend((id)objc_opt_class(), "accountKeyByIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v14);

        objc_sync_exit(v15);
        v7 = (id)v31[5];

        _Block_object_dispose(&v30, 8);
      }
      else
      {
        v18 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[ICCloudSyncingObjectCryptoStrategyV2 currentAccountKeyIdentifier].cold.1();

        v7 = 0;
      }

    }
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[ICCloudSyncingObjectCryptoStrategyV2 accountKeyWithIdentifier:createIfNotExist:].cold.1();

    v7 = 0;
  }

  return v7;
}

void __82__ICCloudSyncingObjectCryptoStrategyV2_accountKeyWithIdentifier_createIfNotExist___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  os_log_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  NSObject *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[ICKeychain dataForIdentifier:account:isSynced:authenticationContext:](ICKeychain, "dataForIdentifier:account:isSynced:authenticationContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "length"))
  {
    objc_msgSend(v3, "setHasMissingKeychainItem:", 0);
    goto LABEL_21;
  }
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v39 = v8;
    v40 = 2112;
    v41 = v9;
    _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "accountKey for identifier %@ under account identifier %@ doesn't exist", buf, 0x16u);
  }

  objc_msgSend(v3, "cloudAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[ICKeychain isSyncAvailableForAccount:](ICKeychain, "isSyncAvailableForAccount:", v10);

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(v3, "cloudAccount");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "accountType") == 3 || v11;
    if (v13 != 1)
    {
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = 0;

      v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __82__ICCloudSyncingObjectCryptoStrategyV2_accountKeyWithIdentifier_createIfNotExist___block_invoke_cold_1((uint64_t *)(a1 + 32), a1, v18);
      goto LABEL_19;
    }
    v14 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v39 = v15;
      v40 = 2112;
      v41 = v16;
      _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "creating accountKey for identifier %@ under account identifier %@", buf, 0x16u);
    }

    v37 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random256BitData:", &v37);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v37;
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v20 = *(void **)(v19 + 40);
    *(_QWORD *)(v19 + 40) = v17;

    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v22 = *(void **)(v21 + 40);
    if (v18 || !v22)
    {
      *(_QWORD *)(v21 + 40) = 0;

      v23 = os_log_create("com.apple.notes", "Crypto");
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

LABEL_19:
LABEL_20:

        goto LABEL_21;
      }
      v34 = *(_QWORD *)(a1 + 32);
      v35 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v39 = v34;
      v40 = 2112;
      v41 = v35;
      v42 = 2112;
      v43 = v18;
      v33 = "Error generating account key for identifier %@ under account identifier %@, error = %@";
    }
    else
    {
      v26 = *(_QWORD *)(a1 + 32);
      v27 = *(_QWORD *)(a1 + 40);
      v36 = 0;
      v28 = +[ICKeychain setData:forIdentifier:account:shouldSync:error:](ICKeychain, "setData:forIdentifier:account:shouldSync:error:", v22, v26, v27, 1, &v36);
      v18 = v36;
      if (!v18 && v28)
        goto LABEL_20;
      v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v30 = *(void **)(v29 + 40);
      *(_QWORD *)(v29 + 40) = 0;

      v23 = os_log_create("com.apple.notes", "Crypto");
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v31 = *(_QWORD *)(a1 + 32);
      v32 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v39 = v31;
      v40 = 2112;
      v41 = v32;
      v42 = 2112;
      v43 = v18;
      v33 = "Error saving account key for identifier %@ under account identifier %@, error = %@";
    }
    _os_log_error_impl(&dword_1BD918000, v23, OS_LOG_TYPE_ERROR, v33, buf, 0x20u);
    goto LABEL_14;
  }
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 21);
    objc_msgSend(*(id *)(a1 + 56), "fetchKeychainItemsForAccountKeyIdentifier:accountDsid:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
LABEL_21:

}

- (void)fetchKeychainItemsForAccountKeyIdentifier:(id)a3 accountDsid:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  ICCloudSyncingObjectCryptoStrategyV2 *v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke;
  v10[3] = &unk_1E76C8CC0;
  v11 = v6;
  v12 = v7;
  v13 = self;
  v8 = v7;
  v9 = v6;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v10);

}

void __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke_2;
  v7[3] = &unk_1E76C8C98;
  v8 = v3;
  v9 = *(id *)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = v4;
  v11 = v5;
  v6 = v3;
  +[ICKeychain fetchItemsWithCompletionHandler:](ICKeychain, "fetchItemsWithCompletionHandler:", v7);

}

void __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!a2)
  {
    v13 = v2;
    v14 = v3;
    objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke_3;
    v8[3] = &unk_1E76C8C70;
    v9 = *(id *)(a1 + 40);
    v10 = *(id *)(a1 + 48);
    v6 = *(id *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 56);
    v11 = v6;
    v12 = v7;
    objc_msgSend(v5, "performBlock:", v8);

  }
}

void __94__ICCloudSyncingObjectCryptoStrategyV2_fetchKeychainItemsForAccountKeyIdentifier_accountDsid___block_invoke_3(uint64_t a1)
{
  void *v2;
  BOOL v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[ICKeychain dataForIdentifier:account:isSynced:authenticationContext:](ICKeychain, "dataForIdentifier:account:isSynced:authenticationContext:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") == 0;
  v4 = os_log_create("com.apple.notes", "Crypto");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "shortLoggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v15 = 138412546;
      v16 = v10;
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Account key doesn't exist after fetching Keychain items {object: %@, accountKeyIdentifier: %@}", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "creationDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICCloudConfiguration sharedConfiguration](ICCloudConfiguration, "sharedConfiguration");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "keychainMaximumSyncInterval");
    objc_msgSend(v12, "dateByAddingTimeInterval:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v8, "ic_isEarlierThanDate:", v14);

    if ((_DWORD)v13)
    {
      objc_msgSend(MEMORY[0x1E0D64288], "postBasicEvent:", 23);
      objc_msgSend(*(id *)(a1 + 48), "setHasMissingKeychainItem:", 1);
    }
  }
  else
  {
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 48), "shortLoggingDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(a1 + 32);
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Account key exists after fetching Keychain items {object: %@, accountKeyIdentifier: %@}", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "setHasMissingKeychainItem:", 0);
    objc_msgSend((id)objc_opt_class(), "accountKeyByIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v8);
    objc_msgSend((id)objc_opt_class(), "accountKeyByIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v2, *(_QWORD *)(a1 + 32));

    objc_sync_exit(v8);
  }

}

- (BOOL)hasPassphraseSet
{
  return 0;
}

- (NSString)passphraseHint
{
  return 0;
}

- (BOOL)isPassphraseCorrect:(id)a3
{
  return 0;
}

- (id)mainKeyForPassphrase:(id)a3
{
  return 0;
}

- (id)encryptData:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICCloudSyncingObjectCryptoStrategyV2 *v10;
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
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke;
  v8[3] = &unk_1E76C8B58;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ICEncryptionObject *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  NSObject *v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(a1 + 32))
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_1();
    goto LABEL_34;
  }
  if (objc_msgSend(*(id *)(a1 + 40), "isAuthenticated"))
  {
    objc_msgSend(*(id *)(a1 + 40), "currentAccountKeyIdentifier");
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accountKeyWithIdentifier:createIfNotExist:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_2();
      goto LABEL_33;
    }
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "ic_random256BitData:", &v21);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v21;
    if (v7 || !v6)
    {
      v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_6();
      v8 = v10;
      goto LABEL_32;
    }
    v20 = 0;
    +[ICCipherV2 wrapKey:withWrapper:error:](ICCipherV2, "wrapKey:withWrapper:error:", v6, v5, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v20;
    if (v7 || !v8)
    {
      v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v3, "shortLoggingDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v23 = v18;
        v24 = 2112;
        v25 = v4;
        v26 = 2112;
        v27 = v7;
        _os_log_error_impl(&dword_1BD918000, v10, OS_LOG_TYPE_ERROR, "Cannot wrap encryption key for %@, accountKeyIdentifier = %@, error = %@", buf, 0x20u);

      }
      goto LABEL_32;
    }
    objc_msgSend(v3, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICEncryptionMetadata makeForV2CipherWithObjectIdentifier:accountKeyIdentifier:](ICEncryptionMetadata, "makeForV2CipherWithObjectIdentifier:accountKeyIdentifier:", v9, v4);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = *(_QWORD *)(a1 + 32);
      -[NSObject authenticatedData](v10, "authenticatedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      +[ICCipherV2 encryptData:withKey:additionalAuthenticatedData:error:](ICCipherV2, "encryptData:withKey:additionalAuthenticatedData:error:", v11, v6, v12, &v19);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v19;

      if (v7 || !v13)
      {
        v17 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_5();
      }
      else
      {
        v14 = -[ICEncryptionObject initWithMetadata:wrappedEncryptionKey:encryptedData:]([ICEncryptionObject alloc], "initWithMetadata:wrappedEncryptionKey:encryptedData:", v10, v8, v13);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        {
LABEL_31:

LABEL_32:
LABEL_33:

LABEL_34:
          goto LABEL_35;
        }
        v17 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_4(v3);
      }

    }
    else
    {
      v17 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_3(v3);
      v7 = 0;
      v13 = v17;
    }

    goto LABEL_31;
  }
LABEL_35:

}

- (id)decryptObject:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICCloudSyncingObjectCryptoStrategyV2 *v10;
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
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke;
  v8[3] = &unk_1E76C8B58;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  char v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v5 = (id *)(a1 + 32);
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "metadata");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountKeyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "accountKeyWithIdentifier:createIfNotExist:", v7, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_2();
      goto LABEL_23;
    }
    objc_msgSend(*v5, "metadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      objc_msgSend(*v5, "metadata");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "objectIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "identifier");
      v14 = v8;
      v15 = v7;
      v16 = v3;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v13, "isEqual:", v17);

      v3 = v16;
      v7 = v15;
      v8 = v14;

      if ((v29 & 1) == 0)
      {
        v18 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_4();

        goto LABEL_23;
      }
    }
    else
    {

    }
    objc_msgSend(*v5, "wrappedEncryptionKey");
    v18 = objc_claimAutoreleasedReturnValue();
    v32 = 0;
    +[ICCipherV2 unwrapKey:withWrapper:error:](ICCipherV2, "unwrapKey:withWrapper:error:", v18, v8, &v32);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v32;
    if (v21 || !v20)
    {
      v28 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_3();
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "encryptedData");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "metadata");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "authenticatedData");
      v30 = v3;
      v31 = 0;
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICCipherV2 decryptData:withKey:additionalAuthenticatedData:error:](ICCipherV2, "decryptData:withKey:additionalAuthenticatedData:error:", v22, v20, v24, &v31);
      v25 = objc_claimAutoreleasedReturnValue();
      v21 = v31;
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v27 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;

      v3 = v30;
      if (!v21 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
        goto LABEL_22;
      v28 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_2();
    }

LABEL_22:
LABEL_23:

    goto LABEL_24;
  }
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "shortLoggingDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v19;
    _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "encryptionObject is nil when calling decryptObject: for %@", buf, 0xCu);

  }
  v7 = v8;
LABEL_24:

}

- (void)serializeToEncryptedValuesJSON:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__ICCloudSyncingObjectCryptoStrategyV2_serializeToEncryptedValuesJSON___block_invoke;
  v6[3] = &unk_1E76C8CE8;
  v7 = v4;
  v5 = v4;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v6);

}

void __71__ICCloudSyncingObjectCryptoStrategyV2_serializeToEncryptedValuesJSON___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(*(id *)(a1 + 32), "serialized");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "encryptedValuesJSON");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setEncryptedValuesJSON:", v4);
    objc_msgSend(v3, "applyRandomCryptoGooIfNeeded");
    v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Successfully encrypted data for %@", (uint8_t *)&v9, 0xCu);

    }
    if (!v5)
      objc_msgSend(v3, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __71__ICCloudSyncingObjectCryptoStrategyV2_serializeToEncryptedValuesJSON___block_invoke_cold_1(v3);

  }
}

- (BOOL)serialize:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
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
  v11[2] = __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke;
  v11[3] = &unk_1E76C8B58;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  v14 = &v15;
  -[ICCryptoStrategyBase performBlockIfObjectExists:](self, "performBlockIfObjectExists:", v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "path");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

      objc_msgSend(*(id *)(a1 + 32), "serialized");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = *(_QWORD *)(a1 + 40);
        v14 = 0;
        v10 = -[NSObject writeToURL:options:error:](v7, "writeToURL:options:error:", v9, 1, &v14);
        v11 = v14;
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
        if (v11 || (v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8), !*(_BYTE *)(v13 + 24)))
        {
          v12 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_4();

        }
        else
        {
          if ((v6 & 1) == 0)
          {
            objc_msgSend(v3, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
            v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          }
          *(_BYTE *)(v13 + 24) = 1;
        }
      }
      else
      {
        v11 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_3(v3);

      }
    }
    else
    {
      v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_2();
    }
  }
  else
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_1();
  }

}

void __55__ICCloudSyncingObjectCryptoStrategyV2_primaryMetadata__block_invoke_cold_1(void *a1)
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

void __63__ICCloudSyncingObjectCryptoStrategyV2_primaryEncryptionObject__block_invoke_cold_1(void *a1)
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

- (void)saveEncryptedJSON
{
  void *v3;
  uint8_t v4[12];
  __int16 v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v5 = 2080;
  v6 = "-[ICCloudSyncingObjectCryptoStrategyV2 saveEncryptedJSON]";
  v7 = 1024;
  v8 = 103;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Saving encrypted values JSON… {object: %@}%s:%d", v4, 0x1Cu);

}

void __57__ICCloudSyncingObjectCryptoStrategyV2_saveEncryptedJSON__block_invoke_cold_1(void *a1)
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

void __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "sourceURL is nil when trying to encrypt file for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "destinationURL is nil when trying to encrypt file for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot load data from sourceURL for %@, error = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_decryptData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "failed to decode encryptedData for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICCloudSyncingObjectCryptoStrategyV2_decryptedDataFromFileURL___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot load file from url for decryption of %@, error = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "className");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Failed to encode encryption object for V2 sidecar data for %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_encryptSidecarData___block_invoke_cold_2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "className");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Not authenticated to encrypt V2 sidecar data for %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "className");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "ic_loggingIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Failed to decrypt V2 sidecar data for %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __59__ICCloudSyncingObjectCryptoStrategyV2_decryptSidecarData___block_invoke_cold_2()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_6_0();
  objc_msgSend(v1, "className");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Not authenticated to decrypt V2 sidecar data for %@ (%@)", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)canAuthenticateRecord:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "failed to decode encryptedData for in isRecordAuthenticated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)canAuthenticateRecord:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "failed to read accountKeyIdentifier for in isRecordAuthenticated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __69__ICCloudSyncingObjectCryptoStrategyV2_decryptAndMergeEncryptedJSON___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "failed to decrypt JSON for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __57__ICCloudSyncingObjectCryptoStrategyV2_accountIdentifier__block_invoke_cold_1()
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
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "cloudAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "No account identifier is found for object %@, in account %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __51__ICCloudSyncingObjectCryptoStrategyV2_accountDsid__block_invoke_cold_1()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_5_2(), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "No account DSID/name is found for object %@, in account %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __60__ICCloudSyncingObjectCryptoStrategyV2_accountKeyIdentifier__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot deserialize primary encryption object {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)currentAccountKeyIdentifier
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Cannot read account username.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Failed to generate new account key for new currentAccountKeyIdentifier, forgetting this new currentAccountKeyIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Failed to save new currentAccountKeyIdentifier, forgetting it. Error = %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "New account key is generated for currentAccountKeyIdentifier: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __67__ICCloudSyncingObjectCryptoStrategyV2_currentAccountKeyIdentifier__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_17_0(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, v0, v1, "Generated new currentAccountKeyIdentifier: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)accountKeyWithIdentifier:createIfNotExist:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "received nil identifier input for accountKeyWithIdentifier:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __82__ICCloudSyncingObjectCryptoStrategyV2_accountKeyWithIdentifier_createIfNotExist___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = *(_QWORD *)(a2 + 48);
  v5 = 138412546;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1BD918000, log, OS_LOG_TYPE_ERROR, "Cannot generate account key for identifier (%@) under account (%@) because iCloud keychain is not enabled", (uint8_t *)&v5, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "Did not encrypt data because the data input is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_1BD918000, v0, v1, "Cannot find the accountKey for identifier %@", v2);
  OUTLINED_FUNCTION_1_0();
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create metadata when encrypting for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_4(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to create new encryption object when encrypting data for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_5()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Failed to encrypt data for %@, error = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __52__ICCloudSyncingObjectCryptoStrategyV2_encryptData___block_invoke_cold_6()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot generate encryption key for %@, error = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Failed to decrypt for %@, error = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Failed to unwrap encryptionKey for %@, error = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __54__ICCloudSyncingObjectCryptoStrategyV2_decryptObject___block_invoke_cold_4()
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
  objc_msgSend(*v0, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v4, v5, "Cannot decrypt data because object identifier doesn't match {object: %@, metadata: %@}", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

void __71__ICCloudSyncingObjectCryptoStrategyV2_serializeToEncryptedValuesJSON___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to encode encrypted object for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "encryptionObject is nil when trying to save to disk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_3(&dword_1BD918000, v0, v1, "destinationURL is nil when trying to save to disk", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot write to disk due to failed to encode encrypted object for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __56__ICCloudSyncingObjectCryptoStrategyV2_serialize_toURL___block_invoke_cold_4()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Error writing encrypted data to file for %@, error = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
