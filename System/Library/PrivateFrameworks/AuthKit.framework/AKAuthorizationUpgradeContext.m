@implementation AKAuthorizationUpgradeContext

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *appID;
  id v5;

  appID = self->_appID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", appID, CFSTR("_appID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appName, CFSTR("_appName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleID, CFSTR("_bundleID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nonce, CFSTR("_nonce"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceID, CFSTR("_serviceID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_state, CFSTR("_state"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_teamID, CFSTR("_teamID"));

}

- (AKAuthorizationUpgradeContext)initWithCoder:(id)a3
{
  id v4;
  AKAuthorizationUpgradeContext *v5;
  uint64_t v6;
  NSString *appID;
  uint64_t v8;
  NSString *appName;
  uint64_t v10;
  NSString *bundleID;
  uint64_t v12;
  NSString *nonce;
  uint64_t v14;
  NSString *serviceID;
  uint64_t v16;
  NSString *state;
  uint64_t v18;
  NSString *teamID;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)AKAuthorizationUpgradeContext;
  v5 = -[AKAuthorizationUpgradeContext init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appID"));
    v6 = objc_claimAutoreleasedReturnValue();
    appID = v5->_appID;
    v5->_appID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_appName"));
    v8 = objc_claimAutoreleasedReturnValue();
    appName = v5->_appName;
    v5->_appName = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_bundleID"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_nonce"));
    v12 = objc_claimAutoreleasedReturnValue();
    nonce = v5->_nonce;
    v5->_nonce = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_serviceID"));
    v14 = objc_claimAutoreleasedReturnValue();
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_state"));
    v16 = objc_claimAutoreleasedReturnValue();
    state = v5->_state;
    v5->_state = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_teamID"));
    v18 = objc_claimAutoreleasedReturnValue();
    teamID = v5->_teamID;
    v5->_teamID = (NSString *)v18;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  AKAuthorizationUpgradeContext *v4;
  uint64_t v5;
  NSString *appID;
  uint64_t v7;
  NSString *appName;
  uint64_t v9;
  NSString *bundleID;
  uint64_t v11;
  NSString *nonce;
  uint64_t v13;
  NSString *serviceID;
  uint64_t v15;
  NSString *state;
  uint64_t v17;
  NSString *teamID;

  v4 = objc_alloc_init(AKAuthorizationUpgradeContext);
  v5 = -[NSString copy](self->_appID, "copy");
  appID = v4->_appID;
  v4->_appID = (NSString *)v5;

  v7 = -[NSString copy](self->_appName, "copy");
  appName = v4->_appName;
  v4->_appName = (NSString *)v7;

  v9 = -[NSString copy](self->_bundleID, "copy");
  bundleID = v4->_bundleID;
  v4->_bundleID = (NSString *)v9;

  v11 = -[NSString copy](self->_nonce, "copy");
  nonce = v4->_nonce;
  v4->_nonce = (NSString *)v11;

  v13 = -[NSString copy](self->_serviceID, "copy");
  serviceID = v4->_serviceID;
  v4->_serviceID = (NSString *)v13;

  v15 = -[NSString copy](self->_state, "copy");
  state = v4->_state;
  v4->_state = (NSString *)v15;

  v17 = -[NSString copy](self->_teamID, "copy");
  teamID = v4->_teamID;
  v4->_teamID = (NSString *)v17;

  return v4;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)appID
{
  return self->_appID;
}

- (void)setAppID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)teamID
{
  return self->_teamID;
}

- (void)setTeamID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)nonce
{
  return self->_nonce;
}

- (void)setNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_nonce, 0);
  objc_storeStrong((id *)&self->_teamID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_appID, 0);
  objc_storeStrong((id *)&self->_appName, 0);
}

@end
