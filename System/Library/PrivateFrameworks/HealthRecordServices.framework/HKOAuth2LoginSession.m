@implementation HKOAuth2LoginSession

- (HKOAuth2LoginSession)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDBCE88];
  v4 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

+ (id)new
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB8];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (HKOAuth2LoginSession)initWithState:(id)a3 loginURL:(id)a4 callbackURLComponents:(id)a5 requestedScope:(id)a6 pkceVerifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HKOAuth2LoginSession *v17;
  uint64_t v18;
  NSUUID *state;
  uint64_t v20;
  NSURL *loginURL;
  uint64_t v22;
  NSURLComponents *callbackURLComponents;
  uint64_t v24;
  NSString *requestedScope;
  uint64_t v26;
  NSString *pkceVerifier;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)HKOAuth2LoginSession;
  v17 = -[HKOAuth2LoginSession init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    state = v17->_state;
    v17->_state = (NSUUID *)v18;

    v20 = objc_msgSend(v13, "copy");
    loginURL = v17->_loginURL;
    v17->_loginURL = (NSURL *)v20;

    v22 = objc_msgSend(v14, "copy");
    callbackURLComponents = v17->_callbackURLComponents;
    v17->_callbackURLComponents = (NSURLComponents *)v22;

    v24 = objc_msgSend(v15, "copy");
    requestedScope = v17->_requestedScope;
    v17->_requestedScope = (NSString *)v24;

    v26 = objc_msgSend(v16, "copy");
    pkceVerifier = v17->_pkceVerifier;
    v17->_pkceVerifier = (NSString *)v26;

  }
  return v17;
}

+ (id)generatePKCEVerifierWithAlgorithm:(int64_t)a3
{
  void *v3;
  const __SecRandom *v4;
  size_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  if ((unint64_t)(a3 - 1) > 1)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 32);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (const __SecRandom *)*MEMORY[0x24BDE94B8];
    v5 = objc_msgSend(v3, "length");
    v6 = objc_retainAutorelease(v3);
    if (SecRandomCopyBytes(v4, v5, (void *)objc_msgSend(v6, "mutableBytes")))
    {
      _HKInitializeLogging();
      v7 = (void *)*MEMORY[0x24BDD2FF8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD2FF8], OS_LOG_TYPE_FAULT))
        +[HKOAuth2LoginSession generatePKCEVerifierWithAlgorithm:].cold.1(v7);
      objc_msgSend(MEMORY[0x24BDD1880], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v6, "hk_base64URLEncodedString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v9;
}

