@implementation OSLogPreferencesManager

- (OSLogPreferencesManager)init
{
  OSLogPreferencesManager *v2;
  OSLogPreferencesManager *v3;
  NSString *name;
  void *v5;
  void *v6;
  uint64_t v7;
  NSString *prefsFile;
  uint64_t v9;
  NSMutableDictionary *prefs;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)OSLogPreferencesManager;
  v2 = -[OSLogPreferencesManager init](&v12, sel_init);
  v3 = v2;
  if (v2)
  {
    name = v2->_name;
    v2->_name = (NSString *)CFSTR("com.apple.system.logging");

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_prefsdir_path());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v3->_name);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathExtension:", CFSTR("plist"));
    v7 = objc_claimAutoreleasedReturnValue();
    prefsFile = v3->_prefsFile;
    v3->_prefsFile = (NSString *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v3->_prefsFile);
    v9 = objc_claimAutoreleasedReturnValue();
    prefs = v3->_prefs;
    v3->_prefs = (NSMutableDictionary *)v9;

  }
  return v3;
}

- (NSArray)processes
{
  return (NSArray *)OSLogPreferencesList(CFSTR("Processes"));
}

- (NSArray)subsystems
{
  return (NSArray *)OSLogPreferencesList(CFSTR("Subsystems"));
}

- (int64_t)enabledLevel
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", CFSTR("Level"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LevelForKey(v2, (uint64_t)CFSTR("Enable"));
  if (v3 == 1)
    v4 = 3;
  else
    v4 = v3;

  return v4;
}

- (int64_t)persistedLevel
{
  void *v2;
  uint64_t v3;
  int64_t v4;

  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", CFSTR("Level"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LevelForKey(v2, (uint64_t)CFSTR("Persist"));
  if (v3 == 1)
    v4 = 2;
  else
    v4 = v3;

  return v4;
}

- (id)_levelPrefs
{
  NSMutableDictionary *prefs;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;
  void *v6;

  prefs = self->_prefs;
  if (!prefs)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v5 = self->_prefs;
    self->_prefs = v4;

    prefs = self->_prefs;
  }
  -[NSMutableDictionary objectForKey:](prefs, "objectForKey:", CFSTR("Level"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_prefs, "setObject:forKey:", v6, CFSTR("Level"));
  }
  return v6;
}

- (void)setEnabledLevel:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  -[OSLogPreferencesManager _levelPrefs](self, "_levelPrefs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 > 4)
    v6 = CFSTR("inherit");
  else
    v6 = off_1E4157CB8[a3];
  v8 = v5;
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("Enable"));
  if (_LevelForKey(v8, (uint64_t)CFSTR("Persist")) > a3)
  {
    if ((unint64_t)a3 > 4)
      v7 = CFSTR("inherit");
    else
      v7 = off_1E4157CB8[a3];
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("Persist"));
  }
  _OSLogInstallPreferences(1u, self->_name, (uint64_t)self->_prefs);

}

- (void)setPersistedLevel:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  -[OSLogPreferencesManager _levelPrefs](self, "_levelPrefs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 > 4)
    v6 = CFSTR("inherit");
  else
    v6 = off_1E4157CB8[a3];
  v8 = v5;
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("Persist"));
  if (_LevelForKey(v8, (uint64_t)CFSTR("Enable")) < a3)
  {
    if ((unint64_t)a3 > 4)
      v7 = CFSTR("inherit");
    else
      v7 = off_1E4157CB8[a3];
    objc_msgSend(v8, "setObject:forKey:", v7, CFSTR("Enable"));
  }
  _OSLogInstallPreferences(1u, self->_name, (uint64_t)self->_prefs);

}

- (void)reset
{
  NSMutableDictionary *prefs;

  prefs = self->_prefs;
  self->_prefs = 0;

  _OSLogRemovePreferences(1u, self->_name);
}

- (void)resetAll
{
  -[OSLogPreferencesManager reset](self, "reset");
  -[OSLogPreferencesManager resetAllProcesses](self, "resetAllProcesses");
  -[OSLogPreferencesManager resetAllSubsystems](self, "resetAllSubsystems");
}

- (void)resetAllProcesses
{
  id v2;

  -[OSLogPreferencesManager processes](self, "processes");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_25);

}

- (void)resetAllSubsystems
{
  id v2;

  -[OSLogPreferencesManager subsystems](self, "subsystems");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", &__block_literal_global_27);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_prefsFile, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

void __45__OSLogPreferencesManager_resetAllSubsystems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  OSLogPreferencesSubsystem *v3;

  v2 = a2;
  v3 = -[OSLogPreferencesSubsystem initWithName:]([OSLogPreferencesSubsystem alloc], "initWithName:", v2);

  -[OSLogPreferencesSubsystem resetAll](v3, "resetAll");
}

void __44__OSLogPreferencesManager_resetAllProcesses__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  OSLogPreferencesProcess *v3;

  v2 = a2;
  v3 = -[OSLogPreferencesProcess initWithBundleID:]([OSLogPreferencesProcess alloc], "initWithBundleID:", v2);

  -[OSLogPreferencesProcess reset](v3, "reset");
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_13);
  return (id)sharedManager_manager;
}

void __40__OSLogPreferencesManager_sharedManager__block_invoke()
{
  OSLogPreferencesManager *v0;
  void *v1;

  v0 = objc_alloc_init(OSLogPreferencesManager);
  v1 = (void *)sharedManager_manager;
  sharedManager_manager = (uint64_t)v0;

}

@end
