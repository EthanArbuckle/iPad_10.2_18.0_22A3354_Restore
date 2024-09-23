@implementation OSLogPreferencesSubsystem

- (BOOL)isLocked
{
  void *v2;
  BOOL v3;

  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", CFSTR("Locked"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)_setSignpostPersisted:(BOOL)a3 forCategory:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  -[OSLogPreferencesSubsystem _prefsForCategory:](self, "_prefsForCategory:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("Signpost-Persisted"));

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (id)_prefsForCategory:(id)a3
{
  id v4;
  NSMutableDictionary *prefs;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  void *v8;

  v4 = a3;
  prefs = self->_prefs;
  if (!prefs)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
    v7 = self->_prefs;
    self->_prefs = v6;

    prefs = self->_prefs;
  }
  -[NSMutableDictionary objectForKey:](prefs, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_prefs, "setObject:forKey:", v8, v4);
  }

  return v8;
}

- (void)_resetCategory:(id)a3
{
  NSMutableDictionary *prefs;

  -[NSMutableDictionary removeObjectForKey:](self->_prefs, "removeObjectForKey:", a3);
  if (-[NSMutableDictionary count](self->_prefs, "count"))
  {
    _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
  }
  else
  {
    prefs = self->_prefs;
    self->_prefs = 0;

    _OSLogRemovePreferences(3u, self->_name);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_prefs, 0);
  objc_storeStrong((id *)&self->_prefsFile, 0);
  objc_storeStrong((id *)&self->_internalPrefs, 0);
  objc_storeStrong((id *)&self->_internalPrefsFile, 0);
  objc_storeStrong((id *)&self->_systemPrefs, 0);
}

- (OSLogPreferencesSubsystem)initWithName:(id)a3
{
  id v4;
  OSLogPreferencesSubsystem *v5;
  uint64_t v6;
  NSString *name;
  id v8;
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
  void *v19;
  void *v20;
  NSDictionary *v21;
  NSDictionary *systemPrefs;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  NSString *internalPrefsFile;
  uint64_t v28;
  NSDictionary *internalPrefs;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *prefsFile;
  uint64_t v35;
  NSMutableDictionary *prefs;
  objc_super v38;

  v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)OSLogPreferencesSubsystem;
  v5 = -[OSLogPreferencesSubsystem init](&v38, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = v4;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_app_cryptex_sysprefsdir_path());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("Subsystems"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringByAppendingPathComponent:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("plist"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_os_cryptex_sysprefsdir_path());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByAppendingPathComponent:", CFSTR("Subsystems"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingPathComponent:", v8);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringByAppendingPathExtension:", CFSTR("plist"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        v12 = v17;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_sysprefsdir_path());
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringByAppendingPathComponent:", CFSTR("Subsystems"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "stringByAppendingPathComponent:", v8);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "stringByAppendingPathExtension:", CFSTR("plist"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
    v21 = v13;

    systemPrefs = v5->_systemPrefs;
    v5->_systemPrefs = v21;

    if (_os_trace_is_development_build())
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_intprefsdir_path());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "stringByAppendingPathComponent:", CFSTR("Subsystems"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringByAppendingPathComponent:", v8);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "stringByAppendingPathExtension:", CFSTR("plist"));
      v26 = objc_claimAutoreleasedReturnValue();
      internalPrefsFile = v5->_internalPrefsFile;
      v5->_internalPrefsFile = (NSString *)v26;

      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v5->_internalPrefsFile);
      v28 = objc_claimAutoreleasedReturnValue();
      internalPrefs = v5->_internalPrefs;
      v5->_internalPrefs = (NSDictionary *)v28;

    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _os_trace_prefsdir_path());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringByAppendingPathComponent:", CFSTR("Subsystems"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "stringByAppendingPathComponent:", v8);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "stringByAppendingPathExtension:", CFSTR("plist"));
    v33 = objc_claimAutoreleasedReturnValue();
    prefsFile = v5->_prefsFile;
    v5->_prefsFile = (NSString *)v33;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithContentsOfFile:", v5->_prefsFile);
    v35 = objc_claimAutoreleasedReturnValue();
    prefs = v5->_prefs;
    v5->_prefs = (NSMutableDictionary *)v35;

  }
  return v5;
}

