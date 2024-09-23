@implementation DAEASOAuthFlowController

- (DAEASOAuthFlowController)initWithOAuthType:(unint64_t)a3 authURI:(id)a4 username:(id)a5 accountId:(id)a6 claims:(id)a7 isOnPrem:(BOOL)a8
{
  __CFString *v14;
  id v15;
  id v16;
  __CFString *v17;
  uint64_t v18;
  DAEASOAuthFlowController *v19;
  DAEASOAuthFlowController *v20;
  NSString *tokenRequestURI;
  uint64_t v22;
  NSString *clientID;
  id v24;
  uint64_t v25;
  NSString *state;
  DAEASOAuthPKCEChallenge *v27;
  DAEASOAuthPKCEChallenge *challenge;
  id v30;
  objc_super v31;

  v14 = (__CFString *)a4;
  v30 = a5;
  v15 = a6;
  v16 = a7;
  if (v14)
    v17 = v14;
  else
    v17 = CFSTR("https://login.microsoftonline.com/consumers/oauth2/v2.0/authorize/");
  if (!a8)
  {
    +[DAEASOAuthFlowController upgradeAuthorizationEndpoint:](DAEASOAuthFlowController, "upgradeAuthorizationEndpoint:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (__CFString *)v18;
  }
  v31.receiver = self;
  v31.super_class = (Class)DAEASOAuthFlowController;
  v19 = -[DAEASOAuthFlowController init](&v31, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_accountId, a6);
    v20->_oauthType = a3;
    objc_storeStrong((id *)&v20->_oauthURI, v17);
    objc_storeStrong((id *)&v20->_username, a5);
    tokenRequestURI = v20->_tokenRequestURI;
    v20->_tokenRequestURI = (NSString *)CFSTR("https://login.microsoftonline.com/consumers/oauth2/v2.0/token");

    +[DAEASOAuthClient clientIDForOAuthType:](DAEASOAuthClient, "clientIDForOAuthType:", -[DAEASOAuthFlowController oauthType](v20, "oauthType"));
    v22 = objc_claimAutoreleasedReturnValue();
    clientID = v20->_clientID;
    v20->_clientID = (NSString *)v22;

    v24 = objc_alloc_init(MEMORY[0x24BDD1880]);
    objc_msgSend(v24, "UUIDString");
    v25 = objc_claimAutoreleasedReturnValue();
    state = v20->_state;
    v20->_state = (NSString *)v25;

    v27 = -[DAEASOAuthPKCEChallenge initWithCodeChallengeMethod:]([DAEASOAuthPKCEChallenge alloc], "initWithCodeChallengeMethod:", 1);
    challenge = v20->_challenge;
    v20->_challenge = v27;

    objc_storeStrong((id *)&v20->_claimsChallenge, a7);
    v20->_isOnPrem = a8;
  }

  return v20;
}

- (id)initialRedirectURL
{
  return 0;
}

- (void)setAuthFlowCompletion:(id)a3
{
  void *v4;
  id completion;

  v4 = (void *)MEMORY[0x2207BAC80](a3, a2);
  completion = self->_completion;
  self->_completion = v4;

}

- (id)authURLForUsername:(id)a3
{
  return -[DAEASOAuthFlowController authURLForUsername:originalAuthURL:](self, "authURLForUsername:originalAuthURL:", a3, CFSTR("https://login.microsoftonline.com/consumers/oauth2/v2.0/authorize/"));
}

