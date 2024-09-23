@implementation IMDService

- (BOOL)groupsMergeDisplayNames
{
  return -[IMDService supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E00]);
}

- (NSDictionary)serviceProperties
{
  return self->_serviceProperties;
}

- (NSDictionary)serviceDefaultsForSetup
{
  NSDictionary *v3;
  void *v4;
  NSDictionary *v5;
  NSDictionary *cachedSetupServiceDefaults;
  NSDictionary *v7;
  NSDictionary *v8;

  if (self->_cachedSetupServiceDefaults)
  {
    v3 = 0;
  }
  else
  {
    -[IMDService serviceDomain](self, "serviceDomain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDService _serviceDefaultsForDomain:](self, "_serviceDefaultsForDomain:", v4);
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    -[NSDictionary removeObjectForKey:](v3, "removeObjectForKey:", *MEMORY[0x1E0D36E48]);
    -[NSDictionary removeObjectForKey:](v3, "removeObjectForKey:", *MEMORY[0x1E0D36E40]);
    -[NSDictionary removeObjectForKey:](v3, "removeObjectForKey:", *MEMORY[0x1E0D36E58]);
    -[NSDictionary removeObjectForKey:](v3, "removeObjectForKey:", *MEMORY[0x1E0D36EF8]);
    if (-[NSDictionary count](v3, "count"))
      v5 = v3;
    else
      v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedSetupServiceDefaults = self->_cachedSetupServiceDefaults;
    self->_cachedSetupServiceDefaults = v5;

  }
  if (self->_cachedSetupServiceDefaults)
    v7 = self->_cachedSetupServiceDefaults;
  else
    v7 = v3;
  v8 = v7;

  return v8;
}

- (NSString)internalName
{
  void *v3;
  NSString *v4;
  NSString *internalName;

  if (!-[NSString length](self->_internalName, "length"))
  {
    -[IMDService serviceProperties](self, "serviceProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D36228]);
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    internalName = self->_internalName;
    self->_internalName = v4;

  }
  return self->_internalName;
}

- (NSDictionary)defaultAccountSettings
{
  NSDictionary *accountDefaults;
  NSDictionary *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  NSDictionary *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  NSDictionary *v13;

  accountDefaults = self->_accountDefaults;
  if (!accountDefaults)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[IMDService internalName](self, "internalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("%@AccountDefaults"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSBundle pathForResource:ofType:](self->_bundle, "pathForResource:ofType:", v7, CFSTR("plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = self->_accountDefaults;
      if (v9)
      {
LABEL_9:
        v3 = v9;

        return v3;
      }
      v10 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v8);
    }
    else
    {
      v10 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    }
    v11 = self->_accountDefaults;
    self->_accountDefaults = v10;

    v9 = self->_accountDefaults;
    if (!v9)
    {
      v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      v13 = self->_accountDefaults;
      self->_accountDefaults = v12;

      v9 = self->_accountDefaults;
    }
    goto LABEL_9;
  }
  v3 = accountDefaults;
  return v3;
}

- (IMDService)initWithBundle:(id)a3
{
  id v5;
  IMDService *v6;
  IMDService *v7;
  uint64_t v8;
  NSDictionary *serviceProperties;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  IMDService *v13;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v15.receiver = self;
    v15.super_class = (Class)IMDService;
    v6 = -[IMDService init](&v15, sel_init);
    v7 = v6;
    if (v6)
    {
      objc_storeStrong((id *)&v6->_bundle, a3);
      v8 = -[IMDService _copyServicePropertiesFromIMServiceBundle:](v7, "_copyServicePropertiesFromIMServiceBundle:", v5);
      serviceProperties = v7->_serviceProperties;
      v7->_serviceProperties = (NSDictionary *)v8;

      if (IMOSLoggingEnabled(v10))
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v5;
          _os_log_impl(&dword_1D1413000, v11, OS_LOG_TYPE_INFO, "Loading internal party service with bundle: %@", buf, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addListener:", v7);

      -[IMDService synchronizeServiceDefaults](v7, "synchronizeServiceDefaults");
    }
    self = v7;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeListener:", self);

  v4.receiver = self;
  v4.super_class = (Class)IMDService;
  -[IMDService dealloc](&v4, sel_dealloc);
}

+ (void)_applyDefaultsToServiceCapabilitiesWithProperties:(id)a3
{
  id v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  IMDefaultServiceCapabilities();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v4, "mutableCopy");

  v5 = (_QWORD *)MEMORY[0x1E0D38F78];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D38F78]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addEntriesFromDictionary:", v6);

  v7 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, *v5);

  IMDefaultServiceHybridCapabilities();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = *MEMORY[0x1E0D38FA0];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D38FA0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v11);

  v12 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

}

