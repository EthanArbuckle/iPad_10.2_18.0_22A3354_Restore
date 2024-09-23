@implementation IMServiceImpl

- (BOOL)groupsMergeDisplayNames
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E00]);
}

- (NSString)name
{
  return self->_name;
}

+ (id)serviceWithInternalName:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v11;
  void *v12;
  uint64_t *v13;
  id v14;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    if (!qword_1ECF124F8)
    {
      v5 = a1;
      objc_sync_enter(v5);
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v7 = (void *)qword_1ECF124F8;
      qword_1ECF124F8 = (uint64_t)v6;

      objc_sync_exit(v5);
    }
    if (qword_1ECF124E8 && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F68]))
    {
      v8 = (void *)qword_1ECF124E8;
LABEL_23:
      v9 = v8;
      goto LABEL_24;
    }
    if (qword_1ECF123C0 && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F70]))
    {
      v8 = (void *)qword_1ECF123C0;
      goto LABEL_23;
    }
    if (qword_1ECF123B8 && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F60]))
    {
      v8 = (void *)qword_1ECF123B8;
      goto LABEL_23;
    }
    if (qword_1ECF124F0 && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F58]))
    {
      v8 = (void *)qword_1ECF124F0;
      goto LABEL_23;
    }
    if (qword_1ECF124E0 && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F40]))
    {
      v8 = (void *)qword_1ECF124E0;
      goto LABEL_23;
    }
    if (qword_1ECF123B0 && objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F50]))
    {
      v8 = (void *)qword_1ECF123B0;
      goto LABEL_23;
    }
    v11 = a1;
    objc_sync_enter(v11);
    objc_msgSend((id)qword_1ECF124F8, "objectForKey:", v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v11);

    if (v12)
    {
LABEL_41:
      v9 = v12;

      goto LABEL_24;
    }
    v12 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v11, "serviceClass")), "initWithName:", v4);
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F40]) & 1) != 0)
    {
      v13 = &qword_1ECF124E0;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F68]) & 1) != 0)
    {
      v13 = &qword_1ECF124E8;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F70]) & 1) != 0)
    {
      v13 = &qword_1ECF123C0;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F60]) & 1) != 0)
    {
      v13 = &qword_1ECF123B8;
    }
    else if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F58]) & 1) != 0)
    {
      v13 = &qword_1ECF124F0;
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D38F50]))
        goto LABEL_39;
      v13 = &qword_1ECF123B0;
    }
    objc_storeStrong((id *)v13, v12);
LABEL_39:
    if (v12)
    {
      v14 = v11;
      objc_sync_enter(v14);
      objc_msgSend((id)qword_1ECF124F8, "setObject:forKey:", v12, v4);
      objc_sync_exit(v14);

    }
    goto LABEL_41;
  }
  v9 = 0;
LABEL_24:

  return v9;
}

- (BOOL)supportsRegistration
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E78]);
}

- (BOOL)supportsAuthorization
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38D98]);
}

- (void)statusChangedForAccount:(id)a3 from:(unint64_t)a4 to:(unint64_t)a5
{
  int v5;
  int v6;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v5 = a5;
  v6 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = 138412802;
      v12 = v8;
      v13 = 1024;
      v14 = v6;
      v15 = 1024;
      v16 = v5;
      _os_log_impl(&dword_1A1FF4000, v9, OS_LOG_TYPE_INFO, "Status changed for account: %@             from: %d to: %d", (uint8_t *)&v11, 0x18u);
    }

  }
  -[IMServiceImpl _calculateBestAccount](self, "_calculateBestAccount");
  +[IMServiceAgent notificationCenter](IMServiceAgent, "notificationCenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "__mainThreadPostNotificationName:object:", CFSTR("__kIMServiceStatusChangedNotification"), self);

}

- (BOOL)shouldDisableDeactivation
{
  return self->_shouldDisableDeactivation;
}

