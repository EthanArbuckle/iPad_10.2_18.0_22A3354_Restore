@implementation ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest

- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 clientData:(id)a6
{
  id v10;
  id v11;
  id v12;
  ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *v13;
  uint64_t v14;
  NSString *relyingPartyIdentifier;
  uint64_t v16;
  NSData *challenge;
  ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest *v18;
  objc_super v20;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest;
  v13 = -[ASAuthorizationRequest initWithProvider:](&v20, sel_initWithProvider_, a3);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    relyingPartyIdentifier = v13->_relyingPartyIdentifier;
    v13->_relyingPartyIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    challenge = v13->_challenge;
    v13->_challenge = (NSData *)v16;

    objc_storeStrong((id *)&v13->_userVerificationPreference, CFSTR("preferred"));
    v13->_internalLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v13->_clientData, a6);
    v18 = v13;
  }

  return v13;
}

- (ASCPublicKeyCredentialAssertionOptions)coreCredentialAssertionOptions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest allowedCredentials](self, "allowedCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest clientData](self, "clientData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc(MEMORY[0x24BE0B250]);
  -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest relyingPartyIdentifier](self, "relyingPartyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest clientData](self, "clientData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "jsonForOperationType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest userVerificationPreference](self, "userVerificationPreference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest clientData](self, "clientData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "origin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v6, "initWithKind:relyingPartyIdentifier:clientDataJSON:userVerificationPreference:allowedCredentials:origin:", 2, v7, v9, v10, v4, v12);

  }
  else
  {
    -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest challenge](self, "challenge");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest userVerificationPreference](self, "userVerificationPreference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v6, "initWithKind:relyingPartyIdentifier:challenge:userVerificationPreference:allowedCredentials:", 2, v7, v8, v9, v4);
  }

  -[ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest appID](self, "appID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAppIDForSecurityKeys:", v14);

  return (ASCPublicKeyCredentialAssertionOptions *)v13;
}

uint64_t __95__ASAuthorizationSecurityKeyPublicKeyCredentialAssertionRequest_coreCredentialAssertionOptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "coreDescriptor");
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (a3 & 7) == 0 && (unint64_t)a3 < 3;
}

- (NSData)challenge
{
  os_unfair_lock_s *p_internalLock;
  NSData *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_challenge;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setChallenge:(id)a3
{
  NSData *v4;
  NSData *challenge;

  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  challenge = self->_challenge;
  self->_challenge = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)relyingPartyIdentifier
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_relyingPartyIdentifier;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  NSString *v4;
  NSString *relyingPartyIdentifier;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  self->_relyingPartyIdentifier = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSArray)allowedCredentials
{
  os_unfair_lock_s *p_internalLock;
  NSArray *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_allowedCredentials;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setAllowedCredentials:(NSArray *)allowedCredentials
{
  NSArray *v4;
  NSArray *v5;

  v4 = allowedCredentials;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_allowedCredentials;
  self->_allowedCredentials = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)userVerificationPreference
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_userVerificationPreference;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setUserVerificationPreference:(id)a3
{
  NSString *v4;
  NSString *userVerificationPreference;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  userVerificationPreference = self->_userVerificationPreference;
  self->_userVerificationPreference = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)appID
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_appID;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setAppID:(id)a3
{
  NSString *v4;
  NSString *appID;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  appID = self->_appID;
  self->_appID = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (ASPublicKeyCredentialClientData)clientData
{
  os_unfair_lock_s *p_internalLock;
  ASPublicKeyCredentialClientData *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_clientData;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setClientData:(id)a3
{
  ASPublicKeyCredentialClientData *v4;
  ASPublicKeyCredentialClientData *clientData;

  v4 = (ASPublicKeyCredentialClientData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  clientData = self->_clientData;
  self->_clientData = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedCredentials, 0);
}

@end