+ (id)generatePKCEChallengeFromVerifier:(id)a3 algorithm:(int64_t)a4 error:(id *)a5
{
  id v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    if (a4 == 2)
    {
      objc_msgSend(v7, "dataUsingEncoding:", 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "hk_SHA256");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "hk_base64URLEncodedString");
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else if (a4 == 1)
    {
      v8 = (__CFString *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 125, CFSTR("PKCE algorithm %lu not implemented"), a4);
      v8 = 0;
    }
  }
  else
  {
    v8 = &stru_24D54C670;
  }

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  HKOAuth2LoginSession *v5;
  HKOAuth2LoginSession *v6;
  HKOAuth2LoginSession *v7;
  NSUUID *state;
  NSUUID *v9;
  uint64_t v10;
  void *v11;
  NSUUID *v12;
  void *v13;
  char v14;
  NSURL *loginURL;
  NSURL *v16;
  uint64_t v17;
  NSURL *v18;
  NSURLComponents *callbackURLComponents;
  NSURLComponents *v20;
  uint64_t v21;
  NSURLComponents *v22;
  NSURLComponents *v23;
  uint64_t v24;
  NSURLComponents *v25;
  void *v26;
  NSURL *v27;
  NSString *requestedScope;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSString *v32;
  uint64_t v33;
  NSString *v34;
  void *v35;
  NSString *pkceVerifier;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  NSString *v41;
  void *v42;
  NSURLComponents *v43;
  NSURLComponents *v44;
  void *v46;
  void *v47;
  void *v48;
  NSString *v49;
  NSURLComponents *v50;
  NSString *v51;
  void *v52;
  void *v53;
  NSURL *v54;
  NSURLComponents *v55;
  void *v56;
  void *v57;
  void *v58;

  v5 = (HKOAuth2LoginSession *)a3;
  v6 = v5;
  if (self != v5)
  {
    v7 = v5;
    if (!-[HKOAuth2LoginSession isMemberOfClass:](v7, "isMemberOfClass:", objc_opt_class()))
    {
      v14 = 0;
LABEL_53:

      goto LABEL_54;
    }
    state = self->_state;
    -[HKOAuth2LoginSession state](v7, "state");
    v9 = (NSUUID *)objc_claimAutoreleasedReturnValue();
    if (state != v9)
    {
      -[HKOAuth2LoginSession state](v7, "state");
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v14 = 0;
        goto LABEL_52;
      }
      v11 = (void *)v10;
      v12 = self->_state;
      -[HKOAuth2LoginSession state](v7, "state");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (!-[NSUUID isEqual:](v12, "isEqual:", v13))
      {
        v14 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v58 = v11;
      v57 = v13;
    }
    loginURL = self->_loginURL;
    -[HKOAuth2LoginSession loginURL](v7, "loginURL");
    v16 = (NSURL *)objc_claimAutoreleasedReturnValue();
    if (loginURL != v16)
    {
      -[HKOAuth2LoginSession loginURL](v7, "loginURL");
      v17 = objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
LABEL_32:

LABEL_33:
        v14 = 0;
        goto LABEL_50;
      }
      v56 = (void *)v17;
      v18 = self->_loginURL;
      -[HKOAuth2LoginSession loginURL](v7, "loginURL");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSURL isEqual:](v18, "isEqual:", v3) & 1) == 0)
      {
LABEL_31:

        goto LABEL_32;
      }
    }
    callbackURLComponents = self->_callbackURLComponents;
    -[HKOAuth2LoginSession callbackURLComponents](v7, "callbackURLComponents");
    v20 = (NSURLComponents *)objc_claimAutoreleasedReturnValue();
    v55 = callbackURLComponents;
    if (callbackURLComponents == v20)
    {
      v54 = loginURL;
      v27 = v16;
    }
    else
    {
      -[HKOAuth2LoginSession callbackURLComponents](v7, "callbackURLComponents");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        v53 = v3;
        v14 = 0;
        goto LABEL_47;
      }
      v52 = (void *)v21;
      v54 = loginURL;
      v22 = v20;
      v23 = self->_callbackURLComponents;
      -[HKOAuth2LoginSession callbackURLComponents](v7, "callbackURLComponents");
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v23;
      v26 = (void *)v24;
      if ((-[NSURLComponents isEqual:](v25, "isEqual:", v24) & 1) == 0)
      {

        if (loginURL == v16)
        {

          goto LABEL_33;
        }
        goto LABEL_31;
      }
      v27 = v16;
      v48 = v26;
      v20 = v22;
    }
    requestedScope = self->_requestedScope;
    -[HKOAuth2LoginSession requestedScope](v7, "requestedScope");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v51 = requestedScope;
    v53 = v3;
    if (requestedScope == (NSString *)v29)
    {
      v49 = (NSString *)v29;
      v50 = v20;
      v16 = v27;
    }
    else
    {
      -[HKOAuth2LoginSession requestedScope](v7, "requestedScope");
      v31 = objc_claimAutoreleasedReturnValue();
      if (!v31)
      {
        v14 = 0;
        v16 = v27;
        loginURL = v54;
        v43 = v55;
        goto LABEL_37;
      }
      v47 = (void *)v31;
      v50 = v20;
      v32 = self->_requestedScope;
      -[HKOAuth2LoginSession requestedScope](v7, "requestedScope");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = v32;
      v35 = (void *)v33;
      v16 = v27;
      if (!-[NSString isEqualToString:](v34, "isEqualToString:", v33))
      {

        v14 = 0;
        v20 = v50;
        loginURL = v54;
        v44 = v55;
        goto LABEL_45;
      }
      v46 = v35;
      v49 = (NSString *)v30;
    }
    pkceVerifier = self->_pkceVerifier;
    -[HKOAuth2LoginSession pkceVerifier](v7, "pkceVerifier");
    v37 = objc_claimAutoreleasedReturnValue();
    v14 = pkceVerifier == (NSString *)v37;
    if (pkceVerifier == (NSString *)v37)
    {

      v30 = v49;
      loginURL = v54;
      if (v51 == v49)
        goto LABEL_41;
    }
    else
    {
      v38 = (void *)v37;
      -[HKOAuth2LoginSession pkceVerifier](v7, "pkceVerifier");
      v39 = objc_claimAutoreleasedReturnValue();
      loginURL = v54;
      if (v39)
      {
        v40 = (void *)v39;
        v41 = self->_pkceVerifier;
        -[HKOAuth2LoginSession pkceVerifier](v7, "pkceVerifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSString isEqualToString:](v41, "isEqualToString:", v42);

        if (v51 == v49)
        {

        }
        else
        {

        }
        goto LABEL_44;
      }

      v30 = v49;
      if (v51 == v49)
      {
LABEL_41:

LABEL_44:
        v20 = v50;
        v44 = v55;
LABEL_45:
        if (v44 != v20)
        {
LABEL_46:

        }
LABEL_47:

        if (loginURL != v16)
        {

        }
LABEL_50:
        v13 = v57;
        v11 = v58;
        if (state != v9)
          goto LABEL_51;
LABEL_52:

        goto LABEL_53;
      }
    }

    v20 = v50;
    v43 = v55;
LABEL_37:

    if (v43 == v20)
      goto LABEL_47;
    goto LABEL_46;
  }
  v14 = 1;