+ (void)_applyRegionOverridesToServiceCapabilitiesWithProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D39000]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = (void *)MGGetStringAnswer();
    if (v5)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "count");
      if (v7)
      {
        if (IMOSLoggingEnabled(v7))
        {
          OSLogHandleForIMFoundationCategory();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            v16 = 138412290;
            v17 = v5;
            _os_log_impl(&dword_1D1413000, v8, OS_LOG_TYPE_INFO, "Applying capability overrides for region %@", (uint8_t *)&v16, 0xCu);
          }

        }
        v9 = (_QWORD *)MEMORY[0x1E0D38F78];
        objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D38F78]);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v10;
        v12 = (void *)MEMORY[0x1E0C9AA70];
        if (v10)
          v12 = (void *)v10;
        v13 = v12;

        v14 = (void *)objc_msgSend(v13, "mutableCopy");
        objc_msgSend(v14, "addEntriesFromDictionary:", v6);
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, *v9);

      }
    }

  }
}

- (id)_copyServicePropertiesFromIMServiceBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99D80];
  objc_msgSend(v3, "pathForResource:ofType:", CFSTR("ServiceProperties"), CFSTR("plist"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D36238]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  v9 = *MEMORY[0x1E0D361E0];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D361E0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v3, "localizedStringForKey:value:table:", v10, &stru_1E92346B0, v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v11, v9);

  }
  v12 = *MEMORY[0x1E0D36258];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D36258]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v13, &stru_1E92346B0, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v14, v12);

  v15 = *MEMORY[0x1E0D36298];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0D36298]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v16, &stru_1E92346B0, v7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKey:", v17, v15);

  +[IMDService _applyDefaultsToServiceCapabilitiesWithProperties:](IMDService, "_applyDefaultsToServiceCapabilitiesWithProperties:", v8);
  +[IMDService _applyRegionOverridesToServiceCapabilitiesWithProperties:](IMDService, "_applyRegionOverridesToServiceCapabilitiesWithProperties:", v8);

  return v8;
}

- (void)loadServiceBundle
{
  NSObject *v3;
  NSBundle *bundle;
  id *p_bundle;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  int v10;
  NSObject *v11;
  NSString *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  uint8_t buf[4];
  IMDService *v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1D16660D4((uint64_t)self);

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reallyUnloadServiceBundle, 0);
  p_bundle = (id *)&self->_bundle;
  bundle = self->_bundle;
  if (bundle && (!-[NSBundle isLoaded](bundle, "isLoaded") || !self->_sessionClass))
  {
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      sub_1D1665FEC((uint64_t)self, (id *)&self->_bundle);

    if ((objc_msgSend(*p_bundle, "isLoaded") & 1) != 0)
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v9 = *p_bundle;
      v22 = 0;
      v10 = objc_msgSend(v9, "loadAndReturnError:", &v22);
      v7 = v22;
      v8 = v10 ^ 1;
    }
    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v21 = CFSTR("YES");
      *(_DWORD *)buf = 138412802;
      v24 = self;
      v25 = 2112;
      if (v8)
        v21 = CFSTR("NO");
      v26 = v21;
      v27 = 2112;
      v28 = v7;
      _os_log_debug_impl(&dword_1D1413000, v11, OS_LOG_TYPE_DEBUG, "%@: Load success: %@    (Error: %@)", buf, 0x20u);
    }

    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D36290]);
    v12 = (NSString *)objc_claimAutoreleasedReturnValue();
    self->_sessionClass = NSClassFromString(v12);

    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      sub_1D1665F44((uint64_t)self, &self->_sessionClass);

    objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_1D1665EC0((uint64_t)self, (uint64_t *)&self->_serviceProperties, v14);

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        sub_1D1665E40((uint64_t)self, (uint64_t)v7, v15);

      +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activeAccountsForService:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "arrayByApplyingSelector:", sel_accountID);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v18, "count"))
      {
        objc_msgSend(MEMORY[0x1E0D36AA8], "registration");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          sub_1D1665DD0((uint64_t)v18, v19);

        +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "deactivateAccounts:", v18);

      }
    }

  }
}

