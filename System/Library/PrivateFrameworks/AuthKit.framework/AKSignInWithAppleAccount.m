@implementation AKSignInWithAppleAccount

- (AKSignInWithAppleAccount)initWithClientID:(id)a3 userID:(id)a4 scopes:(id)a5 creationDate:(id)a6 privateEmail:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  AKSignInWithAppleAccount *v18;
  AKSignInWithAppleAccount *v19;
  int64_t v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)AKSignInWithAppleAccount;
  v18 = -[AKSignInWithAppleAccount init](&v22, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_clientID, a3);
    objc_storeStrong((id *)&v19->_userID, a4);
    objc_storeStrong((id *)&v19->_creationDate, a6);
    objc_storeStrong((id *)&v19->_privateEmail, a7);
    v20 = objc_msgSend(v15, "containsObject:", CFSTR("name"));
    if (objc_msgSend(v15, "containsObject:", CFSTR("email")))
    {
      if (v19->_privateEmail)
        v20 |= 4uLL;
      else
        v20 |= 2uLL;
    }
    v19->_sharedScopes = v20;
  }

  return v19;
}

- (AKSignInWithAppleAccount)initWithClientID:(id)a3 userID:(id)a4
{
  return -[AKSignInWithAppleAccount initWithClientID:userID:scopes:creationDate:privateEmail:](self, "initWithClientID:userID:scopes:creationDate:privateEmail:", a3, a4, MEMORY[0x1E0C9AA60], 0, 0);
}

