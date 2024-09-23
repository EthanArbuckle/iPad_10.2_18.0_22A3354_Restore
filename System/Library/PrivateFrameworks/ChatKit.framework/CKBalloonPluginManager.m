@implementation CKBalloonPluginManager

- (BOOL)isEnabledAndVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKBalloonPluginManager isPluginEnabled:](self, "isPluginEnabled:", v5))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CKBalloonPluginManager isPluginVisible:](self, "isPluginVisible:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isPluginVisible:(id)a3
{
  void *v4;
  BOOL v5;

  -[CKBalloonPluginManager pluginForIdentifier:](self, "pluginForIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[CKBalloonPluginManager isBalloonPluginVisible:](self, "isBalloonPluginVisible:", v4);
  else
    v5 = 0;

  return v5;
}

- (id)pluginForIdentifier:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__29;
  v17 = __Block_byref_object_dispose__29;
  v18 = 0;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin")))
  {
    objc_msgSend((id)objc_opt_class(), "recentPlugin");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.messages.browser.MorePlugin")))
    {
      -[CKBalloonPluginManager allPlugins](self, "allPlugins");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __46__CKBalloonPluginManager_pluginForIdentifier___block_invoke;
      v10[3] = &unk_1E2750200;
      v11 = v4;
      v12 = &v13;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

      v6 = v11;
      goto LABEL_7;
    }
    objc_msgSend((id)objc_opt_class(), "morePlugin");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v14[5];
  v14[5] = v5;
LABEL_7:

  v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

- (NSArray)allPlugins
{
  NSArray *allPlugins;
  NSObject *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  int v17;
  _BOOL4 v18;
  void *v19;
  int v20;
  void *v22;
  void *v23;
  char v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  _BOOL4 v33;
  void *v34;
  uint64_t v35;
  NSArray *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  _BOOL4 v40;
  NSObject *v41;
  id v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  CKBalloonPluginManager *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  id v56;
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  allPlugins = self->_allPlugins;
  if (allPlugins)
    return allPlugins;
  v50 = self;
  v43 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v43, "startTimingForKey:", CFSTR("allPlugins"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Fetching all plugins from plugin manager.", buf, 2u);
    }

  }
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)objc_opt_class(), "recentPlugin");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
    objc_msgSend(v5, "addObject:", v44);
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allPlugins");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  if (!v9)
  {

    goto LABEL_47;
  }
  v47 = 0;
  v10 = *(_QWORD *)v52;
  v11 = *MEMORY[0x1E0D375D0];
  v49 = *MEMORY[0x1E0D37598];
  v45 = *MEMORY[0x1E0D37558];
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v52 != v10)
        objc_enumerationMutation(v8);
      v13 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v11);

      if ((v15 & 1) == 0)
      {
        if (objc_msgSend(v13, "showInBrowser"))
        {
          objc_msgSend(v13, "browserDisplayName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {

          }
          else if (!-[CKBalloonPluginManager isInternalPlugin:](v50, "isInternalPlugin:", v13))
          {
            continue;
          }
        }
        v17 = objc_msgSend(v13, "presentationContexts");
        if (IMIsRunningIniMessageAppsViewService())
          v18 = 1;
        else
          v18 = CKIsRunningInCameraAppsClient() != 0;
        objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isStickersAppEnabled");

        if (v20)
        {
          if ((v17 & 2) != 0 || !v18)
            goto LABEL_34;
          objc_msgSend(v13, "identifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          IMStickersExtensionIdentifier();
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "hasSuffix:", v23);

          if ((v24 & 1) != 0)
            goto LABEL_34;
        }
        else if (((v18 | v17) & 1) != 0)
        {
          v25 = (v17 & 2) == 0 && v18;
          if (!v25
            || (objc_msgSend(v13, "identifier"),
                v26 = (void *)objc_claimAutoreleasedReturnValue(),
                IMStickersExtensionIdentifier(),
                v27 = (void *)objc_claimAutoreleasedReturnValue(),
                v28 = objc_msgSend(v26, "hasSuffix:", v27),
                v27,
                v26,
                v28))
          {
LABEL_34:
            if (!IMIsRunningIniMessageAppsViewService())
              goto LABEL_37;
            objc_msgSend(v13, "identifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v29, "hasSuffix:", v49) & 1) == 0)
            {
              v30 = objc_msgSend(v29, "hasSuffix:", v45);

              if ((v30 & 1) != 0)
                continue;
LABEL_37:
              objc_msgSend(v48, "addObject:", v13);
              objc_msgSend(v13, "identifier");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addObject:", v29);
              if (objc_msgSend(v29, "isEqualToString:", CFSTR("com.apple.appstore.MessagesProvider")))
              {
                v31 = v13;

                v47 = v31;
              }
              objc_msgSend(v13, "identifier");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = -[CKBalloonPluginManager isPluginEnabled:](v50, "isPluginEnabled:", v32);

              if (v33)
                -[CKBalloonPluginManager _setSeen:forPlugin:](v50, "_setSeen:forPlugin:", 1, v13);
            }

            continue;
          }
        }
      }
    }
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
  }
  while (v9);

  if (v47)
  {
    objc_msgSend(v48, "removeObject:");
    objc_msgSend(v48, "insertObject:atIndex:", v47, 0);
    goto LABEL_48;
  }
LABEL_47:
  v47 = 0;
LABEL_48:
  objc_msgSend((id)objc_opt_class(), "morePlugin");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (v34)
    objc_msgSend(v48, "addObject:", v34);
  -[CKBalloonPluginManager saveWithNotification:](v50, "saveWithNotification:", 0);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v48);
  v35 = objc_claimAutoreleasedReturnValue();
  v36 = v50->_allPlugins;
  v50->_allPlugins = (NSArray *)v35;

  -[CKBalloonPluginManager pluginIndexPathMap](v50, "pluginIndexPathMap");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count") == 0;

  if (v38)
    -[CKBalloonPluginManager regeneratePluginIndexPaths](v50, "regeneratePluginIndexPaths");
  -[CKBalloonPluginManager combinedStickersAppsIndexPathMap](v50, "combinedStickersAppsIndexPathMap");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "count") == 0;

  if (v40)
    -[CKBalloonPluginManager regenerateCombinedStickersAppsIndexPaths](v50, "regenerateCombinedStickersAppsIndexPaths");
  objc_msgSend(v43, "stopTimingForKey:", CFSTR("allPlugins"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v43;
      _os_log_impl(&dword_18DFCD000, v41, OS_LOG_TYPE_INFO, "Loaded allPlugins, %@", buf, 0xCu);
    }

  }
  allPlugins = v50->_allPlugins;
  return allPlugins;
}

- (BOOL)isPluginEnabled:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint8_t v18[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = *MEMORY[0x1E0D375F0];
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D375F0]))
    {
      objc_msgSend((id)objc_opt_class(), "recentPlugin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "balloonPluginForBundleID:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isClingEnabled");

    if (v12)
    {
      objc_msgSend(v7, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v13, "isEqualToString:", v6) ^ 1;
    }
    else
    {
      if (!v7)
      {
        LOBYTE(v9) = 1;
LABEL_18:
        if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37568]))
          LOBYTE(v9) = -[CKBalloonPluginManager isAppStoreEnabled](self, "isAppStoreEnabled");
        if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D37580]))
          LOBYTE(v9) = -[CKBalloonPluginManager isCameraAllowed](self, "isCameraAllowed");
        if (CKIsRunningInMacCatalyst())
        {
          IMBalloonExtensionIDWithSuffix();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v5, "isEqualToString:", v14);

          if (v15)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v7, "plugin");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(v9) = objc_msgSend(v16, "userElection") == 1;

            }
          }
        }

        goto LABEL_27;
      }
      objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v13, "isClingEnabled") & 1) != 0)
        LOBYTE(v9) = 1;
      else
        LOBYTE(v9) = objc_msgSend(v7, "isEnabled");
    }

    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil idenitifier passed to isPluginEnabled:", v18, 2u);
    }

  }
  LOBYTE(v9) = 0;
LABEL_27:

  return v9;
}

- (BOOL)isBalloonPluginVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  BOOL v12;
  void *v13;
  int v14;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D375E0]);

  if ((v6 & 1) != 0)
    goto LABEL_2;
  objc_msgSend(v4, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin"));

  if ((v9 & 1) != 0)
  {
LABEL_4:
    v7 = 1;
    goto LABEL_14;
  }
  if (CKIsSendMenuEnabled())
  {
    if ((objc_msgSend(v4, "showInSendMenu") & 1) != 0)
    {
LABEL_9:
      objc_msgSend(v4, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasSuffix:", *MEMORY[0x1E0D37550]);

      if (v11)
      {
        v12 = -[CKBalloonPluginManager _shouldShowActivity](self, "_shouldShowActivity");
      }
      else
      {
        objc_msgSend(v4, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "hasSuffix:", *MEMORY[0x1E0D37620]);

        if (!v14)
          goto LABEL_4;
        v12 = -[CKBalloonPluginManager _shouldShowSURF](self, "_shouldShowSURF");
      }
      v7 = v12;
      goto LABEL_14;
    }
  }
  else if (objc_msgSend(v4, "showInBrowser"))
  {
    goto LABEL_9;
  }
LABEL_2:
  v7 = 0;
LABEL_14:

  return v7;
}

void __46__CKBalloonPluginManager_pluginForIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_setSeen:(BOOL)a3 forPlugin:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  v11 = a4;
  -[CKBalloonPluginManager pluginSeenMap](self, "pluginSeenMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  if (v4)
  {
    objc_msgSend(v11, "version");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);

  }
  else
  {
    objc_msgSend(v11, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObjectForKey:", v8);
  }

  v10 = (void *)objc_msgSend(v7, "copy");
  -[CKBalloonPluginManager setPluginSeenMap:](self, "setPluginSeenMap:", v10);

}

- (NSDictionary)pluginSeenMap
{
  return self->_pluginSeenMap;
}

- (void)setPluginSeenMap:(id)a3
{
  objc_storeStrong((id *)&self->_pluginSeenMap, a3);
}

+ (id)morePlugin
{
  if (morePlugin_onceToken != -1)
    dispatch_once(&morePlugin_onceToken, &__block_literal_global_56_0);
  return (id)morePlugin_sMorePlugin;
}

+ (id)recentPlugin
{
  if (recentPlugin_onceToken != -1)
    dispatch_once(&recentPlugin_onceToken, &__block_literal_global_79);
  return (id)recentPlugin_sRecentsPlugin;
}

- (BOOL)isAppInstallationEnabled
{
  return self->_isAppInstallationEnabled;
}

- (BOOL)_shouldShowActivity
{
  void **v2;
  void *v3;
  const __CFString *v4;
  void **v5;
  void *v6;
  void *v7;
  char v8;

  if (!_shouldShowActivity__kHKHealthdBundleIdentifier)
  {
    v2 = (void **)MEMORY[0x193FF3C24]("kHKHealthdBundleIdentifier", CFSTR("HealthKit"));
    if (v2)
      v3 = *v2;
    else
      v3 = 0;
    objc_storeStrong((id *)&_shouldShowActivity__kHKHealthdBundleIdentifier, v3);
  }
  v4 = (const __CFString *)_shouldShowActivity__kHKAchievementStickersAvailableKey;
  if (!_shouldShowActivity__kHKAchievementStickersAvailableKey)
  {
    v5 = (void **)MEMORY[0x193FF3C24]("kHKAchievementStickersAvailableKey", CFSTR("HealthKit"));
    if (v5)
      v6 = *v5;
    else
      v6 = 0;
    objc_storeStrong((id *)&_shouldShowActivity__kHKAchievementStickersAvailableKey, v6);
    v4 = (const __CFString *)_shouldShowActivity__kHKAchievementStickersAvailableKey;
  }
  v7 = (void *)CFPreferencesCopyValue(v4, (CFStringRef)_shouldShowActivity__kHKHealthdBundleIdentifier, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
  v8 = objc_msgSend(v7, "BOOLValue");

  return v8;
}

- (BOOL)isInternalPlugin:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin"));

  return v4;
}

uint64_t __40__CKBalloonPluginManager_visiblePlugins__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEnabledAndVisible:", a2);
}

- (id)_decodeIndexPathMap:(id)a3 allowMigration:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BOOL4 v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v25 = v4;
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v26 = v5;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v28 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "rangeOfString:", CFSTR(","));
          objc_msgSend(v13, "substringToIndex:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "substringFromIndex:", v14 + 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "length"))
            v17 = objc_msgSend(v16, "integerValue");
          else
            v17 = 0x7FFFFFFFFFFFFFFFLL;
          if (objc_msgSend(v15, "length"))
            v18 = objc_msgSend(v15, "integerValue");
          else
            v18 = 0x7FFFFFFFFFFFFFFFLL;
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v19, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      }
      while (v9);
    }

    if (v25)
    {
      v20 = (id)MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerIndexPathDictionaryV1Key"));
      MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerIndexPathDictionaryV2Key"));
      v21 = objc_claimAutoreleasedReturnValue();

      MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerIndexPathDictionaryV1Key"));
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v22 | v21;

      if (v23)
      {

        IMSetDomainValueForKey();
        IMSetDomainValueForKey();
        v6 = 0;
      }
    }
    v5 = v26;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(*(id *)(a1 + 32), "isEnabledAndVisible:", v3);
  else
    v4 = 1;

  return v4;
}

uint64_t __84__CKBalloonPluginManager_CKBrowserSelectionController__allPotentiallyVisiblePlugins__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isPluginVisible:", v3);

  return v4;
}

id __104__CKBalloonPluginManager_CKBrowserSelectionController__filteredArrayOfInstallationsThatShouldBeVisible___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v2, "containingBundleIdentifier");
  else
    objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __40__CKBalloonPluginManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)__sharedDataSource;
  __sharedDataSource = (uint64_t)v0;

}