- (void)_reallyUnloadServiceBundle
{
  NSBundle *bundle;

  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__reallyUnloadServiceBundle, 0);
  bundle = self->_bundle;
  if (bundle)
  {
    if (-[NSBundle isLoaded](bundle, "isLoaded"))
    {
      -[NSBundle unload](self->_bundle, "unload");
      self->_sessionClass = 0;
    }
  }
}

- (id)createDiscontinuedAccount
{
  id v3;
  void *v4;
  void *v5;
  IMDAccount *v6;
  void *v7;
  IMDAccount *v8;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[IMDService internalName](self, "internalName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Discontinued-%@"), v4);

  v6 = [IMDAccount alloc];
  -[IMDService defaultAccountSettings](self, "defaultAccountSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[IMDAccount initWithAccountID:defaults:service:](v6, "initWithAccountID:defaults:service:", v5, v7, self);

  return v8;
}

- (id)oldInternalName
{
  void *v2;
  void *v3;

  -[IMDService serviceProperties](self, "serviceProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36260]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_serviceDomain
{
  int64_t v2;
  id *v3;

  v2 = -[IMDService protocolVersion](self, "protocolVersion");
  v3 = (id *)MEMORY[0x1E0D36ED8];
  if (!v2)
    v3 = (id *)MEMORY[0x1E0D36D48];
  return *v3;
}

- (unsigned)idSensitivity
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  unsigned int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!self->_idSensitivity)
  {
    -[IMDService serviceProperties](self, "serviceProperties");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "valueForKey:", *MEMORY[0x1E0D36218]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_idSensitivity = objc_msgSend(v4, "intValue");

    if (-[IMDService handleIDInsensitivityIsCarrierBased](self, "handleIDInsensitivityIsCarrierBased"))
    {
      objc_msgSend(MEMORY[0x1E0D39730], "IMPhoneNumbersEnabledForMultipleSubscriptionDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (!v6)
        goto LABEL_14;
      v7 = v6;
      v8 = *(_QWORD *)v14;
      LOBYTE(v9) = 1;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          if ((v9 & 1) != 0)
            v9 = objc_msgSend(MEMORY[0x1E0D39730], "SMSAllowCaseSensitiveSenderIDForPhoneNumber:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
          else
            v9 = 0;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
      if (!v9)
        v11 = 1;
      else
LABEL_14:
        v11 = 0;
      self->_idSensitivity = v11;

    }
  }
  return self->_idSensitivity;
}

- (unint64_t)caseInsensitivityByHandleType
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[IMDService serviceProperties](self, "serviceProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D38F90]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (int)objc_msgSend(v3, "intValue");

  return v4;
}

- (NSString)serviceDomain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMDService _serviceDomain](self, "_serviceDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDService internalName](self, "internalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)_oldServiceDomain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[IMDService _serviceDomain](self, "_serviceDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMDService oldInternalName](self, "oldInternalName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (Class)sessionClass
{
  Class sessionClass;

  if (self->_bundle)
  {
    sessionClass = self->_sessionClass;
    if (sessionClass)
      return sessionClass;
    -[IMDService loadServiceBundle](self, "loadServiceBundle");
  }
  sessionClass = self->_sessionClass;
  if (!sessionClass)
    sessionClass = -[NSBundle principalClass](self->_bundle, "principalClass");
  return sessionClass;
}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isIDSBased
{
  void *v2;
  void *v3;
  char v4;

  -[IMDService serviceProperties](self, "serviceProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D36210]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)handleIDInsensitivityIsCarrierBased
{
  void *v2;
  void *v3;
  char v4;

  -[IMDService serviceProperties](self, "serviceProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D38F98]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)isDiscontinued
{
  void *v2;
  void *v3;
  char v4;

  -[IMDService serviceProperties](self, "serviceProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D38F88]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (BOOL)demandsBroadcasting
{
  void *v2;
  void *v3;
  char v4;

  -[IMDService serviceProperties](self, "serviceProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *MEMORY[0x1E0D38F80]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

- (id)_defaultDefaults
{
  NSDictionary *serviceDefaults;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSDictionary *v11;
  NSDictionary *v12;

  serviceDefaults = self->_serviceDefaults;
  if (!serviceDefaults)
  {
    v4 = (void *)MEMORY[0x1D17EA968]();
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    -[IMDService internalName](self, "internalName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@Defaults"), v6);

    -[NSBundle pathForResource:ofType:](self->_bundle, "pathForResource:ofType:", v7, CFSTR("plist"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "fileExistsAtPath:", v8),
          v9,
          v10))
    {
      v11 = (NSDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v8);
    }
    else
    {
      v11 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
    }
    v12 = self->_serviceDefaults;
    self->_serviceDefaults = v11;

    objc_autoreleasePoolPop(v4);
    serviceDefaults = self->_serviceDefaults;
  }
  return serviceDefaults;
}

- (id)_serviceDefaultsForDomain:(id)a3
{
  __CFString *v4;
  id v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFArray *v10;
  const __CFArray *v11;
  CFDictionaryRef v12;
  const __CFString *v13;
  const __CFArray *v14;
  CFDictionaryRef v15;

  v4 = (__CFString *)a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = (void *)MEMORY[0x1D17EA968]();
  -[IMDService _defaultDefaults](self, "_defaultDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v5, "addEntriesFromDictionary:", v7);
  v8 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v9 = (const __CFString *)*MEMORY[0x1E0C9B230];
  v10 = CFPreferencesCopyKeyList(v4, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  v11 = v10;
  if (v10)
  {
    v12 = CFPreferencesCopyMultiple(v10, v4, v8, v9);
    if (-[__CFDictionary count](v12, "count"))
      objc_msgSend(v5, "addEntriesFromDictionary:", v12);

  }
  v13 = (const __CFString *)*MEMORY[0x1E0C9B250];
  v14 = CFPreferencesCopyKeyList(v4, v8, (CFStringRef)*MEMORY[0x1E0C9B250]);

  if (v14)
  {
    v15 = CFPreferencesCopyMultiple(v14, v4, v8, v13);
    if (-[__CFDictionary count](v15, "count"))
      objc_msgSend(v5, "addEntriesFromDictionary:", v15);

  }
  objc_autoreleasePoolPop(v6);

  return v5;
}

- (NSDictionary)serviceDefaults
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSDictionary *v7;
  NSDictionary *cachedServiceDefaults;
  NSDictionary *v9;
  NSDictionary *v10;

  if (self->_cachedServiceDefaults)
  {
    v3 = 0;
  }
  else
  {
    -[IMDService serviceDomain](self, "serviceDomain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMDService _serviceDefaultsForDomain:](self, "_serviceDefaultsForDomain:", v4);
    v3 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    if (!-[NSDictionary count](v3, "count"))
    {
      -[IMDService _oldServiceDomain](self, "_oldServiceDomain");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMDService _serviceDefaultsForDomain:](self, "_serviceDefaultsForDomain:", v5);
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (NSDictionary *)v6;
    }
    if (-[NSDictionary count](v3, "count"))
      v7 = v3;
    else
      v7 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cachedServiceDefaults = self->_cachedServiceDefaults;
    self->_cachedServiceDefaults = v7;

  }
  if (self->_cachedServiceDefaults)
    v9 = self->_cachedServiceDefaults;
  else
    v9 = v3;
  v10 = v9;

  return v10;
}

- (BOOL)clearOneTimeImportAccounts
{
  BOOL v2;
  const __CFString *v3;
  const __CFString *v4;
  void *v5;
  const __CFString *v6;

  if (self->_blockPrefWriting)
    return 0;
  v3 = -[IMDService serviceDomain](self, "serviceDomain");
  v4 = (const __CFString *)*MEMORY[0x1E0D36E50];
  v5 = (void *)CFPreferencesCopyAppValue((CFStringRef)*MEMORY[0x1E0D36E50], v3);
  v2 = v5 != 0;
  if (v5)
  {
    CFPreferencesSetAppValue(v4, 0, v3);
    v6 = (const __CFString *)*MEMORY[0x1E0C9B260];
    CFPreferencesSynchronize(v3, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
    CFPreferencesSynchronize(v3, v6, (CFStringRef)*MEMORY[0x1E0C9B230]);
    _CFPreferencesFlushCachesForIdentifier();
  }

  return v2;
}

- (void)delayedSaveSettings
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_saveSettings, 0);
  if (!self->_blockPrefWriting)
    -[IMDService performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_saveSettings, 0, 5.0);
}

- (void)saveSettings
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  const __CFString *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  int v37;
  const __CFString *v38;
  const __CFString *v39;
  const __CFString *v40;
  const __CFString *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id value;
  IMDService *v47;
  void *context;
  uint64_t v49;
  id v50;
  uint64_t v51;
  void *v52;
  id obj;
  id obja;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_saveSettings, 0);
  if (!self->_blockPrefWriting)
  {
    context = (void *)MEMORY[0x1D17EA968](v3);
    v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    value = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = self;
    objc_msgSend(v4, "accountsForService:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v5;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v60;
      v49 = *(_QWORD *)v60;
      do
      {
        v9 = 0;
        v51 = v7;
        do
        {
          if (*(_QWORD *)v60 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v9);
          v11 = objc_msgSend(v10, "isManaged");
          objc_msgSend(v10, "accountDefaults");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = (void *)objc_msgSend(v12, "mutableCopy");

          objc_msgSend(v10, "accountID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v11 & 1) == 0 && v13)
          {
            v57 = 0u;
            v58 = 0u;
            v55 = 0u;
            v56 = 0u;
            objc_msgSend(v13, "allKeys");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
            if (v16)
            {
              v17 = v16;
              v18 = *(_QWORD *)v56;
              do
              {
                for (i = 0; i != v17; ++i)
                {
                  if (*(_QWORD *)v56 != v18)
                    objc_enumerationMutation(v15);
                  v20 = *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * i);
                  objc_msgSend(v13, "objectForKey:", v20);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v21, "isNull") & 1) != 0
                    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && !objc_msgSend(v21, "length"))
                  {
                    objc_msgSend(v13, "removeObjectForKey:", v20);
                  }

                }
                v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v55, v63, 16);
              }
              while (v17);
            }

            objc_msgSend(v50, "setObject:forKey:", v13, v14);
            v8 = v49;
            v7 = v51;
          }

          ++v9;
        }
        while (v9 != v7);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v64, 16);
      }
      while (v7);
    }

    +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activeAccountsForService:", v47);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = -[IMDService serviceDomain](v47, "serviceDomain");
    v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (v23)
      objc_msgSend(v23, "arrayByApplyingSelector:", sel_accountID);
    else
      objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v26, *MEMORY[0x1E0D36E58]);

    if (!-[IMDService isIDSBased](v47, "isIDSBased"))
      objc_msgSend(v25, "setObject:forKey:", v50, *MEMORY[0x1E0D36E48]);
    +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "connectedAccountsForService:", v47);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[IMDAccountController sharedAccountController](IMDAccountController, "sharedAccountController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "connectingAccountsForService:", v47);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v28, "count"))
      objc_msgSend(v31, "addObjectsFromArray:", v28);
    if (objc_msgSend(v30, "count"))
      objc_msgSend(v31, "addObjectsFromArray:", v30);
    v52 = v28;
    obja = v23;
    objc_msgSend(v31, "arrayByApplyingSelector:", sel_accountID);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setObject:forKey:", v32, *MEMORY[0x1E0D36EF8]);

    v33 = *MEMORY[0x1E0D361A8];
    -[NSDictionary objectForKey:](v47->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D361A8]);
    v34 = objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      v35 = (void *)v34;
      -[NSDictionary objectForKey:](v47->_serviceProperties, "objectForKey:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "intValue");

      v38 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v39 = (const __CFString *)*MEMORY[0x1E0C9B250];
      v40 = (const __CFString *)*MEMORY[0x1E0C9B230];
      v41 = (const __CFString *)*MEMORY[0x1E0C9B250];
      if (v37)
      {
LABEL_37:
        CFPreferencesSetMultiple((CFDictionaryRef)v25, 0, v24, v38, v41);
        v42 = *MEMORY[0x1E0D36E40];
        CFPreferencesSetValue((CFStringRef)*MEMORY[0x1E0D36E40], value, v24, v38, v39);
        CFPreferencesSynchronize(v24, v38, v39);
        CFPreferencesSynchronize(v24, v38, v40);
        objc_msgSend(v25, "setObject:forKey:", value, v42);
        +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "broadcasterForListenersSupportingService:", v47);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        -[IMDService internalName](v47, "internalName");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "defaultsChanged:forService:", v25, v45);

        -[IMDService purgeMemoryCaches](v47, "purgeMemoryCaches");
        objc_autoreleasePoolPop(context);
        return;
      }
    }
    else
    {
      v38 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v39 = (const __CFString *)*MEMORY[0x1E0C9B250];
      v40 = (const __CFString *)*MEMORY[0x1E0C9B230];
    }
    v41 = v40;
    goto LABEL_37;
  }
}