- (AKSignInWithAppleAccount)initWithCoder:(id)a3
{
  id v4;
  AKSignInWithAppleAccount *v5;
  uint64_t v6;
  NSString *clientID;
  uint64_t v8;
  NSString *teamID;
  uint64_t v10;
  NSString *userID;
  uint64_t v12;
  NSString *localizedAppName;
  uint64_t v14;
  NSDate *creationDate;
  void *v16;
  uint64_t v17;
  NSString *privateEmail;
  uint64_t v19;
  NSString *appStoreAdamID;
  uint64_t v21;
  NSString *localizedAppDeveloperName;
  uint64_t v23;
  NSString *privacyPolicyURL;
  uint64_t v25;
  AKSignInWithAppleAccountShareInfo *shareInfo;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)AKSignInWithAppleAccount;
  v5 = -[AKSignInWithAppleAccount init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientID"));
    v6 = objc_claimAutoreleasedReturnValue();
    clientID = v5->_clientID;
    v5->_clientID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("teamID"));
    v8 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userID"));
    v10 = objc_claimAutoreleasedReturnValue();
    userID = v5->_userID;
    v5->_userID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAppName"));
    v12 = objc_claimAutoreleasedReturnValue();
    localizedAppName = v5->_localizedAppName;
    v5->_localizedAppName = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("creationDate"));
    v14 = objc_claimAutoreleasedReturnValue();
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedScopes"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sharedScopes = objc_msgSend(v16, "integerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateEmail"));
    v17 = objc_claimAutoreleasedReturnValue();
    privateEmail = v5->_privateEmail;
    v5->_privateEmail = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("adamID"));
    v19 = objc_claimAutoreleasedReturnValue();
    appStoreAdamID = v5->_appStoreAdamID;
    v5->_appStoreAdamID = (NSString *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedAppDeveloperName"));
    v21 = objc_claimAutoreleasedReturnValue();
    localizedAppDeveloperName = v5->_localizedAppDeveloperName;
    v5->_localizedAppDeveloperName = (NSString *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privacyPolicyURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    privacyPolicyURL = v5->_privacyPolicyURL;
    v5->_privacyPolicyURL = (NSString *)v23;

    v5->_hasEULA = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasEULA"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("shareInfo"));
    v25 = objc_claimAutoreleasedReturnValue();
    shareInfo = v5->_shareInfo;
    v5->_shareInfo = (AKSignInWithAppleAccountShareInfo *)v25;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *clientID;
  void *v5;
  id v6;

  clientID = self->_clientID;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", clientID, CFSTR("clientID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_teamID, CFSTR("teamID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_userID, CFSTR("userID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedAppName, CFSTR("localizedAppName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_creationDate, CFSTR("creationDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sharedScopes);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("sharedScopes"));

  objc_msgSend(v6, "encodeObject:forKey:", self->_privateEmail, CFSTR("privateEmail"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_appStoreAdamID, CFSTR("adamID"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_localizedAppDeveloperName, CFSTR("localizedAppDeveloperName"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_privacyPolicyURL, CFSTR("privacyPolicyURL"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_hasEULA, CFSTR("hasEULA"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_shareInfo, CFSTR("shareInfo"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
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
  uint64_t v23;
  void *v24;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_clientID, "copy");
  v6 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = v5;

  v7 = -[NSString copy](self->_teamID, "copy");
  v8 = *(void **)(v4 + 96);
  *(_QWORD *)(v4 + 96) = v7;

  v9 = -[NSString copy](self->_userID, "copy");
  v10 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = v9;

  v11 = -[NSString copy](self->_localizedAppName, "copy");
  v12 = *(void **)(v4 + 24);
  *(_QWORD *)(v4 + 24) = v11;

  v13 = -[NSDate copy](self->_creationDate, "copy");
  v14 = *(void **)(v4 + 32);
  *(_QWORD *)(v4 + 32) = v13;

  *(_QWORD *)(v4 + 40) = self->_sharedScopes;
  v15 = -[NSString copy](self->_privateEmail, "copy");
  v16 = *(void **)(v4 + 48);
  *(_QWORD *)(v4 + 48) = v15;

  v17 = -[NSString copy](self->_appStoreAdamID, "copy");
  v18 = *(void **)(v4 + 88);
  *(_QWORD *)(v4 + 88) = v17;

  v19 = -[NSString copy](self->_localizedAppDeveloperName, "copy");
  v20 = *(void **)(v4 + 56);
  *(_QWORD *)(v4 + 56) = v19;

  v21 = -[NSString copy](self->_privacyPolicyURL, "copy");
  v22 = *(void **)(v4 + 64);
  *(_QWORD *)(v4 + 64) = v21;

  *(_BYTE *)(v4 + 8) = self->_hasEULA;
  v23 = -[AKSignInWithAppleAccountShareInfo copy](self->_shareInfo, "copy");
  v24 = *(void **)(v4 + 80);
  *(_QWORD *)(v4 + 80) = v23;

  return (id)v4;
}

- (NSString)appStoreURL
{
  NSString *appStoreAdamID;
  void *v3;

  appStoreAdamID = self->_appStoreAdamID;
  if (appStoreAdamID)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("itms-apps://apps.apple.com/app/%@"), appStoreAdamID);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p {\n\tclientID: %@, \n\tteamID: %@, \n\tlocalizedAppName: %@, \n\tlocalizedAppDeveloperName: %@, \n\tshareInfo: %@, \n}>"), v5, self, self->_clientID, self->_teamID, self->_localizedAppName, self->_localizedAppDeveloperName, self->_shareInfo);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (NSString)localizedAppName
{
  return self->_localizedAppName;
}

- (void)setLocalizedAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (int64_t)sharedScopes
{
  return self->_sharedScopes;
}

- (void)setSharedScopes:(int64_t)a3
{
  self->_sharedScopes = a3;
}

- (NSString)privateEmail
{
  return self->_privateEmail;
}

- (void)setPrivateEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)localizedAppDeveloperName
{
  return self->_localizedAppDeveloperName;
}

- (void)setLocalizedAppDeveloperName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)privacyPolicyURL
{
  return self->_privacyPolicyURL;
}

- (void)setPrivacyPolicyURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (BOOL)hasEULA
{
  return self->_hasEULA;
}

- (void)setHasEULA:(BOOL)a3
{
  self->_hasEULA = a3;
}

- (NSString)userID
{
  return self->_userID;
}

- (AKSignInWithAppleAccountShareInfo)shareInfo
{
  return self->_shareInfo;
}

- (void)setShareInfo:(id)a3
{
  objc_storeStrong((id *)&self->_shareInfo, a3);
}

- (NSString)appStoreAdamID
{
  return self->_appStoreAdamID;
}

- (void)setAppStoreAdamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_appStoreAdamID, 0);
  objc_storeStrong((id *)&self->_shareInfo, 0);
  objc_storeStrong((id *)&self->_userID, 0);
  objc_storeStrong((id *)&self->_privacyPolicyURL, 0);
  objc_storeStrong((id *)&self->_localizedAppDeveloperName, 0);
  objc_storeStrong((id *)&self->_privateEmail, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_localizedAppName, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
}

@end
