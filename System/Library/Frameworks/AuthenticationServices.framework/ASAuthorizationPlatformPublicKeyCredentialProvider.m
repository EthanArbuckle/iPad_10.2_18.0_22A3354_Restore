@implementation ASAuthorizationPlatformPublicKeyCredentialProvider

- (ASAuthorizationPlatformPublicKeyCredentialProvider)initWithRelyingPartyIdentifier:(NSString *)relyingPartyIdentifier
{
  NSString *v4;
  ASAuthorizationPlatformPublicKeyCredentialProvider *v5;
  uint64_t v6;
  NSString *v7;
  ASAuthorizationPlatformPublicKeyCredentialProvider *v8;
  objc_super v10;

  v4 = relyingPartyIdentifier;
  v10.receiver = self;
  v10.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialProvider;
  v5 = -[ASAuthorizationPlatformPublicKeyCredentialProvider init](&v10, sel_init);
  if (v5)
  {
    v6 = -[NSString copy](v4, "copy");
    v7 = v5->_relyingPartyIdentifier;
    v5->_relyingPartyIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (ASAuthorizationPlatformPublicKeyCredentialAssertionRequest)createCredentialAssertionRequestWithChallenge:(NSData *)challenge
{
  NSData *v4;
  id v5;

  v4 = challenge;
  v5 = -[ASAuthorizationPlatformPublicKeyCredentialAssertionRequest _initWithProvider:relyingPartyIdentifier:challenge:clientData:]([ASAuthorizationPlatformPublicKeyCredentialAssertionRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:clientData:", self, self->_relyingPartyIdentifier, v4, 0);

  return (ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *)v5;
}

- (ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest)createCredentialRegistrationRequestWithChallenge:(NSData *)challenge name:(NSString *)name userID:(NSData *)userID
{
  NSData *v8;
  NSString *v9;
  NSData *v10;
  id v11;

  v8 = userID;
  v9 = name;
  v10 = challenge;
  v11 = -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest _initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:]([ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:", self, self->_relyingPartyIdentifier, v10, v9, v8, 0, 0);

  return (ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *)v11;
}

- (id)createCredentialAssertionRequestWithClientData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = -[ASAuthorizationPlatformPublicKeyCredentialAssertionRequest _initWithProvider:relyingPartyIdentifier:challenge:clientData:]([ASAuthorizationPlatformPublicKeyCredentialAssertionRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:clientData:", self, self->_relyingPartyIdentifier, 0, v4);

  return v5;
}

- (id)createCredentialRegistrationRequestWithClientData:(id)a3 name:(id)a4 userID:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest _initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:]([ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:", self, self->_relyingPartyIdentifier, 0, v9, v8, v10, 0);

  return v11;
}

- (id)createCredentialRegistrationRequestWithClientData:(id)a3 name:(id)a4 userID:(id)a5 requestStyle:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest _initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:]([ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:", self, self->_relyingPartyIdentifier, 0, v11, v10, v12, a6);

  return v13;
}

- (id)createCredentialRegistrationRequestWithChallenge:(id)a3 name:(id)a4 userID:(id)a5 requestStyle:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest _initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:]([ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest alloc], "_initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:", self, self->_relyingPartyIdentifier, v12, v11, v10, 0, a6);

  return v13;
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