- (id)newAccountWithAccountDefaults:(id)a3 accountID:(id)a4
{
  id v6;
  id v7;
  IMDAccount *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[IMDAccount initWithAccountID:defaults:service:]([IMDAccount alloc], "initWithAccountID:defaults:service:", v6, v7, self);

  return v8;
}

- (id)_supportedCapabilities
{
  void *v2;
  id v3;

  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D38F78]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (BOOL)supportsCapability:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[IMDService _supportedCapabilities](self, "_supportedCapabilities");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = objc_msgSend(v6, "BOOLValue");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)disallowDeactivation
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D361F8];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D361F8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)supportsDatabase
{
  return -[IMDService supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38DB8]);
}

- (BOOL)supportsRegistration
{
  return -[IMDService supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E78]);
}

- (BOOL)supportsRelay
{
  return -[IMDService supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E80]);
}

- (BOOL)supportsAuthorization
{
  return -[IMDService supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38D98]);
}

- (BOOL)ignoresNetworkConnectivity
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D36220];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D36220]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)wantsNullHostReachability
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D362C0];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D362C0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldCreateActiveAccounts
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D361D0];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D361D0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldForceAccountsActive
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D36198];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D36198]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldForceAccountsConnected
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D361A0];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D361A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)needsLogin
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D36240];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D36240]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)needsPassword
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D36268];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D36268]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)shouldBeAlwaysLoggedIn
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D361A0];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D361A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)requiresHost
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D36280];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D36280]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)chatsIgnoreLoginStatus
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D36EB8];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D36EB8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)supportsOneSessionForAllAccounts
{
  return -[IMDService supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E58]);
}

