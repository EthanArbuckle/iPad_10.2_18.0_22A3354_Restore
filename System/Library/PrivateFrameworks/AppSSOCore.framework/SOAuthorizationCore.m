@implementation SOAuthorizationCore

uint64_t __67__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 48), "canPerformAuthorizationWithURL:responseCode:useInternalExtensions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 1);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 useInternalExtensions:(BOOL)a5
{
  id v8;
  id v9;
  _QWORD activity_block[4];
  id v12;
  uint64_t *v13;
  id v14;
  int64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __89__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke;
  activity_block[3] = &unk_1E8C5C710;
  v12 = v8;
  v13 = &v17;
  v14 = a1;
  v15 = a4;
  v16 = a5;
  v9 = v8;
  _os_activity_initiate(&dword_1CF39B000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  LOBYTE(a4) = *((_BYTE *)v18 + 24);
  _Block_object_dispose(&v17, 8);
  return a4;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode___block_invoke;
  v9[3] = &unk_1E8C5C6E8;
  v10 = v6;
  v11 = &v14;
  v12 = a1;
  v13 = a4;
  v7 = v6;
  _os_activity_initiate(&dword_1CF39B000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, v9);

  LOBYTE(a1) = *((_BYTE *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  return (char)a1;
}

uint64_t __89__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode_useInternalExtensions___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 48), "canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), 0, *(unsigned __int8 *)(a1 + 64));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

+ (BOOL)canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 useInternalExtensions:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  int64_t v19;
  id v20;
  BOOL v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  v10 = a3;
  v11 = a5;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __112__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode_callerBundleIdentifier_useInternalExtensions___block_invoke;
  v15[3] = &unk_1E8C5C738;
  v18 = &v22;
  v19 = a4;
  v16 = v10;
  v17 = v11;
  v21 = a6;
  v20 = a1;
  v12 = v11;
  v13 = v10;
  _os_activity_initiate(&dword_1CF39B000, "canPerformAuthorizationWithURL", OS_ACTIVITY_FLAG_DEFAULT, v15);

  LOBYTE(a4) = *((_BYTE *)v23 + 24);
  _Block_object_dispose(&v22, 8);
  return a4;
}

+ (BOOL)_canPerformAuthorizationWithURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5 useInternalExtensions:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  char v12;
  void *v13;

  v6 = a6;
  v10 = a3;
  v11 = a5;
  if (+[SOUtils isAppSSOServiceAvailable](SOUtils, "isAppSSOServiceAvailable"))
  {
    if (v6 && (objc_msgSend(a1, "_doAKshouldProcessURL:", v10) & 1) != 0)
    {
      v12 = 1;
    }
    else
    {
      +[SOConfigurationClient defaultClient](SOConfigurationClient, "defaultClient");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "willHandleURL:responseCode:callerBundleIdentifier:", v10, a4, v11);

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (BOOL)_doAKshouldProcessURL:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  id v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
    v5 = objc_msgSend(MEMORY[0x1E0D00158], "shouldProcessURL:", v4);
  else
    v5 = 0;
  SO_LOG_SOAuthorizationCore();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10 = "+[SOAuthorizationCore _doAKshouldProcessURL:]";
    v11 = 2160;
    v8 = CFSTR("NO");
    v12 = 1752392040;
    v13 = 2117;
    v9 = 136316163;
    if (v5)
      v8 = CFSTR("YES");
    v14 = v4;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = a1;
    _os_log_debug_impl(&dword_1CF39B000, v6, OS_LOG_TYPE_DEBUG, "%s URL = %{sensitive, mask.hash}@, result = %@ on %@", (uint8_t *)&v9, 0x34u);
  }

  return v5;
}

