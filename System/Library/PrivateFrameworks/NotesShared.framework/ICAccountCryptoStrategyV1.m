@implementation ICAccountCryptoStrategyV1

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
    _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_INFO, "Setting v1 passphrase for account… {account: %@}", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v28 = 0x2020000000;
  v29 = 0;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke;
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
    _os_log_impl(&dword_1BD918000, v13, OS_LOG_TYPE_INFO, "Set v1 passphrase for account {account: %@, success: %@}", v23, 0x16u);

  }
  v17 = *(_BYTE *)(*((_QWORD *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  return v17;
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *p_super;
  id v11;
  ICEncryptionKey *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  os_log_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;

  v3 = a2;
  v25 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", &v25);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v25;
  if (v4)
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICEncryptionMetadata makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:](ICEncryptionMetadata, "makeForV1CipherWithObjectIdentifier:salt:iterationCount:hint:", v6, v4, 20000, a1[4]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = a1[5];
      objc_msgSend(v7, "passphraseSalt");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v5;
      +[ICCipherV1 keyForPassphrase:salt:iterationCount:error:](ICCipherV1, "keyForPassphrase:salt:iterationCount:error:", v8, v9, objc_msgSend(v7, "passphraseIterationCount"), &v24);
      p_super = objc_claimAutoreleasedReturnValue();
      v11 = v24;

      if (p_super)
      {
        v12 = -[ICEncryptionKey initWithKeyData:metadata:]([ICEncryptionKey alloc], "initWithKeyData:metadata:", p_super, v7);
        if (v12)
        {
          v23 = v11;
          objc_msgSend(MEMORY[0x1E0C99D50], "ic_random128BitData:", &v23);
          v13 = objc_claimAutoreleasedReturnValue();
          v14 = v23;

          if (v13)
          {
            v22 = v14;
            +[ICCipherV1 wrapKey:withWrapper:error:](ICCipherV1, "wrapKey:withWrapper:error:", v13, p_super, &v22);
            v15 = objc_claimAutoreleasedReturnValue();
            v11 = v22;

            v21 = v15;
            if (v15)
            {
              objc_msgSend(v3, "setCryptoIterationCount:", objc_msgSend(v7, "passphraseIterationCount"));
              objc_msgSend(v7, "passphraseSalt");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setCryptoSalt:", v16);

              objc_msgSend(v3, "setCryptoVerifier:", v15);
              objc_msgSend(v7, "passphraseHint");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "setPasswordHint:", v17);

              objc_msgSend(v3, "setUnappliedEncryptedRecordData:", 0);
              objc_msgSend(v3, "updateChangeCountWithReason:", CFSTR("Set passphrase"));
              objc_msgSend(v3, "accountDataCreateIfNecessary");
              v18 = (os_log_t)objc_claimAutoreleasedReturnValue();
              -[NSObject setLockedNotesMode:](v18, "setLockedNotesMode:", 1);
              -[NSObject updateChangeCountWithReason:](v18, "updateChangeCountWithReason:", CFSTR("Set passphrase"));
              +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setCachedMainKey:forObject:", v12, v3);

              *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
            }
            else
            {
              v18 = os_log_create("com.apple.notes", "Crypto");
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
                __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_6();

            }
          }
          else
          {
            v18 = os_log_create("com.apple.notes", "Crypto");
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_5();
            v21 = v18;
            v11 = v14;
          }

          v20 = v21;
        }
        else
        {
          v20 = os_log_create("com.apple.notes", "Crypto");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
            __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_4(v3);
          v13 = v20;
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
        __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_2(v3);
      p_super = &v12->super;
    }

  }
  else
  {
    p_super = os_log_create("com.apple.notes", "Crypto");
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_1();
    v7 = p_super;
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
    _os_log_impl(&dword_1BD918000, v3, OS_LOG_TYPE_INFO, "Removing v1 passphrase for account… {account: %@}", (uint8_t *)&v9, 0xCu);

  }
  -[ICCryptoStrategyBase performBlockIfAccountExists:](self, "performBlockIfAccountExists:", &__block_literal_global_47);
  v6 = os_log_create("com.apple.notes", "Crypto");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    -[ICCryptoStrategyBase object](self, "object");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "shortLoggingDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v8;
    _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Removed v1 passphrase for account {account: %@}", (uint8_t *)&v9, 0xCu);

  }
}

void __45__ICAccountCryptoStrategyV1_removePassphrase__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_msgSend(v2, "setCryptoSalt:", 0);
  objc_msgSend(v2, "setCryptoVerifier:", 0);
  objc_msgSend(v2, "setCryptoIterationCount:", 0);
  objc_msgSend(v2, "setPasswordHint:", 0);
  objc_msgSend(v2, "setUnappliedEncryptedRecordData:", 0);
  objc_msgSend(v2, "updateChangeCountWithReason:", CFSTR("Removed passphrase"));
  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCachedMainKey:forObject:", 0, v2);

  +[ICAuthenticationState sharedState](ICAuthenticationState, "sharedState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeMainKeysFromKeychainForAccount:", v2);

}

- (BOOL)mergeEncryptedDataFromRecord:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__ICAccountCryptoStrategyV1_mergeEncryptedDataFromRecord___block_invoke;
  v7[3] = &unk_1E76CD240;
  v8 = v4;
  v5 = v4;
  -[ICCryptoStrategyBase performBlockIfAccountExists:](self, "performBlockIfAccountExists:", v7);

  return 1;
}

void __58__ICAccountCryptoStrategyV1_mergeEncryptedDataFromRecord___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "mergeCryptoFieldsFromRecord:", v3);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CryptoVerifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCryptoVerifier:", v5);

}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_1()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot generate salt {account: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_2(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create encryption metadata {object: %@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_4(void *a1)
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
  OUTLINED_FUNCTION_0(&dword_1BD918000, v2, v3, "Cannot create main key for passphrase {object: %@}", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_4_0();
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_5()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot generate crypto verifier {account: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

void __48__ICAccountCryptoStrategyV1_setPassphrase_hint___block_invoke_cold_6()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_17();
  objc_msgSend(v0, "shortLoggingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_1(&dword_1BD918000, v2, v3, "Cannot wrap crypto verifier {account: %@, error: %@}", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end
