@implementation CDPAuthProviderProxy

+ (id)proxyWithAuthProvider:(id)a3
{
  CDPAuthProvider *v3;
  CDPAuthProviderProxy *v4;
  CDPAuthProvider *authProvider;

  v3 = (CDPAuthProvider *)a3;
  v4 = objc_alloc_init(CDPAuthProviderProxy);
  authProvider = v4->_authProvider;
  v4->_authProvider = v3;

  return v4;
}

- (void)cdpContext:(id)a3 performSilentRecoveryTokenRenewal:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  CDPAuthProvider *authProvider;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D7E6000, v8, OS_LOG_TYPE_DEFAULT, "\"Starting token renewal\", buf, 2u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    authProvider = self->_authProvider;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __69__CDPAuthProviderProxy_cdpContext_performSilentRecoveryTokenRenewal___block_invoke;
    v11[3] = &unk_24C7C1160;
    v12 = v7;
    -[CDPAuthProvider cdpContext:performSilentRecoveryTokenRenewal:](authProvider, "cdpContext:performSilentRecoveryTokenRenewal:", v6, v11);
    v10 = v12;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    _CDPStateError(-5200, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v10);
    goto LABEL_7;
  }
LABEL_8:

}

void __69__CDPAuthProviderProxy_cdpContext_performSilentRecoveryTokenRenewal___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __69__CDPAuthProviderProxy_cdpContext_performSilentRecoveryTokenRenewal___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

}

- (void)cdpContext:(id)a3 verifyMasterKey:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  CDPAuthProvider *authProvider;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
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
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl(&dword_20D7E6000, v11, OS_LOG_TYPE_DEFAULT, "\"Starting MRK verification for %@\", buf, 0xCu);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    authProvider = self->_authProvider;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __62__CDPAuthProviderProxy_cdpContext_verifyMasterKey_completion___block_invoke;
    v15[3] = &unk_24C7C1188;
    v16 = v10;
    -[CDPAuthProvider cdpContext:verifyMasterKey:completion:](authProvider, "cdpContext:verifyMasterKey:completion:", v8, v9, v15);
    v14 = v16;
LABEL_7:

    goto LABEL_8;
  }
  if (v10)
  {
    _CDPStateError(-5200, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);
    goto LABEL_7;
  }
LABEL_8:

}

void __62__CDPAuthProviderProxy_cdpContext_verifyMasterKey_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
  _CDPLogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __62__CDPAuthProviderProxy_cdpContext_verifyMasterKey_completion___block_invoke_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authProvider, 0);
}

void __69__CDPAuthProviderProxy_cdpContext_performSilentRecoveryTokenRenewal___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D7E6000, a1, a3, "\"Token completion block called\", a5, a6, a7, a8, 0);
}

void __62__CDPAuthProviderProxy_cdpContext_verifyMasterKey_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D7E6000, a1, a3, "\"MRK verification completion block called\", a5, a6, a7, a8, 0);
}

@end
