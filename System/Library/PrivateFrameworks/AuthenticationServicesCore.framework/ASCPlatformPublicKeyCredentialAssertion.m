@implementation ASCPlatformPublicKeyCredentialAssertion

- (ASCPlatformPublicKeyCredentialAssertion)initWithRelyingPartyIdentifier:(id)a3 authenticatorData:(id)a4 signature:(id)a5 userHandle:(id)a6 rawClientDataJSON:(id)a7 credentialID:(id)a8 extensions:(id)a9 attachment:(id)a10 isExternal:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  ASCPlatformPublicKeyCredentialAssertion *v25;
  uint64_t v26;
  NSData *credentialID;
  uint64_t v28;
  NSData *rawClientDataJSON;
  uint64_t v30;
  NSString *relyingPartyIdentifier;
  uint64_t v32;
  NSData *authenticatorData;
  uint64_t v34;
  NSData *signature;
  uint64_t v36;
  NSData *userHandle;
  uint64_t v38;
  NSString *attachment;
  ASCPlatformPublicKeyCredentialAssertion *v40;
  objc_super v42;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v42.receiver = self;
  v42.super_class = (Class)ASCPlatformPublicKeyCredentialAssertion;
  v25 = -[ASCPlatformPublicKeyCredentialAssertion init](&v42, sel_init);
  if (v25)
  {
    v26 = objc_msgSend(v22, "copy");
    credentialID = v25->_credentialID;
    v25->_credentialID = (NSData *)v26;

    v28 = objc_msgSend(v21, "copy");
    rawClientDataJSON = v25->_rawClientDataJSON;
    v25->_rawClientDataJSON = (NSData *)v28;

    v30 = objc_msgSend(v17, "copy");
    relyingPartyIdentifier = v25->_relyingPartyIdentifier;
    v25->_relyingPartyIdentifier = (NSString *)v30;

    v32 = objc_msgSend(v18, "copy");
    authenticatorData = v25->_authenticatorData;
    v25->_authenticatorData = (NSData *)v32;

    v34 = objc_msgSend(v19, "copy");
    signature = v25->_signature;
    v25->_signature = (NSData *)v34;

    v36 = objc_msgSend(v20, "copy");
    userHandle = v25->_userHandle;
    v25->_userHandle = (NSData *)v36;

    objc_storeStrong((id *)&v25->_extensions, a9);
    v38 = objc_msgSend(v24, "copy");
    attachment = v25->_attachment;
    v25->_attachment = (NSString *)v38;

    v25->_isExternal = a11;
    v40 = v25;
  }

  return v25;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  _TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs *extensions;
  id v5;

  extensions = self->_extensions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", extensions, CFSTR("extensions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_authenticatorData, CFSTR("authenticatorData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userHandle, CFSTR("userHandle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawClientDataJSON, CFSTR("rawClientDataJSON"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialID, CFSTR("credentialID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attachment, CFSTR("attachment"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isExternal, CFSTR("isExternal"));

}

- (ASCPlatformPublicKeyCredentialAssertion)initWithCoder:(id)a3
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
  ASCPlatformPublicKeyCredentialAssertion *v13;
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
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attachment"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "decodeBoolForKey:", CFSTR("isExternal"));

  LOBYTE(v15) = v12;
  v13 = -[ASCPlatformPublicKeyCredentialAssertion initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensions:attachment:isExternal:](self, "initWithRelyingPartyIdentifier:authenticatorData:signature:userHandle:rawClientDataJSON:credentialID:extensions:attachment:isExternal:", v4, v5, v6, v7, v8, v9, v10, v11, v15);

  return v13;
}

- (NSData)credentialID
{
  return self->_credentialID;
}

- (NSData)rawClientDataJSON
{
  return self->_rawClientDataJSON;
}

- (void)setRawClientDataJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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

- (_TtC26AuthenticationServicesCore47ASCPublicKeyCredentialAssertionExtensionOutputs)extensions
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
  objc_storeStrong((id *)&self->_userHandle, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_authenticatorData, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_rawClientDataJSON, 0);
  objc_storeStrong((id *)&self->_credentialID, 0);
}

@end
