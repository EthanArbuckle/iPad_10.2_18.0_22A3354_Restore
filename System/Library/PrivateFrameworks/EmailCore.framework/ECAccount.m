@implementation ECAccount

- (BOOL)hasPasswordCredential
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C8F1A8]);

  return v5;
}

- (ECAccount)initWithSystemAccount:(id)a3 accountStore:(id)a4
{
  id v7;
  id v8;
  ECAccount *v9;
  ECAccount *v10;
  ACAccountStore *v11;
  ACAccountStore *accountStore;
  EFLazyCache *v13;
  EFLazyCache *cache;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ECAccount;
  v9 = -[ECAccount init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_systemAccount, a3);
    if (v8)
    {
      v11 = (ACAccountStore *)v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
      v11 = (ACAccountStore *)objc_claimAutoreleasedReturnValue();
    }
    accountStore = v10->_accountStore;
    v10->_accountStore = v11;

    v13 = (EFLazyCache *)objc_alloc_init(MEMORY[0x1E0D1EED8]);
    cache = v10->_cache;
    v10->_cache = v13;

  }
  return v10;
}

- (ECAccount)initWithSystemAccount:(id)a3
{
  return -[ECAccount initWithSystemAccount:accountStore:](self, "initWithSystemAccount:accountStore:", a3, 0);
}

id __33__ECAccount__cachedParentAccount__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "systemAccount");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "parentAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (NSString)personaIdentifier
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[ECAccount systemAccount](self, "systemAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x1E0C8EFC8];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFC8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[ECAccount _cachedParentAccount](self, "_cachedParentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  return (NSString *)v5;
}

- (id)_cachedParentAccount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];

  -[ECAccount cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __33__ECAccount__cachedParentAccount__block_invoke;
  v8[3] = &unk_1E7120A98;
  v8[4] = self;
  objc_msgSend(v3, "objectForKey:generator:", CFSTR("ECAccountCacheKeyParentAccount"), v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    v6 = 0;
  else
    v6 = v4;

  return v6;
}

- (EFLazyCache)cache
{
  return self->_cache;
}

- (BOOL)isAppleEmployeeAccount
{
  void *v2;
  BOOL v3;

  -[ECAccount hostname](self, "hostname");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = !objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("mail.apple.com"))
    || !objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("mailpex.apple.com"))
    || objc_msgSend(v2, "caseInsensitiveCompare:", CFSTR("mailex16.apple.com")) == 0;

  return v3;
}

- (NSString)hostname
{
  void *v3;
  void *v4;
  void *v5;

  -[ECAccount systemAccount](self, "systemAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF90]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[ECAccount _cachedParentAccount](self, "_cachedParentAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[ECAccount _hostnameFromParentAccount:](self, "_hostnameFromParentAccount:", v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  return (NSString *)v4;
}

- (BOOL)isEnabledForDataclass:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[ECAccount systemAccount](self, "systemAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEnabledForDataclass:", v4);

  return v6;
}

- (ACAccount)systemAccount
{
  return self->_systemAccount;
}

- (void)setSystemAccount:(id)a3
{
  objc_storeStrong((id *)&self->_systemAccount, a3);
}

- (NSDictionary)properties
{
  return self->_properties;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_properties, 0);
  objc_storeStrong((id *)&self->_systemAccount, 0);
  objc_storeStrong((id *)&self->_accountDirectoryTildeAbbreviatedPath, 0);
  objc_storeStrong((id *)&self->_accountDescription, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __16__ECAccount_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (OS_os_log *)(id)log_log;
}

void __16__ECAccount_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

- (void)renewCredentialsWithOptions:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ECAccount accountStore](self, "accountStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "renewCredentialsForAccount:options:completion:", v8, v9, v6);

}

- (NSString)accountTypeIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (ACAccountCredential)credential
{
  void *v2;
  void *v3;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ACAccountCredential *)v3;
}

- (void)setHostname:(id)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(v10, "length"))
  {
    objc_msgSend(v10, "ef_stringWithNoExtraSpaces");
    v5 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v5;
  }
  -[ECAccount hostname](self, "hostname");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 != v6 && (objc_msgSend(v10, "isEqual:", v6) & 1) == 0)
  {
    if (!objc_msgSend(v10, "length"))
    {

      v10 = 0;
    }
    -[ECAccount systemAccount](self, "systemAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECAccount _cachedParentAccount](self, "_cachedParentAccount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ECAccount.m"), 97, CFSTR("Unexpected override of the hostname from the parent"));

    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0C8EF90]);

  }
}

- (id)_hostnameFromParentAccount:(id)a3
{
  return 0;
}

