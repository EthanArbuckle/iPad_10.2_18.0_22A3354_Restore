@implementation INBundleAccessManager

- (INBundleAccessManager)init
{
  INBundleAccessManager *v2;
  uint64_t v3;
  NSMutableDictionary *securityScopedURLs;
  INBundleAccessManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)INBundleAccessManager;
  v2 = -[INBundleAccessManager init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    securityScopedURLs = v2->_securityScopedURLs;
    v2->_securityScopedURLs = (NSMutableDictionary *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (id)grantForBundleIdentifier:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[INBundleAccessManager _grantForBundleIdentifiers:error:](self, "_grantForBundleIdentifiers:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (id)grantForBundleIdentifiers:(id)a3 error:(id *)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  void *v8;

  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  -[INBundleAccessManager _grantForBundleIdentifiers:error:](self, "_grantForBundleIdentifiers:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (id)_grantForBundleIdentifiers:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  INBundleAccessGrant *v28;
  id *v30;
  _QWORD *v31;
  void *v32;
  id v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  id v38;
  INBundleAccessManager *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const char *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v30 = a4;
  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  ++self->_stats._requestCount;
  v6 = (void *)objc_opt_new();
  v32 = (void *)objc_opt_new();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v7 = v5;
  v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v36)
  {
    v8 = *(_QWORD *)v42;
    v33 = v7;
    v35 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v42 != v8)
          objc_enumerationMutation(v7);
        v10 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        -[INBundleAccessManager securityScopedURLs](self, "securityScopedURLs", v30);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          v13 = INSiriLogContextIntents;
          if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v46 = "-[INBundleAccessManager _grantForBundleIdentifiers:error:]";
            v47 = 2112;
            v48 = v10;
            _os_log_impl(&dword_18BEBC000, v13, OS_LOG_TYPE_INFO, "%s Using existing security-scoped URL for accessing bundle: %@", buf, 0x16u);
          }
          objc_msgSend(v6, "setObject:forKey:", v12, v10);
          ++self->_stats._securityScopeCacheHitCount;
        }
        else
        {
          -[INBundleAccessManager accessibleBundleIDs](self, "accessibleBundleIDs");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "containsObject:", v10);

          if (v15)
          {
            ++self->_stats._accessibleCacheHitCount;
          }
          else
          {
            ++self->_stats._cacheMissCount;
            objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v10, 0, 0);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "URL");
            v17 = objc_claimAutoreleasedReturnValue();
            if (!v17)
              goto LABEL_14;
            v18 = (void *)v17;
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "URL");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "path");
            v21 = v6;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend(v19, "isReadableFileAtPath:", v22);

            v6 = v21;
            v7 = v33;

            if ((v34 & 1) == 0)
            {
              objc_msgSend(v32, "addObject:", v10);
            }
            else
            {
LABEL_14:
              -[INBundleAccessManager accessibleBundleIDs](self, "accessibleBundleIDs");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "addObject:", v10);

            }
          }
          v8 = v35;
        }

      }
      v36 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v36);
  }

  if (!objc_msgSend(v32, "count"))
    goto LABEL_25;
  v24 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[INBundleAccessManager _grantForBundleIdentifiers:error:]";
    v47 = 2112;
    v48 = v32;
    _os_log_impl(&dword_18BEBC000, v24, OS_LOG_TYPE_INFO, "%s Requesting access to bundle identifiers from helper. %@", buf, 0x16u);
  }
  ++self->_stats._imageServiceLoadCount;
  +[INImageServiceConnection sharedConnection](INImageServiceConnection, "sharedConnection", v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = 0;
  objc_msgSend(v25, "securityScopedURLsForBundleIdentifiers:error:", v32, &v40);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v40;

  if (v6)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __58__INBundleAccessManager__grantForBundleIdentifiers_error___block_invoke;
    v37[3] = &unk_1E228B2F0;
    v38 = v6;
    v39 = self;
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", v37);

LABEL_25:
    v28 = -[INBundleAccessGrant initWithSecurityScopedURLs:]([INBundleAccessGrant alloc], "initWithSecurityScopedURLs:", v6);
    goto LABEL_29;
  }
  if (v31)
    *v31 = objc_retainAutorelease(v27);

  v28 = 0;
LABEL_29:

  return v28;
}

- (id)_stats
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("request count: %u\nsecurity scope cache: (count: %u, hit: %u)\naccessible cache: (count: %u, hit: %u)\ncache miss: %u\nimage service load: %u\n"), self->_stats._requestCount, -[NSMutableDictionary count](self->_securityScopedURLs, "count"), self->_stats._securityScopeCacheHitCount, -[NSMutableSet count](self->_accessibleBundleIDs, "count"), self->_stats._accessibleCacheHitCount, self->_stats._cacheMissCount, self->_stats._imageServiceLoadCount);
}

- (NSMutableDictionary)securityScopedURLs
{
  return self->_securityScopedURLs;
}

- (NSMutableSet)accessibleBundleIDs
{
  return self->_accessibleBundleIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessibleBundleIDs, 0);
  objc_storeStrong((id *)&self->_securityScopedURLs, 0);
}

void __58__INBundleAccessManager__grantForBundleIdentifiers_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  INSecurityScopedURL *v8;

  v5 = a3;
  v6 = a2;
  v8 = -[INSecurityScopedURL initWithURL:]([INSecurityScopedURL alloc], "initWithURL:", v5);

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v8, v6);
  objc_msgSend(*(id *)(a1 + 40), "securityScopedURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v8, v6);

}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_16293);
  return (id)sharedManager_sharedInstance;
}

void __38__INBundleAccessManager_sharedManager__block_invoke()
{
  INBundleAccessManager *v0;
  void *v1;

  v0 = objc_alloc_init(INBundleAccessManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

}

@end
