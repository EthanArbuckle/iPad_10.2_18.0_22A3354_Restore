@implementation ASAuthorization

+ (ASAuthorization)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (ASAuthorization)init
{
  -[ASAuthorization doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ASAuthorization)initWithProvider:(id)a3 credential:(id)a4
{
  id v7;
  id v8;
  ASAuthorization *v9;
  ASAuthorization *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ASAuthorization;
  v9 = -[ASAuthorization init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_provider, a3);
    objc_storeStrong((id *)&v10->_credential, a4);
  }

  return v10;
}

- (ASAuthorization)initWithCorePlatformKeyCredentialAssertion:(id)a3
{
  id v4;
  ASAuthorizationPlatformPublicKeyCredentialProvider *v5;
  void *v6;
  ASAuthorizationPlatformPublicKeyCredentialProvider *v7;
  ASAuthorizationPlatformPublicKeyCredentialAssertion *v8;
  ASAuthorization *v9;

  v4 = a3;
  v5 = [ASAuthorizationPlatformPublicKeyCredentialProvider alloc];
  objc_msgSend(v4, "relyingPartyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASAuthorizationPlatformPublicKeyCredentialProvider initWithRelyingPartyIdentifier:](v5, "initWithRelyingPartyIdentifier:", v6);

  v8 = -[ASAuthorizationPlatformPublicKeyCredentialAssertion initWithCoreCredential:]([ASAuthorizationPlatformPublicKeyCredentialAssertion alloc], "initWithCoreCredential:", v4);
  v9 = -[ASAuthorization initWithProvider:credential:](self, "initWithProvider:credential:", v7, v8);

  return v9;
}

- (ASAuthorization)initWithCorePlatformKeyCredentialRegistration:(id)a3
{
  id v4;
  ASAuthorizationPlatformPublicKeyCredentialProvider *v5;
  void *v6;
  ASAuthorizationPlatformPublicKeyCredentialProvider *v7;
  ASAuthorizationPlatformPublicKeyCredentialRegistration *v8;
  ASAuthorization *v9;

  v4 = a3;
  v5 = [ASAuthorizationPlatformPublicKeyCredentialProvider alloc];
  objc_msgSend(v4, "relyingPartyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASAuthorizationPlatformPublicKeyCredentialProvider initWithRelyingPartyIdentifier:](v5, "initWithRelyingPartyIdentifier:", v6);

  v8 = -[ASAuthorizationPlatformPublicKeyCredentialRegistration initWithCoreCredential:]([ASAuthorizationPlatformPublicKeyCredentialRegistration alloc], "initWithCoreCredential:", v4);
  v9 = -[ASAuthorization initWithProvider:credential:](self, "initWithProvider:credential:", v7, v8);

  return v9;
}

+ (id)authorizationFromCredential:(id)a3
{
  id v3;
  ASAuthorizationPasswordProvider *v4;
  id v5;
  ASPasswordCredential *v6;
  id v7;
  void *v8;
  ASPasswordCredential *v9;
  void *v10;
  uint64_t v11;
  ASAuthorizationPlatformPublicKeyCredentialProvider *v12;
  void *v13;
  __objc2_class *v14;
  ASAuthorizationPlatformPublicKeyCredentialProvider *v15;
  void *v16;
  ASAuthorizationSecurityKeyPublicKeyCredentialProvider *v17;
  void *v18;
  ASAuthorizationSecurityKeyPublicKeyCredentialProvider *v19;
  void *v20;
  ASAuthorization *v21;
  NSObject *v23;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(ASAuthorizationPasswordProvider);
    v5 = v3;
    v6 = [ASPasswordCredential alloc];
    objc_msgSend(v5, "user");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "password");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[ASPasswordCredential initWithUser:password:](v6, "initWithUser:password:", v7, v8);
LABEL_15:

    v21 = -[ASAuthorization initWithProvider:credential:]([ASAuthorization alloc], "initWithProvider:credential:", v4, v9);
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(ASAuthorizationAppleIDProvider);
    objc_msgSend(v3, "authorization");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "credential");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "authenticationServicesCredential");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_14:
    v9 = (ASPasswordCredential *)v11;
    goto LABEL_15;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v3;
    v12 = [ASAuthorizationPlatformPublicKeyCredentialProvider alloc];
    objc_msgSend(v7, "relyingPartyIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ASAuthorizationPlatformPublicKeyCredentialProvider initWithRelyingPartyIdentifier:](v12, "initWithRelyingPartyIdentifier:", v13);

    v14 = ASAuthorizationPlatformPublicKeyCredentialAssertion;
LABEL_13:
    v11 = objc_msgSend([v14 alloc], "initWithCoreCredential:", v7);
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v3;
    v15 = [ASAuthorizationPlatformPublicKeyCredentialProvider alloc];
    objc_msgSend(v7, "relyingPartyIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ASAuthorizationPlatformPublicKeyCredentialProvider initWithRelyingPartyIdentifier:](v15, "initWithRelyingPartyIdentifier:", v16);

    v14 = ASAuthorizationPlatformPublicKeyCredentialRegistration;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v3;
    v17 = [ASAuthorizationSecurityKeyPublicKeyCredentialProvider alloc];
    objc_msgSend(v7, "relyingPartyIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ASAuthorizationSecurityKeyPublicKeyCredentialProvider initWithRelyingPartyIdentifier:](v17, "initWithRelyingPartyIdentifier:", v18);

    v14 = ASAuthorizationSecurityKeyPublicKeyCredentialAssertion;
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v3;
    v19 = [ASAuthorizationSecurityKeyPublicKeyCredentialProvider alloc];
    objc_msgSend(v7, "relyingPartyIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ASAuthorizationSecurityKeyPublicKeyCredentialProvider initWithRelyingPartyIdentifier:](v19, "initWithRelyingPartyIdentifier:", v20);

    v14 = ASAuthorizationSecurityKeyPublicKeyCredentialRegistration;
    goto LABEL_13;
  }
  v23 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    +[ASAuthorization authorizationFromCredential:].cold.1(v23);
  v21 = 0;
LABEL_16:

  return v21;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { provider: %@ }>"), v5, self, self->_provider);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { provider: %@, credential: %@ }>"), v5, self, self->_provider, self->_credential);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)provider
{
  return self->_provider;
}

- (id)credential
{
  return self->_credential;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_credential, 0);
  objc_storeStrong((id *)&self->_provider, 0);
}

+ (void)authorizationFromCredential:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = 138477827;
  v3 = objc_opt_class();
  _os_log_error_impl(&dword_20E4D9000, v1, OS_LOG_TYPE_ERROR, "Found credential of unexpected type: %{private}@", (uint8_t *)&v2, 0xCu);

}

@end
