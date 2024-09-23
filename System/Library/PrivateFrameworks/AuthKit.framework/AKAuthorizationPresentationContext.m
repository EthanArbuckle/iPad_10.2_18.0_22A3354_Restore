@implementation AKAuthorizationPresentationContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKAuthorizationPresentationContext)initWithContext:(id)a3 bundleID:(id)a4
{
  id v7;
  id v8;
  AKAuthorizationPresentationContext *v9;
  AKAuthorizationPresentationContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)AKAuthorizationPresentationContext;
  v9 = -[AKAuthorizationPresentationContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bundleID, a4);
    objc_storeStrong((id *)&v10->_credentialRequestContext, a3);
    -[AKAuthorizationPresentationContext _addPresenterParameters](v10, "_addPresenterParameters");
  }

  return v10;
}

- (AKAuthorizationPresentationContext)initWithContext:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  AKAuthorizationPresentationContext *v12;
  uint64_t v13;
  NSData *clientAuditTokenData;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "_upgradeContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v7, "_upgradeContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleID");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[AKAuthorizationPresentationContext initWithContext:bundleID:](self, "initWithContext:bundleID:", v7, v11);

    v7 = (id)v11;
  }
  else
  {
    objc_msgSend(v6, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AKAuthorizationPresentationContext initWithContext:bundleID:](self, "initWithContext:bundleID:", v7, v10);
  }

  objc_msgSend(v6, "auditTokenData");
  v13 = objc_claimAutoreleasedReturnValue();

  clientAuditTokenData = v12->_clientAuditTokenData;
  v12->_clientAuditTokenData = (NSData *)v13;

  return v12;
}

