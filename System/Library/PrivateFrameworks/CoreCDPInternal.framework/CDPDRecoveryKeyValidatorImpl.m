@implementation CDPDRecoveryKeyValidatorImpl

- (CDPDRecoveryKeyValidatorImpl)initWithContext:(id)a3 delegate:(id)a4 octagonTrustProxy:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDPDRecoveryKeyValidatorImpl *v12;
  CDPDRecoveryKeyValidatorImpl *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[CDPDRecoveryKeyValidatorImpl init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_context, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    v13->_recoveryKeyVerified = 0;
    objc_storeStrong((id *)&v13->_octagonTrustProxy, a5);
  }

  return v13;
}

- (void)confirmRecoveryKey:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, id);
  NSObject *v8;
  void *v9;
  char v10;
  CDPDOctagonTrustProxy *octagonTrustProxy;
  void *v12;
  int v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CDPDOctagonTrustProxy *v32;
  uint64_t v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  id v37;
  id v38;
  uint8_t buf[4];
  CDPDRecoveryKeyValidatorImpl *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, id))a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v40 = self;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"%@ : Confirming recovery key\", buf, 0xCu);
  }

  if (!v7)
    -[CDPDRecoveryKeyValidatorImpl confirmRecoveryKey:completion:].cold.1();
  -[CDPDRecoveryKeyValidatorImpl recoveryKey](self, "recoveryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", v6);

  if ((v10 & 1) != 0)
  {
    octagonTrustProxy = self->_octagonTrustProxy;
    -[CDPContext altDSID](self->_context, "altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v13 = -[CDPDOctagonTrustProxy cacheRecoveryKey:forAltDSID:error:](octagonTrustProxy, "cacheRecoveryKey:forAltDSID:error:", v6, v12, &v38);
    v14 = v38;

    _CDPLogSystem();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v16, OS_LOG_TYPE_DEFAULT, "\"cached reovery key\", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke_cold_1(v16, v25, v26, v27, v28, v29, v30, v31);
    }

    v32 = self->_octagonTrustProxy;
    v37 = 0;
    v33 = -[CDPDOctagonTrustProxy registerRecoveryKey:error:](v32, "registerRecoveryKey:error:", v6, &v37);
    v34 = v37;
    _CDPLogSystem();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = v35;
    if ((_DWORD)v33)
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v36, OS_LOG_TYPE_DEFAULT, "\"Registered recovery key in local trust systems\", buf, 2u);
      }

      -[CDPDRecoveryKeyValidatorImpl setRecoveryKeyVerified:](self, "setRecoveryKeyVerified:", 1);
    }
    else
    {
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[CDPDRecoveryKeyValidatorImpl confirmRecoveryKey:completion:].cold.2((uint64_t)v34, v36);

    }
    v7[2](v7, v33, v34);

  }
  else
  {
    _CDPLogSystem();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CDPDRecoveryKeyValidatorImpl confirmRecoveryKey:completion:].cold.4(v17, v18, v19, v20, v21, v22, v23, v24);

    v7[2](v7, 0, 0);
  }

}

- (void)generateRecoveryKey:(id)a3
{
  void (**v4)(id, void *, id);
  NSObject *v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  CDPDRecoveryKeyValidatorImpl *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *, id))a3;
  _CDPLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_20DB2C000, v5, OS_LOG_TYPE_DEFAULT, "\"%@ : Generating recovery key\", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v10 = 0;
  objc_msgSend(WeakRetained, "generateRecoveryKeyWithInfo:error:", MEMORY[0x24BDBD1B8], &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v10;
  -[CDPDRecoveryKeyValidatorImpl setRecoveryKey:](self, "setRecoveryKey:", v7);

  -[CDPDRecoveryKeyValidatorImpl recoveryKey](self, "recoveryKey");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v9, v8);

}

- (void)setRecoveryKey:(id)a3
{
  NSString *v4;
  NSString *recoveryKey;

  v4 = (NSString *)a3;
  -[CDPDRecoveryKeyValidatorImpl setRecoveryKeyVerified:](self, "setRecoveryKeyVerified:", 0);
  recoveryKey = self->_recoveryKey;
  self->_recoveryKey = v4;

}

- (BOOL)recoveryKeyVerified
{
  return self->_recoveryKeyVerified;
}

- (void)setRecoveryKeyVerified:(BOOL)a3
{
  self->_recoveryKeyVerified = a3;
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_octagonTrustProxy, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
}

- (void)confirmRecoveryKey:completion:.cold.1()
{
  __assert_rtn("-[CDPDRecoveryKeyValidatorImpl confirmRecoveryKey:completion:]", "CDPDRecoveryKeyValidatorImpl.m", 31, "completion");
}

- (void)confirmRecoveryKey:(uint64_t)a1 completion:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 141558274;
  v3 = 1752392040;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_20DB2C000, a2, OS_LOG_TYPE_ERROR, "\"Failed to register recovery key in local trust systems with error: %{mask.hash}@\", (uint8_t *)&v2, 0x16u);
}

- (void)confirmRecoveryKey:(uint64_t)a3 completion:(uint64_t)a4 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, a1, a3, "\"Key mismatch detected\", a5, a6, a7, a8, 0);
}

@end
