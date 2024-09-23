@implementation EXEnumeratorConfig

- (EXEnumeratorConfig)init
{
  EXEnumeratorConfig *v2;
  void *v3;
  uint64_t v4;
  NSURL *extensionPointsConfigURL;
  void *v6;
  uint64_t v7;
  NSDictionary *legacyExtensionPointAllowList;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSDictionary *compatibilityExtensionPointAllowList;
  uint64_t v14;
  NSURL *rootURL;
  uint64_t v16;
  NSURL *xpcExtensionsCache;
  uint64_t v18;
  NSURL *xpcExtensionPointsCache;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)EXEnumeratorConfig;
  v2 = -[EXEnumeratorConfig init](&v21, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("config"), CFSTR("plist"));
    v4 = objc_claimAutoreleasedReturnValue();
    extensionPointsConfigURL = v2->_extensionPointsConfigURL;
    v2->_extensionPointsConfigURL = (NSURL *)v4;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v2->_extensionPointsConfigURL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_EX_dictionaryForKey:", CFSTR("LegacyExtensionPointAllowList"));
    v7 = objc_claimAutoreleasedReturnValue();
    legacyExtensionPointAllowList = v2->_legacyExtensionPointAllowList;
    v2->_legacyExtensionPointAllowList = (NSDictionary *)v7;

    v9 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("compatibility"), CFSTR("plist"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dictionaryWithContentsOfURL:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "_EX_dictionaryForKey:", CFSTR("LegacyExtensionPointAllowList"));
    v12 = objc_claimAutoreleasedReturnValue();
    compatibilityExtensionPointAllowList = v2->_compatibilityExtensionPointAllowList;
    v2->_compatibilityExtensionPointAllowList = (NSDictionary *)v12;

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/"), 1);
    v14 = objc_claimAutoreleasedReturnValue();
    rootURL = v2->_rootURL;
    v2->_rootURL = (NSURL *)v14;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v2->_rootURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/xpc/launchd.plist"), 0);
    v16 = objc_claimAutoreleasedReturnValue();
    xpcExtensionsCache = v2->_xpcExtensionsCache;
    v2->_xpcExtensionsCache = (NSURL *)v16;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v2->_rootURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("System/Library/xpc/extensions.plist"), 0);
    v18 = objc_claimAutoreleasedReturnValue();
    xpcExtensionPointsCache = v2->_xpcExtensionPointsCache;
    v2->_xpcExtensionPointsCache = (NSURL *)v18;

  }
  return v2;
}

- (NSURL)extensionPointsConfigURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (NSDictionary)legacyExtensionPointAllowList
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (NSDictionary)compatibilityExtensionPointAllowList
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (NSURL)rootURL
{
  return (NSURL *)objc_getProperty(self, a2, 32, 1);
}

- (NSURL)xpcExtensionsCache
{
  return (NSURL *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)xpcExtensionPointsCache
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcExtensionPointsCache, 0);
  objc_storeStrong((id *)&self->_xpcExtensionsCache, 0);
  objc_storeStrong((id *)&self->_rootURL, 0);
  objc_storeStrong((id *)&self->_compatibilityExtensionPointAllowList, 0);
  objc_storeStrong((id *)&self->_legacyExtensionPointAllowList, 0);
  objc_storeStrong((id *)&self->_extensionPointsConfigURL, 0);
}

@end