LABEL_54:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  v3 = -[NSUUID hash](self->_state, "hash");
  v4 = -[NSURL hash](self->_loginURL, "hash") ^ v3;
  v5 = -[NSURLComponents hash](self->_callbackURLComponents, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_requestedScope, "hash");
  return v6 ^ -[NSString hash](self->_pkceVerifier, "hash");
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *state;
  void *v5;
  id v6;

  state = self->_state;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", state, CFSTR("state"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_loginURL, CFSTR("loginURL"));
  -[NSURLComponents string](self->_callbackURLComponents, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("callbackURLString"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_requestedScope, CFSTR("requestedScope"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_pkceVerifier, CFSTR("pkceVerifier"));

}

- (HKOAuth2LoginSession)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKOAuth2LoginSession *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loginURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callbackURLString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1808], "componentsWithString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestedScope"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pkceVerifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || !v6 || !v7 || !v9)
  {
    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    v13 = *MEMORY[0x24BDD0B88];
    v14 = 4865;
LABEL_9:
    v15 = (void *)objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, v14, 0);
    objc_msgSend(v4, "failWithError:", v15);

    v11 = 0;
    goto LABEL_10;
  }
  if (!v8)
  {
    v12 = objc_alloc(MEMORY[0x24BDD1540]);
    v13 = *MEMORY[0x24BDD0B88];
    v14 = 4866;
    goto LABEL_9;
  }
  self = -[HKOAuth2LoginSession initWithState:loginURL:callbackURLComponents:requestedScope:pkceVerifier:](self, "initWithState:loginURL:callbackURLComponents:requestedScope:pkceVerifier:", v5, v6, v8, v9, v10);
  v11 = self;
LABEL_10:

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)state
{
  return self->_state;
}

- (NSURL)loginURL
{
  return self->_loginURL;
}

- (NSURLComponents)callbackURLComponents
{
  return self->_callbackURLComponents;
}

- (NSString)requestedScope
{
  return self->_requestedScope;
}

- (NSString)pkceVerifier
{
  return self->_pkceVerifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pkceVerifier, 0);
  objc_storeStrong((id *)&self->_requestedScope, 0);
  objc_storeStrong((id *)&self->_callbackURLComponents, 0);
  objc_storeStrong((id *)&self->_loginURL, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

+ (void)generatePKCEVerifierWithAlgorithm:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl(&dword_2163C4000, v1, OS_LOG_TYPE_FAULT, "HKOAuth2LoginSession.generatePKCEVerifierWithAlgorithm failed, will fall back to NSUUID. Error: %d", (uint8_t *)v3, 8u);

}

@end