- (CKBalloonPluginManager)init
{
  CKBalloonPluginManager *v2;
  uint64_t v3;
  NSDictionary *pluginVersionMap;
  NSObject *v5;
  NSDictionary *v6;
  NSDictionary *v7;
  uint64_t v8;
  NSDictionary *pluginSeenMap;
  NSDictionary *v10;
  NSObject *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  NSDictionary *v16;
  NSDictionary *v17;
  uint64_t v18;
  NSDictionary *pluginLaunchTimeMap;
  NSObject *v20;
  NSDictionary *v21;
  NSDictionary *v22;
  uint64_t v23;
  NSHashTable *currentExtensionConsumers;
  void **v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSSet *oldVisibleSwitcherPluginIdentifiers;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v34;
  uint8_t v36[16];
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)CKBalloonPluginManager;
  v2 = -[CKBalloonPluginManager init](&v37, sel_init);
  if (v2)
  {
    MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerVersionDictionaryKey"));
    v3 = objc_claimAutoreleasedReturnValue();
    pluginVersionMap = v2->_pluginVersionMap;
    v2->_pluginVersionMap = (NSDictionary *)v3;

    if (!v2->_pluginVersionMap)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Version map was not in user defaults, building from scratch.", v36, 2u);
        }

      }
      v6 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      v7 = v2->_pluginVersionMap;
      v2->_pluginVersionMap = v6;

    }
    MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerSeenDictionaryKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    pluginSeenMap = v2->_pluginSeenMap;
    v2->_pluginSeenMap = (NSDictionary *)v8;

    v10 = v2->_pluginSeenMap;
    if (!v10)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Seen map was not in user defaults, building from scratch.", v36, 2u);
        }

      }
      v12 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      v13 = v2->_pluginSeenMap;
      v2->_pluginSeenMap = v12;

      v10 = v2->_pluginSeenMap;
    }
    -[NSDictionary allValues](v10, "allValues");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v16 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
        v17 = v2->_pluginSeenMap;
        v2->_pluginSeenMap = v16;

      }
    }
    MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerLaunchTimeDictionaryKey"));
    v18 = objc_claimAutoreleasedReturnValue();
    pluginLaunchTimeMap = v2->_pluginLaunchTimeMap;
    v2->_pluginLaunchTimeMap = (NSDictionary *)v18;

    if (!v2->_pluginLaunchTimeMap)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v36 = 0;
          _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "Seen map was not in user defaults, building from scratch.", v36, 2u);
        }

      }
      v21 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99D80]);
      v22 = v2->_pluginLaunchTimeMap;
      v2->_pluginLaunchTimeMap = v21;

    }
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v23 = objc_claimAutoreleasedReturnValue();
    currentExtensionConsumers = v2->_currentExtensionConsumers;
    v2->_currentExtensionConsumers = (NSHashTable *)v23;

    -[CKBalloonPluginManager setNumberOfSectionsToKeep:](v2, "setNumberOfSectionsToKeep:", 0);
    v2->_appStoreAutoEnableToggled = IMGetDomainBoolForKey();
    if (!init___CKMCEffectiveSettingsChangedNotification)
    {
      v25 = (void **)MEMORY[0x193FF3C24]("MCEffectiveSettingsChangedNotification", CFSTR("ManagedConfiguration"));
      if (v25)
        v26 = *v25;
      else
        v26 = 0;
      objc_storeStrong((id *)&init___CKMCEffectiveSettingsChangedNotification, v26);
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v2, sel_handleManagedConfigSettingsChangeNotification_, init___CKMCEffectiveSettingsChangedNotification, 0);

    -[CKBalloonPluginManager handleManagedConfigSettingsChangeNotification:](v2, "handleManagedConfigSettingsChangeNotification:", 0);
    v28 = (void *)MEMORY[0x1E0C99E60];
    -[CKBalloonPluginManager visibleSwitcherPlugins](v2, "visibleSwitcherPlugins");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "arrayByApplyingSelector:", sel_identifier);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setWithArray:", v30);
    v31 = objc_claimAutoreleasedReturnValue();
    oldVisibleSwitcherPluginIdentifiers = v2->_oldVisibleSwitcherPluginIdentifiers;
    v2->_oldVisibleSwitcherPluginIdentifiers = (NSSet *)v31;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_HealthStickerStatusChanged, -[CKBalloonPluginManager healthKitAchievementAvailabilityChangedNotification](v2, "healthKitAchievementAvailabilityChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "addObserver:selector:name:object:", v2, sel_reloadInstalledApps_, *MEMORY[0x1E0D352C8], 0);

    CKShouldShowSURF();
  }
  return v2;
}

- (void)setNumberOfSectionsToKeep:(int64_t)a3
{
  self->_numberOfSectionsToKeep = a3;
}

- (__CFString)healthKitAchievementAvailabilityChangedNotification
{
  if (healthKitAchievementAvailabilityChangedNotification_onceToken != -1)
    dispatch_once(&healthKitAchievementAvailabilityChangedNotification_onceToken, &__block_literal_global_84_0);
  return (__CFString *)healthKitAchievementAvailabilityChangedNotification_healthActivityNotificationStr;
}

- (void)handleManagedConfigSettingsChangeNotification:(id)a3
{
  _BOOL4 isAppInstallationEnabled;
  _BOOL4 isAppRemovalEnabled;
  int isCameraAllowed;
  void *v7;
  void **v8;
  void *v9;
  void **v10;
  void *v11;
  void **v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  BOOL v17;
  void *v18;
  int v19;
  id v20;

  isAppInstallationEnabled = self->_isAppInstallationEnabled;
  isAppRemovalEnabled = self->_isAppRemovalEnabled;
  isCameraAllowed = self->_isCameraAllowed;
  v7 = (void *)MEMORY[0x193FF3C18](CFSTR("MCProfileConnection"), CFSTR("ManagedConfiguration"), a3);
  if (!handleManagedConfigSettingsChangeNotification____CKMCFeatureAppInstallationAllowed)
  {
    v8 = (void **)MEMORY[0x193FF3C24]("MCFeatureAppInstallationAllowed", CFSTR("ManagedConfiguration"));
    if (v8)
      v9 = *v8;
    else
      v9 = 0;
    objc_storeStrong((id *)&handleManagedConfigSettingsChangeNotification____CKMCFeatureAppInstallationAllowed, v9);
  }
  if (!handleManagedConfigSettingsChangeNotification____CKMCFeatureAppRemovalAllowed)
  {
    v10 = (void **)MEMORY[0x193FF3C24]("MCFeatureAppRemovalAllowed", CFSTR("ManagedConfiguration"));
    if (v10)
      v11 = *v10;
    else
      v11 = 0;
    objc_storeStrong((id *)&handleManagedConfigSettingsChangeNotification____CKMCFeatureAppRemovalAllowed, v11);
  }
  if (!handleManagedConfigSettingsChangeNotification____CKMCFeatureCameraAllowed)
  {
    v12 = (void **)MEMORY[0x193FF3C24]("MCFeatureCameraAllowed", CFSTR("ManagedConfiguration"));
    if (v12)
      v13 = *v12;
    else
      v13 = 0;
    objc_storeStrong((id *)&handleManagedConfigSettingsChangeNotification____CKMCFeatureCameraAllowed, v13);
  }
  objc_msgSend(v7, "sharedConnection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "effectiveBoolValueForSetting:", handleManagedConfigSettingsChangeNotification____CKMCFeatureAppInstallationAllowed) != 2;

  self->_isAppInstallationEnabled = v15;
  objc_msgSend(v7, "sharedConnection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "effectiveBoolValueForSetting:", handleManagedConfigSettingsChangeNotification____CKMCFeatureAppRemovalAllowed) != 2;

  self->_isAppRemovalEnabled = v17;
  objc_msgSend(v7, "sharedConnection");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "effectiveBoolValueForSetting:", handleManagedConfigSettingsChangeNotification____CKMCFeatureCameraAllowed) != 2;

  self->_isCameraAllowed = v19;
  if (isAppInstallationEnabled != self->_isAppInstallationEnabled
    || isAppRemovalEnabled != self->_isAppRemovalEnabled
    || isCameraAllowed != v19)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("CKBrowserSelectionControllerDataSourceChangedNotification"), 0);

  }
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v3) & 1) != 0)
      goto LABEL_3;
LABEL_5:
    IMBalloonExtensionIDWithSuffix();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "isEqualToString:", v7);

    goto LABEL_6;
  }
  if (objc_msgSend(v4, "section"))
    goto LABEL_5;
LABEL_3:
  v6 = 1;
LABEL_6:

  return v6;
}

- (NSArray)visiblePlugins
{
  NSArray *v3;
  NSArray *visiblePlugins;
  _QWORD v6[5];

  if (!self->_visiblePlugins)
  {
    if (__CurrentTestName)
    {
      -[CKBalloonPluginManager createFakeAppsForPPTTesting:](self, "createFakeAppsForPPTTesting:", 60);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __40__CKBalloonPluginManager_visiblePlugins__block_invoke;
      v6[3] = &unk_1E2750228;
      v6[4] = self;
      -[CKBalloonPluginManager allPluginsPassingTest:](self, "allPluginsPassingTest:", v6);
      v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    }
    visiblePlugins = self->_visiblePlugins;
    self->_visiblePlugins = v3;

  }
  return self->_visiblePlugins;
}

- (id)allPluginsPassingTest:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKBalloonPluginManager allPlugins](self, "allPlugins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)orderedPlugins:(BOOL)a3
{
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  uint64_t v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t j;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  BOOL v74;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id obj;
  id v84;
  _QWORD v85[5];
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  id v90;
  _QWORD v91[4];
  id v92;
  id v93;
  id v94;
  _QWORD v95[4];
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  id v106;
  id v107;
  _QWORD v108[5];
  id v109;
  id v110;
  id v111;
  _QWORD v112[4];
  id v113;
  _BYTE v114[128];
  _BYTE v115[128];
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  -[CKBalloonPluginManager cachedPotentiallyVisiblePlugins](self, "cachedPotentiallyVisiblePlugins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (__CurrentTestName)
    v6 = v5 == 0;
  else
    v6 = 0;
  if (v6)
  {
    -[CKBalloonPluginManager visiblePlugins](self, "visiblePlugins");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonPluginManager setCachedPotentiallyVisiblePlugins:](self, "setCachedPotentiallyVisiblePlugins:", v18);

  }
  else if (!v5)
  {
    -[CKBalloonPluginManager allPotentiallyVisiblePlugins](self, "allPotentiallyVisiblePlugins");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBalloonPluginManager defaultFavoritePlugins](CKBalloonPluginManager, "defaultFavoritePlugins");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKBalloonPluginManager morePlugin](CKBalloonPluginManager, "morePlugin");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v9)
    {
      if (objc_msgSend(v7, "count"))
        goto LABEL_19;
      goto LABEL_52;
    }
    objc_msgSend(v10, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v12, "isEqualToString:", v13) & 1) == 0 && !__CurrentTestName)
    {
      v14 = objc_msgSend(v7, "count");

      if (!v14)
        goto LABEL_12;
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("More plugin was not found last in visible plugins list! Found %@ instead."), v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "raise");
    }

LABEL_12:
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "subarrayWithRange:", 0, objc_msgSend(v7, "count") - 1);
      v17 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v17;
LABEL_19:
      v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v24 = MEMORY[0x1E0C809B0];
      v112[0] = MEMORY[0x1E0C809B0];
      v112[1] = 3221225472;
      v112[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke;
      v112[3] = &unk_1E2750228;
      v78 = v23;
      v113 = v78;
      objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v112);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonPluginManager pluginIndexPathMap](self, "pluginIndexPathMap");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonPluginManager historicalPluginIndexPathMap](self, "historicalPluginIndexPathMap");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v24;
      v108[1] = 3221225472;
      v108[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_2;
      v108[3] = &unk_1E27555D0;
      v108[4] = self;
      v29 = v27;
      v109 = v29;
      v30 = v28;
      v110 = v30;
      v70 = v26;
      v71 = v25;
      v111 = v70;
      objc_msgSend(v25, "sortedArrayUsingComparator:", v108);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "mutableCopy");

      objc_msgSend(v32, "__imArrayByFilteringWithBlock:", &__block_literal_global_65_1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "firstObject");
      v34 = objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        objc_msgSend(v32, "removeObject:", v34);
        objc_msgSend(v32, "insertObject:atIndex:", v34, 0);
      }
      v77 = (void *)v34;
      v73 = v11;
      v74 = a3;
      objc_msgSend(v32, "__imArrayByFilteringWithBlock:", &__block_literal_global_66_1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "firstObject");
      v36 = objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v32, "removeObject:", v36);
        objc_msgSend(v32, "insertObject:atIndex:", v36, 0);
      }
      v75 = (void *)v36;
      v72 = v9;
      v105[0] = MEMORY[0x1E0C809B0];
      v105[1] = 3221225472;
      v105[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_5;
      v105[3] = &unk_1E2755638;
      v37 = v29;
      v106 = v37;
      v84 = v8;
      v107 = v84;
      objc_msgSend(v32, "__imArrayByFilteringWithBlock:", v105);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = v32;
      objc_msgSend(v32, "arrayByExcludingObjectsInArray:", v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v40 = objc_claimAutoreleasedReturnValue();
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      obj = v39;
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
      if (v41)
      {
        v42 = v41;
        v43 = *(_QWORD *)v102;
        do
        {
          for (i = 0; i != v42; ++i)
          {
            if (*(_QWORD *)v102 != v43)
              objc_enumerationMutation(obj);
            v45 = *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * i);
            if (!-[CKBalloonPluginManager _addPluginToRecentsFrontIfNeeded:frontOfRecents:pluginMap:fallbackMap:](self, "_addPluginToRecentsFrontIfNeeded:frontOfRecents:pluginMap:fallbackMap:", v45, v40, v37, v30))objc_msgSend(v80, "addObject:", v45);
          }
          v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
        }
        while (v42);
      }
      v76 = (void *)v40;
      v69 = v30;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v97 = 0u;
      v98 = 0u;
      v99 = 0u;
      v100 = 0u;
      v82 = v38;
      v48 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
      if (v48)
      {
        v49 = v48;
        v50 = *(_QWORD *)v98;
        do
        {
          for (j = 0; j != v49; ++j)
          {
            if (*(_QWORD *)v98 != v50)
              objc_enumerationMutation(v82);
            v52 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * j);
            objc_msgSend(v52, "identifier");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", v53);
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = v54;
            if (!v54
              || objc_msgSend(v54, "section") == 0x7FFFFFFFFFFFFFFFLL
              || (v56 = objc_msgSend(v55, "item"), v57 = v79, v56 == 0x7FFFFFFFFFFFFFFFLL))
            {
              if (objc_msgSend(v84, "containsObject:", v53))
                v57 = v47;
              else
                v57 = v46;
            }
            objc_msgSend(v57, "addObject:", v52);

          }
          v49 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
        }
        while (v49);
      }

      if (objc_msgSend(v47, "count"))
      {
        v58 = MEMORY[0x1E0C809B0];
        v95[0] = MEMORY[0x1E0C809B0];
        v95[1] = 3221225472;
        v95[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_6;
        v95[3] = &unk_1E2755660;
        v96 = v84;
        objc_msgSend(v47, "sortedArrayUsingComparator:", v95);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v91[0] = v58;
        v91[1] = 3221225472;
        v91[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_7;
        v91[3] = &unk_1E2755688;
        v92 = v75;
        v93 = v77;
        v94 = v79;
        objc_msgSend(v59, "enumerateObjectsUsingBlock:", v91);

      }
      objc_msgSend(v79, "addObjectsFromArray:", v46);
      objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, objc_msgSend(v76, "count"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "insertObjects:atIndexes:", v76, v60);

      v61 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(v61, "addObjectsFromArray:", v79);
      -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonPluginManager filteredArrayOfInstallationsThatShouldBeVisible:](self, "filteredArrayOfInstallationsThatShouldBeVisible:", v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "addObjectsFromArray:", v63);

      objc_msgSend(v61, "addObjectsFromArray:", v80);
      objc_msgSend(v61, "addObjectsFromArray:", v78);
      a3 = v74;
      if (v72)
        objc_msgSend(v61, "addObject:", v72);
      v64 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v61, "count"));
      v86[0] = MEMORY[0x1E0C809B0];
      v86[1] = 3221225472;
      v86[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_8;
      v86[3] = &unk_1E27556B0;
      v87 = v79;
      v88 = v80;
      v89 = v72;
      v65 = v64;
      v90 = v65;
      v66 = v72;
      v81 = v80;
      v67 = v79;
      objc_msgSend(v61, "enumerateObjectsUsingBlock:", v86);
      if (-[CKBalloonPluginManager hasLoadedExtensions](self, "hasLoadedExtensions"))
      {
        -[CKBalloonPluginManager setPluginIndexPathMap:](self, "setPluginIndexPathMap:", v65);
        -[CKBalloonPluginManager saveWithNotification:](self, "saveWithNotification:", 0);
      }
      -[CKBalloonPluginManager setCachedPotentiallyVisiblePlugins:](self, "setCachedPotentiallyVisiblePlugins:", v61);

      goto LABEL_15;
    }
LABEL_52:

    v20 = (void *)MEMORY[0x1E0C9AA60];
    return v20;
  }
LABEL_15:
  -[CKBalloonPluginManager cachedPotentiallyVisiblePlugins](self, "cachedPotentiallyVisiblePlugins");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (!a3)
  {
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_9;
    v85[3] = &unk_1E27556D8;
    v85[4] = self;
    objc_msgSend(v19, "__imArrayByFilteringWithBlock:", v85);
    v21 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v21;
  }
  return v20;
}

