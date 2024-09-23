@implementation ACUIAccountViewProvidersManager

+ (ACUIAccountViewProvidersManager)sharedInstance
{
  ACUIAccountViewProvidersManager *v2;
  void *v3;

  if (!__ACUISharedAccountViewProviderManager)
  {
    v2 = objc_alloc_init(ACUIAccountViewProvidersManager);
    v3 = (void *)__ACUISharedAccountViewProviderManager;
    __ACUISharedAccountViewProviderManager = (uint64_t)v2;

  }
  return (ACUIAccountViewProvidersManager *)(id)__ACUISharedAccountViewProviderManager;
}

- (ACUIAccountViewProvidersManager)init
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  ACUIAccountViewProvidersManager *v9;
  uint64_t *v10;
  objc_super v11;
  SEL v12;
  id v13;
  uint64_t v14;
  const __CFString *v15;
  _QWORD v16[15];
  _QWORD v17[16];

  v17[15] = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)ACUIAccountViewProvidersManager;
  v13 = -[ACUIAccountViewProvidersManager init](&v11, sel_init);
  objc_storeStrong(&v13, v13);
  if (v13)
  {
    v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v3 = (void *)*((_QWORD *)v13 + 3);
    *((_QWORD *)v13 + 3) = v2;

    v16[0] = *MEMORY[0x1E0C8F030];
    v17[0] = CFSTR("AppleAccountSettings.bundle");
    v16[1] = *MEMORY[0x1E0C8F080];
    v17[1] = CFSTR("ActiveSyncSettings.bundle");
    v10 = (uint64_t *)MEMORY[0x1E0C8F0B8];
    v16[2] = *MEMORY[0x1E0C8F0B8];
    v17[2] = CFSTR("ActiveSyncSettings.bundle");
    v16[3] = *MEMORY[0x1E0C8F0A8];
    v17[3] = CFSTR("MailAccountSettings.bundle");
    v16[4] = *MEMORY[0x1E0C8F160];
    v17[4] = CFSTR("MailAccountSettings.bundle");
    v16[5] = *MEMORY[0x1E0C8F0D8];
    v17[5] = CFSTR("MailAccountSettings.bundle");
    v16[6] = *MEMORY[0x1E0C8F0E0];
    v17[6] = CFSTR("MailAccountSettings.bundle");
    v16[7] = *MEMORY[0x1E0C8F0D0];
    v17[7] = CFSTR("MailAccountSettings.bundle");
    v16[8] = *MEMORY[0x1E0C8F118];
    v17[8] = CFSTR("MailAccountSettings.bundle");
    v16[9] = *MEMORY[0x1E0C8F100];
    v17[9] = CFSTR("LDAPSettings.bundle");
    v16[10] = *MEMORY[0x1E0C8F058];
    v17[10] = CFSTR("DAVSettings.bundle");
    v16[11] = *MEMORY[0x1E0C8F060];
    v17[11] = CFSTR("DAVSettings.bundle");
    v16[12] = *MEMORY[0x1E0C8F140];
    v17[12] = CFSTR("SubscribedCalendarSettings.bundle");
    v16[13] = *MEMORY[0x1E0C8F028];
    v17[13] = CFSTR("MailAccountSettings.bundle");
    v16[14] = *MEMORY[0x1E0C8F130];
    v17[14] = CFSTR("RemoteManagementAccountSettings.bundle");
    v4 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 15);
    v5 = (void *)*((_QWORD *)v13 + 1);
    *((_QWORD *)v13 + 1) = v4;

    v14 = *v10;
    v15 = CFSTR("MailAccountSettings.bundle");
    v6 = (id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1);
    v7 = (void *)*((_QWORD *)v13 + 2);
    *((_QWORD *)v13 + 2) = v6;

  }
  v9 = (ACUIAccountViewProvidersManager *)v13;
  objc_storeStrong(&v13, 0);
  return v9;
}

- (Class)viewControllerClassForCreatingAccountWithType:(id)a3
{
  id v4;
  id v5;
  id location[2];
  ACUIAccountViewProvidersManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v7, "_accountViewProviderPluginForAccountTypeID:", location[0]);
  v4 = (id)objc_msgSend(v5, "viewControllerClassForCreatingAccountWithType:", location[0]);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return (Class)v4;
}

