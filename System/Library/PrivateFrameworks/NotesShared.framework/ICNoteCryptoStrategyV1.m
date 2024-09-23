@implementation ICNoteCryptoStrategyV1

- (BOOL)writeEncryptedNoteData:(id)a3
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
  v7[2] = __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke;
  v7[3] = &unk_1E76C7448;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t v12;
  _QWORD v13[4];
  NSObject *v14;

  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
  {
    v4 = (void *)objc_opt_class();
    v5 = *(_QWORD *)(a1 + 40);
    v6 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_2;
    v13[3] = &unk_1E76C73F8;
    v14 = v3;
    v10[0] = v6;
    v10[1] = 3221225472;
    v10[2] = __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_5;
    v10[3] = &unk_1E76C7420;
    v7 = v14;
    v8 = *(_QWORD *)(a1 + 48);
    v11 = v7;
    v12 = v8;
    objc_msgSend(v4, "encryptWithMainKeyOfObject:dataToEncrypt:failureHandler:successHandler:", v7, v5, v13, v10);

    v9 = v14;
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_cold_1(v3);

  }
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_2(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_2_cold_1(a1);

}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  v10 = os_log_create("com.apple.notes", "CoreData");
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_5_cold_1(a1, v7, v11);

    objc_msgSend(*(id *)(a1 + 32), "noteData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setData:", v7);

    objc_msgSend(*(id *)(a1 + 32), "noteData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setCryptoTag:", v8);

    objc_msgSend(*(id *)(a1 + 32), "noteData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setCryptoInitializationVector:", v9);

    objc_msgSend(*(id *)(a1 + 32), "setCryptoTag:", v8);
    objc_msgSend(*(id *)(a1 + 32), "setCryptoInitializationVector:", v9);
    objc_msgSend(*(id *)(a1 + 32), "updateArchivedAndLastViewedTimeStampsAfterSavingNoteData");
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_INFO, "Trying to save note data for %@, but we don't have any data", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (BOOL)decrypt
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
  v4[2] = __33__ICNoteCryptoStrategyV1_decrypt__block_invoke;
  v4[3] = &unk_1E76C7498;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__ICNoteCryptoStrategyV1_decrypt__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[3];
  char v18;
  _QWORD v19[5];
  id v20;

  v3 = a2;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy_;
  v19[4] = __Block_byref_object_dispose_;
  v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy_;
  v15[4] = __Block_byref_object_dispose_;
  v16 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_8;
  v8[3] = &unk_1E76C7470;
  v11 = v17;
  v5 = v3;
  v12 = v19;
  v13 = v15;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = v5;
  v10 = v6;
  v14 = v7;
  objc_msgSend(v4, "performBlockAndWait:", v8);

  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);

}

void __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_8(uint64_t a1)
{
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  ICEncryptedData *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  ICEncryptedData *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  NSObject *v31;
  ICEncryptedData *v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected");
  objc_msgSend(*v2, "noteData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(*v2, "identifier");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v24 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*v2, "shortLoggingDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v25;
      v26 = "note is not password-protected, but decrypt is called. %@";
LABEL_10:
      _os_log_impl(&dword_1BD918000, v24, OS_LOG_TYPE_INFO, v26, buf, 0xCu);

    }
LABEL_11:
    v22 = v24;
    goto LABEL_12;
  }
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v24 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*v2, "shortLoggingDescription");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v34 = v25;
      v26 = "note doesn't have textDataFromDatabase, but decrypt is called. %@";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v10 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_8_cold_1(v2, a1 + 56, v10);

  v11 = [ICEncryptedData alloc];
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "cryptoTag");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "cryptoInitializationVector");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "noteData");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "cryptoTag");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "noteData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "cryptoInitializationVector");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[ICEncryptedData initWithData:tag:initializationVector:fallbackTag:fallbackInitializationVector:](v11, "initWithData:tag:initializationVector:fallbackTag:fallbackInitializationVector:", v12, v13, v14, v16, v18);

  v20 = (void *)objc_opt_class();
  v21 = *(void **)(a1 + 32);
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_9;
  v30 = &unk_1E76C73B0;
  v31 = v21;
  v32 = v19;
  v22 = v19;
  objc_msgSend(v20, "decryptWithMainKeyOfObject:encryptedData:fallbackAttemptSuccessCleanupHandler:", v31, v22, &v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setDecryptedData:", v23, v27, v28, v29, v30);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;

  v24 = v31;
LABEL_12:

}

