@implementation ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest

- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 displayName:(id)a6 name:(id)a7 userID:(id)a8 clientData:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *v21;
  uint64_t v22;
  NSString *relyingPartyIdentifier;
  uint64_t v24;
  NSData *challenge;
  uint64_t v26;
  NSString *displayName;
  uint64_t v28;
  NSString *name;
  uint64_t v30;
  NSData *userID;
  NSArray *credentialParameters;
  NSArray *v33;
  NSArray *excludedCredentials;
  ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest *v35;
  objc_super v37;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v37.receiver = self;
  v37.super_class = (Class)ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest;
  v21 = -[ASAuthorizationRequest initWithProvider:](&v37, sel_initWithProvider_, a3);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    relyingPartyIdentifier = v21->_relyingPartyIdentifier;
    v21->_relyingPartyIdentifier = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    challenge = v21->_challenge;
    v21->_challenge = (NSData *)v24;

    v26 = objc_msgSend(v17, "copy");
    displayName = v21->_displayName;
    v21->_displayName = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    name = v21->_name;
    v21->_name = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    userID = v21->_userID;
    v21->_userID = (NSData *)v30;

    objc_storeStrong((id *)&v21->_userVerificationPreference, CFSTR("preferred"));
    objc_storeStrong((id *)&v21->_attestationPreference, CFSTR("none"));
    credentialParameters = v21->_credentialParameters;
    v33 = (NSArray *)MEMORY[0x24BDBD1A8];
    v21->_credentialParameters = (NSArray *)MEMORY[0x24BDBD1A8];

    excludedCredentials = v21->_excludedCredentials;
    v21->_excludedCredentials = v33;

    objc_storeStrong((id *)&v21->_residentKeyPreference, CFSTR("preferred"));
    v21->_internalLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v21->_clientData, a9);
    v35 = v21;
  }

  return v21;
}

- (ASCPublicKeyCredentialCreationOptions)coreCredentialCreationOptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSString *v13;
  uint64_t v14;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  -[NSArray safari_mapObjectsUsingBlock:](self->_credentialParameters, "safari_mapObjectsUsingBlock:", &__block_literal_global_19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest excludedCredentials](self, "excludedCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_2_0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x24BE0B258]);
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest challenge](self, "challenge");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest clientData](self, "clientData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "jsonForOperationType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest relyingPartyIdentifier](self, "relyingPartyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest userID](self, "userID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest displayName](self, "displayName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest attestationPreference](self, "attestationPreference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest userVerificationPreference](self, "userVerificationPreference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest clientData](self, "clientData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "origin");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "initWithChallenge:clientDataJSON:clientDataHash:relyingPartyIdentifier:userName:userIdentifier:userDisplayName:supportedAlgorithmIdentifiers:attestationPreference:userVerificationPreference:excludedCredentials:extensions:origin:", v19, v4, 0, v5, v6, v7, v8, v21, v9, v10, v20, 0, v12);

  v13 = self->_residentKeyPreference;
  if (-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("discouraged")))
  {
    v14 = 1;
  }
  else if (-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("preferred")))
  {
    v14 = 2;
  }
  else if (-[NSString isEqualToString:](v13, "isEqualToString:", CFSTR("required")))
  {
    v14 = 3;
  }
  else
  {
    v14 = 0;
  }

  objc_msgSend(v17, "setResidentKeyPreference:", v14);
  return (ASCPublicKeyCredentialCreationOptions *)v17;
}

uint64_t __97__ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest_coreCredentialCreationOptions__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a2, "algorithm"));
}

uint64_t __97__ASAuthorizationSecurityKeyPublicKeyCredentialRegistrationRequest_coreCredentialCreationOptions__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "coreDescriptor");
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (a3 & 7) == 0 && (unint64_t)a3 < 3;
}

- (NSData)userID
{
  os_unfair_lock_s *p_internalLock;
  NSData *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_userID;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setUserID:(id)a3
{
  NSData *v4;
  NSData *userID;

  v4 = (NSData *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  userID = self->_userID;
  self->_userID = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)name
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_name;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  name = self->_name;
  self->_name = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSString)displayName
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_displayName;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setDisplayName:(id)a3
{
  NSString *v4;
  NSString *displayName;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  displayName = self->_displayName;
  self->_displayName = v4;

  os_unfair_lock_unlock(&self->_internalLock);
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

- (NSString)attestationPreference
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_attestationPreference;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setAttestationPreference:(id)a3
{
  NSString *v4;
  NSString *attestationPreference;

  v4 = (NSString *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  attestationPreference = self->_attestationPreference;
  self->_attestationPreference = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSArray)credentialParameters
{
  os_unfair_lock_s *p_internalLock;
  NSArray *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_credentialParameters;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setCredentialParameters:(NSArray *)credentialParameters
{
  NSArray *v4;
  NSArray *v5;

  v4 = credentialParameters;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_credentialParameters;
  self->_credentialParameters = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (NSArray)excludedCredentials
{
  os_unfair_lock_s *p_internalLock;
  NSArray *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_excludedCredentials;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setExcludedCredentials:(NSArray *)excludedCredentials
{
  NSArray *v4;
  NSArray *v5;

  v4 = excludedCredentials;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_excludedCredentials;
  self->_excludedCredentials = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (ASAuthorizationPublicKeyCredentialResidentKeyPreference)residentKeyPreference
{
  os_unfair_lock_s *p_internalLock;
  NSString *v4;

  p_internalLock = &self->_internalLock;
  os_unfair_lock_lock(&self->_internalLock);
  v4 = self->_residentKeyPreference;
  os_unfair_lock_unlock(p_internalLock);
  return v4;
}

- (void)setResidentKeyPreference:(ASAuthorizationPublicKeyCredentialResidentKeyPreference)residentKeyPreference
{
  NSString *v4;
  NSString *v5;

  v4 = residentKeyPreference;
  os_unfair_lock_lock(&self->_internalLock);
  v5 = self->_residentKeyPreference;
  self->_residentKeyPreference = v4;

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

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_attestationPreference, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_residentKeyPreference, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);
  objc_storeStrong((id *)&self->_credentialParameters, 0);
}

@end
