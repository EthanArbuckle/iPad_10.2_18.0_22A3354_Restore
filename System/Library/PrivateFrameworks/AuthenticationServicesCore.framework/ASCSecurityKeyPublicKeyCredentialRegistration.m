@implementation ASCSecurityKeyPublicKeyCredentialRegistration

- (ASCSecurityKeyPublicKeyCredentialRegistration)initWithRelyingPartyIdentifier:(id)a3 attestationObject:(id)a4 rawClientDataJSON:(id)a5 credentialID:(id)a6 transports:(id)a7 extensionOutputsCBOR:(id)a8 attachment:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  ASCSecurityKeyPublicKeyCredentialRegistration *v22;
  uint64_t v23;
  NSData *credentialID;
  uint64_t v25;
  NSString *relyingPartyIdentifier;
  uint64_t v27;
  NSData *attestationObject;
  uint64_t v29;
  NSArray *transports;
  uint64_t v31;
  NSData *extensionOutputsCBOR;
  uint64_t v33;
  NSString *attachment;
  ASCSecurityKeyPublicKeyCredentialRegistration *v35;
  objc_super v37;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v37.receiver = self;
  v37.super_class = (Class)ASCSecurityKeyPublicKeyCredentialRegistration;
  v22 = -[ASCSecurityKeyPublicKeyCredentialRegistration init](&v37, sel_init);
  if (v22)
  {
    v23 = objc_msgSend(v18, "copy");
    credentialID = v22->_credentialID;
    v22->_credentialID = (NSData *)v23;

    objc_storeStrong((id *)&v22->_rawClientDataJSON, a5);
    v25 = objc_msgSend(v15, "copy");
    relyingPartyIdentifier = v22->_relyingPartyIdentifier;
    v22->_relyingPartyIdentifier = (NSString *)v25;

    v27 = objc_msgSend(v16, "copy");
    attestationObject = v22->_attestationObject;
    v22->_attestationObject = (NSData *)v27;

    v29 = objc_msgSend(v19, "copy");
    transports = v22->_transports;
    v22->_transports = (NSArray *)v29;

    v31 = objc_msgSend(v20, "copy");
    extensionOutputsCBOR = v22->_extensionOutputsCBOR;
    v22->_extensionOutputsCBOR = (NSData *)v31;

    v33 = objc_msgSend(v21, "copy");
    attachment = v22->_attachment;
    v22->_attachment = (NSString *)v33;

    v35 = v22;
  }

  return v22;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *extensionOutputsCBOR;
  id v5;

  extensionOutputsCBOR = self->_extensionOutputsCBOR;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", extensionOutputsCBOR, CFSTR("extensionOutputsCBOR"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestationObject, CFSTR("attestationObject"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawClientDataJSON, CFSTR("rawClientDataJSON"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_transports, CFSTR("transports"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachment, CFSTR("attachment"));

}

- (ASCSecurityKeyPublicKeyCredentialRegistration)initWithCoder:(id)a3
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
  ASCSecurityKeyPublicKeyCredentialRegistration *v15;

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

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionOutputsCBOR"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachment"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[ASCSecurityKeyPublicKeyCredentialRegistration initWithRelyingPartyIdentifier:attestationObject:rawClientDataJSON:credentialID:transports:extensionOutputsCBOR:attachment:](self, "initWithRelyingPartyIdentifier:attestationObject:rawClientDataJSON:credentialID:transports:extensionOutputsCBOR:attachment:", v5, v6, v7, v8, v12, v13, v14);
  return v15;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)attestationObject
{
  return self->_attestationObject;
}

- (NSArray)transports
{
  return self->_transports;
}

- (NSData)extensionOutputsCBOR
{
  return self->_extensionOutputsCBOR;
}

- (void)setExtensionOutputsCBOR:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)attachment
{
  return self->_attachment;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_extensionOutputsCBOR, 0);
  objc_storeStrong((id *)&self->_transports, 0);
  objc_storeStrong((id *)&self->_attestationObject, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end
