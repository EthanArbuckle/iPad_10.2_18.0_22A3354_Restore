@implementation ASPasskeyCredentialRequest

- (ASPasskeyCredentialRequest)initWithLoginChoice:(id)a3 registrationExtensionInput:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  ASPasskeyCredentialRequest *v14;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "excludedCredentials");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safari_mapObjectsUsingBlock:", &__block_literal_global_29);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASPasskeyCredentialIdentity _initWithLoginChoice:]([ASPasskeyCredentialIdentity alloc], "_initWithLoginChoice:", v7);
  objc_msgSend(v7, "clientDataHash");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userVerificationPreference");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "supportedAlgorithms");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[ASPasskeyCredentialRequest _initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:](self, "_initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:", v10, v11, v12, v13, 2, v9, v6, 0);
  return v14;
}

ASAuthorizationPlatformPublicKeyCredentialDescriptor *__77__ASPasskeyCredentialRequest_initWithLoginChoice_registrationExtensionInput___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ASAuthorizationPlatformPublicKeyCredentialDescriptor *v3;
  void *v4;
  ASAuthorizationPlatformPublicKeyCredentialDescriptor *v5;

  v2 = a2;
  v3 = [ASAuthorizationPlatformPublicKeyCredentialDescriptor alloc];
  objc_msgSend(v2, "credentialID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[ASAuthorizationPlatformPublicKeyCredentialDescriptor initWithCredentialID:](v3, "initWithCredentialID:", v4);
  return v5;
}

- (ASPasskeyCredentialRequest)initWithLoginChoice:(id)a3 assertionExtensionInput:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  ASPasskeyCredentialRequest *v12;

  v6 = a4;
  v7 = a3;
  v8 = -[ASPasskeyCredentialIdentity _initWithLoginChoice:]([ASPasskeyCredentialIdentity alloc], "_initWithLoginChoice:", v7);
  objc_msgSend(v7, "clientDataHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userVerificationPreference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "supportedAlgorithms");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ASPasskeyCredentialRequest _initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:](self, "_initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:", v8, v9, v10, v11, 1, 0, 0, v6);
  return v12;
}

- (ASPasskeyCredentialRequest)initWithCredentialIdentity:(ASPasskeyCredentialIdentity *)credentialIdentity clientDataHash:(NSData *)clientDataHash userVerificationPreference:(ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference supportedAlgorithms:(NSArray *)supportedAlgorithms
{
  return (ASPasskeyCredentialRequest *)-[ASPasskeyCredentialRequest _initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:](self, "_initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:", credentialIdentity, clientDataHash, userVerificationPreference, supportedAlgorithms, 1, 0, 0, 0);
}

- (ASPasskeyCredentialRequest)initWithCredentialIdentity:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 supportedAlgorithms:(id)a6 assertionExtensionInput:(id)a7
{
  return (ASPasskeyCredentialRequest *)-[ASPasskeyCredentialRequest _initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:](self, "_initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:", a3, a4, a5, a6, 1, 0, 0, a7);
}

- (ASPasskeyCredentialRequest)initWithCredentialIdentity:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 supportedAlgorithms:(id)a6 registrationExtensionInput:(id)a7
{
  return (ASPasskeyCredentialRequest *)-[ASPasskeyCredentialRequest _initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:](self, "_initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:", a3, a4, a5, a6, 2, 0, a7, 0);
}

- (id)_initWithCredentialIdentity:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 supportedAlgorithms:(id)a6 credentialType:(int64_t)a7 excludedCredentials:(id)a8 registrationExtensionInput:(id)a9 assertionExtensionInput:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  ASPasskeyCredentialRequest *v22;
  uint64_t v23;
  ASCredentialIdentity *credentialIdentity;
  uint64_t v25;
  NSData *clientDataHash;
  uint64_t v27;
  NSString *userVerificationPreference;
  uint64_t v29;
  NSArray *supportedAlgorithms;
  uint64_t v31;
  NSArray *excludedCredentials;
  ASPasskeyCredentialRequest *v33;
  objc_super v36;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  v36.receiver = self;
  v36.super_class = (Class)ASPasskeyCredentialRequest;
  v22 = -[ASPasskeyCredentialRequest init](&v36, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    credentialIdentity = v22->_credentialIdentity;
    v22->_credentialIdentity = (ASCredentialIdentity *)v23;

    v25 = objc_msgSend(v16, "copy");
    clientDataHash = v22->_clientDataHash;
    v22->_clientDataHash = (NSData *)v25;

    v27 = objc_msgSend(v17, "copy");
    userVerificationPreference = v22->_userVerificationPreference;
    v22->_userVerificationPreference = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    supportedAlgorithms = v22->_supportedAlgorithms;
    v22->_supportedAlgorithms = (NSArray *)v29;

    v22->_credentialType = a7;
    v31 = objc_msgSend(v19, "copy");
    excludedCredentials = v22->_excludedCredentials;
    v22->_excludedCredentials = (NSArray *)v31;

    objc_storeStrong((id *)&v22->_registrationExtensionInput, a9);
    objc_storeStrong((id *)&v22->_assertionExtensionInput, a10);
    v33 = v22;
  }

  return v22;
}

