@implementation MEExtensionUserPreferences

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__MEExtensionUserPreferences_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1)
    dispatch_once(&log_onceToken_2, block);
  return (id)log_log_2;
}

void __33__MEExtensionUserPreferences_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  return (id)sharedInstance_sInstance;
}

void __44__MEExtensionUserPreferences_sharedInstance__block_invoke()
{
  MEExtensionUserPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(MEExtensionUserPreferences);
  v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;

}

- (id)_plistURL
{
  if (_plistURL_onceToken != -1)
    dispatch_once(&_plistURL_onceToken, &__block_literal_global_5);
  return (id)_plistURL_url;
}

void __39__MEExtensionUserPreferences__plistURL__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x24BE2E3D8], "mailDataDirectory");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("AppExtensionUserPreferences.plist"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_plistURL_url;
  _plistURL_url = v0;

}

- (id)_prefsDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDBCE50]);
  -[MEExtensionUserPreferences _plistURL](self, "_plistURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithContentsOfURL:", v4);

  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v5, 1, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_loadUserPreferences
{
  NSMutableDictionary *v3;
  NSMutableDictionary *extensionIDToUserEnabledMap;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;

  -[MEExtensionUserPreferences _prefsDictionary](self, "_prefsDictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  extensionIDToUserEnabledMap = self->_extensionIDToUserEnabledMap;
  self->_extensionIDToUserEnabledMap = v3;

  v5 = self->_extensionIDToUserEnabledMap;
  if (!v5)
  {
    v6 = (NSMutableDictionary *)objc_opt_new();
    v7 = self->_extensionIDToUserEnabledMap;
    self->_extensionIDToUserEnabledMap = v6;

    v5 = self->_extensionIDToUserEnabledMap;
  }
  return v5;
}

- (BOOL)isExtensionEnabled:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  -[MEExtensionUserPreferences _loadUserPreferences](self, "_loadUserPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("MEExtensionUserEnabled"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = objc_msgSend(v8, "BOOLValue");

  return (char)p_lock;
}

- (void)setExtensionEnabled:(BOOL)a3 forExtensionID:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  -[MEExtensionUserPreferences _loadUserPreferences](self, "_loadUserPreferences");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("MEExtensionUserEnabled"));

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_extensionIDToUserEnabledMap, "setObject:forKeyedSubscript:", v7, v9);
  -[MEExtensionUserPreferences _savePreferences](self, "_savePreferences");

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_savePreferences
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_20BB85000, a2, OS_LOG_TYPE_DEBUG, "Saving Extension Preferences Dict %@", (uint8_t *)&v3, 0xCu);
}

- (id)_serializedData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v11;
  uint8_t buf[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD1770];
  v4 = (void *)-[NSMutableDictionary copy](self->_extensionIDToUserEnabledMap, "copy");
  v11 = 0;
  objc_msgSend(v3, "dataWithPropertyList:format:options:error:", v4, 200, 0, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;

  if (!v5)
  {
    +[MEExtensionUserPreferences log](MEExtensionUserPreferences, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = -[NSMutableDictionary count](self->_extensionIDToUserEnabledMap, "count");
      objc_msgSend(v6, "ef_publicDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MEExtensionUserPreferences _serializedData].cold.1(v9, buf, v8, v7);
    }

  }
  return v5;
}

- (NSMutableDictionary)extensionIDToUserEnabledMap
{
  return self->_extensionIDToUserEnabledMap;
}

- (void)setExtensionIDToUserEnabledMap:(id)a3
{
  objc_storeStrong((id *)&self->_extensionIDToUserEnabledMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionIDToUserEnabledMap, 0);
}

- (void)_serializedData
{
  *(_DWORD *)buf = 134218242;
  *(_QWORD *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(_QWORD *)(buf + 14) = a1;
  _os_log_error_impl(&dword_20BB85000, log, OS_LOG_TYPE_ERROR, "Failed to serialize %lu entries: %{public}@", buf, 0x16u);

}

@end
