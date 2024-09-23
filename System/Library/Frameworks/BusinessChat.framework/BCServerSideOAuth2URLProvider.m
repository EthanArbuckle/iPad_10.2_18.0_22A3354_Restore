@implementation BCServerSideOAuth2URLProvider

+ (id)URLProviderWithDictionary:(id)a3
{
  id v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  id *v28;
  NSObject *v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  char v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  uint8_t v57[128];
  uint8_t buf[4];
  void *v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
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
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == v8)
  {
    v52 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("redirectURI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == v10)
  {
    v11 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("redirectURI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("scope"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("scope"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 == v16)
  {
    v17 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("state"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("responseType"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18 == v19)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("responseType"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("additionalParameters"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21 == v22)
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("additionalParameters"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (!objc_msgSend(v6, "length"))
  {
    LogCategory_Daemon();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_21C655000, v24, OS_LOG_TYPE_ERROR, "BCServerSideOAuth2URLProvider: Unable to create object. Missing 'authorizationUrl' in payload.", buf, 2u);
    }
    v28 = 0;
    goto LABEL_60;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v6);
  v24 = objc_claimAutoreleasedReturnValue();
  if (!v24)
  {
    LogCategory_Daemon();
    v29 = objc_claimAutoreleasedReturnValue();
    v51 = v29;
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_58;
    *(_DWORD *)buf = 138412290;
    v59 = v6;
    v30 = "BCNativeOAuth2URLProvider: Unable to create object. Could not create a valid authorizationURL from string:%@";
    v31 = v29;
    v32 = 12;
LABEL_34:
    _os_log_error_impl(&dword_21C655000, v31, OS_LOG_TYPE_ERROR, v30, buf, v32);
    goto LABEL_58;
  }
  if (!objc_msgSend(v11, "length"))
  {
    LogCategory_Daemon();
    v33 = objc_claimAutoreleasedReturnValue();
    v51 = v33;
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_58;
    *(_WORD *)buf = 0;
    v30 = "BCServerSideOAuth2URLProvider: Unable to create object. Missing 'redirectURI' in payload.";
    v31 = v33;
    v32 = 2;
    goto LABEL_34;
  }
  v50 = v24;
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v11);
  v25 = objc_claimAutoreleasedReturnValue();
  -[NSObject scheme](v25, "scheme");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "lowercaseString");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v25;
  if (objc_msgSend(v27, "isEqualToString:", CFSTR("http")))
  {

  }
  else
  {
    -[NSObject scheme](v25, "scheme");
    v46 = v23;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "lowercaseString");
    v48 = v20;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v35, "isEqualToString:", CFSTR("https"));

    v23 = v46;
    if ((v45 & 1) == 0)
    {
      LogCategory_Daemon();
      v41 = objc_claimAutoreleasedReturnValue();
      v24 = v50;
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        -[NSObject scheme](v51, "scheme");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v59 = v43;
        _os_log_error_impl(&dword_21C655000, v41, OS_LOG_TYPE_ERROR, "BCServerSideOAuth2URLProvider: Unable to create object. Unsupported scheme '%@' for redirect URI", buf, 0xCu);

        v20 = v48;
      }
      goto LABEL_57;
    }
  }
  v24 = v50;
  if (objc_msgSend(v52, "length"))
  {
    if (objc_msgSend(v20, "length")
      && ((objc_msgSend(v20, "isEqualToString:", CFSTR("code")) & 1) != 0
       || (objc_msgSend(v20, "isEqualToString:", CFSTR("token")) & 1) != 0))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v47 = v23;
        v49 = v20;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        v36 = v14;
        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v54;
LABEL_43:
          v40 = 0;
          while (1)
          {
            if (*(_QWORD *)v54 != v39)
              objc_enumerationMutation(v36);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * v40), "length"))
              break;
            if (v38 == ++v40)
            {
              v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v57, 16);
              if (v38)
                goto LABEL_43;
              goto LABEL_49;
            }
          }

          if (objc_msgSend(v17, "length"))
          {
            v24 = v50;
            v23 = v47;
            v20 = v49;
            v28 = -[BCServerSideOAuth2URLProvider _initWithAuthorizationURL:clientIdentifier:redirectURI:scope:state:responseType:additionalParameters:]((id *)[BCServerSideOAuth2URLProvider alloc], v50, v52, v51, v36, v17, v49, v47);
            goto LABEL_59;
          }
          LogCategory_Daemon();
          v41 = objc_claimAutoreleasedReturnValue();
          v23 = v47;
          v20 = v49;
          v24 = v50;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v42 = "BCServerSideOAuth2URLProvider: Unable to create object. Missing 'scope' in payload";
            goto LABEL_66;
          }
          goto LABEL_57;
        }
LABEL_49:

        v23 = v47;
        v20 = v49;
        v24 = v50;
      }
      LogCategory_Daemon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v42 = "BCServerSideOAuth2URLProvider: Unable to create object. Missing atleast one 'scope' in payload.";
LABEL_66:
        _os_log_error_impl(&dword_21C655000, v41, OS_LOG_TYPE_ERROR, v42, buf, 2u);
      }
    }
    else
    {
      LogCategory_Daemon();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v42 = "BCServerSideOAuth2URLProvider: Unable to create object. Invalid or nil 'responseType' in payload";
        goto LABEL_66;
      }
    }
  }
  else
  {
    LogCategory_Daemon();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v42 = "BCServerSideOAuth2URLProvider: Unable to create object. Missing 'clientIdentifier' in payload.";
      goto LABEL_66;
    }
  }
LABEL_57:

LABEL_58:
  v28 = 0;
