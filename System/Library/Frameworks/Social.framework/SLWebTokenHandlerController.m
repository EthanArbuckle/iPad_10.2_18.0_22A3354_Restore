@implementation SLWebTokenHandlerController

- (SLWebTokenHandlerController)initWithWebClient:(id)a3
{
  id v5;
  SLWebTokenHandlerController *v6;
  SLWebTokenHandlerController *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *webClientQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SLWebTokenHandlerController;
  v6 = -[SLWebTokenHandlerController init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webClient, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create("com.apple.social.exchangeAuthTokenQueue", v8);
    webClientQueue = v7->_webClientQueue;
    v7->_webClientQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (void)exchangeAuthCode:(id)a3 usingRedirect:(id)a4 codeVerifier:(id)a5 forTokensAndUsernameWithCompletion:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __110__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forTokensAndUsernameWithCompletion___block_invoke;
  v12[3] = &unk_1E75902F0;
  v13 = v10;
  v11 = v10;
  -[SLWebTokenHandlerController exchangeAuthCode:usingRedirect:codeVerifier:forAccountResponse:](self, "exchangeAuthCode:usingRedirect:codeVerifier:forAccountResponse:", a3, a4, a5, v12);

}

void __110__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forTokensAndUsernameWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "token");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "refreshToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "idToken");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "expiryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "usernames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  (*(void (**)(uint64_t, id, void *, void *, void *, void *, void *, id))(v4 + 16))(v4, v12, v7, v8, v9, v10, v11, v5);
}

- (void)exchangeAuthCode:(id)a3 usingRedirect:(id)a4 codeVerifier:(id)a5 forAccountResponse:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __94__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forAccountResponse___block_invoke;
  v12[3] = &unk_1E7590340;
  v12[4] = self;
  v13 = v10;
  v11 = v10;
  -[SLWebTokenHandlerController _exchangeAuthCode:usingRedirect:codeVerifier:forTokensWithCompletion:](self, "_exchangeAuthCode:usingRedirect:codeVerifier:forTokensWithCompletion:", a3, a4, a5, v12);

}

void __94__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forAccountResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __94__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forAccountResponse___block_invoke_2;
    v5[3] = &unk_1E7590318;
    v4 = *(void **)(a1 + 32);
    v7 = *(id *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v4, "_fetchNamesForAuthResponse:completion:", v6, v5);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __94__SLWebTokenHandlerController_exchangeAuthCode_usingRedirect_codeVerifier_forAccountResponse___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  uint64_t v8;
  id v9;
  SLWebTokenHandlerResponse *v10;
  void (*v11)(uint64_t, _QWORD, SLWebTokenHandlerResponse *);
  id v12;

  v12 = a2;
  v7 = a3;
  v8 = *(_QWORD *)(a1 + 40);
  if (v12)
  {
    v9 = a4;
    v10 = -[SLWebTokenHandlerResponse initWithTokenResponse:usernames:displayname:]([SLWebTokenHandlerResponse alloc], "initWithTokenResponse:usernames:displayname:", *(_QWORD *)(a1 + 32), v12, v7);
    (*(void (**)(uint64_t, SLWebTokenHandlerResponse *, id))(v8 + 16))(v8, v10, v9);

  }
  else
  {
    v11 = *(void (**)(uint64_t, _QWORD, SLWebTokenHandlerResponse *))(v8 + 16);
    v10 = a4;
    v11(v8, 0, v10);
  }

}

- (void)_exchangeAuthCode:(id)a3 usingRedirect:(id)a4 codeVerifier:(id)a5 forTokensWithCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *webClientQueue;
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
  webClientQueue = self->_webClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__SLWebTokenHandlerController__exchangeAuthCode_usingRedirect_codeVerifier_forTokensWithCompletion___block_invoke;
  block[3] = &unk_1E7590390;
  block[4] = self;
  v20 = v11;
  v21 = v10;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  v18 = v11;
  dispatch_async(webClientQueue, block);

}

