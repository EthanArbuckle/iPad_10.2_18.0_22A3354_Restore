@implementation ICMediaCryptoStrategyV1Neo

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
    -[ICMediaCryptoStrategyV1Neo rewrapWithMainKey:].cold.1(self);

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke;
  v13[3] = &unk_1E76C9510;
  v13[4] = self;
  v6 = v4;
  v14 = v6;
  v15 = &v16;
  -[ICCryptoStrategyBase performBlockIfMediaExists:](self, "performBlockIfMediaExists:", v13);
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
    v25 = "-[ICMediaCryptoStrategyV1Neo rewrapWithMainKey:]";
    v26 = 1024;
    v27 = 52;
    _os_log_debug_impl(&dword_1BD918000, v7, OS_LOG_TYPE_DEBUG, "Rewrapped media with main key {note: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v8 = *((_BYTE *)v17 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  return v8;
}

void __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  objc_super v12;
  _QWORD v13[4];
  id v14;

  v4 = a2;
  objc_msgSend(v4, "encryptedMediaURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "generationManager");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = *(void **)(a1 + 32);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_2;
      v13[3] = &unk_1E76C94E8;
      v8 = v4;
      v14 = v8;
      if ((objc_msgSend(v7, "rewrapFile:withMainKey:generationManager:", v13, *(_QWORD *)(a1 + 40), v6) & 1) != 0)
      {

        v9 = *(_QWORD *)(a1 + 40);
        v12.receiver = *(id *)(a1 + 32);
        v12.super_class = (Class)ICMediaCryptoStrategyV1Neo;
        if ((objc_msgSendSuper2(&v12, sel_rewrapWithMainKey_, v9) & 1) != 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        }
        else
        {
          v11 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_3(v8);

        }
        goto LABEL_18;
      }
      v2 = &v14;
    }
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_2(v4);

    if (v6)
  }
  else
  {
    v6 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_1(v4);

  }
LABEL_18:

}

uint64_t __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "encryptedMediaURL");
}

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICMediaCryptoStrategyV1Neo;
  v5 = -[ICCryptoStrategyBase encryptFileFromURL:toURL:](&v7, sel_encryptFileFromURL_toURL_, a3, a4);
  -[ICCryptoStrategyBase performBlockIfMediaExists:](self, "performBlockIfMediaExists:", &__block_literal_global_17);
  return v5;
}

uint64_t __55__ICMediaCryptoStrategyV1Neo_encryptFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyRandomCryptoGooIfNeeded");
}

- (id)decryptedData
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
    -[ICMediaCryptoStrategyV1Neo decryptedData].cold.1(self);

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__9;
  v15 = __Block_byref_object_dispose__9;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__ICMediaCryptoStrategyV1Neo_decryptedData__block_invoke;
  v10[3] = &unk_1E76C9578;
  v10[4] = self;
  v10[5] = &v11;
  -[ICCryptoStrategyBase performBlockIfMediaExists:](self, "performBlockIfMediaExists:", v10);
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
    v22 = "-[ICMediaCryptoStrategyV1Neo decryptedData]";
    v23 = 1024;
    v24 = 88;
    _os_log_debug_impl(&dword_1BD918000, v4, OS_LOG_TYPE_DEBUG, "Decrypted data {media: %@, success: %@}%s:%d", buf, 0x26u);

  }
  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

void __43__ICMediaCryptoStrategyV1Neo_decryptedData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "encryptedMediaURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      v10 = "Cannot decrypt media because encrypted media URL is nil {media: %@}";
      goto LABEL_7;
    }
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 32), "decryptedDataFromFileURL:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v8 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "shortLoggingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v9;
      v10 = "Cannot decrypt media {media: %@}";
LABEL_7:
      _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v11, 0xCu);

      goto LABEL_8;
    }
    goto LABEL_8;
  }
LABEL_9:

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

  objc_msgSend(a1, "object");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "shortLoggingDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Rewrapping media with main key… {note: %@}%s:%d", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

void __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping media because encrypted media URL is nil {media: %@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

void __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Not rewrapping media's encrypted values because couldn't rewrap media data {media: %@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

void __48__ICMediaCryptoStrategyV1Neo_rewrapWithMainKey___block_invoke_cold_3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot rewrap media's encrypted values {media: %@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

- (void)decryptedData
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
  OUTLINED_FUNCTION_1_3(&dword_1BD918000, v3, v4, "Decrypting data… {media: %@}%s:%d", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_7();
}

@end
