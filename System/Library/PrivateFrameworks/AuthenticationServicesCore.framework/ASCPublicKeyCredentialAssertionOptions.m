@implementation ASCPublicKeyCredentialAssertionOptions

- (id)_initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 clientDataHash:(id)a6 clientDataJSON:(id)a7 userVerificationPreference:(id)a8 allowedCredentials:(id)a9 shouldHideHybrid:(BOOL)a10 extensions:(id)a11 origin:(id)a12 appIDForSecurityKeys:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  ASCPublicKeyCredentialAssertionOptions *v26;
  ASCPublicKeyCredentialAssertionOptions *v27;
  uint64_t v28;
  NSString *relyingPartyIdentifier;
  uint64_t v30;
  NSData *challenge;
  uint64_t v32;
  NSString *userVerificationPreference;
  uint64_t v34;
  NSArray *allowedCredentials;
  uint64_t v36;
  NSData *clientDataHash;
  uint64_t v38;
  NSData *clientDataJSON;
  uint64_t v40;
  NSString *origin;
  uint64_t v42;
  NSString *appIDForSecurityKeys;
  ASCPublicKeyCredentialAssertionOptions *v44;
  id v47;
  objc_super v48;

  v18 = a4;
  v19 = a5;
  v47 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a11;
  v24 = a12;
  v25 = a13;
  v48.receiver = self;
  v48.super_class = (Class)ASCPublicKeyCredentialAssertionOptions;
  v26 = -[ASCPublicKeyCredentialAssertionOptions init](&v48, sel_init);
  v27 = v26;
  if (v26)
  {
    v26->_credentialKind = a3;
    v28 = objc_msgSend(v18, "copy");
    relyingPartyIdentifier = v27->_relyingPartyIdentifier;
    v27->_relyingPartyIdentifier = (NSString *)v28;

    v30 = objc_msgSend(v19, "copy");
    challenge = v27->_challenge;
    v27->_challenge = (NSData *)v30;

    v32 = objc_msgSend(v21, "copy");
    userVerificationPreference = v27->_userVerificationPreference;
    v27->_userVerificationPreference = (NSString *)v32;

    v34 = objc_msgSend(v22, "copy");
    allowedCredentials = v27->_allowedCredentials;
    v27->_allowedCredentials = (NSArray *)v34;

    v36 = objc_msgSend(v47, "copy");
    clientDataHash = v27->_clientDataHash;
    v27->_clientDataHash = (NSData *)v36;

    v38 = objc_msgSend(v20, "copy");
    clientDataJSON = v27->_clientDataJSON;
    v27->_clientDataJSON = (NSData *)v38;

    v27->_shouldHideHybrid = a10;
    objc_storeStrong((id *)&v27->_extensions, a11);
    v40 = objc_msgSend(v24, "copy");
    origin = v27->_origin;
    v27->_origin = (NSString *)v40;

    v42 = objc_msgSend(v25, "copy");
    appIDForSecurityKeys = v27->_appIDForSecurityKeys;
    v27->_appIDForSecurityKeys = (NSString *)v42;

    v44 = v27;
  }

  return v27;
}

- (ASCPublicKeyCredentialAssertionOptions)initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 challenge:(id)a5 userVerificationPreference:(id)a6 allowedCredentials:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *v16;
  ASCPublicKeyCredentialAssertionOptions *v17;
  uint64_t v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = objc_alloc_init(_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs);
  LOBYTE(v19) = 0;
  v17 = -[ASCPublicKeyCredentialAssertionOptions _initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:](self, "_initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:", a3, v15, v14, 0, 0, v13, v12, v19, v16, 0, 0);

  return v17;
}

- (ASCPublicKeyCredentialAssertionOptions)initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 clientDataHash:(id)a5 userVerificationPreference:(id)a6 allowedCredentials:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *v16;
  ASCPublicKeyCredentialAssertionOptions *v17;
  uint64_t v19;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = objc_alloc_init(_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs);
  LOBYTE(v19) = 0;
  v17 = -[ASCPublicKeyCredentialAssertionOptions _initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:](self, "_initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:", a3, v15, 0, v14, 0, v13, v12, v19, v16, 0, 0);

  return v17;
}