- (BOOL)_addPluginToRecentsFrontIfNeeded:(id)a3 frontOfRecents:(id)a4 pluginMap:(id)a5 fallbackMap:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a5;
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonPluginManager _pluginIndexPathForFavoritePluginWithIdentifier:pluginMap:fallbackMap:](self, "_pluginIndexPathForFavoritePluginWithIdentifier:pluginMap:fallbackMap:", v14, v13, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    objc_msgSend(v11, "addObject:", v10);

  return v15 == 0;
}

- (NSArray)cachedPotentiallyVisiblePlugins
{
  return self->_cachedPotentiallyVisiblePlugins;
}

- (void)saveWithNotification:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[16];
  uint8_t v17[16];

  v3 = a3;
  if (!CKIsRunningInCameraAppsClient())
  {
    v5 = -[CKBalloonPluginManager hasLoadedExtensions](self, "hasLoadedExtensions");
    v6 = IMOSLoggingEnabled();
    if (!v5)
    {
      if (!v6)
        return;
      OSLogHandleForIMFoundationCategory();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Not saving to defaults as extensions haven't finished loading, we'd possible be stomping over user info", v17, 2u);
      }
      goto LABEL_16;
    }
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Saving enabled states and ordering to user defaults.", buf, 2u);
      }

    }
    -[CKBalloonPluginManager pluginIndexPathMap](self, "pluginIndexPathMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonPluginManager _encodeIndexPathMap:](self, "_encodeIndexPathMap:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

    -[CKBalloonPluginManager pluginVersionMap](self, "pluginVersionMap");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

    -[CKBalloonPluginManager pluginSeenMap](self, "pluginSeenMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

    -[CKBalloonPluginManager pluginLaunchTimeMap](self, "pluginLaunchTimeMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

    if (v3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Broadcasting browser selection data source changed notification.", v15, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v14 = objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:](v14, "postNotificationName:object:", CFSTR("CKBrowserSelectionControllerDataSourceChangedNotification"), 0);
LABEL_16:

    }
  }
}

- (BOOL)hasLoadedExtensions
{
  NSArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  BOOL v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v2 = self->_allPlugins;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v17;
    v6 = *MEMORY[0x1E0D38278];
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "extension", (_QWORD)v16);
          v9 = objc_claimAutoreleasedReturnValue();
          if (v9)
          {
            v10 = (void *)v9;
            objc_msgSend(v8, "extension");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "extensionPointIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = objc_msgSend(v12, "isEqualToString:", v6);

            if ((v13 & 1) != 0)
            {
              v14 = 1;
              goto LABEL_13;
            }
          }
        }
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_13:

  return v14;
}

- (id)filteredArrayOfInstallationsThatShouldBeVisible:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  -[CKBalloonPluginManager visiblePlugins](self, "visiblePlugins");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "__imArrayByApplyingBlock:", &__block_literal_global_110);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __104__CKBalloonPluginManager_CKBrowserSelectionController__filteredArrayOfInstallationsThatShouldBeVisible___block_invoke_2;
  v12[3] = &unk_1E27555A8;
  v13 = v8;
  v9 = v8;
  objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)allPotentiallyVisiblePlugins
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __84__CKBalloonPluginManager_CKBrowserSelectionController__allPotentiallyVisiblePlugins__block_invoke;
  v3[3] = &unk_1E2750228;
  v3[4] = self;
  -[CKBalloonPluginManager allPluginsPassingTest:](self, "allPluginsPassingTest:", v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)visibleSwitcherPlugins
{
  NSArray *visibleSwitcherPlugins;
  NSArray *v4;
  NSArray *v5;
  void *v6;
  void *v7;
  int v8;
  NSArray *v9;
  NSArray *v10;

  visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
  if (!visibleSwitcherPlugins)
  {
    -[CKBalloonPluginManager visibleDrawerPlugins](self, "visibleDrawerPlugins");
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_visibleSwitcherPlugins;
    self->_visibleSwitcherPlugins = v4;

    -[NSArray lastObject](self->_visibleSwitcherPlugins, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.messages.browser.MorePlugin"));

    visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
    if (v8)
    {
      -[NSArray subarrayWithRange:](visibleSwitcherPlugins, "subarrayWithRange:", 0, -[NSArray count](self->_visibleSwitcherPlugins, "count") - 1);
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v10 = self->_visibleSwitcherPlugins;
      self->_visibleSwitcherPlugins = v9;

      visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
    }
  }
  return visibleSwitcherPlugins;
}

- (NSArray)visibleDrawerPlugins
{
  NSArray *visibleAppStripPlugins;
  void *v4;
  void *v5;
  NSArray *v6;
  NSArray *v7;

  visibleAppStripPlugins = self->_visibleAppStripPlugins;
  if (!visibleAppStripPlugins)
  {
    -[CKBalloonPluginManager visibleFavoriteAppStripPlugins](self, "visibleFavoriteAppStripPlugins");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonPluginManager visibleRecentAppStripPlugins](self, "visibleRecentAppStripPlugins");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v7 = self->_visibleAppStripPlugins;
    self->_visibleAppStripPlugins = v6;

    visibleAppStripPlugins = self->_visibleAppStripPlugins;
  }
  return visibleAppStripPlugins;
}

- (NSArray)visibleRecentAppStripPlugins
{
  NSArray *visibleRecentAppStripPlugins;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSArray *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSArray *v21;

  visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
  if (!visibleRecentAppStripPlugins)
  {
    -[CKBalloonPluginManager recentAppStripPlugins](self, "recentAppStripPlugins");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "suggestedAppStripLimit");

    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "suggestedMinimumRecentsCount");

    -[CKBalloonPluginManager visibleFavoriteAppStripPlugins](self, "visibleFavoriteAppStripPlugins");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    v11 = objc_msgSend(v4, "count");
    v12 = v6 - v10;
    if (v6 - v10 <= v8)
      v12 = v8;
    if (v12 >= v11)
      v13 = v11;
    else
      v13 = v12;
    objc_msgSend(v4, "subarrayWithRange:", 0, v13);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    -[NSArray lastObject](v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("com.apple.messages.browser.MorePlugin")) ^ 1;

    }
    else
    {
      v17 = 1;
    }
    objc_msgSend((id)objc_opt_class(), "morePlugin");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v17 && v18)
    {
      -[NSArray arrayByAddingObject:](v14, "arrayByAddingObject:", v18);
      v20 = objc_claimAutoreleasedReturnValue();

      v14 = (NSArray *)v20;
    }
    v21 = self->_visibleRecentAppStripPlugins;
    self->_visibleRecentAppStripPlugins = v14;

    visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
  }
  return visibleRecentAppStripPlugins;
}

- (NSArray)visibleFavoriteAppStripPlugins
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[CKBalloonPluginManager favoriteAppStripPlugins](self, "favoriteAppStripPlugins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[CKBalloonPluginManager candidateAppStripPlugins](self, "candidateAppStripPlugins");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[CKBalloonPluginManager pluginIndexPathMap](self, "pluginIndexPathMap");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 && !objc_msgSend(v12, "section"))
              objc_msgSend(v14, "addObject:", v9);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    -[CKBalloonPluginManager setFavoriteAppStripPlugins:](self, "setFavoriteAppStripPlugins:", v14);
  }
  -[CKBalloonPluginManager favoriteAppStripPlugins](self, "favoriteAppStripPlugins");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)favoriteAppStripPlugins
{
  return self->_favoriteAppStripPlugins;
}

- (void)setFavoriteAppStripPlugins:(id)a3
{
  objc_storeStrong((id *)&self->_favoriteAppStripPlugins, a3);
}

- (NSArray)recentAppStripPlugins
{
  NSArray *recentAppStripPlugins;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *v13;
  NSArray *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  recentAppStripPlugins = self->_recentAppStripPlugins;
  if (!recentAppStripPlugins)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[CKBalloonPluginManager candidateAppStripPlugins](self, "candidateAppStripPlugins");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[CKBalloonPluginManager pluginIndexPathMap](self, "pluginIndexPathMap");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "identifier");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKey:", v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12 || objc_msgSend(v12, "section") == 1)
              -[NSArray addObject:](v15, "addObject:", v9);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    v13 = self->_recentAppStripPlugins;
    self->_recentAppStripPlugins = v15;

    recentAppStripPlugins = self->_recentAppStripPlugins;
  }
  return recentAppStripPlugins;
}

- (NSDictionary)pluginIndexPathMap
{
  NSDictionary *pluginIndexPathMap;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  pluginIndexPathMap = self->_pluginIndexPathMap;
  if (!pluginIndexPathMap)
  {
    MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerIndexPathDictionaryV3Key"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerIndexPathDictionaryV2Key"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerIndexPathDictionaryV1Key"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    -[CKBalloonPluginManager _decodeIndexPathMap:allowMigration:](self, "_decodeIndexPathMap:allowMigration:", v4, 1);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_pluginIndexPathMap;
    self->_pluginIndexPathMap = v5;

    -[CKBalloonPluginManager _updateHistoricalPluginIndexPathMap](self, "_updateHistoricalPluginIndexPathMap");
    pluginIndexPathMap = self->_pluginIndexPathMap;
  }
  return pluginIndexPathMap;
}

- (id)candidateAppStripPlugins
{
  NSArray *appStripCandidatePlugins;
  NSArray *visibleAppStripPlugins;
  NSArray *visibleSwitcherPlugins;
  NSArray *recentAppStripPlugins;
  NSArray *visibleRecentAppStripPlugins;
  NSArray *v8;
  NSArray *v9;

  appStripCandidatePlugins = self->_appStripCandidatePlugins;
  if (!appStripCandidatePlugins)
  {
    visibleAppStripPlugins = self->_visibleAppStripPlugins;
    self->_visibleAppStripPlugins = 0;

    visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
    self->_visibleSwitcherPlugins = 0;

    -[CKBalloonPluginManager setFavoriteAppStripPlugins:](self, "setFavoriteAppStripPlugins:", 0);
    recentAppStripPlugins = self->_recentAppStripPlugins;
    self->_recentAppStripPlugins = 0;

    visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
    self->_visibleRecentAppStripPlugins = 0;

    -[CKBalloonPluginManager orderedPlugins:](self, "orderedPlugins:", 0);
    v8 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v9 = self->_appStripCandidatePlugins;
    self->_appStripCandidatePlugins = v8;

    appStripCandidatePlugins = self->_appStripCandidatePlugins;
  }
  return appStripCandidatePlugins;
}

- (NSMutableArray)visibleInstallations
{
  return self->_visibleInstallations;
}

- (void)setPluginIndexPathMap:(id)a3
{
  objc_storeStrong((id *)&self->_pluginIndexPathMap, a3);
}

- (void)setCachedPotentiallyVisiblePlugins:(id)a3
{
  objc_storeStrong((id *)&self->_cachedPotentiallyVisiblePlugins, a3);
}

- (NSDictionary)pluginVersionMap
{
  return self->_pluginVersionMap;
}

- (NSDictionary)pluginLaunchTimeMap
{
  return self->_pluginLaunchTimeMap;
}

- (NSDictionary)combinedStickersAppsIndexPathMap
{
  NSDictionary *combinedStickersAppsIndexPathMap;
  void *v4;
  NSDictionary *v5;
  NSDictionary *v6;

  combinedStickersAppsIndexPathMap = self->_combinedStickersAppsIndexPathMap;
  if (!combinedStickersAppsIndexPathMap)
  {
    MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKCombinedStickerAppsIndexPathDictionaryV1Key"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonPluginManager _decodeIndexPathMap:allowMigration:](self, "_decodeIndexPathMap:allowMigration:", v4, 0);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v6 = self->_combinedStickersAppsIndexPathMap;
    self->_combinedStickersAppsIndexPathMap = v5;

    combinedStickersAppsIndexPathMap = self->_combinedStickersAppsIndexPathMap;
  }
  return combinedStickersAppsIndexPathMap;
}

- (void)_updateHistoricalPluginIndexPathMap
{
  void *v3;
  id v4;
  id v5;

  -[CKBalloonPluginManager historicalPluginIndexPathMap](self, "historicalPluginIndexPathMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKBalloonPluginManager setHistoricalPluginIndexPathMap:](self, "setHistoricalPluginIndexPathMap:", v4);

  }
  if (self->_pluginIndexPathMap)
  {
    -[CKBalloonPluginManager historicalPluginIndexPathMap](self, "historicalPluginIndexPathMap");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addEntriesFromDictionary:", self->_pluginIndexPathMap);

  }
}

- (NSMutableDictionary)historicalPluginIndexPathMap
{
  return self->_historicalPluginIndexPathMap;
}

- (void)setHistoricalPluginIndexPathMap:(id)a3
{
  objc_storeStrong((id *)&self->_historicalPluginIndexPathMap, a3);
}

- (id)_encodeIndexPathMap:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  id v19;
  __CFString *v20;
  id v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v19 = v3;
    v4 = v3;
    v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v22)
    {
      v5 = *(_QWORD *)v24;
      v6 = 0x1E0CB3000uLL;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v24 != v5)
            objc_enumerationMutation(v4);
          v8 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = *(void **)(v6 + 2368);
          v11 = objc_msgSend(v9, "section");
          v12 = &stru_1E276D870;
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "section"));
            v12 = (const __CFString *)objc_claimAutoreleasedReturnValue();
            v20 = (__CFString *)v12;
          }
          if (objc_msgSend(v9, "item") == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v10, "stringWithFormat:", CFSTR("%@,%@"), v12, &stru_1E276D870);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v14 = v6;
            v15 = v4;
            v16 = v5;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v9, "item"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "stringWithFormat:", CFSTR("%@,%@"), v12, v17);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v5 = v16;
            v4 = v15;
            v6 = v14;
          }
          if (v11 != 0x7FFFFFFFFFFFFFFFLL)

          objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, v8);
        }
        v22 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v22);
    }

    v3 = v19;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_2(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;

  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pluginIndexPathForFavoritePluginWithIdentifier:pluginMap:fallbackMap:", v7, a1[5], a1[6]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v9 = (void *)a1[7];
  v10 = v9;

  v11 = (void *)a1[4];
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_pluginIndexPathForFavoritePluginWithIdentifier:pluginMap:fallbackMap:", v12, a1[5], a1[6]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v14 = (void *)a1[7];
  v15 = v14;

  v16 = objc_msgSend(v10, "compare:", v15);
  return v16;
}

- (id)_pluginIndexPathForFavoritePluginWithIdentifier:(id)a3 pluginMap:(id)a4 fallbackMap:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a3;
  v8 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9 || objc_msgSend(v9, "section") == 0x7FFFFFFFFFFFFFFFLL || objc_msgSend(v10, "item") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11
      || objc_msgSend(v11, "section") == 0x7FFFFFFFFFFFFFFFLL
      || objc_msgSend(v11, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = 0;
    }
    else
    {
      v10 = v11;
    }
  }
  else
  {
    v11 = v10;
  }
  v12 = v10;

  return v12;
}

+ (id)defaultFavoritePlugins
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[17];

  v19[15] = *MEMORY[0x1E0C80C00];
  IMBalloonExtensionIDWithSuffix();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0D37568];
  v19[0] = v18;
  v19[1] = v2;
  IMBalloonExtensionIDWithSuffix();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v17;
  IMBalloonExtensionIDWithSuffix();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v16;
  IMBalloonExtensionIDWithSuffix();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[4] = v15;
  IMBalloonExtensionIDWithSuffix();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v3;
  IMBalloonExtensionIDWithSuffix();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v19[6] = v4;
  IMBalloonExtensionIDWithSuffix();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19[7] = v5;
  IMBalloonExtensionIDWithSuffix();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[8] = v6;
  IMBalloonExtensionIDWithSuffix();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[9] = v7;
  IMBalloonExtensionIDWithSuffix();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[10] = v8;
  IMBalloonExtensionIDWithSuffix();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[11] = v9;
  IMBalloonExtensionIDWithSuffix();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[12] = v10;
  IMBalloonExtensionIDWithSuffix();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *MEMORY[0x1E0D37588];
  v19[13] = v11;
  v19[14] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__CKBalloonPluginManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_3 != -1)
    dispatch_once(&sharedInstance_onceToken_3, block);
  return (id)__sharedDataSource;
}

