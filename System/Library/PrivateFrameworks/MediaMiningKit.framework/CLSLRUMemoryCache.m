@implementation CLSLRUMemoryCache

- (CLSLRUMemoryCache)init
{
  CLSLRUMemoryCache *v2;
  CLSLRUMemoryCache *v3;
  _CLSLRUMemoryCacheList *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CLSLRUMemoryCache;
  v2 = -[CLSLRUMemoryCache init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_numberOfSlots = 128;
    v2->_cacheDictionary = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 128);
    v3->_recursiveLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v4 = (_CLSLRUMemoryCacheList *)malloc_type_malloc(0x18uLL, 0x102004023CB03E4uLL);
    v3->_leastRecentUsedList = v4;
    v4->var0 = 0;
    v4->var1 = 0;
    v3->_leastRecentUsedList->var2 = 0;
    v3->_leastRecentUsedDictionary = (NSMapTable *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 0, 0, 128);
  }
  return v3;
}

- (void)dealloc
{
  NSRecursiveLock *recursiveLock;
  NSMapTable *cacheDictionary;
  _CLSLRUMemoryCacheList *leastRecentUsedList;
  _CLSLRUMemoryCacheListElement *var1;
  _CLSLRUMemoryCacheListElement *v7;
  _CLSLRUMemoryCacheList *v8;
  NSMapTable *leastRecentUsedDictionary;
  objc_super v10;

  recursiveLock = self->_recursiveLock;
  if (recursiveLock)
  {

    self->_recursiveLock = 0;
  }
  cacheDictionary = self->_cacheDictionary;
  if (cacheDictionary)
  {

    self->_cacheDictionary = 0;
  }
  leastRecentUsedList = self->_leastRecentUsedList;
  var1 = leastRecentUsedList->var1;
  if (var1)
  {
    do
    {
      v7 = var1->var1;
      if (var1->var0)

      free(var1);
      var1 = v7;
    }
    while (v7);
    leastRecentUsedList = self->_leastRecentUsedList;
  }
  leastRecentUsedList->var0 = 0;
  leastRecentUsedList->var1 = 0;
  self->_leastRecentUsedList->var2 = 0;
  v8 = self->_leastRecentUsedList;
  if (v8)
  {
    free(v8);
    self->_leastRecentUsedList = 0;
  }
  leastRecentUsedDictionary = self->_leastRecentUsedDictionary;
  if (leastRecentUsedDictionary)
  {

    self->_leastRecentUsedDictionary = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CLSLRUMemoryCache;
  -[CLSLRUMemoryCache dealloc](&v10, sel_dealloc);
}

- (void)_promoteListElement:(_CLSLRUMemoryCacheListElement *)a3
{
  _CLSLRUMemoryCacheList *leastRecentUsedList;
  _CLSLRUMemoryCacheListElement *var2;
  _CLSLRUMemoryCacheListElement *var1;
  _CLSLRUMemoryCacheList *v6;
  _CLSLRUMemoryCacheListElement *v7;

  leastRecentUsedList = self->_leastRecentUsedList;
  if (leastRecentUsedList->var0 < 2)
    return;
  var1 = a3->var1;
  var2 = a3->var2;
  if (!var2)
  {
    leastRecentUsedList->var1 = var1;
    if (var1)
      goto LABEL_5;
    goto LABEL_4;
  }
  var2->var1 = var1;
  var1 = a3->var1;
  if (!var1)
LABEL_4:
    var1 = (_CLSLRUMemoryCacheListElement *)self->_leastRecentUsedList;
LABEL_5:
  var1->var2 = var2;
  a3->var1 = self->_leastRecentUsedList->var1;
  a3->var2 = 0;
  v6 = self->_leastRecentUsedList;
  v7 = v6->var1;
  if (v7)
  {
    v7->var2 = a3;
    v6 = self->_leastRecentUsedList;
  }
  v6->var1 = a3;
}

- (void)_removeListElement:(_CLSLRUMemoryCacheListElement *)a3
{
  _CLSLRUMemoryCacheListElement *var2;
  _CLSLRUMemoryCacheListElement *var1;
  _CLSLRUMemoryCacheList *leastRecentUsedList;
  _CLSLRUMemoryCacheListElement *v8;
  _CLSLRUMemoryCacheList *v9;

  var1 = a3->var1;
  var2 = a3->var2;
  if (var2)
  {
    var2->var1 = var1;
    leastRecentUsedList = self->_leastRecentUsedList;
    if (leastRecentUsedList->var1 == a3)
      leastRecentUsedList->var1 = 0;
  }
  else
  {
    self->_leastRecentUsedList->var1 = var1;
  }
  v8 = a3->var1;
  if (v8)
  {
    v8->var2 = var2;
    v9 = self->_leastRecentUsedList;
    if (v9->var2 == a3)
      v9->var2 = 0;
  }
  else
  {
    self->_leastRecentUsedList->var2 = var2;
  }
  -[NSMapTable removeObjectForKey:](self->_leastRecentUsedDictionary, "removeObjectForKey:", a3->var0);
  if (a3->var0)

  free(a3);
  --self->_leastRecentUsedList->var0;
}

- (void)setNumberOfSlots:(unint64_t)a3
{
  _CLSLRUMemoryCacheList *leastRecentUsedList;
  _CLSLRUMemoryCacheListElement *var2;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  if (self->_numberOfSlots > a3)
  {
LABEL_2:
    leastRecentUsedList = self->_leastRecentUsedList;
    while (leastRecentUsedList->var0 > a3)
    {
      var2 = leastRecentUsedList->var2;
      if (var2)
      {
        -[NSMapTable removeObjectForKey:](self->_cacheDictionary, "removeObjectForKey:", var2->var0);
        -[CLSLRUMemoryCache _removeListElement:](self, "_removeListElement:", self->_leastRecentUsedList->var2);
        goto LABEL_2;
      }
    }
  }
  self->_numberOfSlots = a3;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (unint64_t)currentUsedSlots
{
  NSRecursiveLock *recursiveLock;
  unint64_t var0;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  recursiveLock = self->_recursiveLock;
  var0 = self->_leastRecentUsedList->var0;
  -[NSRecursiveLock unlock](recursiveLock, "unlock");
  return var0;
}

- (id)objectForKey:(id)a3
{
  id v5;
  id v6;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  v5 = -[NSMapTable objectForKey:](self->_cacheDictionary, "objectForKey:", a3);
  if (v5)
  {
    v6 = -[NSMapTable objectForKey:](self->_leastRecentUsedDictionary, "objectForKey:", a3);
    if (v6)
      -[CLSLRUMemoryCache _promoteListElement:](self, "_promoteListElement:", objc_msgSend(v6, "pointerValue"));
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v5;
}

- (id)allKeys
{
  NSMapTable *cacheDictionary;
  void *v4;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  cacheDictionary = self->_cacheDictionary;
  if (cacheDictionary)
    v4 = (void *)-[NSArray copy](NSAllMapTableKeys(cacheDictionary), "copy");
  else
    v4 = 0;
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v4;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7;
  _CLSLRUMemoryCacheListElement *v8;
  id v9;
  _CLSLRUMemoryCacheListElement *var1;
  _CLSLRUMemoryCacheList *leastRecentUsedList;
  _CLSLRUMemoryCacheListElement *v12;
  _CLSLRUMemoryCacheList *v13;
  _CLSLRUMemoryCacheList *v15;
  _CLSLRUMemoryCacheListElement *var2;

  if (self->_numberOfSlots)
  {
    -[NSRecursiveLock lock](self->_recursiveLock, "lock");
    v7 = -[NSMapTable objectForKey:](self->_leastRecentUsedDictionary, "objectForKey:", a4);
    if (v7)
    {
      -[CLSLRUMemoryCache _promoteListElement:](self, "_promoteListElement:", objc_msgSend(v7, "pointerValue"));
    }
    else
    {
      v8 = (_CLSLRUMemoryCacheListElement *)malloc_type_malloc(0x18uLL, 0xA00409BE6959DuLL);
      v9 = a4;
      var1 = self->_leastRecentUsedList->var1;
      v8->var0 = v9;
      v8->var1 = var1;
      v8->var2 = 0;
      leastRecentUsedList = self->_leastRecentUsedList;
      v12 = leastRecentUsedList->var1;
      if (v12)
      {
        v12->var2 = v8;
        leastRecentUsedList = self->_leastRecentUsedList;
      }
      leastRecentUsedList->var1 = v8;
      v13 = self->_leastRecentUsedList;
      if (!v13->var0++)
        v13->var2 = v8;
      -[NSMapTable setObject:forKey:](self->_leastRecentUsedDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v8), a4);
    }
    v15 = self->_leastRecentUsedList;
    if (v15->var0 > self->_numberOfSlots)
    {
      var2 = v15->var2;
      if (var2)
      {
        -[NSMapTable removeObjectForKey:](self->_cacheDictionary, "removeObjectForKey:", var2->var0);
        -[CLSLRUMemoryCache _removeListElement:](self, "_removeListElement:", self->_leastRecentUsedList->var2);
      }
    }
    -[NSMapTable setObject:forKey:](self->_cacheDictionary, "setObject:forKey:", a3, a4);
    -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v5;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  v5 = -[NSMapTable objectForKey:](self->_leastRecentUsedDictionary, "objectForKey:", a3);
  if (v5)
    -[CLSLRUMemoryCache _removeListElement:](self, "_removeListElement:", objc_msgSend(v5, "pointerValue"));
  -[NSMapTable removeObjectForKey:](self->_cacheDictionary, "removeObjectForKey:", a3);
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (void)removeAllObjects
{
  _CLSLRUMemoryCacheList *leastRecentUsedList;
  _CLSLRUMemoryCacheListElement *var1;
  _CLSLRUMemoryCacheListElement *v5;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  -[NSMapTable removeAllObjects](self->_leastRecentUsedDictionary, "removeAllObjects");
  leastRecentUsedList = self->_leastRecentUsedList;
  var1 = leastRecentUsedList->var1;
  if (var1)
  {
    do
    {
      v5 = var1->var1;
      if (var1->var0)

      free(var1);
      var1 = v5;
    }
    while (v5);
    leastRecentUsedList = self->_leastRecentUsedList;
  }
  leastRecentUsedList->var0 = 0;
  leastRecentUsedList->var1 = 0;
  self->_leastRecentUsedList->var2 = 0;
  -[NSMapTable removeAllObjects](self->_cacheDictionary, "removeAllObjects");
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (void)evictSlots:(unint64_t)a3
{
  _CLSLRUMemoryCacheListElement *var2;

  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  for (; a3; --a3)
  {
    var2 = self->_leastRecentUsedList->var2;
    if (var2)
    {
      -[NSMapTable removeObjectForKey:](self->_cacheDictionary, "removeObjectForKey:", var2->var0);
      -[CLSLRUMemoryCache _removeListElement:](self, "_removeListElement:", self->_leastRecentUsedList->var2);
    }
  }
  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
}

- (BOOL)loadFromURL:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  _CLSLRUMemoryCacheListElement *v18;
  _CLSLRUMemoryCacheList *leastRecentUsedList;
  _CLSLRUMemoryCacheListElement *var1;
  _CLSLRUMemoryCacheList *v21;
  NSObject *v23;
  uint64_t v25;
  void *context;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint8_t v37[128];
  uint8_t buf[4];
  id v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1D1796094](self, a2);
  -[CLSLRUMemoryCache removeAllObjects](self, "removeAllObjects");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DB0]), "initWithURL:", a3);
  v35 = 0;
  objc_msgSend(v5, "open");
  v6 = (void *)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v5, 0, 0, &v35);
  objc_msgSend(v5, "close");

  if (v6)
  {
    v7 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("CLSLRUMemoryCacheSaveMemoryKey"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          -[NSMapTable setObject:forKey:](self->_cacheDictionary, "setObject:forKey:", objc_msgSend(v7, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
      }
      while (v9);
    }
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = (void *)objc_msgSend((id)objc_msgSend(v6, "objectForKey:", CFSTR("CLSLRUMemoryCacheSaveLeastRecentUsedKey")), "reverseObjectEnumerator");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          v18 = (_CLSLRUMemoryCacheListElement *)malloc_type_malloc(0x18uLL, 0xA00409BE6959DuLL);
          v18->var0 = v17;
          v18->var1 = self->_leastRecentUsedList->var1;
          v18->var2 = 0;
          leastRecentUsedList = self->_leastRecentUsedList;
          var1 = leastRecentUsedList->var1;
          if (var1)
          {
            var1->var2 = v18;
            leastRecentUsedList = self->_leastRecentUsedList;
          }
          leastRecentUsedList->var1 = v18;
          v21 = self->_leastRecentUsedList;
          if (!v21->var0++)
            v21->var2 = v18;
          -[NSMapTable setObject:forKey:](self->_leastRecentUsedDictionary, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v18), v17);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v14);
    }
  }
  else
  {
    v23 = objc_msgSend(+[CLSLogging sharedLogging](CLSLogging, "sharedLogging"), "loggingConnection");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v25 = objc_msgSend(v35, "localizedDescription");
      *(_DWORD *)buf = 138412546;
      v39 = a3;
      v40 = 2112;
      v41 = v25;
      _os_log_error_impl(&dword_1CAB79000, v23, OS_LOG_TYPE_ERROR, "Failed to load cache from \"%@\": \"%@\", buf, 0x16u);
    }
  }
  objc_autoreleasePoolPop(context);
  return v6 != 0;
}

