@implementation ICAttachmentCryptoStrategyV1

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
  ICAttachmentCryptoStrategyV1 *v15;
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
    -[ICAttachmentCryptoStrategyV1 rewrapWithMainKey:].cold.1(self, v5);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E76CFC30;
  v6 = v4;
  v14 = v6;
  v15 = self;
  v16 = &v17;
  -[ICCryptoStrategyBase performBlockIfAttachmentExists:](self, "performBlockIfAttachmentExists:", v13);
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
    v26 = "-[ICAttachmentCryptoStrategyV1 rewrapWithMainKey:]";
    v27 = 1024;
    v28 = 54;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped attachment with main key {attachment: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v18 + 24) != 0;

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  void *v22;
  __int128 v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "removeTemporaryPaperBundle");
  v4 = *(_QWORD *)(a1 + 32);
  v29.receiver = *(id *)(a1 + 40);
  v29.super_class = (Class)ICAttachmentCryptoStrategyV1;
  if ((objc_msgSendSuper2(&v29, sel_rewrapWithMainKey_, v4) & 1) == 0)
  {
    v11 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(v3);
    goto LABEL_20;
  }
  objc_msgSend(v3, "media");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v3, "media");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cryptoStrategy");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "rewrapWithMainKey:", *(_QWORD *)(a1 + 32));

    if ((v9 & 1) == 0)
    {
      v11 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(v3);
LABEL_20:

      goto LABEL_21;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v3, "previewImages");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "copy");

  v12 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
  if (v12)
  {
    v14 = v12;
    v24 = v3;
    v15 = *(_QWORD *)v26;
    *(_QWORD *)&v13 = 138412546;
    v23 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v17, "cryptoStrategy", v23);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "rewrapWithMainKey:", *(_QWORD *)(a1 + 32));

        if ((v19 & 1) == 0)
        {
          v20 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v24, "shortLoggingDescription");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "shortLoggingDescription");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v23;
            v31 = v21;
            v32 = 2112;
            v33 = v22;
            _os_log_error_impl(&dword_1BD918000, v20, OS_LOG_TYPE_ERROR, "Cannot rewrap preview image {attachment: %@, previewImage: %@}", buf, 0x16u);

          }
        }
      }
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    }
    while (v14);
    v3 = v24;
  }
LABEL_21:

}

- (BOOL)writeEncryptedFallbackAssetData:(id)a3 fallbackAssetType:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  int64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke;
  v9[3] = &unk_1E76C7618;
  v9[4] = self;
  v12 = a4;
  v7 = v6;
  v10 = v7;
  v11 = &v13;
  -[ICCryptoStrategyBase performBlockIfAttachmentExists:](self, "performBlockIfAttachmentExists:", v9);
  LOBYTE(self) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)self;
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  os_log_t v16;
  _QWORD v17[4];
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[4];
  NSObject *v24;
  id v25;

  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
    {
      NSStringFromFallbackAssetType(*(_QWORD *)(a1 + 56));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 56);
      if (v5 == 1)
      {
        objc_msgSend(v3, "fallbackPDFEncryptedURL");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5)
          goto LABEL_16;
        objc_msgSend(v3, "fallbackImageEncryptedURL");
        v6 = objc_claimAutoreleasedReturnValue();
      }
      v8 = (void *)v6;
      if (v6)
      {
        v9 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4();

        v10 = (void *)objc_opt_class();
        v11 = *(_QWORD *)(a1 + 40);
        v12 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_4;
        v23[3] = &unk_1E76C73B0;
        v24 = v4;
        v25 = v3;
        v17[0] = v12;
        v17[1] = 3221225472;
        v17[2] = __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6;
        v17[3] = &unk_1E76CFC58;
        v18 = v8;
        v19 = v24;
        v13 = v25;
        v14 = *(_QWORD *)(a1 + 48);
        v15 = *(_QWORD *)(a1 + 56);
        v20 = v13;
        v21 = v14;
        v22 = v15;
        v7 = v8;
        objc_msgSend(v10, "encryptWithMainKeyOfObject:dataToEncrypt:failureHandler:successHandler:", v13, v11, v23, v17);

        v16 = v24;
LABEL_19:

        goto LABEL_20;
      }
LABEL_16:
      v16 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_2();
      v7 = v16;
      goto LABEL_19;
    }
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_3(v3);
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4(v3);
  }
  v4 = v7;
LABEL_20:

}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_4(uint64_t a1)
{
  NSObject *v2;

  v2 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_4_cold_1(a1);

}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = *(_QWORD *)(a1 + 32);
  v15 = 0;
  v10 = objc_msgSend(a2, "writeToURL:options:error:", v9, 1, &v15);
  v11 = v15;
  v12 = os_log_create("com.apple.notes", "Crypto");
  v13 = v12;
  if ((v10 & 1) != 0)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6_cold_1(a1);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v14 = *(_QWORD *)(a1 + 64);
    if (v14 == 1)
    {
      objc_msgSend(*(id *)(a1 + 48), "setFallbackPDFCryptoTag:", v7);
      objc_msgSend(*(id *)(a1 + 48), "setFallbackPDFCryptoInitializationVector:", v8);
    }
    else if (!v14)
    {
      objc_msgSend(*(id *)(a1 + 48), "setFallbackImageCryptoTag:", v7);
      objc_msgSend(*(id *)(a1 + 48), "setFallbackImageCryptoInitializationVector:", v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6_cold_2(a1, (uint64_t)v11, v13);

  }
}

