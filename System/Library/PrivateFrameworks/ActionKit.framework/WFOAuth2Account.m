@implementation WFOAuth2Account

+ (id)migrate:(id)a3
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
  void *v13;
  void *v14;
  WFOAuth2Credential *v15;

  v4 = a3;
  if (v4
    && (objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v4, 0, 0),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expire_date"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("expire_date"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "doubleValue");
      objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
    }

    v12 = (void *)objc_msgSend(v6, "mutableCopy");
    v13 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v10, "timeIntervalSinceNow");
    objc_msgSend(v13, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v14, CFSTR("expires_in"));

    v15 = -[WFOAuth2Credential initWithResponseObject:]([WFOAuth2Credential alloc], "initWithResponseObject:", v12);
    objc_msgSend(a1, "accountWithCredential:", v15);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)sessionManager
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("+[WFOAuth2Account sessionManager] must be overridden"));
  return 0;
}

+ (id)clientID
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("+[WFOAuth2Account clientID] must be overridden"));
  return 0;
}

+ (id)clientSecret
{
  return 0;
}

+ (id)redirectURI
{
  return 0;
}

+ (id)scopes
{
  return 0;
}

+ (id)responseType
{
  __CFString *v2;

  v2 = CFSTR("code");
  return CFSTR("code");
}

+ (id)accountWithCredential:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFOAuth2Account.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("credential"));

  }
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setCredential:", v5);

  return v6;
}

- (BOOL)isValid
{
  void *v2;
  char v3;

  -[WFOAuth2Account credential](self, "credential");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  return v3;
}

- (void)refreshWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  -[WFOAuth2Account credential](self, "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isExpired") & 1) != 0)
  {
    -[WFOAuth2Account credential](self, "credential");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "refreshToken");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "sessionManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFOAuth2Account credential](self, "credential");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __48__WFOAuth2Account_refreshWithCompletionHandler___block_invoke;
      v10[3] = &unk_24F8B4F08;
      v10[4] = self;
      v11 = v4;
      objc_msgSend(v8, "authenticateWithRefreshCredential:completionHandler:", v9, v10);

      goto LABEL_7;
    }
  }
  else
  {

  }
  if (v4)
    (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
LABEL_7:

}

- (WFOAuth2Credential)credential
{
  return self->_credential;
}

- (void)setCredential:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
}

void __48__WFOAuth2Account_refreshWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "setCredential:", v7);
    +[WFAccount saveAccount:](WFAccount, "saveAccount:", *(_QWORD *)(a1 + 32));
  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v5);

}

@end