- (id)authURLForUsername:(id)a3 originalAuthURL:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;
  id v19;

  v19 = a4;
  v18 = a3;
  v6 = -[DAEASOAuthFlowController oauthType](self, "oauthType");
  -[DAEASOAuthFlowController easEndPoint](self, "easEndPoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DAEASOAuthClient defaultScopeForOAuthType:withResourceIdentifier:forToken:isOnPrem:](DAEASOAuthClient, "defaultScopeForOAuthType:withResourceIdentifier:forToken:isOnPrem:", v6, v7, 0, -[DAEASOAuthFlowController isOnPrem](self, "isOnPrem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[DAEASOAuthFlowController clientID](self, "clientID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthFlowController redirectURI](self, "redirectURI");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
  {
    +[DAEASOAuthClient clientRedirect](DAEASOAuthClient, "clientRedirect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[DAEASOAuthFlowController state](self, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthFlowController challenge](self, "challenge");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "codeChallenge");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthFlowController challenge](self, "challenge");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[DAEASOAuthRequest urlForOAuthURI:clientID:redirectURI:scope:username:state:codeChallenge:codeChallengeMethod:](DAEASOAuthRequest, "urlForOAuthURI:clientID:redirectURI:scope:username:state:codeChallenge:codeChallengeMethod:", v19, v9, v11, v8, v18, v12, v14, objc_msgSend(v15, "codeChallengeMethod"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  return v16;
}

- (id)onPremAuthURLForUsername:(id)a3 originalAuthURL:(id)a4 resource:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DAEASOAuthFlowController clientID](self, "clientID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthFlowController redirectURI](self, "redirectURI");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    +[DAEASOAuthClient clientRedirect](DAEASOAuthClient, "clientRedirect");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[DAEASOAuthFlowController state](self, "state");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthFlowController claimsChallenge](self, "claimsChallenge");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[DAEASOAuthRequest urlForOnPremOAuthURI:clientID:redirectURI:username:state:resource:claims:](DAEASOAuthRequest, "urlForOnPremOAuthURI:clientID:redirectURI:username:state:resource:claims:", v9, v11, v13, v10, v14, v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  return v16;
}

- (id)_accountDescription
{
  return CFSTR("Outlook");
}

- (id)requestForAuthURL:(id)a3
{
  void *v3;
  void *v4;

  +[DAEASOAuthRequest requestForURL:](DAEASOAuthRequest, "requestForURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  return v4;
}

- (BOOL)shouldHideWebViewForLoadWithRequest:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  uint64_t v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  os_log_type_t v25;
  void *v26;
  void *v28;
  _QWORD v29[4];
  id v30;
  DAEASOAuthFlowController *v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "URL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[DAEASOAuthRequest urlPageWillContainAuthorizationCode:](DAEASOAuthRequest, "urlPageWillContainAuthorizationCode:", v5);

  if (v6)
  {
    DALoggingwithCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BE2AD38];
    v9 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v7, v9))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EC86000, v7, v9, "DAEASOAuthFlowController shouldHideWebViewForLoadWithRequest: waiting for authentication code from page reload URL", buf, 2u);
    }

    +[DAEASOAuthRequest authCodeFromRequest:](DAEASOAuthRequest, "authCodeFromRequest:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[DAEASOAuthRequest stateFromRequest:](DAEASOAuthRequest, "stateFromRequest:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[DAEASOAuthRequest errorDomainFromRequest:](DAEASOAuthRequest, "errorDomainFromRequest:", v4);
    v12 = objc_claimAutoreleasedReturnValue();
    +[DAEASOAuthRequest errorDescriptionFromRequest:](DAEASOAuthRequest, "errorDescriptionFromRequest:", v4);
    v13 = objc_claimAutoreleasedReturnValue();
    if (v12 | v13)
    {
      DALoggingwithCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(_BYTE *)(v8 + 3);
      if (os_log_type_enabled(v14, v15))
      {
        *(_DWORD *)buf = 138412546;
        v33 = v12;
        v34 = 2112;
        v35 = v13;
        _os_log_impl(&dword_21EC86000, v14, v15, "Exchange Hotmail OAuth:Failed with error %@, error_description %@", buf, 0x16u);
      }

      v16 = objc_alloc(MEMORY[0x24BDD1540]);
      v17 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 93, 0);
      (*((void (**)(void))self->_completion + 2))();

    }
    else
    {
      v28 = v11;
      if (v10
        && (-[DAEASOAuthFlowController state](self, "state"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v19 = objc_msgSend(v11, "isEqualToString:", v18),
            v18,
            v19))
      {
        DALoggingwithCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, v9))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21EC86000, v20, v9, "Exchange Hotmail OAuth: Found an Auth Code String", buf, 2u);
        }

        -[DAEASOAuthFlowController challenge](self, "challenge");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "codeVerifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[DAEASOAuthFlowController claimsChallenge](self, "claimsChallenge");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = MEMORY[0x24BDAC760];
        v29[1] = 3221225472;
        v29[2] = __64__DAEASOAuthFlowController_shouldHideWebViewForLoadWithRequest___block_invoke;
        v29[3] = &unk_24E370510;
        v30 = v10;
        v31 = self;
        -[DAEASOAuthFlowController exchangeAuthCode:codeVerifier:claims:forTokensAndUsernameWithCompletion:](self, "exchangeAuthCode:codeVerifier:claims:forTokensAndUsernameWithCompletion:", v30, v22, v23, v29);

      }
      else
      {
        DALoggingwithCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = *(_BYTE *)(v8 + 3);
        if (os_log_type_enabled(v24, v25))
        {
          -[DAEASOAuthFlowController state](self, "state");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v33 = (uint64_t)v10;
          v34 = 2112;
          v35 = (uint64_t)v28;
          v36 = 2112;
          v37 = v26;
          _os_log_impl(&dword_21EC86000, v24, v25, "Exchange Hotmail OAuth:Failed with authCode %@, state %@ self.state %@", buf, 0x20u);

        }
        (*((void (**)(void))self->_completion + 2))();
      }
      v11 = v28;
    }

  }
  return v6;
}

