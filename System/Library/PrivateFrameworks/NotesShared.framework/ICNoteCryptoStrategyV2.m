@implementation ICNoteCryptoStrategyV2

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
  v7[2] = __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke;
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

void __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isUnsupported"))
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke_cold_1(v3);
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __49__ICNoteCryptoStrategyV1_writeEncryptedNoteData___block_invoke_cold_1(v3);
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "encryptData:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps:", v4);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke_cold_2(v3);

  }
LABEL_10:

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
  v4[2] = __33__ICNoteCryptoStrategyV2_decrypt__block_invoke;
  v4[3] = &unk_1E76C7498;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__ICNoteCryptoStrategyV2_decrypt__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  __int128 v8;

  v3 = a2;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2;
  v6[3] = &unk_1E76C95A8;
  v7 = v3;
  v8 = *(_OWORD *)(a1 + 32);
  v5 = v3;
  objc_msgSend(v4, "performBlockAndWait:", v6);

}

void __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected") & 1) == 0)
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*v2, "shortLoggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      v11 = "note is not password-protected, but decrypt is called. %@";
LABEL_11:
      _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, v11, (uint8_t *)&v13, 0xCu);

    }
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(*v2, "noteData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "data");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*v2, "shortLoggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v10;
      v11 = "note doesn't have textDataFromDatabase, but decrypt is called. %@";
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2_cold_2(v2, v5);

  v6 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "noteData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "decryptData:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setDecryptedData:", v9);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v12 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2_cold_1(v2);

  }
LABEL_13:

}

- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  ICNoteCryptoStrategyV2 *v10;
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
  v15 = __Block_byref_object_copy__43;
  v16 = __Block_byref_object_dispose__43;
  v17 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __83__ICNoteCryptoStrategyV2_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke;
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

void __83__ICNoteCryptoStrategyV2_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_log_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("TextData"));
    v4 = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if ((objc_msgSend(*(id *)(a1 + 40), "isRecordAuthenticated:", *(_QWORD *)(a1 + 32)) & 1) != 0)
      {
        v5 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v6 = (void *)objc_opt_class();
          v7 = v6;
          objc_msgSend(v3, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSObject hash](v4, "hash"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = 138412802;
          v17 = v6;
          v18 = 2112;
          v19 = v8;
          v20 = 2112;
          v21 = v9;
          _os_log_impl(&dword_1BD918000, v5, OS_LOG_TYPE_INFO, "About to decrypt text data from cloud for merging %@ (%@): %@", (uint8_t *)&v16, 0x20u);

        }
        objc_msgSend(*(id *)(a1 + 40), "decryptData:", v4);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v12 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v10;

      }
      else
      {
        objc_msgSend(v3, "setUnappliedEncryptedRecord:", *(_QWORD *)(a1 + 32));
      }
    }
    else
    {
      v14 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "shortLoggingDescription");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v15;
        _os_log_impl(&dword_1BD918000, v14, OS_LOG_TYPE_INFO, "topoTextDataFromRecord is nil, but decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated: is called. %@", (uint8_t *)&v16, 0xCu);

      }
    }
  }
  else
  {
    v4 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v13;
      _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "note is not password-protected, but decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated: is called. %@", (uint8_t *)&v16, 0xCu);

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
  v8 = __Block_byref_object_copy__43;
  v9 = __Block_byref_object_dispose__43;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke;
  v4[3] = &unk_1E76C74C0;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
  {
    v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v12;
      _os_log_impl(&dword_1BD918000, v11, OS_LOG_TYPE_INFO, "note is not password-protected, but decryptNotePrimitiveData is called. %@", (uint8_t *)&v13, 0xCu);

    }
    goto LABEL_9;
  }
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke_cold_2(v3, v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "noteData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primitiveData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decryptData:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke_cold_1(v3);
LABEL_9:

  }
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  return 1;
}

- (id)encryptedDataFromRecord:(id)a3
{
  return (id)objc_msgSend(a3, "ic_encryptedInlineableDataAssetForKeyPrefix:", CFSTR("TextData"));
}

- (void)mergeEncryptedData:(id)a3 mergeConflict:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ICNoteCryptoStrategyV2_mergeEncryptedData_mergeConflict___block_invoke;
  v7[3] = &unk_1E76CD7D0;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v7);

}

void __59__ICNoteCryptoStrategyV2_mergeEncryptedData_mergeConflict___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "decryptData:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "mergeWithNoteData:", v4);
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __59__ICNoteCryptoStrategyV2_mergeEncryptedData_mergeConflict___block_invoke_cold_1(v3);

  }
}

- (void)serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__ICNoteCryptoStrategyV2_serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps___block_invoke;
  v6[3] = &unk_1E76C7588;
  v7 = v4;
  v5 = v4;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v6);

}

void __86__ICNoteCryptoStrategyV2_serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
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
  objc_msgSend(*(id *)(a1 + 32), "serialized");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "noteData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "data");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    objc_msgSend(v3, "noteData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setData:", v4);

    objc_msgSend(v3, "applyRandomCryptoGooIfNeeded");
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1BD918000, v9, OS_LOG_TYPE_INFO, "Successfully encrypted data for %@", (uint8_t *)&v12, 0xCu);

    }
    if (!v7)
      objc_msgSend(v3, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
    objc_msgSend(v3, "updateArchivedAndLastViewedTimeStampsAfterSavingNoteData");
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __86__ICNoteCryptoStrategyV2_serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps___block_invoke_cold_1(v3);

  }
}

void __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "note is not suported, but writeEncryptedNoteData is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __49__ICNoteCryptoStrategyV2_writeEncryptedNoteData___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to encrypt data for note %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2_cold_1(id *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(*a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to decrypt note data for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __33__ICNoteCryptoStrategyV2_decrypt__block_invoke_2_cold_2(id *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "shortLoggingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*a1, "noteData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v7, "hash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412546;
  v10 = v4;
  v11 = 2112;
  v12 = v8;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "About to decrypt text data for %@, hash = %@", (uint8_t *)&v9, 0x16u);

}

void __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to decrypt note primitive data for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __50__ICNoteCryptoStrategyV2_decryptNotePrimitiveData__block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Decrypting note primitive data of %@", v4, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

void __59__ICNoteCryptoStrategyV2_mergeEncryptedData_mergeConflict___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "cannot decrypt data when processing NSMergeConflict: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __86__ICNoteCryptoStrategyV2_serializeToNoteDataAndUpdateArchivedAndLastViewedTimeStamps___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Failed to serialize encrypted object for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
