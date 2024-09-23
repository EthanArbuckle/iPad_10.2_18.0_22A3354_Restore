@implementation _SFBrowserWindowSettings

- (BOOL)privateBrowsingEnabledForWindowWithUUID:(id)a3
{
  return -[_SFBrowserWindowSettings _BOOLValueForKey:windowUUID:](self, "_BOOLValueForKey:windowUUID:", CFSTR("PrivateBrowsing"), a3);
}

+ (_SFBrowserWindowSettings)settings
{
  void *v2;
  _QWORD block[5];

  v2 = (void *)sharedSettingsInstance;
  if (!sharedSettingsInstance)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __36___SFBrowserWindowSettings_settings__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (settings_onceToken != -1)
      dispatch_once(&settings_onceToken, block);
    v2 = (void *)sharedSettingsInstance;
  }
  return (_SFBrowserWindowSettings *)v2;
}

- (BOOL)hasPrivateBrowsingWindow
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  BOOL v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary allValues](self->_settingsDictionary, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "safari_BOOLForKey:", CFSTR("PrivateBrowsing")) & 1) != 0)
        {
          v7 = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (_SFBrowserWindowSettings)init
{
  _SFBrowserWindowSettings *v2;
  _SFBrowserWindowSettings *v3;
  _SFBrowserWindowSettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_SFBrowserWindowSettings;
  v2 = -[_SFBrowserWindowSettings init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_invalidatesClosedWindows = 1;
    -[_SFBrowserWindowSettings _initializeSettingsDictionaryIfNeeded](v2, "_initializeSettingsDictionaryIfNeeded");
    v4 = v3;
  }

  return v3;
}

- (void)_initializeSettingsDictionaryIfNeeded
{
  NSMutableDictionary *v3;
  NSMutableDictionary *settingsDictionary;
  void *v5;
  id v6;
  _QWORD v7[5];

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  settingsDictionary = self->_settingsDictionary;
  self->_settingsDictionary = v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("BrowserControllersSavedState"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65___SFBrowserWindowSettings__initializeSettingsDictionaryIfNeeded__block_invoke;
    v7[3] = &unk_1E21E3A28;
    v7[4] = self;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);
  }

}

- (BOOL)_BOOLValueForKey:(id)a3 windowUUID:(id)a4
{
  void *v4;
  char v5;

  -[_SFBrowserWindowSettings _numberForKey:windowUUID:](self, "_numberForKey:windowUUID:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  return v5;
}

- (id)_numberForKey:(id)a3 windowUUID:(id)a4
{
  NSMutableDictionary *settingsDictionary;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  settingsDictionary = self->_settingsDictionary;
  v6 = a3;
  objc_msgSend(a4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](settingsDictionary, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safari_numberForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)validateWindowSettingsWithUUIDs:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  char v14;
  id obj;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_invalidatesClosedWindows)
  {
    -[NSMutableDictionary allKeys](self->_settingsDictionary, "allKeys");
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v14 = 0;
      v7 = *(_QWORD *)v19;
      v8 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
          v16[0] = v8;
          v16[1] = 3221225472;
          v16[2] = __60___SFBrowserWindowSettings_validateWindowSettingsWithUUIDs___block_invoke;
          v16[3] = &unk_1E21E3A00;
          v12 = v11;
          v17 = v12;
          objc_msgSend(v4, "safari_firstObjectPassingTest:", v16);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v13)
          {
            -[NSMutableDictionary removeObjectForKey:](self->_settingsDictionary, "removeObjectForKey:", v10);
            v14 = 1;
          }

        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
      if ((v14 & 1) != 0)
        -[_SFBrowserWindowSettings synchronize](self, "synchronize");
    }

  }
}

- (id)blankSnapshotGroupIdentifierForPrivateBrowsing:(BOOL)a3 syncableTabGroupUUID:(id)a4 forWindowWithUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v8 = a5;
  -[_SFBrowserWindowSettings _blankSnapshotKeyForPrivateBrowsing:syncableTabGroupUUID:](self, "_blankSnapshotKeyForPrivateBrowsing:syncableTabGroupUUID:", v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserWindowSettings _stringForKey:windowUUID:](self, "_stringForKey:windowUUID:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v10);
  else
    v11 = 0;

  return v11;
}