void __112__SOAuthorizationCore_canPerformAuthorizationWithURL_responseCode_callerBundleIdentifier_useInternalExtensions___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  const __CFString *v5;
  const __CFString *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = +[SOAuthorizationCore _canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:](SOAuthorizationCore, "_canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
  SO_LOG_SOAuthorizationCore();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = CFSTR("YES");
    if (*(_BYTE *)(a1 + 72))
      v6 = CFSTR("YES");
    else
      v6 = CFSTR("NO");
    v7 = *(_QWORD *)(a1 + 56);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      v5 = CFSTR("NO");
    v8 = *(_QWORD *)(a1 + 64);
    v9 = 136316931;
    v10 = "+[SOAuthorizationCore canPerformAuthorizationWithURL:responseCode:callerBundleIdentifier:useInternalExtensions:]_block_invoke";
    v11 = 2160;
    v12 = 1752392040;
    v13 = 2117;
    v14 = v3;
    v15 = 1024;
    v16 = v7;
    v17 = 2114;
    v18 = v4;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v5;
    v23 = 2112;
    v24 = v8;
    _os_log_debug_impl(&dword_1CF39B000, v2, OS_LOG_TYPE_DEBUG, "%s %{sensitive, mask.hash}@, responseCode = %d, callerBundleIdentifier = %{public}@, useInternalExtensions = %{public}@, result = %{public}@ on %@", (uint8_t *)&v9, 0x4Eu);
  }

}

- (SOAuthorizationCore)init
{
  NSObject *v3;
  SOAuthorizationCore *v4;
  SOClient *v5;
  SOClient *client;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  SOAuthorizationCore *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  SO_LOG_SOAuthorizationCore();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "-[SOAuthorizationCore init]";
    v11 = 2112;
    v12 = self;
    _os_log_impl(&dword_1CF39B000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v8.receiver = self;
  v8.super_class = (Class)SOAuthorizationCore;
  v4 = -[SOAuthorizationCore init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_alloc_init(SOClient);
    client = v4->_client;
    v4->_client = v5;

    v4->_enableUserInteraction = 1;
  }
  return v4;
}

- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD activity_block[5];
  id v13;
  id v14;
  int64_t v15;

  v8 = a3;
  v9 = a5;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __76__SOAuthorizationCore_getAuthorizationHintsWithURL_responseCode_completion___block_invoke;
  activity_block[3] = &unk_1E8C5C760;
  activity_block[4] = self;
  v13 = v8;
  v14 = v9;
  v15 = a4;
  v10 = v9;
  v11 = v8;
  _os_activity_initiate(&dword_1CF39B000, "getAuthorizationHintsWithURL", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __76__SOAuthorizationCore_getAuthorizationHintsWithURL_responseCode_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __76__SOAuthorizationCore_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_2;
  v4[3] = &unk_1E8C5C490;
  v3 = *(_QWORD *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "getAuthorizationHintsWithURL:responseCode:completion:", v1, v3, v4);

}

void __76__SOAuthorizationCore_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOAuthorizationCore();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138478083;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "getAuthorizationHintsWithURL: authorizationHints = %{private}@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)beginAuthorizationWithURL:(id)a3 httpHeaders:(id)a4 httpBody:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SOAuthorizationParametersCore *v12;
  int v13;
  const char *v14;
  __int16 v15;
  SOAuthorizationCore *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  SO_LOG_SOAuthorizationCore();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[SOAuthorizationCore beginAuthorizationWithURL:httpHeaders:httpBody:]";
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_1CF39B000, v11, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v13, 0x16u);
  }

  v12 = objc_alloc_init(SOAuthorizationParametersCore);
  -[SOAuthorizationParametersCore setUrl:](v12, "setUrl:", v10);

  -[SOAuthorizationParametersCore setHttpHeaders:](v12, "setHttpHeaders:", v9);
  -[SOAuthorizationParametersCore setHttpBody:](v12, "setHttpBody:", v8);

  -[SOAuthorizationParametersCore setUseInternalExtensions:](v12, "setUseInternalExtensions:", 1);
  -[SOAuthorizationCore beginAuthorizationWithParameters:](self, "beginAuthorizationWithParameters:", v12);

}

- (void)beginAuthorizationWithOperation:(id)a3 url:(id)a4 httpHeaders:(id)a5 httpBody:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  SOAuthorizationParametersCore *v15;
  int v16;
  const char *v17;
  __int16 v18;
  SOAuthorizationCore *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  SO_LOG_SOAuthorizationCore();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[SOAuthorizationCore beginAuthorizationWithOperation:url:httpHeaders:httpBody:]";
    v18 = 2112;
    v19 = self;
    _os_log_impl(&dword_1CF39B000, v14, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v16, 0x16u);
  }

  v15 = objc_alloc_init(SOAuthorizationParametersCore);
  -[SOAuthorizationParametersCore setOperation:](v15, "setOperation:", v13);

  -[SOAuthorizationParametersCore setUrl:](v15, "setUrl:", v12);
  -[SOAuthorizationParametersCore setHttpHeaders:](v15, "setHttpHeaders:", v11);

  -[SOAuthorizationParametersCore setHttpBody:](v15, "setHttpBody:", v10);
  -[SOAuthorizationParametersCore setUseInternalExtensions:](v15, "setUseInternalExtensions:", 1);
  -[SOAuthorizationCore beginAuthorizationWithParameters:](self, "beginAuthorizationWithParameters:", v15);

}