- (void)setServiceProperties:(id)a3
{
  NSDictionary *v5;
  NSDictionary *serviceProps;
  NSObject *v7;
  NSString *v8;
  NSString *localizedName;
  NSString *v10;
  NSString *localizedShortName;
  NSArray *v12;
  NSArray *siblingServiceNames;
  NSArray *v14;
  NSArray *emailDomains;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *countryCode;
  int v23;
  IMServiceImpl *v24;
  __int16 v25;
  NSDictionary *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (NSDictionary *)a3;
  serviceProps = self->_serviceProps;
  if (serviceProps != v5 && -[NSDictionary count](serviceProps, "count") <= 2)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v23 = 138412546;
        v24 = self;
        v25 = 2112;
        v26 = v5;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "Service: %@  set properties: %@", (uint8_t *)&v23, 0x16u);
      }

    }
    objc_storeStrong((id *)&self->_serviceProps, a3);
    -[NSDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0D36258]);
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedName = self->_localizedName;
    self->_localizedName = v8;

    -[NSDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0D36298]);
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    localizedShortName = self->_localizedShortName;
    self->_localizedShortName = v10;

    -[NSDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0D362A0]);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    siblingServiceNames = self->_siblingServiceNames;
    self->_siblingServiceNames = v12;

    -[NSDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0D36200]);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    emailDomains = self->_emailDomains;
    self->_emailDomains = v14;

    -[NSDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0D36218]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_screenNameSensitivity = objc_msgSend(v16, "intValue");

    -[NSDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0D38F98]);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    self->_handleIDInsensitivityIsCarrierBased = objc_msgSend(v17, "BOOLValue");

    -[NSDictionary objectForKey:](v5, "objectForKey:", *MEMORY[0x1E0D38F90]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    self->_caseInsensitivityByHandleType = (int)objc_msgSend(v18, "intValue");

    -[IMServiceImpl _loadPropertiesIfNeeded](self, "_loadPropertiesIfNeeded");
    if (-[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E60]) && !self->_countryCode)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKey:", *MEMORY[0x1E0C997B0]);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lowercaseString");
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      countryCode = self->_countryCode;
      self->_countryCode = v21;

    }
  }

}

- (void)setServiceDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_serviceDefaults, a3);
}

- (void)setDefaultAccountSettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultAccountSettings, a3);
}

- (void)setCountryCode:(id)a3
{
  objc_storeStrong((id *)&self->_countryCode, a3);
}

- (NSDictionary)serviceProperties
{
  return self->_serviceProps;
}

- (BOOL)isPersistent
{
  return self->_isPersistent;
}

- (IMServiceImpl)initWithName:(id)a3
{
  id v5;
  IMServiceImpl *v6;
  uint64_t *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IMServiceImpl;
  v6 = -[IMServiceImpl init](&v9, sel_init);
  if (v6)
  {
    if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F40]) & 1) != 0)
    {
      v7 = &qword_1ECF124E0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F68]) & 1) != 0)
    {
      v7 = &qword_1ECF124E8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F70]) & 1) != 0)
    {
      v7 = &qword_1ECF123C0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F60]) & 1) != 0)
    {
      v7 = &qword_1ECF123B8;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F58]) & 1) != 0)
    {
      v7 = &qword_1ECF124F0;
    }
    else
    {
      if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D38F50]))
      {
LABEL_15:
        objc_storeStrong((id *)&v6->_name, a3);
        goto LABEL_16;
      }
      v7 = &qword_1ECF123B0;
    }
    objc_storeStrong((id *)v7, v6);
    goto LABEL_15;
  }
LABEL_16:

  return v6;
}

- (BOOL)allowsMultipleConnections
{
  return self->_allowsMultipleConnections;
}

- (void)_loadPropertiesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!self->_hasLoadedServiceProperties)
  {
    self->_hasLoadedServiceProperties = 1;
    -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D36208]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_handlesChatInvites = (int)objc_msgSend(v3, "intValue") > 0;

    -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D361A8]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isPersistent = (int)objc_msgSend(v4, "intValue") > 0;

    -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D36230]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isPlugInService = (int)objc_msgSend(v5, "intValue") > 0;

    -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D36190]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_allowsMultipleConnections = (int)objc_msgSend(v6, "intValue") > 0;

    -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D362C8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shouldInternationalizeNumbers = (int)objc_msgSend(v7, "intValue") > 0;

    -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D361F8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shouldDisableDeactivation = (int)objc_msgSend(v8, "intValue") > 0;

    -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D36220]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_ignoresNetworkConnectivity = (int)objc_msgSend(v9, "intValue") > 0;

    -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D38F88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    self->_isDiscontinued = (int)objc_msgSend(v10, "intValue") > 0;

    -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D38FE8]);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    self->_shouldReuseTypingIndicatorGUID = (int)objc_msgSend(v11, "intValue") > 0;

  }
}

- (void)_calculateBestAccount
{
  void *v3;
  IMServiceImpl *v4;
  NSObject *v5;
  IMAccount *v6;
  IMAccount *bestAccount;
  NSObject *v8;
  IMAccount *v9;
  int v10;
  IMServiceImpl *v11;
  __int16 v12;
  IMAccount *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccountsForService:", self);
  v4 = (IMServiceImpl *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = 138412290;
      v11 = v4;
      _os_log_impl(&dword_1A1FF4000, v5, OS_LOG_TYPE_INFO, "Accounts: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  +[IMAccountController bestAccountFromAccounts:](IMAccountController, "bestAccountFromAccounts:", v4);
  v6 = (IMAccount *)objc_claimAutoreleasedReturnValue();
  bestAccount = self->_bestAccount;
  self->_bestAccount = v6;

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = self->_bestAccount;
      v10 = 138412546;
      v11 = self;
      v12 = 2112;
      v13 = v9;
      _os_log_impl(&dword_1A1FF4000, v8, OS_LOG_TYPE_INFO, "Recalculated best account for %@: %@", (uint8_t *)&v10, 0x16u);
    }

  }
}

