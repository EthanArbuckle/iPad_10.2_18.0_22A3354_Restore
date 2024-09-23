@implementation SOKerberosSettingsManager

- (SOKerberosSettingsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SOKerberosSettingsManager;
  return -[SOKerberosSettingsManager init](&v3, sel_init);
}

- (void)saveKerberosValuesForProfile:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  SOKerberosHeimdalPluginSettings *v6;
  id v7;
  SOKerberosHeimdalPluginSettings *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  SOKerberosExtensionData *v16;
  void *v17;
  SOKerberosExtensionData *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  BOOL v32;
  id v33;
  NSObject *v34;
  id v35;
  id v36;

  v3 = a3;
  SO_LOG_SOKerberosSettingsManager();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SOKerberosSettingsManager saveKerberosValuesForProfile:].cold.4();

  objc_msgSend(v3, "realm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  +[SOKerberosHeimdalPluginSettings retrieveCurrentSettingsForRealm:error:](SOKerberosHeimdalPluginSettings, "retrieveCurrentSettingsForRealm:error:", v5, &v36);
  v6 = (SOKerberosHeimdalPluginSettings *)objc_claimAutoreleasedReturnValue();
  v7 = v36;

  if (!v6)
  {
    v8 = [SOKerberosHeimdalPluginSettings alloc];
    objc_msgSend(v3, "realm");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[SOKerberosHeimdalPluginSettings initWithRealm:](v8, "initWithRealm:", v9);

  }
  -[SOKerberosHeimdalPluginSettings hosts](v6, "hosts");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hosts");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToArray:", v11);

  if ((v12 & 1) == 0)
  {
    objc_msgSend(v3, "hosts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");
    -[SOKerberosHeimdalPluginSettings setHosts:](v6, "setHosts:", v14);

  }
  v15 = v12 ^ 1;
  v16 = [SOKerberosExtensionData alloc];
  objc_msgSend(v3, "extensionData");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[SOKerberosExtensionData initWithDictionary:](v16, "initWithDictionary:", v17);

  if (!v18)
  {
    SO_LOG_SOKerberosSettingsManager();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      -[SOKerberosSettingsManager saveKerberosValuesForProfile:].cold.3(v3, v29);
    goto LABEL_20;
  }
  v19 = -[SOKerberosHeimdalPluginSettings isDefaultRealm](v6, "isDefaultRealm");
  if (v19 != -[SOKerberosExtensionData isDefaultRealm](v18, "isDefaultRealm"))
  {
    -[SOKerberosHeimdalPluginSettings setDefaultRealm:](v6, "setDefaultRealm:", -[SOKerberosExtensionData isDefaultRealm](v18, "isDefaultRealm"));
    v15 = 1;
  }
  -[SOKerberosHeimdalPluginSettings domainRealmMapping](v6, "domainRealmMapping");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosExtensionData domainRealmMapping](v18, "domainRealmMapping");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "isEqualToDictionary:", v21);

  if ((v22 & 1) == 0)
  {
    -[SOKerberosExtensionData domainRealmMapping](v18, "domainRealmMapping");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOKerberosHeimdalPluginSettings setDomainRealmMapping:](v6, "setDomainRealmMapping:", v23);

    v15 = 1;
  }
  v24 = -[SOKerberosHeimdalPluginSettings credentialUseMode](v6, "credentialUseMode");
  if (v24 != -[SOKerberosExtensionData credentialUseMode](v18, "credentialUseMode"))
  {
    -[SOKerberosHeimdalPluginSettings setCredentialUseMode:](v6, "setCredentialUseMode:", -[SOKerberosExtensionData credentialUseMode](v18, "credentialUseMode"));
    v15 = 1;
  }
  if (!-[SOKerberosExtensionData useSiteAutoDiscovery](v18, "useSiteAutoDiscovery"))
  {
    -[SOKerberosExtensionData siteCode](v18, "siteCode");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[SOKerberosHeimdalPluginSettings setSiteCode:](v6, "setSiteCode:", v25);

  }
  -[SOKerberosHeimdalPluginSettings kdcs](v6, "kdcs");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosExtensionData preferredKDCs](v18, "preferredKDCs");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v26, "isEqualToArray:", v27);

  if ((v28 & 1) == 0)
  {
    -[SOKerberosExtensionData preferredKDCs](v18, "preferredKDCs");
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = -[NSObject copy](v29, "copy");
    -[SOKerberosHeimdalPluginSettings setKdcs:](v6, "setKdcs:", v30);

    v15 = 1;
LABEL_20:

  }
  SO_LOG_SOKerberosSettingsManager();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    -[SOKerberosSettingsManager saveKerberosValuesForProfile:].cold.2(v15, v31);

  if (v15)
  {
    v35 = v7;
    v32 = -[SOKerberosHeimdalPluginSettings saveWithError:](v6, "saveWithError:", &v35);
    v33 = v35;

    if (!v32)
    {
      SO_LOG_SOKerberosSettingsManager();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        -[SOKerberosSettingsManager saveKerberosValuesForProfile:].cold.1();

    }
  }
  else
  {
    v33 = v7;
  }

}

- (BOOL)createKerberosSettingsCache
{
  NSObject *v3;
  SOKerberosSettingsManager *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  SOKerberosSettingsManager *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOKerberosSettingsManager();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOKerberosSettingsManager createKerberosSettingsCache]";
    v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_215A1B000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  v9 = 0;
  v5 = +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:](SOKerberosHeimdalPluginSettings, "createSettingCacheEntryIfNeededWithError:", &v9);
  v6 = v9;
  if (!v5)
  {
    SO_LOG_SOKerberosSettingsManager();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SOKerberosSettingsManager createKerberosSettingsCache].cold.1();

  }
  objc_sync_exit(v4);

  return v5;
}

- (void)saveKerberosValuesForProfile:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, v0, v1, "error when saving plugin settings: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)saveKerberosValuesForProfile:(char)a1 .cold.2(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_215A1B000, a2, OS_LOG_TYPE_DEBUG, "need to save: %d", (uint8_t *)v2, 8u);
}

- (void)saveKerberosValuesForProfile:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "extensionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, a2, v4, "error deserializing extension data: %{private}@", v5);

}

- (void)saveKerberosValuesForProfile:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_215A1B000, v0, OS_LOG_TYPE_DEBUG, "Saving values for profile: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)createKerberosSettingsCache
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, v0, v1, "error when creating settings cache: %@", v2);
  OUTLINED_FUNCTION_2();
}

@end
