@implementation ASPasskeyRegistrationCredential

- (ASPasskeyRegistrationCredential)initWithRelyingParty:(NSString *)relyingParty clientDataHash:(NSData *)clientDataHash credentialID:(NSData *)credentialID attestationObject:(NSData *)attestationObject
{
  NSString *v10;
  NSData *v11;
  NSData *v12;
  NSData *v13;
  ASPasskeyRegistrationCredential *v14;
  uint64_t v15;
  NSString *v16;
  uint64_t v17;
  NSData *v18;
  uint64_t v19;
  NSData *v20;
  uint64_t v21;
  NSData *v22;
  ASPasskeyRegistrationCredential *v23;
  objc_super v25;

  v10 = relyingParty;
  v11 = clientDataHash;
  v12 = credentialID;
  v13 = attestationObject;
  v25.receiver = self;
  v25.super_class = (Class)ASPasskeyRegistrationCredential;
  v14 = -[ASPasskeyRegistrationCredential init](&v25, sel_init);
  if (v14)
  {
    v15 = -[NSString copy](v10, "copy");
    v16 = v14->_relyingParty;
    v14->_relyingParty = (NSString *)v15;

    v17 = -[NSData copy](v11, "copy");
    v18 = v14->_clientDataHash;
    v14->_clientDataHash = (NSData *)v17;

    v19 = -[NSData copy](v12, "copy");
    v20 = v14->_credentialID;
    v14->_credentialID = (NSData *)v19;

    v21 = -[NSData copy](v13, "copy");
    v22 = v14->_attestationObject;
    v14->_attestationObject = (NSData *)v21;

    v23 = v14;
  }

  return v14;
}

- (ASPasskeyRegistrationCredential)initWithRelyingParty:(id)a3 clientDataHash:(id)a4 credentialID:(id)a5 attestationObject:(id)a6 extensionOutput:(id)a7
{
  id v12;
  ASPasskeyRegistrationCredential *v13;
  uint64_t v14;
  ASPasskeyRegistrationCredentialExtensionOutput *extensionOutput;
  ASPasskeyRegistrationCredential *v16;

  v12 = a7;
  v13 = -[ASPasskeyRegistrationCredential initWithRelyingParty:clientDataHash:credentialID:attestationObject:](self, "initWithRelyingParty:clientDataHash:credentialID:attestationObject:", a3, a4, a5, a6);
  if (v13)
  {
    v14 = objc_msgSend(v12, "copy");
    extensionOutput = v13->_extensionOutput;
    v13->_extensionOutput = (ASPasskeyRegistrationCredentialExtensionOutput *)v14;

    v16 = v13;
  }

  return v13;
}

+ (ASPasskeyRegistrationCredential)credentialWithRelyingParty:(NSString *)relyingParty clientDataHash:(NSData *)clientDataHash credentialID:(NSData *)credentialID attestationObject:(NSData *)attestationObject
{
  NSData *v10;
  NSData *v11;
  NSData *v12;
  NSString *v13;
  void *v14;

  v10 = attestationObject;
  v11 = credentialID;
  v12 = clientDataHash;
  v13 = relyingParty;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRelyingParty:clientDataHash:credentialID:attestationObject:", v13, v12, v11, v10);

  return (ASPasskeyRegistrationCredential *)v14;
}

+ (NSArray)_defaultTransports
{
  return (NSArray *)&unk_24C96DF90;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRelyingParty:clientDataHash:credentialID:attestationObject:", self->_relyingParty, self->_clientDataHash, self->_credentialID, self->_attestationObject);
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relyingParty;
  id v5;

  relyingParty = self->_relyingParty;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relyingParty, CFSTR("relyingParty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientDataHash, CFSTR("clientDataHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestationObject, CFSTR("attestationObject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionOutput, CFSTR("extensionOutput"));

}

- (ASPasskeyRegistrationCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ASPasskeyRegistrationCredential *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingParty"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDataHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attestationObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionOutput"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[ASPasskeyRegistrationCredential initWithRelyingParty:clientDataHash:credentialID:attestationObject:extensionOutput:](self, "initWithRelyingParty:clientDataHash:credentialID:attestationObject:extensionOutput:", v5, v6, v7, v8, v9);
  return v10;
}

- (NSString)relyingParty
{
  return self->_relyingParty;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSData)attestationObject
{
  return self->_attestationObject;
}

- (ASPasskeyRegistrationCredentialExtensionOutput)extensionOutput
{
  return self->_extensionOutput;
}

- (void)setExtensionOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionOutput, 0);
  objc_storeStrong((id *)&self->_attestationObject, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
}

- (BOOL)_validateWithError:(id *)a3
{
  ASPasskeyRegistrationCredential *v3;

  v3 = self;
  sub_20E550B5C();

  return 1;
}

- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)coreExtensions
{
  ASPasskeyRegistrationCredential *v2;
  ASPasskeyRegistrationCredentialExtensionOutput *v3;
  ASPasskeyRegistrationCredential *v4;
  id v5;

  v2 = self;
  v3 = -[ASPasskeyRegistrationCredential extensionOutput](v2, sel_extensionOutput);
  if (v3)
  {
    v4 = (ASPasskeyRegistrationCredential *)v3;
    v5 = objc_retain(*(id *)((char *)&v3->super.isa
                           + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions));

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs *)v5;
}

@end
