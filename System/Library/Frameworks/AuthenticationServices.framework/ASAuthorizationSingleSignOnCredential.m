@implementation ASAuthorizationSingleSignOnCredential

+ (id)emptyCredential
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithAuthenticatedResponse:", 0);
}

+ (ASAuthorizationSingleSignOnCredential)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ASAuthorizationSingleSignOnCredential)init
{
  -[ASAuthorizationSingleSignOnCredential doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ASAuthorizationSingleSignOnCredential)initWithAuthenticatedResponse:(id)a3
{
  id v4;
  ASAuthorizationSingleSignOnCredential *v5;
  uint64_t v6;
  NSArray *privateKeys;
  ASAuthorizationSingleSignOnCredential *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationSingleSignOnCredential;
  v5 = -[ASAuthorizationSingleSignOnCredential init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    privateKeys = v5->_privateKeys;
    v5->_privateKeys = (NSArray *)v6;

    if (v4)
      -[ASAuthorizationSingleSignOnCredential _initWithAuthenticatedResponse:](v5, "_initWithAuthenticatedResponse:", v4);
    v8 = v5;
  }

  return v5;
}

- (ASAuthorizationSingleSignOnCredential)initWithAuthenticatedResponse:(id)a3 privateKeys:(id)a4
{
  id v6;
  id v7;
  ASAuthorizationSingleSignOnCredential *v8;
  NSArray *v9;
  NSArray *privateKeys;
  ASAuthorizationSingleSignOnCredential *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ASAuthorizationSingleSignOnCredential;
  v8 = -[ASAuthorizationSingleSignOnCredential init](&v13, sel_init);
  if (v8)
  {
    if (v7)
    {
      v9 = (NSArray *)v7;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    privateKeys = v8->_privateKeys;
    v8->_privateKeys = v9;

    if (v6)
      -[ASAuthorizationSingleSignOnCredential _initWithAuthenticatedResponse:](v8, "_initWithAuthenticatedResponse:", v6);
    v11 = v8;
  }

  return v8;
}

- (void)_initWithAuthenticatedResponse:(id)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_storeStrong((id *)&self->_authenticatedResponse, a3);
  v6 = a3;
  objc_msgSend(v6, "allHeaderFields");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__ASAuthorizationSingleSignOnCredential__initWithAuthenticatedResponse___block_invoke;
  v7[3] = &unk_24C950DB8;
  v7[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __72__ASAuthorizationSingleSignOnCredential__initWithAuthenticatedResponse___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;

  v17 = a2;
  v5 = a3;
  if (objc_msgSend(v17, "isEqualToString:", CFSTR("state")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = *(_QWORD *)(a1 + 32);
      v7 = v5;
      v8 = *(void **)(v6 + 8);
      *(_QWORD *)(v6 + 8) = v7;
LABEL_14:

    }
  }
  else if (objc_msgSend(v17, "isEqualToString:", CFSTR("access_token")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v10 + 16);
      *(_QWORD *)(v10 + 16) = v9;
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = v5;
      v8 = *(void **)(v13 + 16);
      *(_QWORD *)(v13 + 16) = v14;
      goto LABEL_14;
    }
  }
  else if (objc_msgSend(v17, "isEqualToString:", CFSTR("id_token")))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "dataUsingEncoding:", 4);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v12 + 24);
      *(_QWORD *)(v12 + 24) = v11;
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = *(_QWORD *)(a1 + 32);
      v16 = v5;
      v8 = *(void **)(v15 + 24);
      *(_QWORD *)(v15 + 24) = v16;
      goto LABEL_14;
    }
  }

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, state: %@, accessToken: %@, identityToken: %@, authorizedScopes: %@, authenticatedResponse: %@, privateKeys: %@>"), v5, self, self->_state, self->_accessToken, self->_identityToken, self->_authorizedScopes, self->_authenticatedResponse, self->_privateKeys);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)state
{
  return self->_state;
}

- (NSData)accessToken
{
  return self->_accessToken;
}

- (NSData)identityToken
{
  return self->_identityToken;
}

- (NSArray)authorizedScopes
{
  return self->_authorizedScopes;
}

- (NSHTTPURLResponse)authenticatedResponse
{
  return self->_authenticatedResponse;
}

- (NSArray)privateKeys
{
  return self->_privateKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateKeys, 0);
  objc_storeStrong((id *)&self->_authenticatedResponse, 0);
  objc_storeStrong((id *)&self->_authorizedScopes, 0);
  objc_storeStrong((id *)&self->_identityToken, 0);
  objc_storeStrong((id *)&self->_accessToken, 0);
  objc_storeStrong((id *)&self->_state, 0);
}

@end