- (BOOL)writeToURL:(id)a3
{
  id v5;
  id v6;
  _CLSLRUMemoryCacheListElement *i;
  id v8;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_recursiveLock, "lock");
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v5, "setObject:forKey:", self->_cacheDictionary, CFSTR("CLSLRUMemoryCacheSaveMemoryKey"));
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = self->_leastRecentUsedList->var1; i; i = i->var1)
    objc_msgSend(v6, "addObject:", i->var0);
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("CLSLRUMemoryCacheSaveLeastRecentUsedKey"));

  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v9 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", objc_msgSend(MEMORY[0x1E0CB3620], "temporaryFilePathWithExtension:", CFSTR("tmp")));
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initWithURL:append:", v9, 0);
  v17 = 0;
  objc_msgSend(v10, "open");
  if (!objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v5, v10, 200, 0, &v17))
  {
    v12 = objc_msgSend(+[CLSLogging sharedLogging](CLSLogging, "sharedLogging"), "loggingConnection");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = objc_msgSend(v17, "localizedDescription");
      *(_DWORD *)buf = 138412802;
      v19 = a3;
      v20 = 2112;
      v21 = v9;
      v22 = 2112;
      v23 = v15;
      _os_log_error_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_ERROR, "Failed to save cache to \"%@\" (\"%@\"): \"%@\", buf, 0x20u);
    }
    objc_msgSend(v10, "close");

    goto LABEL_11;
  }
  objc_msgSend(v10, "close");

  objc_msgSend(v8, "removeItemAtURL:error:", a3, 0);
  if ((objc_msgSend(v8, "moveItemAtURL:toURL:error:", v9, a3, &v17) & 1) == 0)
  {
    v13 = objc_msgSend(+[CLSLogging sharedLogging](CLSLogging, "sharedLogging"), "loggingConnection");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(v17, "localizedDescription");
      *(_DWORD *)buf = 138412546;
      v19 = a3;
      v20 = 2112;
      v21 = v16;
      _os_log_error_impl(&dword_1CAB79000, v13, OS_LOG_TYPE_ERROR, "Failed to save cache to \"%@\": \"%@\", buf, 0x16u);
    }
LABEL_11:
    objc_msgSend(v8, "removeItemAtURL:error:", v9, 0);
    v11 = 0;
    goto LABEL_12;
  }
  v11 = 1;
LABEL_12:

  -[NSRecursiveLock unlock](self->_recursiveLock, "unlock");
  return v11;
}

- (unint64_t)numberOfSlots
{
  return self->_numberOfSlots;
}

@end
