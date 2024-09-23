@implementation AKAuthorizationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationContext)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationContext *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSDictionary *appProvidedData;
  uint64_t v15;
  NSString *altDSID;
  uint64_t v17;
  NSString *proxiedAppName;
  uint64_t v19;
  AKDevice *proxiedDevice;
  uint64_t v21;
  AKDevice *companionDevice;
  uint64_t v23;
  NSString *teamID;
  uint64_t v25;
  NSString *clientID;
  uint64_t v27;
  AKAuthorizationRequest *request;
  uint64_t v29;
  NSString *appProvidedContext;
  uint64_t v31;
  AKAuthorizationScopesUserSelection *userSelection;
  uint64_t v33;
  NSString *externalAuthToken;
  uint64_t v35;
  NSString *sharedSIWAAccountShareToken;
  uint64_t v37;
  NSString *sharedSIWAAccountGroupID;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)AKAuthorizationContext;
  v5 = -[AKAuthorizationContext init](&v40, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_serviceType = objc_msgSend(v6, "integerValue");

    v5->_authenticationMode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_authenticationMode"));
    v5->_authenticationType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_authenticationType"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("_appProvidedData"));
    v13 = objc_claimAutoreleasedReturnValue();
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_altDSID"));
    v15 = objc_claimAutoreleasedReturnValue();
    altDSID = v5->_altDSID;
    v5->_altDSID = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedAppName"));
    v17 = objc_claimAutoreleasedReturnValue();
    proxiedAppName = v5->_proxiedAppName;
    v5->_proxiedAppName = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_proxiedDevice"));
    v19 = objc_claimAutoreleasedReturnValue();
    proxiedDevice = v5->_proxiedDevice;
    v5->_proxiedDevice = (AKDevice *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_companionDevice"));
    v21 = objc_claimAutoreleasedReturnValue();
    companionDevice = v5->_companionDevice;
    v5->_companionDevice = (AKDevice *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_teamID"));
    v23 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientID"));
    v25 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_request"));
    v27 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (AKAuthorizationRequest *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appProvidedContext"));
    v29 = objc_claimAutoreleasedReturnValue();
    appProvidedContext = v5->_appProvidedContext;
    v5->_appProvidedContext = (NSString *)v29;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userSelection"));
    v31 = objc_claimAutoreleasedReturnValue();
    userSelection = v5->_userSelection;
    v5->_userSelection = (AKAuthorizationScopesUserSelection *)v31;

    v5->_clientAuthenticatedExternallyWithPassword = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AKClientAuthenticatedExternallyWithPassword"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKExternalAuthToken"));
    v33 = objc_claimAutoreleasedReturnValue();
    externalAuthToken = v5->_externalAuthToken;
    v5->_externalAuthToken = (NSString *)v33;

    v5->_isMDMInformationRequired = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isMDMInformationRequired"));
    v5->_isAuthorizingForSharedSIWAAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAuthorizingForSharedSIWAAccount"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SharedSIWAAccountShareTokenKey"));
    v35 = objc_claimAutoreleasedReturnValue();
    sharedSIWAAccountShareToken = v5->_sharedSIWAAccountShareToken;
    v5->_sharedSIWAAccountShareToken = (NSString *)v35;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SharedSIWAAccountGroupID"));
    v37 = objc_claimAutoreleasedReturnValue();
    sharedSIWAAccountGroupID = v5->_sharedSIWAAccountGroupID;
    v5->_sharedSIWAAccountGroupID = (NSString *)v37;

  }
  return v5;
}

