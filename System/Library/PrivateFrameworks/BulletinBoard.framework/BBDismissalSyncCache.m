@implementation BBDismissalSyncCache

- (BBDismissalSyncCache)init
{
  BBDismissalSyncCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BBDismissalSyncCache;
  v2 = -[BBDismissalSyncCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (void)cacheDismissalDictionaries:(id)a3 dismissalIDs:(id)a4 inSection:(id)a5 forFeeds:(unint64_t)a6
{
  BBDismissalSyncCache *v10;
  id v11;
  id v12;
  NSObject *v13;
  BBDismissalSyncCacheItem *v14;
  NSDate *v15;
  NSDate *timeToCheck;
  NSObject *v17;
  int v18;
  BBDismissalSyncCache *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v10 = (BBDismissalSyncCache *)a3;
  v11 = a4;
  v12 = a5;
  v13 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138413058;
    v19 = v10;
    v20 = 2112;
    v21 = v11;
    v22 = 2112;
    v23 = v12;
    v24 = 2048;
    v25 = a6;
    _os_log_impl(&dword_20CCB9000, v13, OS_LOG_TYPE_DEFAULT, "Request to cache dismissal dictionaries:%@ IDs:%@ inSection:%@ forFeeds:%lu", (uint8_t *)&v18, 0x2Au);
  }
  -[BBDismissalSyncCache _checkCache](self, "_checkCache");
  if (-[BBDismissalSyncCache count](v10, "count") || objc_msgSend(v11, "count"))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v12);
    v14 = (BBDismissalSyncCacheItem *)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      v14 = objc_alloc_init(BBDismissalSyncCacheItem);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cache, "setObject:forKeyedSubscript:", v14, v12);
    }
    -[BBDismissalSyncCacheItem cacheDismissalDictionaries:dismissalIDs:forFeeds:](v14, "cacheDismissalDictionaries:dismissalIDs:forFeeds:", v10, v11, a6);
    if (!self->_timeToCheck)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 120.0);
      v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
      timeToCheck = self->_timeToCheck;
      self->_timeToCheck = v15;

    }
    v17 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = self;
      _os_log_impl(&dword_20CCB9000, v17, OS_LOG_TYPE_DEFAULT, "cache updated to: %@", (uint8_t *)&v18, 0xCu);
    }

  }
}

- (id)findBulletinMatch:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "bulletinID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v7;
    _os_log_impl(&dword_20CCB9000, v6, OS_LOG_TYPE_DEFAULT, "request to find bulletin match: %@", (uint8_t *)&v14, 0xCu);

  }
  -[BBDismissalSyncCache _checkCache](self, "_checkCache");
  objc_msgSend(v4, "sectionID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "findBulletinMatch:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setSectionID:", v8);
      v12 = BBLogSync;
      if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
      {
        v14 = 138412290;
        v15 = v11;
        _os_log_impl(&dword_20CCB9000, v12, OS_LOG_TYPE_DEFAULT, "Found a match: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)removeBulletinMatch:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v4;
    _os_log_impl(&dword_20CCB9000, v5, OS_LOG_TYPE_DEFAULT, "Request to remove bulletin match:%@", (uint8_t *)&v10, 0xCu);
  }
  objc_msgSend(v4, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cache, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "removeBulletinMatch:", v4);
      v9 = BBLogSync;
      if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_20CCB9000, v9, OS_LOG_TYPE_DEFAULT, "bulletin match removed", (uint8_t *)&v10, 2u);
      }
    }

  }
}

- (BOOL)_isTimeToCheck
{
  void *v3;
  void *v4;
  double v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BBDismissalSyncCache timeToCheck](self, "timeToCheck");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v4);
  v6 = v5 >= 0.0;

  return v6;
}

- (void)_checkCache
{
  NSObject *v3;
  id v4;
  NSMutableDictionary *cache;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  id v12;
  __int128 *p_buf;
  uint8_t v14[4];
  BBDismissalSyncCache *v15;
  __int128 buf;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = BBLogSync;
  if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = self;
    _os_log_impl(&dword_20CCB9000, v3, OS_LOG_TYPE_DEFAULT, "Request to check cache: %@", (uint8_t *)&buf, 0xCu);
  }
  if (-[BBDismissalSyncCache _isTimeToCheck](self, "_isTimeToCheck"))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    cache = self->_cache;
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __35__BBDismissalSyncCache__checkCache__block_invoke;
    v11 = &unk_24C562C48;
    v6 = v4;
    v12 = v6;
    p_buf = &buf;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](cache, "enumerateKeysAndObjectsUsingBlock:", &v8);
    -[NSMutableDictionary removeObjectsForKeys:](self->_cache, "removeObjectsForKeys:", v6, v8, v9, v10, v11);
    objc_storeStrong((id *)&self->_timeToCheck, *(id *)(*((_QWORD *)&buf + 1) + 40));
    v7 = BBLogSync;
    if (os_log_type_enabled((os_log_t)BBLogSync, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v14 = 138412290;
      v15 = self;
      _os_log_impl(&dword_20CCB9000, v7, OS_LOG_TYPE_DEFAULT, "check cache purge complete: %@", v14, 0xCu);
    }

    _Block_object_dispose(&buf, 8);
  }
}

void __35__BBDismissalSyncCache__checkCache__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(a3, "purgeExpired");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "compare:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)) == -1)
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
  }

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@: %p; cache:%@; timeToCheck:%@>"),
               objc_opt_class(),
               self,
               self->_cache,
               self->_timeToCheck);
}

- (NSMutableDictionary)cache
{
  return self->_cache;
}

- (void)setCache:(id)a3
{
  objc_storeStrong((id *)&self->_cache, a3);
}

- (NSDate)timeToCheck
{
  return self->_timeToCheck;
}

- (void)setTimeToCheck:(id)a3
{
  objc_storeStrong((id *)&self->_timeToCheck, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeToCheck, 0);
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