void __100__SLWebTokenHandlerController__exchangeAuthCode_usingRedirect_codeVerifier_forTokensWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *, void *);
  void *v17;
  uint64_t v18;
  id v19;

  v3 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "tokenRequestClass");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "clientRedirect");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "tokenURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "urlRequestForClientID:secret:redirectURI:authCode:tokenURL:codeVerifier:", v4, v5, v7, v8, v9, *(_QWORD *)(a1 + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  _SLLog(v1, 7, CFSTR("Sending SLWebOAuth2TokenRequest"));
  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __100__SLWebTokenHandlerController__exchangeAuthCode_usingRedirect_codeVerifier_forTokensWithCompletion___block_invoke_2;
  v17 = &unk_1E7590368;
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(id *)(a1 + 64);
  objc_msgSend(v12, "dataTaskWithRequest:completionHandler:", v10, &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "resume", v14, v15, v16, v17, v18);

}

void __100__SLWebTokenHandlerController__exchangeAuthCode_usingRedirect_codeVerifier_forTokensWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v8 = a4;
  v9 = a3;
  v10 = a2;
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "tokenResponseClass")), "initWithData:urlResponse:error:", v10, v9, v8);

  objc_msgSend(v11, "error");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v11, "error");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v13 + 16))(v13, 0, v14);
LABEL_8:

    goto LABEL_9;
  }
  if (objc_msgSend(v11, "statusCode") != 200
    || (objc_msgSend(v11, "token"), (v15 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v16 = (void *)v15,
        objc_msgSend(v11, "refreshToken"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v17,
        v16,
        !v17))
  {
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "statusCode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("Server failed to exchange auth code for tokens, with status code %@ and error message %@"), v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0C8F1D0];
    v25 = *MEMORY[0x1E0CB2D50];
    v26[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 1, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_8;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_9:

}

+ (id)emailAddressFromIdToken:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") == 3)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stringByPaddingToLength:withString:startingAtIndex:", (objc_msgSend(v7, "length") & 3) + objc_msgSend(v7, "length"), CFSTR("="), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      if (v9)
      {
        v15 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v9, 0, &v15);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v15;
        v12 = v11;
        if (!v10 || v11)
        {
          _SLLog(v3, 3, CFSTR("error decoding id token: %@"));
          v13 = 0;
        }
        else
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("email"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        _SLLog(v3, 3, CFSTR("error decoding base64 data ,got back nil: %{private}@"));
        v13 = 0;
      }

    }
    else
    {
      objc_msgSend(v6, "count");
      _SLLog(v3, 3, CFSTR("id token has unexpected number of components: %d"));
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_fetchNamesForAuthResponse:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *webClientQueue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  SLWebTokenHandlerController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  webClientQueue = self->_webClientQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__SLWebTokenHandlerController__fetchNamesForAuthResponse_completion___block_invoke;
  block[3] = &unk_1E75903E0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(webClientQueue, block);

}

void __69__SLWebTokenHandlerController__fetchNamesForAuthResponse_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v3 = (void *)MEMORY[0x1E0CB39E0];
  objc_msgSend(*(id *)(a1 + 32), "token");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "userInfoURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sl_urlRequestWithToken:forURLString:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "userInfoURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v1, 7, CFSTR("Sending SLWebUserInfoRequest to %@"));

  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__SLWebTokenHandlerController__fetchNamesForAuthResponse_completion___block_invoke_2;
  v12[3] = &unk_1E75903B8;
  v9 = *(void **)(a1 + 48);
  v12[4] = *(_QWORD *)(a1 + 40);
  v14 = v9;
  v13 = *(id *)(a1 + 32);
  objc_msgSend(v8, "dataTaskWithRequest:completionHandler:", v6, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "resume");

}

