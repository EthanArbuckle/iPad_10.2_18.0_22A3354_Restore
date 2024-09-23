@implementation ASAuthorizationSecurityKeyPublicKeyCredentialProvider

- (ASAuthorizationSecurityKeyPublicKeyCredentialProvider)initWithRelyingPartyIdentifier:(NSString *)relyingPartyIdentifier
{
  NSString *v4;
  ASAuthorizationSecurityKeyPublicKeyCredentialProvider *v5;
  uint64_t v6;
  NSString *v7;
  ASAuthorizationSecurityKeyPublicKeyCredentialProvider *v8;
  objc_super v10;

  v4 = relyingPartyIdentifier;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialProvider;
  v5 = -[ASAuthorizationSecurityKeyPublicKeyCredentialProvider init](&v10, sel_init);
  if (v5)
  {
    v6 = -[NSString copy](v4, "copy");
    v7 = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest)createCredentialRegistrationRequestWithChallenge:(NSData *)challenge displayName:(NSString *)displayName name:(NSString *)name userID:(NSData *)userID
{
  NSData *v10;
  NSString *v11;
  NSString *v12;
  NSData *v13;
  id v14;

  v10 = userID;
  v11 = name;
  v12 = displayName;
  v13 = challenge;
  v14 = -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest _initWithProvider:relyingPartyIdentifier:challenge:displayName:name:userID:clientData:]([ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:displayName:name:userID:clientData:", self, self->_relyingPartyIdentifier, v13, v12, v11, v10, 0);

  return (ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *)v14;
}

- (ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest)createCredentialAssertionRequestWithChallenge:(NSData *)challenge
{
  NSData *v4;
  id v5;

  v4 = challenge;
  v5 = -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest _initWithProvider:relyingPartyIdentifier:challenge:clientData:]([ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:clientData:", self, self->_relyingPartyIdentifier, v4, 0);

  return (ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *)v5;
}

- (id)createCredentialAssertionRequestWithClientData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest _initWithProvider:relyingPartyIdentifier:challenge:clientData:]([ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:clientData:", self, self->_relyingPartyIdentifier, 0, v4);

  return v5;
}

- (id)createCredentialRegistrationRequestWithClientData:(id)a3 displayName:(id)a4 name:(id)a5 userID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest _initWithProvider:relyingPartyIdentifier:challenge:displayName:name:userID:clientData:]([ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:displayName:name:userID:clientData:", self, self->_relyingPartyIdentifier, 0, v12, v11, v10, v13);

  return v14;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

@end