- (void)beginAuthorizationWithParameters:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SOAuthorizationCore_beginAuthorizationWithParameters___block_invoke;
  v6[3] = &unk_1E8C5C788;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SOAuthorizationCore beginAuthorizationWithParameters:completion:](self, "beginAuthorizationWithParameters:completion:", v5, v6);

}

void __56__SOAuthorizationCore_beginAuthorizationWithParameters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "identifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_finishAuthorization:withCredential:error:", v8, v7, v6);

}

- (void)cancelAuthorization
{
  NSObject *v3;
  _QWORD activity_block[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  SOAuthorizationCore *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SO_LOG_SOAuthorizationCore();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[SOAuthorizationCore cancelAuthorization]";
    v7 = 2112;
    v8 = self;
    _os_log_impl(&dword_1CF39B000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __42__SOAuthorizationCore_cancelAuthorization__block_invoke;
  activity_block[3] = &unk_1E8C5C7B0;
  activity_block[4] = self;
  _os_activity_initiate(&dword_1CF39B000, "cancelAuthorization", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t __42__SOAuthorizationCore_cancelAuthorization__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelAuthorization");
}

- (id)debugDescription
{
  void *v2;
  void *v3;
  void *v4;

  +[SOConfigurationClient defaultClient](SOConfigurationClient, "defaultClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_cancelAuthorization
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CF39B000, v0, v1, "%@ already finished => ignoring cancel request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  id *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SO_LOG_SOAuthorizationCore();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v21 = a2;
    v22 = 2114;
    v23 = v5;
    _os_log_impl(&dword_1CF39B000, v6, OS_LOG_TYPE_DEFAULT, "cancelAuthorizationWithCompletion: success = %d, error = %{public}@", buf, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    v8 = *(void **)(a1 + 32);
    v7 = (id *)(a1 + 32);
    v9 = v8;
    objc_sync_enter(v9);
    if (*((_QWORD *)*v7 + 2))
    {
      SO_LOG_SOAuthorizationCore();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __43__SOAuthorizationCore__cancelAuthorization__block_invoke_cold_1((uint64_t)v7, v10, v11, v12, v13, v14, v15, v16);

      v17 = (void *)*((_QWORD *)*v7 + 2);
      *((_QWORD *)*v7 + 2) = 0;

      objc_sync_exit(v9);
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __43__SOAuthorizationCore__cancelAuthorization__block_invoke_14;
      v19[3] = &unk_1E8C5C7B0;
      v19[4] = *v7;
      v18 = (void *)MEMORY[0x1D17CC830](v19);
      objc_msgSend(*v7, "performBlockOnDelegateQueue:", v18);

    }
    else
    {
      objc_sync_exit(v9);

    }
  }

}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke_14(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      SO_LOG_SOAuthorizationCore();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        __43__SOAuthorizationCore__cancelAuthorization__block_invoke_14_cold_2();

      objc_msgSend(v2, "authorizationDidCancel:", *(_QWORD *)(a1 + 32));
    }
  }
  else
  {
    SO_LOG_SOAuthorizationCore();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43__SOAuthorizationCore__cancelAuthorization__block_invoke_14_cold_1();

  }
}

- (void)_finishAuthorization:(id)a3 withCredential:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  SOAuthorizationRequestParametersCore *requestParametersCore;
  id WeakRetained;
  SOAuthorizationCore *v14;
  SOAuthorizationRequestParametersCore *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  SOAuthorizationCore *v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  SOAuthorizationRequestParametersCore *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  SOAuthorizationCore *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  SO_LOG_SOAuthorizationCore();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    requestParametersCore = self->_requestParametersCore;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    *(_DWORD *)buf = 136316675;
    v27 = "-[SOAuthorizationCore _finishAuthorization:withCredential:error:]";
    v28 = 2114;
    v29 = v8;
    v30 = 2113;
    v31 = v9;
    v32 = 2114;
    v33 = v10;
    v34 = 2114;
    v35 = requestParametersCore;
    v36 = 2114;
    v37 = WeakRetained;
    v38 = 2112;
    v39 = self;
    _os_log_impl(&dword_1CF39B000, v11, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@, credentialCore = %{private}@, error = %{public}@, requestParametersCore = %{public}@, delegate = %{public}@ on %@", buf, 0x48u);

  }
  v14 = self;
  objc_sync_enter(v14);
  v15 = v14->_requestParametersCore;
  if (v15)
  {
    v14->_requestParametersCore = 0;

    objc_sync_exit(v14);
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke;
    v21 = &unk_1E8C5C800;
    v22 = v14;
    v23 = v10;
    v24 = v9;
    v25 = v8;
    v16 = (void *)MEMORY[0x1D17CC830](&v18);
    -[SOAuthorizationCore performBlockOnDelegateQueue:](v14, "performBlockOnDelegateQueue:", v16, v18, v19, v20, v21, v22);

  }
  else
  {
    SO_LOG_SOAuthorizationCore();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[SOAuthorizationCore _finishAuthorization:withCredential:error:].cold.1();

    objc_sync_exit(v14);
  }

}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  SOAuthorizationResultCore *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  uint64_t v40;
  _QWORD v41[5];
  id v42;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = (_QWORD *)(a1 + 40);
    v3 = *(_QWORD *)(a1 + 40);
    if (v3)
    {
      if (+[SOErrorHelper error:hasCode:](SOErrorHelper, "error:hasCode:", v3, -2))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SO_LOG_SOAuthorizationCore();
          v5 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_10();

          objc_msgSend(v2, "authorizationDidCancel:", *(_QWORD *)(a1 + 32));
        }
        goto LABEL_53;
      }
      if (+[SOErrorHelper error:hasCode:](SOErrorHelper, "error:hasCode:", *v4, -5))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SO_LOG_SOAuthorizationCore();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            goto LABEL_25;
          goto LABEL_26;
        }
      }
      else
      {
        if (!+[SOErrorHelper error:hasCode:](SOErrorHelper, "error:hasCode:", *v4, -9))
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            SO_LOG_SOAuthorizationCore();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_13(a1 + 40, v23, v24, v25, v26, v27, v28, v29);

            objc_msgSend(v2, "authorization:didCompleteWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
          }
          goto LABEL_53;
        }
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SO_LOG_SOAuthorizationCore();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
LABEL_25:
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_11();
LABEL_26:

          objc_msgSend(v2, "authorizationDidNotHandle:", *(_QWORD *)(a1 + 32));
        }
      }
