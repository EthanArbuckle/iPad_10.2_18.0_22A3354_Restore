@implementation LiveFSXattrCache

+ (id)xattrCacheWithMaxItems:(unint64_t)a3 andMaxItemSize:(unint64_t)a4
{
  return -[LiveFSXattrCache initWithMaxItems:andMaxItemSize:]([LiveFSXattrCache alloc], "initWithMaxItems:andMaxItemSize:", a3, a4);
}

+ (id)xattrCacheWithMaxItems:(unint64_t)a3 maxItemSize:(unint64_t)a4 andEntryLifetimeInSeconds:(unint64_t)a5
{
  return -[LiveFSXattrCache initWithMaxItems:maxItemSize:andEntryLifetimeInSeconds:]([LiveFSXattrCache alloc], "initWithMaxItems:maxItemSize:andEntryLifetimeInSeconds:", a3, a4, a5);
}

- (void)dealloc
{
  NSMutableDictionary *cacheEntries;
  objc_super v4;

  cacheEntries = self->_cacheEntries;
  self->_cacheEntries = 0;

  v4.receiver = self;
  v4.super_class = (Class)LiveFSXattrCache;
  -[LiveFSXattrCache dealloc](&v4, sel_dealloc);
}

- (LiveFSXattrCache)initWithMaxItems:(unint64_t)a3 andMaxItemSize:(unint64_t)a4
{
  return -[LiveFSXattrCache initWithMaxItems:maxItemSize:andEntryLifetimeInSeconds:](self, "initWithMaxItems:maxItemSize:andEntryLifetimeInSeconds:", a3, a4, 0);
}

- (LiveFSXattrCache)initWithMaxItems:(unint64_t)a3 maxItemSize:(unint64_t)a4 andEntryLifetimeInSeconds:(unint64_t)a5
{
  LiveFSXattrCache *v8;
  uint64_t v9;
  NSMutableDictionary *cacheEntries;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)LiveFSXattrCache;
  v8 = -[LiveFSXattrCache init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    cacheEntries = v8->_cacheEntries;
    v8->_cacheEntries = (NSMutableDictionary *)v9;

    v8->_entryCount = 0;
    v8->_maxItems = a3;
    v8->_maxItemSize = a4;
    v8->_entryLifetime = a5;
  }
  return v8;
}

- (void)insertEntryForData:(id)a3 forName:(id)a4
{
  id v6;
  id v7;
  LiveFSXattrCacheEntry *v8;
  uint64_t v9;
  void *v10;
  NSMutableDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  BOOL v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  LiveFSXattrCacheEntry *v30;
  NSMutableDictionary *obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  timespec __tp;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  __tp.tv_sec = 0;
  __tp.tv_nsec = 0;
  if (!clock_gettime(_CLOCK_MONOTONIC, &__tp))
  {
    v8 = -[LiveFSXattrCacheEntry initWithData:andTime:]([LiveFSXattrCacheEntry alloc], "initWithData:andTime:", v6, &__tp);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cacheEntries, "objectForKeyedSubscript:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheEntries, "setObject:forKeyedSubscript:", v8, v7);
    }
    else
    {
      if (self->_entryCount < self->_maxItems)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheEntries, "setObject:forKeyedSubscript:", v8, v7);
        ++self->_entryCount;
LABEL_29:

        goto LABEL_30;
      }
      v30 = v8;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v11 = self->_cacheEntries;
      v12 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      if (v12)
      {
        v13 = v12;
        v29 = v6;
        v10 = 0;
        v14 = 0;
        v15 = 0;
        obj = v11;
        v32 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            v17 = v10;
            if (*(_QWORD *)v34 != v32)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
            -[NSMutableDictionary objectForKeyedSubscript:](self->_cacheEntries, "objectForKeyedSubscript:", v18, v29);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v10, "isExpiredAsOf:forLifetime:", &__tp, self->_entryLifetime))
            {
              v28 = v18;

              v14 = v28;
              goto LABEL_23;
            }
            if (v15)
            {
              v19 = objc_msgSend(v10, "lastUsedTime");
              v21 = v20;
              v22 = objc_msgSend(v15, "lastUsedTime");
              v24 = v19 < v22;
              if (v19 == v22)
                v24 = v21 < v23;
              if (v24)
              {
                v25 = v18;

                v26 = v10;
                v14 = v25;
                v15 = v26;
              }
            }
            else
            {
              v27 = v18;

              -[NSMutableDictionary objectForKeyedSubscript:](self->_cacheEntries, "objectForKeyedSubscript:", v27);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v27;
            }
          }
          v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          if (v13)
            continue;
          break;
        }
