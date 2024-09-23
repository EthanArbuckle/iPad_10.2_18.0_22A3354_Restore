@implementation MDMOAuth2Authenticator

- (MDMOAuth2Authenticator)initWithRMAccountID:(id)a3
{
  id v4;
  MDMOAuth2Authenticator *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSDictionary *tokens;
  uint64_t v12;
  NSString *personaID;
  NSObject *v14;
  NSDictionary *v15;
  id v17;
  objc_super v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MDMOAuth2Authenticator;
  v5 = -[MDMOAuth2Authenticator init](&v18, sel_init);
  if (v5)
  {
    v17 = 0;
    +[MDMAccountUtilities rmAccountWithIdentifier:fromStore:error:](MDMAccountUtilities, "rmAccountWithIdentifier:fromStore:error:", v4, 0, &v17);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v17;
    if (v6)
    {
      objc_msgSend(v6, "credential");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "token");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[MDMOAuth2Authenticator deserializeTokens:](MDMOAuth2Authenticator, "deserializeTokens:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
      tokens = v5->_tokens;
      v5->_tokens = (NSDictionary *)v10;

      objc_msgSend(v6, "dmc_personaIdentifier");
      v12 = objc_claimAutoreleasedReturnValue();
      personaID = v5->_personaID;
      v5->_personaID = (NSString *)v12;

    }
    else
    {
      v14 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v20 = v7;
        _os_log_impl(&dword_1D4BF7000, v14, OS_LOG_TYPE_ERROR, "Could not extract auth tokens from RM account: %{public}@", buf, 0xCu);
      }
      v15 = v5->_tokens;
      v5->_tokens = (NSDictionary *)MEMORY[0x1E0C9AA70];

      v8 = v5->_personaID;
      v5->_personaID = 0;
    }

  }
  return v5;
}

- (MDMOAuth2Authenticator)initWithTokens:(id)a3
{
  id v5;
  MDMOAuth2Authenticator *v6;
  MDMOAuth2Authenticator *v7;
  NSString *personaID;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MDMOAuth2Authenticator;
  v6 = -[MDMOAuth2Authenticator init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tokens, a3);
    personaID = v7->_personaID;
    v7->_personaID = 0;

  }
  return v7;
}

+ (NSString)authenticationMethod
{
  return (NSString *)CFSTR("apple-oauth2");
}

- (BOOL)validAuthParams:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("method"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMOAuth2Authenticator authenticationMethod](MDMOAuth2Authenticator, "authenticationMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("authorization-url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("token-url"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("client-id"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("redirect-url"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9 != 0;

        }
        else
        {
          v10 = 0;
        }

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)serializeTokens:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("expires"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "stringFromDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("access_token"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("access_token"));

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("refresh_token"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("refresh_token"));

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("expires"));
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v7, 0, &v15);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v15;
  if (v10)
  {
    v12 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v10, 4);
  }
  else
  {
    v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v7;
      v18 = 2114;
      v19 = v11;
      _os_log_impl(&dword_1D4BF7000, v13, OS_LOG_TYPE_ERROR, "Could not serialize JSON data for token: %{public}@ %{public}@", buf, 0x16u);
    }
    v12 = &stru_1E9853740;
  }

  return v12;
}

+ (id)deserializeTokens:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v3, 0, &v14);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v14;
  if (v4)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("expires"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v6, "dateFromString:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("access_token"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("access_token"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("refresh_token"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("refresh_token"));

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, CFSTR("expires"));
  }
  else
  {
    v9 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = v3;
      v17 = 2114;
      v18 = v5;
      _os_log_impl(&dword_1D4BF7000, v9, OS_LOG_TYPE_ERROR, "Could not deserialize JSON data for token: %{public}@ %{public}@", buf, 0x16u);
    }
    v10 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v10;
}

- (BOOL)authenticateRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[MDMOAuth2Authenticator tokens](self, "tokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("access_token"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    DMCHTTPAuthStringWithAuthToken();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", v8, *MEMORY[0x1E0D1C058]);

  }
  return v7 != 0;
}

