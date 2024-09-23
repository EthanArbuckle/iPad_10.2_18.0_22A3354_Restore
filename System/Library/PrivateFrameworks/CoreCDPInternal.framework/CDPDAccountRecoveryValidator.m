@implementation CDPDAccountRecoveryValidator

- (CDPDAccountRecoveryValidator)initWithContext:(id)a3 authProvider:(id)a4 octagonTrustProxy:(id)a5
{
  id v9;
  id v10;
  id v11;
  CDPDAccountRecoveryValidator *v12;
  CDPDAccountRecoveryValidator *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[CDPDAccountRecoveryValidator init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_authProvider, a4);
    objc_storeStrong((id *)&v13->_context, a3);
    objc_storeStrong((id *)&v13->_octagonTrustProxy, a5);
  }

  return v13;
}

- (void)confirmRecoveryKey:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CDPAuthProviderInternal *authProvider;
  CDPContext *context;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  CDPDAccountRecoveryValidator *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v17 = self;
    _os_log_impl(&dword_20DB2C000, v8, OS_LOG_TYPE_DEFAULT, "\"%@ : Confirming recovery key\", buf, 0xCu);
  }

  if (!v7)
    -[CDPDAccountRecoveryValidator confirmRecoveryKey:completion:].cold.1();
  authProvider = self->_authProvider;
  if (!authProvider)
    -[CDPDAccountRecoveryValidator confirmRecoveryKey:completion:].cold.2();
  context = self->_context;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke;
  v13[3] = &unk_24C81BEA8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  -[CDPAuthProviderInternal cdpContext:verifyMasterKey:completion:](authProvider, "cdpContext:verifyMasterKey:completion:", context, v12, v13);

}

void __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  void (*v16)(void);
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setRecoveredInfo:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setRecoveryKey:", *(_QWORD *)(a1 + 40));
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(_QWORD *)(a1 + 40);
    v8 = *(void **)(v6 + 24);
    objc_msgSend(*(id *)(v6 + 16), "altDSID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0;
    v10 = objc_msgSend(v8, "cacheRecoveryKey:forAltDSID:error:", v7, v9, &v24);
    v11 = v24;

    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_20DB2C000, v13, OS_LOG_TYPE_DEFAULT, "\"cached reovery key\", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke_cold_1(v13, v17, v18, v19, v20, v21, v22, v23);
    }

    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  else
  {
    _CDPLogSystem();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v26 = v15;
      v27 = 2112;
      v28 = v5;
      _os_log_impl(&dword_20DB2C000, v14, OS_LOG_TYPE_DEFAULT, "\"%@ : recovery failed with error %@\", buf, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_cdpErrorFromAuthKitError:", v5);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v16 = *(void (**)(void))(*(_QWORD *)(a1 + 48) + 16);
  }
  v16();

}

- (void)generateRecoveryKey:(id)a3
{
  void (**v3)(id, _QWORD, void *);
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;

  v3 = (void (**)(id, _QWORD, void *))a3;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[CDPDAccountRecoveryValidator generateRecoveryKey:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

  if (v3)
  {
    _CDPStateError();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0, v12);

  }
}

- (id)_cdpErrorFromAuthKitError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BE0AB28]))
      objc_msgSend(v4, "code");

    _CDPStateErrorWithUnderlying();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)recoveredInfo
{
  return self->_recoveredInfo;
}

- (void)setRecoveredInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)recoveryKey
{
  return self->_recoveryKey;
}

- (void)setRecoveryKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryKey, 0);
  objc_storeStrong((id *)&self->_recoveredInfo, 0);
  objc_storeStrong((id *)&self->_octagonTrustProxy, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_authProvider, 0);
}

- (void)confirmRecoveryKey:completion:.cold.1()
{
  __assert_rtn("-[CDPDAccountRecoveryValidator confirmRecoveryKey:completion:]", "CDPDAccountRecoveryValidator.m", 44, "completion");
}

- (void)confirmRecoveryKey:completion:.cold.2()
{
  __assert_rtn("-[CDPDAccountRecoveryValidator confirmRecoveryKey:completion:]", "CDPDAccountRecoveryValidator.m", 45, "_authProvider");
}

void __62__CDPDAccountRecoveryValidator_confirmRecoveryKey_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, a1, a3, "\"failed to cache recovery key\", a5, a6, a7, a8, 0);
}

- (void)generateRecoveryKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, a1, a3, "\"Programming error detected! File a radar!\", a5, a6, a7, a8, 0);
}

@end
