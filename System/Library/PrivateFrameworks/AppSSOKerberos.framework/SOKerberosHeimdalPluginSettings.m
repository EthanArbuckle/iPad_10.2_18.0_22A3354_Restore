@implementation SOKerberosHeimdalPluginSettings

- (SOKerberosHeimdalPluginSettings)init
{

  return 0;
}

- (SOKerberosHeimdalPluginSettings)initWithRealm:(id)a3
{
  id v5;
  SOKerberosHeimdalPluginSettings *v6;
  SOKerberosHeimdalPluginSettings *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SOKerberosHeimdalPluginSettings;
  v6 = -[SOKerberosHeimdalPluginSettings init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_realm, a3);

  return v7;
}

- (NSUUID)currentCredential
{
  void *v2;
  HeimCred_s *v3;
  const __CFDictionary *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  -[SOKerberosHeimdalPluginSettings realm](self, "realm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SOKerberosHeimdalPluginSettings retrieveSetting:forRealm:](SOKerberosHeimdalPluginSettings, "retrieveSetting:forRealm:", CFSTR("com.apple.AppSSO.Kerberos.CurrentCredential"), v2);

  if (!v3)
    goto LABEL_10;
  v4 = (const __CFDictionary *)HeimCredCopyAttributes();
  CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE4C348]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    CFRelease(v4);
  if (!v5
    || (objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    CFRelease(v3);

LABEL_10:
    v7 = 0;
    return (NSUUID *)v7;
  }
  v7 = (void *)v6;
  SO_LOG_SOKerberosHeimdalPluginSettings();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHeimdalPluginSettings currentCredential].cold.1();

  CFRelease(v3);
  return (NSUUID *)v7;
}

- (void)setCurrentCredential:(id)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!a3 || v5)
  {
    -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:](self, "saveSetting:data:withError:", CFSTR("com.apple.AppSSO.Kerberos.CurrentCredential"), v5, 0);
  }
  else
  {
    SO_LOG_SOKerberosHeimdalPluginSettings();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SOKerberosHeimdalPluginSettings setCurrentCredential:].cold.1(self, v7);

  }
}

- (NSString)siteCode
{
  void *v2;
  HeimCred_s *v3;
  const __CFDictionary *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;

  -[SOKerberosHeimdalPluginSettings realm](self, "realm");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[SOKerberosHeimdalPluginSettings retrieveSetting:forRealm:](SOKerberosHeimdalPluginSettings, "retrieveSetting:forRealm:", CFSTR("com.apple.AppSSO.Kerberos.SiteCode"), v2);

  if (!v3)
    goto LABEL_10;
  v4 = (const __CFDictionary *)HeimCredCopyAttributes();
  CFDictionaryGetValue(v4, (const void *)*MEMORY[0x24BE4C348]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    CFRelease(v4);
  if (!v5
    || (objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0),
        (v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    CFRelease(v3);

LABEL_10:
    v7 = 0;
    return (NSString *)v7;
  }
  v7 = (void *)v6;
  SO_LOG_SOKerberosHeimdalPluginSettings();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHeimdalPluginSettings siteCode].cold.1();

  CFRelease(v3);
  return (NSString *)v7;
}

- (void)setSiteCode:(id)a3
{
  uint64_t v5;
  void *v6;
  NSObject *v7;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (!a3 || v5)
  {
    -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:](self, "saveSetting:data:withError:", CFSTR("com.apple.AppSSO.Kerberos.SiteCode"), v5, 0);
  }
  else
  {
    SO_LOG_SOKerberosHeimdalPluginSettings();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SOKerberosHeimdalPluginSettings setSiteCode:].cold.1(self, v7);

  }
}

+ (NSString)appSSOKerberosCacheName
{
  return (NSString *)(id)_appsSSOKerberosCacheName;
}

