@implementation IMSharedWithYouManager

- (BOOL)isSharedWithYouEnabledForApplicationWithBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMSharedWithYouManager isSharedWithYouEnabled](self, "isSharedWithYouEnabled"))
  {
    if (!objc_msgSend(v4, "length") && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Invalid bundleID:%@", (uint8_t *)&v12, 0xCu);
      }

    }
    v6 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouApps"), CFSTR("com.apple.SocialLayer"));
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "objectForKey:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(v7, "objectForKey:", v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v8) = objc_msgSend(v9, "BOOLValue");

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12 = 138412290;
          v13 = v4;
          _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Failed to find bundleID:%@ in the SharedWithYouApp's", (uint8_t *)&v12, 0xCu);
        }

      }
      LOBYTE(v8) = 0;
    }

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return (char)v8;
}

+ (BOOL)_isBundleIDAllowed:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  char v13;
  NSObject *v14;
  const __CFString *v15;
  NSObject *v16;
  const __CFString *v17;
  const __CFString *v18;
  NSObject *v19;
  __CFString *v20;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  const __CFString *v26;
  __int16 v27;
  const __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    v22 = 0;
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v22);
    v5 = v22;
    objc_msgSend(v4, "applicationState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isRestricted");

    objc_msgSend((id)objc_opt_class(), "tvAppBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v3, "isEqualToString:", v8);

    if ((_DWORD)v6)
    {
      if (qword_1ECFC6CA8 != -1)
        dispatch_once(&qword_1ECFC6CA8, &unk_1E3FB47C8);
      if (!qword_1ECFC6CA0 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Unable to weaklink WLKURLBagUtilities", buf, 2u);
        }

      }
      objc_msgSend((id)qword_1ECFC6CA0, "isFullTVAppEnabledCachedValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v10;
          _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "isFullTVAppEnabledCachedValue %@", buf, 0xCu);
        }

      }
      if (v10)
        v12 = objc_msgSend(v10, "BOOLValue");
      else
        v12 = 1;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          v17 = CFSTR("NO");
          if (v7)
            v18 = CFSTR("YES");
          else
            v18 = CFSTR("NO");
          *(_DWORD *)buf = 138412802;
          v24 = v3;
          v26 = v18;
          v25 = 2112;
          if (v12)
            v17 = CFSTR("YES");
          v27 = 2112;
          v28 = v17;
          _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "BundleID Allowed check for bundle ID %@ isAppRestricted %@ isFullTVAppEnabled %@", buf, 0x20u);
        }

      }
      v13 = v12 & ~(_BYTE)v7;
    }
    else
    {
      v13 = v7 ^ 1;
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = CFSTR("NO");
          if (v7)
            v15 = CFSTR("YES");
          *(_DWORD *)buf = 138412546;
          v24 = v3;
          v25 = 2112;
          v26 = v15;
          _os_log_impl(&dword_19E239000, v14, OS_LOG_TYPE_INFO, "BundleID Allowed check for bundle ID %@ isAppRestricted %@", buf, 0x16u);
        }

      }
    }
    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v5, "localizedDescription");
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v24 = v3;
          v25 = 2112;
          v26 = v20;
          _os_log_impl(&dword_19E239000, v19, OS_LOG_TYPE_INFO, "Failed to create the Application record for bundle: %@. Error: %@", buf, 0x16u);

        }
      }
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)updateEnabledApps
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CA5870], "enumeratorWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFilter:", &unk_1E3FB28D8);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "bundleIdentifier", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  -[IMSharedWithYouManager enabledBundleIDs](self, "enabledBundleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "isEqualToSet:", v11);

  if ((v12 & 1) == 0)
    -[IMSharedWithYouManager setEnabledBundleIDs:](self, "setEnabledBundleIDs:", v4);

}

