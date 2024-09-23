@implementation ASCPublicKeyCredentialCreationOptions

- (ASCPublicKeyCredentialCreationOptions)initWithChallenge:(id)a3 clientDataJSON:(id)a4 clientDataHash:(id)a5 relyingPartyIdentifier:(id)a6 userName:(id)a7 userIdentifier:(id)a8 userDisplayName:(id)a9 supportedAlgorithmIdentifiers:(id)a10 attestationPreference:(id)a11 userVerificationPreference:(id)a12 excludedCredentials:(id)a13 extensions:(id)a14 origin:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  ASCPublicKeyCredentialCreationOptions *v29;
  uint64_t v30;
  NSData *challenge;
  uint64_t v32;
  NSData *clientDataJSON;
  uint64_t v34;
  NSData *clientDataHash;
  uint64_t v36;
  NSString *relyingPartyIdentifier;
  uint64_t v38;
  NSString *userName;
  uint64_t v40;
  NSData *userIdentifier;
  uint64_t v42;
  NSString *userDisplayName;
  uint64_t v44;
  NSArray *supportedAlgorithmIdentifiers;
  uint64_t v46;
  NSString *attestationPreference;
  uint64_t v48;
  NSString *userVerificationPreference;
  uint64_t v50;
  NSArray *excludedCredentials;
  void *v52;
  void *v53;
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *v54;
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *extensions;
  uint64_t v56;
  NSString *origin;
  ASCPublicKeyCredentialCreationOptions *v58;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  objc_super v66;

  v65 = a3;
  v20 = a4;
  v64 = a5;
  v63 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v24 = a10;
  v62 = a11;
  v25 = a12;
  v26 = a13;
  v27 = a14;
  v28 = a15;
  v66.receiver = self;
  v66.super_class = (Class)ASCPublicKeyCredentialCreationOptions;
  v29 = -[ASCPublicKeyCredentialCreationOptions init](&v66, sel_init);
  if (v29)
  {
    v30 = objc_msgSend(v65, "copy");
    challenge = v29->_challenge;
    v29->_challenge = (NSData *)v30;

    v61 = v20;
    v32 = objc_msgSend(v20, "copy");
    clientDataJSON = v29->_clientDataJSON;
    v29->_clientDataJSON = (NSData *)v32;

    v34 = objc_msgSend(v64, "copy");
    clientDataHash = v29->_clientDataHash;
    v29->_clientDataHash = (NSData *)v34;

    v36 = objc_msgSend(v63, "copy");
    relyingPartyIdentifier = v29->_relyingPartyIdentifier;
    v29->_relyingPartyIdentifier = (NSString *)v36;

    v38 = objc_msgSend(v21, "copy");
    userName = v29->_userName;
    v29->_userName = (NSString *)v38;

    v40 = objc_msgSend(v22, "copy");
    userIdentifier = v29->_userIdentifier;
    v29->_userIdentifier = (NSData *)v40;

    v42 = objc_msgSend(v23, "copy");
    userDisplayName = v29->_userDisplayName;
    v29->_userDisplayName = (NSString *)v42;

    v44 = objc_msgSend(v24, "copy");
    supportedAlgorithmIdentifiers = v29->_supportedAlgorithmIdentifiers;
    v29->_supportedAlgorithmIdentifiers = (NSArray *)v44;

    v46 = objc_msgSend(v62, "copy");
    attestationPreference = v29->_attestationPreference;
    v29->_attestationPreference = (NSString *)v46;

    v48 = objc_msgSend(v25, "copy");
    userVerificationPreference = v29->_userVerificationPreference;
    v29->_userVerificationPreference = (NSString *)v48;

    v50 = objc_msgSend(v26, "copy");
    excludedCredentials = v29->_excludedCredentials;
    v29->_excludedCredentials = (NSArray *)v50;

    v52 = (void *)objc_msgSend(v27, "copy");
    v53 = v52;
    if (v52)
      v54 = v52;
    else
      v54 = objc_alloc_init(_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs);
    extensions = v29->_extensions;
    v29->_extensions = v54;

    v56 = objc_msgSend(v28, "copy");
    origin = v29->_origin;
    v29->_origin = (NSString *)v56;

    v58 = v29;
    v20 = v61;
  }

  return v29;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *challenge;
  id v5;

  challenge = self->_challenge;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", challenge, CFSTR("challenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientDataHash, CFSTR("clientDataHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientDataJSON, CFSTR("clientDataJSON"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userName, CFSTR("userName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userIdentifier, CFSTR("userIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userDisplayName, CFSTR("userDisplayName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_supportedAlgorithmIdentifiers, CFSTR("supportedAlgorithmIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userVerificationPreference, CFSTR("userVerificationPreference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_attestationPreference, CFSTR("attestationPreference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeout, CFSTR("timeout"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_residentKeyPreference, CFSTR("residentKeyPreference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_excludedCredentials, CFSTR("excludedCredentials"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensions, CFSTR("extensions"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldHideHybrid, CFSTR("shouldHideHybrid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_origin, CFSTR("origin"));

}

- (ASCPublicKeyCredentialCreationOptions)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  ASCPublicKeyCredentialCreationOptions *v11;
  ASCPublicKeyCredentialCreationOptions *v12;
  uint64_t v13;
  NSString *relyingPartyIdentifier;
  uint64_t v15;
  NSString *userName;
  uint64_t v17;
  NSData *userIdentifier;
  uint64_t v19;
  NSString *userDisplayName;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  NSArray *supportedAlgorithmIdentifiers;
  uint64_t v26;
  NSString *userVerificationPreference;
  uint64_t v28;
  NSString *attestationPreference;
  uint64_t v30;
  NSNumber *timeout;
  void *v32;
  void *v33;
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *v34;
  NSObject *v35;
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *extensions;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  NSArray *excludedCredentials;
  uint64_t v42;
  objc_super v44;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("challenge"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDataHash"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDataJSON"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v5)
    v9 = 0;
  else
    v9 = v6 == 0;
  if (v9 && v7 == 0)
  {
    v35 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[ASCPublicKeyCredentialCreationOptions initWithCoder:].cold.1(v35);
    v12 = 0;
    goto LABEL_16;
  }
  v44.receiver = self;
  v44.super_class = (Class)ASCPublicKeyCredentialCreationOptions;
  v11 = -[ASCPublicKeyCredentialCreationOptions init](&v44, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_challenge, v5);
    objc_storeStrong((id *)&v12->_clientDataHash, v6);
    objc_storeStrong((id *)&v12->_clientDataJSON, v8);
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
    v13 = objc_claimAutoreleasedReturnValue();
    relyingPartyIdentifier = v12->_relyingPartyIdentifier;
    v12->_relyingPartyIdentifier = (NSString *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userName"));
    v15 = objc_claimAutoreleasedReturnValue();
    userName = v12->_userName;
    v12->_userName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentifier"));
    v17 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v12->_userIdentifier;
    v12->_userIdentifier = (NSData *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userDisplayName"));
    v19 = objc_claimAutoreleasedReturnValue();
    userDisplayName = v12->_userDisplayName;
    v12->_userDisplayName = (NSString *)v19;

    v21 = (void *)MEMORY[0x24BDBCF20];
    v22 = objc_opt_class();
    objc_msgSend(v21, "setWithObjects:", v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("supportedAlgorithmIdentifiers"));
    v24 = objc_claimAutoreleasedReturnValue();
    supportedAlgorithmIdentifiers = v12->_supportedAlgorithmIdentifiers;
    v12->_supportedAlgorithmIdentifiers = (NSArray *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userVerificationPreference"));
    v26 = objc_claimAutoreleasedReturnValue();
    userVerificationPreference = v12->_userVerificationPreference;
    v12->_userVerificationPreference = (NSString *)v26;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("attestationPreference"));
    v28 = objc_claimAutoreleasedReturnValue();
    attestationPreference = v12->_attestationPreference;
    v12->_attestationPreference = (NSString *)v28;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeout"));
    v30 = objc_claimAutoreleasedReturnValue();
    timeout = v12->_timeout;
    v12->_timeout = (NSNumber *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensions"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v32)
      v34 = v32;
    else
      v34 = objc_alloc_init(_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs);
    extensions = v12->_extensions;
    v12->_extensions = v34;

    v12->_residentKeyPreference = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("residentKeyPreference"));
    v37 = (void *)MEMORY[0x24BDBCF20];
    v38 = objc_opt_class();
    objc_msgSend(v37, "setWithObjects:", v38, objc_opt_class(), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v39, CFSTR("excludedCredentials"));
    v40 = objc_claimAutoreleasedReturnValue();
    excludedCredentials = v12->_excludedCredentials;
    v12->_excludedCredentials = (NSArray *)v40;

    v12->_shouldHideHybrid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldHideHybrid"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("origin"));
    v42 = objc_claimAutoreleasedReturnValue();
    self = (ASCPublicKeyCredentialCreationOptions *)v12->_origin;
    v12->_origin = (NSString *)v42;
LABEL_16:

  }
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ASCPublicKeyCredentialCreationOptions *v4;
  uint64_t v5;
  NSData *challenge;
  uint64_t v7;
  NSData *clientDataHash;
  uint64_t v9;
  NSData *clientDataJSON;
  uint64_t v11;
  NSString *relyingPartyIdentifier;
  uint64_t v13;
  NSString *userName;
  uint64_t v15;
  NSData *userIdentifier;
  uint64_t v17;
  NSString *userDisplayName;
  uint64_t v19;
  NSArray *supportedAlgorithmIdentifiers;
  uint64_t v21;
  NSString *userVerificationPreference;
  uint64_t v23;
  NSString *attestationPreference;
  uint64_t v25;
  NSNumber *timeout;
  uint64_t v27;
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *extensions;
  uint64_t v29;
  NSArray *excludedCredentials;
  ASCPublicKeyCredentialCreationOptions *v31;

  v4 = -[ASCPublicKeyCredentialCreationOptions init](+[ASCPublicKeyCredentialCreationOptions allocWithZone:](ASCPublicKeyCredentialCreationOptions, "allocWithZone:", a3), "init");
  if (v4)
  {
    v5 = -[NSData copy](self->_challenge, "copy");
    challenge = v4->_challenge;
    v4->_challenge = (NSData *)v5;

    v7 = -[NSData copy](self->_clientDataHash, "copy");
    clientDataHash = v4->_clientDataHash;
    v4->_clientDataHash = (NSData *)v7;

    v9 = -[NSData copy](self->_clientDataJSON, "copy");
    clientDataJSON = v4->_clientDataJSON;
    v4->_clientDataJSON = (NSData *)v9;

    v11 = -[NSString copy](self->_relyingPartyIdentifier, "copy");
    relyingPartyIdentifier = v4->_relyingPartyIdentifier;
    v4->_relyingPartyIdentifier = (NSString *)v11;

    v13 = -[NSString copy](self->_userName, "copy");
    userName = v4->_userName;
    v4->_userName = (NSString *)v13;

    v15 = -[NSData copy](self->_userIdentifier, "copy");
    userIdentifier = v4->_userIdentifier;
    v4->_userIdentifier = (NSData *)v15;

    v17 = -[NSString copy](self->_userDisplayName, "copy");
    userDisplayName = v4->_userDisplayName;
    v4->_userDisplayName = (NSString *)v17;

    v19 = -[NSArray copy](self->_supportedAlgorithmIdentifiers, "copy");
    supportedAlgorithmIdentifiers = v4->_supportedAlgorithmIdentifiers;
    v4->_supportedAlgorithmIdentifiers = (NSArray *)v19;

    v21 = -[NSString copy](self->_userVerificationPreference, "copy");
    userVerificationPreference = v4->_userVerificationPreference;
    v4->_userVerificationPreference = (NSString *)v21;

    v23 = -[NSString copy](self->_attestationPreference, "copy");
    attestationPreference = v4->_attestationPreference;
    v4->_attestationPreference = (NSString *)v23;

    v25 = -[NSNumber copy](self->_timeout, "copy");
    timeout = v4->_timeout;
    v4->_timeout = (NSNumber *)v25;

    v27 = -[ASCPublicKeyCredentialRegistrationExtensionInputs copy](self->_extensions, "copy");
    extensions = v4->_extensions;
    v4->_extensions = (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *)v27;

    v4->_residentKeyPreference = self->_residentKeyPreference;
    v29 = -[NSArray copy](self->_excludedCredentials, "copy");
    excludedCredentials = v4->_excludedCredentials;
    v4->_excludedCredentials = (NSArray *)v29;

    v4->_shouldHideHybrid = self->_shouldHideHybrid;
    objc_storeStrong((id *)&v4->_origin, self->_origin);
    v31 = v4;
  }

  return v4;
}

- (BOOL)shouldRequireResidentKey
{
  return self->_residentKeyPreference == 3;
}

- (void)setShouldRequireResidentKey:(BOOL)a3
{
  int64_t v3;

  v3 = 3;
  if (!a3)
    v3 = 1;
  self->_residentKeyPreference = v3;
}

- (void)logRequest
{
  NSObject *v3;
  NSString *relyingPartyIdentifier;
  NSString *userName;
  NSString *userDisplayName;
  NSData *userIdentifier;
  NSString *userVerificationPreference;
  NSArray *supportedAlgorithmIdentifiers;
  unint64_t residentKeyPreference;
  const __CFString *v11;
  NSArray *excludedCredentials;
  NSObject *v13;
  uint64_t v14;
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *extensions;
  NSString *attestationPreference;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  NSData *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  NSString *v30;
  __int16 v31;
  NSArray *v32;
  __int16 v33;
  NSString *v34;
  __int16 v35;
  NSString *v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  _TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v3 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    userName = self->_userName;
    userIdentifier = self->_userIdentifier;
    userDisplayName = self->_userDisplayName;
    supportedAlgorithmIdentifiers = self->_supportedAlgorithmIdentifiers;
    userVerificationPreference = self->_userVerificationPreference;
    attestationPreference = self->_attestationPreference;
    residentKeyPreference = self->_residentKeyPreference;
    if (residentKeyPreference > 3)
      v11 = CFSTR("unknown");
    else
      v11 = off_24C97F918[residentKeyPreference];
    excludedCredentials = self->_excludedCredentials;
    v13 = v3;
    v14 = -[NSArray count](excludedCredentials, "count");
    extensions = self->_extensions;
    *(_DWORD *)buf = 141561091;
    v18 = 1752392040;
    v19 = 2113;
    v20 = relyingPartyIdentifier;
    v21 = 2160;
    v22 = 1752392040;
    v23 = 2113;
    v24 = userName;
    v25 = 2114;
    v26 = userIdentifier;
    v27 = 2160;
    v28 = 1752392040;
    v29 = 2113;
    v30 = userDisplayName;
    v31 = 2114;
    v32 = supportedAlgorithmIdentifiers;
    v33 = 2114;
    v34 = userVerificationPreference;
    v35 = 2114;
    v36 = attestationPreference;
    v37 = 2114;
    v38 = v11;
    v39 = 2050;
    v40 = v14;
    v41 = 2114;
    v42 = extensions;
    _os_log_impl(&dword_20E648000, v13, OS_LOG_TYPE_INFO, "\tRP: %{private, mask.hash}@\n\tname: %{private, mask.hash}@\n\tuserHandle: %{public}@\n\tdisplayName: %{private, mask.hash}@\n\talgorithms: %{public}@\n\tuv: %{public}@\n\tattestation: %{public}@\n\trk: %{public}@\n\texcludeCredentialsCount: %{public}lu\n\textensions: %{public}@\n", buf, 0x84u);

  }
}

- (NSData)extensionsCBORForWebKit
{
  return (NSData *)-[ASCPublicKeyCredentialRegistrationExtensionInputs cborForWebKit](self->_extensions, "cborForWebKit");
}

- (NSData)challenge
{
  return self->_challenge;
}

- (void)setChallenge:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (void)setClientDataHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSData)clientDataJSON
{
  return self->_clientDataJSON;
}

- (void)setClientDataJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (void)setRelyingPartyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)userName
{
  return self->_userName;
}

- (void)setUserName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSData)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)userDisplayName
{
  return self->_userDisplayName;
}

- (void)setUserDisplayName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)supportedAlgorithmIdentifiers
{
  return self->_supportedAlgorithmIdentifiers;
}

