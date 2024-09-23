@implementation FKAuthorizationConsent

- (FKAuthorizationConsent)initWithConsentId:(id)a3 token:(id)a4 authorizationURI:(id)a5 extensionPayload:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  FKAuthorizationConsent *v14;
  uint64_t v15;
  NSString *consentId;
  uint64_t v17;
  NSString *token;
  uint64_t v19;
  NSString *authorizationURI;
  uint64_t v21;
  NSDictionary *extensionPayload;
  objc_super v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)FKAuthorizationConsent;
  v14 = -[FKAuthorizationConsent init](&v24, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    consentId = v14->_consentId;
    v14->_consentId = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    token = v14->_token;
    v14->_token = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    authorizationURI = v14->_authorizationURI;
    v14->_authorizationURI = (NSString *)v19;

    v21 = objc_msgSend(v13, "copy");
    extensionPayload = v14->_extensionPayload;
    v14->_extensionPayload = (NSDictionary *)v21;

  }
  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  FKAuthorizationConsent *v5;
  uint64_t v6;
  NSString *consentId;
  uint64_t v8;
  NSString *token;
  uint64_t v10;
  NSString *authorizationURI;
  uint64_t v12;
  NSDictionary *extensionPayload;

  v5 = objc_alloc_init(FKAuthorizationConsent);
  v6 = -[NSString copyWithZone:](self->_consentId, "copyWithZone:", a3);
  consentId = v5->_consentId;
  v5->_consentId = (NSString *)v6;

  v8 = -[NSString copyWithZone:](self->_token, "copyWithZone:", a3);
  token = v5->_token;
  v5->_token = (NSString *)v8;

  v10 = -[NSString copyWithZone:](self->_authorizationURI, "copyWithZone:", a3);
  authorizationURI = v5->_authorizationURI;
  v5->_authorizationURI = (NSString *)v10;

  v12 = -[NSDictionary copyWithZone:](self->_extensionPayload, "copyWithZone:", a3);
  extensionPayload = v5->_extensionPayload;
  v5->_extensionPayload = (NSDictionary *)v12;

  return v5;
}

- (unint64_t)hash
{
  id v3;
  unint64_t v4;

  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v3, "safelyAddObject:", self->_consentId);
  objc_msgSend(v3, "safelyAddObject:", self->_token);
  objc_msgSend(v3, "safelyAddObject:", self->_authorizationURI);
  objc_msgSend(v3, "safelyAddObject:", self->_extensionPayload);
  v4 = FKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  FKAuthorizationConsent *v4;
  FKAuthorizationConsent *v5;
  void **v6;
  char v7;

  v4 = (FKAuthorizationConsent *)a3;
  v5 = v4;
  if (self == v4)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    if (FKEqualObjects(self->_consentId, v6[1])
      && FKEqualObjects(self->_token, v6[2])
      && FKEqualObjects(self->_authorizationURI, v6[3]))
    {
      v7 = FKEqualObjects(self->_extensionPayload, v6[4]);
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)consentId
{
  return self->_consentId;
}

- (NSString)token
{
  return self->_token;
}

- (NSString)authorizationURI
{
  return self->_authorizationURI;
}

- (NSDictionary)extensionPayload
{
  return self->_extensionPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionPayload, 0);
  objc_storeStrong((id *)&self->_authorizationURI, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_consentId, 0);
}

@end