- (BOOL)sharedWithYouKeyExists
{
  NSObject *v2;
  const __CFString *v3;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  CFPreferencesGetAppBooleanValue(CFSTR("SharedWithYouEnabled"), CFSTR("com.apple.SocialLayer"), &keyExistsAndHasValidFormat);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      if (keyExistsAndHasValidFormat)
        v3 = CFSTR("Yes");
      else
        v3 = CFSTR("No");
      *(_DWORD *)buf = 138412290;
      v7 = v3;
      _os_log_impl(&dword_19E239000, v2, OS_LOG_TYPE_INFO, "SharedWithYouKeyExists = %@ for", buf, 0xCu);
    }

  }
  return keyExistsAndHasValidFormat != 0;
}

- (void)setEnabledBundleIDs:(id)a3
{
  objc_storeStrong((id *)&self->_enabledBundleIDs, a3);
}

- (BOOL)isSharedWithYouEnabled
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = +[IMDeviceUtilities supportsSharedWithYou](IMDeviceUtilities, "supportsSharedWithYou");
  if (v3)
  {
    if ((IMIsRunningInUnitTesting() & 1) != 0)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[IMSharedWithYouManager cachedSharedWithYouEnabledValue](self, "cachedSharedWithYouEnabledValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "BOOLValue");

      LOBYTE(v3) = v5;
    }
  }
  return v3;
}

- (IMSharedWithYouManager)init
{
  IMSharedWithYouManager *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  NSMutableDictionary *swyPinsPerBundleID;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  const char *v9;
  NSObject *v10;
  id v11;
  void *v12;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)IMSharedWithYouManager;
  v2 = -[IMSharedWithYouManager init](&v20, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", CFSTR("SharedWithYouPinsCache"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "mutableCopy");
    swyPinsPerBundleID = v2->_swyPinsPerBundleID;
    v2->_swyPinsPerBundleID = (NSMutableDictionary *)v5;

    if (!v2->_swyPinsPerBundleID)
    {
      v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v8 = v2->_swyPinsPerBundleID;
      v2->_swyPinsPerBundleID = v7;

    }
    location = 0;
    objc_initWeak(&location, v2);
    v9 = (const char *)objc_msgSend(CFSTR("SLSharedWithYouSettingHasChanged"), "UTF8String");
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = sub_19E2BFD58;
    v17 = &unk_1E3FB76E8;
    objc_copyWeak(&v18, &location);
    notify_register_dispatch(v9, &v2->_settingHasChangedNotificationToken, v10, &v14);

    -[IMSharedWithYouManager _applicationWorkspace](v2, "_applicationWorkspace", v14, v15, v16, v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:", v2);

    -[IMSharedWithYouManager updateEnabledApps](v2, "updateEnabledApps");
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (NSSet)enabledBundleIDs
{
  return self->_enabledBundleIDs;
}

- (BOOL)defaultCollaborationAppsEnabled
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[IMSharedWithYouManager collaborationAppBundleIDs](IMSharedWithYouManager, "collaborationAppBundleIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    v6 = 1;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        if ((v6 & 1) != 0)
        {
          v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
          +[IMSharedWithYouManager sharedManager](IMSharedWithYouManager, "sharedManager");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = objc_msgSend(v9, "isSharedWithYouEnabledForApplicationWithBundleID:", v8);

        }
        else
        {
          v6 = 0;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (NSNumber)cachedSharedWithYouEnabledValue
{
  NSNumber *cachedSharedWithYouEnabledValue;
  void *v4;
  NSNumber *v5;
  NSNumber *v6;

  cachedSharedWithYouEnabledValue = self->_cachedSharedWithYouEnabledValue;
  if (!cachedSharedWithYouEnabledValue)
  {
    v4 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouEnabled"), CFSTR("com.apple.SocialLayer"));
    v5 = (NSNumber *)objc_msgSend(v4, "copy");
    v6 = self->_cachedSharedWithYouEnabledValue;
    self->_cachedSharedWithYouEnabledValue = v5;

    cachedSharedWithYouEnabledValue = self->_cachedSharedWithYouEnabledValue;
  }
  return cachedSharedWithYouEnabledValue;
}

- (LSApplicationWorkspace)_applicationWorkspace
{
  return (LSApplicationWorkspace *)MEMORY[0x1E0DE7D20](MEMORY[0x1E0CA5878], sel_defaultWorkspace);
}

+ (id)tvAppBundleID
{
  return CFSTR("com.apple.tv");
}

+ (id)sharedManager
{
  if (qword_1ECFC7138 != -1)
    dispatch_once(&qword_1ECFC7138, &unk_1E3FB3848);
  return (id)qword_1ECFC7160;
}

+ (id)collaborationAppBundleIDs
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", &unk_1E3FFEF18);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if (objc_msgSend((id)objc_opt_class(), "_isBundleIDAllowed:", v9, (_QWORD)v11))
          objc_msgSend(v3, "addObject:", v9);
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  notify_cancel(self->_settingHasChangedNotificationToken);
  -[IMSharedWithYouManager _applicationWorkspace](self, "_applicationWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSharedWithYouManager swyPinsPerBundleID](self, "swyPinsPerBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v5, CFSTR("SharedWithYouPinsCache"));

  v6.receiver = self;
  v6.super_class = (Class)IMSharedWithYouManager;
  -[IMSharedWithYouManager dealloc](&v6, sel_dealloc);
}

- (void)setSharedWithYouEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  CFPreferencesSetAppValue(CFSTR("SharedWithYouEnabled"), (CFPropertyListRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), CFSTR("com.apple.SocialLayer"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.SocialLayer"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSharedWithYouManager setCachedSharedWithYouEnabledValue:](self, "setCachedSharedWithYouEnabledValue:", v5);

  notify_post((const char *)objc_msgSend(CFSTR("SLSharedWithYouSettingHasChanged"), "UTF8String"));
}

- (BOOL)isSharedWithYouSetUpForApplicationWithBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[IMSharedWithYouManager isSharedWithYouEnabled](self, "isSharedWithYouEnabled"))
  {
    if (!objc_msgSend(v4, "length") && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v10 = 138412290;
        v11 = v4;
        _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "Invalid bundleID: %@", (uint8_t *)&v10, 0xCu);
      }

    }
    v6 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouApps"), CFSTR("com.apple.SocialLayer"));
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)onboardingAppBundleIDs
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = objc_msgSend(&unk_1E3FFEF00, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(&unk_1E3FFEF00);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6);
        if (objc_msgSend((id)objc_opt_class(), "_isBundleIDAllowed:", v7))
          objc_msgSend(v2, "addObject:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(&unk_1E3FFEF00, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  return v2;
}

- (id)defaultAppBundleIDs
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
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "onboardingAppBundleIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  objc_msgSend((id)objc_opt_class(), "collaborationAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v5);

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E20];
  +[IMSharedWithYouManager sharedManager](IMSharedWithYouManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sharedWithYouApplicationBundleIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "minusSet:", v6);
  -[IMSharedWithYouManager swyPublicEntitlementAppBundleIDs](self, "swyPublicEntitlementAppBundleIDs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count"))
    objc_msgSend(v3, "addObjectsFromArray:", v11);
  objc_msgSend(v10, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v12);

  +[IMSharedWithYouManager _hiddenBundleIDs](IMSharedWithYouManager, "_hiddenBundleIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectsInArray:", v13);

  return v3;
}