LABEL_59:

LABEL_60:
  return v28;
}

- (id)_initWithAuthorizationURL:(void *)a3 clientIdentifier:(void *)a4 redirectURI:(void *)a5 scope:(void *)a6 state:(void *)a7 responseType:(void *)a8 additionalParameters:
{
  id v16;
  id v17;
  id *v18;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a2;
  v23 = a3;
  v22 = a4;
  v21 = a5;
  v20 = a6;
  v16 = a7;
  v17 = a8;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)BCServerSideOAuth2URLProvider;
    v18 = (id *)objc_msgSendSuper2(&v25, sel_init);
    a1 = v18;
    if (v18)
    {
      objc_storeStrong(v18 + 2, a2);
      objc_storeStrong(a1 + 6, a7);
      objc_storeStrong(a1 + 3, a3);
      objc_storeStrong(a1 + 5, a6);
      objc_storeStrong(a1 + 4, a5);
      objc_storeStrong(a1 + 1, a4);
      objc_storeStrong(a1 + 7, a8);
    }
  }

  return a1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *additionalParameters;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", self->_authorizationURL, CFSTR("authorizationUrl"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_responseType, CFSTR("responseType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_scope, CFSTR("scope"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_redirectURI, CFSTR("redirectURI"));
  additionalParameters = self->_additionalParameters;
  if (additionalParameters)
    objc_msgSend(v5, "encodeObject:forKey:", additionalParameters, CFSTR("additionalParameters"));

}

- (BCServerSideOAuth2URLProvider)initWithCoder:(id)a3
{
  id v4;
  BCServerSideOAuth2URLProvider *v5;
  uint64_t v6;
  NSURL *authorizationURL;
  uint64_t v8;
  NSString *clientIdentifier;
  uint64_t v10;
  NSString *responseType;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *scope;
  uint64_t v17;
  NSString *state;
  uint64_t v19;
  NSURL *redirectURI;
  uint64_t v21;
  NSString *additionalParameters;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BCServerSideOAuth2URLProvider;
  v5 = -[BCServerSideOAuth2URLProvider init](&v24, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authorizationUrl"));
    v6 = objc_claimAutoreleasedReturnValue();
    authorizationURL = v5->_authorizationURL;
    v5->_authorizationURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseType"));
    v10 = objc_claimAutoreleasedReturnValue();
    responseType = v5->_responseType;
    v5->_responseType = (NSString *)v10;

    v12 = (void *)MEMORY[0x24BDBCF20];
    v13 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("scope"));
    v15 = objc_claimAutoreleasedReturnValue();
    scope = v5->_scope;
    v5->_scope = (NSArray *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
    v17 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("redirectURI"));
    v19 = objc_claimAutoreleasedReturnValue();
    redirectURI = v5->_redirectURI;
    v5->_redirectURI = (NSURL *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("additionalParameters"));
    v21 = objc_claimAutoreleasedReturnValue();
    additionalParameters = v5->_additionalParameters;
    v5->_additionalParameters = (NSString *)v21;

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
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *scope;
  objc_class *v11;
  NSArray *v12;
  id v13;
  void *v14;
  void *v15;
  NSString *state;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v28 = (void *)-[NSURL copy](self->_authorizationURL, "copy");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", v28, 0);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("response_type"), self->_responseType);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1838]), "initWithName:value:", CFSTR("client_id"), self->_clientIdentifier);
  v6 = objc_alloc(MEMORY[0x24BDD1838]);
  -[BCServerSideOAuth2URLProvider redirectURI](self, "redirectURI");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "absoluteString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("redirect_uri"), v8);

  scope = self->_scope;
  if (scope)
  {
    v11 = (objc_class *)MEMORY[0x24BDD1838];
    v12 = scope;
    v13 = [v11 alloc];
    -[NSArray componentsJoinedByString:](self->_scope, "componentsJoinedByString:", CFSTR(" "));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("scope"), v14);

  }
  else
  {
    v15 = 0;
  }
  state = self->_state;
  if (state)
  {
    v17 = (objc_class *)MEMORY[0x24BDD1838];
    v18 = state;
    v19 = (void *)objc_msgSend([v17 alloc], "initWithName:value:", CFSTR("state"), self->_state);

  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)MEMORY[0x24BDBCEB8];
  v29[0] = v5;
  v29[1] = v9;
  v29[2] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "arrayWithArray:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_scope)
    objc_msgSend(v22, "addObject:", v15);
  if (self->_state)
    objc_msgSend(v22, "addObject:", v19);
  if (-[NSString length](self->_additionalParameters, "length"))
  {
    objc_msgSend(CFSTR("?"), "stringByAppendingString:", self->_additionalParameters);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithString:", v23);
    objc_msgSend(v24, "queryItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObjectsFromArray:", v25);

  }
  objc_msgSend(v3, "setQueryItems:", v22);
  objc_msgSend(v3, "URL");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)shouldHandleRedirectURI:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "scheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "isEqualToString:", CFSTR("messages-auth"));
  return (char)v3;
}

- (NSString)debugDescription
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  if (self)
  {
    objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "authenticationSessionURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("Authorization URL"));

    objc_msgSend(v3, "build");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v2;
}

- (NSURL)redirectURI
{
  return self->_redirectURI;
}

- (void)setRedirectURI:(id)a3
{
  objc_storeStrong((id *)&self->_redirectURI, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalParameters, 0);
  objc_storeStrong((id *)&self->_responseType, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_scope, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_authorizationURL, 0);
  objc_storeStrong((id *)&self->_redirectURI, 0);
}

@end
