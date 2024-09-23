@implementation ICNoteCryptoStrategyV1Neo

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
  ICNoteCryptoStrategyV1Neo *v15;
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
    -[ICNoteCryptoStrategyV1Neo rewrapWithMainKey:].cold.1(self);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __47__ICNoteCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke;
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
    v26 = "-[ICNoteCryptoStrategyV1Neo rewrapWithMainKey:]";
    v27 = 1024;
    v28 = 65;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped note with main key {note: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __47__ICNoteCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
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
  v50.super_class = (Class)ICNoteCryptoStrategyV1Neo;
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

- (BOOL)writeEncryptedNoteData:(id)a3
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
    -[ICNoteCryptoStrategyV1Neo writeEncryptedNoteData:].cold.1(self);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke;
  v13[3] = &unk_1E76C7448;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v13);
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
    v25 = "-[ICNoteCryptoStrategyV1Neo writeEncryptedNoteData:]";
    v26 = 1024;
    v27 = 103;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Wrote encrypted note data {note: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;

  v3 = a2;
  objc_msgSend(v3, "noteData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  objc_msgSend(*(id *)(a1 + 32), "encryptData:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "serialized");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "noteData");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setData:", v9);

      objc_msgSend(v3, "applyRandomCryptoGooIfNeeded");
      if (!v6)
        objc_msgSend(v3, "resetToIntrinsicNotesVersionAndPropagateToChildObjects");
      objc_msgSend(v3, "updateArchivedAndLastViewedTimeStampsAfterSavingNoteData");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke_cold_2(v3);

    }
  }
  else
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke_cold_1(v3);

  }
}

- (BOOL)decrypt
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
    -[ICNoteCryptoStrategyV1Neo decrypt].cold.1(self);

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke;
  v10[3] = &unk_1E76C7498;
  v10[4] = self;
  v10[5] = &v11;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v10);
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
    v20 = "-[ICNoteCryptoStrategyV1Neo decrypt]";
    v21 = 1024;
    v22 = 133;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Decrypted note data {note: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

void __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;

  v3 = a2;
  objc_msgSend(v3, "noteData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_2(a1, v3, v6);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "noteData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decryptData:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v3, "setDecryptedData:", v10);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_1(v3);

    }
  }

}