+ (id)_hiddenBundleIDs
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E3FFEF30);
  objc_msgSend(v2, "addObjectsFromArray:", &unk_1E3FFEF48);
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

+ (id)wolfHiddenSWYUIBundleIDs
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (id)enabledApps
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[IMSharedWithYouManager enabledBundleIDs](self, "enabledBundleIDs", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), 0, 0);
        if (v9)
          objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)swyPublicEntitlementAppBundleIDs
{
  id v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  __int128 v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  const __CFString *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSharedWithYouManager enabledApps](self, "enabledApps");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v28;
    *(_QWORD *)&v5 = 138412290;
    v25 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v8, "applicationState", v25);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isRestricted");

        if ((v10 & 1) != 0)
        {
          if (!IMOSLoggingEnabled())
            continue;
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "bundleIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "applicationState");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "isRestricted");
            *(_DWORD *)buf = 138412546;
            v15 = CFSTR("NO");
            if (v14)
              v15 = CFSTR("YES");
            v32 = v12;
            v33 = 2112;
            v34 = v15;
            _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Not including bundleID %@ since isAppRestricted %@", buf, 0x16u);

          }
          goto LABEL_12;
        }
        +[IMSharedWithYouManager _hiddenBundleIDs](IMSharedWithYouManager, "_hiddenBundleIDs");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "bundleIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "containsObject:", v17))
        {

        }
        else
        {
          +[IMSharedWithYouManager collaborationAppBundleIDs](IMSharedWithYouManager, "collaborationAppBundleIDs");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "bundleIdentifier");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "containsObject:", v19);

          if ((v20 & 1) == 0)
          {
            objc_msgSend(v8, "bundleIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "addObject:", v22);

            continue;
          }
        }
        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v8, "bundleIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v25;
            v32 = v21;
            _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Not including bundleID %@ since its to be hidden or is a default collaboration app", buf, 0xCu);

          }