void __64__DAEASOAuthFlowController_shouldHideWebViewForLoadWithRequest___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[4];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;

  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__DAEASOAuthFlowController_shouldHideWebViewForLoadWithRequest___block_invoke_2;
  block[3] = &unk_24E3704E8;
  v24 = v11;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v16 = *(id *)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  v28 = v16;
  v29 = v17;
  v30 = v15;
  v18 = v15;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  v22 = v11;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __64__DAEASOAuthFlowController_shouldHideWebViewForLoadWithRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  os_log_type_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _QWORD v20[10];
  _QWORD v21[11];

  v21[10] = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (v3 = *(_QWORD *)(a1 + 40)) != 0 && (v4 = *(_QWORD *)(a1 + 48)) != 0 && (v5 = *(_QWORD *)(a1 + 56)) != 0)
  {
    v20[0] = CFSTR("authCode");
    v20[1] = CFSTR("accessToken");
    v6 = *(void **)(a1 + 72);
    v21[0] = *(_QWORD *)(a1 + 64);
    v21[1] = v2;
    v20[2] = CFSTR("refreshToken");
    v20[3] = CFSTR("username");
    v21[2] = v3;
    v21[3] = v4;
    v21[4] = v5;
    v20[4] = CFSTR("displayName");
    v20[5] = CFSTR("oauthURI");
    objc_msgSend(v6, "oauthURI");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21[5] = v7;
    v20[6] = CFSTR("tokenRequestURI");
    objc_msgSend(*(id *)(a1 + 72), "tokenRequestURI");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21[6] = v8;
    v20[7] = CFSTR("jwksURI");
    objc_msgSend(*(id *)(a1 + 72), "jwksURI");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21[7] = v9;
    v20[8] = CFSTR("issuer");
    objc_msgSend(*(id *)(a1 + 72), "issuer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v21[8] = v10;
    v20[9] = CFSTR("jwksData");
    objc_msgSend(*(id *)(a1 + 72), "jwksData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[9] = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
    if (os_log_type_enabled(v13, v14))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_21EC86000, v13, v14, "Exchange Hotmail OAuth:Completed Fetching Tokens", (uint8_t *)&v18, 2u);
    }

    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 16))();
  }
  else
  {
    DALoggingwithCategory();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v15, v16))
    {
      v17 = *(_QWORD *)(a1 + 80);
      v18 = 138543362;
      v19 = v17;
      _os_log_impl(&dword_21EC86000, v15, v16, "Exchange Hotmail OAuth:Completed Fetching Tokens With Error %{public}@", (uint8_t *)&v18, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 16))();
  }
}