LABEL_53:
      SO_LOG_SOAuthorizationCore();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
        __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_2();

      v37 = *(void **)(a1 + 32);
      v38 = *(_QWORD *)(a1 + 56);
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_34;
      v41[3] = &unk_1E8C5C7D8;
      v41[4] = v37;
      objc_msgSend(v37, "finishAuthorization:completion:", v38, v41);
      goto LABEL_56;
    }
    v7 = *(void **)(a1 + 48);
    if (!v7)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        SO_LOG_SOAuthorizationCore();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_3();

        objc_msgSend(v2, "authorizationDidComplete:", *(_QWORD *)(a1 + 32));
      }
      goto LABEL_53;
    }
    objc_msgSend(v7, "secKeyProxyEndpoints");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
        goto LABEL_53;
      v9 = *(void **)(a1 + 32);
      objc_msgSend(*(id *)(a1 + 48), "secKeyProxyEndpoints");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0;
      objc_msgSend(v9, "createSecKeysFromSecKeyProxyEndpoints:error:", v10, &v42);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v42;

      if (v11)
      {
        v13 = objc_alloc_init(SOAuthorizationResultCore);
        objc_msgSend(*(id *)(a1 + 48), "httpAuthorizationHeaders");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[SOAuthorizationResultCore setHttpAuthorizationHeaders:](v13, "setHttpAuthorizationHeaders:", v14);

        objc_msgSend(*(id *)(a1 + 48), "httpResponse");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SOAuthorizationResultCore setHttpResponse:](v13, "setHttpResponse:", v15);

        objc_msgSend(*(id *)(a1 + 48), "httpBody");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SOAuthorizationResultCore setHttpBody:](v13, "setHttpBody:", v16);

        -[SOAuthorizationResultCore setPrivateKeys:](v13, "setPrivateKeys:", v11);
        SO_LOG_SOAuthorizationCore();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_9();

        objc_msgSend(v2, "authorization:didCompleteWithAuthorizationResult:", *(_QWORD *)(a1 + 32), v13);
      }
      else
      {
        SO_LOG_SOAuthorizationCore();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_8();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          SO_LOG_SOAuthorizationCore();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_7();

          objc_msgSend(v2, "authorization:didCompleteWithError:", *(_QWORD *)(a1 + 32), v12);
        }
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 48), "httpAuthorizationHeaders");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_53;
        SO_LOG_SOAuthorizationCore();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_6();

        v22 = *(_QWORD *)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 48), "httpAuthorizationHeaders");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "authorization:didCompleteWithHTTPAuthorizationHeaders:", v22, v12);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "httpResponse");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_53;
          SO_LOG_SOAuthorizationCore();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_5();

          v32 = *(_QWORD *)(a1 + 32);
          objc_msgSend(*(id *)(a1 + 48), "httpResponse");
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "httpBody");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "authorization:didCompleteWithHTTPResponse:httpBody:", v32, v12, v33);

        }
        else
        {
          if ((objc_opt_respondsToSelector() & 1) == 0)
            goto LABEL_53;
          SO_LOG_SOAuthorizationCore();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
            __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_4();

          v40 = *(_QWORD *)(a1 + 32);
          +[SOErrorHelper errorWithCode:message:](SOErrorHelper, "errorWithCode:message:", -1000, CFSTR("Invalid credential"));
          v12 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "authorization:didCompleteWithError:", v40, v12);
        }
      }
    }

    goto LABEL_53;
  }
  SO_LOG_SOAuthorizationCore();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_1();