- (NSCache)iconCache
{
  NSCache *iconCache;
  NSCache *v4;
  NSCache *v5;

  iconCache = self->_iconCache;
  if (!iconCache)
  {
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v5 = self->_iconCache;
    self->_iconCache = v4;

    -[NSCache setName:](self->_iconCache, "setName:", CFSTR("CKBalloonPluginManager icon cache"));
    iconCache = self->_iconCache;
  }
  return iconCache;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  v4 = objc_msgSend(v3, "isEnabled");
  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return v4;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

void __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_8(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_14;
  v3 = (id *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v11) & 1) != 0)
  {
    v4 = &CKAppStripFavoritesSection;
    goto LABEL_6;
  }
  v3 = (id *)(a1 + 40);
  if ((objc_msgSend(*(id *)(a1 + 40), "containsObject:", v11) & 1) != 0)
  {
    v4 = &CKAppStripRecentsSection;
LABEL_6:
    v5 = *v4;
    v6 = objc_msgSend(*v3, "indexOfObject:", v11);
    if (v5 != 0x7FFFFFFFFFFFFFFFLL && v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(void **)(a1 + 56);
      objc_msgSend(v11, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

LABEL_11:
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  if (objc_msgSend(v11, "isEnabled") && *(id *)(a1 + 48) == v11)
  {
    objc_msgSend(v11, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _IMWarn();
    goto LABEL_11;
  }
LABEL_14:

}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToIgnoringCase:", *MEMORY[0x1E0D37568]);

  return v3;
}

void __36__CKBalloonPluginManager_morePlugin__block_invoke()
{
  CKMoreBrowserPlugin *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  if (!CKIsRunningInCameraAppsClient())
  {
    v0 = [CKMoreBrowserPlugin alloc];
    CKFrameworkBundle();
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("MORE"), &stru_1E276D870, CFSTR("ChatKit"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = -[IMBalloonBrowserPlugin initWithIdentifier:browserDisplayName:browserImageName:browserClass:presentationContext:](v0, "initWithIdentifier:browserDisplayName:browserImageName:browserClass:presentationContext:", CFSTR("com.apple.messages.browser.MorePlugin"), v1, CFSTR("MoreIcon"), objc_opt_class(), 1);
    v3 = (void *)morePlugin_sMorePlugin;
    morePlugin_sMorePlugin = v2;

  }
}

void __38__CKBalloonPluginManager_recentPlugin__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0D35758]);
  CKFrameworkBundle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("RECENTS"), &stru_1E276D870, CFSTR("ChatKit"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithIdentifier:browserDisplayName:browserImageName:browserClass:presentationContext:", CFSTR("com.apple.messages.browser.RecentPlugin"), v1, &stru_1E276D870, objc_opt_class(), 1);
  v3 = (void *)recentPlugin_sRecentsPlugin;
  recentPlugin_sRecentsPlugin = v2;

}

CFStringRef __77__CKBalloonPluginManager_healthKitAchievementAvailabilityChangedNotification__block_invoke()
{
  const char *v0;
  CFStringRef result;

  v0 = (const char *)MEMORY[0x193FF3C24]("kHKAchievementStickerAvailbilityDidChangeNotification", CFSTR("HealthKit"));
  result = CFStringCreateWithCString(0, v0, 0x8000100u);
  healthKitAchievementAvailabilityChangedNotification_healthActivityNotificationStr = (uint64_t)result;
  return result;
}

+ (id)sharedInstanceIfInitialized
{
  return (id)__sharedDataSource;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  +[CKAppInstallationWatcher sharedInstance](CKAppInstallationWatcher, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, -[CKBalloonPluginManager healthKitAchievementAvailabilityChangedNotification](self, "healthKitAchievementAvailabilityChangedNotification"), 0);
  v6.receiver = self;
  v6.super_class = (Class)CKBalloonPluginManager;
  -[CKBalloonPluginManager dealloc](&v6, sel_dealloc);
}

- (void)addExtensionConsumer:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CKBalloonPluginManager currentExtensionConsumers](self, "currentExtensionConsumers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

}

- (void)refreshPlugins
{
  NSObject *v3;
  NSArray *allPlugins;
  NSArray *cachedPotentiallyVisiblePlugins;
  NSArray *visiblePlugins;
  NSArray *appStripCandidatePlugins;
  NSArray *visibleAppStripPlugins;
  NSArray *visibleSwitcherPlugins;
  NSArray *favoriteAppStripPlugins;
  NSArray *recentAppStripPlugins;
  NSArray *visibleRecentAppStripPlugins;
  NSDictionary *combinedStickersAppsIndexPathMap;
  uint8_t v14[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Resetting plugins, will fetch from plugin manager next request.", v14, 2u);
    }

  }
  allPlugins = self->_allPlugins;
  self->_allPlugins = 0;

  cachedPotentiallyVisiblePlugins = self->_cachedPotentiallyVisiblePlugins;
  self->_cachedPotentiallyVisiblePlugins = 0;

  visiblePlugins = self->_visiblePlugins;
  self->_visiblePlugins = 0;

  appStripCandidatePlugins = self->_appStripCandidatePlugins;
  self->_appStripCandidatePlugins = 0;

  visibleAppStripPlugins = self->_visibleAppStripPlugins;
  self->_visibleAppStripPlugins = 0;

  visibleSwitcherPlugins = self->_visibleSwitcherPlugins;
  self->_visibleSwitcherPlugins = 0;

  favoriteAppStripPlugins = self->_favoriteAppStripPlugins;
  self->_favoriteAppStripPlugins = 0;

  recentAppStripPlugins = self->_recentAppStripPlugins;
  self->_recentAppStripPlugins = 0;

  visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
  self->_visibleRecentAppStripPlugins = 0;

  combinedStickersAppsIndexPathMap = self->_combinedStickersAppsIndexPathMap;
  self->_combinedStickersAppsIndexPathMap = 0;

}

- (void)reloadInstalledApps:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  NSSet *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v22;
  NSSet *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  void *v29;
  NSSet *oldVisibleSwitcherPluginIdentifiers;
  NSSet *v31;
  id v32;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[16];
  _QWORD v48[2];
  _QWORD v49[2];
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Received notification to reload all installed apps from imagent.", buf, 2u);
    }

  }
  -[CKBalloonPluginManager refreshPlugins](self, "refreshPlugins");
  if (-[CKBalloonPluginManager _shouldForceRegenerateIndexPathMap](self, "_shouldForceRegenerateIndexPathMap"))
    -[CKBalloonPluginManager regeneratePluginIndexPaths](self, "regeneratePluginIndexPaths");
  if (-[CKBalloonPluginManager _shouldForceRegenerateStickersIndexPathMap](self, "_shouldForceRegenerateStickersIndexPathMap"))
  {
    -[CKBalloonPluginManager regenerateCombinedStickersAppsIndexPaths](self, "regenerateCombinedStickersAppsIndexPaths");
  }
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Broadcasting browser selection data source changed notification.", buf, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("CKBrowserSelectionControllerDataSourceChangedNotification"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:", CFSTR("CKCombinedStickerAppsOrderChangedNotification"), 0);

  -[CKBalloonPluginManager visibleSwitcherPlugins](self, "visibleSwitcherPlugins");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSSet *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSSet addObject:](v9, "addObject:", v15);

        }
      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v43, v52, 16);
    }
    while (v11);
  }

  if (-[NSSet count](self->_oldVisibleSwitcherPluginIdentifiers, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v17 = self->_oldVisibleSwitcherPluginIdentifiers;
    v18 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
    if (v18)
    {
      v19 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v40 != v19)
            objc_enumerationMutation(v17);
          v21 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
          if (!-[NSSet containsObject:](v9, "containsObject:", v21))
            objc_msgSend(v16, "addObject:", v21);
        }
        v18 = -[NSSet countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v39, v51, 16);
      }
      while (v18);
    }

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = v9;
    v24 = -[NSSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v24; ++k)
        {
          if (*(_QWORD *)v36 != v25)
            objc_enumerationMutation(v23);
          v27 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * k);
          if (!-[NSSet containsObject:](self->_oldVisibleSwitcherPluginIdentifiers, "containsObject:", v27))
            objc_msgSend(v22, "addObject:", v27);
        }
        v24 = -[NSSet countByEnumeratingWithState:objects:count:](v23, "countByEnumeratingWithState:objects:count:", &v35, v50, 16);
      }
      while (v24);
    }

    if (objc_msgSend(v16, "count") || objc_msgSend(v22, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = CFSTR("CKBrowserSelectionControllerInstalledPluginsKey");
      v48[1] = CFSTR("CKBrowserSelectionControllerUninstalledPluginsKey");
      v49[0] = v22;
      v49[1] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("CKBrowserSelectionControllerVisibleSwitcherPluginsChangedNotification"), 0, v29);

    }
  }
  oldVisibleSwitcherPluginIdentifiers = self->_oldVisibleSwitcherPluginIdentifiers;
  self->_oldVisibleSwitcherPluginIdentifiers = v9;
  v31 = v9;

  v32 = -[CKBalloonPluginManager combinedStickersAppsIndexPathMap](self, "combinedStickersAppsIndexPathMap");
  -[CKBalloonPluginManager cleanSeenMap](self, "cleanSeenMap");
  -[CKBalloonPluginManager invalidateIconCache](self, "invalidateIconCache");
  -[CKBalloonPluginManager saveWithNotification:](self, "saveWithNotification:", 0);
  -[CKBalloonPluginManager saveCombinedAppsWithNotification:](self, "saveCombinedAppsWithNotification:", 0);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "postNotificationName:object:userInfo:", CFSTR("CKBrowserSelectionControllerReloadedInstallationsNotification"), 0, 0);
}

- (void)healthStickerStatusChanged
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Broadcasting browser selection data source changed notification due to Health sticker change.", v4, 2u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "postNotificationName:object:", CFSTR("CKBrowserSelectionControllerDataSourceChangedNotification"), 0);

}

- (BOOL)_shouldUninstallContainingBundle:(id)a3
{
  id v3;
  int v4;
  void *v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  int v12;
  id v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "isLaunchProhibited");
  objc_msgSend(v3, "applicationType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CA5830]);

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("NO");
      if (v4)
        v9 = CFSTR("YES");
      else
        v9 = CFSTR("NO");
      v12 = 138413058;
      v13 = v3;
      if (v6)
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      v15 = v9;
      v14 = 2112;
      v16 = 2112;
      if ((v4 & v6) != 0)
        v8 = CFSTR("YES");
      v17 = v10;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "_shouldUninstallContainingBundle containingBundle %@ isMessagesOnly %@ isUserApp %@ shouldUnInstall %@", (uint8_t *)&v12, 0x2Au);
    }

  }
  return v4 & v6;
}

- (void)_addAppWithBalloonIdentifier:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_addAppWithBalloonIdentifier id %@", (uint8_t *)&v8, 0xCu);
      }

    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin")))
    {
      objc_msgSend((id)objc_opt_class(), "recentPlugin");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject app](v6, "app");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIsEnabled:", 1);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject setPluginEnabled:identifier:](v6, "setPluginEnabled:identifier:", 1, v3);
    }
  }
  else
  {
    if (!v4)
      goto LABEL_14;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil idenitifier passed to _addAppWithBalloonIdentifier", (uint8_t *)&v8, 2u);
    }
  }

LABEL_14:
}

- (void)_disableAppWithBalloonIdentifier:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "_disableAppWithBalloonIdentifier id %@", (uint8_t *)&v8, 0xCu);
      }

    }
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin")))
    {
      objc_msgSend((id)objc_opt_class(), "recentPlugin");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject app](v6, "app");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setIsEnabled:", 0);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
      v6 = objc_claimAutoreleasedReturnValue();
      -[NSObject setPluginEnabled:identifier:](v6, "setPluginEnabled:identifier:", 0, v3);
    }
  }
  else
  {
    if (!v4)
      goto LABEL_14;
    OSLogHandleForIMFoundationCategory();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil idenitifier passed to _disableAppWithBalloonIdentifier", (uint8_t *)&v8, 2u);
    }
  }

LABEL_14:
}

- (void)removeAppWithIdentifier:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v4;
        _os_log_impl(&dword_18DFCD000, v6, OS_LOG_TYPE_INFO, "removeAppWithBalloonIdentifier id %@", buf, 0xCu);
      }

    }
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "balloonPluginForBundleID:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin")))
      {
        objc_msgSend((id)objc_opt_class(), "recentPlugin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "app");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "setIsEnabled:", 0);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setPluginEnabled:identifier:", 0, v4);
      }
      goto LABEL_38;
    }
    objc_msgSend(v8, "proxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8
      || ((objc_msgSend(v8, "identifier"),
           v10 = (void *)objc_claimAutoreleasedReturnValue(),
           v11 = objc_msgSend(v10, "isEqualToString:", v4),
           v9)
        ? (v12 = v11)
        : (v12 = 0),
          v10,
          (v12 & 1) == 0))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v27 = v8;
          v28 = 2112;
          v29 = v4;
          v30 = 2112;
          v31 = CFSTR("YES");
          _os_log_impl(&dword_18DFCD000, v24, OS_LOG_TYPE_INFO, "Did not find plugin %@ for identifier %@ isAppExtension %@", buf, 0x20u);
        }

      }
      goto LABEL_38;
    }
    objc_msgSend(v9, "containingBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CKBalloonPluginManager _shouldUninstallContainingBundle:](self, "_shouldUninstallContainingBundle:", v13))
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v13, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v27 = v15;
          _os_log_impl(&dword_18DFCD000, v14, OS_LOG_TYPE_INFO, "Uninstalling app %@", buf, 0xCu);

        }
      }
      v16 = (void *)MEMORY[0x193FF3C18](CFSTR("IXAppInstallCoordinator"), CFSTR("InstallCoordination"));
      if (!v16)
        goto LABEL_37;
      objc_msgSend(v13, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v16, "uninstallAppWithBundleID:error:", v17, &v25);
      v18 = v25;

      if (v18 && IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v13, "bundleIdentifier");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v27 = v20;
          v28 = 2112;
          v29 = v18;
          _os_log_impl(&dword_18DFCD000, v19, OS_LOG_TYPE_INFO, "Error when uninstalling app with bundleID %@ (error: %@)", buf, 0x16u);

        }
      }
      objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removePluginWithBundleID:", v4);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
      v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setPluginEnabled:identifier:", 0, v4);
    }

LABEL_37:
LABEL_38:

    goto LABEL_39;
  }
  if (v5)
  {
    OSLogHandleForIMFoundationCategory();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v22, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil identifier passed to removeAppWithBalloonIdentifier", buf, 2u);
    }

  }
LABEL_39:

}

- (void)deleteAppWithIdentifier:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void (**v9)(void *, _QWORD);
  void *v10;
  char v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  char v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  void (**v31)(void *, _QWORD);
  _QWORD aBlock[4];
  id v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke;
  aBlock[3] = &unk_1E274C308;
  v8 = v6;
  v33 = v8;
  v9 = (void (**)(void *, _QWORD))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isStickersAppEnabled");

  if ((v11 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v25, OS_LOG_TYPE_INFO, "CKBalloonPluginManager trying to call deleteAppWithIdentifier with invalid configuration", buf, 2u);
      }

    }
    goto LABEL_24;
  }
  v12 = IMOSLoggingEnabled();
  if (!v5)
  {
    if (v12)
    {
      OSLogHandleForIMFoundationCategory();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "CKBalloonPluginManager nil identifier passed to deleteAppWithIdentifier", buf, 2u);
      }

    }
