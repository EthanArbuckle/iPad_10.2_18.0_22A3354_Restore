@implementation AKAuthorizationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationRequest)init
{
  AKAuthorizationRequest *v2;
  uint64_t v3;
  NSArray *requestedScopes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKAuthorizationRequest;
  v2 = -[AKCredentialRequest init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    requestedScopes = v2->_requestedScopes;
    v2->_requestedScopes = (NSArray *)v3;

  }
  return v2;
}

- (AKAuthorizationRequest)initWithAltDSID:(id)a3
{
  id v5;
  AKAuthorizationRequest *v6;
  AKAuthorizationRequest *v7;
  uint64_t v8;
  NSArray *requestedScopes;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKAuthorizationRequest;
  v6 = -[AKCredentialRequest init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_altDSID, a3);
    v8 = objc_opt_new();
    requestedScopes = v7->_requestedScopes;
    v7->_requestedScopes = (NSArray *)v8;

  }
  return v7;
}

- (AKAuthorizationRequest)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationRequest *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *requestedScopes;
  uint64_t v11;
  NSString *state;
  uint64_t v13;
  NSString *nonce;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSDictionary *appProvidedData;
  uint64_t v23;
  NSString *clientID;
  uint64_t v25;
  NSString *teamID;
  uint64_t v27;
  ACAccount *authkitAccount;
  uint64_t v29;
  NSString *externalAuthToken;
  uint64_t v31;
  AKSignInWithAppleAccount *sharedAccount;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)AKAuthorizationRequest;
  v5 = -[AKCredentialRequest initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("AKRequestedScopes"));
    v9 = objc_claimAutoreleasedReturnValue();
    requestedScopes = v5->_requestedScopes;
    v5->_requestedScopes = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKApplicationState"));
    v11 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKApplicationNonce"));
    v13 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v13;

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    v17 = objc_opt_class();
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, v17, v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("AKAppProvidedData"));
    v21 = objc_claimAutoreleasedReturnValue();
    appProvidedData = v5->_appProvidedData;
    v5->_appProvidedData = (NSDictionary *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKClientID"));
    v23 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKTeamID"));
    v25 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v25;

    v5->_existingStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("AKAuthorizationStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKAuthorizationAccount"));
    v27 = objc_claimAutoreleasedReturnValue();
    authkitAccount = v5->_authkitAccount;
    v5->_authkitAccount = (ACAccount *)v27;

    v5->_isSilentAppTransfer = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AKAuthorizationIsSilentAppTransfer"));
    v5->_isEligibleForUpgradeFromPassword = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AKAuthorizationIsEligibleForUpgradeFromPassword"));
    v5->_clientAuthenticatedExternallyWithPassword = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AKClientAuthenticatedExternallyWithPassword"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKExternalAuthToken"));
    v29 = objc_claimAutoreleasedReturnValue();
    externalAuthToken = v5->_externalAuthToken;
    v5->_externalAuthToken = (NSString *)v29;

    v5->_shouldHideCreateOption = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AKAuthorizationShouldHideCreateOption"));
    v5->_hasSharedAccounts = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AKHasSharedAccountsKey"));
    v5->_isAuthorizingUsingSharedAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AKSimulateAuthorizationForSharedAccountKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AKSharedAccountKey"));
    v31 = objc_claimAutoreleasedReturnValue();
    sharedAccount = v5->_sharedAccount;
    v5->_sharedAccount = (AKSignInWithAppleAccount *)v31;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AKAuthorizationRequest;
  v4 = -[AKCredentialRequest copyWithZone:](&v21, sel_copyWithZone_, a3);
  v5 = -[ACAccount copy](self->_authkitAccount, "copy");
  v6 = (void *)*((_QWORD *)v4 + 7);
  *((_QWORD *)v4 + 7) = v5;

  v7 = -[NSArray copy](self->_requestedScopes, "copy");
  v8 = (void *)*((_QWORD *)v4 + 10);
  *((_QWORD *)v4 + 10) = v7;

  v9 = -[NSString copy](self->_state, "copy");
  v10 = (void *)*((_QWORD *)v4 + 12);
  *((_QWORD *)v4 + 12) = v9;

  v11 = -[NSString copy](self->_nonce, "copy");
  v12 = (void *)*((_QWORD *)v4 + 13);
  *((_QWORD *)v4 + 13) = v11;

  v13 = -[NSDictionary copy](self->_appProvidedData, "copy");
  v14 = (void *)*((_QWORD *)v4 + 11);
  *((_QWORD *)v4 + 11) = v13;

  v15 = -[NSString copy](self->_clientID, "copy");
  v16 = (void *)*((_QWORD *)v4 + 14);
  *((_QWORD *)v4 + 14) = v15;

  v17 = -[NSString copy](self->_teamID, "copy");
  v18 = (void *)*((_QWORD *)v4 + 15);
  *((_QWORD *)v4 + 15) = v17;

  *((_QWORD *)v4 + 16) = self->_existingStatus;
  *((_BYTE *)v4 + 40) = self->_isSilentAppTransfer;
  *((_BYTE *)v4 + 44) = self->_isEligibleForUpgradeFromPassword;
  *((_BYTE *)v4 + 41) = self->_clientAuthenticatedExternallyWithPassword;
  objc_storeStrong((id *)v4 + 8, self->_externalAuthToken);
  *((_BYTE *)v4 + 45) = self->_shouldHideCreateOption;
  *((_BYTE *)v4 + 42) = self->_hasSharedAccounts;
  objc_msgSend(v4, "set_isAuthorizingUsingSharedAccount:", self->_isAuthorizingUsingSharedAccount);
  v19 = (void *)-[AKSignInWithAppleAccount copy](self->_sharedAccount, "copy");
  objc_msgSend(v4, "set_sharedAccount:", v19);

  return v4;
}