LABEL_56:
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_34(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SO_LOG_SOAuthorizationCore();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 138543874;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    v12 = 2114;
    v13 = v5;
    _os_log_debug_impl(&dword_1CF39B000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ has finished (success: %d, error: %{public}@)", (uint8_t *)&v8, 0x1Cu);
  }

}

- (SOAuthorizationCoreDelegate)delegate
{
  return (SOAuthorizationCoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateDispatchQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (void)setDelegateDispatchQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDictionary)authorizationOptions
{
  return self->_authorizationOptions;
}

- (void)setAuthorizationOptions:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationOptions, a3);
}

- (BOOL)isUserInteractionEnabled
{
  return self->_enableUserInteraction;
}

- (void)setEnableUserInteraction:(BOOL)a3
{
  self->_enableUserInteraction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationOptions, 0);
  objc_storeStrong((id *)&self->_delegateDispatchQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_requestParametersCore, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

- (SOAuthorizationRequestParametersCore)requestParametersCore
{
  SOAuthorizationCore *v2;
  SOAuthorizationRequestParametersCore *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_requestParametersCore;
  objc_sync_exit(v2);

  return v3;
}

- (void)setRequestParametersCore:(id)a3
{
  SOAuthorizationRequestParametersCore *v4;
  SOAuthorizationRequestParametersCore *requestParametersCore;
  SOAuthorizationCore *obj;

  v4 = (SOAuthorizationRequestParametersCore *)a3;
  obj = self;
  objc_sync_enter(obj);
  requestParametersCore = obj->_requestParametersCore;
  obj->_requestParametersCore = v4;

  objc_sync_exit(obj);
}

- (void)beginAuthorizationWithParameters:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  _BOOL4 enableUserInteraction;
  SOAuthorizationCore *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  SOAuthorizationRequestParametersCore *v19;
  SOAuthorizationRequestParametersCore *requestParametersCore;
  void *v21;
  void *v22;
  _QWORD activity_block[5];
  void (**v24)(id, _QWORD, void *);
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  SOAuthorizationCore *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  SO_LOG_SOAuthorizationCore();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "operation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "httpHeaders");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "httpBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "auditTokenData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    enableUserInteraction = self->_enableUserInteraction;
    *(_DWORD *)buf = 136317699;
    v26 = "-[SOAuthorizationCore(Core) beginAuthorizationWithParameters:completion:]";
    v27 = 2114;
    v28 = v22;
    v29 = 2114;
    v30 = v21;
    v31 = 2160;
    v32 = 1752392040;
    v33 = 2117;
    v34 = v9;
    v35 = 2113;
    v36 = v10;
    v37 = 2113;
    v38 = v11;
    v39 = 2114;
    v40 = v12;
    v41 = 2114;
    v42 = WeakRetained;
    v43 = 1024;
    v44 = enableUserInteraction;
    v45 = 2112;
    v46 = self;
    _os_log_impl(&dword_1CF39B000, v8, OS_LOG_TYPE_DEFAULT, "%s requestIdentifier = %{public}@, operation = %{public}@, url = %{sensitive, mask.hash}@, httpHeaders = %{private}@, httpBody = %{private}@, auditToken = %{public}@, delegate = %{public}@, enableUI = %d on %@", buf, 0x6Cu);

  }
  v15 = self;
  objc_sync_enter(v15);
  if (v15->_requestParametersCore)
  {
    SO_LOG_SOAuthorizationCore();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = (const char *)v15;
      _os_log_impl(&dword_1CF39B000, v16, OS_LOG_TYPE_DEFAULT, "%@ is already authorizing => ignoring a new authorization request", buf, 0xCu);
    }

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ is already authorizing => ignoring a new authorization request"), v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[SOErrorHelper silentInternalErrorWithMessage:](SOErrorHelper, "silentInternalErrorWithMessage:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v18);

    }
    objc_sync_exit(v15);

  }
  else
  {
    v19 = -[SOAuthorizationRequestParametersCore initWithAuthorizationParametersCore:]([SOAuthorizationRequestParametersCore alloc], "initWithAuthorizationParametersCore:", v6);
    requestParametersCore = v15->_requestParametersCore;
    v15->_requestParametersCore = v19;

    -[SOAuthorizationRequestParametersCore setAuthorizationOptions:](v15->_requestParametersCore, "setAuthorizationOptions:", v15->_authorizationOptions);
    -[SOAuthorizationRequestParametersCore setEnableUserInteraction:](v15->_requestParametersCore, "setEnableUserInteraction:", v15->_enableUserInteraction);
    objc_sync_exit(v15);

    if (!v15->_enableUserInteraction)
      -[SOAuthorizationCore _addNoUserInterfaceToAuthorizationOptionsInRequestParameters](v15, "_addNoUserInterfaceToAuthorizationOptionsInRequestParameters");
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 3221225472;
    activity_block[2] = __73__SOAuthorizationCore_Core__beginAuthorizationWithParameters_completion___block_invoke;
    activity_block[3] = &unk_1E8C5C828;
    activity_block[4] = v15;
    v24 = v7;
    _os_activity_initiate(&dword_1CF39B000, "beginAuthorizationWithParameters", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

  }
}