LABEL_24:
    v9[2](v9, 0);
    goto LABEL_37;
  }
  if (v12)
  {
    OSLogHandleForIMFoundationCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v5;
      _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "deleteAppWithIdentifier id %@", buf, 0xCu);
    }

  }
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "balloonPluginForBundleID:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "proxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15
      && ((objc_msgSend(v15, "identifier"),
           v17 = (void *)objc_claimAutoreleasedReturnValue(),
           v18 = objc_msgSend(v17, "isEqualToString:", v5),
           v16)
        ? (v19 = v18)
        : (v19 = 0),
          v17,
          (v19 & 1) != 0))
    {
      objc_msgSend(v16, "containingBundle");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v20, "bundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v35 = v22;
          _os_log_impl(&dword_18DFCD000, v21, OS_LOG_TYPE_INFO, "Uninstalling app %@", buf, 0xCu);

        }
      }
      v23 = (void *)MEMORY[0x193FF3C18](CFSTR("IXAppInstallCoordinator"), CFSTR("InstallCoordination"));
      if (v23)
      {
        objc_msgSend(v20, "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = v7;
        v28[1] = 3221225472;
        v28[2] = __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke_102;
        v28[3] = &unk_1E2750188;
        v29 = v20;
        v31 = v9;
        v30 = v5;
        objc_msgSend(v23, "uninstallAppWithBundleID:requestUserConfirmation:completion:", v24, 1, v28);

      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v35 = v15;
          v36 = 2112;
          v37 = v5;
          v38 = 2112;
          v39 = CFSTR("YES");
          _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Did not find plugin %@ for identifier %@ isAppExtension %@", buf, 0x20u);
        }

      }
      v9[2](v9, 0);
    }

  }
LABEL_37:

}

void __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke(uint64_t a1, char a2)
{
  _QWORD v3[4];
  id v4;
  char v5;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke_2;
  v3[3] = &unk_1E274C610;
  v4 = *(id *)(a1 + 32);
  v5 = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __61__CKBalloonPluginManager_deleteAppWithIdentifier_completion___block_invoke_102(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = 138412546;
        v8 = v5;
        v9 = 2112;
        v10 = v3;
        _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Error when uninstalling app with bundleID %@ (error: %@)", (uint8_t *)&v7, 0x16u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removePluginWithBundleID:", *(_QWORD *)(a1 + 40));

    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

- (void)updateInteractionTimeForPlugin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v4 = a3;
    -[CKBalloonPluginManager MRUPluginInteractionList](self, "MRUPluginInteractionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonPluginManager setMRUPluginInteractionList:](self, "setMRUPluginInteractionList:", v6);

    }
    -[CKBalloonPluginManager MRUPluginInteractionList](self, "MRUPluginInteractionList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v4);

    -[CKBalloonPluginManager MRUPluginInteractionList](self, "MRUPluginInteractionList");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertObject:atIndex:", v4, 0);

  }
}

- (void)commitInteractionTimeOrderingChanges
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;

  -[CKBalloonPluginManager MRUPluginInteractionList](self, "MRUPluginInteractionList");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[CKBalloonPluginManager MRUPluginInteractionList](self, "MRUPluginInteractionList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      -[CKBalloonPluginManager recentAppStripPlugins](self, "recentAppStripPlugins");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v7, "mutableCopy");

      -[CKBalloonPluginManager MRUPluginInteractionList](self, "MRUPluginInteractionList");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __62__CKBalloonPluginManager_commitInteractionTimeOrderingChanges__block_invoke;
      v15[3] = &unk_1E27501B0;
      v16 = v8;
      v13 = v8;
      objc_msgSend(v9, "enumerateObjectsWithOptions:usingBlock:", 2, v15);

      v14[0] = v10;
      v14[1] = 3221225472;
      v14[2] = __62__CKBalloonPluginManager_commitInteractionTimeOrderingChanges__block_invoke_2;
      v14[3] = &unk_1E27501D8;
      v14[4] = self;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v14);
      -[CKBalloonPluginManager _updateHistoricalPluginIndexPathMap](self, "_updateHistoricalPluginIndexPathMap");
      -[CKBalloonPluginManager refreshPlugins](self, "refreshPlugins");
      v11 = -[CKBalloonPluginManager visiblePlugins](self, "visiblePlugins");
      -[CKBalloonPluginManager saveWithNotification:](self, "saveWithNotification:", 1);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBalloonPluginManager setMRUPluginInteractionList:](self, "setMRUPluginInteractionList:", v12);

    }
  }
}

void __62__CKBalloonPluginManager_commitInteractionTimeOrderingChanges__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v9, "identifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v3);

        if (v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "removeObject:", v9);
          objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v9, 0);
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

}

void __62__CKBalloonPluginManager_commitInteractionTimeOrderingChanges__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB36B0];
  v6 = a2;
  objc_msgSend(v5, "indexPathForRow:inSection:", a3, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pluginIndexPathMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setValue:forKey:", v9, v8);
}

- (void)setEnabled:(BOOL)a3 forPlugin:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = CFSTR("Disabling");
      if (v4)
        v8 = CFSTR("Enabling");
      v9 = 138412546;
      v10 = v8;
      v11 = 2112;
      v12 = v6;
      _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "%@ plugin %@.", (uint8_t *)&v9, 0x16u);
    }

  }
  if (v4)
    -[CKBalloonPluginManager _addAppWithBalloonIdentifier:](self, "_addAppWithBalloonIdentifier:", v6);
  else
    -[CKBalloonPluginManager _disableAppWithBalloonIdentifier:](self, "_disableAppWithBalloonIdentifier:", v6);

}

- (BOOL)_shouldForceRegenerateIndexPathMap
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;

  MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerIndexPathDictionaryV3Key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = 0;
  }
  else
  {
    MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerIndexPathDictionaryV2Key"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v3 = 0;
    }
    else
    {
      MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKBrowserSelectionControllerIndexPathDictionaryV1Key"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v5 == 0;

    }
  }

  return v3;
}

- (BOOL)_shouldForceRegenerateStickersIndexPathMap
{
  void *v2;
  BOOL v3;

  MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("kCKCombinedStickerAppsIndexPathDictionaryV1Key"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)saveCombinedAppsWithNotification:(BOOL)a3
{
  _BOOL4 v3;
  BOOL v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];
  uint8_t v14[16];

  v3 = a3;
  if (!CKIsRunningInCameraAppsClient())
  {
    v5 = -[CKBalloonPluginManager hasLoadedExtensions](self, "hasLoadedExtensions");
    v6 = IMOSLoggingEnabled();
    if (!v5)
    {
      if (!v6)
        return;
      OSLogHandleForIMFoundationCategory();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_18DFCD000, v11, OS_LOG_TYPE_INFO, "Not saving to combined sticker default as extensions haven't finished loading, we'd possible be stomping over user info", v14, 2u);
      }
      goto LABEL_16;
    }
    if (v6)
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "Saving combined sticker apps ordering to user defaults.", buf, 2u);
      }

    }
    -[CKBalloonPluginManager combinedStickersAppsIndexPathMap](self, "combinedStickersAppsIndexPathMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonPluginManager _encodeIndexPathMap:](self, "_encodeIndexPathMap:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

    if (v3)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Broadcasting combined sticker apps changed notification.", v12, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v11 = objc_claimAutoreleasedReturnValue();
      -[NSObject postNotificationName:object:](v11, "postNotificationName:object:", CFSTR("CKCombinedStickerAppsOrderChangedNotification"), 0);
LABEL_16:

    }
  }
}

- (id)balloonPluginIdentifierForAppExtensionBundleIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D37570]))
  {
    objc_msgSend((id)*MEMORY[0x1E0D375D0], "stringByAppendingFormat:", CFSTR(":%@:%@"), CFSTR("0000000000"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "teamID");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    v8 = CFSTR("0000000000");
    if (v6)
      v8 = (__CFString *)v6;
    v9 = v8;

    objc_msgSend(v5, "bundleIdentifier");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v3;
    v13 = v12;

    objc_msgSend((id)*MEMORY[0x1E0D375D0], "stringByAppendingFormat:", CFSTR(":%@:%@"), v9, v13);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)pluginForExtensionIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__29;
  v16 = __Block_byref_object_dispose__29;
  v17 = 0;
  -[CKBalloonPluginManager allPlugins](self, "allPlugins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__CKBalloonPluginManager_pluginForExtensionIdentifier___block_invoke;
  v9[3] = &unk_1E2750200;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __55__CKBalloonPluginManager_pluginForExtensionIdentifier___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "extensionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)pluginForAdamID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__29;
  v16 = __Block_byref_object_dispose__29;
  v17 = 0;
  -[CKBalloonPluginManager allPlugins](self, "allPlugins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __42__CKBalloonPluginManager_pluginForAdamID___block_invoke;
  v9[3] = &unk_1E2750200;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __42__CKBalloonPluginManager_pluginForAdamID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "adamID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToNumber:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)invalidateIconCache
{
  id v2;

  -[CKBalloonPluginManager iconCache](self, "iconCache");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMutableSet)prefetchIconKeys
{
  NSMutableSet *prefetchIconKeys;
  NSMutableSet *v4;
  NSMutableSet *v5;

  prefetchIconKeys = self->_prefetchIconKeys;
  if (!prefetchIconKeys)
  {
    v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v5 = self->_prefetchIconKeys;
    self->_prefetchIconKeys = v4;

    prefetchIconKeys = self->_prefetchIconKeys;
  }
  return prefetchIconKeys;
}

- (CKPreviewDispatchCache)snapshotCache
{
  CKPreviewDispatchCache *snapshotCache;
  CKPreviewDispatchCache *v4;
  CKPreviewDispatchCache *v5;

  snapshotCache = self->_snapshotCache;
  if (!snapshotCache)
  {
    v4 = objc_alloc_init(CKPreviewDispatchCache);
    v5 = self->_snapshotCache;
    self->_snapshotCache = v4;

    -[CKPreviewDispatchCache resume](self->_snapshotCache, "resume");
    snapshotCache = self->_snapshotCache;
  }
  return snapshotCache;
}

- (void)clearBalloonPluginCache
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  __int128 v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x193FF3624](CFSTR("com.apple.MobileSMS"), CFSTR("LastIconCachePurgeDate"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (v40)
  {
    objc_msgSend(v39, "dateByAddingTimeInterval:", -86400.0);
    v38 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v38;
    if (objc_msgSend(v40, "compare:", v38) == -1)
    {
      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "Clearing the balloon icon cache", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      CKTranscriptPluginIconCachesFileURL();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "enumeratorAtPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "nextObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        *(_QWORD *)&v10 = 138412290;
        v37 = v10;
        do
        {
          v50 = 0u;
          v48 = 0u;
          v49 = 0u;
          v47 = 0u;
          -[CKBalloonPluginManager visibleRecentAppStripPlugins](self, "visibleRecentAppStripPlugins", v37);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
          if (v12)
          {
            v13 = *(_QWORD *)v48;
            while (2)
            {
              for (i = 0; i != v12; ++i)
              {
                if (*(_QWORD *)v48 != v13)
                  objc_enumerationMutation(v11);
                objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "identifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "isEqualToString:", v9);

                if (v16)
                {
                  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  CKTranscriptPluginIconCachesFileURL();
                  v19 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "path");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v20, "stringByAppendingPathComponent:", v9);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  v46 = 0;
                  objc_msgSend(v18, "removeItemAtPath:error:", v21, &v46);
                  v17 = v46;

                  goto LABEL_19;
                }
              }
              v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
              if (v12)
                continue;
              break;
            }
          }
          v17 = 0;
LABEL_19:

          v44 = 0u;
          v45 = 0u;
          v42 = 0u;
          v43 = 0u;
          -[CKBalloonPluginManager visibleFavoriteAppStripPlugins](self, "visibleFavoriteAppStripPlugins");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
          if (v23)
          {
            v24 = *(_QWORD *)v43;
            while (2)
            {
              for (j = 0; j != v23; ++j)
              {
                if (*(_QWORD *)v43 != v24)
                  objc_enumerationMutation(v22);
                objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * j), "identifier");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isEqualToString:", v9);

                if (v27)
                {
                  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  CKTranscriptPluginIconCachesFileURL();
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "path");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "stringByAppendingPathComponent:", v9);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v41 = v17;
                  objc_msgSend(v28, "removeItemAtPath:error:", v31, &v41);
                  v32 = v41;

                  v17 = v32;
                  goto LABEL_29;
                }
              }
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v42, v53, 16);
              if (v23)
                continue;
              break;
            }
          }
LABEL_29:

          if (v17 && IMOSLoggingEnabled())
          {
            OSLogHandleForIMFoundationCategory();
            v33 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v37;
              v52 = v17;
              _os_log_impl(&dword_18DFCD000, v33, OS_LOG_TYPE_INFO, "Error clearing the balloon icon cache folder: %@", buf, 0xCu);
            }

          }
          objc_msgSend(v8, "nextObject");
          v34 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v34;
        }
        while (v34);
      }
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      IMSetDomainValueForKey();

      v3 = (void *)v38;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    IMSetDomainValueForKey();

  }
}

- (NSArray)combinedStickerApps
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v24 = (void *)objc_opt_new();
  v25 = (void *)objc_opt_new();
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allPlugins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v4);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v2;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v28;
    v8 = *MEMORY[0x1E0D37558];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v28 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "presentationContexts");
        objc_msgSend(v10, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "hasSuffix:", CFSTR("com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension")))
        {
          objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isClingEnabled") ^ 1;

        }
        else
        {
          v14 = 0;
        }

        if ((v14 & 1) == 0 && (v11 & 2) != 0)
        {
          objc_msgSend(v10, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "containsString:", CFSTR("com.apple.FunCamera"));

          objc_msgSend(v10, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "containsString:", v8);

          if ((v16 & 1) == 0 && (v18 & 1) == 0)
          {
            objc_msgSend(v10, "identifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "hasSuffix:", CFSTR("com.apple.messages.MSMessageExtensionBalloonPlugin:0000000000:com.apple.Stickers.UserGenerated.MessagesExtension"));

            if ((v20 & 1) == 0)
              objc_msgSend(v25, "addObject:", v10);
          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v6);
  }

  objc_msgSend(v24, "addObjectsFromArray:", v25);
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35758]), "initWithIdentifier:browserDisplayName:browserImageName:", CFSTR("com.apple.messages.browser.MorePlugin"), CFSTR("MorePlugin"), CFSTR("ellipsis.circle"));
  objc_msgSend(v24, "addObject:", v21);
  objc_msgSend(v23, "insertPlugin:", v21);

  return (NSArray *)v24;
}

- (NSArray)allEnabledPlugins
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __43__CKBalloonPluginManager_allEnabledPlugins__block_invoke;
  v3[3] = &unk_1E2750228;
  v3[4] = self;
  -[CKBalloonPluginManager allPluginsPassingTest:](self, "allPluginsPassingTest:", v3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __43__CKBalloonPluginManager_allEnabledPlugins__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isPluginEnabled:", v3);

  return v4;
}

- (id)createFakeAppsForPPTTesting:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v5 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%d"), CFSTR("Test"), v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D35758]), "initWithIdentifier:browserDisplayName:browserImageName:", v6, v6, CFSTR("Recents"));
      objc_msgSend(v4, "addObject:", v7);

      ++v5;
    }
    while (a3 != v5);
  }
  return v4;
}

- (NSArray)disabledPlugins
{
  void *v3;
  char v4;
  _QWORD v6[5];

  objc_msgSend(MEMORY[0x1E0D39840], "sharedFeatureFlags");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isClingEnabled");

  if ((v4 & 1) != 0)
    return (NSArray *)MEMORY[0x1E0C9AA60];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __41__CKBalloonPluginManager_disabledPlugins__block_invoke;
  v6[3] = &unk_1E2750228;
  v6[4] = self;
  -[CKBalloonPluginManager allPluginsPassingTest:](self, "allPluginsPassingTest:", v6);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __41__CKBalloonPluginManager_disabledPlugins__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isPluginEnabled:", v3) ^ 1;

  return v4;
}