void __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_9(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 40), "fallbackTag");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCryptoTag:", v2);

  objc_msgSend(*(id *)(a1 + 40), "fallbackInitializationVector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCryptoInitializationVector:", v3);

  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_saveWithLogDescription:", CFSTR("Set fallback crypto goo {note: %@}"), v4);

}

- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICNoteCryptoStrategyV1 *v10;
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
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__ICNoteCryptoStrategyV1_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke;
  v8[3] = &unk_1E76C7448;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v8);
  v6 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v6;
}

void __83__ICNoteCryptoStrategyV1_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  ICEncryptedData *v9;
  void *v10;
  void *v11;
  ICEncryptedData *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("TextData"));
    v4 = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "isAuthenticated") & 1) != 0)
      {
        v5 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = (void *)objc_opt_class();
          v7 = v6;
          objc_msgSend(v3, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = 138412802;
          v20 = v6;
          v21 = 2112;
          v22 = v8;
          v23 = 2048;
          v24 = -[NSObject hash](v4, "hash");
          _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "About to decrypt text data from cloud for merging %@ (%@): %lu", (uint8_t *)&v19, 0x20u);

        }
        v9 = [ICEncryptedData alloc];
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CryptoTag"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CryptoInitializationVector"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[ICEncryptedData initWithData:tag:initializationVector:](v9, "initWithData:tag:initializationVector:", v4, v10, v11);

        objc_msgSend((id)objc_opt_class(), "decryptWithMainKeyOfObject:encryptedData:fallbackAttemptSuccessCleanupHandler:", v3, v12, 0);
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = v13;

      }
      else
      {
        objc_msgSend(v3, "setUnappliedEncryptedRecord:", *(_QWORD *)(a1 + 32));
      }
    }
    else
    {
      v17 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "shortLoggingDescription");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138412290;
        v20 = v18;
        _os_log_impl(&dword_1BD918000, v17, OS_LOG_TYPE_INFO, "topoTextDataFromRecord is nil, but decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated: is called. %@", (uint8_t *)&v19, 0xCu);

      }
    }
  }
  else
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v16;
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "note is not password-protected, but decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated: is called. %@", (uint8_t *)&v19, 0xCu);

    }
  }

}

- (id)decryptNotePrimitiveData
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
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__ICNoteCryptoStrategyV1_decryptNotePrimitiveData__block_invoke;
  v4[3] = &unk_1E76C74C0;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__ICNoteCryptoStrategyV1_decryptNotePrimitiveData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  ICEncryptedData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
  {
    v4 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __50__ICNoteCryptoStrategyV1_decryptNotePrimitiveData__block_invoke_cold_1(v3);

    v5 = [ICEncryptedData alloc];
    objc_msgSend(v3, "noteData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "primitiveData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "noteData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cryptoTag");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "noteData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cryptoInitializationVector");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[ICEncryptedData initWithData:tag:initializationVector:](v5, "initWithData:tag:initializationVector:", v7, v9, v11);

    objc_msgSend((id)objc_opt_class(), "decryptWithMainKeyOfObject:encryptedData:fallbackAttemptSuccessCleanupHandler:", v3, v12, 0);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      objc_msgSend(*(id *)(a1 + 32), "correctCryptoTagAndIVIfNecessary");
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1BD918000, v12, OS_LOG_TYPE_INFO, "note is not password-protected, but decryptNotePrimitiveData is called. %@", (uint8_t *)&v17, 0xCu);

    }
  }

}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  return 1;
}

- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__ICNoteCryptoStrategyV1_mergeEncryptedData_mergeConflict___block_invoke;
  v10[3] = &unk_1E76C7510;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v10);

}

void __59__ICNoteCryptoStrategyV1_mergeEncryptedData_mergeConflict___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "shortLoggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v14 = v5;
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "Decrypting %@ for merging encrypted data", buf, 0xCu);

  }
  v6 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__ICNoteCryptoStrategyV1_mergeEncryptedData_mergeConflict___block_invoke_11;
  v9[3] = &unk_1E76C74E8;
  v10 = *(id *)(a1 + 40);
  v11 = *(id *)(a1 + 48);
  v7 = v3;
  v12 = v7;
  objc_msgSend(v6, "decryptWithMainKeyOfObject:encryptedDataPreparationBlock:fallbackAttemptSuccessCleanupHandler:", v7, v9, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v7, "mergeWithNoteData:", v8);

}

ICEncryptedData *__59__ICNoteCryptoStrategyV1_mergeEncryptedData_mergeConflict___block_invoke_11(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  ICEncryptedData *v12;
  NSObject *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "persistedSnapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cryptoTag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedSnapshot");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("cryptoTag"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "persistedSnapshot");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cryptoInitializationVector"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "cachedSnapshot");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("cryptoInitializationVector"));
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v5 && v10)
    {
      v12 = -[ICEncryptedData initWithData:tag:initializationVector:]([ICEncryptedData alloc], "initWithData:tag:initializationVector:", *(_QWORD *)(a1 + 40), v5, v10);
      goto LABEL_17;
    }
  }
  else
  {

    v10 = 0;
  }
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 48), "shortLoggingDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412290;
    v17 = v14;
    _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "No tag or initialization vector for encrypted text data save conflict %@", (uint8_t *)&v16, 0xCu);

  }
  v12 = 0;
LABEL_17:

  return v12;
}

- (id)unwrappedKey
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
  v8 = __Block_byref_object_copy_;
  v9 = __Block_byref_object_dispose_;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__ICNoteCryptoStrategyV1_unwrappedKey__block_invoke;
  v4[3] = &unk_1E76C7498;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __38__ICNoteCryptoStrategyV1_unwrappedKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a2;
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedMainKeyForObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "recoverMissingCryptoWrappedKeyIfNeededWithMainKey:", v5);
  v9.receiver = *(id *)(a1 + 32);
  v9.super_class = (Class)ICNoteCryptoStrategyV1;
  objc_msgSendSuper2(&v9, sel_unwrappedKey);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

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
  v7[2] = __53__ICNoteCryptoStrategyV1_mainKeyDecryptsPrimaryData___block_invoke;
  v7[3] = &unk_1E76C7448;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  v9 = &v10;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