void __73__SOAuthorizationCore_Core__beginAuthorizationWithParameters_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(v1 + 8);
  v4 = *(_QWORD *)(v1 + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __73__SOAuthorizationCore_Core__beginAuthorizationWithParameters_completion___block_invoke_2;
  v5[3] = &unk_1E8C5C4B8;
  v6 = v2;
  objc_msgSend(v3, "performAuthorizationWithRequestParameters:completion:", v4, v5);

}

void __73__SOAuthorizationCore_Core__beginAuthorizationWithParameters_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOAuthorizationCore();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138478083;
    v10 = v5;
    v11 = 2114;
    v12 = v6;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "performAuthorizationWithRequestParameters: credential = %{private}@, error = %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);

}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  SOAuthorizationRequestParametersCore *v6;
  id v7;
  NSObject *v8;
  SOAuthorizationRequestParametersCore *requestParametersCore;
  SOAuthorizationRequestParametersCore *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = (SOAuthorizationRequestParametersCore *)a3;
  v7 = a4;
  SO_LOG_SOAuthorizationCore();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOAuthorizationCore(Core) beginAuthorizationWithRequestParameters:completion:].cold.1(v6, (uint64_t)self, v8);

  requestParametersCore = self->_requestParametersCore;
  self->_requestParametersCore = v6;
  v10 = v6;

  if (!self->_enableUserInteraction)
    -[SOAuthorizationCore _addNoUserInterfaceToAuthorizationOptionsInRequestParameters](self, "_addNoUserInterfaceToAuthorizationOptionsInRequestParameters");
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __80__SOAuthorizationCore_Core__beginAuthorizationWithRequestParameters_completion___block_invoke;
  v12[3] = &unk_1E8C5C828;
  v12[4] = self;
  v13 = v7;
  v11 = v7;
  _os_activity_initiate(&dword_1CF39B000, "beginAuthorizationWithParameters", OS_ACTIVITY_FLAG_DEFAULT, v12);

}