- (NSString)username
{
  void *v2;
  void *v3;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)password
{
  void *v2;
  void *v3;
  void *v4;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "password");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setPassword:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "credential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "password");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v8 && (objc_msgSend(v6, "isEqualToString:", v8) & 1) == 0)
  {
    if (v5)
    {
      objc_msgSend(v5, "setPassword:", v8);
      objc_msgSend(v5, "setCredentialType:", *MEMORY[0x1E0C8F1A8]);
    }
    else
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8F2B0]), "initWithPassword:", v8);
      objc_msgSend(v4, "setCredential:", v7);

    }
  }

}

- (NSString)oauthToken
{
  void *v2;
  void *v3;
  void *v4;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credential");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "oauthToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (void)setOAuth2Token:(id)a3 refreshToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ECAccount credential](self, "credential");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = objc_alloc_init(MEMORY[0x1E0C8F2B0]);
  objc_msgSend(v7, "setOauthToken:", v9);
  objc_msgSend(v7, "setOauthRefreshToken:", v6);
  -[ECAccount systemAccount](self, "systemAccount");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCredential:", v7);

}

- (void)setIsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;

  v3 = a3;
  -[ECAccount systemAccount](self, "systemAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0C8F3D0];
  v11 = v5;
  if (objc_msgSend(v5, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3D0]) != v3)
  {
    -[ECAccount _cachedParentAccount](self, "_cachedParentAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = v7;
    else
      v8 = v11;
    v9 = v8;
    objc_msgSend(v9, "setEnabled:forDataclass:", v3, v6);
    -[ECAccount cache](self, "cache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", CFSTR("ECAccountCacheKeyEnabled"));

  }
}

- (id)enabledDataclasses
{
  void *v2;
  void *v3;
  void *v4;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enabledDataclasses");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isAppleAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;

  -[ECAccount _cachedParentAccount](self, "_cachedParentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C8F030];
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F030]) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "accountType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", v7);

  }
  return v8;
}

- (BOOL)isYahooAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;

  -[ECAccount _cachedParentAccount](self, "_cachedParentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C8F160];
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F160]) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "accountType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", v7);

  }
  return v8;
}

- (BOOL)isGmailAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;

  -[ECAccount _cachedParentAccount](self, "_cachedParentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C8F0A8];
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F0A8]) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "accountType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", v7);

  }
  return v8;
}

- (BOOL)isExchangeAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;

  -[ECAccount _cachedParentAccount](self, "_cachedParentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C8F080];
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F080]) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "accountType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", v7);

  }
  return v8;
}

- (BOOL)isAOLAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;

  -[ECAccount _cachedParentAccount](self, "_cachedParentAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C8F028];
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0C8F028]) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v3, "accountType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v10, "isEqualToString:", v7);

  }
  return v8;
}

- (BOOL)isPersonaAccount
{
  void *v2;
  BOOL v3;

  -[ECAccount personaIdentifier](self, "personaIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (NSString)authenticationScheme
{
  void *v2;
  void *v3;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF40]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setAuthenticationScheme:(id)a3
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;

  v7 = a3;
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0C8EF40];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF40]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6 != v7 && (objc_msgSend(v7, "isEqualToString:", v6) & 1) == 0)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, v5);

}

- (BOOL)allowInsecureAuthentication
{
  void *v2;
  void *v3;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF38]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "BOOLValue");
  return (char)v2;
}

- (void)setAllowInsecureAuthentication:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C8EF38]);

}

- (BOOL)configureDynamically
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[ECAccount oauthToken](self, "oauthToken");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    -[ECAccount systemAccount](self, "systemAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EF58]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v6, "BOOLValue") ^ 1;
  }
  return v4;
}

- (void)setConfigureDynamically:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  -[ECAccount oauthToken](self, "oauthToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !v3);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[ECAccount systemAccount](self, "systemAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0C8EF58]);

  }
}

- (BOOL)isAuthenticated
{
  void *v2;
  char v3;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAuthenticated");

  return v3;
}

- (void)refresh
{
  id v2;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "refresh");

}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ECAccount;
  -[ECAccount description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECAccount identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ECAccount properties](self, "properties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@> identifier=%@ properties=%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int64_t)numberOfDaysToKeepTrash
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NumberOfDaysToKeepTrash"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (void)setNumberOfDaysToKeepTrash:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (int64_t)numberOfDaysToKeepJunk
{
  void *v2;
  void *v3;
  int64_t v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NumberOfDaysToKeepJunk"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (void)setNumberOfDaysToKeepJunk:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (BOOL)deleteMessagesInPlace
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DeleteMessagesInPlace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setDeleteMessagesInPlace:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:");

}

- (NSString)draftsMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("DraftsMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDraftsMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("DraftsMailboxName"));
}

- (NSString)outboxMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("OutboxMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setOutboxMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("OutboxMailboxName"));
}

- (NSString)sentMessagesMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("SentMessagesMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSentMessagesMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("SentMessagesMailboxName"));
}

- (NSString)trashMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TrashMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTrashMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("TrashMailboxName"));
}