- (id)_urlRequestForOAuthTokenFromAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[DAEASOAuthFlowController redirectURI](self, "redirectURI");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    +[DAEASOAuthClient clientRedirect](DAEASOAuthClient, "clientRedirect");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  v15 = -[DAEASOAuthFlowController oauthType](self, "oauthType");
  -[DAEASOAuthFlowController easEndPoint](self, "easEndPoint");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[DAEASOAuthClient defaultScopeForOAuthType:withResourceIdentifier:isOnPrem:](DAEASOAuthClient, "defaultScopeForOAuthType:withResourceIdentifier:isOnPrem:", v15, v16, -[DAEASOAuthFlowController isOnPrem](self, "isOnPrem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[DAEASOAuthFlowController tokenRequestURI](self, "tokenRequestURI");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthFlowController clientID](self, "clientID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[DAEASOAuthTokenRequest urlRequestForTokenRequestURI:clientID:redirectURI:authCode:scope:codeVerifier:claims:](DAEASOAuthTokenRequest, "urlRequestForTokenRequestURI:clientID:redirectURI:authCode:scope:codeVerifier:claims:", v18, v19, v14, v10, v17, v9, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 forTokensAndUsernameWithCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  id v30;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[DAEASOAuthFlowController oauthURI](self, "oauthURI");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if (-[DAEASOAuthFlowController isOnPrem](self, "isOnPrem"))
    {
      v15 = (void *)MEMORY[0x24BDBCF48];
      -[DAEASOAuthFlowController oauthURI](self, "oauthURI");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLWithString:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v17, "URLByDeletingLastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "URLByAppendingPathComponent:", CFSTR("token"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v19, "absoluteString");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAEASOAuthFlowController setTokenRequestURI:](self, "setTokenRequestURI:", v20);

      -[DAEASOAuthFlowController _exchangeAuthCode:codeVerifier:claims:forTokensAndUsernameWithCompletion:](self, "_exchangeAuthCode:codeVerifier:claims:forTokensAndUsernameWithCompletion:", v10, v11, v12, v13);
    }
    else
    {
      -[DAEASOAuthFlowController oauthURI](self, "oauthURI");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __100__DAEASOAuthFlowController_exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke;
      v26[3] = &unk_24E370560;
      v26[4] = self;
      v30 = v13;
      v27 = v10;
      v28 = v11;
      v29 = v12;
      -[DAEASOAuthFlowController retrieveOpenIDMetadataFromURI:withCompletion:](self, "retrieveOpenIDMetadataFromURI:withCompletion:", v25, v26);

    }
  }
  else
  {
    DALoggingwithCategory();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = *(unsigned __int8 *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v21, *(os_log_type_t *)(MEMORY[0x24BE2AD38] + 3)))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21EC86000, v21, (os_log_type_t)v22, "Cannot exchange auth code for tokens. self.oauthURI is nil.", buf, 2u);
    }

    v23 = objc_alloc(MEMORY[0x24BDD1540]);
    v24 = (void *)objc_msgSend(v23, "initWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 93, 0);
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, _QWORD, void *))v13 + 2))(v13, 0, 0, 0, 0, v24);

  }
}

void __100__DAEASOAuthFlowController_exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint8_t buf[16];

  v9 = a3;
  v10 = a4;
  if (a5)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setTokenRequestURI:", a2);
    objc_msgSend(*(id *)(a1 + 32), "setJwksURI:", v9);
    objc_msgSend(*(id *)(a1 + 32), "setIssuer:", v10);
    if (v9)
    {
      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __100__DAEASOAuthFlowController_exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke_34;
      v16[3] = &unk_24E370538;
      v11 = *(void **)(a1 + 40);
      v17 = *(id *)(a1 + 32);
      v18 = v11;
      v19 = *(id *)(a1 + 48);
      v20 = *(id *)(a1 + 56);
      v21 = *(id *)(a1 + 64);
      objc_msgSend(v17, "retrieveJWKSDataFromURI:withCompletion:", v9, v16);

    }
    else
    {
      DALoggingwithCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
      if (os_log_type_enabled(v12, v13))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21EC86000, v12, v13, "Cannot exchange auth code for tokens. jwksURI is nil.", buf, 2u);
      }

      v14 = objc_alloc(MEMORY[0x24BDD1540]);
      v15 = (void *)objc_msgSend(v14, "initWithDomain:code:userInfo:", *MEMORY[0x24BE2AC98], 93, 0);
      (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

    }
  }

}

uint64_t __100__DAEASOAuthFlowController_exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke_34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 32), "setJwksData:", a2);
  return objc_msgSend(*(id *)(a1 + 32), "_exchangeAuthCode:codeVerifier:claims:forTokensAndUsernameWithCompletion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

- (void)retrieveOpenIDMetadataFromURI:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  DAEASOAuthFlowController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__DAEASOAuthFlowController_retrieveOpenIDMetadataFromURI_withCompletion___block_invoke;
  block[3] = &unk_24E3705B0;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __73__DAEASOAuthFlowController_retrieveOpenIDMetadataFromURI_withCompletion___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, void *, void *);
  void *v10;
  id v11;
  id v12;

  +[DAEASOpenIDMetadataRequest openIDrequestURLFor:](DAEASOpenIDMetadataRequest, "openIDrequestURLFor:", a1[4]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "_setNonAppInitiated:", 1);
  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_assignConnectionPropertiesToSessionConfiguration:", v4);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x24BDAC760];
  v8 = 3221225472;
  v9 = __73__DAEASOAuthFlowController_retrieveOpenIDMetadataFromURI_withCompletion___block_invoke_2;
  v10 = &unk_24E370588;
  v12 = a1[6];
  v11 = a1[4];
  objc_msgSend(v5, "dataTaskWithRequest:completionHandler:", v3, &v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resume", v7, v8, v9, v10);

}