uint64_t __80__SOAuthorizationCore_Core__beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "beginAuthorizationWithRequestParameters:completion:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(a1 + 40));
}

- (void)_addNoUserInterfaceToAuthorizationOptionsInRequestParameters
{
  void *v3;
  void *v4;
  id v5;

  -[SOAuthorizationRequestParametersCore authorizationOptions](self->_requestParametersCore, "authorizationOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SOAuthorizationRequestParametersCore authorizationOptions](self->_requestParametersCore, "authorizationOptions");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("noUserInterface"));
  -[SOAuthorizationRequestParametersCore setAuthorizationOptions:](self->_requestParametersCore, "setAuthorizationOptions:", v5);

}

- (void)performBlockOnDelegateQueue:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  uint64_t v6;
  NSObject *delegateDispatchQueue;

  v4 = (void (**)(_QWORD))a3;
  SO_LOG_SOAuthorizationCore();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[SOAuthorizationCore(Core) performBlockOnDelegateQueue:].cold.1((uint64_t)self, v5, v6);

  delegateDispatchQueue = self->_delegateDispatchQueue;
  if (delegateDispatchQueue)
    goto LABEL_7;
  if (!objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    delegateDispatchQueue = MEMORY[0x1E0C80D38];
LABEL_7:
    dispatch_async(delegateDispatchQueue, v4);
    goto LABEL_8;
  }
  v4[2](v4);
LABEL_8:

}

- (void)debugHintsWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  SOAuthorizationCore *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SO_LOG_SOAuthorizationCore();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[SOAuthorizationCore(Core) debugHintsWithCompletion:]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_1CF39B000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  -[SOClient debugHintsWithCompletion:](self->_client, "debugHintsWithCompletion:", v4);
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a4;
  v7 = a3;
  SO_LOG_SOAuthorizationCore();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOAuthorizationCore(Core) finishAuthorization:completion:].cold.1((uint64_t)self, v8);

  -[SOClient finishAuthorization:completion:](self->_client, "finishAuthorization:completion:", v7, v6);
}

- (id)createSecKeysFromSecKeyProxyEndpoints:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SO_LOG_SOAuthorizationCore();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[SOAuthorizationCore(Core) createSecKeysFromSecKeyProxyEndpoints:error:].cold.2();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_msgSend(MEMORY[0x1E0CD5C88], "createKeyFromEndpoint:error:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v12), a4, (_QWORD)v24);
        if (!v13)
        {
          SO_LOG_SOAuthorizationCore();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[SOAuthorizationCore(Core) createSecKeysFromSecKeyProxyEndpoints:error:].cold.1((uint64_t)a4, v16, v17, v18, v19, v20, v21, v22);

          v15 = 0;
          goto LABEL_15;
        }
        v14 = (void *)v13;
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v10)
        continue;
      break;
    }
  }

  v15 = v7;
LABEL_15:

  return v15;
}

- (id)realms
{
  NSObject *v3;
  SOClient *client;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _BYTE buf[24];
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SO_LOG_SOAuthorizationCore();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SOAuthorizationCore(Kerberos) realms]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1CF39B000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  client = self->_client;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __39__SOAuthorizationCore_Kerberos__realms__block_invoke;
  v10[3] = &unk_1E8C5C850;
  v10[4] = buf;
  -[SOClient realmsWithCompletion:](client, "realmsWithCompletion:", v10);
  v5 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v6;

    v5 = *(void **)(*(_QWORD *)&buf[8] + 40);
  }
  v8 = v5;
  _Block_object_dispose(buf, 8);

  return v8;
}