- (AKAuthorizationPresentationContext)initWithUsername:(id)a3
{
  id v4;
  AKAuthorizationPresentationContext *v5;
  AKUserInformation *v6;
  AKUserInformation *userInformation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AKAuthorizationPresentationContext;
  v5 = -[AKAuthorizationPresentationContext init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(AKUserInformation);
    userInformation = v5->_userInformation;
    v5->_userInformation = v6;

    -[AKUserInformation setAccountName:](v5->_userInformation, "setAccountName:", v4);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleID;
  id v5;

  bundleID = self->_bundleID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleID, CFSTR("_bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedAppName, CFSTR("_localizedAppName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconName, CFSTR("_iconName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconData, CFSTR("_iconData"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconScale, CFSTR("_iconScale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_credentialRequestContext, CFSTR("_credentialRequestContext"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userInformation, CFSTR("_userInformation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_loginChoices, CFSTR("_loginChoices"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientAuditTokenData, CFSTR("_clientAuditTokenData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_signInAllowsPCSKeyAccess, CFSTR("_signInAllowsPCSKeyAccess"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasShownFirstTimeAlready, CFSTR("_hasShownFirstTimeAlready"));

}

- (AKAuthorizationPresentationContext)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationPresentationContext *v5;
  uint64_t v6;
  NSString *bundleID;
  uint64_t v8;
  NSString *localizedAppName;
  uint64_t v10;
  NSString *iconName;
  uint64_t v12;
  NSData *iconData;
  uint64_t v14;
  NSNumber *iconScale;
  uint64_t v16;
  AKCredentialRequestContext *credentialRequestContext;
  uint64_t v18;
  AKUserInformation *userInformation;
  uint64_t v20;
  NSData *clientAuditTokenData;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSArray *loginChoices;
  objc_super v29;
  _QWORD v30[4];

  v30[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)AKAuthorizationPresentationContext;
  v5 = -[AKAuthorizationPresentationContext init](&v29, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_localizedAppName"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedAppName = v5->_localizedAppName;
    v5->_localizedAppName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_iconName"));
    v10 = objc_claimAutoreleasedReturnValue();
    iconName = v5->_iconName;
    v5->_iconName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_iconData"));
    v12 = objc_claimAutoreleasedReturnValue();
    iconData = v5->_iconData;
    v5->_iconData = (NSData *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_iconScale"));
    v14 = objc_claimAutoreleasedReturnValue();
    iconScale = v5->_iconScale;
    v5->_iconScale = (NSNumber *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_credentialRequestContext"));
    v16 = objc_claimAutoreleasedReturnValue();
    credentialRequestContext = v5->_credentialRequestContext;
    v5->_credentialRequestContext = (AKCredentialRequestContext *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_userInformation"));
    v18 = objc_claimAutoreleasedReturnValue();
    userInformation = v5->_userInformation;
    v5->_userInformation = (AKUserInformation *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientAuditTokenData"));
    v20 = objc_claimAutoreleasedReturnValue();
    clientAuditTokenData = v5->_clientAuditTokenData;
    v5->_clientAuditTokenData = (NSData *)v20;

    v22 = (void *)MEMORY[0x1E0C99E20];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObjectsFromArray:", v25);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("_loginChoices"));
    v26 = objc_claimAutoreleasedReturnValue();
    loginChoices = v5->_loginChoices;
    v5->_loginChoices = (NSArray *)v26;

    v5->_signInAllowsPCSKeyAccess = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_signInAllowsPCSKeyAccess"));
    v5->_hasShownFirstTimeAlready = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_hasShownFirstTimeAlready"));

  }
  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_signInAllowsPCSKeyAccess)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> - bundleID: %@, localizedAppName: %@, credentialRequestContext: %@, userInformation: %@, loginChoices: %@, signInAllowsPCSKeyAccess: %@"), v5, self, *(_OWORD *)&self->_bundleID, *(_OWORD *)&self->_credentialRequestContext, self->_loginChoices, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
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
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_bundleID, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSString copy](self->_localizedAppName, "copy");
  v8 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v7;

  v9 = -[NSString copy](self->_iconName, "copy");
  v10 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v9;

  v11 = -[NSData copy](self->_iconData, "copy");
  v12 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v11;

  v13 = -[NSNumber copy](self->_iconScale, "copy");
  v14 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v13;

  v15 = -[AKCredentialRequestContext copy](self->_credentialRequestContext, "copy");
  v16 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v15;

  v17 = -[AKUserInformation copy](self->_userInformation, "copy");
  v18 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v17;

  v19 = -[NSArray copy](self->_loginChoices, "copy");
  v20 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v19;

  v21 = -[NSData copy](self->_clientAuditTokenData, "copy");
  v22 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v21;

  *(_BYTE *)(v4 + 8) = self->_signInAllowsPCSKeyAccess;
  *(_BYTE *)(v4 + 9) = self->_hasShownFirstTimeAlready;
  return (id)v4;
}

+ (id)presentationContextForRequestContext:(id)a3 client:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  AKAuthorizationPresentationContext *v9;
  void *v10;
  uint64_t v11;
  AKAuthorizationPresentationContext *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_upgradeContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = [AKAuthorizationPresentationContext alloc];
  if (v8)
  {
    objc_msgSend(v6, "_upgradeContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleID");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[AKAuthorizationPresentationContext initWithContext:bundleID:](v9, "initWithContext:bundleID:", v6, v11);

    v6 = (id)v11;
  }
  else
  {
    objc_msgSend(v5, "bundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[AKAuthorizationPresentationContext initWithContext:bundleID:](v9, "initWithContext:bundleID:", v6, v10);
  }

  objc_msgSend(v5, "auditTokenData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[AKAuthorizationPresentationContext setClientAuditTokenData:](v12, "setClientAuditTokenData:", v13);
  return v12;
}

+ (id)presentationContextForCreateAppleIDFlow:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "copy");
  v5 = objc_msgSend(v3, "hasSharedAccountLoginChoices");

  if (v5)
    objc_msgSend(v4, "setLoginChoices:", 0);
  objc_msgSend(v4, "credentialRequestContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPasswordRequest:", 0);

  return v4;
}

- (BOOL)hasSharedAccountLoginChoices
{
  void *v3;
  int v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSNumber *cachedHasSharedAccountLoginChoice;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  +[AKFeatureManager sharedManager](AKFeatureManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSiwaCredentialSharingEnabled");

  if (!v4)
    return 0;
  if (!self->_cachedHasSharedAccountLoginChoice)
  {
    self->_cachedHasSharedAccountLoginChoice = (NSNumber *)MEMORY[0x1E0C9AAA0];

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_loginChoices;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(v5);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            cachedHasSharedAccountLoginChoice = self->_cachedHasSharedAccountLoginChoice;
            self->_cachedHasSharedAccountLoginChoice = (NSNumber *)MEMORY[0x1E0C9AAB0];

            goto LABEL_14;
          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_14:

  }
  return -[NSNumber BOOLValue](self->_cachedHasSharedAccountLoginChoice, "BOOLValue", v12);
}

- (BOOL)hasCreateAccountLoginChoice
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  NSNumber *cachedHasCreateAccountLoginChoice;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (!self->_cachedHasCreateAccountLoginChoice)
  {
    self->_cachedHasCreateAccountLoginChoice = (NSNumber *)MEMORY[0x1E0C9AAA0];

    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v3 = self->_loginChoices;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v3);
          if (objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "shouldCreateAppleID", (_QWORD)v10))
          {
            cachedHasCreateAccountLoginChoice = self->_cachedHasCreateAccountLoginChoice;
            self->_cachedHasCreateAccountLoginChoice = (NSNumber *)MEMORY[0x1E0C9AAB0];

            goto LABEL_12;
          }
        }
        v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_12:

  }
  return -[NSNumber BOOLValue](self->_cachedHasCreateAccountLoginChoice, "BOOLValue", (_QWORD)v10);
}

- (BOOL)isSignInFlow
{
  return -[AKCredentialRequestContext _isFirstPartyLogin](self->_credentialRequestContext, "_isFirstPartyLogin")
      || -[NSArray count](self->_loginChoices, "count") != 0;
}

- (void)_addPresenterParameters
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  NSString *v8;
  NSString *bundleID;
  NSString *localizedAppName;
  NSString *v11;
  id v12;

  -[AKCredentialRequestContext _proxiedClientAppName](self->_credentialRequestContext, "_proxiedClientAppName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    -[AKAuthorizationPresentationContext _addPresentationParametersForContext:](self, "_addPresentationParametersForContext:", self->_credentialRequestContext);
  }
  else
  {
    +[AKConfiguration sharedConfiguration](AKConfiguration, "sharedConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "shouldAutocycleAppsInTiburon");

    if (v6 == 1)
    {
      if (_NextTestBundleIdentifier_onceToken != -1)
        dispatch_once(&_NextTestBundleIdentifier_onceToken, &__block_literal_global_41);
      v7 = _NextTestBundleIdentifier_index++;
      objc_msgSend((id)_NextTestBundleIdentifier_testBundleIdentifiers, "objectAtIndexedSubscript:", v7 % objc_msgSend((id)_NextTestBundleIdentifier_testBundleIdentifiers, "count"));
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      bundleID = self->_bundleID;
      self->_bundleID = v8;

    }
    objc_msgSend(MEMORY[0x1E0CA5860], "applicationProxyForIdentifier:", self->_bundleID);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](self->_bundleID, "isEqualToString:", CFSTR("com.apple.aktool")))
    {
      localizedAppName = self->_localizedAppName;
      self->_localizedAppName = (NSString *)CFSTR("aktool");
    }
    else
    {
      objc_msgSend(v12, "localizedName");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      localizedAppName = self->_localizedAppName;
      self->_localizedAppName = v11;
    }

  }
}