LABEL_12:

          continue;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v4);
  }

  v23 = (void *)objc_msgSend(v26, "copy");
  return v23;
}

+ (id)appBundleIDsFromDefaults
{
  void *v2;
  void *v3;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouApps"), CFSTR("com.apple.SocialLayer"));
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)sharedWithYouApps
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  uint64_t v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IMSharedWithYouManager defaultAppBundleIDs](self, "defaultAppBundleIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v8 = objc_alloc(MEMORY[0x1E0CA5870]);
        v17 = 0;
        v9 = (void *)objc_msgSend(v8, "initWithBundleIdentifier:allowPlaceholder:error:", v7, 0, &v17);
        v10 = v17;
        if (v10)
        {
          if (IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v10, "localizedDescription");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v23 = v7;
              v24 = 2112;
              v25 = v12;
              _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Failed to create an Application record for bundle: %@. Error: %@", buf, 0x16u);

            }
          }
        }
        else
        {
          objc_msgSend(v9, "localizedName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setValue:forKey:", v7, v13);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v4);
  }

  v14 = (void *)objc_msgSend(v16, "copy");
  return v14;
}

- (NSArray)sharedWithYouApplicationBundleIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSArray *v10;
  uint8_t v12[16];

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouApps"), CFSTR("com.apple.SocialLayer"));
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v12 = 0;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "No apps found in SharedWithYouApp's", v12, 2u);
      }

    }
    v5 = 0;
  }
  +[IMSharedWithYouManager _hiddenBundleIDs](IMSharedWithYouManager, "_hiddenBundleIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectsInArray:", v7);

  v8 = (void *)objc_msgSend(v5, "copy");
  v9 = v8;
  if (!v8)
    v8 = (void *)MEMORY[0x1E0C9AA60];
  v10 = v8;

  return v10;
}

- (void)setSharedWithYouEnabled:(BOOL)a3 forApplicationWithBundleID:(id)a4
{
  _BOOL8 v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const __CFString *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v4 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (!objc_msgSend(v5, "length") && IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v14 = 138412290;
      v15 = v5;
      _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Invalid bundleID:%@", (uint8_t *)&v14, 0xCu);
    }

  }
  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("SharedWithYouApps"), CFSTR("com.apple.SocialLayer"));
  v8 = v7;
  if (v7)
  {
    v9 = (void *)objc_msgSend(v7, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v14 = 138412290;
        v15 = v5;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "Adding bundleID:%@ to the Shared With You Preferences", (uint8_t *)&v14, 0xCu);
      }

    }
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = CFSTR("No");
      if (v4)
        v12 = CFSTR("Yes");
      v14 = 138412546;
      v15 = v5;
      v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_19E239000, v11, OS_LOG_TYPE_INFO, "Setting bundleID:%@ to enabled:%@ in SharedWithYouApp Preferences", (uint8_t *)&v14, 0x16u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v13, v5);

  CFPreferencesSetAppValue(CFSTR("SharedWithYouApps"), v9, CFSTR("com.apple.SocialLayer"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.SocialLayer"));
  notify_post((const char *)objc_msgSend(CFSTR("SLSharedWithYouAppSettingHasChanged"), "UTF8String"));

}

- (void)setSharedWithYouEnabledForAllApplicationsIndividually:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v3 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[IMSharedWithYouManager sharedWithYouApplicationBundleIDs](self, "sharedWithYouApplicationBundleIDs", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[IMSharedWithYouManager setSharedWithYouEnabled:forApplicationWithBundleID:](self, "setSharedWithYouEnabled:forApplicationWithBundleID:", v3, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (BOOL)showPinningStatusTextForBundleID:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  char v8;
  char v9;
  NSObject *v10;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!objc_msgSend(v4, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v4;
        _os_log_impl(&dword_19E239000, v10, OS_LOG_TYPE_INFO, "nil bundleID passed in. bundleID:%@", (uint8_t *)&v12, 0xCu);
      }

    }
    goto LABEL_8;
  }
  -[IMSharedWithYouManager swyPublicEntitlementAppBundleIDs](self, "swyPublicEntitlementAppBundleIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  if (!v6)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  +[IMSharedWithYouManager sharedManager](IMSharedWithYouManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isSharedWithYouEnabledForApplicationWithBundleID:", v4);

  v9 = v8 ^ 1;
LABEL_9:

  return v9;
}