+ (void)setAppSSOKerberosCacheName:(id)a3
{
  objc_storeStrong((id *)&_appsSSOKerberosCacheName, a3);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[SOKerberosHeimdalPluginSettings realm](self, "realm");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SOKerberosHeimdalPluginSettings isDefaultRealm](self, "isDefaultRealm"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  -[SOKerberosHeimdalPluginSettings domainRealmMapping](self, "domainRealmMapping");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosHeimdalPluginSettings hosts](self, "hosts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SOKerberosHeimdalPluginSettings kdcs](self, "kdcs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[SOKerberosHeimdalPluginSettings stringWithCredentialUseMode:](SOKerberosHeimdalPluginSettings, "stringWithCredentialUseMode:", -[SOKerberosHeimdalPluginSettings credentialUseMode](self, "credentialUseMode"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> Realm: %@, isDefaultRealm: %@, domainRealmMapping: %@, hosts: %@, kdcs: %@, credentialUseMode: %@"), v4, self, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBD1B8], "mutableCopy");
  -[SOKerberosHeimdalPluginSettings realm](self, "realm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("realm"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[SOKerberosHeimdalPluginSettings isDefaultRealm](self, "isDefaultRealm"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("isDefaultRealm"));

  -[SOKerberosHeimdalPluginSettings domainRealmMapping](self, "domainRealmMapping");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("domainRealmMapping"));

  -[SOKerberosHeimdalPluginSettings hosts](self, "hosts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("hosts"));

  -[SOKerberosHeimdalPluginSettings kdcs](self, "kdcs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("kdcs"));

  -[SOKerberosHeimdalPluginSettings siteCode](self, "siteCode");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("siteCode"));

  -[SOKerberosHeimdalPluginSettings currentCredential](self, "currentCredential");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("currentCredential"));

  +[SOKerberosHeimdalPluginSettings stringWithCredentialUseMode:](SOKerberosHeimdalPluginSettings, "stringWithCredentialUseMode:", -[SOKerberosHeimdalPluginSettings credentialUseMode](self, "credentialUseMode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("credentialUseMode"));

  return v3;
}

+ (id)stringWithCredentialUseMode:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("kerberosDefault");
  if (a3 == 1)
    v3 = CFSTR("whenNotSpecified");
  if (a3 == 2)
    return CFSTR("always");
  else
    return (id)v3;
}

- (BOOL)saveWithError:(id *)a3
{
  void *v5;
  BOOL v6;
  NSObject *v7;

  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:](self, "saveSetting:data:withError:", CFSTR("com.apple.AppSSO.Kerberos.Configuration"), v5, a3);
  }
  else
  {
    SO_LOG_SOKerberosHeimdalPluginSettings();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SOKerberosHeimdalPluginSettings saveWithError:].cold.1(self, v7);

    v6 = 0;
  }

  return v6;
}

- (BOOL)saveSetting:(id)a3 data:(id)a4 withError:(id *)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  HeimCred_s *v11;
  char v12;
  HeimCred_s *v13;
  HeimCred_s *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v25;
  _QWORD v26[6];
  _QWORD v27[7];

  v27[6] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  SO_LOG_SOKerberosHeimdalPluginSettings();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:].cold.2(self, v9);

  -[SOKerberosHeimdalPluginSettings realm](self, "realm");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = +[SOKerberosHeimdalPluginSettings retrieveSetting:forRealm:](SOKerberosHeimdalPluginSettings, "retrieveSetting:forRealm:", v7, v10);

  if (v11)
  {
    v12 = HeimCredSetAttribute();
LABEL_8:
    CFRelease(v11);
    goto LABEL_9;
  }
  if (!v8)
  {
    v12 = 0;
    goto LABEL_9;
  }
  v13 = +[SOKerberosHeimdalPluginSettings retrieveCacheEntry](SOKerberosHeimdalPluginSettings, "retrieveCacheEntry");
  if (v13)
  {
    v14 = v13;
    v15 = *MEMORY[0x24BE4C3C0];
    v16 = *MEMORY[0x24BE4C3B8];
    v26[0] = *MEMORY[0x24BE4C3D0];
    v26[1] = v16;
    v17 = *MEMORY[0x24BE4C3D8];
    v27[0] = v15;
    v27[1] = v17;
    v18 = *MEMORY[0x24BE4C340];
    v27[2] = v7;
    v19 = *MEMORY[0x24BE4C3B0];
    v26[2] = v18;
    v26[3] = v19;
    -[SOKerberosHeimdalPluginSettings realm](self, "realm");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x24BE4C348];
    v27[3] = v20;
    v27[4] = v8;
    v22 = *MEMORY[0x24BE4C3A8];
    v26[4] = v21;
    v26[5] = v22;
    v27[5] = HeimCredGetUUID();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (HeimCred_s *)HeimCredCreate();
    v12 = v11 != 0;

    CFRelease(v14);
    if (v11)
      goto LABEL_8;
  }
  else
  {
    SO_LOG_SOKerberosHeimdalPluginSettings();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:].cold.1();

    v12 = 0;
  }
LABEL_9:

  return v12;
}