+ (BOOL)smsEnabled
{
  void *v2;
  char v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsSMS");

  if ((v3 & 1) != 0)
    return 1;
  v5 = (void *)qword_1ECF122C0;
  if (!qword_1ECF122C0)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService smsService](IMServiceImpl, "smsService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bestAccountForService:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)qword_1ECF122C0;
    qword_1ECF122C0 = v8;

    v5 = (void *)qword_1ECF122C0;
  }
  return objc_msgSend(v5, "allowsSMSRelay");
}

+ (Class)serviceClass
{
  if (qword_1EE65F418)
    return (Class)(id)qword_1EE65F418;
  objc_opt_class();
  return (Class)(id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)iMessageEnabled
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t j;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (IMIsRunningInIDSAccountCapableClient())
  {
    if (qword_1ECF12308 != -1)
      dispatch_once(&qword_1ECF12308, &unk_1E471D498);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend((id)qword_1ECF12300, "accounts");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v3)
    {
      v4 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v3; ++i)
        {
          if (*(_QWORD *)v17 != v4)
            objc_enumerationMutation(v2);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "canSend") & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_25;
          }
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
        if (v3)
          continue;
        break;
      }
    }
  }
  else
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService iMessageService](IMServiceImpl, "iMessageService");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountsForService:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = v8;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
    if (v3)
    {
      v9 = *(_QWORD *)v13;
      while (2)
      {
        for (j = 0; j != v3; ++j)
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v2);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * j), "_isUsableForSending", (_QWORD)v12) & 1) != 0)
          {
            LOBYTE(v3) = 1;
            goto LABEL_24;
          }
        }
        v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v20, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_24:

  }
LABEL_25:

  return v3;
}

+ (id)allServicesNonBlocking
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "connectToDaemonWithLaunch:", 0);

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)setServiceClass:(Class)a3
{
  qword_1EE65F418 = (uint64_t)a3;
}

+ (id)allServices
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blockUntilConnected");

  +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "listener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)serviceWithName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "blockUntilConnected");

    +[IMDaemonController sharedInstance](IMDaemonController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "listener");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "serviceWithName:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)activeServices
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "allServicesNonBlocking", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "activeAccountsForService:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)connectedServices
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "allServicesNonBlocking", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v8);
        +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "connectedAccountsForService:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "count");

        if (v12)
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)servicesWithCapability:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsWithCapability:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "service");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "service");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)connectedServicesWithCapability:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "connectedAccountsWithCapability:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "service");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "service");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)operationalServicesWithCapability:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "operationalAccountsWithCapability:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "service");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          objc_msgSend(v11, "service");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(v4, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)servicesWithCapabilityName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(a1, "allServices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = sub_1A203E254;
  v9[3] = &unk_1E471E9A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, 0, 0);

  v4.receiver = self;
  v4.super_class = (Class)IMServiceImpl;
  -[IMServiceImpl dealloc](&v4, sel_dealloc);
}

- (BOOL)initialSyncPerformed
{
  return 1;
}

- (void)doneSetup
{
  id v3;

  -[IMServiceImpl activeAccountsChanged:](self, "activeAccountsChanged:", 0);
  -[IMServiceImpl _syncWithRemoteBuddies](self, "_syncWithRemoteBuddies");
  +[IMServiceAgent notificationCenter](IMServiceAgent, "notificationCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__mainThreadPostNotificationName:object:", CFSTR("__kIMServiceStatusChangedNotification"), self);

}

- (void)disconnect
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  IMAccount *bestAccount;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      -[IMServiceImpl internalName](self, "internalName");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1A1FF4000, v3, OS_LOG_TYPE_INFO, "Service(%@): Disconnecting from agent", buf, 0xCu);

    }
  }
  if (-[IMServiceImpl status](self, "status") >= 3)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountsForService:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9++), "setIMAccountLoginStatus:", 2);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  v10 = -[IMServiceImpl status](self, "status");
  bestAccount = self->_bestAccount;
  self->_bestAccount = 0;

  -[IMServiceImpl statusChangedForAccount:from:to:](self, "statusChangedForAccount:from:to:", 0, v10, 1);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "__mainThreadPostNotificationName:object:", CFSTR("ServiceDidDisconnect"), self);

}

