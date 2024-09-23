@implementation CDPDAuthProxyImpl

- (void)cdpContext:(id)a3 persistMasterKeyVerifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  _CDPLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "altDSID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v12;
    _os_log_impl(&dword_20DB2C000, v11, OS_LOG_TYPE_DEFAULT, "\"Attempting to persist verifier: %@ for %@\", (uint8_t *)&v15, 0x16u);

  }
  -[CDPDAuthProxyImpl _authContextFromCDPContext:](self, "_authContextFromCDPContext:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAuthenticationType:", 1);
  v14 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
  objc_msgSend(v14, "persistMasterKeyVerifier:context:completion:", v9, v13, v10);

}

- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;

  v8 = a4;
  v9 = a5;
  -[CDPDAuthProxyImpl _authContextFromCDPContext:](self, "_authContextFromCDPContext:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "setIsRKVerification:", 1);
  objc_msgSend(v10, "setAuthenticationType:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BE0ACA0], "recoveryContextWithAuthContext:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x24BE0ACC0]);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __59__CDPDAuthProxyImpl_cdpContext_verifyMasterKey_completion___block_invoke;
      v30[3] = &unk_24C81BFF0;
      v31 = v9;
      objc_msgSend(v12, "verifyMasterKey:context:completion:", v8, v11, v30);
      v13 = v31;
    }
    else
    {
      _CDPLogSystem();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[CDPDAuthProxyImpl cdpContext:verifyMasterKey:completion:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);

      if (!v9)
        goto LABEL_15;
      _CDPStateError();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v13);
    }

LABEL_15:
    goto LABEL_16;
  }
  _CDPLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[CDPDAuthProxyImpl cdpContext:verifyMasterKey:completion:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);

  if (v9)
  {
    _CDPStateError();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v9 + 2))(v9, 0, v11);
LABEL_16:

  }
}

void __59__CDPDAuthProxyImpl_cdpContext_verifyMasterKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void (*v7)(void);
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  if (v5)
  {
    if (v6)
    {
      v7 = *(void (**)(void))(v6 + 16);
LABEL_6:
      v7();
    }
  }
  else if (v6)
  {
    v7 = *(void (**)(void))(v6 + 16);
    goto LABEL_6;
  }

}

- (id)_authContextFromCDPContext:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x24BE0ACB8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  objc_msgSend(v5, "setIsUsernameEditable:", 0);
  objc_msgSend(v4, "appleID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUsername:", v6);

  objc_msgSend(v4, "altDSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAltDSID:", v7);

  objc_msgSend(v4, "dsid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDSID:", v9);

  return v5;
}

- (BOOL)isPrimaryAppleIDLoggedIn
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE0AC98], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "primaryAuthKitAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void)cdpContext:(uint64_t)a3 verifyMasterKey:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, a1, a3, "\"AKAppleIDAuthenticationController verifyMasterKey unimplemented\", a5, a6, a7, a8, 0);
}

- (void)cdpContext:(uint64_t)a3 verifyMasterKey:(uint64_t)a4 completion:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_20DB2C000, a1, a3, "\"AKAccountRecoveryContext recoveryContextWithAuthContext unimplemented\", a5, a6, a7, a8, 0);
}

@end
