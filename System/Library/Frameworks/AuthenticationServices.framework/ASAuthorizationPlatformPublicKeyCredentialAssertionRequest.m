@implementation ASAuthorizationPlatformPublicKeyCredentialAssertionRequest

- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 clientData:(id)a6
{
  id v10;
  id v11;
  id v12;
  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *v13;
  uint64_t v14;
  NSString *relyingPartyIdentifier;
  uint64_t v16;
  NSData *challenge;
  uint64_t v18;
  ASCPublicKeyCredentialAssertionExtensionInputs *extensions;
  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *v20;
  objc_super v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialAssertionRequest;
  v13 = -[ASAuthorizationRequest initWithProvider:](&v22, sel_initWithProvider_, a3);
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
    v13->_shouldShowHybridTransport = 1;
    objc_msgSend((id)objc_opt_class(), "emptyExtensions");
    v18 = objc_claimAutoreleasedReturnValue();
    extensions = v13->_extensions;
    v13->_extensions = (ASCPublicKeyCredentialAssertionExtensionInputs *)v18;

    v20 = v13;
  }

  return v13;
}

- (ASCPublicKeyCredentialAssertionOptions)coreCredentialAssertionOptions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  -[ASAuthorizationPlatformPublicKeyCredentialAssertionRequest allowedCredentials](self, "allowedCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_15);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_challenge)
  {
    v5 = objc_alloc(MEMORY[0x24BE0B250]);
    -[ASAuthorizationPlatformPublicKeyCredentialAssertionRequest relyingPartyIdentifier](self, "relyingPartyIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationPlatformPublicKeyCredentialAssertionRequest challenge](self, "challenge");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationPlatformPublicKeyCredentialAssertionRequest userVerificationPreference](self, "userVerificationPreference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithKind:relyingPartyIdentifier:challenge:userVerificationPreference:allowedCredentials:", 1, v6, v7, v8, v4);
  }
  else
  {
    -[ASAuthorizationPlatformPublicKeyCredentialAssertionRequest clientData](self, "clientData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jsonForOperationType:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_alloc(MEMORY[0x24BE0B250]);
    -[ASAuthorizationPlatformPublicKeyCredentialAssertionRequest relyingPartyIdentifier](self, "relyingPartyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASAuthorizationPlatformPublicKeyCredentialAssertionRequest userVerificationPreference](self, "userVerificationPreference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASPublicKeyCredentialClientData origin](self->_clientData, "origin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v11, "initWithKind:relyingPartyIdentifier:clientDataJSON:userVerificationPreference:allowedCredentials:origin:", 1, v7, v6, v8, v4, v12);

  }
  objc_msgSend(v9, "setShouldHideHybrid:", !self->_shouldShowHybridTransport);
  objc_msgSend(v9, "setExtensions:", self->_extensions);

  return (ASCPublicKeyCredentialAssertionOptions *)v9;
}

uint64_t __92__ASAuthorizationPlatformPublicKeyCredentialAssertionRequest_coreCredentialAssertionOptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "coreDescriptor");
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (unint64_t)a3 < 3;
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

- (LAContext)authenticatedContext
{
  os_unfair_lock_s *p_internalLock;
  LAContext *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_authenticatedContext;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setAuthenticatedContext:(id)a3
{
  LAContext *v4;
  LAContext *authenticatedContext;

  v4 = (LAContext *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  authenticatedContext = self->_authenticatedContext;
  self->_authenticatedContext = v4;

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

- (BOOL)shouldShowHybridTransport
{
  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *v2;
  os_unfair_lock_s *p_internalLock;

  v2 = self;
  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  LOBYTE(v2) = v2->_shouldShowHybridTransport;
  os_unfair_lock_unlock(p_internalLock);
  return (char)v2;
}

- (void)setShouldShowHybridTransport:(BOOL)a3
{
  os_unfair_lock_s *p_internalLock;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  self->_shouldShowHybridTransport = a3;
  os_unfair_lock_unlock(p_internalLock);
}

- (ASCPublicKeyCredentialAssertionExtensionInputs)extensions
{
  return self->_extensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_authenticatedContext, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_allowedCredentials, 0);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput)__largeBlobSwift
{
  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *v2;
  id v3;

  v2 = self;
  v3 = ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.__largeBlobSwift.getter();

  return (ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput *)v3;
}

- (void)__setLargeBlobSwift:(id)a3
{
  sub_20E5532D8(self, (uint64_t)a2, a3, &qword_254A28EF8, (void (*)(void))sub_20E539A74, (uint64_t (*)(_QWORD))MEMORY[0x24BE0AFD0], (void (*)(char *))MEMORY[0x24BE0AFE8]);
}

- (ASAuthorizationPublicKeyCredentialPRFAssertionInput)__prfSwift
{
  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest *v2;
  id v3;

  v2 = self;
  v3 = ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.__prfSwift.getter();

  return (ASAuthorizationPublicKeyCredentialPRFAssertionInput *)v3;
}

- (void)__setPRFSwift:(id)a3
{
  sub_20E5532D8(self, (uint64_t)a2, a3, &qword_254A28F08, (void (*)(void))sub_20E53D67C, (uint64_t (*)(_QWORD))MEMORY[0x24BE0AF80], (void (*)(char *))MEMORY[0x24BE0AF98]);
}

+ (id)emptyExtensions
{
  return objc_msgSend(objc_allocWithZone((Class)sub_20E557008()), sel_init);
}

@end
