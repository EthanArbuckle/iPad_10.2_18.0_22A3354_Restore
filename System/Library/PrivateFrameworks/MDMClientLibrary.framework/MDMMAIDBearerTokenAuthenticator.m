@implementation MDMMAIDBearerTokenAuthenticator

+ (id)authenticatorWithAnchorCertificateRefs:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setAnchorCertificateRefs:", v3);

  return v4;
}

- (MDMMAIDBearerTokenAuthenticator)initWithRMAccountID:(id)a3
{
  id v4;
  MDMMAIDBearerTokenAuthenticator *v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSString *token;
  uint64_t v10;
  NSString *personaID;
  NSObject *v12;
  NSString *v13;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MDMMAIDBearerTokenAuthenticator;
  v5 = -[MDMMAIDBearerTokenAuthenticator init](&v16, sel_init);
  if (v5)
  {
    v15 = 0;
    +[MDMAccountUtilities rmAccountWithIdentifier:fromStore:error:](MDMAccountUtilities, "rmAccountWithIdentifier:fromStore:error:", v4, 0, &v15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v15;
    if (v6)
    {
      objc_msgSend(v6, "dmc_bearerToken");
      v8 = objc_claimAutoreleasedReturnValue();
      token = v5->_token;
      v5->_token = (NSString *)v8;

      objc_msgSend(v6, "dmc_personaIdentifier");
      v10 = objc_claimAutoreleasedReturnValue();
      personaID = v5->_personaID;
      v5->_personaID = (NSString *)v10;
    }
    else
    {
      v12 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v18 = v7;
        _os_log_impl(&dword_1D4BF7000, v12, OS_LOG_TYPE_ERROR, "Could not extract auth token from RM account: %{public}@", buf, 0xCu);
      }
      v13 = v5->_token;
      v5->_token = 0;

      personaID = v5->_personaID;
      v5->_personaID = 0;
    }

  }
  return v5;
}

- (MDMMAIDBearerTokenAuthenticator)initWithTokens:(id)a3
{
  id v4;
  MDMMAIDBearerTokenAuthenticator *v5;
  uint64_t v6;
  NSString *token;
  NSString *personaID;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MDMMAIDBearerTokenAuthenticator;
  v5 = -[MDMMAIDBearerTokenAuthenticator init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("token"));
    v6 = objc_claimAutoreleasedReturnValue();
    token = v5->_token;
    v5->_token = (NSString *)v6;

    personaID = v5->_personaID;
    v5->_personaID = 0;

  }
  return v5;
}

+ (NSString)authenticationMethod
{
  return (NSString *)CFSTR("apple-maid");
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
  +[MDMMAIDBearerTokenAuthenticator authenticationMethod](MDMMAIDBearerTokenAuthenticator, "authenticationMethod");
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
  -[MDMMAIDBearerTokenAuthenticator token](self, "token");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[MDMMAIDBearerTokenAuthenticator token](self, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    DMCHTTPAuthStringWithAuthToken();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addValue:forHTTPHeaderField:", v8, *MEMORY[0x1E0D1C058]);

  }
  return v6 != 0;
}

- (BOOL)doesWebAuthentication
{
  return 0;
}

- (BOOL)canRefreshToken
{
  return 1;
}

- (id)prepareForReauthenticationWithAuthParams:(id)a3 accountID:(id)a4 error:(id *)a5
{
  void *v5;
  void *v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("url"), a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)fetchTokenWithAuthParams:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[MDMMAIDBearerTokenAuthenticator validAuthParams:](self, "validAuthParams:", v8))
  {
    v11 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLWithString:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __88__MDMMAIDBearerTokenAuthenticator_fetchTokenWithAuthParams_accountID_completionHandler___block_invoke;
    v15[3] = &unk_1E9852B78;
    v15[4] = self;
    v16 = v10;
    -[MDMMAIDBearerTokenAuthenticator _executeExchangeRequestWithURL:accountID:completionHandler:](self, "_executeExchangeRequestWithURL:accountID:completionHandler:", v13, v9, v15);

  }
  else
  {
    +[MDMMAIDBearerTokenAuthenticator _createAuthInvalidError](MDMMAIDBearerTokenAuthenticator, "_createAuthInvalidError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v14);

  }
}

