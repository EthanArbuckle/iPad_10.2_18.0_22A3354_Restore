@implementation QLThumbnailAdditionCache

- (id)thumbnailAdditionForItemAtURL:(id)a3 error:(id *)a4
{
  id v6;
  int v7;
  id v8;
  int v9;
  NSCache *v10;
  void *v11;
  NSObject *v12;
  NSCache *v13;
  NSCache *additionsCache;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  NSCache *v20;
  const char *v21;
  NSCache *v22;
  void *v23;
  void *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  NSCache *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  __int16 v34;
  NSCache *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = 0;
  v7 = objc_msgSend(v6, "getResourceValue:forKey:error:", &v27, *MEMORY[0x1E0C998F8], a4);
  v8 = v27;
  if (v8)
    v9 = v7;
  else
    v9 = 0;
  if (v9 == 1)
  {
    v10 = self->_additionsCache;
    objc_sync_enter(v10);
    -[NSCache objectForKey:](self->_additionsCache, "objectForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_exit(v10);

    if (objc_msgSend(v11, "isStillValid"))
    {
      _log_0();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v11, "addition");
        v13 = (NSCache *)objc_claimAutoreleasedReturnValue();
        additionsCache = self->_additionsCache;
        objc_msgSend(v11, "addition");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "userInfo");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413314;
        v29 = v13;
        v30 = 2112;
        v31 = v6;
        v32 = 2112;
        v33 = v8;
        v34 = 2112;
        v35 = additionsCache;
        v36 = 2112;
        v37 = v16;
        _os_log_impl(&dword_1AE3F5000, v12, OS_LOG_TYPE_INFO, "Using cached addition (%@) for %@ (%@) in cache %@, user info %@", buf, 0x34u);

      }
      objc_msgSend(v11, "addition");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
    _log_0();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
    if (v11)
    {
      if (v19)
      {
        v20 = self->_additionsCache;
        *(_DWORD *)buf = 138412802;
        v29 = v20;
        v30 = 2112;
        v31 = v6;
        v32 = 2112;
        v33 = v8;
        v21 = "Found addition in cache %@ for %@ (docID %@), but it is stale";
LABEL_15:
        _os_log_impl(&dword_1AE3F5000, v18, OS_LOG_TYPE_INFO, v21, buf, 0x20u);
      }
    }
    else if (v19)
    {
      v22 = self->_additionsCache;
      *(_DWORD *)buf = 138412802;
      v29 = v22;
      v30 = 2112;
      v31 = v6;
      v32 = 2112;
      v33 = v8;
      v21 = "No addition found in cache %@ for %@ (docID %@)";
      goto LABEL_15;
    }

    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "permanentStorageForItemAtURL:allocateIfNone:error:", v6, 0, a4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(MEMORY[0x1E0D25D38], "makeNameForUser:name:", getuid(), CFSTR("QLThumbnailAdditionName"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "additionWithName:inNameSpace:error:", v25, CFSTR("com.apple.thumbnails"), a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        -[QLThumbnailAdditionCache cacheAddition:forDocumentID:](self, "cacheAddition:forDocumentID:", v17, v8);
    }
    else
    {
      v17 = 0;
    }

    goto LABEL_21;
  }
  v17 = 0;
LABEL_22:

  return v17;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__QLThumbnailAdditionCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once != -1)
    dispatch_once(&sharedInstance_once, block);
  return (id)sharedInstance_sSharedInstance;
}

void __42__QLThumbnailAdditionCache_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v1;

}

- (QLThumbnailAdditionCache)init
{
  QLThumbnailAdditionCache *v2;
  NSCache *v3;
  NSCache *additionsCache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)QLThumbnailAdditionCache;
  v2 = -[QLThumbnailAdditionCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    additionsCache = v2->_additionsCache;
    v2->_additionsCache = v3;

    -[NSCache setName:](v2->_additionsCache, "setName:", CFSTR("QLThumbnail Additions"));
    -[NSCache setCountLimit:](v2->_additionsCache, "setCountLimit:", 64);
  }
  return v2;
}

- (void)purgeCachedAdditionForItemAtURL:(id)a3
{
  id v4;
  int v5;
  id v6;
  NSCache **p_additionsCache;
  NSCache *additionsCache;
  NSCache *v9;
  NSObject *v10;
  id v11;

  v4 = a3;
  v11 = 0;
  v5 = objc_msgSend(v4, "getResourceValue:forKey:error:", &v11, *MEMORY[0x1E0C998F8], 0);
  v6 = v11;
  if (v5)
  {
    additionsCache = self->_additionsCache;
    p_additionsCache = &self->_additionsCache;
    v9 = additionsCache;
    objc_sync_enter(v9);
    _log_0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[QLThumbnailAdditionCache purgeCachedAdditionForItemAtURL:].cold.1();

    -[NSCache removeObjectForKey:](*p_additionsCache, "removeObjectForKey:", v6);
    objc_sync_exit(v9);

  }
}

- (void)cacheAddition:(id)a3 forDocumentID:(id)a4
{
  id v6;
  id v7;
  QLThumbnailCachedAddition *v8;
  NSCache *v9;
  NSObject *v10;
  NSCache *additionsCache;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  NSCache *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = -[QLThumbnailCachedAddition initWithAddition:]([QLThumbnailCachedAddition alloc], "initWithAddition:", v6);
  if (v8)
  {
    v9 = self->_additionsCache;
    objc_sync_enter(v9);
    _log_0();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      additionsCache = self->_additionsCache;
      objc_msgSend(v6, "userInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138413058;
      v14 = v6;
      v15 = 2112;
      v16 = v7;
      v17 = 2112;
      v18 = additionsCache;
      v19 = 2112;
      v20 = v12;
      _os_log_debug_impl(&dword_1AE3F5000, v10, OS_LOG_TYPE_DEBUG, "Storing addition %@ for docID %@ in cache %@, user info %@", (uint8_t *)&v13, 0x2Au);

    }
    -[NSCache setObject:forKey:](self->_additionsCache, "setObject:forKey:", v8, v7);
    objc_sync_exit(v9);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionsCache, 0);
}

- (void)purgeCachedAdditionForItemAtURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_10_0(&dword_1AE3F5000, v0, v1, "Removing entry for key %@ in cache %@");
  OUTLINED_FUNCTION_2();
}

@end
