@implementation OSLogPreferencesProcess

- (OSLogPreferencesProcess)initWithBundleID:(id)a3
{
  id v4;
  OSLogPreferencesProcess *v5;
  uint64_t v6;
  NSString *bundleID;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSString *systemPrefsFile;
  uint64_t v13;
  NSDictionary *systemPrefs;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSString *internalPrefsFile;
  uint64_t v20;
  NSDictionary *internalPrefs;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSString *prefsFile;
  uint64_t v27;
  NSMutableDictionary *prefs;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)OSLogPreferencesProcess;
  v5 = -[OSLogPreferencesProcess init](&v30, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    bundleID = v5->_bundleID;
    v5->_bundleID = (NSString *)v6;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_sysprefsdir_path());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Processes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathExtension:", CFSTR("plist"));
    v11 = objc_claimAutoreleasedReturnValue();
    systemPrefsFile = v5->_systemPrefsFile;
    v5->_systemPrefsFile = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5->_systemPrefsFile);
    v13 = objc_claimAutoreleasedReturnValue();
    systemPrefs = v5->_systemPrefs;
    v5->_systemPrefs = (NSDictionary *)v13;

    if (_os_trace_is_development_build())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_intprefsdir_path());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingPathComponent:", CFSTR("Processes"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathComponent:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringByAppendingPathExtension:", CFSTR("plist"));
      v18 = objc_claimAutoreleasedReturnValue();
      internalPrefsFile = v5->_internalPrefsFile;
      v5->_internalPrefsFile = (NSString *)v18;

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5->_internalPrefsFile);
      v20 = objc_claimAutoreleasedReturnValue();
      internalPrefs = v5->_internalPrefs;
      v5->_internalPrefs = (NSDictionary *)v20;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_prefsdir_path());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringByAppendingPathComponent:", CFSTR("Processes"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByAppendingPathComponent:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingPathExtension:", CFSTR("plist"));
    v25 = objc_claimAutoreleasedReturnValue();
    prefsFile = v5->_prefsFile;
    v5->_prefsFile = (NSString *)v25;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v5->_prefsFile);
    v27 = objc_claimAutoreleasedReturnValue();
    prefs = v5->_prefs;
    v5->_prefs = (NSMutableDictionary *)v27;

  }
  return v5;
}

- (BOOL)isLocked
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", CFSTR("Locked"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (int64_t)effectiveEnabledLevel
{
  int64_t result;
  void *v4;
  int64_t v5;

  result = -[OSLogPreferencesProcess enabledLevel](self, "enabledLevel");
  if (result == 1)
  {
    result = -[OSLogPreferencesProcess defaultEnabledLevel](self, "defaultEnabledLevel");
    if (result == 1)
    {
      +[OSLogPreferencesManager sharedManager](OSLogPreferencesManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "enabledLevel");

      return v5;
    }
  }
  return result;
}

- (int64_t)effectivePersistedLevel
{
  int64_t result;
  void *v4;
  int64_t v5;

  result = -[OSLogPreferencesProcess persistedLevel](self, "persistedLevel");
  if (result == 1)
  {
    result = -[OSLogPreferencesProcess defaultPersistedLevel](self, "defaultPersistedLevel");
    if (result == 1)
    {
      +[OSLogPreferencesManager sharedManager](OSLogPreferencesManager, "sharedManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "persistedLevel");

      return v5;
    }
  }
  return result;
}

- (int64_t)defaultEnabledLevel
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[NSDictionary objectForKey:](self->_internalPrefs, "objectForKey:", CFSTR("Level"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LevelForKey(v3, (uint64_t)CFSTR("Enable"));
  if (v4 == 1)
  {
    -[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", CFSTR("Level"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = _LevelForKey(v5, (uint64_t)CFSTR("Enable"));
    v3 = v5;
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (int64_t)defaultPersistedLevel
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t v6;

  -[NSDictionary objectForKey:](self->_internalPrefs, "objectForKey:", CFSTR("Level"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = _LevelForKey(v3, (uint64_t)CFSTR("Persist"));
  if (v4 == 1)
  {
    -[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", CFSTR("Level"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = _LevelForKey(v5, (uint64_t)CFSTR("Persist"));
    v3 = v5;
  }
  else
  {
    v6 = v4;
  }

  return v6;
}

- (int64_t)enabledLevel
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", CFSTR("Level"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LevelForKey(v2, (uint64_t)CFSTR("Enable"));

  return v3;
}

- (int64_t)persistedLevel
{
  void *v2;
  int64_t v3;

  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", CFSTR("Level"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = _LevelForKey(v2, (uint64_t)CFSTR("Persist"));

  return v3;
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

  if (!-[OSLogPreferencesProcess isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesProcess _levelPrefs](self, "_levelPrefs");
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
    _OSLogInstallPreferences(2u, self->_bundleID, (uint64_t)self->_prefs);

  }
}

- (void)setPersistedLevel:(int64_t)a3
{
  void *v5;
  const __CFString *v6;
  const __CFString *v7;
  id v8;

  if (!-[OSLogPreferencesProcess isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesProcess _levelPrefs](self, "_levelPrefs");
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
    _OSLogInstallPreferences(2u, self->_bundleID, (uint64_t)self->_prefs);

  }
}

- (void)reset
{
  NSMutableDictionary *prefs;

  if (!-[OSLogPreferencesProcess isLocked](self, "isLocked"))
  {
    prefs = self->_prefs;
    self->_prefs = 0;

    _OSLogRemovePreferences(2u, self->_bundleID);
  }
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_prefsFile, 0);
  objc_storeStrong((id *)&self->_internalPrefs, 0);
  objc_storeStrong((id *)&self->_internalPrefsFile, 0);
  objc_storeStrong((id *)&self->_systemPrefs, 0);
  objc_storeStrong((id *)&self->_systemPrefsFile, 0);
}

@end
