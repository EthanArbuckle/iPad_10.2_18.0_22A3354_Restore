@implementation ASAuthorizationSecurityKeyPublicKeyCredentialAssertion

- (id)_initWithBaseCredential:(id)a3 userID:(id)a4 signature:(id)a5 rawAuthenticatorData:(id)a6 appID:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  ASAuthorizationSecurityKeyPublicKeyCredentialAssertion *v16;
  uint64_t v17;
  ASPublicKeyCredentialBase *baseCredential;
  uint64_t v19;
  NSData *rawAuthenticatorData;
  uint64_t v21;
  NSData *userID;
  uint64_t v23;
  NSData *signature;
  ASAuthorizationSecurityKeyPublicKeyCredentialAssertion *v25;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v27.receiver = self;
  v27.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialAssertion;
  v16 = -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertion init](&v27, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    baseCredential = v16->_baseCredential;
    v16->_baseCredential = (ASPublicKeyCredentialBase *)v17;

    v19 = objc_msgSend(v15, "copy");
    rawAuthenticatorData = v16->_rawAuthenticatorData;
    v16->_rawAuthenticatorData = (NSData *)v19;

    v21 = objc_msgSend(v13, "copy");
    userID = v16->_userID;
    v16->_userID = (NSData *)v21;

    v23 = objc_msgSend(v14, "copy");
    signature = v16->_signature;
    v16->_signature = (NSData *)v23;

    v16->_appID = a7;
    v25 = v16;
  }

  return v16;
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialAssertion)initWithCoreCredential:(id)a3
{
  id v4;
  ASPublicKeyCredentialBase *v5;
  void *v6;
  void *v7;
  void *v8;
  ASPublicKeyCredentialBase *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  ASAuthorizationSecurityKeyPublicKeyCredentialAssertion *v14;

  v4 = a3;
  v5 = [ASPublicKeyCredentialBase alloc];
  objc_msgSend(v4, "credentialID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rawClientDataJSON");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "attachment");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ASPublicKeyCredentialBase initWithCredentialID:rawClientDataJSON:attachment:](v5, "initWithCredentialID:rawClientDataJSON:attachment:", v6, v7, +[ASAuthorizationPublicKeyCredentialConstants publicAttachmentFromInternal:](ASAuthorizationPublicKeyCredentialConstants, "publicAttachmentFromInternal:", v8));

  objc_msgSend(v4, "userHandle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "signature");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticatorData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v4, "appID");

  v14 = -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertion _initWithBaseCredential:userID:signature:rawAuthenticatorData:appID:](self, "_initWithBaseCredential:userID:signature:rawAuthenticatorData:appID:", v9, v10, v11, v12, v13);
  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "_initWithBaseCredential:userID:signature:rawAuthenticatorData:appID:", self->_baseCredential, self->_userID, self->_signature, self->_rawAuthenticatorData, self->_appID);
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialAssertion)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  ASAuthorizationSecurityKeyPublicKeyCredentialAssertion *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseCredential"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("signature"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("rawAuthenticatorData"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("appID"));

  v10 = -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertion _initWithBaseCredential:userID:signature:rawAuthenticatorData:appID:](self, "_initWithBaseCredential:userID:signature:rawAuthenticatorData:appID:", v5, v6, v7, v8, v9);
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  ASPublicKeyCredentialBase *baseCredential;
  id v5;

  baseCredential = self->_baseCredential;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", baseCredential, CFSTR("baseCredential"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rawAuthenticatorData, CFSTR("rawAuthenticatorData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userID, CFSTR("userID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_signature, CFSTR("signature"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_appID, CFSTR("appID"));

}

- (NSData)rawClientDataJSON
{
  return -[ASPublicKeyCredentialBase rawClientDataJSON](self->_baseCredential, "rawClientDataJSON");
}

- (NSData)credentialID
{
  return -[ASPublicKeyCredentialBase credentialID](self->_baseCredential, "credentialID");
}

- (NSData)rawAuthenticatorData
{
  return self->_rawAuthenticatorData;
}

- (NSData)userID
{
  return self->_userID;
}

- (NSData)signature
{
  return self->_signature;
}

- (BOOL)appID
{
  return self->_appID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_rawAuthenticatorData, 0);
  objc_storeStrong((id *)&self->_baseCredential, 0);
}

@end