- (BOOL)equalID:(id)a3 andID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 == v7)
  {
    v9 = 1;
  }
  else
  {
    v9 = 0;
    if (v6 && v7)
    {
      -[IMServiceImpl canonicalFormOfID:](self, "canonicalFormOfID:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMServiceImpl canonicalFormOfID:](self, "canonicalFormOfID:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "isEqualToString:", v11);

    }
  }

  return v9;
}

- (id)normalizedFormOfID:(id)a3
{
  return a3;
}

- (id)canonicalFormOfID:(id)a3
{
  return (id)IMCanonicalFormOfIDWithSensitivity();
}

- (int64_t)compareNames:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  -[IMServiceImpl name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "localizedCompareToString:", v6);
  return v7;
}

- (void)_blockUntilInitialSyncPerformed
{
  uint64_t v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  IMServiceImpl *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!-[IMServiceImpl initialSyncPerformed](self, "initialSyncPerformed"))
  {
    objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc_init(MEMORY[0x1E0C99D68]);
    v3 = *MEMORY[0x1E0D36790];
    do
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.005, v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "runMode:beforeDate:", v3, v4);

      if (-[IMServiceImpl initialSyncPerformed](self, "initialSyncPerformed"))
        break;
      objc_msgSend(v13, "timeIntervalSinceNow");
    }
    while (v5 > -1.0);
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activeAccountsForService:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          if ((objc_msgSend(v11, "hasSyncedWithRemoteBuddies") & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v12 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v20 = self;
                _os_log_impl(&dword_1A1FF4000, v12, OS_LOG_TYPE_INFO, "   *** Account %@  has not sync'd yet, forcing the mark", buf, 0xCu);
              }

            }
            objc_msgSend(v11, "_markHasSyncedWithRemoteBuddies");
          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v8);
    }

  }
}

- (unint64_t)status
{
  IMAccount *bestAccount;

  bestAccount = self->_bestAccount;
  if (bestAccount)
    return -[IMAccount loginStatus](bestAccount, "loginStatus");
  else
    return 1;
}

- (id)infoForScreenName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[IMServiceImpl _blockUntilInitialSyncPerformed](self, "_blockUntilInitialSyncPerformed");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountsForService:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "existingIMHandleWithID:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bestAccountSibling");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v11, "publicAPIPropertiesDictionary");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_11;
        }
      }
      v7 = (void *)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)infoForAllScreenNames
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[IMServiceImpl _blockUntilInitialSyncPerformed](self, "_blockUntilInitialSyncPerformed");
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountsForService:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0C99D20]);
        objc_msgSend(v10, "arrayOfAllIMHandles");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

        if (objc_msgSend(v13, "count"))
          objc_msgSend(v3, "addObjectsFromArray:", v13);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v7);
  }

  +[IMHandle filterIMHandlesForBestAccountSiblings:](IMHandle, "filterIMHandlesForBestAccountSiblings:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "arrayByApplyingSelector:", sel_publicAPIPropertiesDictionary);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)infoForPreferredScreenNames
{
  return 0;
}

- (id)myScreenNames
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccountsForService:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "login", (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (BOOL)supportsCapability:(id)a3
{
  NSDictionary *serviceProps;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  serviceProps = self->_serviceProps;
  v4 = *MEMORY[0x1E0D38F78];
  v5 = a3;
  -[NSDictionary objectForKey:](serviceProps, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = (int)objc_msgSend(v7, "intValue") > 0;
  return (char)v5;
}

- (BOOL)supportsReplicationCapability:(id)a3
{
  NSDictionary *serviceProps;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  serviceProps = self->_serviceProps;
  v4 = *MEMORY[0x1E0D38FA0];
  v5 = a3;
  -[NSDictionary objectForKey:](serviceProps, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = (int)objc_msgSend(v7, "intValue") > 0;
  return (char)v5;
}

- (BOOL)supportsGroupAttachments
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38DE8]);
}

- (BOOL)supportsDatabaseStorage
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38DB8]);
}

- (BOOL)supportsMutatingGroupMembers
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E40]);
}

- (BOOL)supportsOneSessionForAllAccounts
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E58]);
}

- (BOOL)supportsPhoneNumberMapping
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E60]);
}

- (BOOL)supportsIDStatusLookup
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E08]);
}

- (BOOL)supportsAudioMessages
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38D90]);
}

- (BOOL)supportsOfflineTransfers
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E50]);
}

- (BOOL)supportsTypingIndicators
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38EC8]);
}

- (BOOL)supportsMessaging
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E30]);
}

- (BOOL)supportsCanonicalHandles
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38DA0]);
}