- (void)setSupportedAlgorithmIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)userVerificationPreference
{
  return self->_userVerificationPreference;
}

- (void)setUserVerificationPreference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)attestationPreference
{
  return self->_attestationPreference;
}

- (void)setAttestationPreference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (_TtC26AuthenticationServicesCore49ASCPublicKeyCredentialRegistrationExtensionInputs)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (NSArray)excludedCredentials
{
  return self->_excludedCredentials;
}

- (void)setExcludedCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (int64_t)residentKeyPreference
{
  return self->_residentKeyPreference;
}

- (void)setResidentKeyPreference:(int64_t)a3
{
  self->_residentKeyPreference = a3;
}

- (BOOL)shouldHideHybrid
{
  return self->_shouldHideHybrid;
}

- (void)setShouldHideHybrid:(BOOL)a3
{
  self->_shouldHideHybrid = a3;
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_excludedCredentials, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_attestationPreference, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_supportedAlgorithmIdentifiers, 0);
  objc_storeStrong((id *)&self->_userDisplayName, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_userName, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
  objc_storeStrong((id *)&self->_clientDataJSON, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
}

- (void)initWithCoder:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20E648000, log, OS_LOG_TYPE_ERROR, "At least one of clientDataHash, challenge, or clientDataJSON must be non-nil", v1, 2u);
}

@end
