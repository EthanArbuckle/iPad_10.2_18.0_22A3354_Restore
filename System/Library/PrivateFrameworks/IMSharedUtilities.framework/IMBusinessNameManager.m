@implementation IMBusinessNameManager

- (IMBusinessNameManager)init
{
  IMBusinessNameManager *v2;
  NSLock *v3;
  NSLock *cacheLock;
  NSMutableDictionary *v5;
  NSMutableDictionary *cache;
  NSMutableDictionary *v7;
  NSMutableDictionary *pendingRequests;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMBusinessNameManager;
  v2 = -[IMBusinessNameManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    cacheLock = v2->_cacheLock;
    v2->_cacheLock = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    cache = v2->_cache;
    v2->_cache = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v7;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (qword_1ECFC7528 != -1)
    dispatch_once(&qword_1ECFC7528, &unk_1E3FB3B08);
  if (qword_1ECFC7668 != -1)
    dispatch_once(&qword_1ECFC7668, &unk_1E3FB41A8);
  if (qword_1ECFC7530 != -1)
    dispatch_once(&qword_1ECFC7530, &unk_1E3FB41E8);
  return (id)qword_1ECFC75C8;
}

- (id)businessNameForUID:(id)a3 updateHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (v6 && (IMIsRunningInMessagesComposeViewService() & 1) == 0)
  {
    -[NSLock lock](self->_cacheLock, "lock");
    -[IMBusinessNameManager cache](self, "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSLock unlock](self->_cacheLock, "unlock");
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      if (!v7)
        v7 = &unk_1E3FB4228;
      -[NSLock lock](self->_cacheLock, "lock");
      -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingRequests, "objectForKeyedSubscript:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingRequests, "objectForKeyedSubscript:", v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = _Block_copy(v7);
        objc_msgSend(v12, "addObject:", v13);

        -[NSLock unlock](self->_cacheLock, "unlock");
      }
      else
      {
        v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingRequests, "setObject:forKeyedSubscript:", v14, v6);

        -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingRequests, "objectForKeyedSubscript:", v6);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = _Block_copy(v7);
        objc_msgSend(v15, "addObject:", v16);

        -[NSLock unlock](self->_cacheLock, "unlock");
        -[IMBusinessNameManager _fetchBusinessNameForUID:](self, "_fetchBusinessNameForUID:", v6);
      }
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)placeholderBusinessNameForBrandURI:(id)a3
{
  return (id)MEMORY[0x1E0DE7D20](IMBrand, sel_placeholderNameForBrandURI_);
}

- (void)_fetchBusinessNameForUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  +[IMBrandManager sharedInstance](IMBrandManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_19E2E62EC;
  v7[3] = &unk_1E3FB8348;
  v6 = v4;
  v8 = v6;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v5, "brandWithURI:completion:", v6, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_fetchedBrandName:(id)a3 forUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[IMBusinessNameManager cacheLock](self, "cacheLock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  if (objc_msgSend(v6, "length"))
  {
    -[IMBusinessNameManager cache](self, "cache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v6, v7);

  }
  -[IMBusinessNameManager pendingRequests](self, "pendingRequests");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[IMBusinessNameManager pendingRequests](self, "pendingRequests");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v7);

  -[IMBusinessNameManager cacheLock](self, "cacheLock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unlock");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18) + 16))(*(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18));
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v16);
  }

}

- (NSLock)cacheLock
{
  return (NSLock *)objc_getProperty(self, a2, 8, 1);
}

- (void)setCacheLock:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSMutableDictionary)cache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableDictionary)pendingRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPendingRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequests, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheLock, 0);
}

@end