- (id)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  ICNoteCryptoStrategyV1Neo *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ICNoteCryptoStrategyV1Neo decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:].cold.1(self);

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke;
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
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v18[5] != 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v24 = v11;
    v25 = 2112;
    v27 = 2080;
    v26 = v12;
    v28 = "-[ICNoteCryptoStrategyV1Neo decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:]";
    v29 = 1024;
    v30 = 165;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Decrypted note data or saving as unapplied record {note: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend(v3, "primaryEncryptedDataFromRecord:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_3(v3);

  if (!v4)
  {
    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_1(v3);
    goto LABEL_11;
  }
  if (objc_msgSend(v3, "isAuthenticated")
    && (objc_msgSend(*(id *)(a1 + 40), "isRecordAuthenticated:", *(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "decryptData:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_2(v3);
LABEL_11:

    goto LABEL_12;
  }
  objc_msgSend(v3, "setUnappliedEncryptedRecord:", *(_QWORD *)(a1 + 32));
LABEL_12:

}

- (id)decryptNotePrimitiveData
{
  NSObject *v3;
  NSObject *v4;
  id v5;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[ICNoteCryptoStrategyV1Neo decryptNotePrimitiveData].cold.1(self);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__5;
  v15 = __Block_byref_object_dispose__5;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke;
  v10[3] = &unk_1E76C74C0;
  v10[4] = self;
  v10[5] = &v11;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v10);
  v4 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12[5] != 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = v8;
    v19 = 2112;
    v21 = 2080;
    v20 = v9;
    v22 = "-[ICNoteCryptoStrategyV1Neo decryptNotePrimitiveData]";
    v23 = 1024;
    v24 = 191;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Decrypted note primitive data {note: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v3 = a2;
  objc_msgSend(v3, "noteData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primitiveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke_cold_2(v3, v5, v6);

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "decryptData:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v10 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke_cold_1(v3);

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
  NSObject *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
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
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICNoteCryptoStrategyV1Neo mergeEncryptedData:mergeConflict:].cold.1(self);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__ICNoteCryptoStrategyV1Neo_mergeEncryptedData_mergeConflict___block_invoke;
  v14[3] = &unk_1E76C7448;
  v14[4] = self;
  v9 = v6;
  v15 = v9;
  v16 = &v17;
  -[ICCryptoStrategyBase performBlockIfNoteExists:](self, "performBlockIfNoteExists:", v14);
  v10 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "shortLoggingDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v18 + 24));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v22 = v12;
    v23 = 2112;
    v25 = 2080;
    v24 = v13;
    v26 = "-[ICNoteCryptoStrategyV1Neo mergeEncryptedData:mergeConflict:]";
    v27 = 1024;
    v28 = 220;
    _os_log_debug_impl(&dword_1BD918000, v10, OS_LOG_TYPE_DEBUG, "Merged encrypted note data {note: %@, success: %@}%s:%d", buf, 0x26u);

  }
  _Block_object_dispose(&v17, 8);

}

void __62__ICNoteCryptoStrategyV1Neo_mergeEncryptedData_mergeConflict___block_invoke(uint64_t a1, void *a2)
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
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_1(v3);

  }
}

- (void)rewrapWithMainKey:(void *)a1 .cold.1(void *a1)
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

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Rewrapping note with main key… {note: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

- (void)writeEncryptedNoteData:(void *)a1 .cold.1(void *a1)
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

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Writing encrypted note data… {note: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt note data {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __52__ICNoteCryptoStrategyV1Neo_writeEncryptedNoteData___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot serialize encrypted note data {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)decrypt
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

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Decrypting note data… {note: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt note data {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __36__ICNoteCryptoStrategyV1Neo_decrypt__block_invoke_cold_2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "object");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shortLoggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "noteData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v9, "hash"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 138413058;
  v13 = v6;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14_0();
  v14 = 120;
  OUTLINED_FUNCTION_12(&dword_1BD918000, a3, v11, "Decrypting note data… {note: %@, note.data.hash: %@}%s:%d", (uint8_t *)&v12);

}

- (void)decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated:(void *)a1 .cold.1(void *a1)
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

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Decrypting note data or saving as unapplied record… {note: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt note data from record {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_2(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend(a1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "noteData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primitiveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", OUTLINED_FUNCTION_10_0());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_9_0(&dword_1BD918000, v7, v8, "Decrypted note data or saving as unapplied record {note: %@, note.primitiveData.hash: %@, record.data.hash: %@}%s:%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_7_3();
}

void __86__ICNoteCryptoStrategyV1Neo_decryptTextDataOrSaveAsUnappliedRecordIfNotAuthenticated___block_invoke_cold_3(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint8_t v13;

  objc_msgSend(a1, "shortLoggingDescription");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)OUTLINED_FUNCTION_11_0(), "noteData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "primitiveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithUnsignedInteger:", objc_msgSend(v5, "hash"));
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedInteger:", OUTLINED_FUNCTION_10_0());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_9_0(&dword_1BD918000, v7, v8, "Decrypting note data or saving as unapplied record… {note: %@, note.primitiveData.hash: %@, record.data.hash: %@}%s:%d", v9, v10, v11, v12, v13);

  OUTLINED_FUNCTION_7_3();
}

- (void)decryptNotePrimitiveData
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

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Decrypting note primitive data… {note: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt primitive note data {note: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __53__ICNoteCryptoStrategyV1Neo_decryptNotePrimitiveData__block_invoke_cold_2(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a2, "hash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138413058;
  v9 = v5;
  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_14_0();
  v10 = 177;
  OUTLINED_FUNCTION_12(&dword_1BD918000, a3, v7, "Decrypting note primitive data… {note: %@, note.primitiveData.hash: %@}%s:%d", (uint8_t *)&v8);

  OUTLINED_FUNCTION_7();
}

- (void)mergeEncryptedData:(void *)a1 mergeConflict:.cold.1(void *a1)
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

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Merging encrypted note data… {note: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

@end
