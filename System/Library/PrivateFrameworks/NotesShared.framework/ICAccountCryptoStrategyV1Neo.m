@implementation ICAccountCryptoStrategyV1Neo

- (ICEncryptionKey)primaryWrappedKey
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
  v8 = __Block_byref_object_copy__45;
  v9 = __Block_byref_object_dispose__45;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __49__ICAccountCryptoStrategyV1Neo_primaryWrappedKey__block_invoke;
  v4[3] = &unk_1E76CD870;
  v4[4] = &v5;
  -[ICCryptoStrategyBase performBlockIfAccountExists:](self, "performBlockIfAccountExists:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (ICEncryptionKey *)v2;
}

void __49__ICAccountCryptoStrategyV1Neo_primaryWrappedKey__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  ICEncryptionKey *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;

  v3 = a2;
  objc_msgSend(v3, "accountData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cryptoPassphraseVerifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = -[ICEncryptionKey initWithSerializedData:]([ICEncryptionKey alloc], "initWithSerializedData:", v5);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    {
      v9 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __49__ICAccountCryptoStrategyV1Neo_primaryWrappedKey__block_invoke_cold_1(v3);

    }
  }

}

- (ICEncryptionMetadata)primaryMetadata
{
  void *v2;
  void *v3;

  -[ICAccountCryptoStrategyV1Neo primaryWrappedKey](self, "primaryWrappedKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICEncryptionMetadata *)v3;
}

- (BOOL)hasPassphraseSet
{
  void *v2;
  BOOL v3;

  -[ICAccountCryptoStrategyV1Neo primaryWrappedKey](self, "primaryWrappedKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)setPassphrase:(id)a3 hint:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  _QWORD v19[4];
  id v20;
  id v21;
  __int128 *p_buf;
  uint8_t v23[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int128 buf;
  uint64_t v28;
  char v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "shortLoggingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v10;
    _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "Setting v1 Neo passphrase for account… {account: %@}", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x2020000000;
  v29 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __51__ICAccountCryptoStrategyV1Neo_setPassphrase_hint___block_invoke;
  v19[3] = &unk_1E76CB128;
  v11 = v7;
  v20 = v11;
  v12 = v6;
  v21 = v12;
  p_buf = &buf;
  -[ICCryptoStrategyBase performBlockIfAccountExists:](self, "performBlockIfAccountExists:", v19);
  v13 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortLoggingDescription");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v23 = 138412546;
    v24 = v15;
    v25 = 2112;
    v26 = v16;
    _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "Set v1 Neo passphrase for account {account: %@, success: %@}", v23, 0x16u);

  }
  v17 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v17;
}

void __51__ICAccountCryptoStrategyV1Neo_setPassphrase_hint___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  id v11;
  ICEncryptionKey *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  ICEncryptionKey *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *p_super;
  ICEncryptionKey *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v3 = a2;
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_random256BitData:", &v27);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v27;
  if (v4)
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICEncryptionMetadata makeForV1NeoCipherWithObjectIdentifier:salt:iterationCount:hint:](ICEncryptionMetadata, "makeForV1NeoCipherWithObjectIdentifier:salt:iterationCount:hint:", v6, v4, 20000, a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = a1[5];
      objc_msgSend(v7, "passphraseSalt");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v5;
      +[ICCipherV1Neo keyForPassphrase:salt:iterationCount:error:](ICCipherV1Neo, "keyForPassphrase:salt:iterationCount:error:", v8, v9, objc_msgSend(v7, "passphraseIterationCount"), &v26);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v26;

      if (v10)
      {
        v12 = -[ICEncryptionKey initWithKeyData:metadata:]([ICEncryptionKey alloc], "initWithKeyData:metadata:", v10, v7);
        if (v12)
        {
          v25 = v11;
          objc_msgSend(MEMORY[0x1E0C99D50], "ic_random256BitData:", &v25);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v25;

          if (v13)
          {
            v24 = v14;
            +[ICCipherV1Neo wrapKey:withWrapper:error:](ICCipherV1Neo, "wrapKey:withWrapper:error:", v13, v10, &v24);
            v15 = objc_claimAutoreleasedReturnValue();
            v11 = v24;

            if (v15)
            {
              v16 = -[ICEncryptionKey initWithKeyData:metadata:]([ICEncryptionKey alloc], "initWithKeyData:metadata:", v15, v7);
              if (v16)
              {
                objc_msgSend(v3, "accountDataCreateIfNecessary");
                v23 = v11;
                v17 = objc_claimAutoreleasedReturnValue();
                -[NSObject setLockedNotesMode:](v17, "setLockedNotesMode:", 1);
                -[ICEncryptionKey serializedData](v16, "serializedData");
                v22 = v16;
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSObject setCryptoPassphraseVerifier:](v17, "setCryptoPassphraseVerifier:", v18);

                -[NSObject updateChangeCountWithReason:](v17, "updateChangeCountWithReason:", CFSTR("Set passphrase"));
                +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "setCachedMainKey:forObject:", v12, v3);

                v20 = v17;
                *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
                p_super = &v22->super;
                v11 = v23;
              }
              else
              {
                p_super = 0;
                v20 = os_log_create("com.apple.notes", "Crypto");
                if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                  __51__ICAccountCryptoStrategyV1Neo_setPassphrase_hint___block_invoke_cold_7(v3);

              }
            }
            else
            {
              v20 = os_log_create("com.apple.notes", "Crypto");
              if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
                __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_6();
              p_super = v20;
            }

          }
          else
          {
            p_super = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
              __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_5();
            v15 = p_super;
            v11 = v14;
          }

        }
        else
        {
          v15 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            __51__ICAccountCryptoStrategyV1Neo_setPassphrase_hint___block_invoke_cold_4(v3);
          v13 = v15;
        }

      }
      else
      {
        v13 = os_log_create("com.apple.notes", "Crypto");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          __64__ICCloudSyncingObjectCryptoStrategyV1Neo_mainKeyForPassphrase___block_invoke_cold_2();
        v12 = (ICEncryptionKey *)v13;
      }

      v5 = v11;
    }
    else
    {
      v12 = os_log_create("com.apple.notes", "Crypto");
      if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR))
        __51__ICAccountCryptoStrategyV1Neo_setPassphrase_hint___block_invoke_cold_2(v3);
      v10 = &v12->super;
    }

  }
  else
  {
    v10 = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_1();
    v7 = v10;
  }

}

