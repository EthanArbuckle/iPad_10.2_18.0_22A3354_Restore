@implementation ICMediaCryptoStrategyV1

- (BOOL)encryptFileFromURL:(id)a3 toURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[5];
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
  v11[2] = __52__ICMediaCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke;
  v11[3] = &unk_1E76CF320;
  v14 = &v15;
  v11[4] = self;
  v8 = v6;
  v12 = v8;
  v9 = v7;
  v13 = v9;
  -[ICCryptoStrategyBase performBlockIfMediaExists:](self, "performBlockIfMediaExists:", v11);
  LOBYTE(self) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __52__ICMediaCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__ICMediaCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke_2;
  v8[3] = &unk_1E76CF2F8;
  v9 = v3;
  v7 = v3;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v4, "encryptFileFromURL:toURL:setTagAndIVHandler:", v5, v6, v8);

}

void __52__ICMediaCryptoStrategyV1_encryptFileFromURL_toURL___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setAssetCryptoTag:", a2);
  objc_msgSend(*(id *)(a1 + 32), "setAssetCryptoInitializationVector:", v6);

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
  v8 = __Block_byref_object_copy__51;
  v9 = __Block_byref_object_dispose__51;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke;
  v4[3] = &unk_1E76C9A98;
  v4[4] = self;
  v4[5] = &v5;
  -[ICCryptoStrategyBase performBlockIfMediaExists:](self, "performBlockIfMediaExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _BOOL4 v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__51;
  v46 = __Block_byref_object_dispose__51;
  v47 = 0;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__51;
  v36 = __Block_byref_object_dispose__51;
  v37 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_2;
  v21 = &unk_1E76CF348;
  v24 = &v42;
  v5 = v3;
  v25 = &v38;
  v26 = &v32;
  v27 = &v28;
  v6 = *(_QWORD *)(a1 + 32);
  v22 = v5;
  v23 = v6;
  objc_msgSend(v4, "performBlockAndWait:", &v18);

  if (*((_BYTE *)v39 + 24))
  {
    v7 = *((_BYTE *)v29 + 24) == 0;
    v8 = os_log_create("com.apple.notes", "Crypto");
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9)
      {
        objc_opt_class();
        __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_1();
      }
    }
    else
    {
      if (v9)
      {
        objc_opt_class();
        __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_3();
      }

      objc_msgSend(*(id *)(a1 + 32), "decryptedDataFromFileURL:", v33[5], v18, v19, v20, v21);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) == 0;
      v14 = os_log_create("com.apple.notes", "Crypto");
      v8 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_opt_class();
          __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_2();
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (void *)objc_opt_class();
        v16 = v43[5];
        *(_DWORD *)buf = 138412546;
        v49 = v15;
        v50 = 2112;
        v51 = v16;
        v17 = v15;
        _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "Decrypted %@ %@", buf, 0x16u);

      }
    }

  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "isPasswordProtected");
  objc_msgSend(*(id *)(a1 + 32), "encryptedMediaURL");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "isAuthenticated");
}

- (id)fileURLEncryptionCryptoTag
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
  v8 = __Block_byref_object_copy__51;
  v9 = __Block_byref_object_dispose__51;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__ICMediaCryptoStrategyV1_fileURLEncryptionCryptoTag__block_invoke;
  v4[3] = &unk_1E76CF370;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfMediaExists:](self, "performBlockIfMediaExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __53__ICMediaCryptoStrategyV1_fileURLEncryptionCryptoTag__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "assetCryptoTag");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)fileURLEncryptionCryptoInitialzationVector
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
  v8 = __Block_byref_object_copy__51;
  v9 = __Block_byref_object_dispose__51;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__ICMediaCryptoStrategyV1_fileURLEncryptionCryptoInitialzationVector__block_invoke;
  v4[3] = &unk_1E76CF370;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfMediaExists:](self, "performBlockIfMediaExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

void __69__ICMediaCryptoStrategyV1_fileURLEncryptionCryptoInitialzationVector__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "assetCryptoInitializationVector");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_10();
  v3 = OUTLINED_FUNCTION_0_12(v0, v1, v2, 5.778e-34);
  OUTLINED_FUNCTION_3_8(&dword_1BD918000, v4, v5, "Trying to access decrypted data while not authenticated for %@ (%@)");

  OUTLINED_FUNCTION_16();
}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_2()
{
  NSObject *v0;
  uint8_t *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  OUTLINED_FUNCTION_1_10();
  v5 = OUTLINED_FUNCTION_0_12(v2, v3, v4, 5.778e-34);
  _os_log_error_impl(&dword_1BD918000, v0, OS_LOG_TYPE_ERROR, "Failed to decrypt %@ %@", v1, 0x16u);

  OUTLINED_FUNCTION_16();
}

void __40__ICMediaCryptoStrategyV1_decryptedData__block_invoke_cold_3()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_10();
  v3 = OUTLINED_FUNCTION_0_12(v0, v1, v2, 5.778e-34);
  OUTLINED_FUNCTION_3_8(&dword_1BD918000, v4, v5, "Decrypting %@ %@");

  OUTLINED_FUNCTION_16();
}

@end