- (void)appNameAndBundleIDFoURL:(id)a3 outAppName:(id *)a4 outBundleID:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  v8 = a3;
  if (v8)
  {
    -[IMSharedWithYouManager lsAppRecordForURL:checkInstalledAppsOnly:](self, "lsAppRecordForURL:checkInstalledAppsOnly:", v8, 1);
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject bundleIdentifier](v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_23;
    -[NSObject bundleIdentifier](v9, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[IMSharedWithYouManager showPinningStatusTextForBundleID:](self, "showPinningStatusTextForBundleID:", v11);

    if (!v12)
      goto LABEL_23;
    -[NSObject localizedName](v9, "localizedName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject bundleIdentifier](v9, "bundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (a4 && v13)
    {
      *a4 = objc_retainAutorelease(v13);
      if (!a5)
        goto LABEL_18;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "Failed to get App Name for URL", v18, 2u);
        }

      }
      if (!a5)
        goto LABEL_18;
    }
    if (v14)
    {
      *a5 = objc_retainAutorelease(v14);
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
LABEL_18:
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_19E239000, v16, OS_LOG_TYPE_INFO, "Failed to get Bundle ID for URL", v17, 2u);
      }

    }
    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "Invalid URL passed in to add lookup name and bundleID", buf, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:

}

- (id)lsAppRecordForURL:(id)a3
{
  return -[IMSharedWithYouManager lsAppRecordForURL:checkInstalledAppsOnly:](self, "lsAppRecordForURL:checkInstalledAppsOnly:", a3, 0);
}

- (id)lsAppRecordForURL:(id)a3 checkInstalledAppsOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  uint8_t v26[128];
  uint8_t buf[4];
  id v28;
  uint64_t v29;

  v4 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v6)
  {
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:includeLinksForCurrentApplication:error:", v6, 1, 1, &v25);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v25;
    if (!v7 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v28 = v8;
        _os_log_impl(&dword_19E239000, v9, OS_LOG_TYPE_INFO, "LSAppLink URL query error: %@", buf, 0xCu);
      }

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v7;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = 0;
      v13 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v15, "isEnabled", (_QWORD)v21))
          {
            objc_msgSend(v15, "targetApplicationRecord");
            v16 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v16;
          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);

      if (!v4
        || !v12
        || (objc_msgSend(v12, "bundleIdentifier"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.CloudKit.ShareBear")),
            v17,
            !v18))
      {
        v19 = v12;
LABEL_24:

        goto LABEL_25;
      }
      -[IMSharedWithYouManager lsAppRecordForShareBearURL:](self, "lsAppRecordForShareBearURL:", v6);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
      v12 = v10;
    }

    goto LABEL_24;
  }
  v19 = 0;
LABEL_25:

  return v19;
}

