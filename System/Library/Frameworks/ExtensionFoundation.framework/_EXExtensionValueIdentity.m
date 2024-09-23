@implementation _EXExtensionValueIdentity

- (id)UUID
{
  return objc_getProperty(self, a2, 64, 1);
}

- (id)url
{
  return objc_getProperty(self, a2, 88, 1);
}

- (id)attributes
{
  return objc_getProperty(self, a2, 120, 1);
}

- (unsigned)userElection
{
  return self->_userElection;
}

- (unsigned)platform
{
  return self->_platform;
}

- (id)localizedName
{
  return objc_getProperty(self, a2, 72, 1);
}

- (id)extensionDictionary
{
  return objc_getProperty(self, a2, 112, 1);
}

- (id)entitlements
{
  return objc_getProperty(self, a2, 128, 1);
}

- (unsigned)defaultUserElection
{
  return self->_defaultUserElection;
}

- (id)containingURL
{
  return objc_getProperty(self, a2, 96, 1);
}

- (id)containingBundleRecord
{
  return objc_getProperty(self, a2, 56, 1);
}

- (id)bundleVersion
{
  return objc_getProperty(self, a2, 48, 1);
}

- (_EXExtensionValueIdentity)initWithCoder:(id)a3
{
  id v4;
  _EXExtensionValueIdentity *v5;
  uint64_t v6;
  NSString *extensionPointIdentifier;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *bundleVersion;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  LSBundleRecord *containingBundleRecord;
  NSObject *v17;
  uint64_t v18;
  NSUUID *UUID;
  uint64_t v20;
  NSString *localizedName;
  uint64_t v22;
  NSString *developerName;
  uint64_t v24;
  NSURL *url;
  uint64_t v26;
  NSURL *containingURL;
  void *v28;
  void *v29;
  uint64_t v30;
  NSDictionary *sdkDictionary;
  void *v32;
  void *v33;
  uint64_t v34;
  NSDictionary *extensionDictionary;
  void *v36;
  void *v37;
  uint64_t v38;
  NSDictionary *attributes;
  void *v40;
  void *v41;
  uint64_t v42;
  NSDictionary *entitlements;
  uint8_t v45[16];
  objc_super v46;

  v4 = a3;
  v46.receiver = self;
  v46.super_class = (Class)_EXExtensionValueIdentity;
  v5 = -[_EXExtensionIdentity _init](&v46, sel__init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("extensionPointIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    extensionPointIdentifier = v5->_extensionPointIdentifier;
    v5->_extensionPointIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleVersion"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v10;

    objc_msgSend(MEMORY[0x1E0CA58C0], "sharedDatabaseContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "canAccess");

    if (v13)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containingBundleRecordIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithPersistentIdentifier:", v14);
        containingBundleRecord = v5->_containingBundleRecord;
        v5->_containingBundleRecord = (LSBundleRecord *)v15;

        if (!v5->_containingBundleRecord)
        {
          _EXDefaultLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v45 = 0;
            _os_log_impl(&dword_190C25000, v17, OS_LOG_TYPE_DEFAULT, "Failed to locate container app bundle record. The process may not be entitled to access the LaunchServices database or the app may have moved.", v45, 2u);
          }

        }
      }

    }
    v5->_platform = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("platform"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
    v18 = objc_claimAutoreleasedReturnValue();
    UUID = v5->_UUID;
    v5->_UUID = (NSUUID *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedName"));
    v20 = objc_claimAutoreleasedReturnValue();
    localizedName = v5->_localizedName;
    v5->_localizedName = (NSString *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("developerName"));
    v22 = objc_claimAutoreleasedReturnValue();
    developerName = v5->_developerName;
    v5->_developerName = (NSString *)v22;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v24 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v24;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("containingURL"));
    v26 = objc_claimAutoreleasedReturnValue();
    containingURL = v5->_containingURL;
    v5->_containingURL = (NSURL *)v26;

    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "plistTypes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("sdkDictionary"));
    v30 = objc_claimAutoreleasedReturnValue();
    sdkDictionary = v5->_sdkDictionary;
    v5->_sdkDictionary = (NSDictionary *)v30;

    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "plistTypes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("extensionDictionary"));
    v34 = objc_claimAutoreleasedReturnValue();
    extensionDictionary = v5->_extensionDictionary;
    v5->_extensionDictionary = (NSDictionary *)v34;

    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "plistTypes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v37, CFSTR("attributes"));
    v38 = objc_claimAutoreleasedReturnValue();
    attributes = v5->_attributes;
    v5->_attributes = (NSDictionary *)v38;

    +[_EXDefaults sharedInstance](_EXDefaults, "sharedInstance");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "plistTypes");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("entitlements"));
    v42 = objc_claimAutoreleasedReturnValue();
    entitlements = v5->_entitlements;
    v5->_entitlements = (NSDictionary *)v42;

    v5->_userElection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("userElection"));
    v5->_defaultUserElection = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("defaultUserElection"));
    v5->_systemComponent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSystemComponent"));
  }

  return v5;
}

- (id)sdkDictionary
{
  return objc_getProperty(self, a2, 104, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)bundleIdentifier
{
  return objc_getProperty(self, a2, 40, 1);
}

- (id)extensionPointIdentifier
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_extensionDictionary, 0);
  objc_storeStrong((id *)&self->_sdkDictionary, 0);
  objc_storeStrong((id *)&self->_containingURL, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_developerName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
  objc_storeStrong((id *)&self->_containingBundleRecord, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionPointIdentifier, 0);
}

- (id)entitlementNamed:(id)a3 ofClass:(Class)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[_EXExtensionValueIdentity entitlements](self, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_EX_objectForKey:ofClass:", v6, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)applicationExtensionRecord
{
  return 0;
}

- (id)developerName
{
  return objc_getProperty(self, a2, 80, 1);
}

- (BOOL)isSystemComponent
{
  return self->_systemComponent;
}

@end