- (int64_t)protocolVersion
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = *MEMORY[0x1E0D36270];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D36270]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)requiresSingleAccount
{
  uint64_t v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = *MEMORY[0x1E0D362A8];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D362A8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue") != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)replicationSourceID
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = *MEMORY[0x1E0D38FD8];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D38FD8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v5, "intValue");

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)replicationSourceIDForSending
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  int64_t v7;

  v3 = *MEMORY[0x1E0D38FE0];
  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", *MEMORY[0x1E0D38FE0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "intValue");
    if (v6)
      v7 = v6;
    else
      v7 = -[IMDService replicationSourceID](self, "replicationSourceID");

  }
  else
  {
    v7 = -[IMDService replicationSourceID](self, "replicationSourceID");
  }

  return v7;
}

- (NSArray)replicationServices
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isReplicationEnabled");

  if (v4)
  {
    -[IMDService serviceProperties](self, "serviceProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D38FD0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
          +[IMDServiceController sharedController](IMDServiceController, "sharedController", (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "serviceWithName:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
            objc_msgSend(v7, "addObject:", v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = (id)MEMORY[0x1E0C9AA60];
  }
  return (NSArray *)v7;
}

- (int64_t)transcodeTarget
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", CFSTR("TranscodeTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[NSDictionary objectForKey:](self->_serviceProperties, "objectForKey:", CFSTR("TranscodeTarget"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (int)objc_msgSend(v4, "intValue");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)relayMessageDelegates
{
  void *v2;
  void *v3;

  -[IMDService serviceProperties](self, "serviceProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D38FC8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)purgeMemoryCaches
{
  NSDictionary *cachedServiceDefaults;
  NSDictionary *cachedSetupServiceDefaults;

  cachedServiceDefaults = self->_cachedServiceDefaults;
  self->_cachedServiceDefaults = 0;

  cachedSetupServiceDefaults = self->_cachedSetupServiceDefaults;
  self->_cachedSetupServiceDefaults = 0;

}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[IMDService internalName](self, "internalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("IMDService (%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)systemDidStartBackup
{
  self->_blockPrefWriting = 1;
}

- (BOOL)supportsMutatingGroupMembers
{
  return -[IMDService supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E40]);
}

- (NSBundle)bundle
{
  return self->_bundle;
}

- (void)setServiceProperties:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedSetupServiceDefaults, 0);
  objc_storeStrong((id *)&self->_cachedServiceDefaults, 0);
  objc_storeStrong((id *)&self->_serviceProperties, 0);
  objc_storeStrong((id *)&self->_serviceDefaults, 0);
  objc_storeStrong((id *)&self->_accountDefaults, 0);
  objc_storeStrong((id *)&self->_internalName, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