- (id)_stringForKey:(id)a3 windowUUID:(id)a4
{
  NSMutableDictionary *settingsDictionary;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  settingsDictionary = self->_settingsDictionary;
  v6 = a3;
  objc_msgSend(a4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](settingsDictionary, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safari_stringForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_blankSnapshotKeyForPrivateBrowsing:(BOOL)a3 syncableTabGroupUUID:(id)a4
{
  __CFString *v4;
  __CFString *v5;

  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), CFSTR("TabGroupBlankSnapshotGroupIdentifier"), a4);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = CFSTR("NormalBlankSnapshotGroupIdentifier");
    if (a3)
      v5 = CFSTR("PrivateBlankSnapshotGroupIdentifier");
    v4 = v5;
  }
  return v4;
}

+ (void)setSharedSettings:(id)a3
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "launchedToTest");
  v6 = sharedSettingsInstance;

  if ((v5 & 1) == 0 && v6)
    +[_SFBrowserWindowSettings setSharedSettings:].cold.1();
  v7 = (void *)sharedSettingsInstance;
  sharedSettingsInstance = (uint64_t)v3;

}

- (void)_setBool:(BOOL)a3 forKey:(id)a4 windowUUID:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v6 = a3;
  v14 = a4;
  v8 = a5;
  -[_SFBrowserWindowSettings _numberForKey:windowUUID:](self, "_numberForKey:windowUUID:", v14, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || objc_msgSend(v9, "BOOLValue") != v6)
  {
    objc_msgSend(v8, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_settingsDictionary, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settingsDictionary, "setObject:forKeyedSubscript:", v12, v11);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, v14);

    -[_SFBrowserWindowSettings synchronize](self, "synchronize");
  }

}

- (void)setData:(id)a3 forKey:(id)a4 forWindowWithUUID:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  objc_msgSend(a5, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_settingsDictionary, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settingsDictionary, "setObject:forKeyedSubscript:", v10, v9);
  }
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v8);
  -[_SFBrowserWindowSettings synchronize](self, "synchronize");

}