void __73__DAEASOAuthFlowController_retrieveOpenIDMetadataFromURI_withCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  DAEASOpenIDMetadataResponse *v10;
  void *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = -[DAEASOpenIDMetadataResponse initWithData:urlResponse:error:]([DAEASOpenIDMetadataResponse alloc], "initWithData:urlResponse:error:", v9, v8, v7);

  -[DAEASOpenIDMetadataResponse error](v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_2;
  -[DAEASOpenIDMetadataResponse tokenRequestURI](v10, "tokenRequestURI");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_3;
  v11 = (void *)v17;
  -[DAEASOpenIDMetadataResponse jwksURI](v10, "jwksURI");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
LABEL_2:

  }
  else
  {
    v19 = (void *)v18;
    -[DAEASOpenIDMetadataResponse issuer](v10, "issuer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = *(_QWORD *)(a1 + 40);
      -[DAEASOpenIDMetadataResponse tokenRequestURI](v10, "tokenRequestURI");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAEASOpenIDMetadataResponse jwksURI](v10, "jwksURI");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[DAEASOpenIDMetadataResponse issuer](v10, "issuer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, void *, _QWORD))(v21 + 16))(v21, v16, v22, v23, 0);

      goto LABEL_6;
    }
  }
LABEL_3:
  DALoggingwithCategory();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
  if (os_log_type_enabled(v12, v13))
  {
    v14 = *(_QWORD *)(a1 + 32);
    v24 = 138412546;
    v25 = v14;
    v26 = 2112;
    v27 = v7;
    _os_log_impl(&dword_21EC86000, v12, v13, "DAEASOAuthFlowController couldn't retrieve OpenID metadata from URI: %@ Error: %@", (uint8_t *)&v24, 0x16u);
  }

  v15 = *(_QWORD *)(a1 + 40);
  -[DAEASOpenIDMetadataResponse error](v10, "error");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v15 + 16))(v15, 0, 0, 0, v16);
LABEL_6:

}

- (void)retrieveJWKSDataFromURI:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  DAEASOAuthFlowController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__DAEASOAuthFlowController_retrieveJWKSDataFromURI_withCompletion___block_invoke;
  block[3] = &unk_24E3705B0;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __67__DAEASOAuthFlowController_retrieveJWKSDataFromURI_withCompletion___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t, void *);
  void *v11;
  id v12;
  id v13;

  v2 = objc_alloc(MEMORY[0x24BDD16B0]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", a1[4]);
  v4 = (void *)objc_msgSend(v2, "initWithURL:", v3);

  objc_msgSend(v4, "_setNonAppInitiated:", 1);
  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "_assignConnectionPropertiesToSessionConfiguration:", v5);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __67__DAEASOAuthFlowController_retrieveJWKSDataFromURI_withCompletion___block_invoke_2;
  v11 = &unk_24E370588;
  v13 = a1[6];
  v12 = a1[4];
  objc_msgSend(v6, "dataTaskWithRequest:completionHandler:", v4, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume", v8, v9, v10, v11);

}

void __67__DAEASOAuthFlowController_retrieveJWKSDataFromURI_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  if (!a2 || v6)
  {
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      v11 = *(_QWORD *)(a1 + 32);
      v12 = 138412546;
      v13 = v11;
      v14 = 2112;
      v15 = v7;
      _os_log_impl(&dword_21EC86000, v9, v10, "DAEASOAuthFlowController couldn't retrieve JWKS data from URI: %@ Error: %@", (uint8_t *)&v12, 0x16u);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v8();

}

- (void)_exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 forTokensAndUsernameWithCompletion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __101__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke;
  v12[3] = &unk_24E3705D8;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[DAEASOAuthFlowController _exchangeAuthCode:codeVerifier:claims:forTokensWithCompletion:](self, "_exchangeAuthCode:codeVerifier:claims:forTokensWithCompletion:", a3, a4, a5, v12);

}

