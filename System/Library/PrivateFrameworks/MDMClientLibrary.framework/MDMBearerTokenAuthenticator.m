@implementation MDMBearerTokenAuthenticator

- (MDMBearerTokenAuthenticator)initWithRMAccountID:(id)a3
{
  id v4;
  MDMBearerTokenAuthenticator *v5;
  uint64_t v6;
  id v7;
  NSString *token;
  NSObject *v9;
  id v11;
  objc_super v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MDMBearerTokenAuthenticator;
  v5 = -[MDMBearerTokenAuthenticator init](&v12, sel_init);
  if (v5)
  {
    v11 = 0;
    +[MDMAccountUtilities bearerTokenForRMAccountID:error:](MDMAccountUtilities, "bearerTokenForRMAccountID:error:", v4, &v11);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v11;
    token = v5->_token;
    v5->_token = (NSString *)v6;

    if (v7)
    {
      v9 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v14 = v7;
        _os_log_impl(&dword_1D4BF7000, v9, OS_LOG_TYPE_ERROR, "Could not extract auth token from RM account: %{public}@", buf, 0xCu);
      }
    }

  }
  return v5;
}

- (MDMBearerTokenAuthenticator)initWithTokens:(id)a3
{
  id v4;
  MDMBearerTokenAuthenticator *v5;
  uint64_t v6;
  NSString *token;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MDMBearerTokenAuthenticator;
  v5 = -[MDMBearerTokenAuthenticator init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("token"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v6;

  }
  return v5;
}

+ (NSString)authenticationMethod
{
  return (NSString *)CFSTR("apple-as-web");
}

- (BOOL)validAuthParams:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("method"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMBearerTokenAuthenticator authenticationMethod](MDMBearerTokenAuthenticator, "authenticationMethod");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v5))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("url"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)authenticateRequest:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a3;
  -[MDMBearerTokenAuthenticator token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MDMBearerTokenAuthenticator token](self, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DMCHTTPAuthStringWithAuthToken();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", v8, *MEMORY[0x1E0D1C058]);

  }
  return v6 != 0;
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
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[MDMBearerTokenAuthenticator validAuthParams:](self, "validAuthParams:", v6))
  {
    v8 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("url"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLWithString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v10, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("user-identifier"), v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v16[0] = v12;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setQueryItems:", v13);

      }
      objc_msgSend(v11, "URL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)authTokensWithCallbackURL:(id)a3 authParams:(id)a4 completionHandler:(id)a5
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  char v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  const __CFString *v30;
  void *v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a5;
  objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scheme");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("apple-remotemanagement-user-login"));

  if ((v10 & 1) == 0)
  {
    v19 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = v19;
      objc_msgSend(v8, "scheme");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v34 = v21;
      _os_log_impl(&dword_1D4BF7000, v20, OS_LOG_TYPE_ERROR, "Incorrect auth callback scheme: %{public}@", buf, 0xCu);

    }
LABEL_17:
    +[MDMBearerTokenAuthenticator _createAuthInvalidError](MDMBearerTokenAuthenticator, "_createAuthInvalidError");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v22);
    goto LABEL_18;
  }
  v25 = v6;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v8, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (!v12)
  {
LABEL_10:

LABEL_15:
    v24 = *(NSObject **)DMCLogObjects();
    v6 = v25;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v25;
      _os_log_impl(&dword_1D4BF7000, v24, OS_LOG_TYPE_ERROR, "Invalid auth redirect URL response: %{public}@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  v13 = v12;
  v14 = *(_QWORD *)v27;
LABEL_4:
  v15 = 0;
  while (1)
  {
    if (*(_QWORD *)v27 != v14)
      objc_enumerationMutation(v11);
    v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
    objc_msgSend(v16, "name");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("access-token"));

    if ((v18 & 1) != 0)
      break;
    if (v13 == ++v15)
    {
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v13)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  objc_msgSend(v16, "value");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v22)
    goto LABEL_15;
  v30 = CFSTR("token");
  v31 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(id, void *, void *))v7)[2](v7, v23, 0);

  v6 = v25;
LABEL_18:

}

- (BOOL)canRefreshToken
{
  return 0;
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
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("url"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9), (v10 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = (void *)v10;
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __88__MDMBearerTokenAuthenticator_prepareForReauthenticationWithAuthParams_accountID_error___block_invoke;
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

void __88__MDMBearerTokenAuthenticator_prepareForReauthenticationWithAuthParams_accountID_error___block_invoke(uint64_t a1, void *a2)
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

+ (id)_createAuthInvalidError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C020];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:errorType:", v3, 15024, v4, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
