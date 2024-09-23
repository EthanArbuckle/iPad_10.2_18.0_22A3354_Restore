@implementation DAExchangeOAuthFlowController

- (DAExchangeOAuthFlowController)initWithAuthURI:(id)a3 easEndPoint:(id)a4 username:(id)a5 accountId:(id)a6 claims:(id)a7 isOnPrem:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  DAExchangeOAuthFlowController *v15;
  DAExchangeOAuthFlowController *v16;
  void *v17;
  objc_super v19;

  v8 = a8;
  v14 = a4;
  v19.receiver = self;
  v19.super_class = (Class)DAExchangeOAuthFlowController;
  v15 = -[DAEASOAuthFlowController initWithOAuthType:authURI:username:accountId:claims:isOnPrem:](&v19, sel_initWithOAuthType_authURI_username_accountId_claims_isOnPrem_, 1, a3, a5, a6, a7, v8);
  v16 = v15;
  if (v15)
  {
    -[DAEASOAuthFlowController setEasEndPoint:](v15, "setEasEndPoint:", v14);
    +[DAEASOAuthClient clientIDForOAuthType:](DAEASOAuthClient, "clientIDForOAuthType:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEASOAuthFlowController setClientID:](v16, "setClientID:", v17);

  }
  return v16;
}

- (id)initialRedirectURL
{
  return 0;
}

- (id)_accountDescription
{
  return CFSTR("Exchange");
}

- (void)exchangeAuthCode:(id)a3 codeVerifier:(id)a4 claims:(id)a5 withCompletion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __85__DAExchangeOAuthFlowController_exchangeAuthCode_codeVerifier_claims_withCompletion___block_invoke;
  v12[3] = &unk_24E370650;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[DAEASOAuthFlowController exchangeAuthCode:codeVerifier:claims:forTokensAndUsernameWithCompletion:](self, "exchangeAuthCode:codeVerifier:claims:forTokensAndUsernameWithCompletion:", a3, a4, a5, v12);

}

void __85__DAExchangeOAuthFlowController_exchangeAuthCode_codeVerifier_claims_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  DAEASOAuthIdentity *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a2;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v18 && v9)
  {
    v12 = objc_alloc_init(DAEASOAuthIdentity);
    -[DAEASOAuthIdentity setAccessToken:](v12, "setAccessToken:", v18);
    -[DAEASOAuthIdentity setRefreshToken:](v12, "setRefreshToken:", v9);
    -[DAEASOAuthIdentity setUsername:](v12, "setUsername:", v10);
    -[DAEASOAuthIdentity setDisplayName:](v12, "setDisplayName:", v11);
    objc_msgSend(*(id *)(a1 + 32), "oauthURI");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEASOAuthIdentity setOauthURI:](v12, "setOauthURI:", v13);

    objc_msgSend(*(id *)(a1 + 32), "tokenRequestURI");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEASOAuthIdentity setTokenRequestURI:](v12, "setTokenRequestURI:", v14);

    objc_msgSend(*(id *)(a1 + 32), "jwksData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEASOAuthIdentity setJwksData:](v12, "setJwksData:", v15);

    objc_msgSend(*(id *)(a1 + 32), "jwksURI");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEASOAuthIdentity setJwksURI:](v12, "setJwksURI:", v16);

    objc_msgSend(*(id *)(a1 + 32), "issuer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DAEASOAuthIdentity setIssuer:](v12, "setIssuer:", v17);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

@end