- (NSString)junkMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("JunkMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setJunkMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("JunkMailboxName"));
}

- (NSString)notesMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NotesMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setNotesMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("NotesMailboxName"));
}

- (NSString)toDosMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ToDosMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setToDosMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("ToDosMailboxName"));
}

- (NSString)archiveMailboxName
{
  void *v2;
  void *v3;

  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ArchiveMailboxName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setArchiveMailboxName:(id)a3
{
  -[ECAccount setDataClassProperty:forKey:](self, "setDataClassProperty:forKey:", a3, CFSTR("ArchiveMailboxName"));
}

- (NSDictionary)dataclassProperties
{
  void *v2;
  void *v3;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "propertiesForDataclass:", *MEMORY[0x1E0C8F3D0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (id)dataClassPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setDataClassProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_alloc(MEMORY[0x1E0C99E08]);
  -[ECAccount dataclassProperties](self, "dataclassProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithDictionary:", v8);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, v6);
  -[ECAccount systemAccount](self, "systemAccount");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProperties:forDataclass:", v9, *MEMORY[0x1E0C8F3D0]);

}

- (id)portNumberObject
{
  void *v2;
  void *v3;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8EFD8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)portNumber
{
  void *v2;
  int64_t v3;

  -[ECAccount portNumberObject](self, "portNumberObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (void)setPortNumber:(int64_t)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C8EFD8]);

}

+ (id)standardPorts
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)standardSSLPorts
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (NSArray)standardPorts
{
  return (NSArray *)objc_msgSend((id)objc_opt_class(), "standardPorts");
}

- (NSArray)standardSSLPorts
{
  return (NSArray *)objc_msgSend((id)objc_opt_class(), "standardSSLPorts");
}

- (int64_t)defaultPortNumber
{
  return 0;
}

- (int64_t)defaultSecurePortNumber
{
  return 0;
}

- (id)usesSSLObject
{
  void *v2;
  void *v3;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F000]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)usesSSL
{
  void *v2;
  char v3;

  -[ECAccount usesSSLObject](self, "usesSSLObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (void)setUsesSSL:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C8F000]);

}

- (void)clearUsesSSL
{
  id v2;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0C8F000]);

}

- (BOOL)sslIsDirect
{
  void *v2;
  void *v3;
  char v4;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F008]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (void)setSslIsDirect:(BOOL)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[ECAccount systemAccount](self, "systemAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C8F008]);

}

- (BOOL)setSslIsDirectIsSet
{
  void *v2;
  void *v3;
  BOOL v4;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C8F008]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)clearSSLIsDirect
{
  id v2;

  -[ECAccount systemAccount](self, "systemAccount");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, *MEMORY[0x1E0C8F008]);

}

- (BOOL)_cachedEnabled
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[ECAccount cache](self, "cache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __27__ECAccount__cachedEnabled__block_invoke;
  v6[3] = &unk_1E7120A98;
  v6[4] = self;
  objc_msgSend(v3, "objectForKey:generator:", CFSTR("ECAccountCacheKeyEnabled"), v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "BOOLValue");
  return (char)v3;
}

uint64_t __27__ECAccount__cachedEnabled__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "systemAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x1E0C8F3D0];
  if ((objc_msgSend(v2, "isEnabledForDataclass:", *MEMORY[0x1E0C8F3D0]) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "systemAccount");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "parentAccount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v6, "isEnabledForDataclass:", v3);

  }
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
}

- (void)clearCache
{
  id v2;

  -[ECAccount cache](self, "cache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSString)ef_publicDescription
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternal");

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = objc_opt_class();
  if (v4)
  {
    -[ECAccount accountTypeIdentifier](self, "accountTypeIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ECAccount identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p> accountTypeIdentifier=%@ identifier=%@"), v6, self, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ECAccount identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %p> identifier=%@"), v6, self, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v9;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (NSString)accountDescription
{
  return self->_accountDescription;
}

- (BOOL)sslIsDirectIsSet
{
  return self->_sslIsDirectIsSet;
}

- (NSString)accountDirectoryTildeAbbreviatedPath
{
  return self->_accountDirectoryTildeAbbreviatedPath;
}

- (void)setAccountDirectoryTildeAbbreviatedPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