- (unint64_t)launchStatusForPlugin:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  unint64_t v11;
  NSDictionary *pluginVersionMap;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "proxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containingBundle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA5830]);

    if (v8
      && (objc_msgSend(v4, "version"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D352D0]),
          v9,
          (v10 & 1) == 0))
    {
      pluginVersionMap = self->_pluginVersionMap;
      objc_msgSend(v4, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](pluginVersionMap, "objectForKeyedSubscript:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "version");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "isEqualToString:", v15);

      v11 = v16;
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (void)updateLaunchStatus:(unint64_t)a3 forPlugin:(id)a4 withNotification:(BOOL)a5
{
  _BOOL8 v5;
  NSDictionary *pluginVersionMap;
  id v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *v12;
  id v13;

  if (a3 == 1)
  {
    if (a4)
    {
      v5 = a5;
      pluginVersionMap = self->_pluginVersionMap;
      v8 = a4;
      v13 = (id)-[NSDictionary mutableCopy](pluginVersionMap, "mutableCopy");
      objc_msgSend(v8, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, v10);
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v13);
      v11 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      v12 = self->_pluginVersionMap;
      self->_pluginVersionMap = v11;

      -[CKBalloonPluginManager saveWithNotification:](self, "saveWithNotification:", v5);
    }
  }
}

- (void)updateLaunchTimeForPlugin:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "date");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[CKBalloonPluginManager pluginLaunchTimeMap](self, "pluginLaunchTimeMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v5, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v8);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonPluginManager setPluginLaunchTimeMap:](self, "setPluginLaunchTimeMap:", v9);

  -[CKBalloonPluginManager saveWithNotification:](self, "saveWithNotification:", 0);
}

- (id)launchTimeForPlugin:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.messages.browser.RecentPlugin"));

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CKBalloonPluginManager pluginLaunchTimeMap](self, "pluginLaunchTimeMap");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (unint64_t)badgeValueForPlugin:(id)a3
{
  return 0;
}

- (BOOL)isPluginSeen:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CKBalloonPluginManager pluginSeenMap](self, "pluginSeenMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (BOOL)isPluginSeenWithInstalledVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  -[CKBalloonPluginManager pluginSeenMap](self, "pluginSeenMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CKBalloonPluginManager pluginForIdentifier:](self, "pluginForIdentifier:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "version");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compare:options:", v6, 64) != 1;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)setSeen:(BOOL)a3 forPlugin:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;

  v4 = a3;
  -[CKBalloonPluginManager pluginForIdentifier:](self, "pluginForIdentifier:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    -[CKBalloonPluginManager _setSeen:forPlugin:](self, "_setSeen:forPlugin:", v4, v6);
    -[CKBalloonPluginManager saveWithNotification:](self, "saveWithNotification:", 0);
    v6 = v7;
  }

}

- (void)cleanSeenMap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  -[CKBalloonPluginManager allPlugins](self, "allPlugins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByApplyingSelector:", sel_identifier);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[CKBalloonPluginManager pluginSeenMap](self, "pluginSeenMap");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "arrayByExcludingObjectsInArray:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[CKBalloonPluginManager pluginSeenMap](self, "pluginSeenMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeObjectsForKeys:", v6);
    v9 = (void *)objc_msgSend(v8, "copy");
    -[CKBalloonPluginManager setPluginSeenMap:](self, "setPluginSeenMap:", v9);

  }
}

- (unint64_t)unseenPluginCount
{
  void *v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[5];

  -[CKBalloonPluginManager allPlugins](self, "allPlugins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CKBalloonPluginManager_unseenPluginCount__block_invoke;
  v7[3] = &unk_1E2750228;
  v7[4] = self;
  objc_msgSend(v3, "__imArrayByFilteringWithBlock:", v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "count");
  return v5;
}

uint64_t __43__CKBalloonPluginManager_unseenPluginCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isPluginSeenWithInstalledVersion:", v5) & 1) != 0)
  {
    isKindOfClass = 0;
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isPluginVisible:", v8))
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }

  }
  return isKindOfClass & 1;
}

- (void)setAppStoreAutoEnableToggled:(BOOL)a3
{
  if (self->_appStoreAutoEnableToggled != a3)
  {
    self->_appStoreAutoEnableToggled = a3;
    -[CKBalloonPluginManager isAppStoreAutoEnableToggled](self, "isAppStoreAutoEnableToggled");
    IMSetDomainBoolForKey();
  }
}

- (NSMutableDictionary)activeBrowsers
{
  NSMutableDictionary *activeBrowsers;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  activeBrowsers = self->_activeBrowsers;
  if (!activeBrowsers)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_activeBrowsers;
    self->_activeBrowsers = v4;

    activeBrowsers = self->_activeBrowsers;
  }
  return activeBrowsers;
}

- (void)setAllPlugins:(id)a3
{
  objc_storeStrong((id *)&self->_allPlugins, a3);
}

- (void)setVisiblePlugins:(id)a3
{
  objc_storeStrong((id *)&self->_visiblePlugins, a3);
}

- (void)setVisibleSwitcherPlugins:(id)a3
{
  objc_storeStrong((id *)&self->_visibleSwitcherPlugins, a3);
}

- (void)setIconCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconCache, a3);
}

- (void)setSnapshotCache:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotCache, a3);
}

- (void)setPrefetchIconKeys:(id)a3
{
  objc_storeStrong((id *)&self->_prefetchIconKeys, a3);
}

- (void)setIsAppInstallationEnabled:(BOOL)a3
{
  self->_isAppInstallationEnabled = a3;
}

- (BOOL)isAppRemovalEnabled
{
  return self->_isAppRemovalEnabled;
}

- (void)setIsAppRemovalEnabled:(BOOL)a3
{
  self->_isAppRemovalEnabled = a3;
}

- (BOOL)isCameraAllowed
{
  return self->_isCameraAllowed;
}

- (void)setIsCameraAllowed:(BOOL)a3
{
  self->_isCameraAllowed = a3;
}

- (BOOL)isAppStoreAutoEnableToggled
{
  return self->_appStoreAutoEnableToggled;
}

- (UIViewController)lastUsedPhotoViewController
{
  return self->_lastUsedPhotoViewController;
}

- (void)setLastUsedPhotoViewController:(id)a3
{
  objc_storeStrong((id *)&self->_lastUsedPhotoViewController, a3);
}

- (NSHashTable)currentExtensionConsumers
{
  return self->_currentExtensionConsumers;
}

- (void)setCurrentExtensionConsumers:(id)a3
{
  objc_storeStrong((id *)&self->_currentExtensionConsumers, a3);
}

- (void)setPluginVersionMap:(id)a3
{
  objc_storeStrong((id *)&self->_pluginVersionMap, a3);
}

- (NSMutableArray)MRUPluginInteractionList
{
  return self->_MRUPluginInteractionList;
}

- (void)setMRUPluginInteractionList:(id)a3
{
  objc_storeStrong((id *)&self->_MRUPluginInteractionList, a3);
}

- (void)setPluginLaunchTimeMap:(id)a3
{
  objc_storeStrong((id *)&self->_pluginLaunchTimeMap, a3);
}

- (void)setCombinedStickersAppsIndexPathMap:(id)a3
{
  objc_storeStrong((id *)&self->_combinedStickersAppsIndexPathMap, a3);
}

- (BOOL)isKeepingEmptySections
{
  return self->_keepingEmptySections;
}

- (void)setKeepingEmptySections:(BOOL)a3
{
  self->_keepingEmptySections = a3;
}

- (int64_t)numberOfSectionsToKeep
{
  return self->_numberOfSectionsToKeep;
}

- (void)setVisibleInstallations:(id)a3
{
  objc_storeStrong((id *)&self->_visibleInstallations, a3);
}

- (BOOL)isAppInstallationObserver
{
  return self->_isAppInstallationObserver;
}

- (void)setIsAppInstallationObserver:(BOOL)a3
{
  self->_isAppInstallationObserver = a3;
}

- (NSSet)oldVisibleSwitcherPluginIdentifiers
{
  return self->_oldVisibleSwitcherPluginIdentifiers;
}

- (void)setOldVisibleSwitcherPluginIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_oldVisibleSwitcherPluginIdentifiers, a3);
}

- (void)setActiveBrowsers:(id)a3
{
  objc_storeStrong((id *)&self->_activeBrowsers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeBrowsers, 0);
  objc_storeStrong((id *)&self->_oldVisibleSwitcherPluginIdentifiers, 0);
  objc_storeStrong((id *)&self->_visibleInstallations, 0);
  objc_storeStrong((id *)&self->_combinedStickersAppsIndexPathMap, 0);
  objc_storeStrong((id *)&self->_pluginLaunchTimeMap, 0);
  objc_storeStrong((id *)&self->_MRUPluginInteractionList, 0);
  objc_storeStrong((id *)&self->_historicalPluginIndexPathMap, 0);
  objc_storeStrong((id *)&self->_pluginIndexPathMap, 0);
  objc_storeStrong((id *)&self->_pluginSeenMap, 0);
  objc_storeStrong((id *)&self->_pluginVersionMap, 0);
  objc_storeStrong((id *)&self->_currentExtensionConsumers, 0);
  objc_storeStrong((id *)&self->_favoriteAppStripPlugins, 0);
  objc_storeStrong((id *)&self->_cachedPotentiallyVisiblePlugins, 0);
  objc_storeStrong((id *)&self->_lastUsedPhotoViewController, 0);
  objc_storeStrong((id *)&self->_prefetchIconKeys, 0);
  objc_storeStrong((id *)&self->_snapshotCache, 0);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_visiblePlugins, 0);
  objc_storeStrong((id *)&self->_allPlugins, 0);
  objc_storeStrong((id *)&self->_visibleRecentAppStripPlugins, 0);
  objc_storeStrong((id *)&self->_recentAppStripPlugins, 0);
  objc_storeStrong((id *)&self->_visibleSwitcherPlugins, 0);
  objc_storeStrong((id *)&self->_visibleAppStripPlugins, 0);
  objc_storeStrong((id *)&self->_appStripCandidatePlugins, 0);
}

- (void)prepareForSuspend
{
  void *v3;

  -[CKBalloonPluginManager currentExtensionConsumers](self, "currentExtensionConsumers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  if (!CKIsRunningInMessagesViewService() && !CKIsRunningInMessagesNotificationExtension())
  {
    -[CKBalloonPluginManager forceTearDownRemoteViewsSkippingCameraApp:](self, "forceTearDownRemoteViewsSkippingCameraApp:", 1);
    -[CKBalloonPluginManager forceKillRemoteExtensionsWithDelay:skipCameraApp:](self, "forceKillRemoteExtensionsWithDelay:skipCameraApp:", 1, 1);
  }
}

- (void)forceKillRemoteExtensionsWithDelay:(BOOL)a3
{
  -[CKBalloonPluginManager forceKillRemoteExtensionsWithDelay:skipCameraApp:](self, "forceKillRemoteExtensionsWithDelay:skipCameraApp:", a3, 0);
}

- (void)forceKillRemoteExtensionsWithDelay:(BOOL)a3 skipCameraApp:(BOOL)a4
{
  _BOOL4 v4;
  void (**v5)(_QWORD);
  void *v6;
  int v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v4 = a3;
  v14 = *MEMORY[0x1E0C80C00];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __98__CKBalloonPluginManager_ViewControllerFactory__forceKillRemoteExtensionsWithDelay_skipCameraApp___block_invoke;
  v10[3] = &unk_1E274CA88;
  v10[4] = self;
  v11 = a4;
  v5 = (void (**)(_QWORD))_Block_copy(v10);
  +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "stickerDragActiveInCurrentProcess");

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v13 = CFSTR("YES");
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Not allowing force kill of extension (stickerDragActive: %@).", buf, 0xCu);
      }

    }
  }
  else if (v4)
  {
    v9 = dispatch_time(0, 100000000);
    dispatch_after(v9, MEMORY[0x1E0C80D38], v5);
  }
  else
  {
    v5[2](v5);
  }

}

void __98__CKBalloonPluginManager_ViewControllerFactory__forceKillRemoteExtensionsWithDelay_skipCameraApp___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  id v26;
  NSObject *v27;
  void *v28;
  void *v29;
  __int128 v30;
  void *obj;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "forceKill of plugins in cache", buf, 2u);
    }

  }
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "activeBrowsers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  obj = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
  if (v4)
  {
    v6 = *(_QWORD *)v38;
    *(_QWORD *)&v5 = 138412290;
    v30 = v5;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v38 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (!*(_BYTE *)(a1 + 40))
          goto LABEL_12;
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "balloonPlugin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        IMBalloonExtensionIDWithSuffix();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "isEqualToString:", v11);

        if ((v12 & 1) == 0)
        {
LABEL_12:
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v13 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v8, "balloonPlugin");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v14, "identifier");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v30;
                v42 = v15;
                _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Killing extension process with bundle ID %@", buf, 0xCu);

              }
            }
            objc_msgSend(v8, "killExtensionProcess", v30);
          }
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    }
    while (v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifiersForCurrentExtensionConsumers");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "allPlugins");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v34 != v18)
          objc_enumerationMutation(v16);
        v20 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        if (*(_BYTE *)(a1 + 40))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "identifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          IMBalloonExtensionIDWithSuffix();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToString:", v22);

          if ((v23 & 1) != 0)
            continue;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v20, "identifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v32, "containsObject:", v24);

          if ((v25 & 1) == 0)
          {
            v26 = v20;
            if ((IMGetDomainBoolForKey() & 1) == 0)
            {
              if (IMOSLoggingEnabled())
              {
                OSLogHandleForIMFoundationCategory();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  objc_msgSend(v26, "identifier");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  v42 = v28;
                  v43 = 2112;
                  v44 = v32;
                  _os_log_impl(&dword_18DFCD000, v27, OS_LOG_TYPE_INFO, "Killing plugin extension with bundle ID %@. consumedBundleIdentifiers %@", buf, 0x16u);

                }
              }
              objc_msgSend(v26, "extension", v30);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "_kill:", 9);

            }
          }
        }
      }
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v45, 16);
    }
    while (v17);
  }

}

- (void)forceKillNonCameraRemoteExtensionsImmediately
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
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
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "balloonPlugin");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        IMBalloonExtensionIDWithSuffix();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v10, "isEqualToString:", v11) & 1) != 0)
        {

        }
        else
        {
          v12 = objc_opt_respondsToSelector();

          if ((v12 & 1) != 0)
            objc_msgSend(v8, "killExtensionProcess");
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

}

- (id)bundleIdentifiersForCurrentExtensionConsumers
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  __int128 v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  -[CKBalloonPluginManager currentExtensionConsumers](self, "currentExtensionConsumers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    *(_QWORD *)&v7 = 138412546;
    v15 = v7;
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "consumingBundleIdentifiers");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v8);

        if (IMOSLoggingEnabled())
        {
          OSLogHandleForIMFoundationCategory();
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v15;
            v17 = v6;
            v18 = 2112;
            v19 = v3;
            _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "following consumed extensions in use by %@ won't be killed: %@", buf, 0x16u);
          }
LABEL_11:

        }
      }
      else if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v6;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "currentExtensionConsumer doesn't conform to CKExtensionConsumer protocol %@", buf, 0xCu);
        }
        goto LABEL_11;
      }
      objc_msgSend(v5, "nextObject", v15);
      v10 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v10;
    }
    while (v10);
  }
  IMBalloonExtensionIDWithSuffix();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v3, "containsObject:", v11);

  if (v12)
  {
    IMBalloonExtensionIDWithSuffix();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v13);

  }
  return v3;
}