- (BOOL)supportsCrossAccountIDSMessaging
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38DA8]);
}

- (BOOL)supportsStickers
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38EB8]);
}

- (BOOL)supportsForwardingAudioMessages
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38D88]);
}

- (BOOL)supportsShowingSatelliteMessageDownloadCount
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38EA8]);
}

- (BOOL)supportsRelay
{
  return -[IMServiceImpl supportsCapability:](self, "supportsCapability:", *MEMORY[0x1E0D38E80]);
}

- (BOOL)supportsReplication
{
  void *v2;
  BOOL v3;

  -[NSDictionary objectForKeyedSubscript:](self->_serviceProps, "objectForKeyedSubscript:", *MEMORY[0x1E0D38FD8]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_sorting
{
  void *v2;
  void *v3;

  -[IMServiceImpl serviceProps](self, "serviceProps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D38FF0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)serviceForSendingPriority
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMServiceImpl _sorting](self, "_sorting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D39010]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (int64_t)chatResolutionPriority
{
  void *v2;
  void *v3;
  int64_t v4;

  -[IMServiceImpl _sorting](self, "_sorting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0D39008]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "integerValue");
  return v4;
}

- (id)idsServiceNames
{
  return -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D38FA8]);
}

+ (BOOL)mmsEnabledforPhoneNumber:(id)a3 simID:(id)a4
{
  return MEMORY[0x1E0DE7D20](MEMORY[0x1E0D39730], sel_IMMMSEnabledForPhoneNumber_simID_);
}

+ (BOOL)hasAlias:(id)a3 onAccountForService:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  int v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "accountsForService:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (MEMORY[0x1A858280C](v5))
        {
          IMCanonicalizeFormattedString();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v14 = 0;
        }
        objc_msgSend(v13, "aliases", (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v15, "containsObject:", v14) & 1) != 0)
        {
          v16 = objc_msgSend(v13, "_isUsableForSending");

          if ((v16 & 1) != 0)
            goto LABEL_20;
        }
        else
        {
          objc_msgSend(v13, "aliases");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v17, "containsObject:", v5) & 1) != 0)
          {
            v18 = objc_msgSend(v13, "_isUsableForSending");

            if (v18)
            {

LABEL_20:
              LOBYTE(v10) = 1;
              goto LABEL_21;
            }
          }
          else
          {

          }
        }
      }
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v10)
        continue;
      break;
    }
  }
LABEL_21:

  return v10;
}

+ (BOOL)iMessageEnabledForSenderLastAddressedHandle:(id)a3 simID:(id)a4
{
  return +[IMServiceImpl iMessageEnabledForSenderLastAddressedHandle:simID:previousService:](IMServiceImpl, "iMessageEnabledForSenderLastAddressedHandle:simID:previousService:", a3, a4, 0);
}

+ (id)_phoneNumberOnSubscriptionWithSIMID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0D39738];
  v4 = a3;
  objc_msgSend(v3, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ctSubscriptionInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__im_subscriptionContextForForSimID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)_isSIMIdIDSRegisteredSIM:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  const __CFString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registeredSIMIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v5;
  v7 = 0;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v7 |= objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10++), (_QWORD)v14);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v24, 16);
    }
    while (v8);
  }

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("NO");
      *(_DWORD *)buf = 138412802;
      v19 = v3;
      v20 = 2112;
      if ((v7 & 1) != 0)
        v12 = CFSTR("YES");
      v21 = v6;
      v22 = 2112;
      v23 = v12;
      _os_log_impl(&dword_1A1FF4000, v11, OS_LOG_TYPE_INFO, "Comparing sim ID %@ to registered sim IDs %@; isRegisteredSIM = %@.",
        buf,
        0x20u);
    }

  }
  return v7 & 1;
}

+ (BOOL)_isiMessageEnabledIfLastAddressedHandleIsNotActiveAnymore:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  NSObject *v7;
  const __CFString *v8;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ctSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "__im_containsPhoneNumber:", v3) & 1) != 0)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = +[IMServiceImpl iMessageEnabled](IMServiceImpl, "iMessageEnabled");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v8 = CFSTR("NO");
        if (v6)
          v8 = CFSTR("YES");
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_1A1FF4000, v7, OS_LOG_TYPE_INFO, "User has switched SIMs, setting isiMessageEnabled = %@", (uint8_t *)&v10, 0xCu);
      }

    }
  }

  return v6;
}

