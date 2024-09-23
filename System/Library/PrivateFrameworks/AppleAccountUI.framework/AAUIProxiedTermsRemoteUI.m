@implementation AAUIProxiedTermsRemoteUI

- (AAUIProxiedTermsRemoteUI)initWithAuthResults:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[AAUIProxiedTermsRemoteUI initWithAuthResults:]", "AAUIProxiedTermsRemoteUI.m", 23, "0");
}

- (AAUIProxiedTermsRemoteUI)initWithAuthResults:(id)a3 proxiedDevice:(id)a4 appProvidedContext:(id)a5
{
  return -[AAUIProxiedTermsRemoteUI initWithAuthResults:proxiedDevice:anisetteDataProvider:appProvidedContext:termsEntries:](self, "initWithAuthResults:proxiedDevice:anisetteDataProvider:appProvidedContext:termsEntries:", a3, a4, 0, a5, 0);
}

- (AAUIProxiedTermsRemoteUI)initWithAuthResults:(id)a3 proxiedDevice:(id)a4 anisetteDataProvider:(id)a5 appProvidedContext:(id)a6 termsEntries:(id)a7
{
  AKDevice *v12;
  AKAnisetteServiceProtocol *v13;
  NSString *v14;
  AKDevice *proxiedDevice;
  AKDevice *v16;
  id v17;
  id v18;
  NSString *appProvidedContext;
  NSString *v20;
  AKAnisetteServiceProtocol *anisetteDataProvider;
  AKAnisetteServiceProtocol *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  AAUIProxiedTermsRemoteUI *v31;
  objc_super v33;

  v12 = (AKDevice *)a4;
  v13 = (AKAnisetteServiceProtocol *)a5;
  v14 = (NSString *)a6;
  proxiedDevice = self->_proxiedDevice;
  self->_proxiedDevice = v12;
  v16 = v12;
  v17 = a7;
  v18 = a3;

  appProvidedContext = self->_appProvidedContext;
  self->_appProvidedContext = v14;
  v20 = v14;

  anisetteDataProvider = self->_anisetteDataProvider;
  self->_anisetteDataProvider = v13;
  v22 = v13;

  v23 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
  v24 = objc_alloc(MEMORY[0x1E0C8F298]);
  objc_msgSend(v23, "accountTypeWithAccountTypeIdentifier:", *MEMORY[0x1E0C8F030]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithAccountType:", v25);

  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFC8]);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setUsername:", v27);

  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF50]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAccountProperty:forKey:", v28, CFSTR("personID"));

  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFF40]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "_aa_setAltDSID:", v29);

  objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CFFFA0]);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "aa_setPassword:", v30);
  v33.receiver = self;
  v33.super_class = (Class)AAUIProxiedTermsRemoteUI;
  v31 = -[AAUIGenericTermsRemoteUI initWithAccount:inStore:termsEntries:](&v33, sel_initWithAccount_inStore_termsEntries_, v26, v23, v17);

  return v31;
}

- (id)_sessionConfiguration
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB39F8], "defaultSessionConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0D00140]);
  objc_msgSend(v4, "setPairedDevice:", self->_proxiedDevice);
  objc_msgSend(v4, "setAnisetteDataProvider:", self->_anisetteDataProvider);
  objc_msgSend(v3, "set_appleIDContext:", v4);

  return v3;
}

- (id)_authContextForRenewCredentials
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0D002F8]);
  -[AAUIGenericTermsRemoteUI account](self, "account");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "username");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUsername:", v5);

  objc_msgSend(v3, "setIsUsernameEditable:", 0);
  -[AAUIGenericTermsRemoteUI originatingViewController](self, "originatingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", v6);

  objc_msgSend(v3, "setShouldOfferSecurityUpgrade:", 0);
  objc_msgSend(v3, "setServiceType:", 1);
  objc_msgSend(v3, "setProxiedDevice:", self->_proxiedDevice);
  objc_msgSend(v3, "setAppProvidedContext:", self->_appProvidedContext);
  objc_msgSend(v3, "setAuthenticationType:", 0);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("PASSWORD_REQUIRED_TITLE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("RENEW_FOR_TERMS_AND_CONDITIONS_MESSAGE"), &stru_1EA2E2A18, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[AAUIGenericTermsRemoteUI account](self, "account");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "username");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReason:", v14);

  return v3;
}