void __88__MDMMAIDBearerTokenAuthenticator_fetchTokenWithAuthParams_accountID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void (*v9)(void);
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("token"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setToken:", v7);

    v8 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D4BF7000, v8, OS_LOG_TYPE_INFO, "Fetched MAID tokens", (uint8_t *)&v11, 2u);
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    v10 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1D4BF7000, v10, OS_LOG_TYPE_ERROR, "Unable to fetch MAID token: %{public}@", (uint8_t *)&v11, 0xCu);
    }
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v9();

}

- (void)refreshTokenWithAuthParams:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke;
  v12[3] = &unk_1E9852BC8;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[MDMMAIDBearerTokenAuthenticator fetchTokenWithAuthParams:accountID:completionHandler:](self, "fetchTokenWithAuthParams:accountID:completionHandler:", a3, v11, v12);

}

void __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v7 = a3;
  if (v7)
    goto LABEL_9;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__4;
  v31 = __Block_byref_object_dispose__4;
  v32 = 0;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v8 = (void *)MEMORY[0x1E0D1C1F0];
  objc_msgSend(*(id *)(a1 + 32), "personaID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_9;
  v18[3] = &unk_1E9852BA0;
  v21 = &v23;
  v10 = *(id *)(a1 + 40);
  v22 = &v27;
  v11 = *(_QWORD *)(a1 + 32);
  v19 = v10;
  v20 = v11;
  v12 = (id)objc_msgSend(v8, "performBlockUnderPersona:block:", v9, v18);

  v13 = *((unsigned __int8 *)v24 + 24);
  if (*((_BYTE *)v24 + 24))
  {
    v14 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D4BF7000, v14, OS_LOG_TYPE_INFO, "Refreshed MAID tokens", buf, 2u);
    }
  }
  else
  {
    v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = v28[5];
      *(_DWORD *)buf = 138543362;
      v34 = v17;
      _os_log_impl(&dword_1D4BF7000, v15, OS_LOG_TYPE_ERROR, "Failed to update account MAID tokens during refresh: %{public}@", buf, 0xCu);
    }
    (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), 0, v28[5], v16);
  }

  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);

  if (v13)
LABEL_9:
    (*(void (**)(_QWORD, id, id, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v7, v6);

}

void __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_9(_QWORD *a1)
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
  v6[2] = __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_2;
  v6[3] = &unk_1E9852420;
  v4 = a1[4];
  v6[4] = a1[5];
  v5 = objc_msgSend(v2, "dmc_updateAccountWithIdentifier:error:updateBlock:", v4, &obj, v6);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = v5;

}

void __90__MDMMAIDBearerTokenAuthenticator_refreshTokenWithAuthParams_accountID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "token");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dmc_setBearerToken:", v4);

}

- (void)_executeExchangeRequestWithURL:(id)a3 accountID:(id)a4 completionHandler:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  MDMMAIDAuthenticator *v13;
  NSObject *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[16];

  v8 = a5;
  v9 = (void *)MEMORY[0x1E0CB37A8];
  v10 = a4;
  objc_msgSend(v9, "requestWithURL:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAttribution:", 1);
  objc_msgSend(v11, "setHTTPMethod:", *MEMORY[0x1E0D1C090]);
  objc_msgSend(v11, "setTimeoutInterval:", 90.0);
  v12 = objc_alloc_init(MEMORY[0x1E0D1C1D0]);
  v13 = -[MDMMAIDAuthenticator initWithRMAccountID:]([MDMMAIDAuthenticator alloc], "initWithRMAccountID:", v10);

  objc_msgSend(v12, "setAuthenticator:", v13);
  v14 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D4BF7000, v14, OS_LOG_TYPE_INFO, "Exchanging MAID for bearer token...", buf, 2u);
  }
  -[MDMMAIDBearerTokenAuthenticator anchorCertificateRefs](self, "anchorCertificateRefs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__MDMMAIDBearerTokenAuthenticator__executeExchangeRequestWithURL_accountID_completionHandler___block_invoke;
  v17[3] = &unk_1E9852BF0;
  v17[4] = self;
  v18 = v8;
  v16 = v8;
  objc_msgSend(v12, "startWithRequest:username:password:anchorCertificateRefs:completionBlock:", v11, 0, 0, v15, v17);

}

