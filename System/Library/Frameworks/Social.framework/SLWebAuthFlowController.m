@implementation SLWebAuthFlowController

- (SLWebAuthFlowController)initWithWebClient:(id)a3
{
  id v5;
  SLWebAuthFlowController *v6;
  SLWebAuthFlowController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SLWebAuthFlowController;
  v6 = -[SLWebAuthFlowController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_webClient, a3);

  return v7;
}

- (id)initialRedirectURL
{
  return CFSTR("https://gil.apple.com/");
}

- (void)setAuthFlowCompletion:(id)a3
{
  void *v4;
  id completion;

  v4 = (void *)MEMORY[0x1C3B6C8B8](a3, a2);
  completion = self->_completion;
  self->_completion = v4;

}

- (id)authURLForUsername:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  -[SLWebAuthFlowController webClient](self, "webClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SLWebClient defaultScope](self->_webClient, "defaultScope");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)-[SLWebClient webAuthRequestClass](self->_webClient, "webAuthRequestClass");
  -[SLWebClient clientID](self->_webClient, "clientID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLWebClient clientRedirect](self->_webClient, "clientRedirect");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLWebClient authRequestURL](self->_webClient, "authRequestURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "urlForClientID:redirectURI:scope:username:authRequestURL:", v9, v10, v7, v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)requestForAuthURL:(id)a3
{
  SLWebClient *webClient;
  id v4;
  void *v5;
  void *v6;

  webClient = self->_webClient;
  v4 = a3;
  objc_msgSend((id)-[SLWebClient webAuthRequestClass](webClient, "webAuthRequestClass"), "requestForURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  return v6;
}

- (BOOL)shouldHideWebViewForLoadWithRequest:(id)a3
{
  uint64_t v3;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v28;
  SLWebAuthFlowController *v29;
  void *v30;
  id v31;
  id obj;
  NSString *obja;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)-[SLWebClient webAuthRequestClass](self->_webClient, "webAuthRequestClass");
  objc_msgSend(v6, "URL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "urlPageWillContainAuthorizationCode:", v8);

  if ((_DWORD)v7)
  {
    _SLLog(v3, 7, CFSTR("SLWebAuthFlowController shouldHideWebViewForLoadWithRequest: waiting for authentication code in page load url"));
    objc_storeStrong((id *)&self->_requestWithAuthorizationCode, a3);
    v9 = 1;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3998];
    objc_msgSend(v6, "URL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsWithURL:resolvingAgainstBaseURL:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(v12, "queryItems");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    v9 = v13 != 0;
    if (v13)
    {
      v14 = v13;
      v28 = v13 != 0;
      v29 = self;
      v30 = v12;
      v31 = v6;
      v15 = 0;
      v16 = 0;
      v17 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v35 != v17)
            objc_enumerationMutation(obj);
          v19 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v19, "name");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(CFSTR("account"), "isEqualToString:", v20);

          if (v21)
          {
            objc_msgSend(v19, "value");
            v22 = objc_claimAutoreleasedReturnValue();

            v15 = (void *)v22;
          }
          objc_msgSend(v19, "name");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(CFSTR("email"), "isEqualToString:", v23);

          if (v24)
          {
            objc_msgSend(v19, "value");
            v25 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v25;
          }
        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v14);

      v9 = 0;
      if (v16)
      {
        v12 = v30;
        v6 = v31;
        if (v15)
        {
          if (objc_msgSend(v15, "isEqualToString:", CFSTR("yahoo_japan")))
          {
            v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v16);
            obja = v29->_yahooJapanUserName;
            v29->_yahooJapanUserName = (NSString *)v26;
            v9 = v28;

          }
          else
          {
            v9 = 0;
          }
        }
      }
      else
      {
        v12 = v30;
        v6 = v31;
      }
    }
    else
    {
      v16 = 0;
      v15 = 0;

    }
  }

  return v9;
}

- (void)webViewDidFinishLoadWithPageTitleSupplier:(id)a3
{
  id v4;
  id v5;
  SLWebTokenHandlerController *v6;
  void *v7;
  void *v8;
  void *v9;
  void (*v10)(void);
  _QWORD v11[4];
  id v12;
  SLWebAuthFlowController *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_requestWithAuthorizationCode)
  {
    objc_msgSend((id)-[SLWebClient webAuthRequestClass](self->_webClient, "webAuthRequestClass"), "authCodeFromURLRequest:", self->_requestWithAuthorizationCode);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      v6 = -[SLWebTokenHandlerController initWithWebClient:]([SLWebTokenHandlerController alloc], "initWithWebClient:", self->_webClient);
      -[SLWebClient clientRedirect](self->_webClient, "clientRedirect");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __69__SLWebAuthFlowController_webViewDidFinishLoadWithPageTitleSupplier___block_invoke;
      v11[3] = &unk_1E7590E58;
      v5 = v5;
      v12 = v5;
      v13 = self;
      -[SLWebTokenHandlerController exchangeAuthCode:usingRedirect:codeVerifier:forTokensAndUsernameWithCompletion:](v6, "exchangeAuthCode:usingRedirect:codeVerifier:forTokensAndUsernameWithCompletion:", v5, v7, 0, v11);

LABEL_8:
      goto LABEL_9;
    }
    v10 = (void (*)(void))*((_QWORD *)self->_completion + 2);
LABEL_7:
    v10();
    goto LABEL_8;
  }
  if (self->_yahooJapanUserName)
  {
    v8 = (void *)MEMORY[0x1E0C99D80];
    v14[0] = self->_yahooJapanUserName;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithObject:forKey:", v9, CFSTR("usernames"));
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v10 = (void (*)(void))*((_QWORD *)self->_completion + 2);
    goto LABEL_7;
  }
LABEL_9:

}

void __69__SLWebAuthFlowController_webViewDidFinishLoadWithPageTitleSupplier___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8)
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
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

  v13 = a2;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SLWebAuthFlowController_webViewDidFinishLoadWithPageTitleSupplier___block_invoke_2;
  block[3] = &unk_1E7590E30;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v27 = *(id *)(a1 + 32);
  v28 = v16;
  v29 = *(_QWORD *)(a1 + 40);
  v30 = v17;
  v18 = v17;
  v19 = v16;
  v20 = v15;
  v21 = v14;
  v22 = v13;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __69__SLWebAuthFlowController_webViewDidFinishLoadWithPageTitleSupplier___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2 && (v3 = *(_QWORD *)(a1 + 40)) != 0 && (v4 = *(_QWORD *)(a1 + 48)) != 0)
  {
    v7[0] = CFSTR("authCode");
    v7[1] = CFSTR("token");
    v8[0] = *(_QWORD *)(a1 + 56);
    v8[1] = v2;
    v7[2] = CFSTR("refreshToken");
    v7[3] = CFSTR("usernames");
    v8[2] = v3;
    v8[3] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 64), "length"))
    {
      v6 = (void *)objc_msgSend(v5, "mutableCopy");
      objc_msgSend(v6, "setObject:forKey:", *(_QWORD *)(a1 + 64), CFSTR("displayName"));

      v5 = v6;
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 16) + 16))();

  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 16) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 16), 0, 0, *(_QWORD *)(a1 + 80));
  }
}

- (SLWebClient)webClient
{
  return (SLWebClient *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClient, 0);
  objc_storeStrong((id *)&self->_yahooJapanUserName, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_requestWithAuthorizationCode, 0);
}

@end
