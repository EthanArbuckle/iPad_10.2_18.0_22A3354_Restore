@implementation IPWatchLocaleController

- (IPWatchLocaleController)init
{
  return -[IPWatchLocaleController initWithSystemLanguages:](self, "initWithSystemLanguages:", 0);
}

- (IPWatchLocaleController)initWithSystemLanguages:(id)a3
{
  id v5;
  IPWatchLocaleController *v6;
  uint64_t v7;
  NPSDomainAccessor *gizmoGlobalDomain;
  NPSManager *v9;
  NPSManager *syncManager;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IPWatchLocaleController;
  v6 = -[IPWatchLocaleController init](&v12, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR(".GlobalPreferences"));
    gizmoGlobalDomain = v6->_gizmoGlobalDomain;
    v6->_gizmoGlobalDomain = (NPSDomainAccessor *)v7;

    v9 = (NPSManager *)objc_alloc_init(MEMORY[0x1E0D51618]);
    syncManager = v6->_syncManager;
    v6->_syncManager = v9;

    objc_storeStrong((id *)&v6->_systemLanguages, a3);
  }

  return v6;
}

- (id)preferredLanguages
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "synchronize");

  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("AppleLanguages"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9[0] = CFSTR("en-001");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }
  return v6;
}

- (void)setLanguages:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFNotificationCenter *DarwinNotifyCenter;

  v4 = a3;
  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("AppleLanguages"));

  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "synchronize");

  -[IPWatchLocaleController syncManager](self, "syncManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("AppleLanguages"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronizeNanoDomain:keys:", v10, v11);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.nano.watchlanguagechanged"), 0, 0, 1u);
}

- (id)deviceLanguage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[IPWatchLocaleController systemLanguages](self, "systemLanguages");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizations");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5 = (void *)MEMORY[0x1E0CB34D0];
  -[IPWatchLocaleController preferredLanguages](self, "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "preferredLocalizationsFromArray:forPreferences:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "canonicalLanguageIdentifierFromString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)postLocaleChangedNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.nano.watchlocalechanged"), 0, 0, 1u);
}

- (void)updateLocale:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("AppleLocale"));

  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "synchronize");

  -[IPWatchLocaleController syncManager](self, "syncManager");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("AppleLocale"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "synchronizeNanoDomain:keys:", v9, v10);

}

- (void)resetTimeFormat
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", 0, CFSTR("AppleICUForce12HourTime"));

  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "synchronize");

  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", 0, CFSTR("AppleICUForce24HourTime"));

  v12[0] = CFSTR("AppleICUForce24HourTime");
  v12[1] = CFSTR("AppleICUForce12HourTime");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPWatchLocaleController syncManager](self, "syncManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPWatchLocaleController gizmoGlobalDomain](self, "gizmoGlobalDomain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "synchronizeNanoDomain:keys:", v10, v11);

}

- (void)setLocale:(id)a3
{
  -[IPWatchLocaleController updateLocale:](self, "updateLocale:", a3);
  -[IPWatchLocaleController resetTimeFormat](self, "resetTimeFormat");
  -[IPWatchLocaleController postLocaleChangedNotification](self, "postLocaleChangedNotification");
}

- (void)initializeMirrorSettings
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D51838], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isPaired");

  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.bulletinboard.apps"));
    objc_msgSend(v5, "dictionaryForKey:", CFSTR("com.apple.CompanionInternationalSettings"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinShowsCustomSettings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[IPWatchLocaleController preferredLanguages](self, "preferredLanguages");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isEqualToArray:", v10))
      {
        Logger();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 136315394;
          v20 = "-[IPWatchLocaleController initializeMirrorSettings]";
          v21 = 2114;
          v22 = v10;
          _os_log_impl(&dword_1B96C1000, v11, OS_LOG_TYPE_DEFAULT, "%s: Enabling language mirroring after initial pair (%{public}@).", (uint8_t *)&v19, 0x16u);
        }
        v12 = 1;
      }
      else
      {
        -[IPWatchLocaleController deviceLanguage](self, "deviceLanguage");
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DC8], "_deviceLanguage");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[NSObject isEqualToString:](v11, "isEqualToString:", v13);
        Logger();
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            v19 = 136315906;
            v20 = "-[IPWatchLocaleController initializeMirrorSettings]";
            v21 = 2114;
            v22 = v9;
            v23 = 2114;
            v24 = v10;
            v25 = 2114;
            v26 = v11;
            _os_log_impl(&dword_1B96C1000, v15, OS_LOG_TYPE_DEFAULT, "%s: Preferred languages don’t match (watch %{public}@ ≠ phone %{public}@). Enabling language mirroring because device languages match (%{public}@).", (uint8_t *)&v19, 0x2Au);
          }

          -[IPWatchLocaleController mirrorLanguagesAndLocaleToWatch](self, "mirrorLanguagesAndLocaleToWatch");
          v12 = 1;
        }
        else
        {
          if (v16)
          {
            v19 = 136316162;
            v20 = "-[IPWatchLocaleController initializeMirrorSettings]";
            v21 = 2114;
            v22 = v9;
            v23 = 2114;
            v24 = v10;
            v25 = 2114;
            v26 = v11;
            v27 = 2114;
            v28 = v13;
            _os_log_impl(&dword_1B96C1000, v15, OS_LOG_TYPE_DEFAULT, "%s: Preferred languages don’t match (watch %{public}@ ≠ phone %{public}@). Disabling language mirroring because device language doesn’t match (watch %{public}@ ≠ phone %{public}@).", (uint8_t *)&v19, 0x34u);
          }

          v12 = 0;
        }

      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12 ^ 1u);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("BPSNanoBulletinShowsCustomSettings"));

      objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("com.apple.CompanionInternationalSettings"));
      v18 = (id)objc_msgSend(v5, "synchronize");

    }
  }
}

- (BOOL)isMirroringEnabled
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D51610]), "initWithDomain:", CFSTR("com.apple.bulletinboard.apps"));
  objc_msgSend(v2, "dictionaryForKey:", CFSTR("com.apple.CompanionInternationalSettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("BPSNanoBulletinShowsCustomSettings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue") ^ 1;

  return v5;
}

- (void)mirrorLanguagesAndLocaleToWatch
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  Logger();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[IPWatchLocaleController mirrorLanguagesAndLocaleToWatch]";
    _os_log_impl(&dword_1B96C1000, v3, OS_LOG_TYPE_DEFAULT, "%s: Mirroring languages and locale to watch…", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPWatchLocaleController setLanguages:](self, "setLanguages:", v4);

  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLocale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localeIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPWatchLocaleController setLocale:](self, "setLocale:", v6);

}

- (NPSDomainAccessor)gizmoGlobalDomain
{
  return self->_gizmoGlobalDomain;
}

- (void)setGizmoGlobalDomain:(id)a3
{
  objc_storeStrong((id *)&self->_gizmoGlobalDomain, a3);
}

- (NPSManager)syncManager
{
  return self->_syncManager;
}

- (void)setSyncManager:(id)a3
{
  objc_storeStrong((id *)&self->_syncManager, a3);
}

- (NSArray)systemLanguages
{
  return self->_systemLanguages;
}

- (void)setSystemLanguages:(id)a3
{
  objc_storeStrong((id *)&self->_systemLanguages, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLanguages, 0);
  objc_storeStrong((id *)&self->_syncManager, 0);
  objc_storeStrong((id *)&self->_gizmoGlobalDomain, 0);
}

@end