- (id)_installedLSAppRecordFromBundleIDs:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  NSObject *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = v3;
    v5 = 0;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          v10 = objc_alloc(MEMORY[0x1E0CA5870]);
          v11 = (void *)objc_msgSend(v10, "initWithBundleIdentifier:allowPlaceholder:error:", v9, 0, 0, (_QWORD)v19);

          v5 = v11;
          objc_msgSend(v11, "applicationState");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v12, "isInstalled") & 1) != 0)
          {
            objc_msgSend(v5, "URL");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v13 == 0;

            if (!v14)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v24 = v9;
                  _os_log_impl(&dword_19E239000, v17, OS_LOG_TYPE_INFO, "Found LSAppRecord for bundleID: %@", buf, 0xCu);
                }

              }
              goto LABEL_23;
            }
          }
          else
          {

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_23:

  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19E239000, v15, OS_LOG_TYPE_INFO, "no bundleIDs passed in", buf, 2u);
      }

    }
    v5 = 0;
  }

  return v5;
}

- (id)lsAppRecordForShareBearURL:(id)a3
{
  id v4;
  IMSyndicationUtilities *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_alloc_init(IMSyndicationUtilities);
  -[IMSyndicationUtilities bundleIDsForShareBearURL:](v5, "bundleIDsForShareBearURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMSharedWithYouManager _installedLSAppRecordFromBundleIDs:](self, "_installedLSAppRecordFromBundleIDs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)incrementPinCountForBundleID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (objc_msgSend(v12, "length"))
  {
    -[IMSharedWithYouManager swyPinsPerBundleID](self, "swyPinsPerBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    -[IMSharedWithYouManager swyPinsPerBundleID](self, "swyPinsPerBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, v12);

    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSharedWithYouManager swyPinsPerBundleID](self, "swyPinsPerBundleID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("SharedWithYouPinsCache"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "synchronize");

  }
}

- (void)decrementPinCountForBundleID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (objc_msgSend(v14, "length"))
  {
    -[IMSharedWithYouManager swyPinsPerBundleID](self, "swyPinsPerBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v14);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    v7 = v6 - (v6 > 0);
    -[IMSharedWithYouManager swyPinsPerBundleID](self, "swyPinsPerBundleID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 <= 0)
    {
      objc_msgSend(v8, "removeObjectForKey:", v14);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v10, v14);

    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMSharedWithYouManager swyPinsPerBundleID](self, "swyPinsPerBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("SharedWithYouPinsCache"));

    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "synchronize");

  }
}

- (int64_t)getPinCountForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    -[IMSharedWithYouManager swyPinsPerBundleID](self, "swyPinsPerBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)deleteSharedWithYouPreferences
{
  CFPreferencesSetAppValue(CFSTR("SharedWithYouApps"), 0, CFSTR("com.apple.SocialLayer"));
  CFPreferencesSetAppValue(CFSTR("SharedWithYouEnabled"), 0, CFSTR("com.apple.SocialLayer"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.SocialLayer"));
  notify_post((const char *)objc_msgSend(CFSTR("SLSharedWithYouAppSettingHasChanged"), "UTF8String"));
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "-[IMSharedWithYouManager applicationInstallsDidInstall:%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMSharedWithYouManager updateEnabledApps](self, "updateEnabledApps");

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_19E239000, v5, OS_LOG_TYPE_INFO, "-[IMSharedWithYouManager applicationsDidUninstall:%@]", (uint8_t *)&v6, 0xCu);
    }

  }
  -[IMSharedWithYouManager updateEnabledApps](self, "updateEnabledApps");

}

- (id)lsAppRecordForAppStoreShareURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;

  v4 = a3;
  -[IMSharedWithYouManager lsAppRecordForURL:checkInstalledAppsOnly:](self, "lsAppRecordForURL:checkInstalledAppsOnly:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudKit.ShareBear"));

    if (v8)
    {
      +[IMSharedWithYouManager sharedManager](IMSharedWithYouManager, "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lsAppRecordForShareBearURL:", v4);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
  }
  else
  {
    IMLogHandleForCategory("IMSharedWithYouManager");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_19E36D3D0();

    v6 = 0;
  }

  return v6;
}

