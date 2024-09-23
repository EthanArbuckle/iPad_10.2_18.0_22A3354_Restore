@implementation FSModuleInstance

- (FSModuleInstance)initWithExtensionRecord:(id)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  FSModuleInstance *v8;
  FSModuleInstance *v9;
  FSModuleIdentity *v10;
  FSModuleIdentity *identity;
  uint64_t v12;
  FSModuleIdentity *v13;
  objc_super v15;

  v4 = a4;
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FSModuleInstance;
  v8 = -[FSModuleInstance init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_record, a3);
    v10 = [FSModuleIdentity alloc];
    identity = v9->_identity;
    v9->_identity = v10;

    v12 = -[FSModuleIdentity initWithApplicationExtensionRecord:isEnabled:](v9->_identity, "initWithApplicationExtensionRecord:isEnabled:", v7, v4);
    v13 = v9->_identity;
    v9->_identity = (FSModuleIdentity *)v12;

  }
  return v9;
}

- (FSModuleInstance)initWithExtensionIdentity:(id)a3
{
  id v4;
  FSModuleInstance *v5;
  uint64_t v6;
  LSApplicationExtensionRecord *record;
  FSModuleIdentity *v8;
  FSModuleIdentity *identity;
  uint64_t v10;
  FSModuleIdentity *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FSModuleInstance;
  v5 = -[FSModuleInstance init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "applicationExtensionRecord");
    v6 = objc_claimAutoreleasedReturnValue();
    record = v5->_record;
    v5->_record = (LSApplicationExtensionRecord *)v6;

    v8 = [FSModuleIdentity alloc];
    identity = v5->_identity;
    v5->_identity = v8;

    v10 = -[FSModuleIdentity initWithApplicationExtensionRecord:isEnabled:](v5->_identity, "initWithApplicationExtensionRecord:isEnabled:", v5->_record, 1);
    v11 = v5->_identity;
    v5->_identity = (FSModuleIdentity *)v10;

  }
  return v5;
}

+ (id)instanceWithExtensionIdentity:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithExtensionIdentity:", v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  FSModuleInstance *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (FSModuleInstance *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[FSModuleInstance identity](self, "identity");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "attributes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[FSModuleInstance identity](v4, "identity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "attributes");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v8, "isEqual:", v10);

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (NSString)extensionPointIdentifier
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord extensionPointRecord](self->_record, "extensionPointRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)bundleIdentifier
{
  return (NSString *)-[LSApplicationExtensionRecord bundleIdentifier](self->_record, "bundleIdentifier");
}

- (NSString)bundleVersion
{
  return (NSString *)-[LSApplicationExtensionRecord bundleVersion](self->_record, "bundleVersion");
}

- (unsigned)platform
{
  return -[LSApplicationExtensionRecord platform](self->_record, "platform");
}

- (NSUUID)UUID
{
  return (NSUUID *)-[LSApplicationExtensionRecord uniqueIdentifier](self->_record, "uniqueIdentifier");
}

- (NSString)localizedName
{
  return (NSString *)-[LSApplicationExtensionRecord localizedName](self->_record, "localizedName");
}

- (NSURL)url
{
  return (NSURL *)-[LSApplicationExtensionRecord URL](self->_record, "URL");
}

- (NSURL)containingURL
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord containingBundleRecord](self->_record, "containingBundleRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSDictionary)sdkDictionary
{
  void *v2;
  void *v3;
  void *v4;

  -[LSApplicationExtensionRecord extensionPointRecord](self->_record, "extensionPointRecord");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SDKDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "_expensiveDictionaryRepresentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1B8];
  }

  return (NSDictionary *)v4;
}

- (NSDictionary)extensionDictionary
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord infoDictionary](self->_record, "infoDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:ofClass:", CFSTR("NSExtension"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)attributes
{
  return -[FSModuleIdentity attributes](self->_identity, "attributes");
}

- (NSDictionary)entitlements
{
  void *v2;
  void *v3;

  -[LSApplicationExtensionRecord entitlements](self->_record, "entitlements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "_expensiveDictionaryRepresentation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x24BDBD1B8];
  }

  return (NSDictionary *)v3;
}

- (id)entitlementNamed:(id)a3 ofClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[FSModuleInstance record](self, "record");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:ofClass:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (FSModuleIdentity)identity
{
  return self->_identity;
}

- (LSApplicationExtensionRecord)record
{
  return self->_record;
}

- (NSURL)executableURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executableURL, 0);
  objc_storeStrong((id *)&self->_record, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