+ (BOOL)createSettingCacheEntryIfNeededWithError:(id *)a3
{
  NSObject *v4;
  HeimCred_s *v5;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;

  SO_LOG_SOKerberosHeimdalPluginSettings();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:].cold.5();

  v5 = +[SOKerberosHeimdalPluginSettings retrieveCacheEntry](SOKerberosHeimdalPluginSettings, "retrieveCacheEntry");
  SO_LOG_SOKerberosHeimdalPluginSettings();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v7)
      +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:].cold.4();
LABEL_11:

    CFRelease(v5);
    return 1;
  }
  if (v7)
    +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:].cold.3();

  v5 = +[SOKerberosHeimdalPluginSettings createCacheEntryWithError:](SOKerberosHeimdalPluginSettings, "createCacheEntryWithError:", a3);
  SO_LOG_SOKerberosHeimdalPluginSettings();
  v6 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8)
      +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:].cold.2();
    goto LABEL_11;
  }
  if (v8)
    +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:].cold.1();

  return 0;
}

+ (HeimCred_s)retrieveCacheEntry
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  HeimCred_s *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE4C3C0];
  v3 = *MEMORY[0x24BE4C3B8];
  v11[0] = *MEMORY[0x24BE4C3D0];
  v11[1] = v3;
  v4 = *MEMORY[0x24BE4C3D8];
  v12[0] = v2;
  v12[1] = v4;
  v11[2] = *MEMORY[0x24BE4C340];
  objc_msgSend(a1, "appSSOKerberosCacheName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)HeimCredCopyQuery();
  if (objc_msgSend(v7, "count"))
  {
    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      SO_LOG_SOKerberosHeimdalPluginSettings();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[SOKerberosHeimdalPluginSettings retrieveCacheEntry].cold.1();

    }
    objc_msgSend(v7, "firstObject");
    v9 = (HeimCred_s *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (HeimCred_s)createCacheEntryWithError:(id *)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HeimCred_s *v12;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  SO_LOG_SOKerberosHeimdalPluginSettings();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    +[SOKerberosHeimdalPluginSettings createCacheEntryWithError:].cold.2();

  v5 = *MEMORY[0x24BE4C3C0];
  v6 = *MEMORY[0x24BE4C3B8];
  v14[0] = *MEMORY[0x24BE4C3D0];
  v14[1] = v6;
  v7 = *MEMORY[0x24BE4C3D8];
  v15[0] = v5;
  v15[1] = v7;
  v8 = *MEMORY[0x24BE4C338];
  v15[2] = &unk_24D3F2CB8;
  v9 = *MEMORY[0x24BE4C340];
  v14[2] = v8;
  v14[3] = v9;
  objc_msgSend(a1, "appSSOKerberosCacheName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (HeimCred_s *)HeimCredCreate();
  return v12;
}

+ (HeimCred_s)retrieveCurrentSettingsForRealm:(id)a3
{
  return (HeimCred_s *)objc_msgSend(a1, "retrieveSetting:forRealm:", CFSTR("com.apple.AppSSO.Kerberos.Configuration"), a3);
}

+ (HeimCred_s)retrieveSetting:(id)a3 forRealm:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  const void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  HeimCred_s *v16;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(a1, "retrieveCacheEntry");
  if (v8)
  {
    v9 = (const void *)v8;
    v10 = *MEMORY[0x24BE4C3B8];
    v18[0] = *MEMORY[0x24BE4C3D0];
    v18[1] = v10;
    v11 = *MEMORY[0x24BE4C3D8];
    v19[0] = *MEMORY[0x24BE4C3C0];
    v19[1] = v11;
    v12 = *MEMORY[0x24BE4C3B0];
    v18[2] = *MEMORY[0x24BE4C340];
    v18[3] = v12;
    v19[2] = v6;
    v19[3] = v7;
    v18[4] = *MEMORY[0x24BE4C3A8];
    v19[4] = HeimCredGetUUID();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
    v13 = objc_claimAutoreleasedReturnValue();
    CFRelease(v9);
    v14 = (void *)HeimCredCopyQuery();
    if (objc_msgSend(v14, "count"))
    {
      if ((unint64_t)objc_msgSend(v14, "count") >= 2)
      {
        SO_LOG_SOKerberosHeimdalPluginSettings();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[SOKerberosHeimdalPluginSettings retrieveSetting:forRealm:].cold.2();

      }
      objc_msgSend(v14, "firstObject");
      v16 = (HeimCred_s *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    SO_LOG_SOKerberosHeimdalPluginSettings();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:].cold.1();
    v16 = 0;
  }

  return v16;
}

+ (id)retrieveCurrentSettingsForRealm:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  const void *v9;
  const __CFDictionary *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v6 = a3;
  SO_LOG_SOKerberosHeimdalPluginSettings();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[SOKerberosHeimdalPluginSettings retrieveCurrentSettingsForRealm:error:].cold.2();

  v8 = objc_msgSend(a1, "retrieveSetting:forRealm:", CFSTR("com.apple.AppSSO.Kerberos.Configuration"), v6);
  if (v8)
  {
    v9 = (const void *)v8;
    v10 = (const __CFDictionary *)HeimCredCopyAttributes();
    CFDictionaryGetValue(v10, (const void *)*MEMORY[0x24BE4C348]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      CFRelease(v10);
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        SO_LOG_SOKerberosHeimdalPluginSettings();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          +[SOKerberosHeimdalPluginSettings retrieveCurrentSettingsForRealm:error:].cold.1();

      }
    }
    else
    {
      v12 = 0;
    }
    CFRelease(v9);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)retrieveAllCurrentSettings
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  __int128 v11;
  unint64_t v12;
  void *v13;
  const void *v14;
  void *v15;
  const __CFDictionary *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  __int128 v27;
  NSObject *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _QWORD v35[6];
  _QWORD v36[4];
  _QWORD v37[6];

  v37[4] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(a1, "retrieveCacheEntry");
  if (v2)
  {
    v3 = (const void *)v2;
    v4 = *MEMORY[0x24BE4C3C0];
    v5 = *MEMORY[0x24BE4C3B8];
    v36[0] = *MEMORY[0x24BE4C3D0];
    v36[1] = v5;
    v6 = *MEMORY[0x24BE4C3D8];
    v37[0] = v4;
    v37[1] = v6;
    v7 = *MEMORY[0x24BE4C340];
    v37[2] = CFSTR("com.apple.AppSSO.Kerberos.Configuration");
    v8 = *MEMORY[0x24BE4C3A8];
    v36[2] = v7;
    v36[3] = v8;
    v37[3] = HeimCredGetUUID();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v37, v36, 4);
    v9 = objc_claimAutoreleasedReturnValue();
    CFRelease(v3);
    v10 = (void *)HeimCredCopyQuery();
    if (objc_msgSend(v10, "count"))
    {
      v28 = v9;
      v29 = (id)objc_msgSend(MEMORY[0x24BDBD1A8], "mutableCopy");
      if (objc_msgSend(v10, "count"))
      {
        v12 = 0;
        v13 = 0;
        v14 = (const void *)*MEMORY[0x24BE4C348];
        *(_QWORD *)&v11 = 138412546;
        v27 = v11;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v12, v27);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (const __CFDictionary *)HeimCredCopyAttributes();
          CFDictionaryGetValue(v16, v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            CFRelease(v16);
          if (v17)
          {
            v18 = (void *)MEMORY[0x24BDD1620];
            v19 = (void *)MEMORY[0x24BDBCF20];
            v35[0] = objc_opt_class();
            v35[1] = objc_opt_class();
            v35[2] = objc_opt_class();
            v35[3] = objc_opt_class();
            v35[4] = objc_opt_class();
            v35[5] = objc_opt_class();
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 6);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setWithArray:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v13;
            objc_msgSend(v18, "unarchivedObjectOfClasses:fromData:error:", v21, v17, &v30);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v30;

            if (v22)
            {
              objc_msgSend(v29, "addObject:", v22);
            }
            else if (v23)
            {
              SO_LOG_SOKerberosHeimdalPluginSettings();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v27;
                v32 = v15;
                v33 = 2112;
                v34 = v23;
                _os_log_error_impl(&dword_215A1B000, v24, OS_LOG_TYPE_ERROR, "error with settings: %@, %@", buf, 0x16u);
              }

            }
            v13 = v23;
          }
          else
          {
            v23 = v13;
          }

          ++v12;
        }
        while (objc_msgSend(v10, "count") > v12);
      }
      else
      {
        v23 = 0;
      }
      SO_LOG_SOKerberosHeimdalPluginSettings();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        +[SOKerberosHeimdalPluginSettings retrieveAllCurrentSettings].cold.2();

      v9 = v28;
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    SO_LOG_SOKerberosHeimdalPluginSettings();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:].cold.1();
    v29 = 0;
  }

  return v29;
}