- (NSArray)categories
{
  void *v3;
  NSDictionary *systemPrefs;
  uint64_t v5;
  id v6;
  NSDictionary *internalPrefs;
  id v8;
  NSMutableDictionary *prefs;
  id v10;
  void *v11;
  NSArray *v12;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  systemPrefs = self->_systemPrefs;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __39__OSLogPreferencesSubsystem_categories__block_invoke;
  v18[3] = &unk_1E4157C30;
  v6 = v3;
  v19 = v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](systemPrefs, "enumerateKeysAndObjectsUsingBlock:", v18);
  internalPrefs = self->_internalPrefs;
  v16[0] = v5;
  v16[1] = 3221225472;
  v16[2] = __39__OSLogPreferencesSubsystem_categories__block_invoke_2;
  v16[3] = &unk_1E4157C30;
  v8 = v6;
  v17 = v8;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](internalPrefs, "enumerateKeysAndObjectsUsingBlock:", v16);
  prefs = self->_prefs;
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __39__OSLogPreferencesSubsystem_categories__block_invoke_3;
  v14[3] = &unk_1E4157C30;
  v10 = v8;
  v15 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](prefs, "enumerateKeysAndObjectsUsingBlock:", v14);
  v11 = v15;
  v12 = (NSArray *)v10;

  return v12;
}

- (int64_t)effectiveEnabledLevel
{
  int64_t result;
  void *v4;
  int64_t v5;

  result = -[OSLogPreferencesSubsystem enabledLevel](self, "enabledLevel");
  if (result == 1)
  {
    result = -[OSLogPreferencesSubsystem defaultEnabledLevel](self, "defaultEnabledLevel");
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

  result = -[OSLogPreferencesSubsystem persistedLevel](self, "persistedLevel");
  if (result == 1)
  {
    result = -[OSLogPreferencesSubsystem defaultPersistedLevel](self, "defaultPersistedLevel");
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
  return -[OSLogPreferencesSubsystem _defaultEnabledLevelForCategory:](self, "_defaultEnabledLevelForCategory:", CFSTR("DEFAULT-OPTIONS"));
}

- (int64_t)defaultPersistedLevel
{
  return -[OSLogPreferencesSubsystem _defaultPersistedLevelForCategory:](self, "_defaultPersistedLevelForCategory:", CFSTR("DEFAULT-OPTIONS"));
}

- (int64_t)enabledLevel
{
  return -[OSLogPreferencesSubsystem _enabledLevelForCategory:](self, "_enabledLevelForCategory:", CFSTR("DEFAULT-OPTIONS"));
}

- (int64_t)persistedLevel
{
  return -[OSLogPreferencesSubsystem _persistedLevelForCategory:](self, "_persistedLevelForCategory:", CFSTR("DEFAULT-OPTIONS"));
}

- (void)setEnabledLevel:(int64_t)a3
{
  if (!-[OSLogPreferencesSubsystem isLocked](self, "isLocked"))
    -[OSLogPreferencesSubsystem _setEnabledLevel:forCategory:](self, "_setEnabledLevel:forCategory:", a3, CFSTR("DEFAULT-OPTIONS"));
}

- (void)setPersistedLevel:(int64_t)a3
{
  if (!-[OSLogPreferencesSubsystem isLocked](self, "isLocked"))
    -[OSLogPreferencesSubsystem _setPersistedLevel:forCategory:](self, "_setPersistedLevel:forCategory:", a3, CFSTR("DEFAULT-OPTIONS"));
}

- (void)reset
{
  if (!-[OSLogPreferencesSubsystem isLocked](self, "isLocked"))
    -[OSLogPreferencesSubsystem _resetCategory:](self, "_resetCategory:", CFSTR("DEFAULT-OPTIONS"));
}

- (void)resetAll
{
  NSMutableDictionary *prefs;

  if (!-[OSLogPreferencesSubsystem isLocked](self, "isLocked"))
  {
    prefs = self->_prefs;
    self->_prefs = 0;

    _OSLogRemovePreferences(3u, self->_name);
  }
}

- (int64_t)_defaultEnabledLevelForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_internalPrefs, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Level"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _LevelForKey(v6, (uint64_t)CFSTR("Enable"));
  if (v7 == 1)
  {
    -[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("Level"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = _LevelForKey(v9, (uint64_t)CFSTR("Enable"));
    v6 = v9;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (int64_t)_defaultPersistedLevelForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int64_t v10;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_internalPrefs, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Level"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = _LevelForKey(v6, (uint64_t)CFSTR("Persist"));
  if (v7 == 1)
  {
    -[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("Level"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = _LevelForKey(v9, (uint64_t)CFSTR("Persist"));
    v6 = v9;
  }
  else
  {
    v10 = v7;
  }

  return v10;
}

- (int64_t)_enabledLevelForCategory:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Level"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = _LevelForKey(v4, (uint64_t)CFSTR("Enable"));
  return v5;
}

- (int64_t)_persistedLevelForCategory:(id)a3
{
  void *v3;
  void *v4;
  int64_t v5;

  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Level"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = _LevelForKey(v4, (uint64_t)CFSTR("Persist"));
  return v5;
}

- (BOOL)_signpostEnabledForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Signpost-Enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKey:", CFSTR("Signpost-Enabled")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    LOBYTE(v8) = objc_msgSend(v6, "BOOLValue");

  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("DynamicTracing")) & 1) != 0)
  {
    LOBYTE(v8) = 0;
  }
  else
  {
    v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("DynamicStackTracing")) ^ 1;
  }

  return v8;
}