id __53__ICNoteCryptoStrategyV1_mainKeyDecryptsPrimaryData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id result;
  objc_super v4;

  objc_msgSend(*(id *)(a1 + 32), "recoverMissingCryptoWrappedKeyIfNeededWithMainKey:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 40);
  v4.receiver = *(id *)(a1 + 32);
  v4.super_class = (Class)ICNoteCryptoStrategyV1;
  result = objc_msgSendSuper2(&v4, sel_mainKeyDecryptsPrimaryData_, v2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (_BYTE)result;
  return result;
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
  _QWORD v13[4];
  id v14;
  ICNoteCryptoStrategyV1 *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICNoteCryptoStrategyV1 rewrapWithMainKey:].cold.1(self, v5);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __44__ICNoteCryptoStrategyV1_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E76C7448;
  v6 = v4;
  v14 = v6;
  v15 = self;
  v16 = &v17;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v13);
  v7 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "shortLoggingDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v18 + 24));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v11;
    v23 = 2112;
    v25 = 2080;
    v24 = v12;
    v26 = "-[ICNoteCryptoStrategyV1 rewrapWithMainKey:]";
    v27 = 1024;
    v28 = 288;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped note with main key {note: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __44__ICNoteCryptoStrategyV1_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  char v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  os_log_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  char v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  objc_super v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v50.receiver = *(id *)(a1 + 40);
  v50.super_class = (Class)ICNoteCryptoStrategyV1;
  if ((objc_msgSendSuper2(&v50, sel_rewrapWithMainKey_, v4) & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v41 = v3;
    objc_msgSend(v3, "attachments");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
    if (v7)
    {
      v9 = v7;
      v10 = *(_QWORD *)v47;
      *(_QWORD *)&v8 = 138412546;
      v39 = v8;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v47 != v10)
            objc_enumerationMutation(v6);
          v12 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
          objc_msgSend(v12, "cryptoStrategy", v39);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "rewrapWithMainKey:", *(_QWORD *)(a1 + 32));

          if ((v14 & 1) == 0)
          {
            v15 = objc_msgSend(v12, "isUsed");
            v16 = os_log_create("com.apple.notes", "Crypto");
            v17 = v16;
            if (v15)
            {
              if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v41, "shortLoggingDescription");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "shortLoggingDescription");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v39;
                v53 = v20;
                v54 = 2112;
                v55 = v21;
                _os_log_error_impl(&dword_1BD918000, v17, OS_LOG_TYPE_ERROR, "Cannot rewrap attachment {note: %@, attachment: %@}", buf, 0x16u);

              }
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
            }
            else
            {
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v41, "shortLoggingDescription");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "shortLoggingDescription");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v39;
                v53 = v18;
                v54 = 2112;
                v55 = v19;
                _os_log_impl(&dword_1BD918000, v17, OS_LOG_TYPE_INFO, "Cannot rewrap unused attachment {note: %@, attachment: %@}", buf, 0x16u);

              }
            }
          }
        }
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      }
      while (v9);
    }

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v3 = v41;
    objc_msgSend(v41, "inlineAttachments");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (os_log_t)objc_msgSend(v22, "copy");

    v24 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    if (v24)
    {
      v26 = v24;
      v27 = *(_QWORD *)v43;
      *(_QWORD *)&v25 = 138412546;
      v40 = v25;
      do
      {
        for (j = 0; j != v26; ++j)
        {
          if (*(_QWORD *)v43 != v27)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * j);
          objc_msgSend(v29, "cryptoStrategy", v40);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "rewrapWithMainKey:", *(_QWORD *)(a1 + 32));

          if ((v31 & 1) == 0)
          {
            v32 = objc_msgSend(v29, "isUsed");
            v33 = os_log_create("com.apple.notes", "Crypto");
            v34 = v33;
            if (v32)
            {
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v41, "shortLoggingDescription");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "shortLoggingDescription");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v40;
                v53 = v37;
                v54 = 2112;
                v55 = v38;
                _os_log_error_impl(&dword_1BD918000, v34, OS_LOG_TYPE_ERROR, "Cannot rewrap inline attachment {note: %@, inlineAttachment: %@}", buf, 0x16u);

              }
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
            }
            else
            {
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v41, "shortLoggingDescription");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "shortLoggingDescription");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v40;
                v53 = v35;
                v54 = 2112;
                v55 = v36;
                _os_log_impl(&dword_1BD918000, v34, OS_LOG_TYPE_INFO, "Cannot rewrap unused inline attachment {note: %@, inlineAttachment: %@}", buf, 0x16u);

              }
            }
          }
        }
        v26 = -[NSObject countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
      }
      while (v26);
      v3 = v41;
    }
  }
  else
  {
    v23 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      __44__ICNoteCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(v3);

  }
}

- (void)recoverMissingCryptoWrappedKeyIfNeededWithMainKey:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke;
  v6[3] = &unk_1E76C7588;
  v7 = v4;
  v5 = v4;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v6);

}