- (Class)viewControllerClassForViewingAccount:(id)a3
{
  ACUIAccountViewProvidersManager *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location[2];
  ACUIAccountViewProvidersManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v10;
  v6 = (id)objc_msgSend(location[0], "accountType");
  v5 = (id)objc_msgSend(v6, "identifier");
  v8 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v4, "_accountViewProviderPluginForAccountTypeID:");

  v7 = (id)objc_msgSend(v8, "viewControllerClassForViewingAccount:", location[0]);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return (Class)v7;
}

- (Class)controllerClassForCreatingAccountWithType:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[2];
  ACUIAccountViewProvidersManager *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v8, "_accountViewProviderPluginForAccountTypeID:", location[0]);
  v5 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (id)objc_msgSend(v6, "controllerClassForCreatingAccountWithType:", location[0]);
  v4 = v5;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return (Class)v4;
}

- (Class)controllerClassForCreatingRemoteAccountWithType:(id)a3
{
  id v4;
  id v5;
  id v6;
  id location[2];
  ACUIAccountViewProvidersManager *v8;

  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = -[ACUIAccountViewProvidersManager _remoteAccountViewProviderPluginForAccountTypeID:](v8, "_remoteAccountViewProviderPluginForAccountTypeID:", location[0]);
  v5 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = (id)objc_msgSend(v6, "controllerClassForCreatingRemoteAccountWithType:", location[0]);
  v4 = v5;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return (Class)v4;
}