- (void)forceTearDownRemoteViewsSkippingCameraApp:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  __int128 v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v3 = a3;
  v38 = *MEMORY[0x1E0C80C00];
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "forceTearDownRemoteViews of plugins in cache", buf, 2u);
    }

  }
  -[CKBalloonPluginManager bundleIdentifiersForCurrentExtensionConsumers](self, "bundleIdentifiersForCurrentExtensionConsumers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v8)
  {
    v10 = *(_QWORD *)v32;
    *(_QWORD *)&v9 = 138412290;
    v29 = v9;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
        if (!v3)
          goto LABEL_12;
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v11), "balloonPlugin");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        IMBalloonExtensionIDWithSuffix();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v16 & 1) == 0)
        {
LABEL_12:
          objc_msgSend(v12, "balloonPlugin", v29);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "identifier");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v6, "containsObject:", v18);

          if (v19)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v20 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v12, "balloonPlugin");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "identifier");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v29;
                v36 = v22;
                _os_log_impl(&dword_18DFCD000, v20, OS_LOG_TYPE_INFO, "forceTearDownRemoteViews skipped for %@ because it is currently in use", buf, 0xCu);

              }
            }
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v23 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v12, "balloonPlugin");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "identifier");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v29;
                v36 = v25;
                _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "forceTearDownRemoteViews calling deferredForceTearDownRemoteView for %@", buf, 0xCu);

              }
            }
            objc_msgSend(v12, "deferredForceTearDownRemoteView");
          }
          else if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            if (IMOSLoggingEnabled())
            {
              OSLogHandleForIMFoundationCategory();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v12, "balloonPlugin");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v27, "identifier");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v29;
                v36 = v28;
                _os_log_impl(&dword_18DFCD000, v26, OS_LOG_TYPE_INFO, "forceTearDownRemoteViews calling forceTearDownRemoteView for %@", buf, 0xCu);

              }
            }
            objc_msgSend(v12, "forceTearDownRemoteView");
          }
        }
        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

}

- (void)invalidateAllActivePlugins
{
  -[CKBalloonPluginManager invalidateAllActivePluginsSkippingCameraApp:](self, "invalidateAllActivePluginsSkippingCameraApp:", 0);
}

- (void)invalidateAllActivePluginsSkippingCameraApp:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  int v32;
  const __CFString *v33;
  __int16 v34;
  const __CFString *v35;
  _QWORD v36[31];

  v3 = a3;
  v36[16] = *MEMORY[0x1E0C80C00];
  +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "passKitUIPresented");

  +[CKPluginExtensionStateObserver sharedInstance](CKPluginExtensionStateObserver, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "stickerDragActiveInCurrentProcess");

  v9 = IMOSLoggingEnabled();
  if (((v6 | v8) & 1) == 0)
  {
    if (v9)
    {
      OSLogHandleForIMFoundationCategory();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v32) = 0;
        _os_log_impl(&dword_18DFCD000, v13, OS_LOG_TYPE_INFO, "Removing all active browser plugins from cache", (uint8_t *)&v32, 2u);
      }

    }
    -[CKBalloonPluginManager forceTearDownRemoteViewsSkippingCameraApp:](self, "forceTearDownRemoteViewsSkippingCameraApp:", v3);
    -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "copy");

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v27 = v15;
    v16 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (!v16)
    {
LABEL_28:

      return;
    }
    v17 = *(_QWORD *)v29;
LABEL_17:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v29 != v17)
        objc_enumerationMutation(v27);
      v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v18);
      if (v3)
      {
        IMBalloonExtensionIDWithSuffix();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqualToString:", v20);

        if ((v21 & 1) != 0)
          goto LABEL_26;
      }
      else
      {
        IMBalloonExtensionIDWithSuffix();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v19, "isEqualToString:", v22);

        if (v23)
        {
          -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "objectForKey:", v19);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKBalloonPluginManager setLastUsedPhotoViewController:](self, "setLastUsedPhotoViewController:", v25);

        }
      }
      -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "removeObjectForKey:", v19);

LABEL_26:
      if (v16 == ++v18)
      {
        v16 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (!v16)
          goto LABEL_28;
        goto LABEL_17;
      }
    }
  }
  if (v9)
  {
    OSLogHandleForIMFoundationCategory();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = CFSTR("NO");
      if (v6)
        v12 = CFSTR("YES");
      else
        v12 = CFSTR("NO");
      if (v8)
        v11 = CFSTR("YES");
      v32 = 138412546;
      v33 = v12;
      v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_18DFCD000, v10, OS_LOG_TYPE_INFO, "Not allowing invalidation (passKitPresented: %@, stickerDragActive: %@), maintaining browser plugin cache", (uint8_t *)&v32, 0x16u);
    }

  }
}

- (void)_invalidatePluginForKey:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Invalidating plugin for key %@", (uint8_t *)&v9, 0xCu);
    }

  }
  -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "forceTearDownRemoteView");
    -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectForKey:", v4);

  }
}

- (id)browserSnapshotForKey:(id)a3
{
  id v4;
  void *v5;
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

  v4 = a3;
  -[CKBalloonPluginManager snapshotCache](self, "snapshotCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cachedPreviewForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(v4, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    CKBrowserSnapshotPreviewURL(v8, CFSTR("png"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfURL:options:error:", v9, 1, 0);
      if (v10)
      {
        v11 = (void *)MEMORY[0x1E0CEA638];
        objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "scale");
        objc_msgSend(v11, "imageWithData:scale:", v10);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA658]), "initWithImage:", v13);
        -[CKBalloonPluginManager snapshotCache](self, "snapshotCache");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "stringValue");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setCachedPreview:key:", v7, v15);

        -[CKBalloonPluginManager snapshotCache](self, "snapshotCache");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "keyWithOppositeInterfaceStyle");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCachedPreview:key:", 0, v18);

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (void)updateSnapshotForBrowserViewController:(id)a3 currentBounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
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
  void *v21;
  void *v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v26 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v10, "startTimingForKey:", CFSTR("updateSnapshotForViewController:"));
    objc_msgSend(v9, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "balloonPlugin");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKSnapshotCacheKey keyWithIdentifier:interfaceStyle:bounds:](CKSnapshotCacheKey, "keyWithIdentifier:interfaceStyle:bounds:", v13, objc_msgSend(v14, "userInterfaceStyle"), x, y, width, height);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "snapshotViewAfterScreenUpdates:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonPluginManager snapshotCache](self, "snapshotCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "keyWithOppositeInterfaceStyle");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCachedPreview:key:", 0, v19);

    -[CKBalloonPluginManager snapshotCache](self, "snapshotCache");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setCachedPreview:key:", v16, v21);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "postNotificationName:object:", CFSTR("CKBalloonPluginManagerSnapshotsDidChange"), 0);

    objc_msgSend(v10, "stopTimingForKey:", CFSTR("updateSnapshotForViewController:"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = 138412290;
        v25 = v10;
        _os_log_impl(&dword_18DFCD000, v23, OS_LOG_TYPE_INFO, "Finished updateSnapshotForViewController:, %@", (uint8_t *)&v24, 0xCu);
      }

    }
  }

}

- (id)newViewControllerForPluginIdentifier:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[CKBalloonPluginManager pluginForIdentifier:](self, "pluginForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "browserClass");
  v10 = objc_msgSend(v9, "instancesRespondToSelector:", sel_initWithBalloonPlugin_dataSource_);
  v11 = objc_alloc((Class)v9);
  if (v10)
    v12 = objc_msgSend(v11, "initWithBalloonPlugin:dataSource:", v8, v7);
  else
    v12 = objc_msgSend(v11, "initWithBalloonPlugin:", v8);
  v13 = (void *)v12;
  if (v12)
  {
    -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v13, v6);

  }
  return v13;
}

- (id)viewControllerForPluginIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[CKBalloonPluginManager existingViewControllerForPluginIdentifier:](self, "existingViewControllerForPluginIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[CKBalloonPluginManager viewControllerForPluginIdentifier:dataSource:](self, "viewControllerForPluginIdentifier:dataSource:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)existingViewControllerForPluginIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    IMBalloonExtensionIDWithSuffix();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isEqualToString:", v7);

    if (v8)
    {
      -[CKBalloonPluginManager lastUsedPhotoViewController](self, "lastUsedPhotoViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)viewControllerForPluginIdentifier:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  id v10;
  char v11;
  id v12;

  v6 = a3;
  v7 = a4;
  -[CKBalloonPluginManager existingViewControllerForPluginIdentifier:](self, "existingViewControllerForPluginIdentifier:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = objc_msgSend(v8, "canReplaceDataSource");
    if (!v8)
      goto LABEL_13;
  }
  else
  {
    v9 = 0;
    if (!v8)
    {
LABEL_13:
      v8 = -[CKBalloonPluginManager newViewControllerForPluginIdentifier:dataSource:](self, "newViewControllerForPluginIdentifier:dataSource:", v6, v7);
      goto LABEL_14;
    }
  }
  objc_msgSend(v8, "balloonPluginDataSource");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10 == v7)
    v11 = 1;
  else
    v11 = v9;

  if ((v11 & 1) == 0)
  {
    -[CKBalloonPluginManager _invalidatePluginForKey:](self, "_invalidatePluginForKey:", v6);

    goto LABEL_13;
  }
  if (v9)
  {
    objc_msgSend(v8, "balloonPluginDataSource");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 != v7)
      objc_msgSend(v8, "setBalloonPluginDataSource:", v7);
  }
LABEL_14:

  return v8;
}

- (void)invalidatePhotosViewController
{
  -[CKBalloonPluginManager setLastUsedPhotoViewController:](self, "setLastUsedPhotoViewController:", 0);
}

- (void)invalidatePhotosPlugin
{
  -[CKBalloonPluginManager _invalidatePluginForKey:](self, "_invalidatePluginForKey:", *MEMORY[0x1E0D375E0]);
}

- (void)invalidateAppManagerPlugin
{
  -[CKBalloonPluginManager _invalidatePluginForKey:](self, "_invalidatePluginForKey:", CFSTR("com.apple.messages.browser.MorePlugin"));
}

- (id)photosBrowserViewControllerWithPluginPayloads:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  int v12;
  id v13;
  void *v14;
  void *v15;

  v4 = a3;
  -[CKBalloonPluginManager existingPhotoBrowserViewController](self, "existingPhotoBrowserViewController");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D375E0];
  if (v5)
  {
    v7 = (void *)v5;
    -[CKBalloonPluginManager _invalidatePluginForKey:](self, "_invalidatePluginForKey:", *MEMORY[0x1E0D375E0]);

  }
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "balloonPluginForBundleID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (objc_class *)objc_msgSend(v9, "browserClass");
  if (-[objc_class instancesRespondToSelector:](v10, "instancesRespondToSelector:", sel_initWithBalloonPlugin_pluginPayloads_))
  {
    v11 = objc_msgSend([v10 alloc], "initWithBalloonPlugin:pluginPayloads:", v9, v4);
  }
  else
  {
    v12 = -[objc_class instancesRespondToSelector:](v10, "instancesRespondToSelector:", sel_initWithBalloonPlugin_dataSource_);
    v13 = [v10 alloc];
    if (v12)
      v11 = objc_msgSend(v13, "initWithBalloonPlugin:dataSource:", v9, 0);
    else
      v11 = objc_msgSend(v13, "initWithBalloonPlugin:", v9);
  }
  v14 = (void *)v11;
  if (v11)
  {
    -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v14, v6);

  }
  return v14;
}

- (id)existingPhotoBrowserViewController
{
  return -[CKBalloonPluginManager existingViewControllerForPluginIdentifier:](self, "existingViewControllerForPluginIdentifier:", *MEMORY[0x1E0D375E0]);
}

- (id)digitalTouchViewControllerWithDataSource:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = *MEMORY[0x1E0D37588];
  -[CKBalloonPluginManager existingViewControllerForPluginIdentifier:](self, "existingViewControllerForPluginIdentifier:", *MEMORY[0x1E0D37588]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_msgSend(v6, "balloonPluginDataSource");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
      goto LABEL_7;
    -[CKBalloonPluginManager _invalidatePluginForKey:](self, "_invalidatePluginForKey:", v5);

  }
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "balloonPluginForBundleID:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "browserClass")), "initWithBalloonPlugin:dataSource:", v10, v4);
  if (v7)
  {
    -[CKBalloonPluginManager activeBrowsers](self, "activeBrowsers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v7, v5);

  }
LABEL_7:

  return v7;
}

- (id)handwritingViewControllerWithPluginPayloads:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  uint64_t v11;
  int v12;
  id v13;

  v4 = a3;
  v5 = *MEMORY[0x1E0D375C0];
  -[CKBalloonPluginManager existingViewControllerForPluginIdentifier:](self, "existingViewControllerForPluginIdentifier:", *MEMORY[0x1E0D375C0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4 && v6)
  {

    -[CKBalloonPluginManager _invalidatePluginForKey:](self, "_invalidatePluginForKey:", v5);
  }
  else if (v6)
  {
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "balloonPluginForBundleID:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (objc_class *)objc_msgSend(v9, "browserClass");
  if (-[objc_class instancesRespondToSelector:](v10, "instancesRespondToSelector:", sel_initWithBalloonPlugin_pluginPayloads_))
  {
    v11 = objc_msgSend([v10 alloc], "initWithBalloonPlugin:pluginPayloads:", v9, v4);
  }
  else
  {
    v12 = -[objc_class instancesRespondToSelector:](v10, "instancesRespondToSelector:", sel_initWithBalloonPlugin_dataSource_);
    v13 = [v10 alloc];
    if (v12)
      v11 = objc_msgSend(v13, "initWithBalloonPlugin:dataSource:", v9, 0);
    else
      v11 = objc_msgSend(v13, "initWithBalloonPlugin:", v9);
  }
  v7 = (void *)v11;

LABEL_11:
  return v7;
}

- (BOOL)isViewController:(id)a3 fromPluginWithIdentifier:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0D35770];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "balloonPluginForBundleID:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  LOBYTE(v7) = objc_msgSend(v10, "isEqual:", objc_msgSend(v9, "browserClass"));

  return (char)v7;
}

- (void)appInstallationWatcher:(id)a3 changedAppInstallation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__40;
  v25 = __Block_byref_object_dispose__40;
  v26 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonPluginManager setVisibleInstallations:](self, "setVisibleInstallations:", v9);

  }
  -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__CKBalloonPluginManager_CKBrowserSelectionController__appInstallationWatcher_changedAppInstallation___block_invoke;
  v13[3] = &unk_1E2755560;
  v11 = v7;
  v14 = v11;
  v15 = &v21;
  v16 = &v17;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v13);

  if (v22[5])
  {
    if (objc_msgSend(v11, "installed"))
    {
      -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "removeObjectAtIndex:", v18[3]);
    }
    else
    {
      -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "replaceObjectAtIndex:withObject:", v18[3], v11);
    }
    goto LABEL_9;
  }
  if ((objc_msgSend(v11, "installed") & 1) == 0)
  {
    -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v11);
LABEL_9:

    -[CKBalloonPluginManager _refreshVisibleDrawerPluginsDueToAppInstallationChange](self, "_refreshVisibleDrawerPluginsDueToAppInstallationChange");
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

}

void __102__CKBalloonPluginManager_CKBrowserSelectionController__appInstallationWatcher_changedAppInstallation___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }

}

- (void)appInstallationWatcher:(id)a3 addedAppInstallation:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonPluginManager setVisibleInstallations:](self, "setVisibleInstallations:", v7);

  }
  -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", v5);

  -[CKBalloonPluginManager _refreshVisibleDrawerPluginsDueToAppInstallationChange](self, "_refreshVisibleDrawerPluginsDueToAppInstallationChange");
}