- (BOOL)doesWebAuthentication
{
  return 1;
}

- (id)webAuthenticationURLForAuthParams:(id)a3 userIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (-[MDMOAuth2Authenticator validAuthParams:](self, "validAuthParams:", v6))
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDMOAuth2Authenticator setState:](self, "setState:", v9);

    -[MDMOAuth2Authenticator _authorizationGrantURLWithAuthParams:](self, "_authorizationGrantURLWithAuthParams:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v7)
      {
        objc_msgSend(v11, "queryItems");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("login_hint"), v7);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "arrayByAddingObject:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setQueryItems:", v15);

      }
      objc_msgSend(v12, "URL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)authTokensWithCallbackURL:(id)a3 authParams:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  void *v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  char v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void (**v36)(id, _QWORD, void *);
  id v37;
  id v38;
  MDMOAuth2Authenticator *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v8, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scheme");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("apple-remotemanagement-user-login"));

  if ((v13 & 1) == 0)
  {
    v31 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = v31;
      objc_msgSend(v11, "scheme");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v46 = v33;
      _os_log_impl(&dword_1D4BF7000, v32, OS_LOG_TYPE_ERROR, "Incorrect auth callback scheme: %{public}@", buf, 0xCu);

    }
    +[MDMOAuth2Authenticator _createOAuth2InvalidError](MDMOAuth2Authenticator, "_createOAuth2InvalidError");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, 0, v17);
    goto LABEL_27;
  }
  v39 = self;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  objc_msgSend(v11, "queryItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (!v15)
  {

    v18 = 0;
    v17 = 0;
    goto LABEL_23;
  }
  v16 = v15;
  v36 = v10;
  v37 = v9;
  v38 = v8;
  v17 = 0;
  v18 = 0;
  v19 = *(_QWORD *)v41;
  do
  {
    for (i = 0; i != v16; ++i)
    {
      if (*(_QWORD *)v41 != v19)
        objc_enumerationMutation(v14);
      v21 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      objc_msgSend(v21, "name");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("code"));

      if (v23)
      {
        objc_msgSend(v21, "value");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = v17;
        v17 = (void *)v24;
      }
      else
      {
        objc_msgSend(v21, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("state"));

        if (!v27)
          continue;
        objc_msgSend(v21, "value");
        v28 = objc_claimAutoreleasedReturnValue();
        v25 = v18;
        v18 = (void *)v28;
      }

    }
    v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  }
  while (v16);

  if (v17)
  {
    v9 = v37;
    v8 = v38;
    v10 = v36;
    if (v18)
    {
      -[MDMOAuth2Authenticator state](v39, "state");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v18, "isEqualToString:", v29);

      if ((v30 & 1) != 0)
      {
        -[MDMOAuth2Authenticator _tokenRequestWithCode:authParams:completionHandler:](v39, "_tokenRequestWithCode:authParams:completionHandler:", v17, v37, v36);
        goto LABEL_26;
      }
    }
  }
  else
  {
    v9 = v37;
    v8 = v38;
    v10 = v36;
  }
LABEL_23:
  v34 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v46 = v8;
    _os_log_impl(&dword_1D4BF7000, v34, OS_LOG_TYPE_ERROR, "Invalid OAuth2 redirect URL response: %{public}@", buf, 0xCu);
  }
  +[MDMOAuth2Authenticator _createOAuth2InvalidError](MDMOAuth2Authenticator, "_createOAuth2InvalidError");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, 0, v35);

LABEL_26:
LABEL_27:

}

