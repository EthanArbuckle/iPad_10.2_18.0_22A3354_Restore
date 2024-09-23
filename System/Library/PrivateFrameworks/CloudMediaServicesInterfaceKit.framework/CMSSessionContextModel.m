@implementation CMSSessionContextModel

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[CMSSessionContextModel serverOverrideURL](self, "serverOverrideURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMSSessionContextModel serverEnvironmentOverride](self, "serverEnvironmentOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMSSessionContextModel sessionAuthHeaderOverride](self, "sessionAuthHeaderOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[CMSSessionContextModel homeKitAllowExplicitContentSetting](self, "homeKitAllowExplicitContentSetting");
  v8 = -[CMSSessionContextModel homeKitUpdateListeningHistorySetting](self, "homeKitUpdateListeningHistorySetting");
  -[CMSSessionContextModel serviceID](self, "serviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CMSSessionContextModel homeUserID](self, "homeUserID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<CMSSessionContextModel: serverOverrideURL: %@,\n serverEnvironmentOverride: %@,\n sessionAuthHeaderOverride: %@,\n homeKitAllowExplicitContentSetting: %d,\n homeKitUpdateListeningHistorySetting: %d,\n serviceID: %@,\n homeUserID:%@,\n userConfiguredServiceUpdateListeningHistory: %d,\n>"), v4, v5, v6, v7, v8, v9, v10, -[CMSSessionContextModel serviceUpdateListeningHistory](self, "serviceUpdateListeningHistory"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMSSessionContextModel)initWithCoder:(id)a3
{
  id v4;
  CMSSessionContextModel *v5;
  uint64_t v6;
  NSURL *serverOverrideURL;
  uint64_t v8;
  NSString *serverEnvironmentOverride;
  uint64_t v10;
  NSString *serviceID;
  uint64_t v12;
  NSString *homeUserID;
  uint64_t v14;
  NSString *sessionAuthHeaderOverride;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)CMSSessionContextModel;
  v5 = -[CMSSessionContextModel init](&v17, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSServerOverrideURLEncodedKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    serverOverrideURL = v5->_serverOverrideURL;
    v5->_serverOverrideURL = (NSURL *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSServerEnvironmentOverrideEncodedKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    serverEnvironmentOverride = v5->_serverEnvironmentOverride;
    v5->_serverEnvironmentOverride = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSServiceIDEncodedKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    serviceID = v5->_serviceID;
    v5->_serviceID = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSHomeUserIDEncodedKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    homeUserID = v5->_homeUserID;
    v5->_homeUserID = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CMSSessionAuthHeaderOverrideEncodedKey"));
    v14 = objc_claimAutoreleasedReturnValue();
    sessionAuthHeaderOverride = v5->_sessionAuthHeaderOverride;
    v5->_sessionAuthHeaderOverride = (NSString *)v14;

    v5->_serviceUpdateListeningHistory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CMSServiceUpdateListeningHistoryEncodedKey"));
    v5->_homeKitUpdateListeningHistorySetting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CMSHomeKitUpdateListeningHistorySettingEncodedKey"));
    v5->_homeKitAllowExplicitContentSetting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CMSHomeKitAllowExplicitContentSettingEncodedKey"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSURL *serverOverrideURL;
  id v5;

  serverOverrideURL = self->_serverOverrideURL;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", serverOverrideURL, CFSTR("CMSServerOverrideURLEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sessionAuthHeaderOverride, CFSTR("CMSSessionAuthHeaderOverrideEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serverEnvironmentOverride, CFSTR("CMSServerEnvironmentOverrideEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_serviceID, CFSTR("CMSServiceIDEncodedKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_homeUserID, CFSTR("CMSHomeUserIDEncodedKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_serviceUpdateListeningHistory, CFSTR("CMSServiceUpdateListeningHistoryEncodedKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_homeKitUpdateListeningHistorySetting, CFSTR("CMSHomeKitUpdateListeningHistorySettingEncodedKey"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_homeKitAllowExplicitContentSetting, CFSTR("CMSHomeKitAllowExplicitContentSettingEncodedKey"));

}

- (NSURL)serverOverrideURL
{
  return self->_serverOverrideURL;
}

- (void)setServerOverrideURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)serverEnvironmentOverride
{
  return self->_serverEnvironmentOverride;
}

- (void)setServerEnvironmentOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)sessionAuthHeaderOverride
{
  return self->_sessionAuthHeaderOverride;
}

- (void)setSessionAuthHeaderOverride:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)homeKitAllowExplicitContentSetting
{
  return self->_homeKitAllowExplicitContentSetting;
}

- (void)setHomeKitAllowExplicitContentSetting:(BOOL)a3
{
  self->_homeKitAllowExplicitContentSetting = a3;
}

- (BOOL)homeKitUpdateListeningHistorySetting
{
  return self->_homeKitUpdateListeningHistorySetting;
}

- (void)setHomeKitUpdateListeningHistorySetting:(BOOL)a3
{
  self->_homeKitUpdateListeningHistorySetting = a3;
}

- (NSString)serviceID
{
  return self->_serviceID;
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)homeUserID
{
  return self->_homeUserID;
}

- (void)setHomeUserID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (BOOL)serviceUpdateListeningHistory
{
  return self->_serviceUpdateListeningHistory;
}

- (void)setServiceUpdateListeningHistory:(BOOL)a3
{
  self->_serviceUpdateListeningHistory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUserID, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_sessionAuthHeaderOverride, 0);
  objc_storeStrong((id *)&self->_serverEnvironmentOverride, 0);
  objc_storeStrong((id *)&self->_serverOverrideURL, 0);
}

@end