- (id)dataForKey:(id)a3 forWindowWithUUID:(id)a4
{
  NSMutableDictionary *settingsDictionary;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  settingsDictionary = self->_settingsDictionary;
  v6 = a3;
  objc_msgSend(a4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](settingsDictionary, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safari_dataForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_setString:(id)a3 forKey:(id)a4 windowUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  if (v9)
  {
    -[_SFBrowserWindowSettings _stringForKey:windowUUID:](self, "_stringForKey:windowUUID:", v8, v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 != v13 && (objc_msgSend(v10, "isEqualToString:", v13) & 1) == 0)
    {
      objc_msgSend(v9, "UUIDString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](self->_settingsDictionary, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_settingsDictionary, "setObject:forKeyedSubscript:", v12, v11);
      }
      objc_msgSend(v12, "setValue:forKey:", v13, v8);
      -[_SFBrowserWindowSettings synchronize](self, "synchronize");

    }
  }

}

- (void)setPrivateBrowsingEnabled:(BOOL)a3 forWindowWithUUID:(id)a4
{
  -[_SFBrowserWindowSettings _setBool:forKey:windowUUID:](self, "_setBool:forKey:windowUUID:", a3, CFSTR("PrivateBrowsing"), a4);
}

- (BOOL)activeDocumentIsValidForWindowWithUUID:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[_SFBrowserWindowSettings _numberForKey:windowUUID:](self, "_numberForKey:windowUUID:", CFSTR("ActiveDocumentIsValid"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (void)setActiveDocumentIsValid:(BOOL)a3 forWindowWithUUID:(id)a4
{
  -[_SFBrowserWindowSettings _setBool:forKey:windowUUID:](self, "_setBool:forKey:windowUUID:", a3, CFSTR("ActiveDocumentIsValid"), a4);
}

- (BOOL)isShowingTabViewForWindowWithUUID:(id)a3
{
  return -[_SFBrowserWindowSettings _BOOLValueForKey:windowUUID:](self, "_BOOLValueForKey:windowUUID:", CFSTR("ShowingTabView"), a3);
}

- (void)setIsShowingTabView:(BOOL)a3 forWindowWithUUID:(id)a4
{
  -[_SFBrowserWindowSettings _setBool:forKey:windowUUID:](self, "_setBool:forKey:windowUUID:", a3, CFSTR("ShowingTabView"), a4);
}

- (BOOL)tabViewDismissesOnUnlockForWindowWithUUID:(id)a3
{
  return -[_SFBrowserWindowSettings _BOOLValueForKey:windowUUID:](self, "_BOOLValueForKey:windowUUID:", CFSTR("TabViewDismissesOnUnlock"), a3);
}

- (void)setTabViewDismissesOnUnlock:(BOOL)a3 forWindowWithUUID:(id)a4
{
  -[_SFBrowserWindowSettings _setBool:forKey:windowUUID:](self, "_setBool:forKey:windowUUID:", a3, CFSTR("TabViewDismissesOnUnlock"), a4);
}

- (void)setBlankSnapshotGroupIdentifier:(id)a3 forPrivateBrowsing:(BOOL)a4 syncableTabGroupUUID:(id)a5 forWindowWithUUID:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  id v13;

  v7 = a4;
  v10 = a6;
  v11 = a3;
  -[_SFBrowserWindowSettings _blankSnapshotKeyForPrivateBrowsing:syncableTabGroupUUID:](self, "_blankSnapshotKeyForPrivateBrowsing:syncableTabGroupUUID:", v7, a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[_SFBrowserWindowSettings _setString:forKey:windowUUID:](self, "_setString:forKey:windowUUID:", v12, v13, v10);
}

- (void)removeWindowWithUUID:(id)a3
{
  NSMutableDictionary *settingsDictionary;
  void *v5;

  settingsDictionary = self->_settingsDictionary;
  objc_msgSend(a3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](settingsDictionary, "removeObjectForKey:", v5);

  -[_SFBrowserWindowSettings synchronize](self, "synchronize");
}

- (void)synchronize
{
  uint64_t v2;
  _QWORD block[5];

  if (!self->_synchronizeScheduled)
  {
    v2 = MEMORY[0x1E0C809B0];
    self->_synchronizeScheduled = 1;
    block[0] = v2;
    block[1] = 3221225472;
    block[2] = __39___SFBrowserWindowSettings_synchronize__block_invoke;
    block[3] = &unk_1E21E2050;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
}

- (void)_synchronizeNow
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "safari_browserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", self->_settingsDictionary, CFSTR("BrowserControllersSavedState"));
  objc_msgSend(v3, "synchronize");

}

- (BOOL)invalidatesClosedWindows
{
  return self->_invalidatesClosedWindows;
}

- (void)setInvalidatesClosedWindows:(BOOL)a3
{
  self->_invalidatesClosedWindows = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsDictionary, 0);
}

+ (void)setSharedSettings:.cold.1()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", &stru_1E21FE780);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/SafariServices/iOS/MobileSafari/MobileSafariFramework/_SFBrowserWindowSettings.m");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), v0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "[[UIApplication sharedApplication] launchedToTest] || !sharedSettingsInstance", "+[_SFBrowserWindowSettings setSharedSettings:]", v3, 38, v5);
    v4 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v1, "stringWithFormat:", CFSTR("ASSERTION FAILURE: \"%s\" in %s, %@:%d%@"), "[[UIApplication sharedApplication] launchedToTest] || !sharedSettingsInstance", "+[_SFBrowserWindowSettings setSharedSettings:]", v3, 38, &stru_1E21FE780);
    v4 = objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR("%@\n%@"), v4, v6);

  abort();
}

@end