+ (BOOL)_isLastAddressedHandleSubscriptionActive:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D39738], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ctSubscriptionInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "phoneNumbersOfActiveSubscriptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "phoneNumbersOfActiveSubscriptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v3);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)_shouldCheckIfLastAddressedHandleIsInSubscriptionsAnymoreButiMessageIsEnabledForAlias:(id)a3 previousService:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a4;
  if (objc_msgSend(a3, "length"))
  {
    if (v5)
    {
      +[IMService iMessageService](IMService, "iMessageService");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v6 == v5;

    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_iMessageEnabledForMultipleSubscriptionsForSenderLastAddressedHandle:(id)a3 simID:(id)a4 previousService:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  BOOL v17;
  _BOOL4 v18;
  char v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v23;
  NSObject *v24;
  const __CFString *v25;
  int v26;
  const __CFString *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_msgSend(v8, "copy");
  v12 = (void *)objc_msgSend(v9, "copy");
  +[IMService iMessageService](IMService, "iMessageService");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "length") && objc_msgSend(v12, "length"))
  {
    objc_msgSend(a1, "_phoneNumberOnSubscriptionWithSIMID:", v9);
    v14 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v14;
  }
  if (!objc_msgSend(v11, "length") && !objc_msgSend(v12, "length"))
  {
    v18 = +[IMServiceImpl iMessageEnabled](IMServiceImpl, "iMessageEnabled");
    if (!IMOSLoggingEnabled())
      goto LABEL_25;
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v23 = CFSTR("NO");
      if (v18)
        v23 = CFSTR("YES");
      v26 = 138412290;
      v27 = v23;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "Alias and SIMID are nil, but iMessage enabled: %@", (uint8_t *)&v26, 0xCu);
    }
    goto LABEL_24;
  }
  v15 = +[IMServiceImpl hasAlias:onAccountForService:](IMServiceImpl, "hasAlias:onAccountForService:", v11, v13);
  v16 = objc_msgSend(v12, "length");
  if (v15)
    goto LABEL_12;
  v17 = v16 != 0;
  if (objc_msgSend(v12, "length"))
  {
    if ((objc_msgSend(a1, "_isSIMIdIDSRegisteredSIM:", v12) & 1) != 0)
    {
LABEL_12:
      v18 = 1;
      goto LABEL_19;
    }
    v17 = 0;
  }
  if (objc_msgSend(a1, "_shouldCheckIfLastAddressedHandleIsInSubscriptionsAnymoreButiMessageIsEnabledForAlias:previousService:", v8, v10)&& (objc_msgSend(a1, "_isiMessageEnabledIfLastAddressedHandleIsNotActiveAnymore:", v8) & 1) != 0)
  {
    goto LABEL_12;
  }
  if (objc_msgSend(v12, "length"))
    v19 = v17;
  else
    v19 = 1;
  if ((v19 & 1) != 0 || (objc_msgSend(a1, "_isLastAddressedHandleSubscriptionActive:", v8) & 1) != 0)
  {
    v18 = 0;
  }
  else
  {
    v18 = +[IMServiceImpl iMessageEnabled](IMServiceImpl, "iMessageEnabled");
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = CFSTR("NO");
        if (v18)
          v25 = CFSTR("YES");
        v26 = 138412290;
        v27 = v25;
        _os_log_impl(&dword_1A1FF4000, v24, OS_LOG_TYPE_INFO, "SIMID not found in registered good list, set iMessage enabled: %@", (uint8_t *)&v26, 0xCu);
      }

    }
  }
LABEL_19:
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = CFSTR("NO");
      v26 = 138412802;
      if (v18)
        v21 = CFSTR("YES");
      v27 = v21;
      v28 = 2112;
      v29 = v11;
      v30 = 2112;
      v31 = v12;
      _os_log_impl(&dword_1A1FF4000, v20, OS_LOG_TYPE_INFO, "iMessage enabled for multiple subscriptions: %@ alias: %@ simID: %@", (uint8_t *)&v26, 0x20u);
    }
LABEL_24:

  }
LABEL_25:

  return v18;
}

+ (BOOL)iMessageEnabledForSenderLastAddressedHandle:(id)a3 simID:(id)a4 previousService:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  BOOL v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive())
    v11 = objc_msgSend(a1, "_iMessageEnabledForMultipleSubscriptionsForSenderLastAddressedHandle:simID:previousService:", v8, v9, v10);
  else
    v11 = +[IMServiceImpl iMessageEnabled](IMServiceImpl, "iMessageEnabled");
  v12 = v11;

  return v12;
}