- (BOOL)canRefreshToken
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MDMOAuth2Authenticator tokens](self, "tokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("refresh_token"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)prepareForReauthenticationWithAuthParams:(id)a3 accountID:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("authorization-url"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __83__MDMOAuth2Authenticator_prepareForReauthenticationWithAuthParams_accountID_error___block_invoke;
    v19[3] = &unk_1E9852758;
    v13 = v11;
    v20 = v13;
    v21 = v7;
    v14 = objc_msgSend(v12, "dmc_updateAccountWithIdentifier:error:updateBlock:", v8, &v22, v19);
    v15 = v22;

    if ((v14 & 1) != 0)
    {
      v16 = v13;
    }
    else
    {
      v17 = *(NSObject **)(DMCLogObjects() + 8);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v24 = v15;
        _os_log_impl(&dword_1D4BF7000, v17, OS_LOG_TYPE_ERROR, "Unable to update RM account when doing AuthServices re-authentication. Error: %{public}@", buf, 0xCu);
      }
      v16 = 0;
      if (a5 && v15)
      {
        v16 = 0;
        *a5 = objc_retainAutorelease(v15);
      }
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __83__MDMOAuth2Authenticator_prepareForReauthenticationWithAuthParams_accountID_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dmc_setBearerReauthURL:", v4);

  objc_msgSend(v5, "dmc_setBearerReauthParams:", *(_QWORD *)(a1 + 40));
}

- (void)refreshTokenWithAuthParams:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[MDMOAuth2Authenticator tokens](self, "tokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("refresh_token"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke;
  v15[3] = &unk_1E9852C90;
  v16 = v8;
  v17 = v9;
  v15[4] = self;
  v13 = v8;
  v14 = v9;
  -[MDMOAuth2Authenticator _refreshRequestWithRefreshToken:authParams:completionHandler:](self, "_refreshRequestWithRefreshToken:authParams:completionHandler:", v12, v10, v15);

}

void __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  __int128 *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "setTokens:", v5);
    *(_QWORD *)&v29 = 0;
    *((_QWORD *)&v29 + 1) = &v29;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__5;
    v32 = __Block_byref_object_dispose__5;
    v33 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    v26 = 0;
    v7 = (void *)MEMORY[0x1E0D1C1F0];
    objc_msgSend(*(id *)(a1 + 32), "personaID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_53;
    v18[3] = &unk_1E9852BA0;
    v21 = &v23;
    v9 = *(id *)(a1 + 40);
    v22 = &v29;
    v10 = *(_QWORD *)(a1 + 32);
    v19 = v9;
    v20 = v10;
    v11 = (id)objc_msgSend(v7, "performBlockUnderPersona:block:", v8, v18);

    if (*((_BYTE *)v24 + 24))
    {
      v12 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D4BF7000, v12, OS_LOG_TYPE_INFO, "Refreshed OAuth2 tokens", buf, 2u);
      }
      (*(void (**)(_QWORD, id, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, 0, v13);
    }
    else
    {
      v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v17 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 40);
        *(_DWORD *)buf = 138543362;
        v28 = v17;
        _os_log_impl(&dword_1D4BF7000, v15, OS_LOG_TYPE_ERROR, "Failed to update OAuth2 tokens during refresh: %{public}@", buf, 0xCu);
      }
      (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, *(_QWORD *)(*((_QWORD *)&v29 + 1) + 40), v16);
    }

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

  }
  else
  {
    v14 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v29) = 138543362;
      *(_QWORD *)((char *)&v29 + 4) = v6;
      _os_log_impl(&dword_1D4BF7000, v14, OS_LOG_TYPE_ERROR, "Unable to refresh OAuth2 token: %{public}@", (uint8_t *)&v29, 0xCu);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

void __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_53(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  _QWORD v6[5];
  id obj;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[7] + 8);
  obj = *(id *)(v3 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_2;
  v6[3] = &unk_1E9852420;
  v4 = a1[4];
  v6[4] = a1[5];
  v5 = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v4, &obj, v6);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;

}

void __81__MDMOAuth2Authenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "tokens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMOAuth2Authenticator serializeTokens:](MDMOAuth2Authenticator, "serializeTokens:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "dmc_setBearerToken:", v5);
}