+ (BOOL)deleteSettingsForRealm:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  NSObject *v16;
  _QWORD v18[4];
  _QWORD v19[5];

  v19[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SO_LOG_SOKerberosHeimdalPluginSettings();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    +[SOKerberosHeimdalPluginSettings deleteSettingsForRealm:error:].cold.2();

  v7 = objc_msgSend(a1, "retrieveCacheEntry");
  if (v7)
  {
    v8 = (const void *)v7;
    v9 = *MEMORY[0x24BE4C3C0];
    v10 = *MEMORY[0x24BE4C3B8];
    v18[0] = *MEMORY[0x24BE4C3D0];
    v18[1] = v10;
    v11 = *MEMORY[0x24BE4C3D8];
    v19[0] = v9;
    v19[1] = v11;
    v12 = *MEMORY[0x24BE4C3B0];
    v19[2] = v5;
    v13 = *MEMORY[0x24BE4C3A8];
    v18[2] = v12;
    v18[3] = v13;
    v19[3] = HeimCredGetUUID();
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HeimCredDeleteQuery();
    CFRelease(v8);

  }
  else
  {
    SO_LOG_SOKerberosHeimdalPluginSettings();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SOKerberosHeimdalPluginSettings saveSetting:data:withError:].cold.1();

    v15 = 1;
  }

  return v15;
}