- (void)removePassphrase
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shortLoggingDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, "Removing v1 Neo password for account… {account: %@}", (uint8_t *)&v9, 0xCu);

  }
  -[ICCryptoStrategyBase performBlockIfAccountExists:](self, "performBlockIfAccountExists:", &__block_literal_global_53);
  v6 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Removed v1 Neo password for account {account: %@}", (uint8_t *)&v9, 0xCu);

  }
}

void __48__ICAccountCryptoStrategyV1Neo_removePassphrase__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = a2;
  objc_msgSend(v2, "accountDataCreateIfNecessary");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setCryptoPassphraseVerifier:", 0);
  objc_msgSend(v7, "updateChangeCountWithReason:", CFSTR("Removed passphrase"));
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCachedMainKey:forIdentifier:", 0, v4);

  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeMainKeyFromKeychainForObject:", v6);
}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  return 1;
}

void __49__ICAccountCryptoStrategyV1Neo_primaryWrappedKey__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot deserialize primary wrapped key {account: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __51__ICAccountCryptoStrategyV1Neo_setPassphrase_hint___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create encryption metadata {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __51__ICAccountCryptoStrategyV1Neo_setPassphrase_hint___block_invoke_cold_4(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create main key for passphrase {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

void __51__ICAccountCryptoStrategyV1Neo_setPassphrase_hint___block_invoke_cold_7(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create wrapped crypto verifier key for passphrase {object: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4_0();
}

@end
