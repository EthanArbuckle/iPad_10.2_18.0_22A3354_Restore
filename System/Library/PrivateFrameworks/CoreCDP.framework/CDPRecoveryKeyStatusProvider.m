@implementation CDPRecoveryKeyStatusProvider

- (CDPRecoveryKeyStatusProvider)initWithContext:(id)a3
{
  id v4;
  CDPRecoveryKeyStatusProvider *v5;
  uint64_t v6;
  CDPContext *context;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CDPRecoveryKeyStatusProvider;
  v5 = -[CDPRecoveryKeyStatusProvider init](&v9, sel_init);
  if (v5)
  {
    +[CDPContext preflightContext:](CDPContext, "preflightContext:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    context = v5->_context;
    v5->_context = (CDPContext *)v6;

  }
  return v5;
}

- (BOOL)idmsHasRK
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CDPContext altDSID](self->_context, "altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authKitAccountWithAltDSID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _CDPLogSystem();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CDPRecoveryKeyStatusProvider idmsHasRK].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);

    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "hasModernRecoveryKeyForAccount:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

LABEL_8:
  return v7;
}

- (BOOL)isRecoveryKeySetInOctagonWithError:(id *)a3
{
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  id v16;

  -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v16 = 0;
    v5 = objc_msgSend(MEMORY[0x24BDE84B0], "isRecoveryKeySetInOctagon:error:", v4, &v16);
    v6 = v16;
    if (v6)
    {
      _CDPLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInOctagonWithError:].cold.2((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

      v5 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v6);
    }

  }
  else
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInOctagonWithError:].cold.1(v14);

    if (a3)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "cdp_errorWithCode:underlyingError:", -5217, *a3);
      v5 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isRecoveryKeySetInSOSWithError:(id *)a3
{
  void *v4;
  char v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  -[CDPContext cliqueConfiguration](self->_context, "cliqueConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v5 = objc_msgSend(MEMORY[0x24BDE84B0], "isRecoveryKeySetInSOS:error:", v4, &v15);
  v6 = v15;
  if (v6)
  {
    _CDPLogSystem();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CDPRecoveryKeyStatusProvider isRecoveryKeySetInSOSWithError:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    v5 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)idmsHasRK
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a1, a3, "@\"%s: Can't find account. Returning...\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)isRecoveryKeySetInOctagonWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20D7E6000, log, OS_LOG_TYPE_ERROR, "\"CDPContext cliqueConfiguration returned nil. Cannot check if RK state matches across systems.\", v1, 2u);
}

- (void)isRecoveryKeySetInOctagonWithError:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"Received error while checking if RK is set in Octagon: %{public}@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)isRecoveryKeySetInSOSWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_20D7E6000, a2, a3, "\"Received error while checking if RK is set in SOS: %{public}@\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