void __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *, _BYTE *);
  void *v23;
  id v24;
  id v25;
  _BYTE *v26;
  _QWORD v27[4];
  id v28;
  uint8_t v29[4];
  void *v30;
  _BYTE buf[24];
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isRecoveringCryptoWrappedKey") & 1) == 0
    && objc_msgSend(v3, "isPasswordProtected"))
  {
    objc_msgSend(v3, "cryptoWrappedKey");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

      goto LABEL_20;
    }
    if ((objc_msgSend(v3, "needsInitialFetchFromCloud") & 1) != 0)
      goto LABEL_20;
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_cold_1(v3);

    objc_msgSend(v3, "setIsRecoveringCryptoWrappedKey:", 1);
    v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v3, "attachments");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_25;
    v27[3] = &unk_1E76C7538;
    v9 = v6;
    v28 = v9;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v27);

    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v9, "count");
      objc_msgSend(v3, "attachments");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v13;
      _os_log_impl(&dword_1BD918000, v10, OS_LOG_TYPE_INFO, "Found %lu possible wrapped keys from %lu attachments", buf, 0x16u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    v34 = 0;
    v20 = v8;
    v21 = 3221225472;
    v22 = __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_27;
    v23 = &unk_1E76C7560;
    v24 = *(id *)(a1 + 32);
    v14 = v3;
    v25 = v14;
    v26 = buf;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v20);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v15 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "shortLoggingDescription", v20, v21, v22, v23, v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v29 = 138412290;
        v30 = v16;
        _os_log_impl(&dword_1BD918000, v15, OS_LOG_TYPE_INFO, "Successfully recovered crypto wrapped key for %@", v29, 0xCu);

      }
      objc_msgSend(v14, "setCryptoWrappedKey:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      objc_msgSend(v14, "managedObjectContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ic_save");
    }
    else
    {
      if (!objc_msgSend(v14, "isInCloud", v20, v21, v22, v23, v24))
      {
LABEL_19:
        objc_msgSend(v14, "setIsRecoveringCryptoWrappedKey:", 0, v20, v21, v22, v23);

        _Block_object_dispose(buf, 8);
        goto LABEL_20;
      }
      v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "shortLoggingDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v29 = 138412290;
        v30 = v19;
        _os_log_impl(&dword_1BD918000, v18, OS_LOG_TYPE_INFO, "Unable to recover crypto wrapped key from attachments, trying to fetch the record %@", v29, 0xCu);

      }
      objc_msgSend(v14, "setNeedsToBeFetchedFromCloud:", 1);
      objc_msgSend(v14, "managedObjectContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "ic_save");
    }

    goto LABEL_19;
  }
LABEL_20:

}

void __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_25(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "cryptoWrappedKey");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_27(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "keyData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[ICCipherV1 unwrapKey:withWrapper:error:](ICCipherV1, "unwrapKey:withWrapper:error:", v6, v7, &v17);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v17;

  if (v8)
    v10 = v9 == 0;
  else
    v10 = 0;
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "noteData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "data");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "cryptoTag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "cryptoInitializationVector");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    +[ICCipherV1 decryptData:withKey:tag:initializationVector:error:](ICCipherV1, "decryptData:withKey:tag:initializationVector:error:", v12, v8, v13, v14, &v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v16;

    if (v15 && !v9)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      *a3 = 1;
    }

  }
}

- (void)correctCryptoTagAndIVIfNecessary
{
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", &__block_literal_global_0);
}

