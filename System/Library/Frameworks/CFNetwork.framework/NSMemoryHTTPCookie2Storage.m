@implementation NSMemoryHTTPCookie2Storage

- (NSMemoryHTTPCookie2Storage)init
{
  NSMemoryHTTPCookie2Storage *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *memoryCookies;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSMemoryHTTPCookie2Storage;
  v2 = -[NSMemoryHTTPCookie2Storage init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    memoryCookies = v2->memoryCookies;
    v2->memoryCookies = v3;

  }
  return v2;
}

- (void)setCookie:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "domain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->memoryCookies, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->memoryCookies, "setObject:forKeyedSubscript:", v6, v5);
  }
  v7 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v8);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)setCookies:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[NSMemoryHTTPCookie2Storage setCookie:](self, "setCookie:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)deleteAllCookies
{
  -[NSMutableDictionary removeAllObjects](self->memoryCookies, "removeAllObjects");
}

- (void)deleteCookie:(id)a3
{
  id v4;
  NSMutableDictionary *memoryCookies;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  id v11;

  v4 = a3;
  memoryCookies = self->memoryCookies;
  v11 = v4;
  objc_msgSend(v4, "domain");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](memoryCookies, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[NSHTTPCookie2Key initWithHTTPCookie2:]([NSHTTPCookie2Key alloc], v11);
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqual:", v11))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", 0, v9);

  }
}

- (void)deleteCookies:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[NSMemoryHTTPCookie2Storage deleteCookie:](self, "deleteCookie:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)deleteCookiesWithFilter:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSMemoryHTTPCookie2Storage getCookiesWithFilter:](self, "getCookiesWithFilter:", a3);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        -[NSMemoryHTTPCookie2Storage deleteCookie:](self, "deleteCookie:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++), (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (id)getAllCookies
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->memoryCookies;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v20;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v20 != v5)
          objc_enumerationMutation(obj);
        -[NSMutableDictionary objectForKeyedSubscript:](self->memoryCookies, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v6));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v16;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v16 != v10)
                objc_enumerationMutation(v8);
              objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11));
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "addObject:", v12);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v9);
        }

        ++v6;
      }
      while (v6 != v4);
      v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v4);
  }

  return v3;
}

- (id)getCookiesWithFilter:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  NSObject *v19;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[NSHTTPCookieStorageUtils getEffectiveTLDPlusOne:]((uint64_t)NSHTTPCookieStorageUtils, v5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v21)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->memoryCookies, "objectForKeyedSubscript:");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v7);
          objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v4, "matchCookie:", v11))
          {
            objc_msgSend(v6, "addObject:", v11);
          }
          else
          {
            getCookieLogHandle();
            v12 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v11;
              _os_log_debug_impl(&dword_183ECA000, v12, OS_LOG_TYPE_DEBUG, "[MemoryCookieStore]: Cookie dropped since filters don't match. Cookie = %@", buf, 0xCu);
            }

          }
        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
      }
      while (v8);
    }
  }
  else
  {
    -[NSMemoryHTTPCookie2Storage getAllCookies](self, "getAllCookies");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v14;
    v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v15; ++j)
        {
          if (*(_QWORD *)v23 != v16)
            objc_enumerationMutation(v7);
          v18 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
          if (objc_msgSend(v4, "matchCookie:", v18))
          {
            objc_msgSend(v6, "addObject:", v18);
          }
          else
          {
            getCookieLogHandle();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v18;
              _os_log_debug_impl(&dword_183ECA000, v19, OS_LOG_TYPE_DEBUG, "[MemoryCookieStore]: Cookie dropped since filters don't match. Cookie = %@", buf, 0xCu);
            }

          }
        }
        v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v15);
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->memoryCookies, 0);
}

@end
