@implementation BCNativeOAuth2URLProvider

+ (id)URLProviderWithDictionary:(id)a3
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
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  const char *v35;
  id *v36;
  id obj;
  void *v39;
  void *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("authorizationUrl"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == v5)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("authorizationUrl"));
    v6 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessTokenUrl"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    v41 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("accessTokenUrl"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v10)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clientSecret"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {
    v40 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clientSecret"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("responseType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 == v15)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("responseType"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("responseEncryptionKey"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17 == v18)
  {
    v19 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("responseEncryptionKey"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20 == v21)
  {
    v39 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("scope"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22 == v23)
  {
    v24 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("scope"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!v11)
  {
    v25 = (void *)v6;
    LogCategory_Daemon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v35 = "BCNativeOAuth2URLProvider: Unable to create object. Missing 'client identifier' in payload";
LABEL_53:
    _os_log_error_impl(&dword_21C655000, v26, OS_LOG_TYPE_ERROR, v35, buf, 2u);
    goto LABEL_54;
  }
  if (!v19)
  {
    v25 = (void *)v6;
    LogCategory_Daemon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v35 = "BCNativeOAuth2URLProvider: Unable to create. Missing 'responseEncryptionKey' in payload";
    goto LABEL_53;
  }
  if (!objc_msgSend(v16, "length")
    || (objc_msgSend(v16, "isEqualToString:", CFSTR("code")) & 1) == 0
    && (objc_msgSend(v16, "isEqualToString:", CFSTR("token")) & 1) == 0)
  {
    v25 = (void *)v6;
    LogCategory_Daemon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      goto LABEL_54;
    *(_WORD *)buf = 0;
    v35 = "BCNativeOAuth2URLProvider: Unable to create object. Invalid or missing 'responseType' in payload";
    goto LABEL_53;
  }
  if (!v6)
  {
    v25 = 0;
    LogCategory_Daemon();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v35 = "BCNativeOAuth2URLProvider: Unable to create object. Missing 'authorizationUrl' in payload";
      goto LABEL_53;
    }
LABEL_54:
    v36 = 0;
    goto LABEL_55;
  }
  v25 = (void *)v6;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v26 = objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    LogCategory_Daemon();
    v31 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      goto LABEL_57;
    *(_DWORD *)buf = 138412290;
    v48 = v25;
    v32 = "BCNativeOAuth2URLProvider: Unable to create object. Could not create a valid authorizationURL from string:%@";
    goto LABEL_70;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_42;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v24;
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v27)
    goto LABEL_41;
  v28 = v27;
  v29 = *(_QWORD *)v43;
  while (2)
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v43 != v29)
        objc_enumerationMutation(obj);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "length"))
      {

        if (objc_msgSend(v16, "isEqualToString:", CFSTR("code")) && !objc_msgSend(v41, "length"))
        {
          LogCategory_Daemon();
          v31 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
            goto LABEL_57;
          *(_WORD *)buf = 0;
          v32 = "BCNativeOAuth2URLProvider: Unable to create object. missing 'accessTokenUrl' in payload when responseTyp"
                "e 'code' is specified";
LABEL_44:
          v33 = v31;
          v34 = 2;
LABEL_71:
          _os_log_error_impl(&dword_21C655000, v33, OS_LOG_TYPE_ERROR, v32, buf, v34);
          goto LABEL_57;
        }
        if (objc_msgSend(v16, "isEqualToString:", CFSTR("code")))
        {
          objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v41);
          v31 = objc_claimAutoreleasedReturnValue();
          if (!v31)
          {
            LogCategory_Daemon();
            v31 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              goto LABEL_57;
            *(_DWORD *)buf = 138412290;
            v48 = v41;
            v32 = "BCNativeOAuth2URLProvider: Unable to create object. Could not create a valid accessTokenURL from string:%@";
LABEL_70:
            v33 = v31;
            v34 = 12;
            goto LABEL_71;
          }
        }
        else
        {
          v31 = 0;
        }
        v36 = -[BCNativeOAuth2URLProvider _initWithAuthorizationURL:accessTokenURL:clientSecret:clientIdentifier:responseEncryptionKey:scope:state:responseType:]((id *)[BCNativeOAuth2URLProvider alloc], v26, v31, v40, v11, v19, obj, v39, v16);
        goto LABEL_58;
      }
    }
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v28)
      continue;
    break;
  }
LABEL_41:

LABEL_42:
  LogCategory_Daemon();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    v32 = "BCNativeOAuth2URLProvider: Unable to create object. Missing atleast one 'scope' in payload.";
    goto LABEL_44;
  }
LABEL_57:
  v36 = 0;
LABEL_58:

LABEL_55:
  return v36;
}