- (id)appStoreIDFromSharingURL:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;

  if (a3)
  {
    -[IMSharedWithYouManager lsAppRecordForAppStoreShareURL:](self, "lsAppRecordForAppStoreShareURL:");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      -[NSObject iTunesMetadata](v3, "iTunesMetadata");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
      {
        if (-[NSObject storeItemIdentifier](v5, "storeItemIdentifier"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("id%ld"), -[NSObject storeItemIdentifier](v6, "storeItemIdentifier"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

          goto LABEL_18;
        }
        IMLogHandleForCategory("IMSharedWithYouManager");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_19E36D480();
      }
      else
      {
        IMLogHandleForCategory("IMSharedWithYouManager");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          sub_19E36D454();
      }

    }
    else
    {
      IMLogHandleForCategory("IMSharedWithYouManager");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_19E36D428();
    }
    v7 = 0;
    goto LABEL_17;
  }
  IMLogHandleForCategory("IMSharedWithYouManager");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_19E36D3FC();
  v7 = 0;
LABEL_18:

  return v7;
}

- (id)appNameFromSharingURL:(id)a3
{
  NSObject *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;

  if (a3)
  {
    -[IMSharedWithYouManager lsAppRecordForAppStoreShareURL:](self, "lsAppRecordForAppStoreShareURL:");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (!v3)
    {
      IMLogHandleForCategory("IMSharedWithYouManager");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_19E36D428();
      v5 = 0;
      goto LABEL_12;
    }
    -[NSObject localizedName](v3, "localizedName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      IMLogHandleForCategory("IMSharedWithYouManager");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_19E36D4D8();
LABEL_12:

    }
  }
  else
  {
    IMLogHandleForCategory("IMSharedWithYouManager");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_19E36D4AC();
    v5 = 0;
  }

  return v5;
}

- (id)appStoreURLFromSharingURL:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  -[IMSharedWithYouManager appNameFromSharingURL:](self, "appNameFromSharingURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMSharedWithYouManager appStoreIDFromSharingURL:](self, "appStoreIDFromSharingURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v6)
  {
    objc_msgSend(v5, "lowercaseString");
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("https://apps.apple.com/us/app/%@/%@"), v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)v7;
  }
  else
  {
    IMLogHandleForCategory("IMSharedWithYouManager");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_19E36D504();

    v9 = 0;
  }

  return v9;
}

- (id)urlMinusFragment:(id)a3 onlyCKURL:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a4;
  v5 = a3;
  if (v5)
  {
    if (!v4)
      goto LABEL_5;
    +[IMSharedWithYouManager sharedManager](IMSharedWithYouManager, "sharedManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lsAppRecordForURL:checkInstalledAppsOnly:", v5, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      v11 = v5;
      goto LABEL_8;
    }
    v8 = v7;
    objc_msgSend(v7, "applicationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.CloudKit.ShareBear"));

    v11 = v5;
    if (v10)
    {
LABEL_5:
      objc_msgSend(v5, "absoluteString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("#"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v12, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "URLWithString:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_supportedDataDetectedURLSchemes
{
  return &unk_1E3FFEF60;
}

- (BOOL)isDataDetectedLinkAllowedForSWY:(id)a3
{
  id v4;
  void *v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const __CFString *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[IMSharedWithYouManager _supportedDataDetectedURLSchemes](self, "_supportedDataDetectedURLSchemes", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v4, "scheme");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v10) = objc_msgSend(v11, "isEqualToString:", v10);

          v6 |= v10;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      }
      while (v7);
    }

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v13 = CFSTR("NO");
        if ((v6 & 1) != 0)
          v13 = CFSTR("YES");
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "shouldDonate: %@ URL", buf, 0xCu);
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6 & 1;
}

- (int)settingHasChangedNotificationToken
{
  return self->_settingHasChangedNotificationToken;
}

- (void)setSettingHasChangedNotificationToken:(int)a3
{
  self->_settingHasChangedNotificationToken = a3;
}

- (void)setCachedSharedWithYouEnabledValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)swyPinsPerBundleID
{
  return self->_swyPinsPerBundleID;
}

- (void)setSwyPinsPerBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_swyPinsPerBundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledBundleIDs, 0);
  objc_storeStrong((id *)&self->_swyPinsPerBundleID, 0);
  objc_storeStrong((id *)&self->_cachedSharedWithYouEnabledValue, 0);
}

@end