+ (BOOL)mmsEnabled
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  char v7;
  BOOL v8;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsMMS");

  objc_msgSend(MEMORY[0x1E0D20BF8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mmsConfigured");

  v7 = objc_msgSend(a1, "_readMMSUserOverride");
  if (v4)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (!v8 && (v7 & 1) != 0)
    return 1;
  v10 = (void *)qword_1EE65F420;
  if (!qword_1EE65F420)
  {
    +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[IMService smsService](IMServiceImpl, "smsService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bestAccountForService:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)qword_1EE65F420;
    qword_1EE65F420 = v13;

    v10 = (void *)qword_1EE65F420;
  }
  return objc_msgSend(v10, "allowsMMSRelay");
}

- (int64_t)maxChatParticipantsForHandle:(id)a3 simID:(id)a4
{
  id v6;
  id v7;
  int64_t v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  if ((IMServiceImpl *)qword_1ECF124E8 == self)
  {
    if (qword_1EE65F368 != -1)
      dispatch_once(&qword_1EE65F368, &unk_1E471BB20);
    objc_msgSend((id)qword_1EE65F360, "sharedInstanceForBagType:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("md-max-chat-participants"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 && objc_msgSend(v10, "integerValue") > 10)
    {
      v8 = objc_msgSend(v10, "integerValue");

      goto LABEL_11;
    }

LABEL_10:
    v8 = -1;
    goto LABEL_11;
  }
  if ((IMServiceImpl *)qword_1ECF124F0 != self)
    goto LABEL_10;
  v8 = (int)objc_msgSend(MEMORY[0x1E0D39730], "IMMMSMaxRecipientsForPhoneNumber:simID:", v6, v7);
LABEL_11:

  return v8;
}

- (int64_t)maxAttachmentSize
{
  void *v2;
  void *v3;
  int64_t v4;

  -[NSDictionary objectForKey:](self->_serviceProps, "objectForKey:", *MEMORY[0x1E0D36250]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "integerValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)isEnabled
{
  return -[IMAccount isActive](self->_bestAccount, "isActive");
}

- (BOOL)_wantsInternationizedNumbers
{
  return self->_shouldInternationalizeNumbers;
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (NSString)localizedShortName
{
  return self->_localizedShortName;
}

- (NSArray)siblingServices
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](self->_siblingServiceNames, "count") + 1);
  objc_msgSend(v3, "addObject:", self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_siblingServiceNames;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        +[IMServiceImpl serviceWithInternalName:](IMServiceImpl, "serviceWithInternalName:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v3 && v9)
          CFArrayAppendValue((CFMutableArrayRef)v3, v9);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)accountIDs
{
  void *v3;
  void *v4;
  void *v5;

  +[IMAccountController sharedInstance](IMAccountController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "activeAccountsForService:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayByApplyingSelector:", sel_uniqueID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99D20];
  -[IMServiceImpl internalName](self, "internalName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObjects:", CFSTR("IMService["), v3, CFSTR("]"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)IMCreateSimpleComponentString();

  return v5;
}

- (void)defaultsChanged:(id)a3
{
  void *v5;
  NSDictionary *v6;

  v6 = (NSDictionary *)a3;
  if (self->_serviceDefaults != v6)
    objc_storeStrong((id *)&self->_serviceDefaults, a3);
  +[IMServiceAgent notificationCenter](IMServiceAgent, "notificationCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:userInfo:", CFSTR("__kIMServiceDefaultsChangedNotification"), self, 0);

}

- (void)activeAccountsChanged:(id)a3
{
  id v4;

  -[IMServiceImpl _calculateBestAccount](self, "_calculateBestAccount", a3);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__mainThreadPostNotificationName:object:", CFSTR("NotificationActiveAccountChanged"), self);

}

- (Class)accountClass
{
  return (Class)objc_opt_class();
}

+ (id)supportedCountryCodes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", CFSTR("us"));
}

+ (BOOL)systemSupportsSMSSending
{
  return 1;
}

+ (BOOL)systemSupportsSendingAttachmentsOfTypes:(id)a3 error:(int64_t *)a4
{
  id v5;
  char CanBeSent;

  v5 = a3;
  if ((id)objc_opt_class() == a1)
    CanBeSent = IMMMSPartCombinationCanBeSent();
  else
    CanBeSent = 1;

  return CanBeSent;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)shortName
{
  return self->_shortName;
}

- (NSDictionary)defaultAccountSettings
{
  return self->_defaultAccountSettings;
}

- (void)setIsPersistent:(BOOL)a3
{
  self->_isPersistent = a3;
}

- (BOOL)ignoresNetworkConnectivity
{
  return self->_ignoresNetworkConnectivity;
}

- (void)setIgnoresNetworkConnectivity:(BOOL)a3
{
  self->_ignoresNetworkConnectivity = a3;
}

- (unsigned)IDSensitivity
{
  return self->_IDSensitivity;
}

- (BOOL)handleIDInsensitivityIsCarrierBased
{
  return self->_handleIDInsensitivityIsCarrierBased;
}

- (void)setHandleIDInsensitivityIsCarrierBased:(BOOL)a3
{
  self->_handleIDInsensitivityIsCarrierBased = a3;
}

- (unint64_t)caseInsensitivityByHandleType
{
  return self->_caseInsensitivityByHandleType;
}

- (void)setCaseInsensitivityByHandleType:(unint64_t)a3
{
  self->_caseInsensitivityByHandleType = a3;
}

- (void)setShouldDisableDeactivation:(BOOL)a3
{
  self->_shouldDisableDeactivation = a3;
}

- (void)setSupportsCrossAccountIDSMessaging:(BOOL)a3
{
  self->_supportsCrossAccountIDSMessaging = a3;
}

- (BOOL)isPlugInService
{
  return self->_isPlugInService;
}

- (void)setIsPlugInService:(BOOL)a3
{
  self->_isPlugInService = a3;
}

- (BOOL)shouldReuseTypingIndicatorGUID
{
  return self->_shouldReuseTypingIndicatorGUID;
}

- (void)setShouldReuseTypingIndicatorGUID:(BOOL)a3
{
  self->_shouldReuseTypingIndicatorGUID = a3;
}

- (BOOL)isDiscontinued
{
  return self->_discontinued;
}

- (NSArray)emailDomains
{
  return self->_emailDomains;
}

- (void)setEmailDomains:(id)a3
{
  objc_storeStrong((id *)&self->_emailDomains, a3);
}

- (void)setAllowsMultipleConnections:(BOOL)a3
{
  self->_allowsMultipleConnections = a3;
}

- (NSArray)addressBookProperties
{
  return self->_addressBookProperties;
}

- (NSString)addressBookProperty
{
  return self->_addressBookProperty;
}

- (void)setLocalizedName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedName, a3);
}

- (void)setLocalizedShortName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedShortName, a3);
}

- (IMAccount)bestAccount
{
  return self->_bestAccount;
}

- (void)setBestAccount:(id)a3
{
  objc_storeStrong((id *)&self->_bestAccount, a3);
}

- (NSDictionary)defaultSettings
{
  return self->_defaultSettings;
}

- (void)setDefaultSettings:(id)a3
{
  objc_storeStrong((id *)&self->_defaultSettings, a3);
}

- (NSArray)siblingServiceNames
{
  return self->_siblingServiceNames;
}

- (void)setSiblingServiceNames:(id)a3
{
  objc_storeStrong((id *)&self->_siblingServiceNames, a3);
}

- (unsigned)screenNameSensitivity
{
  return self->_screenNameSensitivity;
}

- (void)setScreenNameSensitivity:(unsigned int)a3
{
  self->_screenNameSensitivity = a3;
}

- (NSArray)abProperties
{
  return self->_abProperties;
}

- (void)setAbProperties:(id)a3
{
  objc_storeStrong((id *)&self->_abProperties, a3);
}

- (NSDictionary)serviceProps
{
  return self->_serviceProps;
}

- (void)setServiceProps:(id)a3
{
  objc_storeStrong((id *)&self->_serviceProps, a3);
}

- (BOOL)hasLoadedServiceProperties
{
  return self->_hasLoadedServiceProperties;
}

- (void)setHasLoadedServiceProperties:(BOOL)a3
{
  self->_hasLoadedServiceProperties = a3;
}

- (BOOL)supportsSMS
{
  return self->_supportsSMS;
}

- (void)setSupportsSMS:(BOOL)a3
{
  self->_supportsSMS = a3;
}

- (BOOL)shouldInternationalizeNumbers
{
  return self->_shouldInternationalizeNumbers;
}

- (void)setShouldInternationalizeNumbers:(BOOL)a3
{
  self->_shouldInternationalizeNumbers = a3;
}

- (void)setIsDiscontinued:(BOOL)a3
{
  self->_isDiscontinued = a3;
}

- (NSDictionary)serviceDefaults
{
  return self->_serviceDefaults;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- (BOOL)handlesChatInvites
{
  return self->_handlesChatInvites;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_serviceDefaults, 0);
  objc_storeStrong((id *)&self->_serviceProps, 0);
  objc_storeStrong((id *)&self->_abProperties, 0);
  objc_storeStrong((id *)&self->_siblingServiceNames, 0);
  objc_storeStrong((id *)&self->_defaultSettings, 0);
  objc_storeStrong((id *)&self->_bestAccount, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_addressBookProperty, 0);
  objc_storeStrong((id *)&self->_addressBookProperties, 0);
  objc_storeStrong((id *)&self->_emailDomains, 0);
  objc_storeStrong((id *)&self->_defaultAccountSettings, 0);
  objc_storeStrong((id *)&self->_shortName, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
