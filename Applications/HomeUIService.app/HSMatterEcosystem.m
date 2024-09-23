@implementation HSMatterEcosystem

+ (id)ecosystemForContainingAppBundleURL:(id)a3
{
  id v3;
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  id v7;
  HSMatterEcosystem *v8;
  uint64_t v9;
  NSObject *v10;
  id v12;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)MTSDeviceSetupExtensionMessenger), "initWithContainingAppBundleURL:", v3);

  v12 = 0;
  v5 = objc_msgSend(v4, "startWithError:", &v12);
  v7 = v12;
  if ((v5 & 1) != 0)
  {
    v8 = -[HSMatterEcosystem initWithExtensionMessenger:]([HSMatterEcosystem alloc], "initWithExtensionMessenger:", v4);
  }
  else
  {
    v9 = HFLogForCategory(58, v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005E4FC((uint64_t)v7, v10);

    v8 = 0;
  }

  return v8;
}

- (HSMatterEcosystem)initWithApplicationRecord:(id)a3
{
  id v4;
  HSMatterEcosystem *v5;
  HSMatterEcosystem *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HSMatterEcosystem;
  v5 = -[HSMatterEcosystem init](&v8, "init");
  v6 = v5;
  if (v5)
    -[HSMatterEcosystem setApplicationRecord:](v5, "setApplicationRecord:", v4);

  return v6;
}

- (HSMatterEcosystem)initWithExtensionMessenger:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  HSMatterEcosystem *v13;
  MTSDeviceSetupExtensionMessenger *extensionMessenger;
  id v15;
  id v17;

  v4 = a3;
  v5 = objc_alloc((Class)LSApplicationRecord);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingAppBundleURL"));
  v17 = 0;
  v7 = objc_msgSend(v5, "initWithURL:allowPlaceholder:error:", v6, 0, &v17);
  v8 = v17;

  if (!v7)
  {
    v10 = HFLogForCategory(58, v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10005E570(v4, (uint64_t)v8, v11);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "containingAppBundleURL"));
    NSLog(CFSTR("Failed to create app record from containing app bundle URL %@: %@"), v12, v8);

  }
  v13 = -[HSMatterEcosystem initWithApplicationRecord:](self, "initWithApplicationRecord:", v7);
  extensionMessenger = v13->_extensionMessenger;
  v13->_extensionMessenger = (MTSDeviceSetupExtensionMessenger *)v4;
  v15 = v4;

  return v13;
}

- (NSString)displayName
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSMatterEcosystem applicationRecord](self, "applicationRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedName"));

  return (NSString *)v3;
}

- (NSString)developerName
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSMatterEcosystem applicationRecord](self, "applicationRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iTunesMetadata"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "artistName"));

  return (NSString *)v4;
}

- (NSString)appBundleIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSMatterEcosystem applicationRecord](self, "applicationRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIdentifier"));

  return (NSString *)v3;
}

- (NSString)teamIdentifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSMatterEcosystem applicationRecord](self, "applicationRecord"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "teamIdentifier"));

  return (NSString *)v3;
}

- (BOOL)isAppleHome
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSMatterEcosystem appBundleIdentifier](self, "appBundleIdentifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Home"));

  return v3;
}

- (BOOL)isTestEcosystemApp
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[HSMatterEcosystem appBundleIdentifier](self, "appBundleIdentifier"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.appleinternal.Chai"));

  return v3;
}

- (MTSDeviceSetupExtensionMessenger)extensionMessenger
{
  return self->_extensionMessenger;
}

- (LSApplicationRecord)applicationRecord
{
  return self->_applicationRecord;
}

- (void)setApplicationRecord:(id)a3
{
  objc_storeStrong((id *)&self->_applicationRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationRecord, 0);
  objc_storeStrong((id *)&self->_extensionMessenger, 0);
}

@end