- (AKAuthorizationContext)initWithRequest:(id)a3
{
  id v5;
  AKAuthorizationContext *v6;
  AKAuthorizationContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationContext;
  v6 = -[AKAuthorizationContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_request, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *altDSID;
  void *v5;
  id v6;

  altDSID = self->_altDSID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", altDSID, CFSTR("_altDSID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_proxiedAppName, CFSTR("_proxiedAppName"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_serviceType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("_serviceType"));

  objc_msgSend(v6, "encodeInteger:forKey:", self->_authenticationMode, CFSTR("_authenticationMode"));
  objc_msgSend(v6, "encodeInteger:forKey:", self->_authenticationType, CFSTR("_authenticationType"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_proxiedDevice, CFSTR("_proxiedDevice"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_companionDevice, CFSTR("_companionDevice"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appProvidedData, CFSTR("_appProvidedData"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_teamID, CFSTR("_teamID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_clientID, CFSTR("_clientID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_request, CFSTR("_request"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appProvidedContext, CFSTR("_appProvidedContext"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_userSelection, CFSTR("_userSelection"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_clientAuthenticatedExternallyWithPassword, CFSTR("AKClientAuthenticatedExternallyWithPassword"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_externalAuthToken, CFSTR("AKExternalAuthToken"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isMDMInformationRequired, CFSTR("_isMDMInformationRequired"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_isAuthorizingForSharedSIWAAccount, CFSTR("isAuthorizingForSharedSIWAAccount"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sharedSIWAAccountShareToken, CFSTR("SharedSIWAAccountShareTokenKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_sharedSIWAAccountGroupID, CFSTR("SharedSIWAAccountGroupID"));

}

- (BOOL)_hasApplicationMetaData
{
  return self->_clientID && self->_teamID != 0;
}

- (NSString)description
{
  objc_class *v3;
  void *v4;
  void *v5;
  NSString *teamID;
  NSString *clientID;
  NSString *appProvidedContext;
  NSDictionary *appProvidedData;
  AKAuthorizationRequest *request;
  AKAuthorizationScopesUserSelection *userSelection;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  __int128 v17;
  NSString *altDSID;
  NSString *proxiedAppName;
  void *v20;

  v20 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  altDSID = self->_altDSID;
  proxiedAppName = self->_proxiedAppName;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_serviceType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_OWORD *)&self->_proxiedDevice;
  teamID = self->_teamID;
  clientID = self->_clientID;
  appProvidedData = self->_appProvidedData;
  appProvidedContext = self->_appProvidedContext;
  request = self->_request;
  userSelection = self->_userSelection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_clientAuthenticatedExternallyWithPassword);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (self->_isAuthorizingForSharedSIWAAccount)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  objc_msgSend(v20, "stringWithFormat:", CFSTR("<%@: %p {\n\taltDSID: %@,\n\tproxiedAppName: %@,\n\tserviceType: %@,\n\tproxiedDevice: %@,\n\tcompanionDevice: %@,\n\tappProvidedData: %@,\n\tteamID: %@,\n\tappID: %@,\n\trequest: %@,\n\tappProvidedContext: %@,\n\tuserSelection: %@,\n\tclientAuthenticatedExternallyWithPassword: %@,\n\tisAuthorizingForSharedSIWAAccount: %@,\n}>"), v4, self, altDSID, proxiedAppName, v5, v17, appProvidedData, teamID, clientID, request, appProvidedContext, userSelection, v12, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v15;
}

- (NSUUID)_identifier
{
  return self->_identifier;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)altDSID
{
  return self->_altDSID;
}

- (void)setAltDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (unint64_t)authenticationType
{
  return self->_authenticationType;
}

- (void)setAuthenticationType:(unint64_t)a3
{
  self->_authenticationType = a3;
}

- (unint64_t)authenticationMode
{
  return self->_authenticationMode;
}

- (void)setAuthenticationMode:(unint64_t)a3
{
  self->_authenticationMode = a3;
}

- (NSString)_proxiedAppName
{
  return self->_proxiedAppName;
}

- (void)_setProxiedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSDictionary)appProvidedData
{
  return self->_appProvidedData;
}

- (void)setAppProvidedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)appProvidedContext
{
  return self->_appProvidedContext;
}

- (void)setAppProvidedContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (AKDevice)proxiedDevice
{
  return self->_proxiedDevice;
}

- (void)setProxiedDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (AKDevice)companionDevice
{
  return self->_companionDevice;
}

- (void)setCompanionDevice:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (NSString)_externalAuthToken
{
  return self->_externalAuthToken;
}

- (void)set_externalAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)_clientAuthenticatedExternallyWithPassword
{
  return self->_clientAuthenticatedExternallyWithPassword;
}

- (void)set_clientAuthenticatedExternallyWithPassword:(BOOL)a3
{
  self->_clientAuthenticatedExternallyWithPassword = a3;
}

- (BOOL)isMDMInformationRequired
{
  return self->_isMDMInformationRequired;
}

- (void)setIsMDMInformationRequired:(BOOL)a3
{
  self->_isMDMInformationRequired = a3;
}

- (AKCompanionKeyEnvelope)companionKeyEnvelope
{
  return self->_companionKeyEnvelope;
}

- (void)setCompanionKeyEnvelope:(id)a3
{
  objc_storeStrong((id *)&self->_companionKeyEnvelope, a3);
}

- (BOOL)_isAuthorizingForSharedSIWAAccount
{
  return self->_isAuthorizingForSharedSIWAAccount;
}

- (void)set_isAuthorizingForSharedSIWAAccount:(BOOL)a3
{
  self->_isAuthorizingForSharedSIWAAccount = a3;
}

- (NSString)_sharedSIWAAccountShareToken
{
  return self->_sharedSIWAAccountShareToken;
}

- (void)set_sharedSIWAAccountShareToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSString)_sharedSIWAAccountGroupID
{
  return self->_sharedSIWAAccountGroupID;
}

- (void)set_sharedSIWAAccountGroupID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (AKAuthorizationRequest)request
{
  return self->_request;
}

- (AKAuthorizationScopesUserSelection)userSelection
{
  return self->_userSelection;
}

- (void)setUserSelection:(id)a3
{
  objc_storeStrong((id *)&self->_userSelection, a3);
}

- (NSString)realUserVerificationData
{
  return self->_realUserVerificationData;
}

- (void)setRealUserVerificationData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realUserVerificationData, 0);
  objc_storeStrong((id *)&self->_userSelection, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_sharedSIWAAccountGroupID, 0);
  objc_storeStrong((id *)&self->_sharedSIWAAccountShareToken, 0);
  objc_storeStrong((id *)&self->_companionKeyEnvelope, 0);
  objc_storeStrong((id *)&self->_externalAuthToken, 0);
  objc_storeStrong((id *)&self->_companionDevice, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
  objc_storeStrong((id *)&self->_appProvidedContext, 0);
  objc_storeStrong((id *)&self->_appProvidedData, 0);
  objc_storeStrong((id *)&self->_proxiedAppName, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
  objc_storeStrong((id *)&self->_username, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
