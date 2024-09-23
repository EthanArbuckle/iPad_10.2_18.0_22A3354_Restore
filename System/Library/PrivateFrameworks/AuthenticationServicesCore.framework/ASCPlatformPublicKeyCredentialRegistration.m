@implementation ASCPlatformPublicKeyCredentialRegistration

- (ASCPlatformPublicKeyCredentialRegistration)initWithRelyingPartyIdentifier:(id)a3 attestationObject:(id)a4 rawClientDataJSON:(id)a5 credentialID:(id)a6 transports:(id)a7 extensions:(id)a8 attachment:(id)a9 isExternal:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  ASCPlatformPublicKeyCredentialRegistration *v23;
  uint64_t v24;
  NSData *credentialID;
  uint64_t v26;
  NSString *relyingPartyIdentifier;
  uint64_t v28;
  NSData *attestationObject;
  uint64_t v30;
  NSData *rawClientDataJSON;
  uint64_t v32;
  NSArray *transports;
  uint64_t v34;
  NSString *attachment;
  ASCPlatformPublicKeyCredentialRegistration *v36;
  objc_super v38;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v38.receiver = self;
  v38.super_class = (Class)ASCPlatformPublicKeyCredentialRegistration;
  v23 = -[ASCPlatformPublicKeyCredentialRegistration init](&v38, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v19, "copy");
    credentialID = v23->_credentialID;
    v23->_credentialID = (NSData *)v24;

    v26 = objc_msgSend(v16, "copy");
    relyingPartyIdentifier = v23->_relyingPartyIdentifier;
    v23->_relyingPartyIdentifier = (NSString *)v26;

    v28 = objc_msgSend(v17, "copy");
    attestationObject = v23->_attestationObject;
    v23->_attestationObject = (NSData *)v28;

    v30 = objc_msgSend(v18, "copy");
    rawClientDataJSON = v23->_rawClientDataJSON;
    v23->_rawClientDataJSON = (NSData *)v30;

    v32 = objc_msgSend(v20, "copy");
    transports = v23->_transports;
    v23->_transports = (NSArray *)v32;

    objc_storeStrong((id *)&v23->_extensions, a8);
    v34 = objc_msgSend(v22, "copy");
    attachment = v23->_attachment;
    v23->_attachment = (NSString *)v34;

    v23->_isExternal = a10;
    v36 = v23;
  }

  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs *extensions;
  id v5;

  extensions = self->_extensions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", extensions, CFSTR("extensions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestationObject, CFSTR("attestationObject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawClientDataJSON, CFSTR("rawClientDataJSON"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transports, CFSTR("transports"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachment, CFSTR("attachment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isExternal, CFSTR("isExternal"));

}

- (ASCPlatformPublicKeyCredentialRegistration)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  ASCPlatformPublicKeyCredentialRegistration *v16;
  uint64_t v18;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attestationObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawClientDataJSON"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDBCF20];
  v10 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("transports"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensions"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachment"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isExternal"));

  LOBYTE(v18) = v15;
  v16 = -[ASCPlatformPublicKeyCredentialRegistration initWithRelyingPartyIdentifier:attestationObject:rawClientDataJSON:credentialID:transports:extensions:attachment:isExternal:](self, "initWithRelyingPartyIdentifier:attestationObject:rawClientDataJSON:credentialID:transports:extensions:attachment:isExternal:", v5, v6, v7, v8, v12, v13, v14, v18);

  return v16;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)attestationObject
{
  return self->_attestationObject;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (void)setRawClientDataJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)transports
{
  return self->_transports;
}

- (void)setTransports:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (_TtC26AuthenticationServicesCore50ASCPublicKeyCredentialRegistrationExtensionOutputs)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (NSString)attachment
{
  return self->_attachment;
}

- (BOOL)isExternal
{
  return self->_isExternal;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);
  objc_storeStrong((id *)&self->_attestationObject, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end