+ (void)deleteAllSettings
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "deleteAllSettings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SOKerberosHeimdalPluginSettings)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  SOKerberosHeimdalPluginSettings *v9;
  SOKerberosHeimdalPluginSettings *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSDictionary *domainRealmMapping;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSArray *hosts;
  uint64_t v30;
  NSArray *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  NSArray *kdcs;
  uint64_t v40;
  NSArray *v41;
  void *v42;
  int v43;
  void *v44;
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[4];

  v48[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSStringFromSelector(sel_realm);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsValueForKey:", v5);

  if (v6)
  {
    v7 = objc_opt_class();
    NSStringFromSelector(sel_realm);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, v8);
    v9 = (SOKerberosHeimdalPluginSettings *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = -[SOKerberosHeimdalPluginSettings initWithRealm:](self, "initWithRealm:", v9);
      if (v10)
      {
        NSStringFromSelector(sel_isDefaultRealm);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v4, "containsValueForKey:", v11);

        if (v12)
        {
          NSStringFromSelector(sel_isDefaultRealm);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v10->_defaultRealm = objc_msgSend(v4, "decodeBoolForKey:", v13);

        }
        NSStringFromSelector(sel_domainRealmMapping);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v4, "containsValueForKey:", v14);

        if (v15)
        {
          v16 = (void *)MEMORY[0x24BDBCF20];
          v48[0] = objc_opt_class();
          v48[1] = objc_opt_class();
          v48[2] = objc_opt_class();
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 3);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setWithArray:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_domainRealmMapping);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v18, v19);
          v20 = objc_claimAutoreleasedReturnValue();
          domainRealmMapping = v10->_domainRealmMapping;
          v10->_domainRealmMapping = (NSDictionary *)v20;

        }
        NSStringFromSelector(sel_hosts);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v4, "containsValueForKey:", v22);

        if (v23)
        {
          v24 = (void *)MEMORY[0x24BDBCF20];
          v47[0] = objc_opt_class();
          v47[1] = objc_opt_class();
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v47, 2);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setWithArray:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_hosts);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, v27);
          v28 = objc_claimAutoreleasedReturnValue();
          hosts = v10->_hosts;
          v10->_hosts = (NSArray *)v28;

          if (!v10->_hosts)
          {
            v30 = objc_opt_new();
            v31 = v10->_hosts;
            v10->_hosts = (NSArray *)v30;

          }
        }
        NSStringFromSelector(sel_kdcs);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v4, "containsValueForKey:", v32);

        if (v33)
        {
          v34 = (void *)MEMORY[0x24BDBCF20];
          v46[0] = objc_opt_class();
          v46[1] = objc_opt_class();
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v46, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setWithArray:", v35, v46[0]);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSelector(sel_kdcs);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v36, v37);
          v38 = objc_claimAutoreleasedReturnValue();
          kdcs = v10->_kdcs;
          v10->_kdcs = (NSArray *)v38;

          if (!v10->_kdcs)
          {
            v40 = objc_opt_new();
            v41 = v10->_kdcs;
            v10->_kdcs = (NSArray *)v40;

          }
        }
        NSStringFromSelector(sel_credentialUseMode);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v4, "containsValueForKey:", v42);

        if (v43)
        {
          NSStringFromSelector(sel_credentialUseMode);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v10->_credentialUseMode = objc_msgSend(v4, "decodeIntegerForKey:", v44);

        }
      }
      self = v10;

      v9 = self;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *realm;
  id v5;
  void *v6;
  _BOOL8 defaultRealm;
  void *v8;
  NSDictionary *domainRealmMapping;
  void *v10;
  NSArray *hosts;
  void *v12;
  NSArray *kdcs;
  void *v14;
  int64_t credentialUseMode;
  id v16;

  realm = self->_realm;
  v5 = a3;
  NSStringFromSelector(sel_realm);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", realm, v6);

  defaultRealm = self->_defaultRealm;
  NSStringFromSelector(sel_isDefaultRealm);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeBool:forKey:", defaultRealm, v8);

  domainRealmMapping = self->_domainRealmMapping;
  NSStringFromSelector(sel_domainRealmMapping);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", domainRealmMapping, v10);

  hosts = self->_hosts;
  NSStringFromSelector(sel_hosts);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", hosts, v12);

  kdcs = self->_kdcs;
  NSStringFromSelector(sel_kdcs);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", kdcs, v14);

  credentialUseMode = self->_credentialUseMode;
  NSStringFromSelector(sel_credentialUseMode);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", credentialUseMode, v16);

}

