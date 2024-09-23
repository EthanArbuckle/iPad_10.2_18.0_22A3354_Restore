@implementation VSIdentityProvider

- (VSIdentityProvider)init
{
  VSIdentityProvider *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VSIdentityProvider;
  v2 = -[VSIdentityProvider init](&v5, sel_init);
  if (v2)
  {
    VSIdentityProviderValueType();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInit(v3, v2);

  }
  return v2;
}

- (VSIdentityProvider)initWithCoder:(id)a3
{
  id v4;
  VSIdentityProvider *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VSIdentityProvider;
  v5 = -[VSIdentityProvider init](&v8, sel_init);
  if (v5)
  {
    VSIdentityProviderValueType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInitWithCoder(v6, v5, v4);

  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  VSIdentityProviderValueType();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  VSValueTypeEncodeWithCoder(v5, self, v4);

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;

  VSIdentityProviderValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeCopyWithZone(v5, self, (uint64_t)a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  VSIdentityProviderValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = VSValueTypeHash(v3, self);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  VSIdentityProviderValueType();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = VSValueTypeIsEqual(v5, self, v4);

  return (char)self;
}

- (id)description
{
  void *v3;
  void *v4;

  VSIdentityProviderValueType();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VSValueTypeDescription(v3, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (VSIdentityProvider)initWithApplicationProvider:(id)a3
{
  id v4;
  VSIdentityProvider *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  VSOptional *providerID;
  uint64_t v10;
  NSString *nameForSorting;
  NSArray *supportedAuthenticationSchemes;

  v4 = a3;
  v5 = -[VSIdentityProvider init](self, "init");
  if (v5)
  {
    VSIdentityProviderValueType();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    VSValueTypeInit(v6, v5);

    v5->_application = 1;
    objc_msgSend(v4, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    providerID = v5->_providerID;
    v5->_providerID = (VSOptional *)v8;

    objc_msgSend(v4, "localizedDisplayName");
    v10 = objc_claimAutoreleasedReturnValue();
    nameForSorting = v5->_nameForSorting;
    v5->_nameForSorting = (NSString *)v10;

    supportedAuthenticationSchemes = v5->_supportedAuthenticationSchemes;
    v5->_supportedAuthenticationSchemes = (NSArray *)MEMORY[0x1E0C9AA60];

  }
  return v5;
}

- (void)setNameForSorting:(id)a3
{
  id v4;
  NSString *v5;
  NSString *nameForSorting;
  NSString *displayName;

  if (self->_nameForSorting != a3)
  {
    v4 = a3;
    -[VSIdentityProvider willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("displayName"));
    v5 = (NSString *)objc_msgSend(v4, "copy");

    nameForSorting = self->_nameForSorting;
    self->_nameForSorting = v5;

    displayName = self->_displayName;
    self->_displayName = 0;

    -[VSIdentityProvider didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("displayName"));
  }
}

- (void)setDeveloper:(BOOL)a3
{
  NSString *displayName;

  if (self->_developer != a3)
  {
    -[VSIdentityProvider willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("displayName"));
    self->_developer = a3;
    displayName = self->_displayName;
    self->_displayName = 0;

    -[VSIdentityProvider didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("displayName"));
  }
}

- (VSOptional)displayName
{
  NSString **p_displayName;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  p_displayName = &self->_displayName;
  v4 = self->_displayName;
  if (!v4)
  {
    -[VSIdentityProvider nameForSorting](self, "nameForSorting");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      if (-[VSIdentityProvider isDeveloper](self, "isDeveloper"))
      {
        objc_msgSend(CFSTR("🚧 "), "stringByAppendingString:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = (NSString *)objc_msgSend(v6, "copy");

      }
      else
      {
        v4 = (NSString *)objc_msgSend(v5, "copy");
      }
    }
    else
    {
      v4 = 0;
    }
    objc_storeStrong((id *)p_displayName, v4);

  }
  +[VSOptional optionalWithObject:](VSOptional, "optionalWithObject:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (VSOptional *)v7;
}

- (NSArray)supportedTemplates
{
  VSIdentityProvider *v2;
  NSArray *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_supportedTemplates;
  if (!v3)
  {
    v5[0] = CFSTR("authenticationTemplate");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_supportedTemplates, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (NSArray)supportedAuthenticationSchemes
{
  VSIdentityProvider *v2;
  NSArray *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_supportedAuthenticationSchemes;
  if (!v3)
  {
    v5[0] = CFSTR("SAML");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v2->_supportedAuthenticationSchemes, v3);
  }
  objc_sync_exit(v2);

  if (!v3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("The __orNil parameter must not be nil."));
  return v3;
}

- (BOOL)supportsRequestsExpectingAuthenticationSchemes:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = [v4 alloc];
  -[VSIdentityProvider supportedAuthenticationSchemes](self, "supportedAuthenticationSchemes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithArray:", v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v5);
  LOBYTE(v5) = objc_msgSend(v8, "intersectsSet:", v9);

  return (char)v5;
}

- (BOOL)isFullySupportedForRequestsExpectingAuthenticationSchemes:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  BOOL v7;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[VSIdentityProvider isProhibitedByStore](self, "isProhibitedByStore"))
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[VSIdentityProvider isFullySupportedForRequestsExpectingAuthenticationSchemes:]";
      v6 = "%s: prohibited by store";
LABEL_9:
      _os_log_impl(&dword_1D2419000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (v4
    && !-[VSIdentityProvider supportsRequestsExpectingAuthenticationSchemes:](self, "supportsRequestsExpectingAuthenticationSchemes:", v4))
  {
    VSDefaultLogObject();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[VSIdentityProvider isFullySupportedForRequestsExpectingAuthenticationSchemes:]";
      v6 = "%s: does not support expected auth schemes";
      goto LABEL_9;
    }
LABEL_10:

    v7 = 0;
    goto LABEL_11;
  }
  v7 = 1;
LABEL_11:

  return v7;
}

- (VSOptional)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueID, a3);
}

- (VSOptional)providerID
{
  return self->_providerID;
}

- (void)setProviderID:(id)a3
{
  objc_storeStrong((id *)&self->_providerID, a3);
}

- (VSOptional)providerInfo
{
  return self->_providerInfo;
}

- (void)setProviderInfo:(id)a3
{
  objc_storeStrong((id *)&self->_providerInfo, a3);
}

- (NSString)nameForSorting
{
  return self->_nameForSorting;
}

- (NSNumber)rankForSorting
{
  return self->_rankForSorting;
}

- (void)setRankForSorting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void)setSupportedTemplates:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setSupportedAuthenticationSchemes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)requireAuthenticationURLSystemTrust
{
  return self->_requireAuthenticationURLSystemTrust;
}