- (id)_authorizationGrantURLWithAuthParams:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  int v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[MDMOAuth2Authenticator validAuthParams:](self, "validAuthParams:", v4))
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("authorization-url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLWithString:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("client-id"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("redirect-url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("scope"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v7, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v11, "queryItems");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13)
      v15 = v13;
    else
      v15 = MEMORY[0x1E0C9AA60];
    objc_msgSend(v12, "arrayWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("response_type"), CFSTR("code"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v17);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("client_id"), v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v18);

    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("redirect_uri"), v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v19);

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("scope"), v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addObject:", v20);

    }
    v21 = (void *)MEMORY[0x1E0CB39D8];
    -[MDMOAuth2Authenticator state](self, "state");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "queryItemWithName:value:", CFSTR("state"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObject:", v23);

    objc_msgSend(v11, "setQueryItems:", v16);
    objc_msgSend(v11, "URL");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v27 = 138543362;
      v28 = v4;
      _os_log_impl(&dword_1D4BF7000, v25, OS_LOG_TYPE_ERROR, "Invalid OAuth2 parameters: %{public}@", (uint8_t *)&v27, 0xCu);
    }
    v24 = 0;
  }

  return v24;
}

- (void)_tokenRequestWithCode:(id)a3 authParams:(id)a4 completionHandler:(id)a5
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  id v24;
  _QWORD v25[4];
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MDMOAuth2Authenticator validAuthParams:](self, "validAuthParams:", v9))
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("token-url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("client-id"));
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("redirect-url"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("authorization_code"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("code"), v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v16;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("redirect_uri"), v14);
    v24 = v8;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[2] = v17;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("client_id"), v23);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v25[3] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v13, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setQueryItems:", v19);
    objc_msgSend(v20, "percentEncodedQuery");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDMOAuth2Authenticator _executeTokenRequestWithURL:body:completionHandler:](self, "_executeTokenRequestWithURL:body:completionHandler:", v13, v21, v10);

    v8 = v24;
    v10 = (id)v23;
  }
  else
  {
    v22 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v27 = v9;
      _os_log_impl(&dword_1D4BF7000, v22, OS_LOG_TYPE_ERROR, "Invalid OAuth2 parameters: %{public}@", buf, 0xCu);
    }
    +[MDMOAuth2Authenticator _createOAuth2InvalidError](MDMOAuth2Authenticator, "_createOAuth2InvalidError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);
  }

}

- (void)_refreshRequestWithRefreshToken:(id)a3 authParams:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  _QWORD v22[3];
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MDMOAuth2Authenticator validAuthParams:](self, "validAuthParams:", v9))
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("token-url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("client-id"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("grant_type"), CFSTR("refresh_token"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("refresh_token"), v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v16;
    objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("client_id"), v14);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[2] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v13, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setQueryItems:", v18);
    objc_msgSend(v19, "percentEncodedQuery");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MDMOAuth2Authenticator _executeTokenRequestWithURL:body:completionHandler:](self, "_executeTokenRequestWithURL:body:completionHandler:", v13, v20, v10);

    v10 = (id)v14;
  }
  else
  {
    v21 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v24 = v9;
      _os_log_impl(&dword_1D4BF7000, v21, OS_LOG_TYPE_ERROR, "Invalid OAuth2 parameters: %{public}@", buf, 0xCu);
    }
    +[MDMOAuth2Authenticator _createOAuth2InvalidError](MDMOAuth2Authenticator, "_createOAuth2InvalidError");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v13);
  }

}

- (void)_executeTokenRequestWithURL:(id)a3 body:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[16];

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB37A8];
  v10 = a4;
  objc_msgSend(v9, "requestWithURL:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttribution:", 1);
  objc_msgSend(v11, "setHTTPMethod:", *MEMORY[0x1E0D1C098]);
  objc_msgSend(v11, "setTimeoutInterval:", 90.0);
  objc_msgSend(v10, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setHTTPBody:", v12);
  objc_msgSend(v11, "setValue:forHTTPHeaderField:", CFSTR("application/x-www-form-urlencoded"), CFSTR("Content-Type"));
  v13 = (void *)objc_opt_new();
  v14 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v14, OS_LOG_TYPE_INFO, "Getting OAuth2 for bearer token...", buf, 2u);
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __77__MDMOAuth2Authenticator__executeTokenRequestWithURL_body_completionHandler___block_invoke;
  v16[3] = &unk_1E9852BF0;
  v16[4] = self;
  v17 = v8;
  v15 = v8;
  objc_msgSend(v13, "startWithRequest:username:password:anchorCertificateRefs:completionBlock:", v11, 0, 0, 0, v16);

}

