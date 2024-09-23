@implementation ASPasskeyAssertionCredential

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASPasskeyAssertionCredential)initWithUserHandle:(NSData *)userHandle relyingParty:(NSString *)relyingParty signature:(NSData *)signature clientDataHash:(NSData *)clientDataHash authenticatorData:(NSData *)authenticatorData credentialID:(NSData *)credentialID
{
  return -[ASPasskeyAssertionCredential initWithUserHandle:relyingParty:signature:clientDataHash:authenticatorData:credentialID:extensionOutput:](self, "initWithUserHandle:relyingParty:signature:clientDataHash:authenticatorData:credentialID:extensionOutput:", userHandle, relyingParty, signature, clientDataHash, authenticatorData, credentialID, 0);
}

- (ASPasskeyAssertionCredential)initWithUserHandle:(id)a3 relyingParty:(id)a4 signature:(id)a5 clientDataHash:(id)a6 authenticatorData:(id)a7 credentialID:(id)a8 extensionOutput:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  ASPasskeyAssertionCredential *v22;
  uint64_t v23;
  NSData *userHandle;
  uint64_t v25;
  NSString *relyingParty;
  uint64_t v27;
  NSData *signature;
  uint64_t v29;
  NSData *clientDataHash;
  uint64_t v31;
  NSData *authenticatorData;
  uint64_t v33;
  NSData *credentialID;
  uint64_t v35;
  ASPasskeyAssertionCredentialExtensionOutput *extensionOutput;
  ASPasskeyAssertionCredential *v37;
  objc_super v39;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)ASPasskeyAssertionCredential;
  v22 = -[ASPasskeyAssertionCredential init](&v39, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v15, "copy");
    userHandle = v22->_userHandle;
    v22->_userHandle = (NSData *)v23;

    v25 = objc_msgSend(v16, "copy");
    relyingParty = v22->_relyingParty;
    v22->_relyingParty = (NSString *)v25;

    v27 = objc_msgSend(v17, "copy");
    signature = v22->_signature;
    v22->_signature = (NSData *)v27;

    v29 = objc_msgSend(v18, "copy");
    clientDataHash = v22->_clientDataHash;
    v22->_clientDataHash = (NSData *)v29;

    v31 = objc_msgSend(v19, "copy");
    authenticatorData = v22->_authenticatorData;
    v22->_authenticatorData = (NSData *)v31;

    v33 = objc_msgSend(v20, "copy");
    credentialID = v22->_credentialID;
    v22->_credentialID = (NSData *)v33;

    v35 = objc_msgSend(v21, "copy");
    extensionOutput = v22->_extensionOutput;
    v22->_extensionOutput = (ASPasskeyAssertionCredentialExtensionOutput *)v35;

    v37 = v22;
  }

  return v22;
}

+ (ASPasskeyAssertionCredential)credentialWithUserHandle:(NSData *)userHandle relyingParty:(NSString *)relyingParty signature:(NSData *)signature clientDataHash:(NSData *)clientDataHash authenticatorData:(NSData *)authenticatorData credentialID:(NSData *)credentialID
{
  NSData *v14;
  NSData *v15;
  NSData *v16;
  NSData *v17;
  NSString *v18;
  NSData *v19;
  void *v20;

  v14 = credentialID;
  v15 = authenticatorData;
  v16 = clientDataHash;
  v17 = signature;
  v18 = relyingParty;
  v19 = userHandle;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithUserHandle:relyingParty:signature:clientDataHash:authenticatorData:credentialID:", v19, v18, v17, v16, v15, v14);

  return (ASPasskeyAssertionCredential *)v20;
}

- (ASPasskeyAssertionCredential)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ASPasskeyAssertionCredential *v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userHandle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingParty"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDataHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticatorData"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionOutput"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[ASPasskeyAssertionCredential initWithUserHandle:relyingParty:signature:clientDataHash:authenticatorData:credentialID:extensionOutput:](self, "initWithUserHandle:relyingParty:signature:clientDataHash:authenticatorData:credentialID:extensionOutput:", v5, v6, v7, v8, v9, v10, v11);
  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *userHandle;
  id v5;

  userHandle = self->_userHandle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userHandle, CFSTR("userHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingParty, CFSTR("relyingParty"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientDataHash, CFSTR("clientDataHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authenticatorData, CFSTR("authenticatorData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensionOutput, CFSTR("extensionOutput"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithUserHandle:relyingParty:signature:clientDataHash:authenticatorData:credentialID:extensionOutput:", self->_userHandle, self->_relyingParty, self->_signature, self->_clientDataHash, self->_authenticatorData, self->_credentialID, self->_extensionOutput);
}

- (NSData)userHandle
{
  return self->_userHandle;
}

- (NSString)relyingParty
{
  return self->_relyingParty;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (NSData)authenticatorData
{
  return self->_authenticatorData;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (ASPasskeyAssertionCredentialExtensionOutput)extensionOutput
{
  return self->_extensionOutput;
}

- (void)setExtensionOutput:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionOutput, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
  objc_storeStrong((id *)&self->_authenticatorData, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_relyingParty, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
}

- (BOOL)_validateWithError:(id *)a3
{
  ASPasskeyAssertionCredential *v3;

  v3 = self;
  sub_20E54E3A8();

  return 1;
}

- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)coreExtensions
{
  ASPasskeyAssertionCredential *v2;
  ASPasskeyAssertionCredentialExtensionOutput *v3;
  ASPasskeyAssertionCredential *v4;
  id v5;

  v2 = self;
  v3 = -[ASPasskeyAssertionCredential extensionOutput](v2, sel_extensionOutput);
  if (v3)
  {
    v4 = (ASPasskeyAssertionCredential *)v3;
    v5 = objc_retain(*(id *)((char *)&v3->super.isa
                           + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions));

    v2 = v4;
  }
  else
  {
    v5 = 0;
  }

  return (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs *)v5;
}

@end