- (void)setRequireAuthenticationURLSystemTrust:(BOOL)a3
{
  self->_requireAuthenticationURLSystemTrust = a3;
}

- (BOOL)requireXHRRequestSystemTrust
{
  return self->_requireXHRRequestSystemTrust;
}

- (void)setRequireXHRRequestSystemTrust:(BOOL)a3
{
  self->_requireXHRRequestSystemTrust = a3;
}

- (BOOL)isProhibitedByStore
{
  return self->_prohibitedByStore;
}

- (void)setProhibitedByStore:(BOOL)a3
{
  self->_prohibitedByStore = a3;
}

- (BOOL)isDeveloper
{
  return self->_developer;
}

- (BOOL)isApplication
{
  return self->_application;
}

- (void)setApplication:(BOOL)a3
{
  self->_application = a3;
}

- (NSURL)authenticationURL
{
  return self->_authenticationURL;
}

- (void)setAuthenticationURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSURL)appStoreRoomURL
{
  return self->_appStoreRoomURL;
}

- (void)setAppStoreRoomURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSArray)appAdamIDs
{
  return self->_appAdamIDs;
}

- (void)setAppAdamIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)defaultAppId
{
  return self->_defaultAppId;
}

- (void)setDefaultAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)providerArtworkTemplateURL
{
  return self->_providerArtworkTemplateURL;
}

- (void)setProviderArtworkTemplateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (BOOL)isSetTopBoxSupported
{
  return self->_isSetTopBoxSupported;
}

- (void)setIsSetTopBoxSupported:(BOOL)a3
{
  self->_isSetTopBoxSupported = a3;
}

- (BOOL)shouldShowChannelApps
{
  return self->_shouldShowChannelApps;
}

- (void)setShouldShowChannelApps:(BOOL)a3
{
  self->_shouldShowChannelApps = a3;
}

- (BOOL)shouldShowSubscriptionApps
{
  return self->_shouldShowSubscriptionApps;
}

- (void)setShouldShowSubscriptionApps:(BOOL)a3
{
  self->_shouldShowSubscriptionApps = a3;
}

- (BOOL)isSTBOptOutAllowed
{
  return self->_isSTBOptOutAllowed;
}

- (void)setIsSTBOptOutAllowed:(BOOL)a3
{
  self->_isSTBOptOutAllowed = a3;
}

- (NSString)providerAppArtworkTemplateURL
{
  return self->_providerAppArtworkTemplateURL;
}

- (void)setProviderAppArtworkTemplateURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSNumber)appPlacementPosition
{
  return self->_appPlacementPosition;
}

- (void)setAppPlacementPosition:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)userToken
{
  return self->_userToken;
}

- (void)setUserToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)allPersonalizedAppDescriptions
{
  return self->_allPersonalizedAppDescriptions;
}

- (void)setAllPersonalizedAppDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)nonChannelAppDescriptions
{
  return self->_nonChannelAppDescriptions;
}

- (void)setNonChannelAppDescriptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSArray)storefronts
{
  return self->_storefronts;
}

- (void)setStorefronts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storefronts, 0);
  objc_storeStrong((id *)&self->_nonChannelAppDescriptions, 0);
  objc_storeStrong((id *)&self->_allPersonalizedAppDescriptions, 0);
  objc_storeStrong((id *)&self->_userToken, 0);
  objc_storeStrong((id *)&self->_appPlacementPosition, 0);
  objc_storeStrong((id *)&self->_providerAppArtworkTemplateURL, 0);
  objc_storeStrong((id *)&self->_providerArtworkTemplateURL, 0);
  objc_storeStrong((id *)&self->_defaultAppId, 0);
  objc_storeStrong((id *)&self->_appAdamIDs, 0);
  objc_storeStrong((id *)&self->_appStoreRoomURL, 0);
  objc_storeStrong((id *)&self->_authenticationURL, 0);
  objc_storeStrong((id *)&self->_supportedAuthenticationSchemes, 0);
  objc_storeStrong((id *)&self->_supportedTemplates, 0);
  objc_storeStrong((id *)&self->_rankForSorting, 0);
  objc_storeStrong((id *)&self->_nameForSorting, 0);
  objc_storeStrong((id *)&self->_providerInfo, 0);
  objc_storeStrong((id *)&self->_providerID, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end