void __101__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensAndUsernameWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  void *v16;
  uint8_t v17[16];

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  DALoggingwithCategory();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v13, v14))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_21EC86000, v13, v14, "EAS OAuth: Received Tokens", v17, 2u);
  }

  v15 = *(_QWORD *)(a1 + 40);
  if (v9 && v10)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accountDescription");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, id, id, void *, _QWORD))(v15 + 16))(v15, v9, v10, v11, v16, 0);

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, id))(v15 + 16))(*(_QWORD *)(a1 + 40), 0, 0, 0, 0, v12);
  }

}

- (void)_exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 forTokensWithCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_get_global_queue(25, 0);
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __90__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensWithCompletion___block_invoke;
  block[3] = &unk_24E370628;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

void __90__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *, void *, void *);
  void *v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_urlRequestForOAuthTokenFromAuthCode:codeVerifier:claims:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "_setNonAppInitiated:", 1);
  DALoggingwithCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_BYTE *)(MEMORY[0x24BE2AD38] + 7);
  if (os_log_type_enabled(v4, v5))
  {
    objc_msgSend(v3, "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(v3, "HTTPBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithData:encoding:", v8, 4);
    *(_DWORD *)buf = 138412546;
    v20 = v6;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_21EC86000, v4, v5, "DAEASOAuthFlowController: Sending request: %@ %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1858], "ephemeralSessionConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_assignConnectionPropertiesToSessionConfiguration:", v10);
  objc_msgSend(MEMORY[0x24BDD1850], "sessionWithConfiguration:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __90__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensWithCompletion___block_invoke_47;
  v16 = &unk_24E370600;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(id *)(a1 + 64);
  objc_msgSend(v11, "dataTaskWithRequest:completionHandler:", v3, &v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume", v13, v14, v15, v16, v17);

}

void __90__DAEASOAuthFlowController__exchangeAuthCode_codeVerifier_claims_forTokensWithCompletion___block_invoke_47(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  DAEASOAuthTokenResponse *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  DAEASOAuthJWTValidator *v21;
  void *v22;
  DAEASOAuthJWTValidator *v23;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void **v38;
  uint64_t *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a3;
  v9 = a2;
  v10 = -[DAEASOAuthTokenResponse initWithData:urlResponse:error:]([DAEASOAuthTokenResponse alloc], "initWithData:urlResponse:error:", v9, v8, v7);

  -[DAEASOAuthTokenResponse error](v10, "error");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {

LABEL_3:
    v12 = *(_QWORD *)(a1 + 40);
    -[DAEASOAuthTokenResponse error](v10, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, void *))(v12 + 16))(v12, 0, 0, 0, v13);
LABEL_16:

    goto LABEL_17;
  }
  -[DAEASOAuthTokenResponse idToken](v10, "idToken");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_3;
  -[DAEASOAuthTokenResponse user_id](v10, "user_id");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *(void **)(a1 + 32);
  if (v15)
  {
    objc_msgSend(v16, "setUsername:", v15);
  }
  else
  {
    objc_msgSend(v16, "username");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setUsername:", v17);

  }
  if (-[DAEASOAuthTokenResponse statusCode](v10, "statusCode") != 200
    || (-[DAEASOAuthTokenResponse accessToken](v10, "accessToken"), (v18 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v19 = (void *)v18,
        -[DAEASOAuthTokenResponse refreshToken](v10, "refreshToken"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v19,
        !v20))
  {
    v32 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[DAEASOAuthTokenResponse statusCode](v10, "statusCode"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEASOAuthTokenResponse errorMessage](v10, "errorMessage");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringWithFormat:", CFSTR("Server failed to exchange auth code for tokens, with status code %@ and error message %@"), v33, v34);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDB4200];
    v42 = *MEMORY[0x24BDD0FC8];
    v43 = v13;
    v37 = (void *)MEMORY[0x24BDBCE70];
    v38 = &v43;
    v39 = &v42;
LABEL_15:
    objc_msgSend(v37, "dictionaryWithObjects:forKeys:count:", v38, v39, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 1, v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_16;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isOnPrem") & 1) == 0)
  {
    v21 = [DAEASOAuthJWTValidator alloc];
    -[DAEASOAuthTokenResponse idToken](v10, "idToken");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[DAEASOAuthJWTValidator initWithIdToken:](v21, "initWithIdToken:", v22);

    objc_msgSend(*(id *)(a1 + 32), "jwksData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "clientID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "issuer");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[DAEASOAuthJWTValidator idTokenValidWithJWKS:withAudience:withIssuer:](v23, "idTokenValidWithJWKS:withAudience:withIssuer:", v24, v25, v26);

    if (!v27)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Could not validate the id_token received from the server"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (void *)MEMORY[0x24BDD1540];
      v36 = *MEMORY[0x24BDB4200];
      v44 = *MEMORY[0x24BDD0FC8];
      v45[0] = v13;
      v37 = (void *)MEMORY[0x24BDBCE70];
      v38 = (void **)v45;
      v39 = &v44;
      goto LABEL_15;
    }
  }
  v28 = *(_QWORD *)(a1 + 40);
  -[DAEASOAuthTokenResponse accessToken](v10, "accessToken");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[DAEASOAuthTokenResponse refreshToken](v10, "refreshToken");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "username");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, void *, void *, _QWORD))(v28 + 16))(v28, v29, v30, v31, 0);

LABEL_17:
}