void __39__SOAuthorizationCore_Kerberos__realms__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  SO_LOG_SOAuthorizationCore();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543618;
    v11 = v5;
    v12 = 2114;
    v13 = v6;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "realms = %{public}@, error = %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v5;

}

- (id)kerberosProfiles
{
  NSObject *v3;
  SOClient *client;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v10[5];
  _BYTE buf[24];
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SO_LOG_SOAuthorizationCore();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[SOAuthorizationCore(Kerberos) kerberosProfiles]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = self;
    _os_log_impl(&dword_1CF39B000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  client = self->_client;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __49__SOAuthorizationCore_Kerberos__kerberosProfiles__block_invoke;
  v10[3] = &unk_1E8C5C850;
  v10[4] = buf;
  -[SOClient profilesWithExtensionBundleIdentifier:completion:](client, "profilesWithExtensionBundleIdentifier:completion:", CFSTR("com.apple.AppSSOKerberos.KerberosExtension"), v10);
  v5 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v6;

    v5 = *(void **)(*(_QWORD *)&buf[8] + 40);
  }
  v8 = v5;
  _Block_object_dispose(buf, 8);

  return v8;
}

void __49__SOAuthorizationCore_Kerberos__kerberosProfiles__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  __int128 v8;
  id v9;
  _QWORD activity_block[4];
  id v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SO_LOG_SOAuthorizationCore();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "+[SOAuthorizationCore(Process) isExtensionProcessWithAuditToken:completion:]";
    v16 = 2112;
    v17 = a1;
    _os_log_impl(&dword_1CF39B000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (isExtensionProcessWithAuditToken_completion__onceToken != -1)
    dispatch_once(&isExtensionProcessWithAuditToken_completion__onceToken, &__block_literal_global_7);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 3221225472;
  activity_block[2] = __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke_2;
  activity_block[3] = &unk_1E8C5C878;
  v8 = *(_OWORD *)&a3->var0[4];
  v12 = *(_OWORD *)a3->var0;
  v13 = v8;
  v11 = v6;
  v9 = v6;
  _os_activity_initiate(&dword_1CF39B000, "isExtensionProcessWithAuditToken", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

}

void __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke()
{
  SOClient *v0;
  void *v1;

  v0 = objc_alloc_init(SOClient);
  v1 = (void *)isExtensionProcessWithAuditToken_completion__client;
  isExtensionProcessWithAuditToken_completion__client = (uint64_t)v0;

}

void __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  __int128 v3;
  _OWORD v4[2];
  _QWORD v5[4];
  id v6;

  v2 = (void *)isExtensionProcessWithAuditToken_completion__client;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke_3;
  v5[3] = &unk_1E8C5C508;
  v6 = *(id *)(a1 + 32);
  v3 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v3;
  objc_msgSend(v2, "isExtensionProcessWithAuditToken:completion:", v4, v5);

}

uint64_t __76__SOAuthorizationCore_Process__isExtensionProcessWithAuditToken_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CF39B000, a2, a3, "%@ still not finished => canceling now", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1CF39B000, v0, v1, "canceling now - no SPI authorization delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __43__SOAuthorizationCore__cancelAuthorization__block_invoke_14_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "canceling now - calling SPI authorization delegate authorizationDidCancel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_finishAuthorization:withCredential:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CF39B000, v0, v1, "%@ already finished => ignoring finish request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_2_0(&dword_1CF39B000, v0, v1, "no SPI authorization delegate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "finished SPI authorization delegate call", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "calling SPI authorization delegate authorizationDidComplete", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithError:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithHTTPResponse:httpBody:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithHTTPAuthorizationHeaders:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3(&dword_1CF39B000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithError: (error = %{public}@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1CF39B000, v0, v1, "failed to create SecKeys from SecKeyProxyEndpoints: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "calling SPI authorization delegate authorization:didCompleteWithAuthorizationResult:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "calling SPI authorization delegate authorizationDidCancel", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_11()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_1(&dword_1CF39B000, v0, v1, "calling SPI authorization delegate authorizationDidNotHandle", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __65__SOAuthorizationCore__finishAuthorization_withCredential_error___block_invoke_cold_13(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1CF39B000, a2, a3, "calling SPI authorization delegate authorization:didCompleteWithError:(%@)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