uint64_t __77__MDMOAuth2Authenticator__executeTokenRequestWithURL_body_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "_processTokenResponse:data:error:completionHandler:", a3, a2, a4, *(_QWORD *)(a1 + 40));
}

- (void)_processTokenResponse:(id)a3 data:(id)a4 error:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  char *v11;
  void (**v12)(id, _QWORD, id);
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (char *)a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    *(_DWORD *)buf = 134218242;
    v35 = (const char *)objc_msgSend(v10, "length");
    v36 = 2114;
    v37 = v9;
    _os_log_impl(&dword_1D4BF7000, v14, OS_LOG_TYPE_DEFAULT, "Getting OAuth2 bearer token finished with data: %lu bytes, response: %{public}@", buf, 0x16u);

  }
  if (v11)
  {
    v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v35 = v11;
      _os_log_impl(&dword_1D4BF7000, v15, OS_LOG_TYPE_ERROR, "Failed to get OAuth2 bearer token with error: %{public}@", buf, 0xCu);
    }
    v12[2](v12, 0, v11);
    goto LABEL_29;
  }
  v16 = objc_msgSend(v9, "statusCode");
  if (v16 == 200)
  {
    v33 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 0, &v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (char *)v33;
    if (v18)
    {
      v19 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v35 = v18;
        _os_log_impl(&dword_1D4BF7000, v19, OS_LOG_TYPE_ERROR, "Failed to deserialize server's response with error: %{public}@", buf, 0xCu);
      }
      v12[2](v12, 0, v18);
      goto LABEL_28;
    }
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("token_type"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("access_token"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("refresh_token"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("expires_in"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", (double)(int)objc_msgSend(v25, "intValue"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v23)
        goto LABEL_24;
    }
    else
    {
      v31 = 0;
      if (!v23)
        goto LABEL_24;
    }
    if (!objc_msgSend(v23, "caseInsensitiveCompare:", CFSTR("Bearer")) && v24)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 3);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v24;
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v24, CFSTR("access_token"));
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v32, CFSTR("refresh_token"));
      objc_msgSend(v27, "setObject:forKeyedSubscript:", v31, CFSTR("expires"));
      v28 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315394;
        v35 = "-[MDMOAuth2Authenticator _processTokenResponse:data:error:completionHandler:]";
        v36 = 2112;
        v37 = v27;
        _os_log_impl(&dword_1D4BF7000, v28, OS_LOG_TYPE_DEBUG, "%s results: %@", buf, 0x16u);
      }
      ((void (**)(id, void *, id))v12)[2](v12, v27, 0);
      v24 = v30;
      goto LABEL_27;
    }
LABEL_24:
    v29 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v35 = (const char *)v17;
      _os_log_impl(&dword_1D4BF7000, v29, OS_LOG_TYPE_ERROR, "Failed to get OAuth2 bearer token invalid response: %{public}@}", buf, 0xCu);
    }
    +[MDMOAuth2Authenticator _createOAuth2InvalidError](MDMOAuth2Authenticator, "_createOAuth2InvalidError");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2](v12, 0, v27);
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  v20 = (const char *)v16;
  v21 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v35 = v20;
    _os_log_impl(&dword_1D4BF7000, v21, OS_LOG_TYPE_ERROR, "Failed to get OAuth2 bearer token with HTTP status: %ld", buf, 0xCu);
  }
  +[MDMOAuth2Authenticator _createOAuth2InvalidError](MDMOAuth2Authenticator, "_createOAuth2InvalidError");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2](v12, 0, v22);

LABEL_29:
}

+ (id)_createOAuth2InvalidError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C020];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15025, v4, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSDictionary)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