- (id)configurationInfoForCreatingAccountWithType:(id)a3
{
  id v4;
  id v5;
  id location[2];
  ACUIAccountViewProvidersManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v7, "_accountViewProviderPluginForAccountTypeID:", location[0]);
  v4 = (id)objc_msgSend(v5, "configurationInfoForCreatingAccountWithType:", location[0]);
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)configurationInfoForViewingAccount:(id)a3
{
  ACUIAccountViewProvidersManager *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id location[2];
  ACUIAccountViewProvidersManager *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4 = v10;
  v6 = (id)objc_msgSend(location[0], "accountType");
  v5 = (id)objc_msgSend(v6, "identifier");
  v8 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v4, "_accountViewProviderPluginForAccountTypeID:");

  v7 = (id)objc_msgSend(v8, "configurationInfoForViewingAccount:", location[0]);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)localizedStringForDataclass:(id)a3 withSuffix:(id)a4 forAccount:(id)a5
{
  id v5;
  id v6;
  id v8;
  ACUIAccountViewProvidersManager *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id location[2];
  ACUIAccountViewProvidersManager *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v15 = 0;
  v11 = v19;
  v13 = (id)objc_msgSend(v16, "accountType");
  v12 = (id)objc_msgSend(v13, "identifier");
  v14 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v11, "_accountViewProviderPluginForAccountTypeID:");

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = (id)objc_msgSend(v14, "localizedStringForDataclass:withSuffix:forAccount:", location[0], v17, v16);
    v6 = v15;
    v15 = v5;

  }
  v8 = v15;
  objc_storeStrong(&v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_accountViewProviderPluginForAccountTypeID:(id)a3
{
  os_log_t oslog;
  id v5;
  id location[2];
  ACUIAccountViewProvidersManager *v7;
  id v8;
  uint8_t v9[40];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[NSDictionary objectForKey:](v7->_accountTypeToPluginNameMap, "objectForKey:", location[0]);
  if (v5)
  {
    v8 = -[ACUIAccountViewProvidersManager _cachedPluginForName:](v7, "_cachedPluginForName:", v5);
  }
  else
  {
    oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v9, (uint64_t)"-[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:]", 121, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"ACUIAccountViewProvidersManager: somebody requested an account views provider for the unknown type %@!\", v9, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v8 = 0;
  }
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_remoteAccountViewProviderPluginForAccountTypeID:(id)a3
{
  id v3;
  id v5;
  os_log_t oslog;
  char v7;
  id v8;
  id v9;
  id location[2];
  ACUIAccountViewProvidersManager *v11;
  id v12;
  uint8_t v13[40];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = -[NSDictionary objectForKey:](v11->_remoteAccountTypeToPluginNameMapOverride, "objectForKey:", location[0]);
  v7 = 0;
  if (v5)
  {
    v3 = v5;
  }
  else
  {
    v8 = -[NSDictionary objectForKey:](v11->_accountTypeToPluginNameMap, "objectForKey:", location[0]);
    v7 = 1;
    v3 = v8;
  }
  v9 = v3;
  if ((v7 & 1) != 0)

  if (v9)
  {
    v12 = -[ACUIAccountViewProvidersManager _cachedPluginForName:](v11, "_cachedPluginForName:", v9);
  }
  else
  {
    oslog = (os_log_t)_ACUILogSystem();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v13, (uint64_t)"-[ACUIAccountViewProvidersManager _remoteAccountViewProviderPluginForAccountTypeID:]", 131, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1D573D000, oslog, OS_LOG_TYPE_ERROR, "%s (%d) \"ACUIAccountViewProvidersManager: somebody requested a remote account views provider for the unknown type %@!\", v13, 0x1Cu);
    }
    objc_storeStrong((id *)&oslog, 0);
    v12 = 0;
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (id)_cachedPluginForName:(id)a3
{
  id v4;
  id v5;
  id location[2];
  ACUIAccountViewProvidersManager *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = (id)-[NSMutableDictionary objectForKey:](v7->_pluginCache, "objectForKey:", location[0]);
  if (!v5)
  {
    v5 = -[ACUIAccountViewProvidersManager _loadAccountViewProviderPluginWithName:](v7, "_loadAccountViewProviderPluginWithName:", location[0]);

    if (v5)
      -[NSMutableDictionary setObject:forKey:](v7->_pluginCache, "setObject:forKey:", v5, location[0]);
  }
  v4 = v5;
  objc_storeStrong(&v5, 0);
  objc_storeStrong(location, 0);
  return v4;
}

- (id)_loadAccountViewProviderPluginWithName:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v8;
  Class v9;
  id v10;
  int v11;
  os_log_type_t v12;
  id v13;
  id v14;
  id location[3];
  id v16;
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v14 = +[ACUIPluginLoader pluginBundleWithName:](ACUIPluginLoader, "pluginBundleWithName:", location[0]);
  if (v14)
  {
    v10 = 0;
    v9 = (Class)objc_msgSend(v14, "principalClass");
    if ((-[objc_class conformsToProtocol:](v9, "conformsToProtocol:", &unk_1EFF6F3F8) & 1) == 1)
    {
      v3 = objc_alloc_init(v9);
      v4 = v10;
      v10 = v3;

    }
    else if ((-[objc_class conformsToProtocol:](v9, "conformsToProtocol:", &unk_1EFF6F398) & 1) == 1)
    {
      v8 = objc_alloc_init(v9);
      v5 = (id)objc_msgSend(v8, "accountViewsProvider");
      v6 = v10;
      v10 = v5;

      objc_storeStrong(&v8, 0);
    }
    v16 = v10;
    v11 = 1;
    objc_storeStrong(&v10, 0);
  }
  else
  {
    v13 = _ACUILogSystem();
    v12 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_3_8_32_4_0_8_64((uint64_t)v17, (uint64_t)"-[ACUIAccountViewProvidersManager _loadAccountViewProviderPluginWithName:]", 153, (uint64_t)location[0]);
      _os_log_error_impl(&dword_1D573D000, (os_log_t)v13, v12, "%s (%d) \"ACUIAccountViewProvidersManager failed to load the requested plugin with name %@\", v17, 0x1Cu);
    }
    objc_storeStrong(&v13, 0);
    v16 = 0;
    v11 = 1;
  }
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
  return v16;
}

- (BOOL)setDelegate:(id)a3 forSignInController:(id)a4 forAccountWithType:(id)a5
{
  char v8;
  id v9;
  id v10;
  id v11;
  id location[2];
  ACUIAccountViewProvidersManager *v13;

  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = 0;
  objc_storeStrong(&v11, a4);
  v10 = 0;
  objc_storeStrong(&v10, a5);
  v9 = -[ACUIAccountViewProvidersManager _accountViewProviderPluginForAccountTypeID:](v13, "_accountViewProviderPluginForAccountTypeID:", v10);
  v8 = objc_msgSend(v9, "setDelegate:forSignInController:", location[0], v11);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);
  return v8 & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pluginCache, 0);
  objc_storeStrong((id *)&self->_remoteAccountTypeToPluginNameMapOverride, 0);
  objc_storeStrong((id *)&self->_accountTypeToPluginNameMap, 0);
}

@end
