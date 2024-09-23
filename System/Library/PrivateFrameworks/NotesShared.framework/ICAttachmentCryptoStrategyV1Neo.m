@implementation ICAttachmentCryptoStrategyV1Neo

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
    -[ICAttachmentCryptoStrategyV1Neo rewrapWithMainKey:].cold.1(self);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E76CFC30;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfAttachmentExists:](self, "performBlockIfAttachmentExists:", v13);
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
    v25 = "-[ICAttachmentCryptoStrategyV1Neo rewrapWithMainKey:]";
    v26 = 1024;
    v27 = 77;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped attachment with main key {attachment: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  char v26;
  NSObject *v27;
  void *v28;
  void *v29;
  __int128 v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  objc_super v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "removeTemporaryPaperBundle");
  if (objc_msgSend(v4, "hasFallbackImage"))
  {
    objc_msgSend(v4, "fallbackImageGenerationManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = *(void **)(a1 + 32);
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_2;
      v39[3] = &unk_1E76C94E8;
      v2 = &v40;
      v40 = v4;
      if ((objc_msgSend(v6, "rewrapFile:withMainKey:generationManager:", v39, *(_QWORD *)(a1 + 40), v5) & 1) != 0)
        goto LABEL_7;
    }
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_4(v4);

    if (v5)
LABEL_7:

  }
  if (objc_msgSend(v4, "hasFallbackPDF"))
  {
    objc_msgSend(v4, "fallbackPDFGenerationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = *(void **)(a1 + 32);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_3;
      v37[3] = &unk_1E76C94E8;
      v2 = &v38;
      v38 = v4;
      if ((objc_msgSend(v9, "rewrapFile:withMainKey:generationManager:", v37, *(_QWORD *)(a1 + 40), v8) & 1) != 0)
        goto LABEL_15;
    }
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_3(v4);

    if (v8)
LABEL_15:

  }
  v11 = *(_QWORD *)(a1 + 40);
  v36.receiver = *(id *)(a1 + 32);
  v36.super_class = (Class)ICAttachmentCryptoStrategyV1Neo;
  if ((objc_msgSendSuper2(&v36, sel_rewrapWithMainKey_, v11) & 1) == 0)
  {
    v18 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_2(v4);
    goto LABEL_36;
  }
  objc_msgSend(v4, "media");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v4, "media");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cryptoStrategy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "rewrapWithMainKey:", *(_QWORD *)(a1 + 40));

    if ((v16 & 1) == 0)
    {
      v18 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __50__ICAttachmentCryptoStrategyV1_rewrapWithMainKey___block_invoke_cold_1(v4);
LABEL_36:

      goto LABEL_37;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(v4, "previewImages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "copy");

  v19 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
  if (v19)
  {
    v21 = v19;
    v31 = v4;
    v22 = *(_QWORD *)v33;
    *(_QWORD *)&v20 = 138412546;
    v30 = v20;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v24, "cryptoStrategy", v30);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "rewrapWithMainKey:", *(_QWORD *)(a1 + 40));

        if ((v26 & 1) == 0)
        {
          v27 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v31, "shortLoggingDescription");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "shortLoggingDescription");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v30;
            v42 = v28;
            v43 = 2112;
            v44 = v29;
            _os_log_error_impl(&dword_1BD918000, v27, OS_LOG_TYPE_ERROR, "Cannot rewrap attachment preview image {attachment: %@, previewImage: %@}", buf, 0x16u);

          }
        }
      }
      v21 = -[NSObject countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v32, v45, 16);
    }
    while (v21);
    v4 = v31;
  }
LABEL_37:

}

uint64_t __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fallbackImageEncryptedURL");
}

uint64_t __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fallbackPDFEncryptedURL");
}

- (BOOL)writeEncryptedFallbackImageData:(id)a3
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
    -[ICAttachmentCryptoStrategyV1Neo writeEncryptedFallbackImageData:].cold.1(self);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke;
  v13[3] = &unk_1E76CFC30;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfAttachmentExists:](self, "performBlockIfAttachmentExists:", v13);
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
    v25 = "-[ICAttachmentCryptoStrategyV1Neo writeEncryptedFallbackImageData:]";
    v26 = 1024;
    v27 = 110;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Encrypted fallback image data {attachment: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;

  v3 = a2;
  objc_msgSend(v3, "fallbackImageEncryptedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "encryptData:", *(_QWORD *)(a1 + 40));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "serialize:toURL:", v7, v4);
      }
      else
      {
        v8 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_3(v3);

      }
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_2(v3);

    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_1(v3);
    v6 = v7;
  }

}

