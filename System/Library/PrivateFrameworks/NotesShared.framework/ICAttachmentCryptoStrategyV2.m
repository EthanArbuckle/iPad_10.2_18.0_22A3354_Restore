@implementation ICAttachmentCryptoStrategyV2

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
  v9[2] = __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke;
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

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  os_log_t v9;
  NSObject *v10;

  v3 = a2;
  if (!objc_msgSend(v3, "isUnsupported"))
  {
    if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
    {
      v4 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_6(v3);
      goto LABEL_13;
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) == 0)
    {
      v4 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_5(v3);
      goto LABEL_13;
    }
    NSStringFromFallbackAssetType(*(_QWORD *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 56);
    if (v6 == 1)
    {
      objc_msgSend(v3, "fallbackPDFEncryptedURL");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v6)
        goto LABEL_21;
      objc_msgSend(v3, "fallbackImageEncryptedURL");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v4 = v7;
    if (v7)
    {
      v8 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4();

      objc_msgSend(*(id *)(a1 + 32), "encryptData:", *(_QWORD *)(a1 + 40));
      v9 = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "serialize:toURL:", v9, v4);
      }
      else
      {
        v10 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_3();

      }
LABEL_27:

      goto LABEL_14;
    }
LABEL_21:
    v9 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_2();
    v4 = v9;
    goto LABEL_27;
  }
  v4 = os_log_create("com.apple.notes", "CoreData");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_1(v3);
LABEL_13:
  v5 = v4;
LABEL_14:

}

- (BOOL)writeEncryptedFallbackImageData:(id)a3
{
  return -[ICAttachmentCryptoStrategyV2 writeEncryptedFallbackAssetData:fallbackAssetType:](self, "writeEncryptedFallbackAssetData:fallbackAssetType:", a3, 0);
}

- (BOOL)writeEncryptedFallbackPDFData:(id)a3
{
  return -[ICAttachmentCryptoStrategyV2 writeEncryptedFallbackAssetData:fallbackAssetType:](self, "writeEncryptedFallbackAssetData:fallbackAssetType:", a3, 1);
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
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke;
  v5[3] = &unk_1E76C7640;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  -[ICCryptoStrategyBase performBlockIfAttachmentExists:](self, "performBlockIfAttachmentExists:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;

  v3 = a2;
  if ((objc_msgSend(v3, "isPasswordProtected") & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_5(v3);
    goto LABEL_10;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isAuthenticated") & 1) == 0)
  {
    v7 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_4(v3);
LABEL_10:
    v4 = v7;
    goto LABEL_11;
  }
  NSStringFromFallbackAssetType(*(_QWORD *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 == 1)
  {
    objc_msgSend(v3, "fallbackPDFEncryptedURL");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
LABEL_19:
      v12 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_1();
      v7 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v3, "fallbackImageEncryptedURL");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
  if (!v6)
    goto LABEL_19;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_3();

  objc_msgSend(*(id *)(a1 + 32), "decryptedDataFromFileURL:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    v12 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_2();
LABEL_22:

  }
LABEL_11:

}

- (id)decryptedFallbackImageData
{
  return -[ICAttachmentCryptoStrategyV2 decryptedFallbackAssetDataForFallbackAssetType:](self, "decryptedFallbackAssetDataForFallbackAssetType:", 0);
}

- (id)decryptedFallbackPDFData
{
  return -[ICAttachmentCryptoStrategyV2 decryptedFallbackAssetDataForFallbackAssetType:](self, "decryptedFallbackAssetDataForFallbackAssetType:", 1);
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "attachment is not supported, but writeEncryptedFallbackAssetData is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "No URL when trying to write encrypted fallback %@ data for %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Encryption Failed on fallback %@ for %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_4()
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
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Encrypting fallback %@ for %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_5(void *a1)
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

void __82__ICAttachmentCryptoStrategyV2_writeEncryptedFallbackAssetData_fallbackAssetType___block_invoke_cold_6(void *a1)
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

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_1()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "No URL when loading unsupported attachment fallback %@ data for %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_2()
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
  OUTLINED_FUNCTION_1(&dword_1BD918000, v3, v4, "Cannot decrypt fallback %@ for %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_3()
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
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v3, v4, "Decrypting fallback %@ for %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_4(void *a1)
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

void __79__ICAttachmentCryptoStrategyV2_decryptedFallbackAssetDataForFallbackAssetType___block_invoke_cold_5(void *a1)
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
  OUTLINED_FUNCTION_4(&dword_1BD918000, v2, v3, "attachment is not password-protected, but decryptedFallbackAssetData is called. %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