- (ASCPublicKeyCredentialAssertionOptions)initWithKind:(unint64_t)a3 relyingPartyIdentifier:(id)a4 clientDataJSON:(id)a5 userVerificationPreference:(id)a6 allowedCredentials:(id)a7 origin:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *v19;
  ASCPublicKeyCredentialAssertionOptions *v20;
  uint64_t v22;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = objc_alloc_init(_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs);
  LOBYTE(v22) = 0;
  v20 = -[ASCPublicKeyCredentialAssertionOptions _initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:](self, "_initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:", a3, v18, 0, 0, v17, v16, v15, v22, v19, v14, 0);

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASCPublicKeyCredentialAssertionOptions)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  ASCPublicKeyCredentialAssertionOptions *v7;
  void *v8;
  void *v9;
  void *v10;
  ASCPublicKeyCredentialAssertionOptions *v11;
  NSString *v12;
  NSString *relyingPartyIdentifier;
  NSString *v14;
  NSString *userVerificationPreference;
  NSNumber *v16;
  NSNumber *timeout;
  void *v18;
  void *v19;
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *v20;
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *extensions;
  void *v22;
  uint64_t v23;
  void *v24;
  NSArray *v25;
  NSArray *allowedCredentials;
  NSString *v27;
  NSString *destinationSiteForCrossSiteAssertion;
  NSString *v29;
  NSString *origin;
  NSString *v31;
  NSString *appIDForSecurityKeys;
  ASCPublicKeyCredentialAssertionOptions *v33;
  objc_super v35;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("credentialKind"));
  if ((unint64_t)(v5 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("challenge"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDataHash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientDataJSON"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v35.receiver = self;
    v35.super_class = (Class)ASCPublicKeyCredentialAssertionOptions;
    v11 = -[ASCPublicKeyCredentialAssertionOptions init](&v35, sel_init);
    self = v11;
    if (v11)
    {
      v11->_credentialKind = v5;
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("relyingPartyIdentifier"));
      v12 = (NSString *)objc_claimAutoreleasedReturnValue();
      relyingPartyIdentifier = self->_relyingPartyIdentifier;
      self->_relyingPartyIdentifier = v12;

      objc_storeStrong((id *)&self->_challenge, v8);
      objc_storeStrong((id *)&self->_clientDataHash, v9);
      objc_storeStrong((id *)&self->_clientDataJSON, v10);
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userVerificationPreference"));
      v14 = (NSString *)objc_claimAutoreleasedReturnValue();
      userVerificationPreference = self->_userVerificationPreference;
      self->_userVerificationPreference = v14;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeout"));
      v16 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      timeout = self->_timeout;
      self->_timeout = v16;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensions"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        v20 = v18;
      else
        v20 = objc_alloc_init(_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs);
      extensions = self->_extensions;
      self->_extensions = v20;

      v22 = (void *)MEMORY[0x24BDBCF20];
      v23 = objc_opt_class();
      objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("allowedCredentials"));
      v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
      allowedCredentials = self->_allowedCredentials;
      self->_allowedCredentials = v25;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("destinationSiteForCrossSiteAssertion"));
      v27 = (NSString *)objc_claimAutoreleasedReturnValue();
      destinationSiteForCrossSiteAssertion = self->_destinationSiteForCrossSiteAssertion;
      self->_destinationSiteForCrossSiteAssertion = v27;

      self->_shouldHideHybrid = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldHideHybrid"));
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("origin"));
      v29 = (NSString *)objc_claimAutoreleasedReturnValue();
      origin = self->_origin;
      self->_origin = v29;

      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("appIDForSecurityKeys"));
      v31 = (NSString *)objc_claimAutoreleasedReturnValue();
      appIDForSecurityKeys = self->_appIDForSecurityKeys;
      self->_appIDForSecurityKeys = v31;

      v33 = self;
    }

    v7 = self;
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ASCPublicKeyCredentialAssertionOptions initWithCoder:].cold.1(v5, v6);
    v7 = 0;
  }

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t credentialKind;
  id v5;

  credentialKind = self->_credentialKind;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", credentialKind, CFSTR("credentialKind"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_relyingPartyIdentifier, CFSTR("relyingPartyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_challenge, CFSTR("challenge"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientDataHash, CFSTR("clientDataHash"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientDataJSON, CFSTR("clientDataJSON"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userVerificationPreference, CFSTR("userVerificationPreference"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timeout, CFSTR("timeout"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_extensions, CFSTR("extensions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_allowedCredentials, CFSTR("allowedCredentials"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationSiteForCrossSiteAssertion, CFSTR("destinationSiteForCrossSiteAssertion"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldHideHybrid, CFSTR("shouldHideHybrid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_origin, CFSTR("origin"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appIDForSecurityKeys, CFSTR("appIDForSecurityKeys"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  ASCPublicKeyCredentialAssertionOptions *v4;
  unint64_t credentialKind;
  NSString *relyingPartyIdentifier;
  NSData *clientDataHash;
  NSString *userVerificationPreference;
  NSData *challenge;
  NSData *clientDataJSON;
  NSArray *allowedCredentials;
  uint64_t v13;
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *extensions;
  NSString *origin;
  NSString *appIDForSecurityKeys;

  if (self->_clientDataHash)
  {
    v4 = +[ASCPublicKeyCredentialAssertionOptions allocWithZone:](ASCPublicKeyCredentialAssertionOptions, "allocWithZone:", a3);
    credentialKind = self->_credentialKind;
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    clientDataHash = self->_clientDataHash;
    userVerificationPreference = self->_userVerificationPreference;
    origin = self->_origin;
    appIDForSecurityKeys = self->_appIDForSecurityKeys;
    extensions = self->_extensions;
    LOBYTE(v13) = self->_shouldHideHybrid;
    allowedCredentials = self->_allowedCredentials;
    challenge = 0;
  }
  else
  {
    if (self->_clientDataJSON)
    {
      v4 = self;
      credentialKind = v4->_credentialKind;
      relyingPartyIdentifier = v4->_relyingPartyIdentifier;
      clientDataJSON = self->_clientDataJSON;
      userVerificationPreference = v4->_userVerificationPreference;
      origin = v4->_origin;
      appIDForSecurityKeys = v4->_appIDForSecurityKeys;
      extensions = v4->_extensions;
      LOBYTE(v13) = v4->_shouldHideHybrid;
      allowedCredentials = v4->_allowedCredentials;
      challenge = 0;
      clientDataHash = 0;
      return -[ASCPublicKeyCredentialAssertionOptions _initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:](v4, "_initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:", credentialKind, relyingPartyIdentifier, challenge, clientDataHash, clientDataJSON, userVerificationPreference, allowedCredentials, v13, extensions, origin, appIDForSecurityKeys);
    }
    v4 = +[ASCPublicKeyCredentialAssertionOptions allocWithZone:](ASCPublicKeyCredentialAssertionOptions, "allocWithZone:", a3);
    credentialKind = self->_credentialKind;
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    challenge = self->_challenge;
    userVerificationPreference = self->_userVerificationPreference;
    origin = self->_origin;
    appIDForSecurityKeys = self->_appIDForSecurityKeys;
    extensions = self->_extensions;
    LOBYTE(v13) = self->_shouldHideHybrid;
    allowedCredentials = self->_allowedCredentials;
    clientDataHash = 0;
  }
  clientDataJSON = 0;
  return -[ASCPublicKeyCredentialAssertionOptions _initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:](v4, "_initWithKind:relyingPartyIdentifier:challenge:clientDataHash:clientDataJSON:userVerificationPreference:allowedCredentials:shouldHideHybrid:extensions:origin:appIDForSecurityKeys:", credentialKind, relyingPartyIdentifier, challenge, clientDataHash, clientDataJSON, userVerificationPreference, allowedCredentials, v13, extensions, origin, appIDForSecurityKeys);
}

- (void)logRequest
{
  void *v3;
  NSObject *v4;
  NSString *relyingPartyIdentifier;
  NSString *userVerificationPreference;
  NSArray *allowedCredentials;
  NSObject *v8;
  uint64_t v9;
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *extensions;
  NSString *appIDForSecurityKeys;
  int v12;
  uint64_t v13;
  __int16 v14;
  NSString *v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  _TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs *v23;
  __int16 v24;
  NSString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (-[NSArray count](self->_allowedCredentials, "count"))
  {
    -[NSArray safari_mapAndFilterObjectsUsingBlock:](self->_allowedCredentials, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_9);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    relyingPartyIdentifier = self->_relyingPartyIdentifier;
    userVerificationPreference = self->_userVerificationPreference;
    allowedCredentials = self->_allowedCredentials;
    v8 = v4;
    v9 = -[NSArray count](allowedCredentials, "count");
    extensions = self->_extensions;
    appIDForSecurityKeys = self->_appIDForSecurityKeys;
    v12 = 141559555;
    v13 = 1752392040;
    v14 = 2113;
    v15 = relyingPartyIdentifier;
    v16 = 2114;
    v17 = userVerificationPreference;
    v18 = 2050;
    v19 = v9;
    v20 = 2114;
    v21 = v3;
    v22 = 2114;
    v23 = extensions;
    v24 = 2114;
    v25 = appIDForSecurityKeys;
    _os_log_impl(&dword_20E648000, v8, OS_LOG_TYPE_INFO, "\tRP: %{private, mask.hash}@\n\tuv: %{public}@\n\tallowedCredentialsCount: %{public}lu\n\ttransports: %{public}@\n\textensions: %{public}@\n\tappID: %{public}@\n", (uint8_t *)&v12, 0x48u);

  }
}

uint64_t __52__ASCPublicKeyCredentialAssertionOptions_logRequest__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "transports");
}

- (NSData)extensionsCBORForWebKit
{
  return (NSData *)-[ASCPublicKeyCredentialAssertionExtensionInputs cborForWebKit](self->_extensions, "cborForWebKit");
}

- (unint64_t)credentialKind
{
  return self->_credentialKind;
}

- (NSString)relyingPartyIdentifier
{
  return self->_relyingPartyIdentifier;
}

- (NSData)challenge
{
  return self->_challenge;
}

- (NSData)clientDataHash
{
  return self->_clientDataHash;
}

- (void)setClientDataHash:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSData)clientDataJSON
{
  return self->_clientDataJSON;
}

- (void)setClientDataJSON:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)userVerificationPreference
{
  return self->_userVerificationPreference;
}

- (NSNumber)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (_TtC26AuthenticationServicesCore46ASCPublicKeyCredentialAssertionExtensionInputs)extensions
{
  return self->_extensions;
}

- (void)setExtensions:(id)a3
{
  objc_storeStrong((id *)&self->_extensions, a3);
}

- (NSArray)allowedCredentials
{
  return self->_allowedCredentials;
}

- (void)setAllowedCredentials:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)destinationSiteForCrossSiteAssertion
{
  return self->_destinationSiteForCrossSiteAssertion;
}

- (void)setDestinationSiteForCrossSiteAssertion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)shouldHideHybrid
{
  return self->_shouldHideHybrid;
}

- (void)setShouldHideHybrid:(BOOL)a3
{
  self->_shouldHideHybrid = a3;
}

- (NSString)appIDForSecurityKeys
{
  return self->_appIDForSecurityKeys;
}

- (void)setAppIDForSecurityKeys:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_appIDForSecurityKeys, 0);
  objc_storeStrong((id *)&self->_destinationSiteForCrossSiteAssertion, 0);
  objc_storeStrong((id *)&self->_allowedCredentials, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_userVerificationPreference, 0);
  objc_storeStrong((id *)&self->_clientDataJSON, 0);
  objc_storeStrong((id *)&self->_clientDataHash, 0);
  objc_storeStrong((id *)&self->_challenge, 0);
  objc_storeStrong((id *)&self->_relyingPartyIdentifier, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_20E648000, a2, OS_LOG_TYPE_ERROR, "Found unexpected value for credential kind: %ld", (uint8_t *)&v2, 0xCu);
}

@end
