@implementation BAApplicationConfigurationOverrides

- (void)setEssentialMaxInstallSize:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *essentialMaxInstallSize;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && -[NSNumber integerValue](v4, "integerValue") < 0)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v7)
      -[BAApplicationConfigurationOverrides setEssentialMaxInstallSize:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([essentialMaxInstallSize integerVal"
                               "ue] >= 0), essentialMaxInstallSize must be >= 0.";
    __break(1u);
  }
  else
  {
    essentialMaxInstallSize = self->_essentialMaxInstallSize;
    self->_essentialMaxInstallSize = v5;

  }
}

- (void)setMaxInstallSize:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *maxInstallSize;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && -[NSNumber integerValue](v4, "integerValue") < 0)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v7)
      -[BAApplicationConfigurationOverrides setMaxInstallSize:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([maxInstallSize integerValue] >= 0)"
                               ", maxInstallSize must be >= 0.";
    __break(1u);
  }
  else
  {
    maxInstallSize = self->_maxInstallSize;
    self->_maxInstallSize = v5;

  }
}

- (void)setEssentialDownloadAllowance:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *essentialDownloadAllowance;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && -[NSNumber integerValue](v4, "integerValue") < 0)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v7)
      -[BAApplicationConfigurationOverrides setEssentialDownloadAllowance:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([essentialDownloadAllowance integer"
                               "Value] >= 0), essentialDownloadAllowance must be >= 0.";
    __break(1u);
  }
  else
  {
    essentialDownloadAllowance = self->_essentialDownloadAllowance;
    self->_essentialDownloadAllowance = v5;

  }
}

- (void)setDownloadAllowance:(id)a3
{
  NSNumber *v4;
  NSNumber *v5;
  NSNumber *downloadAllowance;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSNumber *)a3;
  v5 = v4;
  if (v4 && -[NSNumber integerValue](v4, "integerValue") < 0)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v7)
      -[BAApplicationConfigurationOverrides setDownloadAllowance:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([downloadAllowance integerValue] >="
                               " 0), downloadAllowance must be >= 0.";
    __break(1u);
  }
  else
  {
    downloadAllowance = self->_downloadAllowance;
    self->_downloadAllowance = v5;

  }
}

- (void)setManifestURL:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *manifestURL;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (NSString *)a3;
  v5 = v4;
  if (v4 && !-[NSString length](v4, "length"))
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
    if (v7)
      -[BAApplicationConfigurationOverrides setManifestURL:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([manifestURL length] > 0), manifest"
                               "URL cannot be empty.";
    __break(1u);
  }
  else
  {
    manifestURL = self->_manifestURL;
    self->_manifestURL = v5;

  }
}

- (void)setDomainAllowlist:(id)a3
{
  NSArray *v4;
  NSArray *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  NSArray *domainAllowlist;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = (NSArray *)a3;
  v5 = v4;
  if (!v4)
  {
LABEL_12:
    domainAllowlist = self->_domainAllowlist;
    self->_domainAllowlist = v5;

    return;
  }
  if (-[NSArray count](v4, "count"))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v6 = v5;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v6);
          if (!objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "length", (_QWORD)v28))
          {
            v12 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
            if (v12)
              -[BAApplicationConfigurationOverrides setDomainAllowlist:].cold.2(v12, v13, v14, v15, v16, v17, v18, v19);
            qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([item length] > 0), domainA"
                                       "llowlist items cannot be empty.";
            __break(1u);
          }
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }

    goto LABEL_12;
  }
  v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT);
  if (v20)
    -[BAApplicationConfigurationOverrides setDomainAllowlist:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);
  qword_255111848 = (uint64_t)"BUG IN CLIENT OF BackgroundAssets: Assertion failed: ([domainAllowlist count] > 0), domainA"
                             "llowlist cannot be empty.";
  __break(1u);
}

+ (id)overridesForAppBundleIdentifier:(id)a3
{
  return +[BAApplicationConfigurationOverrides _getOverridesForAppBundleIdentifier:]((uint64_t)a1, a3);
}

