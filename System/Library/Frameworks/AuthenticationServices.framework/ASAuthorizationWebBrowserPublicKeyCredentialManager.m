@implementation ASAuthorizationWebBrowserPublicKeyCredentialManager

- (ASAuthorizationWebBrowserPublicKeyCredentialManager)init
{
  ASAuthorizationWebBrowserPublicKeyCredentialManager *v2;
  ASCAgentProxy *v3;
  ASCAgentProxy *agentProxy;
  ASAuthorizationWebBrowserPublicKeyCredentialManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASAuthorizationWebBrowserPublicKeyCredentialManager;
  v2 = -[ASAuthorizationWebBrowserPublicKeyCredentialManager init](&v7, sel_init);
  if (v2)
  {
    v3 = (ASCAgentProxy *)objc_alloc_init(MEMORY[0x24BE0B1F8]);
    agentProxy = v2->_agentProxy;
    v2->_agentProxy = v3;

    v5 = v2;
  }

  return v2;
}

- (void)platformCredentialsForRelyingParty:(NSString *)relyingParty completionHandler:(void *)completionHandler
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = completionHandler;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __108__ASAuthorizationWebBrowserPublicKeyCredentialManager_platformCredentialsForRelyingParty_completionHandler___block_invoke;
  v8[3] = &unk_24C950E20;
  v9 = v6;
  v7 = v6;
  -[ASAuthorizationWebBrowserPublicKeyCredentialManager corePlatformCredentialsForRelyingParty:completionHandler:](self, "corePlatformCredentialsForRelyingParty:completionHandler:", relyingParty, v8);

}

void __108__ASAuthorizationWebBrowserPublicKeyCredentialManager_platformCredentialsForRelyingParty_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_20);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

ASAuthorizationWebBrowserPlatformPublicKeyCredential *__108__ASAuthorizationWebBrowserPublicKeyCredentialManager_platformCredentialsForRelyingParty_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  ASAuthorizationWebBrowserPlatformPublicKeyCredential *v3;

  v2 = a2;
  v3 = -[ASAuthorizationWebBrowserPlatformPublicKeyCredential initWithCorePasskey:]([ASAuthorizationWebBrowserPlatformPublicKeyCredential alloc], "initWithCorePasskey:", v2);

  return v3;
}

- (void)requestAuthorizationForPublicKeyCredentials:(void *)completionHandler
{
  void *v3;
  NSObject *v4;
  id v5;
  void *v6;
  uint8_t buf[16];

  v3 = completionHandler;
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "Requesting TCC access for passkey browser requests.", buf, 2u);
  }
  v6 = v3;
  v5 = v3;
  TCCAccessRequest();

}

uint64_t __99__ASAuthorizationWebBrowserPublicKeyCredentialManager_requestAuthorizationForPublicKeyCredentials___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "TCC access: %{BOOL}d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 == 0);
}

- (ASAuthorizationWebBrowserPublicKeyCredentialManagerAuthorizationState)authorizationStateForPlatformCredentials
{
  NSObject *v2;
  unsigned int v3;
  NSObject *v4;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_20E4D9000, v2, OS_LOG_TYPE_INFO, "Checking TCC access for passkey browser requests.", (uint8_t *)v6, 2u);
  }
  v3 = TCCAccessPreflight();
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_INFO, "TCC access: %d", (uint8_t *)v6, 8u);
  }
  if (v3 >= 2)
    return 2;
  else
    return (unint64_t)v3;
}

- (void)corePlatformCredentialsForRelyingParty:(id)a3 completionHandler:(id)a4
{
  -[ASCAgentProxy browserPasskeysForRelyingParty:completionHandler:](self->_agentProxy, "browserPasskeysForRelyingParty:completionHandler:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_agentProxy, 0);
}

@end