- (void)_addHeadersToRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "aa_addClientInfoHeaders");
  -[AAUIGenericTermsRemoteUI account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aa_addProxiedAuthHeaderWithAccount:", v5);

  objc_msgSend(v4, "aa_addAppProvidedContext:", self->_appProvidedContext);
  _AAUILogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "allHTTPHeaderFields");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1DB4ED000, v6, OS_LOG_TYPE_DEFAULT, "Proxied Terms Request Headers: %@", (uint8_t *)&v8, 0xCu);

  }
}

- (void)_agreeToTermsWithURLString:(id)a3 serverInfo:(id)a4 preferPassword:(BOOL)a5 completion:(id)a6
{
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  AKDevice *proxiedDevice;
  AKAnisetteServiceProtocol *anisetteDataProvider;
  id v20;
  _QWORD v21[5];
  id v22;

  v9 = a6;
  v10 = (objc_class *)MEMORY[0x1E0CFAD78];
  v11 = a4;
  v12 = a3;
  v13 = [v10 alloc];
  -[AAUIGenericTermsRemoteUI account](self, "account");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithURLString:account:", v12, v14);

  objc_msgSend(v15, "setPreferPassword:", 1);
  v16 = objc_alloc_init(MEMORY[0x1E0CB37A8]);
  -[AAUIProxiedTermsRemoteUI _addHeadersToRequest:](self, "_addHeadersToRequest:", v16);
  objc_msgSend(v16, "allHTTPHeaderFields");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setCustomHeaders:", v17);

  objc_msgSend(v15, "setServerInfo:", v11);
  proxiedDevice = self->_proxiedDevice;
  anisetteDataProvider = self->_anisetteDataProvider;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke;
  v21[3] = &unk_1EA2DCC18;
  v21[4] = self;
  v22 = v9;
  v20 = v9;
  objc_msgSend(v15, "performRequestForDevice:anisetteDataProvider:withHandler:", proxiedDevice, anisetteDataProvider, v21);

}

void __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  uint8_t v18[16];

  v6 = a3;
  v7 = a4;
  _AAUILogSystem();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_3((uint64_t)v6, (uint64_t)v7, v8);

  if ((unint64_t)(objc_msgSend(v6, "statusCode") - 200) > 0x63)
  {
    _AAUILogSystem();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v17)
        __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_2((uint64_t)v7, v16);
    }
    else if (v17)
    {
      __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_1(v16);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    _AAUILogSystem();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DB4ED000, v9, OS_LOG_TYPE_DEFAULT, "Successfully agreed to iCloud terms!", v18, 2u);
    }

    v10 = *(void **)(a1 + 32);
    v11 = v6;
    objc_msgSend(v11, "acceptedTermsInfo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_sendAcceptedTermsInfo:", v12);

    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "responseDictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("serverInfo"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 1, v15);

  }
}

- (void)_sendAcceptedTermsInfo:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "count"))
  {
    -[AAUIGenericTermsRemoteUI delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

    if ((v5 & 1) != 0)
    {
      -[AAUIGenericTermsRemoteUI delegate](self, "delegate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "genericTermsRemoteUI:acceptedTermsInfo:", self, v7);

    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_appProvidedContext, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
}

void __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_ERROR, "Error agreeing to iCloud terms!", v1, 2u);
}

void __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DB4ED000, a2, OS_LOG_TYPE_ERROR, "Error agreeing to iCloud terms: %@", (uint8_t *)&v2, 0xCu);
}

void __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_1DB4ED000, log, OS_LOG_TYPE_DEBUG, "AAiCloudTermsAgreeRequest response: %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

@end
