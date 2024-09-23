@implementation GEOConfigStorageCached

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  GEOConfigStorageReadOnly *direct;
  NSDictionary *v14;
  uint64_t v15;
  NSDictionary *cachedValues;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  NSObject *v23;
  id v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = objc_msgSend(v10, "length");
  if ((a5 & 0x2000) != 0 && v12 && (direct = self->_direct) != 0)
  {
    -[GEOConfigStorageReadOnly getConfigValueForKey:countryCode:options:source:](direct, "getConfigValueForKey:countryCode:options:source:", v10, v11, a5, a6);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    os_unfair_recursive_lock_lock_with_options();
    if (!self->_cachedValues)
    {
      os_unfair_recursive_lock_unlock();
      os_unfair_recursive_lock_lock_with_options();
      if (!self->_cachedValues)
        -[GEOConfigStorageCached resync](self, "resync");
    }
    v15 = objc_msgSend(v10, "length");
    cachedValues = self->_cachedValues;
    if (v15)
    {
      GEOConfig_getCountryAwareValueForKeyFromDictionary(v11, v10, cachedValues);
      v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      if (!v14)
      {
        GEOConfig_stripEntitlement(v10);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        GEOConfig_getCountryAwareValueForKeyFromDictionary(v11, v17, self->_cachedValues);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          +[GEOConfigStorageClient shared](GEOConfigStorageClient, "shared");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "migrateEntitledKey:options:", v10, a5);

          +[GEOApplicationAuditToken currentProcessAuditToken](GEOApplicationAuditToken, "currentProcessAuditToken");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = 0;
          v21 = GEOConfig_validateEntitlementForKey(v10, v20, &v25);
          v22 = v25;

          if (v21)
          {
            v14 = v18;
          }
          else
          {
            j__GEOGetUserDefaultsLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v27 = v22;
              _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "Not allowing access (read): %@", buf, 0xCu);
            }

            v14 = 0;
          }

        }
        else
        {
          v14 = 0;
        }

      }
    }
    else
    {
      v14 = cachedValues;
    }
    os_unfair_recursive_lock_unlock();
    if (a6 && v14)
      *a6 = self->_source;
  }

  return v14;
}

- (id)initForSource:(int64_t)a3
{
  GEOConfigStorageCached *v3;
  GEOConfigStorageCached *v5;
  GEOConfigStorageCached *v6;
  uint64_t v7;
  GEOConfigStorageReadOnly *direct;
  NSObject *v10;
  const char *v11;
  void *v12;
  objc_super v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v3 = self;
  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v13.receiver = self;
    v13.super_class = (Class)GEOConfigStorageCached;
    v5 = -[GEOConfigStorageCached init](&v13, sel_init);
    v3 = v5;
    if (v5)
    {
      v5->_source = a3;
      switch(a3)
      {
        case 1:
        case 4:
        case 5:
        case 9:
          v5->_options = 0;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            goto LABEL_5;
          *(_WORD *)buf = 0;
          v10 = MEMORY[0x1E0C81028];
          v11 = "Assertion failed: _options != GEOConfigOption_None";
          goto LABEL_18;
        case 3:
          v5->_options = 0x10000;
          v5->_cacheLock = 0;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            goto LABEL_10;
          goto LABEL_19;
        case 6:
          v5->_options = 0x20000;
          v5->_cacheLock = 0;
          _GEOConfigStorageDirectSystemReadOnly();
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        case 7:
          v5->_options = 0x40000;
          v5->_cacheLock = 0;
          _GEOConfigStorageDirectUserReadOnly();
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        case 8:
          v7 = 0;
          v3->_options = 0x80000;
          v3->_cacheLock = 0;
          goto LABEL_14;
        default:
          v5->_options = 983040;
          v5->_cacheLock = 0;
          if (a3 != 2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
LABEL_19:
            GEODefaultsSourceAsString(a3);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v15 = v12;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unreachable reached: source == %@", buf, 0xCu);

          }
LABEL_10:
          v7 = 0;
LABEL_14:
          direct = v3->_direct;
          v3->_direct = (GEOConfigStorageReadOnly *)v7;

          break;
      }
    }
    v3 = v3;
    v6 = v3;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      v10 = MEMORY[0x1E0C81028];
      v11 = "Assertion failed: source != GEODefaultsSourceNone";
LABEL_18:
      _os_log_fault_impl(&dword_1885A9000, v10, OS_LOG_TYPE_FAULT, v11, buf, 2u);
    }
LABEL_5:
    v6 = 0;
  }

  return v6;
}

- (void)resync
{
  atomic_flag *p_isResyncing;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  id v7;

  p_isResyncing = &self->_isResyncing;
  do
    v4 = __ldaxr((unsigned __int8 *)p_isResyncing);
  while (__stlxr(1u, (unsigned __int8 *)p_isResyncing));
  if ((v4 & 1) == 0)
  {
    -[GEOConfigStorageReadOnly resync](self->_direct, "resync");
    +[GEOConfigStorageClient shared](GEOConfigStorageClient, "shared");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getAllKeysAndValuesForOptions:", self->_options);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    os_unfair_recursive_lock_lock_with_options();
    if (v7)
      v6 = v7;
    else
      v6 = (void *)MEMORY[0x1E0C9AA70];
    objc_storeStrong((id *)&self->_cachedValues, v6);
    os_unfair_recursive_lock_unlock();
    atomic_store(0, (unsigned __int8 *)&self->_isResyncing);

  }
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  id v11;

  v6 = a6;
  v9 = a4;
  v10 = a3;
  +[GEOConfigStorageClient shared](GEOConfigStorageClient, "shared");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setConfigValue:forKey:options:synchronous:", v10, v9, a5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_direct, 0);
  objc_storeStrong((id *)&self->_cachedValues, 0);
}

@end