+ (id)_getOverridesForAppBundleIdentifier:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)objc_opt_new();
  +[BAApplicationConfigurationOverrides _getInternalAppOverridesDict]();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("BAEssentialMaxInstallSize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEssentialMaxInstallSize:", v6);

    objc_msgSend(v5, "objectForKey:", CFSTR("BAMaxInstallSize"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setMaxInstallSize:", v7);

    objc_msgSend(v5, "objectForKey:", CFSTR("BAEssentialDownloadAllowance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEssentialDownloadAllowance:", v8);

    objc_msgSend(v5, "objectForKey:", CFSTR("BADownloadAllowance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDownloadAllowance:", v9);

    objc_msgSend(v5, "objectForKey:", CFSTR("BAManifestURL"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setManifestURL:", v10);

    objc_msgSend(v5, "objectForKey:", CFSTR("BADownloadDomainAllowList"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setDomainAllowlist:", v11);

  }
  return v3;
}

+ (BOOL)setOverrides:(id)a3 forAppBundleIdentifier:(id)a4
{
  return +[BAApplicationConfigurationOverrides _saveOverrides:forAppBundleIdentifier:]((uint64_t)a1, a3, a4);
}

+ (BOOL)_saveOverrides:(void *)a3 forAppBundleIdentifier:
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL8 v21;

  v4 = a2;
  v5 = a3;
  objc_opt_self();
  +[BAApplicationConfigurationOverrides _getInternalAppOverridesDict]();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "manifestURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v4, "manifestURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v10, CFSTR("BAManifestURL"));

    }
    objc_msgSend(v4, "domainAllowlist");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v4, "domainAllowlist");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v12, CFSTR("BADownloadDomainAllowList"));

    }
    objc_msgSend(v4, "essentialMaxInstallSize");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v4, "essentialMaxInstallSize");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v14, CFSTR("BAEssentialMaxInstallSize"));

    }
    objc_msgSend(v4, "maxInstallSize");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v4, "maxInstallSize");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v16, CFSTR("BAMaxInstallSize"));

    }
    objc_msgSend(v4, "essentialDownloadAllowance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v4, "essentialDownloadAllowance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v18, CFSTR("BAEssentialDownloadAllowance"));

    }
    objc_msgSend(v4, "downloadAllowance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v4, "downloadAllowance");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setValue:forKey:", v20, CFSTR("BADownloadAllowance"));

    }
    objc_msgSend(v7, "setValue:forKey:", v8, v5);

  }
  else
  {
    objc_msgSend(v6, "removeObjectForKey:", v5);
  }
  CFPreferencesSetAppValue(CFSTR("InternalAppOverrides"), v7, CFSTR("com.apple.backgroundassets"));
  v21 = CFPreferencesAppSynchronize(CFSTR("com.apple.backgroundassets")) != 0;

  return v21;
}

+ (BOOL)clearOverridesForAppBundleIdentifier:(id)a3
{
  return +[BAApplicationConfigurationOverrides _saveOverrides:forAppBundleIdentifier:]((uint64_t)a1, 0, a3);
}

+ (BOOL)clearAllOverrides
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("InternalAppOverrides"), v2, CFSTR("com.apple.backgroundassets"));
  v3 = CFPreferencesAppSynchronize(CFSTR("com.apple.backgroundassets")) != 0;

  return v3;
}

+ (id)_getInternalAppOverridesDict
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  objc_opt_self();
  v0 = (void *)CFPreferencesCopyAppValue(CFSTR("InternalAppOverrides"), CFSTR("com.apple.backgroundassets"));
  v1 = v0;
  if (v0)
  {
    v2 = objc_msgSend(v0, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v2 = objc_claimAutoreleasedReturnValue();
  }
  v3 = (void *)v2;

  return v3;
}

- (NSNumber)essentialMaxInstallSize
{
  return self->_essentialMaxInstallSize;
}

- (NSNumber)maxInstallSize
{
  return self->_maxInstallSize;
}

- (NSString)manifestURL
{
  return self->_manifestURL;
}

- (NSNumber)essentialDownloadAllowance
{
  return self->_essentialDownloadAllowance;
}

- (NSNumber)downloadAllowance
{
  return self->_downloadAllowance;
}

- (NSArray)domainAllowlist
{
  return self->_domainAllowlist;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainAllowlist, 0);
  objc_storeStrong((id *)&self->_downloadAllowance, 0);
  objc_storeStrong((id *)&self->_essentialDownloadAllowance, 0);
  objc_storeStrong((id *)&self->_manifestURL, 0);
  objc_storeStrong((id *)&self->_maxInstallSize, 0);
  objc_storeStrong((id *)&self->_essentialMaxInstallSize, 0);
}

- (void)setEssentialMaxInstallSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setMaxInstallSize:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setEssentialDownloadAllowance:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setDownloadAllowance:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setManifestURL:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setDomainAllowlist:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)setDomainAllowlist:(uint64_t)a3 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21ABD8000, MEMORY[0x24BDACB70], a3, "BUG IN CLIENT OF BackgroundAssets: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