- (BOOL)writeEncryptedFallbackPDFData:(id)a3
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
    -[ICAttachmentCryptoStrategyV1Neo writeEncryptedFallbackPDFData:].cold.1(self);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke;
  v13[3] = &unk_1E76CFC30;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfAttachmentExists:](self, "performBlockIfAttachmentExists:", v13);
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
    v25 = "-[ICAttachmentCryptoStrategyV1Neo writeEncryptedFallbackPDFData:]";
    v26 = 1024;
    v27 = 141;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Encrypted fallback PDF data {attachment: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;

  v3 = a2;
  objc_msgSend(v3, "fallbackPDFEncryptedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "note");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "encryptData:", *(_QWORD *)(a1 + 40));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "serialize:toURL:", v7, v4);
      }
      else
      {
        v8 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_3(v3);

      }
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_2(v3);

    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_1(v3);
    v6 = v7;
  }

}

- (id)decryptedFallbackImageData
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
    -[ICAttachmentCryptoStrategyV1Neo decryptedFallbackImageData].cold.1(self);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__61;
  v15 = __Block_byref_object_dispose__61;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke;
  v10[3] = &unk_1E76CFF58;
  v10[4] = self;
  v10[5] = &v11;
  -[ICCryptoStrategyBase performBlockIfAttachmentExists:](self, "performBlockIfAttachmentExists:", v10);
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
    v22 = "-[ICAttachmentCryptoStrategyV1Neo decryptedFallbackImageData]";
    v23 = 1024;
    v24 = 166;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Decrypted fallback image data {attachment: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  objc_msgSend(v3, "fallbackImageEncryptedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke_cold_1(v3);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "decryptedDataFromFileURL:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke_cold_2(v3);
LABEL_7:

  }
}

- (id)decryptedFallbackPDFData
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
    -[ICAttachmentCryptoStrategyV1Neo decryptedFallbackPDFData].cold.1(self);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__61;
  v15 = __Block_byref_object_dispose__61;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke;
  v10[3] = &unk_1E76CFF58;
  v10[4] = self;
  v10[5] = &v11;
  -[ICCryptoStrategyBase performBlockIfAttachmentExists:](self, "performBlockIfAttachmentExists:", v10);
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
    v22 = "-[ICAttachmentCryptoStrategyV1Neo decryptedFallbackPDFData]";
    v23 = 1024;
    v24 = 189;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Decrypted fallback PDF data {attachment: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  v3 = a2;
  objc_msgSend(v3, "fallbackPDFEncryptedURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke_cold_1(v3);
    goto LABEL_7;
  }
  objc_msgSend(*(id *)(a1 + 32), "decryptedDataFromFileURL:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke_cold_2(v3);
LABEL_7:

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
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Rewrapping attachment with main key… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot rewrap attachment fallback PDF {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __53__ICAttachmentCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_4(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot rewrap attachment fallback image {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeEncryptedFallbackImageData:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Encrypting fallback image data… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt fallback image data because fallback URL is nil {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt fallback image data because attachment doesn't have account {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __67__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackImageData___block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt fallback image data {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)writeEncryptedFallbackPDFData:(void *)a1 .cold.1(void *a1)
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
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Encrypting fallback PDF data… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt fallback PDF data because fallback URL is nil {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt fallback PDF data because attachment doesn't have account {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __65__ICAttachmentCryptoStrategyV1Neo_writeEncryptedFallbackPDFData___block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot encrypt fallback PDF data {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)decryptedFallbackImageData
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
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Decrypting fallback image data… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt fallback image data because attachment doesn't have fallback image URL {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __61__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackImageData__block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt fallback image data {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

- (void)decryptedFallbackPDFData
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
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Decrypting fallback PDF data… {attachment: %@}%s:%d", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

void __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt fallback PDF data because attachment doesn't have fallback PDF URL {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __59__ICAttachmentCryptoStrategyV1Neo_decryptedFallbackPDFData__block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot decrypt fallback PDF data {attachment: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