- (id)decryptedFallbackAssetDataForFallbackAssetType:(int64_t)a3
{
  id v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__57;
  v10 = __Block_byref_object_dispose__57;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke;
  v5[3] = &unk_1E76C7640;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[ICCryptoStrategyBase performBlockIfAttachmentExists:](self, "performBlockIfAttachmentExists:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  ICEncryptedData *v11;
  void *v12;
  os_log_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;

  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) != 0)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) != 0)
    {
      NSStringFromFallbackAssetType(*(_QWORD *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 48);
      if (v5 == 1)
      {
        objc_msgSend(v3, "fallbackPDFEncryptedURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fallbackPDFCryptoTag");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fallbackPDFCryptoInitializationVector");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v5)
        {
          v7 = 0;
          v9 = 0;
          goto LABEL_19;
        }
        objc_msgSend(v3, "fallbackImageEncryptedURL");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fallbackImageCryptoTag");
        v7 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "fallbackImageCryptoInitializationVector");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v9 = (void *)v8;
      if (v6)
      {
        v10 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_4(v3);

        v11 = [ICEncryptedData alloc];
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[ICEncryptedData initWithData:tag:initializationVector:](v11, "initWithData:tag:initializationVector:", v12, v7, v9);

        objc_msgSend((id)objc_opt_class(), "decryptWithMainKeyOfObject:encryptedData:fallbackAttemptSuccessCleanupHandler:", v3, v13, 0);
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v16 = *(void **)(v15 + 40);
        *(_QWORD *)(v15 + 40) = v14;

        v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
        v18 = os_log_create("com.apple.notes", "Crypto");
        v19 = v18;
        if (v17)
        {
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_3();
        }
        else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_2();
        }

LABEL_25:
        goto LABEL_26;
      }
LABEL_19:
      v13 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_1();
      v6 = v13;
      goto LABEL_25;
    }
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_5(v3);
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_6(v3);
  }
  v4 = v7;
LABEL_26:

}

- (BOOL)writeEncryptedFallbackImageData:(id)a3
{
  return -[ICAttachmentCryptoStrategyV1 writeEncryptedFallbackAssetData:fallbackAssetType:](self, "writeEncryptedFallbackAssetData:fallbackAssetType:", a3, 0);
}

- (BOOL)writeEncryptedFallbackPDFData:(id)a3
{
  return -[ICAttachmentCryptoStrategyV1 writeEncryptedFallbackAssetData:fallbackAssetType:](self, "writeEncryptedFallbackAssetData:fallbackAssetType:", a3, 1);
}

- (id)decryptedFallbackImageData
{
  return -[ICAttachmentCryptoStrategyV1 decryptedFallbackAssetDataForFallbackAssetType:](self, "decryptedFallbackAssetDataForFallbackAssetType:", 0);
}

- (id)decryptedFallbackPDFData
{
  return -[ICAttachmentCryptoStrategyV1 decryptedFallbackAssetDataForFallbackAssetType:](self, "decryptedFallbackAssetDataForFallbackAssetType:", 1);
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
  v7 = "-[ICAttachmentCryptoStrategyV1 rewrapWithMainKey:]";
  v8 = 1024;
  v9 = 25;
  _os_log_debug_impl(&dword_1BD918000, a2, OS_LOG_TYPE_DEBUG, "Rewrapping attachment with main key… {attachment: %@}%s:%d", v5, 0x1Cu);

  OUTLINED_FUNCTION_7();
}

void __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping preview images because media couldn't be rewrapped {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping media and preview images because attachment couldn't be rewrapped {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not writing fallback asset because not authenticated for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "attachment is not password-protected, but writeEncryptedFallbackAssetData is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_4_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 40), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Encryption Failed on fallback %@ for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 48), "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v2, v3, "Wrote encrypted fallback %@ for %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_2();
}

void __82__ICAttachmentCryptoStrategyV1_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_6_cold_2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "shortLoggingDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = v5;
  OUTLINED_FUNCTION_13();
  v10 = v7;
  v11 = a2;
  _os_log_error_impl(&dword_1BD918000, a3, OS_LOG_TYPE_ERROR, "Error writing encrypted fallback %@ for %@: %@", (uint8_t *)&v8, 0x20u);

  OUTLINED_FUNCTION_7();
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "ic_loggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Failed to decrypt fallback %@ for %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7_2();
  objc_msgSend((id)OUTLINED_FUNCTION_8(v0, v1), "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Decrypted fallback %@ for %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_4(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Decrypting fallback image for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_5(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Not trying to decrypt fallback asset while not authenticated for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __79__ICAttachmentCryptoStrategyV1_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_6(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "attachment is not password-protected, but decryptedFallbackAssetDataForPDF is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