- (void)_assignConnectionPropertiesToSessionConfiguration:(id)a3
{
  NSString *accountId;
  id v4;

  accountId = self->_accountId;
  v4 = a3;
  objc_msgSend(v4, "set_sourceApplicationSecondaryIdentifier:", accountId);
  objc_msgSend(v4, "set_sourceApplicationBundleIdentifier:", *MEMORY[0x24BE2FD18]);

}

+ (id)upgradeAuthorizationEndpoint:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "host"), (v6 = objc_claimAutoreleasedReturnValue()) != 0)
    && (v7 = (void *)v6,
        objc_msgSend(v5, "path"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    objc_msgSend(v5, "lastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByDeletingLastPathComponent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "caseInsensitiveCompare:", CFSTR("v2.0"));

    if (v12)
    {
      objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("v2.0"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "URLByAppendingPathComponent:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "absoluteString");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = v3;
    }
    v15 = v14;

    v5 = v10;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)upgradeTokenEndpoint:(id)a3
{
  return +[DAEASOAuthFlowController upgradeAuthorizationEndpoint:](DAEASOAuthFlowController, "upgradeAuthorizationEndpoint:", a3);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (DAEASOAuthPKCEChallenge)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_challenge, a3);
}

- (NSString)redirectURI
{
  return self->_redirectURI;
}

- (void)setRedirectURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (unint64_t)oauthType
{
  return self->_oauthType;
}

- (void)setOauthType:(unint64_t)a3
{
  self->_oauthType = a3;
}

- (NSString)accountId
{
  return self->_accountId;
}

- (void)setAccountId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)oauthURI
{
  return self->_oauthURI;
}

- (void)setOauthURI:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)tokenRequestURI
{
  return self->_tokenRequestURI;
}

- (void)setTokenRequestURI:(id)a3
{
  objc_storeStrong((id *)&self->_tokenRequestURI, a3);
}

- (NSString)jwksURI
{
  return self->_jwksURI;
}

- (void)setJwksURI:(id)a3
{
  objc_storeStrong((id *)&self->_jwksURI, a3);
}

- (NSData)jwksData
{
  return self->_jwksData;
}

- (void)setJwksData:(id)a3
{
  objc_storeStrong((id *)&self->_jwksData, a3);
}

- (NSString)issuer
{
  return self->_issuer;
}

- (void)setIssuer:(id)a3
{
  objc_storeStrong((id *)&self->_issuer, a3);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)easEndPoint
{
  return self->_easEndPoint;
}

- (void)setEasEndPoint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)claimsChallenge
{
  return self->_claimsChallenge;
}

- (void)setClaimsChallenge:(id)a3
{
  objc_storeStrong((id *)&self->_claimsChallenge, a3);
}

- (BOOL)isOnPrem
{
  return self->_isOnPrem;
}

- (void)setIsOnPrem:(BOOL)a3
{
  self->_isOnPrem = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_claimsChallenge, 0);
  objc_storeStrong((id *)&self->_easEndPoint, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_issuer, 0);
  objc_storeStrong((id *)&self->_jwksData, 0);
  objc_storeStrong((id *)&self->_jwksURI, 0);
  objc_storeStrong((id *)&self->_tokenRequestURI, 0);
  objc_storeStrong((id *)&self->_oauthURI, 0);
  objc_storeStrong((id *)&self->_accountId, 0);
  objc_storeStrong((id *)&self->_redirectURI, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end