- (id)_sanitizedCopy
{
  AKAuthorizationRequest *v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init(AKAuthorizationRequest);
  -[AKCredentialRequest userIdentifier](self, "userIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCredentialRequest setUserIdentifier:](v3, "setUserIdentifier:", v4);

  -[AKCredentialRequest requestIdentifier](self, "requestIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCredentialRequest setRequestIdentifier:](v3, "setRequestIdentifier:", v5);

  -[AKAuthorizationRequest setRequestedScopes:](v3, "setRequestedScopes:", self->_requestedScopes);
  -[AKAuthorizationRequest setState:](v3, "setState:", self->_state);
  -[AKAuthorizationRequest setNonce:](v3, "setNonce:", self->_nonce);
  -[AKAuthorizationRequest set_clientAuthenticatedExternallyWithPassword:](v3, "set_clientAuthenticatedExternallyWithPassword:", self->_clientAuthenticatedExternallyWithPassword);
  -[AKAuthorizationRequest set_externalAuthToken:](v3, "set_externalAuthToken:", self->_externalAuthToken);
  -[AKAuthorizationRequest set_hasSharedAccounts:](v3, "set_hasSharedAccounts:", self->_hasSharedAccounts);
  -[AKAuthorizationRequest set_isAuthorizingUsingSharedAccount:](v3, "set_isAuthorizingUsingSharedAccount:", self->_isAuthorizingUsingSharedAccount);
  -[AKAuthorizationRequest set_sharedAccount:](v3, "set_sharedAccount:", self->_sharedAccount);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AKAuthorizationRequest;
  v4 = a3;
  -[AKCredentialRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestedScopes, CFSTR("AKRequestedScopes"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_state, CFSTR("AKApplicationState"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_nonce, CFSTR("AKApplicationNonce"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_appProvidedData, CFSTR("AKAppProvidedData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_clientID, CFSTR("AKClientID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_teamID, CFSTR("AKTeamID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_authkitAccount, CFSTR("AKAuthorizationAccount"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_existingStatus, CFSTR("AKAuthorizationStatus"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSilentAppTransfer, CFSTR("AKAuthorizationIsSilentAppTransfer"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isEligibleForUpgradeFromPassword, CFSTR("AKAuthorizationIsEligibleForUpgradeFromPassword"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_clientAuthenticatedExternallyWithPassword, CFSTR("AKClientAuthenticatedExternallyWithPassword"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalAuthToken, CFSTR("AKExternalAuthToken"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldHideCreateOption, CFSTR("AKAuthorizationShouldHideCreateOption"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasSharedAccounts, CFSTR("AKHasSharedAccountsKey"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isAuthorizingUsingSharedAccount, CFSTR("AKSimulateAuthorizationForSharedAccountKey"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_sharedAccount, CFSTR("AKSharedAccountKey"));

}

- (ACAccount)authkitAccount
{
  ACAccount *authkitAccount;
  void *v4;
  ACAccount *v5;
  ACAccount *v6;

  authkitAccount = self->_authkitAccount;
  if (!authkitAccount)
  {
    if (self->_altDSID)
    {
      +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "authKitAccountWithAltDSID:", self->_altDSID);
      v5 = (ACAccount *)objc_claimAutoreleasedReturnValue();
      v6 = self->_authkitAccount;
      self->_authkitAccount = v5;

      authkitAccount = self->_authkitAccount;
    }
    else
    {
      authkitAccount = 0;
    }
  }
  return authkitAccount;
}

- (ACAccount)internalAuthKitAccount
{
  return self->_authkitAccount;
}

- (id)altDSID
{
  NSString *altDSID;
  void *v4;
  NSString *v5;
  NSString *v6;

  altDSID = self->_altDSID;
  if (!altDSID)
  {
    if (self->_authkitAccount)
    {
      +[AKAccountManager sharedInstance](AKAccountManager, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "altDSIDForAccount:", self->_authkitAccount);
      v5 = (NSString *)objc_claimAutoreleasedReturnValue();
      v6 = self->_altDSID;
      self->_altDSID = v5;

      altDSID = self->_altDSID;
    }
    else
    {
      altDSID = 0;
    }
  }
  return altDSID;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSString *clientID;
  NSString *teamID;
  void *v10;
  void *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  void *v15;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCredentialRequest requestIdentifier](self, "requestIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKCredentialRequest transactionID](self, "transactionID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  clientID = self->_clientID;
  teamID = self->_teamID;
  -[AKCredentialRequest userIdentifier](self, "userIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKAuthorizationRequest altDSID](self, "altDSID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("YES");
  if (self->_shouldHideCreateOption)
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (self->_hasSharedAccounts)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  if (!self->_isAuthorizingUsingSharedAccount)
    v12 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\trequestIdentifier: %@,\n\ttransactionID: %@, \n\tclientID: %@,\n\tteamID: %@,\n\tuserIdentifier: %@,\n\taltDSID: %@,\n\tstate: %@,\n\tnonce: %@,\n\trequestedScopes: %@,\n\tappProvidedData: %@,\n\tisSilentAppTransfer: %d,\n\tisEligibleForUpgradeFromPassword: %d,\n\tshouldHideCreationOption: %@,\n\thasSharedAccounts: %@,\n\tsimulateAuthorizationForSharedAccount: %@,\n}>"), v5, self, v6, v7, clientID, teamID, v10, v11, self->_state, self->_nonce, self->_requestedScopes, self->_appProvidedData, self->_isSilentAppTransfer, self->_isEligibleForUpgradeFromPassword, v13, v14,
    v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setState:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *state;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0x101)
  {
    objc_msgSend(v4, "substringToIndex:", 256);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  state = self->_state;
  self->_state = (NSString *)v4;

}

- (void)setNonce:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *nonce;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "length") >= 0x101)
  {
    objc_msgSend(v4, "substringToIndex:", 256);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (id)v5;
  }
  nonce = self->_nonce;
  self->_nonce = (NSString *)v4;

}

- (void)setAuthkitAccount:(id)a3
{
  objc_storeStrong((id *)&self->_authkitAccount, a3);
}

- (BOOL)_isSilentAppTransfer
{
  return self->_isSilentAppTransfer;
}

- (void)set_isSilentAppTransfer:(BOOL)a3
{
  self->_isSilentAppTransfer = a3;
}

- (BOOL)_clientAuthenticatedExternallyWithPassword
{
  return self->_clientAuthenticatedExternallyWithPassword;
}

- (void)set_clientAuthenticatedExternallyWithPassword:(BOOL)a3
{
  self->_clientAuthenticatedExternallyWithPassword = a3;
}

- (NSString)_externalAuthToken
{
  return self->_externalAuthToken;
}

- (void)set_externalAuthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)_hasSharedAccounts
{
  return self->_hasSharedAccounts;
}

- (void)set_hasSharedAccounts:(BOOL)a3
{
  self->_hasSharedAccounts = a3;
}

- (BOOL)_isAuthorizingUsingSharedAccount
{
  return self->_isAuthorizingUsingSharedAccount;
}

- (void)set_isAuthorizingUsingSharedAccount:(BOOL)a3
{
  self->_isAuthorizingUsingSharedAccount = a3;
}

- (AKSignInWithAppleAccount)_sharedAccount
{
  return self->_sharedAccount;
}

- (void)set_sharedAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)requestedScopes
{
  return self->_requestedScopes;
}

- (void)setRequestedScopes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDictionary)appProvidedData
{
  return self->_appProvidedData;
}

- (void)setAppProvidedData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (BOOL)isEligibleForUpgradeFromPassword
{
  return self->_isEligibleForUpgradeFromPassword;
}

- (void)setIsEligibleForUpgradeFromPassword:(BOOL)a3
{
  self->_isEligibleForUpgradeFromPassword = a3;
}

- (BOOL)shouldHideCreateOption
{
  return self->_shouldHideCreateOption;
}

- (void)setShouldHideCreateOption:(BOOL)a3
{
  self->_shouldHideCreateOption = a3;
}

- (NSString)state
{
  return self->_state;
}

- (NSString)nonce
{
  return self->_nonce;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (int64_t)existingStatus
{
  return self->_existingStatus;
}

- (void)setExistingStatus:(int64_t)a3
{
  self->_existingStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_appProvidedData, 0);
  objc_storeStrong((id *)&self->_requestedScopes, 0);
  objc_storeStrong((id *)&self->_sharedAccount, 0);
  objc_storeStrong((id *)&self->_externalAuthToken, 0);
  objc_storeStrong((id *)&self->_authkitAccount, 0);
  objc_storeStrong((id *)&self->_altDSID, 0);
}

@end
