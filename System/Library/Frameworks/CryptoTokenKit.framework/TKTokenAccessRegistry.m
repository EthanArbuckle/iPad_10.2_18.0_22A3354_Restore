@implementation TKTokenAccessRegistry

- (TKTokenAccessRegistry)initWithAccessDB:(id)a3 userPrompt:(id)a4
{
  id v7;
  id v8;
  TKTokenAccessRegistry *v9;
  TKTokenAccessRegistry *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TKTokenAccessRegistry;
  v9 = -[TKTokenAccessRegistry init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessDB, a3);
    objc_storeStrong((id *)&v10->_prompt, a4);
  }

  return v10;
}

- (TKTokenAccessRegistry)init
{
  void *v3;
  void *v4;
  TKTokenAccessRegistry *v5;

  TKTokenAccessDBCreate();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  TKTokenAccessUserPromptCreate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TKTokenAccessRegistry initWithAccessDB:userPrompt:](self, "initWithAccessDB:userPrompt:", v3, v4);

  return v5;
}

- (BOOL)evaluateRequest:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  int64_t v8;

  v6 = a3;
  if (-[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:](self, "_shouldAutomaticallyAllowRequest:", v6))
  {
    v7 = 1;
  }
  else
  {
    v8 = -[TKTokenAccessRegistry _fetchAccessForRequest:](self, "_fetchAccessForRequest:", v6);
    if (!v8)
    {
      v8 = -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:](self, "_promptUserToEvaluateRequest:error:", v6, a4);
      -[TKTokenAccessRegistry _storeAccess:forRequest:](self, "_storeAccess:forRequest:", v8, v6);
    }
    v7 = v8 == 1;
  }

  return v7;
}

- (BOOL)_shouldAutomaticallyAllowRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;

  v4 = a3;
  if (-[TKTokenAccessRegistry _platformAllowsAllRequests](self, "_platformAllowsAllRequests"))
  {
    TK_LOG_token_access_registry();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.1();
  }
  else if (objc_msgSend(v4, "clientHasAccessTokenEntitlement"))
  {
    TK_LOG_token_access_registry();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.2();
  }
  else
  {
    objc_msgSend(v4, "clientBundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      TK_LOG_token_access_registry();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.3();
      goto LABEL_21;
    }
    objc_msgSend(v4, "clientBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "hasPrefix:", CFSTR("com.apple")) & 1) != 0)
    {
      objc_msgSend(v4, "clientBundleID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.sear.SampleToken"));

      if ((v9 & 1) == 0)
      {
        TK_LOG_token_access_registry();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.6();
        goto LABEL_21;
      }
    }
    else
    {

    }
    objc_msgSend(v4, "tokenID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "classID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CD6BA8]);

    if (v12)
    {
      TK_LOG_token_access_registry();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.4();
    }
    else
    {
      objc_msgSend(v4, "tokenID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "classID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CD6BB0]);

      if (!v15)
      {
        v16 = 0;
        goto LABEL_22;
      }
      TK_LOG_token_access_registry();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        -[TKTokenAccessRegistry _shouldAutomaticallyAllowRequest:].cold.5();
    }
  }
LABEL_21:

  v16 = 1;
LABEL_22:

  return v16;
}

- (BOOL)_platformAllowsAllRequests
{
  return 0;
}

- (int64_t)_promptUserToEvaluateRequest:(id)a3 error:(id *)a4
{
  int64_t v4;
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = -[TKTokenAccessUserPrompt preflightStatus](self->_prompt, "preflightStatus");
  if (v8)
  {
    if (v8 == 1)
    {
      TK_LOG_token_access_registry();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:].cold.2();

      v4 = 1;
    }
    else if (v8 == 2)
    {
      TK_LOG_token_access_registry();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:].cold.1();

      v4 = -[TKTokenAccessUserPrompt promptUserToEvaluateRequest:error:](self->_prompt, "promptUserToEvaluateRequest:error:", v7, a4);
    }
  }
  else
  {
    TK_LOG_token_access_registry();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[TKTokenAccessRegistry _promptUserToEvaluateRequest:error:].cold.3();

    if (a4)
    {
      v11 = (void *)MEMORY[0x1E0CB35C8];
      v15 = *MEMORY[0x1E0CB2938];
      v16[0] = CFSTR("Operation not supported in this platform");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("CryptoTokenKit"), -7, v12);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v4 = 2;
  }

  return v4;
}

- (int64_t)_fetchAccessForRequest:(id)a3
{
  id v4;
  int64_t v5;
  NSObject *v6;

  v4 = a3;
  if (-[TKTokenAccessRegistry _isPersistenceEnabled](self, "_isPersistenceEnabled"))
  {
    v5 = -[TKTokenAccessDB fetchAccessForRequest:](self->_accessDB, "fetchAccessForRequest:", v4);
  }
  else
  {
    TK_LOG_token_access_registry();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[TKTokenAccessRegistry _fetchAccessForRequest:].cold.1();

    v5 = 0;
  }

  return v5;
}

- (void)_storeAccess:(int64_t)a3 forRequest:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v6 = a4;
  if (!-[TKTokenAccessRegistry _isPersistenceEnabled](self, "_isPersistenceEnabled"))
    goto LABEL_5;
  objc_msgSend(v6, "clientBundleID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  objc_msgSend(v6, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    -[TKTokenAccessDB storeAccess:forRequest:](self->_accessDB, "storeAccess:forRequest:", a3, v6);
  }
  else
  {
LABEL_5:
    TK_LOG_token_access_registry();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[TKTokenAccessRegistry _storeAccess:forRequest:].cold.1();

  }
}

- (BOOL)_isPersistenceEnabled
{
  return 1;
}

- (void)setUserPrompt:(id)a3
{
  objc_storeStrong((id *)&self->_prompt, a3);
}

- (void)setAccessDB:(id)a3
{
  objc_storeStrong((id *)&self->_accessDB, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prompt, 0);
  objc_storeStrong((id *)&self->_accessDB, 0);
}

- (void)_shouldAutomaticallyAllowRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Platform rule matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_shouldAutomaticallyAllowRequest:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Entitlement rule matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_shouldAutomaticallyAllowRequest:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "BundleID rule matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_shouldAutomaticallyAllowRequest:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Token class rule-1 matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_shouldAutomaticallyAllowRequest:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Token class rule-2 matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_shouldAutomaticallyAllowRequest:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "BundleID prefix rule matched", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_promptUserToEvaluateRequest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Present user prompt", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_promptUserToEvaluateRequest:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "User prompt not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_promptUserToEvaluateRequest:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "User prompt not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_fetchAccessForRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Fetch skipped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

- (void)_storeAccess:forRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_1B9768000, v0, v1, "Store skipped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
