@implementation CDPContext

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  _CDPLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v6;
    _os_log_impl(&dword_20DB2C000, v7, OS_LOG_TYPE_DEFAULT, "\"Renew request completed! Error: %@\", (uint8_t *)&v16, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(v5, "passwordEquivToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _CDPLogSystem();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_cold_2(v10);

      objc_msgSend(v5, "passwordEquivToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "setPasswordEquivToken:", v11);

    }
  }
  v12 = objc_msgSend(MEMORY[0x24BE1A3F8], "isSubsetOfContextTypeSignIn:", objc_msgSend(*(id *)(a1 + 32), "type"));
  if (v6 && v12 && objc_msgSend(MEMORY[0x24BE1A4A0], "isAudioAccessory"))
  {
    _CDPLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_cold_1();

  }
  v14 = *(_QWORD *)(a1 + 40);
  if (v14)
  {
    objc_msgSend(v5, "passwordEquivToken");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, id))(v14 + 16))(v14, v15 != 0, v6);

  }
}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_14(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void (*v10)(void);
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint8_t v14[16];

  v5 = a2;
  v6 = a3;
  if (v5
    && (objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE0ABD0]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"Silent re-authentication succeeded\", v14, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "updateWithAuthenticationResults:", v5);
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
    {
      v10 = *(void (**)(void))(v9 + 16);
LABEL_16:
      v10();
    }
  }
  else
  {
    _CDPLogSystem();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_14_cold_2();

    if (objc_msgSend(MEMORY[0x24BE1A3F8], "isSubsetOfContextTypeSignIn:", objc_msgSend(*(id *)(a1 + 32), "type"))&& objc_msgSend(MEMORY[0x24BE1A4A0], "isAudioAccessory"))
    {
      _CDPLogSystem();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_14_cold_1();

    }
    v13 = *(_QWORD *)(a1 + 40);
    if (v13)
    {
      v10 = *(void (**)(void))(v13 + 16);
      goto LABEL_16;
    }
  }

}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_20DB2C000, v0, v1, "\"CDP Reauthentication on HomePod failed. Error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_20DB2C000, log, OS_LOG_TYPE_DEBUG, "\"Silently re-fetched recovery token\", v1, 2u);
}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_14_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_2(&dword_20DB2C000, v0, v1, "\"CDP Reauth on HomePod failed. Error: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __55__CDPContext_Daemon__reauthenticateUserWithCompletion___block_invoke_14_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_20DB2C000, v0, v1, "\"Silent re-authentication failed: %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