- (void)updateAppInstallations
{
  void *v3;
  _QWORD v4[5];

  +[CKAppInstallationWatcher sharedInstance](CKAppInstallationWatcher, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __78__CKBalloonPluginManager_CKBrowserSelectionController__updateAppInstallations__block_invoke;
  v4[3] = &unk_1E274D558;
  v4[4] = self;
  objc_msgSend(v3, "fetchAllAppInstallations:", v4);

}

void __78__CKBalloonPluginManager_CKBrowserSelectionController__updateAppInstallations__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "visibleInstallations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  objc_msgSend(*(id *)(a1 + 32), "filteredArrayOfInstallationsThatShouldBeVisible:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(*(id *)(a1 + 32), "setVisibleInstallations:", v6);

  if ((objc_msgSend(*(id *)(a1 + 32), "isAppInstallationObserver") & 1) == 0)
  {
    +[CKAppInstallationWatcher sharedInstance](CKAppInstallationWatcher, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:", *(_QWORD *)(a1 + 32));

    objc_msgSend(*(id *)(a1 + 32), "setIsAppInstallationObserver:", 1);
  }
  if (v4 || objc_msgSend(v8, "count"))
    objc_msgSend(*(id *)(a1 + 32), "_refreshVisibleDrawerPluginsDueToAppInstallationChange");

}

- (void)_refreshVisibleDrawerPluginsDueToAppInstallationChange
{
  id v2;

  -[CKBalloonPluginManager refreshPlugins](self, "refreshPlugins");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("CKBrowserSelectionControllerInstallationsChangedNotification"), 0);

}

BOOL __104__CKBalloonPluginManager_CKBrowserSelectionController__filteredArrayOfInstallationsThatShouldBeVisible___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "containsObject:", v5) & 1) != 0 || (objc_msgSend(v3, "installed") & 1) != 0)
    v6 = 0;
  else
    v6 = objc_msgSend(v3, "installState") == 1
      || objc_msgSend(v3, "installState") == 2
      || objc_msgSend(v3, "installState") == 5;

  return v6;
}

- (NSArray)potentiallyVisiblePlugins
{
  void *v3;
  NSArray *recentAppStripPlugins;
  NSArray *visibleRecentAppStripPlugins;
  void *v6;

  -[CKBalloonPluginManager cachedPotentiallyVisiblePlugins](self, "cachedPotentiallyVisiblePlugins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[CKBalloonPluginManager setFavoriteAppStripPlugins:](self, "setFavoriteAppStripPlugins:", 0);
    recentAppStripPlugins = self->_recentAppStripPlugins;
    self->_recentAppStripPlugins = 0;

    visibleRecentAppStripPlugins = self->_visibleRecentAppStripPlugins;
    self->_visibleRecentAppStripPlugins = 0;

    -[CKBalloonPluginManager orderedPlugins:](self, "orderedPlugins:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBalloonPluginManager setCachedPotentiallyVisiblePlugins:](self, "setCachedPotentiallyVisiblePlugins:", v6);

  }
  return -[CKBalloonPluginManager cachedPotentiallyVisiblePlugins](self, "cachedPotentiallyVisiblePlugins");
}

- (NSArray)potentiallyVisibleNonFavoritePlugins
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[CKBalloonPluginManager visibleFavoriteAppStripPlugins](self, "visibleFavoriteAppStripPlugins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonPluginManager potentiallyVisiblePlugins](self, "potentiallyVisiblePlugins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __92__CKBalloonPluginManager_CKBrowserSelectionController__potentiallyVisibleNonFavoritePlugins__block_invoke;
  v8[3] = &unk_1E2750228;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "__imArrayByFilteringWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

uint64_t __92__CKBalloonPluginManager_CKBrowserSelectionController__potentiallyVisibleNonFavoritePlugins__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) ^ 1;
  else
    v4 = 0;

  return v4;
}

uint64_t __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 < v11)
    return -1;
  else
    return v8 > v11;
}

void __71__CKBalloonPluginManager_CKBrowserSelectionController__orderedPlugins___block_invoke_7(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;

  v16 = a2;
  objc_msgSend(v16, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  IMBalloonExtensionIDWithSuffix();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToIgnoringCase:", v6);

  objc_msgSend(v16, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToIgnoringCase:", *MEMORY[0x1E0D37568]);

  v10 = v7 ^ 1u;
  if ((v7 & 1) == 0 && (v9 & 1) == 0)
  {
    if (*(_QWORD *)(a1 + 32))
      v11 = a3 + 1;
    else
      v11 = a3;
    if (*(_QWORD *)(a1 + 40))
      v10 = v11 + 1;
    else
      v10 = v11;
  }
  v12 = objc_msgSend(*(id *)(a1 + 48), "count");
  if (v10 > v12)
  {
    v13 = v12;
    v14 = v10;
    v15 = v12;
    _IMWarn();
    v10 = v13;
  }
  objc_msgSend(*(id *)(a1 + 48), "insertObject:atIndex:", v16, v10, v14, v15);

}

- (BOOL)isPluginSystemApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  char v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "proxy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isEqualToString:", v5);

      if (v8 && v6)
      {
        objc_msgSend(v6, "containingBundle");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "applicationType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CA5830]);

        v12 = v11 ^ 1;
      }
      else
      {
        _IMWarn();
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    _IMWarn();
    v12 = 0;
  }

  return v12;
}

- (BOOL)isPluginHiddenFromSendMenuAndStickers:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "valueForKey:", CFSTR("SendMenuHiddenExtensionBundleIdentifiers"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringArrayForKey:", CFSTR("SendMenuHiddenExtensionBundleIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "extensionBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v9);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "isEqualToString:", v8, (_QWORD)v14) & 1) != 0)
          {
            LOBYTE(v10) = 1;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setPlugin:(id)a3 hiddenInSendMenuAndStickers:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  v5 = (void *)MEMORY[0x1E0C99EA0];
  v6 = a3;
  objc_msgSend(v5, "messagesAppDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKey:", CFSTR("SendMenuHiddenExtensionBundleIdentifiers"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringArrayForKey:", CFSTR("SendMenuHiddenExtensionBundleIdentifiers"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v10, "mutableCopy");

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "extensionBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v13, "removeObject:", v11);
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99EA0], "messagesAppDomain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setValue:forKey:", v13, CFSTR("SendMenuHiddenExtensionBundleIdentifiers"));

    goto LABEL_9;
  }
  if ((objc_msgSend(v13, "containsObject:", v11) & 1) == 0)
  {
    objc_msgSend(v13, "addObject:", v11);
    goto LABEL_8;
  }
LABEL_9:

}

- (NSArray)orderedCombinedStickerApps
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[CKBalloonPluginManager allOrderedCombinedStickerApps](self, "allOrderedCombinedStickerApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__CKBalloonPluginManager_CKBrowserSelectionController__orderedCombinedStickerApps__block_invoke;
  v6[3] = &unk_1E2750228;
  v6[4] = self;
  objc_msgSend(v3, "__imArrayByFilteringWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __82__CKBalloonPluginManager_CKBrowserSelectionController__orderedCombinedStickerApps__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "isLaunchProhibited") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "isPluginHiddenFromSendMenuAndStickers:", v3) ^ 1;

  return v4;
}

- (NSArray)allOrderedCombinedStickerApps
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  -[CKBalloonPluginManager combinedStickerApps](self, "combinedStickerApps");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonPluginManager combinedStickersAppsIndexPathMap](self, "combinedStickersAppsIndexPathMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85__CKBalloonPluginManager_CKBrowserSelectionController__allOrderedCombinedStickerApps__block_invoke;
  v12[3] = &unk_1E2755700;
  v12[4] = self;
  v13 = v6;
  v14 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObject:", v4);
  objc_msgSend(v10, "addObject:", v4);

  return (NSArray *)v10;
}

uint64_t __85__CKBalloonPluginManager_CKBrowserSelectionController__allOrderedCombinedStickerApps__block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;

  v5 = (void *)a1[4];
  v6 = a3;
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_pluginIndexPathForPluginWithIdentifier:pluginMap:", v7, a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8)
    v9 = (void *)a1[6];
  v10 = v9;

  v11 = (void *)a1[4];
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_pluginIndexPathForPluginWithIdentifier:pluginMap:", v12, a1[5]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v13)
    v14 = (void *)a1[6];
  v15 = v14;

  v16 = objc_msgSend(v10, "compare:", v15);
  return v16;
}

- (id)_pluginIndexPathForPluginWithIdentifier:(id)a3 pluginMap:(id)a4
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a4, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "section") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = 0;
    }
    else if (objc_msgSend(v5, "item") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v4 = 0;
    }
    else
    {
      v4 = v5;
    }
  }
  v6 = v4;

  return v6;
}

- (void)regeneratePluginIndexPaths
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CKBalloonPluginManager *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[5];
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  if (-[CKBalloonPluginManager hasLoadedExtensions](self, "hasLoadedExtensions"))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __82__CKBalloonPluginManager_CKBrowserSelectionController__regeneratePluginIndexPaths__block_invoke;
    v32[3] = &unk_1E2750228;
    v32[4] = self;
    -[CKBalloonPluginManager allPluginsPassingTest:](self, "allPluginsPassingTest:", v32);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "__imArrayByApplyingBlock:", &__block_literal_global_91_1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = self;
    objc_msgSend((id)objc_opt_class(), "defaultFavoritePlugins");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(v5);
          v11 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          if (objc_msgSend(v4, "containsObject:", v11))
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v8, 0);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v11);

            ++v8;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v7);
    }
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v4;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          if ((objc_msgSend(v5, "containsObject:", v19) & 1) == 0
            && (objc_msgSend(v19, "isEqualToString:", CFSTR("com.apple.messages.browser.MorePlugin")) & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, 1);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, v19);

            ++v16;
          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
      }
      while (v15);
    }
    else
    {
      v16 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("com.apple.messages.browser.MorePlugin"));

    -[CKBalloonPluginManager setPluginIndexPathMap:](v23, "setPluginIndexPathMap:", v3);
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

uint64_t __82__CKBalloonPluginManager_CKBrowserSelectionController__regeneratePluginIndexPaths__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEnabledAndVisible:", a2);
}

uint64_t __82__CKBalloonPluginManager_CKBrowserSelectionController__regeneratePluginIndexPaths__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "identifier");
}

- (void)regenerateCombinedStickersAppsIndexPaths
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (-[CKBalloonPluginManager hasLoadedExtensions](self, "hasLoadedExtensions"))
  {
    v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[CKBalloonPluginManager combinedStickerApps](self, "combinedStickerApps");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(v5, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.messages.browser.MorePlugin"));

    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CKBalloonPluginManager_SelectionController.m"), 666, CFSTR("Expected more plugin last"));

    }
    if (objc_msgSend(v5, "count"))
    {
      v9 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, 0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v12, v11);

        ++v9;
      }
      while (v9 < objc_msgSend(v5, "count"));
    }
    -[CKBalloonPluginManager setCombinedStickersAppsIndexPathMap:](self, "setCombinedStickersAppsIndexPathMap:", v14);

  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }
}

- (void)updateIndexPath:(id)a3 forPlugin:(id)a4 isDrawerPluginPath:(BOOL)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  _QWORD v17[5];
  _QWORD v18[5];

  v16 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKBalloonPluginManager visibleFavoriteAppStripPlugins](self, "visibleFavoriteAppStripPlugins");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    -[CKBalloonPluginManager recentAppStripPlugins](self, "recentAppStripPlugins");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if (objc_msgSend(v16, "section"))
      v12 = v11;
    else
      v12 = v9;
    v13 = v12;
    objc_msgSend(v9, "removeObject:", v7);
    objc_msgSend(v11, "removeObject:", v7);
    objc_msgSend(v13, "insertObject:atIndex:", v7, objc_msgSend(v16, "row"));
    v14 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __101__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forPlugin_isDrawerPluginPath___block_invoke;
    v18[3] = &unk_1E27501D8;
    v18[4] = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v18);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __101__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forPlugin_isDrawerPluginPath___block_invoke_2;
    v17[3] = &unk_1E27501D8;
    v17[4] = self;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:", v17);

    -[CKBalloonPluginManager _updateHistoricalPluginIndexPathMap](self, "_updateHistoricalPluginIndexPathMap");
    -[CKBalloonPluginManager refreshPlugins](self, "refreshPlugins");
    v15 = -[CKBalloonPluginManager visiblePlugins](self, "visiblePlugins");
    -[CKBalloonPluginManager saveWithNotification:](self, "saveWithNotification:", 1);

  }
  else
  {
    _IMWarn();
  }

}

void __101__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forPlugin_isDrawerPluginPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB36B0];
  v6 = a2;
  objc_msgSend(v5, "indexPathForRow:inSection:", a3, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pluginIndexPathMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v10, v8);

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("Putting %@ to %tu-%tu"), v9, objc_msgSend(v10, "section"), objc_msgSend(v10, "row"));
}

void __101__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forPlugin_isDrawerPluginPath___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB36B0];
  v6 = a2;
  objc_msgSend(v5, "indexPathForRow:inSection:", a3, 1);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pluginIndexPathMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v10, v8);

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("Putting %@ to %tu-%tu"), v9, objc_msgSend(v10, "section"), objc_msgSend(v10, "row"));
}

- (void)updateIndexPath:(id)a3 forCombinedStickerApp:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v9 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[CKBalloonPluginManager orderedCombinedStickerApps](self, "orderedCombinedStickerApps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    objc_msgSend(v8, "removeObject:", v6);
    objc_msgSend(v8, "insertObject:atIndex:", v6, objc_msgSend(v9, "row"));
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __94__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forCombinedStickerApp___block_invoke;
    v10[3] = &unk_1E27501D8;
    v10[4] = self;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
    -[CKBalloonPluginManager saveCombinedAppsWithNotification:](self, "saveCombinedAppsWithNotification:", 1);

  }
  else
  {
    _IMWarn();
  }

}

void __94__CKBalloonPluginManager_CKBrowserSelectionController__updateIndexPath_forCombinedStickerApp___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB36B0];
  v6 = a2;
  objc_msgSend(v5, "indexPathForRow:inSection:", a3, 0);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "combinedStickersAppsIndexPathMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v10, v8);

  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  NSLog(CFSTR("Putting %@ to %tu-%tu"), v9, objc_msgSend(v10, "section"), objc_msgSend(v10, "row"));
}

- (void)removeVisibleInstallationWithID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *, uint64_t, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v4 = a3;
  if (v4)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__40;
    v17 = __Block_byref_object_dispose__40;
    v18 = 0;
    -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __88__CKBalloonPluginManager_CKBrowserSelectionController__removeVisibleInstallationWithID___block_invoke;
    v10 = &unk_1E2755728;
    v11 = v4;
    v12 = &v13;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v7);

    -[CKBalloonPluginManager visibleInstallations](self, "visibleInstallations", v7, v8, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v14[5]);

    -[CKBalloonPluginManager _refreshVisibleDrawerPluginsDueToAppInstallationChange](self, "_refreshVisibleDrawerPluginsDueToAppInstallationChange");
    _Block_object_dispose(&v13, 8);

  }
}

void __88__CKBalloonPluginManager_CKBrowserSelectionController__removeVisibleInstallationWithID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)descriptionOfVisibleDrawerPlugins
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBalloonPluginManager visibleDrawerPlugins](self, "visibleDrawerPlugins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = 0;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      if (v5)
        objc_msgSend(v3, "appendFormat:", CFSTR("\n"));
      objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __89__CKBalloonPluginManager_CKBrowserSelectionController__descriptionOfVisibleDrawerPlugins__block_invoke;
      v9[3] = &unk_1E274A318;
      v10 = v3;
      objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

      ++v5;
    }
    while (v5 < objc_msgSend(v4, "count"));
  }

  return v3;
}

uint64_t __89__CKBalloonPluginManager_CKBrowserSelectionController__descriptionOfVisibleDrawerPlugins__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%tu: %@\n"), a3, a2);
}

@end
