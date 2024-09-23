@implementation AKRemoteViewServiceConfiguration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSString *hostBundleID;
  NSString *hostSceneID;
  id v7;

  v4 = a3;
  hostBundleID = self->_hostBundleID;
  v7 = v4;
  if (hostBundleID)
  {
    objc_msgSend(v4, "encodeObject:forKey:", hostBundleID, CFSTR("_hostBundleID"));
    v4 = v7;
  }
  hostSceneID = self->_hostSceneID;
  if (hostSceneID)
  {
    objc_msgSend(v7, "encodeObject:forKey:", hostSceneID, CFSTR("_hostSceneID"));
    v4 = v7;
  }

}

- (AKRemoteViewServiceConfiguration)initWithCoder:(id)a3
{
  id v4;
  AKRemoteViewServiceConfiguration *v5;
  uint64_t v6;
  NSString *hostBundleID;
  uint64_t v8;
  NSString *hostSceneID;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AKRemoteViewServiceConfiguration;
  v5 = -[AKRemoteViewServiceConfiguration init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hostBundleID"));
    v6 = objc_claimAutoreleasedReturnValue();
    hostBundleID = v5->_hostBundleID;
    v5->_hostBundleID = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_hostSceneID"));
    v8 = objc_claimAutoreleasedReturnValue();
    hostSceneID = v5->_hostSceneID;
    v5->_hostSceneID = (NSString *)v8;

  }
  return v5;
}

+ (id)configurationForHostWithBundleID:(id)a3 sceneID:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  +[AKRemoteViewServiceConfiguration defaultConfiguration](AKRemoteViewServiceConfiguration, "defaultConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHostBundleID:", v6);

  objc_msgSend(v7, "setHostSceneID:", v5);
  return v7;
}

+ (id)defaultConfiguration
{
  return objc_alloc_init(AKRemoteViewServiceConfiguration);
}

- (NSString)hostBundleID
{
  return self->_hostBundleID;
}

- (void)setHostBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)hostSceneID
{
  return self->_hostSceneID;
}

- (void)setHostSceneID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostSceneID, 0);
  objc_storeStrong((id *)&self->_hostBundleID, 0);
}

@end