- (id)_initWithAuthorizationURL:(void *)a3 accessTokenURL:(void *)a4 clientSecret:(void *)a5 clientIdentifier:(void *)a6 responseEncryptionKey:(void *)a7 scope:(void *)a8 state:(void *)a9 responseType:
{
  id v17;
  id *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a2;
  v25 = a3;
  v24 = a4;
  v23 = a5;
  v22 = a6;
  v21 = a7;
  v20 = a8;
  v17 = a9;
  if (a1)
  {
    v27.receiver = a1;
    v27.super_class = (Class)BCNativeOAuth2URLProvider;
    v18 = (id *)objc_msgSendSuper2(&v27, sel_init);
    a1 = v18;
    if (v18)
    {
      objc_storeStrong(v18 + 7, a2);
      objc_storeStrong(a1 + 8, a3);
      objc_storeStrong(a1 + 2, a4);
      objc_storeStrong(a1 + 1, a5);
      objc_storeStrong(a1 + 5, a9);
      objc_storeStrong(a1 + 6, a6);
      objc_storeStrong(a1 + 4, a8);
      objc_storeStrong(a1 + 3, a7);
    }
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *accessTokenURL;
  id v5;

  accessTokenURL = self->_accessTokenURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", accessTokenURL, CFSTR("accessTokenUrl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizationURL, CFSTR("authorizationUrl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientSecret, CFSTR("clientSecret"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_responseType, CFSTR("responseType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_responseEncryptionKey, CFSTR("responseEncryptionKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scope, CFSTR("scope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));

}

- (BCNativeOAuth2URLProvider)initWithCoder:(id)a3
{
  id v4;
  BCNativeOAuth2URLProvider *v5;
  uint64_t v6;
  NSURL *accessTokenURL;
  uint64_t v8;
  NSURL *authorizationURL;
  uint64_t v10;
  NSString *clientIdentifier;
  uint64_t v12;
  NSString *clientSecret;
  uint64_t v14;
  NSString *responseType;
  uint64_t v16;
  NSString *responseEncryptionKey;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *scope;
  uint64_t v23;
  NSString *state;
  objc_super v26;

  v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BCNativeOAuth2URLProvider;
  v5 = -[BCNativeOAuth2URLProvider init](&v26, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accessTokenUrl"));
    v6 = objc_claimAutoreleasedReturnValue();
    accessTokenURL = v5->_accessTokenURL;
    v5->_accessTokenURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationUrl"));
    v8 = objc_claimAutoreleasedReturnValue();
    authorizationURL = v5->_authorizationURL;
    v5->_authorizationURL = (NSURL *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientSecret"));
    v12 = objc_claimAutoreleasedReturnValue();
    clientSecret = v5->_clientSecret;
    v5->_clientSecret = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseType"));
    v14 = objc_claimAutoreleasedReturnValue();
    responseType = v5->_responseType;
    v5->_responseType = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseEncryptionKey"));
    v16 = objc_claimAutoreleasedReturnValue();
    responseEncryptionKey = v5->_responseEncryptionKey;
    v5->_responseEncryptionKey = (NSString *)v16;

    v18 = (void *)MEMORY[0x24BDBCF20];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("scope"));
    v21 = objc_claimAutoreleasedReturnValue();
    scope = v5->_scope;
    v5->_scope = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v23 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v23;

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)authenticationSessionURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  _QWORD v18[5];

  v18[4] = *MEMORY[0x24BDAC8D0];
  v17 = (void *)-[NSURL copy](self->_authorizationURL, "copy");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v17, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("response_type"), self->_responseType);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("client_id"), self->_clientIdentifier);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("redirect_uri"), CFSTR("https://auth.businesschat.apple.com"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("response_encryption_key"), self->_responseEncryptionKey);
  if (self->_scope)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1838]);
    -[NSArray componentsJoinedByString:](self->_scope, "componentsJoinedByString:", CFSTR(" "));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("scope"), v9);

  }
  else
  {
    v10 = 0;
  }
  if (self->_state)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("state"), self->_state);
  else
    v11 = 0;
  v12 = (void *)MEMORY[0x24BDBCEB8];
  v18[0] = v5;
  v18[1] = v6;
  v18[2] = v7;
  v18[3] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arrayWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_scope)
    objc_msgSend(v14, "addObject:", v10);
  if (self->_state)
    objc_msgSend(v14, "addObject:", v11);
  objc_msgSend(v3, "setQueryItems:", v14);
  objc_msgSend(v3, "URL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)shouldHandleRedirectURI:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "absoluteString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "hasPrefix:", CFSTR("https://auth.businesschat.apple.com"));
  return (char)v3;
}

- (id)tokenExchangeURL
{
  return (id)-[NSURL copy](self->_accessTokenURL, "copy");
}

- (id)tokenExchangeBodyWithCode:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v4 = (objc_class *)MEMORY[0x24BDD1808];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("client_id"), self->_clientIdentifier);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("code"), v5);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("grant_type"), CFSTR("authorization_code"));
  v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("redirect_uri"), CFSTR("https://auth.businesschat.apple.com"));
  v11 = (void *)v10;
  if (self->_clientSecret)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("client_secret"), self->_clientSecret);
    v18[0] = v7;
    v18[1] = v8;
    v18[2] = v9;
    v18[3] = v11;
    v18[4] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQueryItems:", v13);

  }
  else
  {
    v19[0] = v7;
    v19[1] = v8;
    v19[2] = v9;
    v19[3] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setQueryItems:", v12);
  }

  objc_msgSend(v6, "query");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "URLQueryAllowedCharacterSet");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringByAddingPercentEncodingWithAllowedCharacters:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  NSString *clientIdentifier;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  if (self)
    clientIdentifier = self->_clientIdentifier;
  else
    clientIdentifier = 0;
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> clientIdentifier: %@"), v4, self, clientIdentifier);
}

- (id)responseEncryptionKey
{
  return self->_responseEncryptionKey;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessTokenURL, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
  objc_storeStrong((id *)&self->_responseEncryptionKey, 0);
  objc_storeStrong((id *)&self->_responseType, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_clientSecret, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