void __69__SLWebTokenHandlerController__fetchNamesForAuthResponse_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "webUserInfoResponseClass")), "initWithData:urlResponse:error:", v11, v10, v9);

  objc_msgSend(v12, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (objc_msgSend(v12, "statusCode") == 200)
    {
      objc_msgSend(v12, "emailAddresses");
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = (void *)v16;
        objc_msgSend(v12, "emailAddresses");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19)
        {
          v20 = *(_QWORD *)(a1 + 48);
          objc_msgSend(v12, "emailAddresses");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "displayName");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          (*(void (**)(uint64_t, void *, void *, _QWORD))(v20 + 16))(v20, v15, v21, 0);

          goto LABEL_13;
        }
      }
    }
    _SLLog(v4, 3, CFSTR("Problem occurred with user info request. Extracting email address from id token."));
    objc_msgSend(*(id *)(a1 + 40), "idToken");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SLWebTokenHandlerController emailAddressFromIdToken:](SLWebTokenHandlerController, "emailAddressFromIdToken:", v22);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v23 = *(_QWORD *)(a1 + 48);
      v37[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, _QWORD))(v23 + 16))(v23, v24, v25, 0);
    }
    else
    {
      _SLLog(v4, 3, CFSTR("Could not extract email address from id token."));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "fallbackUserInfoURL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        _SLLog(v4, 3, CFSTR("Trying fallbackUserInfoURL."));
        v26 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(a1 + 40), "token");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "_fetchNamesForToken:usingFallbackURL:completion:", v27, v24, *(_QWORD *)(a1 + 48));

        goto LABEL_12;
      }
      _SLLog(v4, 3, CFSTR("No fallbackUserInfoURL. Fetch names failed."));
      v28 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "statusCode"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorMessage");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "stringWithFormat:", CFSTR("Server failed to return user info emailAddresses, with status code %@ and error message %@"), v29, v30);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v31 = (void *)MEMORY[0x1E0CB35C8];
      v32 = *MEMORY[0x1E0C8F1D0];
      v35 = *MEMORY[0x1E0CB2D50];
      v36 = v25;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 1, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    }

LABEL_12:
    goto LABEL_13;
  }
  v14 = *(_QWORD *)(a1 + 48);
  objc_msgSend(v12, "error");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, v15);
LABEL_13:

}

- (void)_fetchNamesForToken:(id)a3 usingFallbackURL:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *webClientQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  SLWebTokenHandlerController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  webClientQueue = self->_webClientQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __79__SLWebTokenHandlerController__fetchNamesForToken_usingFallbackURL_completion___block_invoke;
  v15[3] = &unk_1E7590408;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(webClientQueue, v15);

}

void __79__SLWebTokenHandlerController__fetchNamesForToken_usingFallbackURL_completion___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *, void *);
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(MEMORY[0x1E0CB39E0], "sl_urlRequestWithToken:forURLString:", a1[4], a1[5]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _SLLog(v1, 7, CFSTR("Fallback: Sending SLWebUserInfoRequest"));
  objc_msgSend(MEMORY[0x1E0CB39F8], "ephemeralSessionConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB39F0], "sessionWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __79__SLWebTokenHandlerController__fetchNamesForToken_usingFallbackURL_completion___block_invoke_2;
  v11 = &unk_1E7590368;
  v6 = (void *)a1[7];
  v12 = a1[6];
  v13 = v6;
  objc_msgSend(v5, "dataTaskWithRequest:completionHandler:", v3, &v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resume", v8, v9, v10, v11, v12);

}

void __79__SLWebTokenHandlerController__fetchNamesForToken_usingFallbackURL_completion___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v4;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v9 = a4;
  v10 = a3;
  v11 = a2;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v8, "fallbackWebUserInfoResponseClass")), "initWithData:urlResponse:error:", v11, v10, v9);

  objc_msgSend(v12, "error");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v14 + 16))(v14, 0, 0, v15);
  }
  else
  {
    if (objc_msgSend(v12, "statusCode") != 200)
      goto LABEL_7;
    objc_msgSend(v12, "emailAddresses");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!v16)
      goto LABEL_7;
    v17 = (void *)v16;
    objc_msgSend(v12, "emailAddresses");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "count");

    if (v19)
    {
      v20 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v12, "emailAddresses");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "displayName");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *, _QWORD))(v20 + 16))(v20, v15, v21, 0);
    }
    else
    {
LABEL_7:
      _SLLog(v4, 3, CFSTR("Fallback: Problem occurred with user info request. Fetch names failed."));
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v12, "statusCode"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorMessage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "stringWithFormat:", CFSTR("Server failed to return user info emailAddresses, with status code %@ and error message %@"), v23, v24);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0C8F1D0];
      v28 = *MEMORY[0x1E0CB2D50];
      v29[0] = v15;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 1, v27);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(_QWORD, _QWORD, _QWORD, void *))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, 0, v21);
    }

  }
}

- (SLWebClient)webClient
{
  return (SLWebClient *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webClient, 0);
  objc_storeStrong((id *)&self->_webClientQueue, 0);
}

@end