- (BOOL)_signpostPersistedForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Signpost-Persisted"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKey:", CFSTR("Signpost-Persisted")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    v8 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_signpostBacktracesEnabledForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_prefs, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("Signpost-Backtraces-Enabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[NSDictionary objectForKey:](self->_systemPrefs, "objectForKey:", v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKey:", CFSTR("Signpost-Backtraces-Enabled")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    v8 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("DynamicStackTracing"));
  }

  return v8;
}

- (BOOL)_signpostAllowStreamingForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_prefs, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Signpost-Allow-Streaming"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (-[NSDictionary objectForKeyedSubscript:](self->_systemPrefs, "objectForKeyedSubscript:", v4),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Signpost-Allow-Streaming")),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    v8 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v8 = 1;
  }

  return v8;
}

- (id)_levelPrefsForCategory:(id)a3
{
  void *v3;
  void *v4;

  -[OSLogPreferencesSubsystem _prefsForCategory:](self, "_prefsForCategory:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("Level"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Level"));
  }

  return v4;
}

- (void)_setEnabledLevel:(int64_t)a3 forCategory:(id)a4
{
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;

  -[OSLogPreferencesSubsystem _levelPrefsForCategory:](self, "_levelPrefsForCategory:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 > 4)
    v7 = CFSTR("inherit");
  else
    v7 = off_1E4157CB8[a3];
  v9 = v6;
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("Enable"));
  if (_LevelForKey(v9, (uint64_t)CFSTR("Persist")) > a3)
  {
    if ((unint64_t)a3 > 4)
      v8 = CFSTR("inherit");
    else
      v8 = off_1E4157CB8[a3];
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("Persist"));
  }
  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);

}

- (void)_setPersistedLevel:(int64_t)a3 forCategory:(id)a4
{
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  id v9;

  -[OSLogPreferencesSubsystem _levelPrefsForCategory:](self, "_levelPrefsForCategory:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 > 4)
    v7 = CFSTR("inherit");
  else
    v7 = off_1E4157CB8[a3];
  v9 = v6;
  objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("Persist"));
  if (_LevelForKey(v9, (uint64_t)CFSTR("Enable")) < a3)
  {
    if ((unint64_t)a3 > 4)
      v8 = CFSTR("inherit");
    else
      v8 = off_1E4157CB8[a3];
    objc_msgSend(v9, "setObject:forKey:", v8, CFSTR("Enable"));
  }
  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);

}

- (void)_setSignpostEnabled:(BOOL)a3 forCategory:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  -[OSLogPreferencesSubsystem _prefsForCategory:](self, "_prefsForCategory:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("Signpost-Enabled"));

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setSignpostBacktracesEnabled:(BOOL)a3 forCategory:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  -[OSLogPreferencesSubsystem _prefsForCategory:](self, "_prefsForCategory:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("Signpost-Backtraces-Enabled"));

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (void)_setSignpostAllowStreaming:(BOOL)a3 forCategory:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  -[OSLogPreferencesSubsystem _prefsForCategory:](self, "_prefsForCategory:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, CFSTR("Signpost-Allow-Streaming"));

  _OSLogInstallPreferences(3u, self->_name, (uint64_t)self->_prefs);
}

- (NSString)name
{
  return self->_name;
}

void __39__OSLogPreferencesSubsystem_categories__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT-OPTIONS")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("Locked")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

void __39__OSLogPreferencesSubsystem_categories__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT-OPTIONS")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("Locked")) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

void __39__OSLogPreferencesSubsystem_categories__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DEFAULT-OPTIONS")) & 1) == 0
    && (objc_msgSend(v3, "isEqualToString:", CFSTR("Locked")) & 1) == 0
    && (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
  }

}

@end
