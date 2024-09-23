@implementation AKWalrusConfigProvider

+ (id)sharedInstance
{
  if (sharedInstance_pred_1 != -1)
    dispatch_once(&sharedInstance_pred_1, &__block_literal_global_46);
  return (id)sharedInstance_sharedInstance_5;
}

void __40__AKWalrusConfigProvider_sharedInstance__block_invoke()
{
  AKWalrusConfigProvider *v0;
  void *v1;

  v0 = objc_alloc_init(AKWalrusConfigProvider);
  v1 = (void *)sharedInstance_sharedInstance_5;
  sharedInstance_sharedInstance_5 = (uint64_t)v0;

}

- (void)getWalrusConfigWithCompletion:(id)a3
{
  id v4;
  AKAppleIDAuthenticationController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  AKAppleIDAuthenticationController *v16;
  _QWORD v17[4];
  AKAppleIDAuthenticationController *v18;
  id v19;
  _QWORD *v20;
  _QWORD v21[5];
  id v22;
  id v23;
  _QWORD *v24;
  _QWORD v25[5];
  id v26;

  v4 = a3;
  v5 = objc_alloc_init(AKAppleIDAuthenticationController);
  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryAuthKitAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appleIDCountryCodeForAccount:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__14;
  v25[4] = __Block_byref_object_dispose__14;
  v26 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __56__AKWalrusConfigProvider_getWalrusConfigWithCompletion___block_invoke;
  v21[3] = &unk_1E2E61488;
  v24 = v25;
  v21[4] = self;
  v11 = v9;
  v22 = v11;
  v12 = v4;
  v23 = v12;
  v13 = (void *)MEMORY[0x194022E4C](v21);
  _AKLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[AKWalrusConfigProvider getWalrusConfigWithCompletion:].cold.1(v14);

  v17[0] = v10;
  v17[1] = 3221225472;
  v17[2] = __56__AKWalrusConfigProvider_getWalrusConfigWithCompletion___block_invoke_49;
  v17[3] = &unk_1E2E614B0;
  v15 = v13;
  v19 = v15;
  v20 = v25;
  v16 = v5;
  v18 = v16;
  -[AKAppleIDAuthenticationController fetchGlobalConfigurationUsingPolicy:completion:](v16, "fetchGlobalConfigurationUsingPolicy:completion:", 0, v17);

  _Block_object_dispose(v25, 8);
}

void __56__AKWalrusConfigProvider_getWalrusConfigWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _AKLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_19202F000, v7, OS_LOG_TYPE_DEFAULT, "Fetch global config completed with error: %@", (uint8_t *)&v10, 0xCu);
  }

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40)
    || (objc_msgSend(v5, "isEqualToDictionary:") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_extractWalrusConfigWithAccountCountry:fromGlobalConfig:", *(_QWORD *)(a1 + 40), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 48);
    if (v9)
      (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v8, 0);

  }
}

void __56__AKWalrusConfigProvider_getWalrusConfigWithCompletion___block_invoke_49(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;
  v6 = v3;

  objc_msgSend(*(id *)(a1 + 32), "fetchGlobalConfigurationUsingPolicy:completion:", 1, *(_QWORD *)(a1 + 40));
}

- (id)_extractWalrusConfigWithAccountCountry:(id)a3 fromGlobalConfig:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v6 = a3;
  v7 = a4;
  if (v7)
    v8 = v7;
  else
    v8 = &unk_1E2E9A750;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("adpCountries"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "uppercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v14 = v13;
    else
      v14 = 0;

    v22 = (void *)objc_opt_new();
    if (v14)
    {
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("status"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "unsignedIntValue");

      objc_msgSend(v22, "setFeatureStatus:", v24);
      objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("reason"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setLocalizedStatusDescription:", v25);

    }
    else
    {
      _AKLogSystem();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        -[AKWalrusConfigProvider _extractWalrusConfigWithAccountCountry:fromGlobalConfig:].cold.2(v26, v27, v28, v29, v30, v31, v32, v33);

      objc_msgSend(v22, "setFeatureStatus:", 0);
    }
    objc_storeStrong((id *)&self->_cachedConfig, v22);

  }
  else
  {
    _AKLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[AKWalrusConfigProvider _extractWalrusConfigWithAccountCountry:fromGlobalConfig:].cold.1(v12, v15, v16, v17, v18, v19, v20, v21);
    v22 = 0;
  }

  return v22;
}

- (AKWalrusConfig)cachedConfig
{
  return self->_cachedConfig;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedConfig, 0);
}

- (void)getWalrusConfigWithCompletion:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19202F000, log, OS_LOG_TYPE_DEBUG, "Fetching global config for walrus config.", v1, 2u);
  OUTLINED_FUNCTION_7();
}

- (void)_extractWalrusConfigWithAccountCountry:(uint64_t)a3 fromGlobalConfig:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Global config has no ADP countries", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

- (void)_extractWalrusConfigWithAccountCountry:(uint64_t)a3 fromGlobalConfig:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_19202F000, a1, a3, "Global config has no entry for account country", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

@end
