@implementation ASCSecurityKeyPublicKeyCredentialAssertion

- (ASCSecurityKeyPublicKeyCredentialAssertion)initWithRelyingPartyIdentifier:(id)a3 authenticatorData:(id)a4 signature:(id)a5 userHandle:(id)a6 rawClientDataJSON:(id)a7 credentialID:(id)a8 extensionOutputsCBOR:(id)a9 attachment:(id)a10 appID:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ASCSecurityKeyPublicKeyCredentialAssertion *v25;
  uint64_t v26;
  NSData *credentialID;
  uint64_t v28;
  NSString *relyingPartyIdentifier;
  uint64_t v30;
  NSData *authenticatorData;
  uint64_t v32;
  NSData *signature;
  uint64_t v34;
  NSData *userHandle;
  uint64_t v36;
  NSData *rawClientDataJSON;
  uint64_t v38;
  NSData *extensionOutputsCBOR;
  uint64_t v40;
  NSString *attachment;
  ASCSecurityKeyPublicKeyCredentialAssertion *v42;
  objc_super v44;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v44.receiver = self;
  v44.super_class = (Class)ASCSecurityKeyPublicKeyCredentialAssertion;
  v25 = -[ASCSecurityKeyPublicKeyCredentialAssertion init](&v44, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v22, "copy");
    credentialID = v25->_credentialID;
    v25->_credentialID = (NSData *)v26;

    v28 = objc_msgSend(v17, "copy");
    relyingPartyIdentifier = v25->_relyingPartyIdentifier;
    v25->_relyingPartyIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v18, "copy");
    authenticatorData = v25->_authenticatorData;
    v25->_authenticatorData = (NSData *)v30;

    v32 = objc_msgSend(v19, "copy");
    signature = v25->_signature;
    v25->_signature = (NSData *)v32;

    v34 = objc_msgSend(v20, "copy");
    userHandle = v25->_userHandle;
    v25->_userHandle = (NSData *)v34;

    v36 = objc_msgSend(v21, "copy");
    rawClientDataJSON = v25->_rawClientDataJSON;
    v25->_rawClientDataJSON = (NSData *)v36;

    v38 = objc_msgSend(v23, "copy");
    extensionOutputsCBOR = v25->_extensionOutputsCBOR;
    v25->_extensionOutputsCBOR = (NSData *)v38;

    v40 = objc_msgSend(v24, "copy");
    attachment = v25->_attachment;
    v25->_attachment = (NSString *)v40;

    v25->_appID = a11;
    v42 = v25;
  }

  return v25;
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
  objc_msgSend(v5, "encodeObject:forKey:", self->_authenticatorData, CFSTR("authenticatorData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userHandle, CFSTR("userHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawClientDataJSON, CFSTR("rawClientDataJSON"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachment, CFSTR("attachment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_appID, CFSTR("appID"));

}

- (ASCSecurityKeyPublicKeyCredentialAssertion)initWithCoder:(id)a3
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
  char v12;
  ASCSecurityKeyPublicKeyCredentialAssertion *v13;
  uint64_t v15;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("authenticatorData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userHandle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawClientDataJSON"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("credentialID"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionOutputsCBOR"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("appID"));

  LOBYTE(v15) = v12;
  v13 = -[ASCSecurityKeyPublicKeyCredentialAssertion initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensionOutputsCBOR:attachment:appID:](self, "initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensionOutputsCBOR:attachment:appID:", v4, v5, v6, v7, v8, v9, v10, v11, v15);

  return v13;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)authenticatorData
{
  return self->_authenticatorData;
}

- (NSData)signature
{
  return self->_signature;
}

- (NSData)userHandle
{
  return self->_userHandle;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (NSData)extensionOutputsCBOR
{
  return self->_extensionOutputsCBOR;
}

- (NSString)attachment
{
  return self->_attachment;
}

- (BOOL)appID
{
  return self->_appID;
}

- (void)setAppID:(BOOL)a3
{
  self->_appID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachment, 0);
  objc_storeStrong((id *)&self->_extensionOutputsCBOR, 0);
  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authenticatorData, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end