+ (ASPasskeyCredentialRequest)requestWithCredentialIdentity:(ASPasskeyCredentialIdentity *)credentialIdentity clientDataHash:(NSData *)clientDataHash userVerificationPreference:(ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference supportedAlgorithms:(NSArray *)supportedAlgorithms
{
  NSArray *v10;
  NSString *v11;
  NSData *v12;
  ASPasskeyCredentialIdentity *v13;
  void *v14;

  v10 = supportedAlgorithms;
  v11 = userVerificationPreference;
  v12 = clientDataHash;
  v13 = credentialIdentity;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:", v13, v12, v11, v10);

  return (ASPasskeyCredentialRequest *)v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  ASCredentialIdentity *credentialIdentity;
  id v5;

  credentialIdentity = self->_credentialIdentity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", credentialIdentity, CFSTR("credentialIdentity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientDataHash, CFSTR("clientDataHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userVerificationPreference, CFSTR("userVerificationPreference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedAlgorithms, CFSTR("supportedAlgorithms"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_credentialType, CFSTR("credentialType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludedCredentials, CFSTR("excludedCredentials"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_registrationExtensionInput, CFSTR("registrationExtensionInput"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assertionExtensionInput, CFSTR("assertionExtensionInput"));

}

- (ASPasskeyCredentialRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  ASPasskeyCredentialRequest *v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialIdentity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDataHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userVerificationPreference"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("supportedAlgorithms"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credentialType"));
  v10 = (void *)MEMORY[0x24BDBCF20];
  v11 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("excludedCredentials"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("registrationExtensionInput"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assertionExtensionInput"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[ASPasskeyCredentialRequest _initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:](self, "_initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:", v5, v6, v7, v8, v9, v13, v14, v15);
  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASPasskeyCredentialRequest _initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:](+[ASPasskeyCredentialRequest allocWithZone:](ASPasskeyCredentialRequest, "allocWithZone:", a3), "_initWithCredentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:credentialType:excludedCredentials:registrationExtensionInput:assertionExtensionInput:", self->_credentialIdentity, self->_clientDataHash, self->_userVerificationPreference, self->_supportedAlgorithms, self->_credentialType, self->_excludedCredentials, self->_registrationExtensionInput, self->_assertionExtensionInput);
}

- (ASCredentialIdentity)credentialIdentity
{
  return self->_credentialIdentity;
}

- (int64_t)type
{
  return self->_credentialType;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference
{
  return self->_userVerificationPreference;
}

- (void)setUserVerificationPreference:(ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference
{
  objc_storeStrong((id *)&self->_userVerificationPreference, userVerificationPreference);
}

- (NSArray)supportedAlgorithms
{
  return self->_supportedAlgorithms;
}

- (NSArray)excludedCredentials
{
  return self->_excludedCredentials;
}

- (ASPasskeyAssertionCredentialExtensionInput)assertionExtensionInput
{
  return self->_assertionExtensionInput;
}

- (ASPasskeyRegistrationCredentialExtensionInput)registrationExtensionInput
{
  return self->_registrationExtensionInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationExtensionInput, 0);
  objc_storeStrong((id *)&self->_assertionExtensionInput, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);
  objc_storeStrong((id *)&self->_supportedAlgorithms, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_credentialIdentity, 0);
}

@end
