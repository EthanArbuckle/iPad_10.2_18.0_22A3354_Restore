@implementation _LSDAppProtectionAccessManager

- (_LSDAppProtectionAccessManager)init
{
  _LSDAppProtectionAccessManager *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_LSDAppProtectionAccessManager;
  result = -[_LSDAppProtectionAccessManager init](&v3, sel_init);
  if (result)
    result->_dbLock._os_unfair_lock_opaque = 0;
  return result;
}

+ (id)sharedInstance
{
  if (+[_LSDAppProtectionAccessManager sharedInstance]::onceToken != -1)
    dispatch_once(&+[_LSDAppProtectionAccessManager sharedInstance]::onceToken, &__block_literal_global_5);
  return (id)+[_LSDAppProtectionAccessManager sharedInstance]::sharedInstance;
}

- (id)readFromDBWithError:(id *)a3
{
  os_unfair_lock_s *p_dbLock;
  NSDictionary *cache;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSDictionary *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSDictionary **p_cache;
  NSDictionary *v20;
  void *v21;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  p_dbLock = &self->_dbLock;
  os_unfair_lock_lock(&self->_dbLock);
  cache = self->_cache;
  if (!cache)
  {
    v23[0] = CFSTR("hiddenBundleIDs");
    v23[1] = CFSTR("lockedBundleIDs");
    v24[0] = MEMORY[0x1E0C9AA60];
    v24[1] = MEMORY[0x1E0C9AA60];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v8 = self->_cache;
    self->_cache = v7;

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)__LSDefaultsGetSharedInstance(), "appProtectionStoreFileURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "fileExistsAtPath:", v11);

    if ((v12 & 1) == 0)
    {
      _LSAppProtectionLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[_LSDAppProtectionAccessManager readFromDBWithError:].cold.1(v13);

      v14 = self->_cache;
      objc_msgSend((id)__LSDefaultsGetSharedInstance(), "appProtectionStoreFileURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary writeToURL:error:](v14, "writeToURL:error:", v15, a3);

    }
    v16 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend((id)__LSDefaultsGetSharedInstance(), "appProtectionStoreFileURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryWithContentsOfURL:error:", v17, a3);
    v18 = objc_claimAutoreleasedReturnValue();
    v20 = self->_cache;
    p_cache = &self->_cache;
    *p_cache = (NSDictionary *)v18;

    cache = *p_cache;
  }
  v21 = (void *)-[NSDictionary copy](cache, "copy");
  os_unfair_lock_unlock(p_dbLock);
  return v21;
}

- (id)writeToDB:(id)a3
{
  id v4;
  os_unfair_lock_s *p_dbLock;
  NSDictionary *v6;
  NSDictionary *cache;
  NSDictionary *v8;
  void *v9;
  id v10;
  id v12;

  v4 = a3;
  p_dbLock = &self->_dbLock;
  os_unfair_lock_lock(&self->_dbLock);
  v6 = (NSDictionary *)objc_msgSend(v4, "copy");
  cache = self->_cache;
  self->_cache = v6;

  v8 = self->_cache;
  objc_msgSend((id)__LSDefaultsGetSharedInstance(), "appProtectionStoreFileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  -[NSDictionary writeToURL:error:](v8, "writeToURL:error:", v9, &v12);
  v10 = v12;

  os_unfair_lock_unlock(p_dbLock);
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

- (void)readFromDBWithError:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_182882000, log, OS_LOG_TYPE_DEBUG, "appProtectionStore does not exist, creating...", v1, 2u);
}

@end
