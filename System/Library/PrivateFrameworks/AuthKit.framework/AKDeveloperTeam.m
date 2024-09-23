@implementation AKDeveloperTeam

- (AKDeveloperTeam)initWithResponseInfo:(id)a3
{
  id v4;
  AKDeveloperTeam *v5;
  uint64_t v6;
  NSString *userIdentifier;
  uint64_t v8;
  NSString *teamID;
  uint64_t v10;
  NSString *privateEmail;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  NSDictionary *apps;
  _QWORD v18[4];
  id v19;

  v4 = a3;
  v5 = -[AKDeveloperTeam init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("uid"));
    v6 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("team_id"));
    v8 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("privateEmail"));
    v10 = objc_claimAutoreleasedReturnValue();
    privateEmail = v5->_privateEmail;
    v5->_privateEmail = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("apps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __40__AKDeveloperTeam_initWithResponseInfo___block_invoke;
    v18[3] = &unk_1E2E60768;
    v19 = v12;
    v14 = v12;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v18);

    v15 = objc_msgSend(v14, "copy");
    apps = v5->_apps;
    v5->_apps = (NSDictionary *)v15;

  }
  return v5;
}

void __40__AKDeveloperTeam_initWithResponseInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  AKConsentedApplication *v6;

  v3 = a2;
  v6 = -[AKConsentedApplication initWithResponseInfo:]([AKConsentedApplication alloc], "initWithResponseInfo:", v3);

  v4 = *(void **)(a1 + 32);
  -[AKConsentedApplication clientID](v6, "clientID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v5);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AKDeveloperTeam)initWithCoder:(id)a3
{
  id v4;
  AKDeveloperTeam *v5;
  uint64_t v6;
  NSString *userIdentifier;
  uint64_t v8;
  NSString *teamID;
  uint64_t v10;
  NSString *privateEmail;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSDictionary *apps;

  v4 = a3;
  v5 = -[AKDeveloperTeam init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uid"));
    v6 = objc_claimAutoreleasedReturnValue();
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("team_id"));
    v8 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("privateEmail"));
    v10 = objc_claimAutoreleasedReturnValue();
    privateEmail = v5->_privateEmail;
    v5->_privateEmail = (NSString *)v10;

    v12 = (void *)MEMORY[0x1E0C99E60];
    v13 = objc_opt_class();
    v14 = objc_opt_class();
    objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("apps"));
    v16 = objc_claimAutoreleasedReturnValue();
    apps = v5->_apps;
    v5->_apps = (NSDictionary *)v16;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *userIdentifier;
  id v5;

  userIdentifier = self->_userIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", userIdentifier, CFSTR("uid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teamID, CFSTR("team_id"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_privateEmail, CFSTR("privateEmail"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_apps, CFSTR("apps"));

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p> team: %@, user: %@, email: %@, apps: {\n%@\n}"), objc_opt_class(), self, self->_teamID, self->_userIdentifier, self->_privateEmail, self->_apps);
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)privateEmail
{
  return self->_privateEmail;
}

- (void)setPrivateEmail:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDictionary)apps
{
  return self->_apps;
}

- (void)setApps:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_privateEmail, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
}

@end
