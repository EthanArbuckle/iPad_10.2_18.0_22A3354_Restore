@implementation ASPasskeyCredentialRequestParameters

- (ASPasskeyCredentialRequestParameters)initWithRelyingPartyIdentifier:(id)a3 clientDataHash:(id)a4 userVerificationPreference:(id)a5 allowedCredentials:(id)a6 extensionInput:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  ASPasskeyCredentialRequestParameters *v17;
  uint64_t v18;
  NSString *relyingPartyIdentifier;
  uint64_t v20;
  NSData *clientDataHash;
  uint64_t v22;
  NSString *userVerificationPreference;
  uint64_t v24;
  NSArray *allowedCredentials;
  uint64_t v26;
  ASPasskeyAssertionCredentialExtensionInput *extensionInput;
  ASPasskeyCredentialRequestParameters *v28;
  objc_super v30;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)ASPasskeyCredentialRequestParameters;
  v17 = -[ASPasskeyCredentialRequestParameters init](&v30, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    relyingPartyIdentifier = v17->_relyingPartyIdentifier;
    v17->_relyingPartyIdentifier = (NSString *)v18;

    v20 = objc_msgSend(v13, "copy");
    clientDataHash = v17->_clientDataHash;
    v17->_clientDataHash = (NSData *)v20;

    v22 = objc_msgSend(v14, "copy");
    userVerificationPreference = v17->_userVerificationPreference;
    v17->_userVerificationPreference = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    allowedCredentials = v17->_allowedCredentials;
    v17->_allowedCredentials = (NSArray *)v24;

    v26 = objc_msgSend(v16, "copy");
    extensionInput = v17->_extensionInput;
    v17->_extensionInput = (ASPasskeyAssertionCredentialExtensionInput *)v26;

    v28 = v17;
  }

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relyingPartyIdentifier;
  id v5;

  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientDataHash, CFSTR("clientDataHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userVerificationPreference, CFSTR("userVerificationPreference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowedCredentials, CFSTR("allowedCredentials"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionInput, CFSTR("extensionInput"));

}

- (ASPasskeyCredentialRequestParameters)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ASPasskeyCredentialRequestParameters *v10;
  uint64_t v11;
  ASPasskeyAssertionCredentialExtensionInput *extensionInput;
  ASPasskeyCredentialRequestParameters *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDataHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userVerificationPreference"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("allowedCredentials"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionInput"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASPasskeyCredentialRequestParameters initWithRelyingPartyIdentifier:clientDataHash:userVerificationPreference:allowedCredentials:extensionInput:](self, "initWithRelyingPartyIdentifier:clientDataHash:userVerificationPreference:allowedCredentials:extensionInput:", v5, v6, v7, v8, v9);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    extensionInput = v10->_extensionInput;
    v10->_extensionInput = (ASPasskeyAssertionCredentialExtensionInput *)v11;

    v13 = v10;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[ASPasskeyCredentialRequestParameters initWithRelyingPartyIdentifier:clientDataHash:userVerificationPreference:allowedCredentials:extensionInput:](+[ASPasskeyCredentialRequestParameters allocWithZone:](ASPasskeyCredentialRequestParameters, "allocWithZone:", a3), "initWithRelyingPartyIdentifier:clientDataHash:userVerificationPreference:allowedCredentials:extensionInput:", self->_relyingPartyIdentifier, self->_clientDataHash, self->_userVerificationPreference, self->_allowedCredentials, self->_extensionInput);
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (ASAuthorizationPublicKeyCredentialUserVerificationPreference)userVerificationPreference
{
  return self->_userVerificationPreference;
}

- (NSArray)allowedCredentials
{
  return self->_allowedCredentials;
}

- (ASPasskeyAssertionCredentialExtensionInput)extensionInput
{
  return self->_extensionInput;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionInput, 0);
  objc_storeStrong((id *)&self->_allowedCredentials, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end
