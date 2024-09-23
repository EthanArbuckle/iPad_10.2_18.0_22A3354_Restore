@implementation GCSSettingsStore

- (GCSSettingsStore)initWithUserDefaults:(id)a3
{
  id v5;
  GCSSettingsStore *v6;
  GCSSettingsStore *v7;
  NSString *settingsVersion;
  GCSGamesCollection *v9;
  GCSGames *games;
  GCSProfilesCollection *v11;
  GCSProfiles *profiles;
  GCSMouseProfilesCollection *v13;
  GCSMouseProfiles *mouseProfiles;
  GCSControllersCollection *v15;
  GCSControllers *controllers;
  GCSCopilotFusedControllersCollection *v17;
  GCSCopilotFusedControllers *copilotFusedControllers;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)GCSSettingsStore;
  v6 = -[GCSSettingsStore init](&v20, sel_init);
  v7 = v6;
  if (v6)
  {
    settingsVersion = v6->_settingsVersion;
    v6->_settingsVersion = (NSString *)CFSTR("0.0.0");

    objc_storeStrong((id *)&v7->_defaults, a3);
    -[GCUserDefaults addObserver:forKeyPath:options:context:](v7->_defaults, "addObserver:forKeyPath:options:context:", v7, CFSTR("settingsVersion"), 5, 0);
    v9 = -[GCSGamesCollection initWithSettingsStore:userDefaults:]([GCSGamesCollection alloc], "initWithSettingsStore:userDefaults:", v7, v7->_defaults);
    games = v7->_games;
    v7->_games = (GCSGames *)v9;

    v11 = -[GCSProfilesCollection initWithSettingsStore:userDefaults:]([GCSProfilesCollection alloc], "initWithSettingsStore:userDefaults:", v7, v7->_defaults);
    profiles = v7->_profiles;
    v7->_profiles = (GCSProfiles *)v11;

    v13 = -[GCSMouseProfilesCollection initWithSettingsStore:userDefaults:]([GCSMouseProfilesCollection alloc], "initWithSettingsStore:userDefaults:", v7, v7->_defaults);
    mouseProfiles = v7->_mouseProfiles;
    v7->_mouseProfiles = (GCSMouseProfiles *)v13;

    v15 = -[GCSControllersCollection initWithSettingsStore:userDefaults:]([GCSControllersCollection alloc], "initWithSettingsStore:userDefaults:", v7, v7->_defaults);
    controllers = v7->_controllers;
    v7->_controllers = (GCSControllers *)v15;

    v17 = -[GCSCopilotFusedControllersCollection initWithSettingsStore:userDefaults:]([GCSCopilotFusedControllersCollection alloc], "initWithSettingsStore:userDefaults:", v7, v7->_defaults);
    copilotFusedControllers = v7->_copilotFusedControllers;
    v7->_copilotFusedControllers = (GCSCopilotFusedControllers *)v17;

  }
  return v7;
}

- (BOOL)showGCPreferencesPane
{
  return -[GCUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", CFSTR("showGCPrefsPane"));
}

- (void)setShowGCPreferencesPane:(BOOL)a3
{
  -[GCUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", a3, CFSTR("showGCPrefsPane"));
  notify_post("com.apple.systemsettings.extensions.didchange");
}

- (id)profileForPersistentControllerIdentifier:(id)a3 appBundleIdentifier:(id)a4
{
  id v6;
  void *v7;
  GCSGames *games;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[GCSGames gameWithBundleIdentifier:](self->_games, "gameWithBundleIdentifier:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    games = self->_games;
    +[GCSGame defaultIdentifier](GCSGame, "defaultIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GCSGames gameWithBundleIdentifier:](games, "gameWithBundleIdentifier:", v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "profileUUIDForPersistentControllerIdentifier:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[GCSProfiles profileForIdentifier:](self->_profiles, "profileForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)savedDataMeetsRequiredVersion:(id)a3
{
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(a3, "shortenedVersionNumberString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString shortenedVersionNumberString](self->_settingsVersion, "shortenedVersionNumberString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "compare:options:", v5, 64) != 1;

  return v6;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  objc_super v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "isEqualToString:", CFSTR("settingsVersion")))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GCSSettingsStore setSettingsVersion:](self, "setSettingsVersion:", v13);
      getGCSLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        goto LABEL_7;
    }
    else
    {
      -[GCSSettingsStore setSettingsVersion:](self, "setSettingsVersion:", CFSTR("0.0.0"));
      getGCSLogger();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
LABEL_7:
        -[GCSSettingsStore settingsVersion](self, "settingsVersion");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v18 = v15;
        _os_log_impl(&dword_2159AA000, v14, OS_LOG_TYPE_INFO, "GCSSettingsStore.settingsVersion = %@", buf, 0xCu);

      }
    }

    goto LABEL_9;
  }
  v16.receiver = self;
  v16.super_class = (Class)GCSSettingsStore;
  -[GCSSettingsStore observeValueForKeyPath:ofObject:change:context:](&v16, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
  v13 = v12;
LABEL_9:

}

- (void)dealloc
{
  objc_super v3;

  -[GCUserDefaults removeObserver:forKeyPath:context:](self->_defaults, "removeObserver:forKeyPath:context:", self, CFSTR("settingsVersion"), 0);
  v3.receiver = self;
  v3.super_class = (Class)GCSSettingsStore;
  -[GCSSettingsStore dealloc](&v3, sel_dealloc);
}

- (NSString)settingsVersion
{
  return self->_settingsVersion;
}

- (void)setSettingsVersion:(id)a3
{
  objc_storeStrong((id *)&self->_settingsVersion, a3);
}

- (GCSGames)games
{
  return self->_games;
}

- (GCSProfiles)profiles
{
  return self->_profiles;
}

- (GCSMouseProfiles)mouseProfiles
{
  return self->_mouseProfiles;
}

- (GCSControllers)controllers
{
  return self->_controllers;
}

- (GCSCopilotFusedControllers)copilotFusedControllers
{
  return self->_copilotFusedControllers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_copilotFusedControllers, 0);
  objc_storeStrong((id *)&self->_controllers, 0);
  objc_storeStrong((id *)&self->_mouseProfiles, 0);
  objc_storeStrong((id *)&self->_profiles, 0);
  objc_storeStrong((id *)&self->_games, 0);
  objc_storeStrong((id *)&self->_settingsVersion, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
}

@end
