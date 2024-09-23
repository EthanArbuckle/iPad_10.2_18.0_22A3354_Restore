@implementation ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest

- (id)_initWithProvider:(id)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 name:(id)a6 userID:(id)a7 clientData:(id)a8 requestStyle:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *v20;
  uint64_t v21;
  NSString *relyingPartyIdentifier;
  uint64_t v23;
  NSData *challenge;
  NSString *displayName;
  uint64_t v26;
  NSString *name;
  uint64_t v28;
  NSData *userID;
  uint64_t v30;
  ASCPublicKeyCredentialRegistrationExtensionInputs *extensions;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *v32;
  objc_super v34;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v34.receiver = self;
  v34.super_class = (Class)ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest;
  v20 = -[ASAuthorizationRequest initWithProvider:](&v34, sel_initWithProvider_, a3);
  if (v20)
  {
    v21 = objc_msgSend(v15, "copy");
    relyingPartyIdentifier = v20->_relyingPartyIdentifier;
    v20->_relyingPartyIdentifier = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    challenge = v20->_challenge;
    v20->_challenge = (NSData *)v23;

    displayName = v20->_displayName;
    v20->_displayName = (NSString *)&stru_24C955390;

    v26 = objc_msgSend(v17, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v26;

    v28 = objc_msgSend(v18, "copy");
    userID = v20->_userID;
    v20->_userID = (NSData *)v28;

    objc_storeStrong((id *)&v20->_userVerificationPreference, CFSTR("preferred"));
    objc_storeStrong((id *)&v20->_attestationPreference, CFSTR("none"));
    v20->_internalLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v20->_clientData, a8);
    v20->_shouldShowHybridTransport = 1;
    objc_msgSend((id)objc_opt_class(), "emptyExtensions");
    v30 = objc_claimAutoreleasedReturnValue();
    extensions = v20->_extensions;
    v20->_extensions = (ASCPublicKeyCredentialRegistrationExtensionInputs *)v30;

    v20->_requestStyle = a9;
    v32 = v20;
  }

  return v20;
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
  ASCPublicKeyCredentialRegistrationExtensionInputs *extensions;
  void *v11;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest excludedCredentials](self, "excludedCredentials");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapObjectsUsingBlock:", &__block_literal_global_16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc(MEMORY[0x24BE0B258]);
  -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest challenge](self, "challenge");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest clientData](self, "clientData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "jsonForOperationType:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest relyingPartyIdentifier](self, "relyingPartyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest userID](self, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest displayName](self, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest attestationPreference](self, "attestationPreference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest userVerificationPreference](self, "userVerificationPreference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  extensions = self->_extensions;
  -[ASPublicKeyCredentialClientData origin](self->_clientData, "origin");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v14, "initWithChallenge:clientDataJSON:clientDataHash:relyingPartyIdentifier:userName:userIdentifier:userDisplayName:supportedAlgorithmIdentifiers:attestationPreference:userVerificationPreference:excludedCredentials:extensions:origin:", v16, v13, 0, v4, v5, v6, v7, &unk_24C96DF60, v8, v9, v17, extensions, v11);

  objc_msgSend(v15, "setShouldHideHybrid:", !self->_shouldShowHybridTransport);
  return (ASCPublicKeyCredentialCreationOptions *)v15;
}

id __94__ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest_coreCredentialCreationOptions__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x24BE0B260];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "credentialID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithCredentialID:transports:", v5, 0);
  return v6;
}

- (BOOL)supportsStyle:(int64_t)a3
{
  return (a3 & 1) == 0 && (unint64_t)a3 < 3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  ASAuthorizationPlatformPublicKeyCredentialProvider *v13;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *v14;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *v15;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("challenge"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userVerificationPreference"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attestationPreference"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("requestStyle"));
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientData"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ASAuthorizationPlatformPublicKeyCredentialProvider initWithRelyingPartyIdentifier:]([ASAuthorizationPlatformPublicKeyCredentialProvider alloc], "initWithRelyingPartyIdentifier:", v4);
  v14 = -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest _initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:](self, "_initWithProvider:relyingPartyIdentifier:challenge:name:userID:clientData:requestStyle:", v13, v4, v8, v7, v5, v12, v11);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_displayName, v6);
    objc_storeStrong((id *)&v14->_userVerificationPreference, v9);
    objc_storeStrong((id *)&v14->_attestationPreference, v10);
    v15 = v14;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *relyingPartyIdentifier;
  id v5;

  relyingPartyIdentifier = self->_relyingPartyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userID, CFSTR("userID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("displayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_challenge, CFSTR("challenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userVerificationPreference, CFSTR("userVerificationPreference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestationPreference, CFSTR("attestationPreference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientData, CFSTR("clientData"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_requestStyle, CFSTR("requestStyle"));

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

- (void)setExcludedCredentials:(id)a3
{
  NSArray *v4;
  NSArray *excludedCredentials;

  v4 = (NSArray *)a3;
  os_unfair_lock_lock(&self->_internalLock);
  excludedCredentials = self->_excludedCredentials;
  self->_excludedCredentials = v4;

  os_unfair_lock_unlock(&self->_internalLock);
}

- (BOOL)shouldShowHybridTransport
{
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *v2;
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

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (int64_t)requestStyle
{
  return self->_requestStyle;
}

- (void)setRequestStyle:(int64_t)a3
{
  self->_requestStyle = a3;
}

- (ASCPublicKeyCredentialRegistrationExtensionInputs)extensions
{
  return self->_extensions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);
  objc_storeStrong((id *)&self->_clientData, 0);
  objc_storeStrong((id *)&self->_attestationPreference, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

- (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput)__largeBlobSwift
{
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *v2;
  id v3;

  v2 = self;
  v3 = ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__largeBlobSwift.getter();

  return (ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput *)v3;
}

- (void)__setLargeBlobSwift:(id)a3
{
  id v5;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *v6;

  v5 = a3;
  v6 = self;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__largeBlobSwift.setter(a3);

}

- (ASAuthorizationPublicKeyCredentialPRFRegistrationInput)__prfSwift
{
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *v2;
  id v3;

  v2 = self;
  v3 = ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__prfSwift.getter();

  return (ASAuthorizationPublicKeyCredentialPRFRegistrationInput *)v3;
}

- (void)__setPRFSwift:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest *v8;
  id v9;
  ASCPublicKeyCredentialRegistrationExtensionInputs *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29950);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  v9 = a3;
  v10 = -[ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest extensions](v8, sel_extensions);
  if (v9)
  {
    v11 = v9;
    sub_20E53A02C();

    v12 = sub_20E5570E0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v7, 0, 1, v12);
  }
  else
  {
    v13 = sub_20E5570E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v7, 1, 1, v13);
  }
  sub_20E5570F8();

}

+ (id)emptyExtensions
{
  return objc_msgSend(objc_allocWithZone((Class)sub_20E55714C()), sel_init);
}

@end