LABEL_23:

        if (v14)
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheEntries, "setObject:forKeyedSubscript:", 0, v14);
        v6 = v29;
      }
      else
      {

        v15 = 0;
        v14 = 0;
        v10 = 0;
      }
      v8 = v30;
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheEntries, "setObject:forKeyedSubscript:", v30, v7);

    }
    goto LABEL_29;
  }
LABEL_30:

}

- (void)setData:(id)a3 forName:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v8, "length") <= self->_maxItemSize)
  {
    -[LiveFSXattrCache insertEntryForData:forName:](self, "insertEntryForData:forName:", v8, v6);
  }
  else
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_cacheEntries, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheEntries, "setObject:forKeyedSubscript:", 0, v6);
      --self->_entryCount;
    }
  }
  self->_noXattrsPresent = 0;

}

- (void)setNegativeForName:(id)a3
{
  -[LiveFSXattrCache insertEntryForData:forName:](self, "insertEntryForData:forName:", 0, a3);
}

- (id)dataForName:(id)a3 wasNegative:(BOOL *)a4
{
  id v6;
  void *v7;
  int v8;
  unint64_t entryLifetime;
  void *v10;
  BOOL v11;
  timespec v13;

  v6 = a3;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_cacheEntries, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v13.tv_sec = 0;
    v13.tv_nsec = 0;
    v8 = clock_gettime(_CLOCK_MONOTONIC, &v13);
    entryLifetime = self->_entryLifetime;
    if (v8)
    {
      if (!entryLifetime)
      {
LABEL_10:
        if (objc_msgSend(v7, "xattrBytes"))
        {
          objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", objc_msgSend(v7, "xattrBytes"), objc_msgSend(v7, "xattrSize"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = 0;
        }
        else
        {
          v10 = 0;
          v11 = 1;
        }
        goto LABEL_13;
      }
    }
    else if (!entryLifetime || !objc_msgSend(v7, "isExpiredAsOf:forLifetime:", &v13))
    {
      objc_msgSend(v7, "setLastUsedTime:", v13.tv_sec, v13.tv_nsec);
      goto LABEL_10;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_cacheEntries, "setObject:forKeyedSubscript:", 0, v6);
    v11 = 0;
    v10 = 0;
    --self->_entryCount;
LABEL_13:
    *a4 = v11;
    goto LABEL_14;
  }
  v10 = 0;
  *a4 = -[LiveFSXattrCache noXattrsPresent](self, "noXattrsPresent");
LABEL_14:

  return v10;
}

- (void)invalidate
{
  -[NSMutableDictionary removeAllObjects](self->_cacheEntries, "removeAllObjects");
  self->_entryCount = 0;
  self->_noXattrsPresent = 0;
}

- (BOOL)noXattrsPresent
{
  _BOOL4 noXattrsPresent;
  BOOL result;
  timespec v5;

  noXattrsPresent = self->_noXattrsPresent;
  if (self->_entryLifetime)
  {
    if (!self->_noXattrsPresent)
      return 0;
    v5.tv_sec = 0;
    v5.tv_nsec = 0;
    if (clock_gettime(_CLOCK_MONOTONIC, &v5))
      return 0;
    if (v5.tv_sec
       - self->_noXattrsPresentSetTime.tv_sec
       - (unint64_t)(v5.tv_nsec < self->_noXattrsPresentSetTime.tv_nsec) >= self->_entryLifetime)
    {
      result = 0;
      self->_noXattrsPresent = 0;
      return result;
    }
    return self->_noXattrsPresent;
  }
  return noXattrsPresent;
}

- (void)setNoXattrsPresent:(BOOL)a3
{
  BOOL v4;

  if (a3)
  {
    if (self->_entryLifetime)
      v4 = clock_gettime(_CLOCK_MONOTONIC, &self->_noXattrsPresentSetTime) == 0;
    else
      v4 = 1;
    -[NSMutableDictionary removeAllObjects](self->_cacheEntries, "removeAllObjects");
    self->_entryCount = 0;
  }
  else
  {
    v4 = 0;
  }
  self->_noXattrsPresent = v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheEntries, 0);
}

@end
