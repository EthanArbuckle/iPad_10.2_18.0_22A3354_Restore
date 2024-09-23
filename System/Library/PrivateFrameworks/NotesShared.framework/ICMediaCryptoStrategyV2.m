@implementation ICMediaCryptoStrategyV2

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  BOOL v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICMediaCryptoStrategyV2;
  v5 = -[ICCloudSyncingObjectCryptoStrategyV2 encryptFileFromURL:toURL:](&v7, sel_encryptFileFromURL_toURL_, a3, a4);
  -[ICCryptoStrategyBase performBlockIfMediaExists:](self, "performBlockIfMediaExists:", &__block_literal_global_20);
  return v5;
}

uint64_t __52__ICMediaCryptoStrategyV2_encryptFileFromURL_toURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "applyRandomCryptoGooIfNeeded");
}

- (id)decryptedData
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
  v8 = __Block_byref_object_copy__14;
  v9 = __Block_byref_object_dispose__14;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke;
  v4[3] = &unk_1E76C9A98;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfMediaExists:](self, "performBlockIfMediaExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v3 = a2;
  if (objc_msgSend(v3, "isPasswordProtected"))
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) == 0)
    {
      v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_4(v3);
      goto LABEL_13;
    }
    objc_msgSend(v3, "encryptedMediaURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = os_log_create("com.apple.notes", "Crypto");
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (!v4)
    {
      if (v6)
        __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_1(v3);
      goto LABEL_13;
    }
    if (v6)
      __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_3(v3);

    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "encryptedMediaURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decryptedDataFromFileURL:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v5 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_2(v3, v5);
LABEL_13:

    }
  }

}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Trying to decrypt a media that doesn have encrypted media url: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shortLoggingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Failed to decrypt %@", v4, 0xCu);

  OUTLINED_FUNCTION_4_0();
}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_3(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Decrypting %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __40__ICMediaCryptoStrategyV2_decryptedData__block_invoke_cold_4(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "Trying to access decrypted data while not authenticated for %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