void __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;

  v2 = a2;
  if (!objc_msgSend(v2, "isPasswordProtected"))
    goto LABEL_14;
  if ((objc_msgSend(v2, "needsInitialFetchFromCloud") & 1) != 0)
    goto LABEL_14;
  objc_msgSend(v2, "cryptoTag");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cryptoTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToData:", v5);

  objc_msgSend(v2, "cryptoInitializationVector");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "noteData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cryptoInitializationVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToData:", v9);

  if (v6)
  {
    if ((v10 & 1) != 0)
      goto LABEL_14;
  }
  objc_msgSend(v2, "noteData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cryptoTag");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v2, "noteData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cryptoInitializationVector");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke_cold_2(v2, v16);

      objc_msgSend(v2, "noteData");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "cryptoTag");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setCryptoTag:", v18);

      objc_msgSend(v2, "noteData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "cryptoInitializationVector");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setCryptoInitializationVector:", v20);

      objc_msgSend(v2, "managedObjectContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "ic_save");

      goto LABEL_14;
    }
  }
  else
  {

  }
  v22 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke_cold_1(v2, v22);

  objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "-[ICNoteCryptoStrategyV1 correctCryptoTagAndIVIfNecessary]_block_invoke", 1, 1, CFSTR("Error correcting note crypto tag/IV using note data"));
LABEL_14:

}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "note is not password-protected, but writeEncryptedNoteData is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_2_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Error encrypting data for note %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_5_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2048;
  v9 = objc_msgSend(a2, "hash");
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "Saving note data for %@: %lu", (uint8_t *)&v6, 0x16u);

}

void __33__ICNoteCryptoStrategyV1_decrypt__block_invoke_8_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = objc_opt_class();
  objc_msgSend(*a1, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 40), "hash");
  v9 = 138412802;
  v10 = v6;
  v11 = 2112;
  v12 = v7;
  v13 = 2048;
  v14 = v8;
  _os_log_debug_impl(&dword_1BD918000, a3, OS_LOG_TYPE_DEBUG, "About to decrypt text data for %@ (%@): %lu", (uint8_t *)&v9, 0x20u);

  OUTLINED_FUNCTION_7();
}

void __50__ICNoteCryptoStrategyV1_decryptNotePrimitiveData__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Decrypting note primitive data of %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  void *v4;
  uint8_t v5[12];
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "object");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  v6 = 2080;
  v7 = "-[ICNoteCryptoStrategyV1 rewrapWithMainKey:]";
  v8 = 1024;
  v9 = 251;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Rewrapping note with main key… {note: %@}%s:%d", v5, 0x1Cu);

  OUTLINED_FUNCTION_7();
}

void __44__ICNoteCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping attachments because note text couldn't be rewrapped {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __76__ICNoteCryptoStrategyV1_recoverMissingCryptoWrappedKeyIfNeededWithMainKey___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Recovering missing crypto wrapped key for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke_cold_1(void *a1, os_log_t log)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v17;
  id v18;
  uint8_t v19;

  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cryptoTag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hash");
  objc_msgSend(a1, "noteData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cryptoTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  objc_msgSend(a1, "noteData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cryptoTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hash");
  objc_msgSend(a1, "noteData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cryptoInitializationVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hash");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_6_1(&dword_1BD918000, v10, v11, "Error correcting note crypto tag/IV using note data {note: %@, note.cryptoTag: %lu, noteData.cryptoTag: %lu, note.cryptoInitializationVector: %lu, noteData.cryptoInitializationVector: %lu}", v12, v13, v14, v15, log, (uint64_t)v17, v19);

  OUTLINED_FUNCTION_3_1();
}

void __58__ICNoteCryptoStrategyV1_correctCryptoTagAndIVIfNecessary__block_invoke_cold_2(void *a1, os_log_t log)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  void *v17;
  id v18;
  uint8_t v19;

  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cryptoTag");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "hash");
  objc_msgSend(a1, "noteData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cryptoTag");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hash");
  objc_msgSend(a1, "noteData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cryptoTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hash");
  objc_msgSend(a1, "noteData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cryptoInitializationVector");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hash");
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_6_1(&dword_1BD918000, v10, v11, "Correcting note crypto tag/IV using note data {note: %@, note.cryptoTag: %lu, noteData.cryptoTag: %lu, note.cryptoInitializationVector: %lu, noteData.cryptoInitializationVector: %lu}", v12, v13, v14, v15, log, (uint64_t)v17, v19);

  OUTLINED_FUNCTION_3_1();
}

@end