- (NSString)realm
{
  return self->_realm;
}

- (BOOL)isDefaultRealm
{
  return self->_defaultRealm;
}

- (void)setDefaultRealm:(BOOL)a3
{
  self->_defaultRealm = a3;
}

- (NSDictionary)domainRealmMapping
{
  return self->_domainRealmMapping;
}

- (void)setDomainRealmMapping:(id)a3
{
  objc_storeStrong((id *)&self->_domainRealmMapping, a3);
}

- (NSArray)hosts
{
  return self->_hosts;
}

- (void)setHosts:(id)a3
{
  objc_storeStrong((id *)&self->_hosts, a3);
}

- (NSArray)kdcs
{
  return self->_kdcs;
}

- (void)setKdcs:(id)a3
{
  objc_storeStrong((id *)&self->_kdcs, a3);
}

- (int64_t)credentialUseMode
{
  return self->_credentialUseMode;
}

- (void)setCredentialUseMode:(int64_t)a3
{
  self->_credentialUseMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kdcs, 0);
  objc_storeStrong((id *)&self->_hosts, 0);
  objc_storeStrong((id *)&self->_domainRealmMapping, 0);
  objc_storeStrong((id *)&self->_realm, 0);
}

- (void)currentCredential
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "returning currentCredential: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setCurrentCredential:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "realm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, a2, v4, "error encoding currentCredential for realm: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)siteCode
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "returning siteCode: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setSiteCode:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "realm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, a2, v4, "error encoding siteCode for realm: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)saveWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "realm");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, a2, v4, "error encoding settings for realm: %{public}@", v5);

  OUTLINED_FUNCTION_8();
}

- (void)saveSetting:data:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "settings cache entry missing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)saveSetting:(void *)a1 data:(NSObject *)a2 withError:.cold.2(void *a1, NSObject *a2)
{
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "realm");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412546;
  v6 = a1;
  v7 = 2112;
  v8 = v4;
  _os_log_debug_impl(&dword_215A1B000, a2, OS_LOG_TYPE_DEBUG, "createOrSaveSettings: %@, realm: %@", (uint8_t *)&v5, 0x16u);

}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "creating settings cache failed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "settings cache created", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "creating settings cache", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "settings cache already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)createSettingCacheEntryIfNeededWithError:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "createSettingCacheEntryIfNeededWithError", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)retrieveCacheEntry
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_0(&dword_215A1B000, v0, v1, "More than one cache entry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)createCacheEntryWithError:(uint64_t)a3 .cold.1(uint64_t *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_0(&dword_215A1B000, a2, a3, "Error creating cache entry: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

+ (void)createCacheEntryWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A1B000, v0, v1, "createCacheEntry", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)retrieveSetting:forRealm:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_215A1B000, v0, v1, "More than one entry for: %{public}@", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)retrieveCurrentSettingsForRealm:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "returning settings: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)retrieveCurrentSettingsForRealm:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "retrieveCurrentSettingsForRealm: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)retrieveAllCurrentSettings
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "retrieveAllCurrentSettings: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)deleteSettingsForRealm:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_215A1B000, v0, v1, "deleteSettingsForRealm: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
