@implementation CalMockPreferenceStore

- (CalMockPreferenceStore)init
{
  CalMockPreferenceStore *v2;
  CalMockPreferenceStore *v3;
  uint64_t v4;
  NSMutableDictionary *keys;
  uint64_t v6;
  NSMutableDictionary *values;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CalMockPreferenceStore;
  v2 = -[CalMockPreferenceStore init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = objc_opt_new();
    keys = v3->_keys;
    v3->_keys = (NSMutableDictionary *)v4;

    v6 = objc_opt_new();
    values = v3->_values;
    v3->_values = (NSMutableDictionary *)v6;

  }
  return v3;
}

- (CalMockPreferenceStore)initWithPath:(id)a3
{
  id v4;
  CalMockPreferenceStore *v5;
  CalMockPreferenceStore *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *keys;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *values;
  uint64_t v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  NSMutableDictionary *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CalMockPreferenceStore;
  v5 = -[CalMockPreferenceStore init](&v20, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    +[CalMockPreferenceStore storagePathForDirectory:](CalMockPreferenceStore, "storagePathForDirectory:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&v6->_path, v7);
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("keys"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[CalMockPreferenceStore decodeKeysDictionary:](CalMockPreferenceStore, "decodeKeysDictionary:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    keys = v6->_keys;
    v6->_keys = (NSMutableDictionary *)v10;

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("values"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");
    values = v6->_values;
    v6->_values = (NSMutableDictionary *)v13;

    if (!v6->_keys)
    {
      v15 = objc_opt_new();
      v16 = v6->_keys;
      v6->_keys = (NSMutableDictionary *)v15;

    }
    if (!v6->_values)
    {
      v17 = objc_opt_new();
      v18 = v6->_values;
      v6->_values = (NSMutableDictionary *)v17;

    }
  }

  return v6;
}

+ (id)preferencesStoreForPath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  CalMockPreferenceStore *v7;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&preferencesStoreForPath__globalLock);
  v4 = (void *)preferencesStoreForPath__preferencesByPath;
  if (!preferencesStoreForPath__preferencesByPath)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)preferencesStoreForPath__preferencesByPath;
    preferencesStoreForPath__preferencesByPath = v5;

    v4 = (void *)preferencesStoreForPath__preferencesByPath;
  }
  objc_msgSend(v4, "objectForKey:", v3);
  v7 = (CalMockPreferenceStore *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = -[CalMockPreferenceStore initWithPath:]([CalMockPreferenceStore alloc], "initWithPath:", v3);
    objc_msgSend((id)preferencesStoreForPath__preferencesByPath, "setObject:forKey:", v7, v3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&preferencesStoreForPath__globalLock);

  return v7;
}

+ (id)inMemoryStore
{
  return objc_alloc_init((Class)a1);
}

+ (id)storagePathForDirectory:(id)a3
{
  return (id)objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("CalPreferences.plist"));
}

- (BOOL)getBoolean:(BOOL *)a3 forDomain:(id)a4 key:(id)a5
{
  _BOOL4 v6;
  id v7;
  BOOL v8;
  id v10;

  v10 = 0;
  v6 = -[CalMockPreferenceStore getValue:forDomain:key:](self, "getValue:forDomain:key:", &v10, a4, a5);
  v7 = v10;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a3 = objc_msgSend(v7, "BOOLValue");
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)getInteger:(int64_t *)a3 forDomain:(id)a4 key:(id)a5
{
  _BOOL4 v6;
  id v7;
  BOOL v8;
  id v10;

  v10 = 0;
  v6 = -[CalMockPreferenceStore getValue:forDomain:key:](self, "getValue:forDomain:key:", &v10, a4, a5);
  v7 = v10;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    *a3 = objc_msgSend(v7, "integerValue");
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)getValue:(id *)a3 forDomain:(id)a4 key:(id)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;

  p_lock = &self->_lock;
  v9 = a5;
  v10 = a4;
  os_unfair_lock_lock(p_lock);
  LOBYTE(a3) = -[CalMockPreferenceStore _getValue:forDomain:key:](self, "_getValue:forDomain:key:", a3, v10, v9);

  os_unfair_lock_unlock(p_lock);
  return (char)a3;
}

- (BOOL)_getValue:(id *)a3 forDomain:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_keys, "objectForKeyedSubscript:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && objc_msgSend(v12, "containsObject:", v10))
    {
      if (a3)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v8);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v10);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v11 = 1;
    }
    else
    {
      v11 = 0;
    }

  }
  return v11;
}

- (void)setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
  os_unfair_lock_s *p_lock;
  id v9;
  id v10;
  id v11;

  p_lock = &self->_lock;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  os_unfair_lock_lock(p_lock);
  -[CalMockPreferenceStore _setValue:forDomain:key:](self, "_setValue:forDomain:key:", v11, v10, v9);

  os_unfair_lock_unlock(p_lock);
}

- (void)_setValue:(id)a3 forDomain:(id)a4 key:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  NSObject *v19;
  id v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v9 && v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_keys, "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_keys, "setObject:forKeyedSubscript:", v12, v9);
    }
    objc_msgSend(v12, "addObject:", v11);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_values, "objectForKeyedSubscript:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      v13 = (void *)objc_opt_new();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_values, "setObject:forKeyedSubscript:", v13, v9);
    }
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v8, v11);
    if (self->_path)
    {
      v21[0] = CFSTR("keys");
      +[CalMockPreferenceStore encodeKeysDictionary:](CalMockPreferenceStore, "encodeKeysDictionary:", self->_keys);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[1] = CFSTR("values");
      v22[0] = v14;
      v22[1] = self->_values;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_path);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 0;
      v17 = objc_msgSend(v15, "writeToURL:error:", v16, &v20);
      v18 = v20;

      if ((v17 & 1) == 0)
      {
        +[CalPreferences log](CalPreferences, "log");
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          -[CalMockPreferenceStore _setValue:forDomain:key:].cold.1((uint64_t)v18, v19);

      }
    }

  }
}

+ (id)encodeKeysDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)decodeKeysDictionary:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9);
        v11 = objc_alloc(MEMORY[0x1E0C99E20]);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_values, 0);
  objc_storeStrong((id *)&self->_keys, 0);
}

- (void)_setValue:(uint64_t)a1 forDomain:(NSObject *)a2 key:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18FC12000, a2, OS_LOG_TYPE_ERROR, "Couldn't save preferences: %@", (uint8_t *)&v2, 0xCu);
}

@end