- (void)_addPresentationParametersForContext:(id)a3
{
  NSString *v4;
  NSString *iconName;
  NSData *v6;
  NSData *iconData;
  NSNumber *v8;
  NSNumber *iconScale;
  void *v10;
  uint64_t v11;
  NSString *v12;
  NSString *localizedAppName;
  void *v14;
  NSString *v15;
  NSString *bundleID;

  objc_msgSend(a3, "_iconName");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  iconName = self->_iconName;
  self->_iconName = v4;

  -[AKCredentialRequestContext _iconData](self->_credentialRequestContext, "_iconData");
  v6 = (NSData *)objc_claimAutoreleasedReturnValue();
  iconData = self->_iconData;
  self->_iconData = v6;

  -[AKCredentialRequestContext _iconScale](self->_credentialRequestContext, "_iconScale");
  v8 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  iconScale = self->_iconScale;
  self->_iconScale = v8;

  -[AKCredentialRequestContext _proxiedClientAppName](self->_credentialRequestContext, "_proxiedClientAppName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11)
  {
    -[AKCredentialRequestContext _proxiedClientAppName](self->_credentialRequestContext, "_proxiedClientAppName");
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedAppName = self->_localizedAppName;
    self->_localizedAppName = v12;

  }
  -[AKCredentialRequestContext _proxiedClientBundleID](self->_credentialRequestContext, "_proxiedClientBundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[AKCredentialRequestContext _proxiedClientBundleID](self->_credentialRequestContext, "_proxiedClientBundleID");
    v15 = (NSString *)objc_claimAutoreleasedReturnValue();
    bundleID = self->_bundleID;
    self->_bundleID = v15;

  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (NSData)iconData
{
  return self->_iconData;
}

- (NSNumber)iconScale
{
  return self->_iconScale;
}

- (BOOL)signInAllowsPCSKeyAccess
{
  return self->_signInAllowsPCSKeyAccess;
}

- (void)setSignInAllowsPCSKeyAccess:(BOOL)a3
{
  self->_signInAllowsPCSKeyAccess = a3;
}

- (AKCredentialRequestContext)credentialRequestContext
{
  return self->_credentialRequestContext;
}

- (void)setCredentialRequestContext:(id)a3
{
  objc_storeStrong((id *)&self->_credentialRequestContext, a3);
}

- (AKUserInformation)userInformation
{
  return self->_userInformation;
}

- (void)setUserInformation:(id)a3
{
  objc_storeStrong((id *)&self->_userInformation, a3);
}

- (NSArray)loginChoices
{
  return self->_loginChoices;
}

- (void)setLoginChoices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)hasShownFirstTimeAlready
{
  return self->_hasShownFirstTimeAlready;
}

- (void)setHasShownFirstTimeAlready:(BOOL)a3
{
  self->_hasShownFirstTimeAlready = a3;
}

- (NSNumber)cachedHasSharedAccountLoginChoice
{
  return self->_cachedHasSharedAccountLoginChoice;
}

- (void)setCachedHasSharedAccountLoginChoice:(id)a3
{
  objc_storeStrong((id *)&self->_cachedHasSharedAccountLoginChoice, a3);
}

- (NSNumber)cachedHasCreateAccountLoginChoice
{
  return self->_cachedHasCreateAccountLoginChoice;
}

- (void)setCachedHasCreateAccountLoginChoice:(id)a3
{
  objc_storeStrong((id *)&self->_cachedHasCreateAccountLoginChoice, a3);
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (void)setClientAuditTokenData:(id)a3
{
  objc_storeStrong((id *)&self->_clientAuditTokenData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientAuditTokenData, 0);
  objc_storeStrong((id *)&self->_cachedHasCreateAccountLoginChoice, 0);
  objc_storeStrong((id *)&self->_cachedHasSharedAccountLoginChoice, 0);
  objc_storeStrong((id *)&self->_loginChoices, 0);
  objc_storeStrong((id *)&self->_userInformation, 0);
  objc_storeStrong((id *)&self->_credentialRequestContext, 0);
  objc_storeStrong((id *)&self->_iconScale, 0);
  objc_storeStrong((id *)&self->_iconData, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
}

@end