uint64_t __94__MDMMAIDBearerTokenAuthenticator__executeExchangeRequestWithURL_accountID_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
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
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  id v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (char *)a5;
  v12 = (void (**)(id, _QWORD, id))a6;
  v13 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v13;
    *(_DWORD *)buf = 134218242;
    v29 = (const char *)objc_msgSend(v10, "length");
    v30 = 2114;
    v31 = v9;
    _os_log_impl(&dword_1D4BF7000, v14, OS_LOG_TYPE_DEFAULT, "Exchange MAID for bearer token finished with data: %lu bytes, response: %{public}@", buf, 0x16u);

  }
  if (v11)
  {
    v15 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v29 = v11;
      _os_log_impl(&dword_1D4BF7000, v15, OS_LOG_TYPE_ERROR, "Failed to exchange for bearer token with error: %{public}@", buf, 0xCu);
    }
    v12[2](v12, 0, v11);
  }
  else
  {
    v16 = objc_msgSend(v9, "statusCode");
    if (v16 == 200)
    {
      v25 = 0;
      objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v10, 0, &v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (char *)v25;
      if (v18)
      {
        v19 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v29 = v18;
          _os_log_impl(&dword_1D4BF7000, v19, OS_LOG_TYPE_ERROR, "Failed to deserialize server's response with error: %{public}@", buf, 0xCu);
        }
        v12[2](v12, 0, v18);
      }
      else
      {
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("bearer-token"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");
        v23 = *(NSObject **)DMCLogObjects();
        if (v22)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v29 = "-[MDMMAIDBearerTokenAuthenticator _processTokenResponse:data:error:completionHandler:]";
            v30 = 2112;
            v31 = v17;
            _os_log_impl(&dword_1D4BF7000, v23, OS_LOG_TYPE_DEBUG, "%s results: %@", buf, 0x16u);
          }
          v26 = CFSTR("token");
          v27 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(id, void *, id))v12)[2](v12, v24, 0);
        }
        else
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D4BF7000, v23, OS_LOG_TYPE_ERROR, "Server response doesn't contain the bearer token", buf, 2u);
          }
          +[MDMMAIDBearerTokenAuthenticator _createMissingBearerTokenError](MDMMAIDBearerTokenAuthenticator, "_createMissingBearerTokenError");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v12[2](v12, 0, v24);
        }

      }
    }
    else
    {
      if (v16 == 401)
        +[MDMMAIDBearerTokenAuthenticator _createManagedAppleAccountInvalidatedError](MDMMAIDBearerTokenAuthenticator, "_createManagedAppleAccountInvalidatedError");
      else
        +[MDMMAIDBearerTokenAuthenticator _createGeneralServerError](MDMMAIDBearerTokenAuthenticator, "_createGeneralServerError");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v12[2](v12, 0, v20);

    }
  }

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

+ (id)_createMissingBearerTokenError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C020];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15003, v4, 0, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createGeneralServerError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C020];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15003, v4, 0, *MEMORY[0x1E0D1C030], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)_createManagedAppleAccountInvalidatedError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB35C8];
  v3 = *MEMORY[0x1E0D1C020];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15009, v4, 0, *MEMORY[0x1E0D1C030], 0);
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

- (NSString)personaID
{
  return self->_personaID;
}

- (void)setPersonaID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)anchorCertificateRefs
{
  return self->_anchorCertificateRefs;
}

- (void)setAnchorCertificateRefs:(id)a3
{
  objc_storeStrong((id *)&self->_anchorCertificateRefs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchorCertificateRefs, 0);
  objc_storeStrong((id *)&self->_personaID, 0);
  objc_storeStrong((id *)&self->_token, 0);
}

@end
