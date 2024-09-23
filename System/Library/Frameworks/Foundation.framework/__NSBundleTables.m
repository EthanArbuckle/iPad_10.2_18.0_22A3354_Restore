@implementation __NSBundleTables

+ (id)bundleTables
{
  objc_opt_self();
  if (qword_1ECD09FF8 != -1)
    dispatch_once(&qword_1ECD09FF8, &__block_literal_global_37);
  return (id)_MergedGlobals_113;
}

- (id)bundleForPath:(id *)result
{
  id *v3;
  id v4;

  if (result)
  {
    v3 = result;
    objc_msgSend(result[1], "lock");
    v4 = (id)objc_msgSend(v3[5], "objectForKey:", a2);
    objc_msgSend(v3[1], "unlock");
    return (id *)v4;
  }
  return result;
}

- (id)bundleForClass:(id *)result
{
  id *v3;
  id v4;

  if (result)
  {
    v3 = result;
    objc_msgSend(result[1], "lock");
    v4 = (id)objc_msgSend(v3[6], "objectForKey:", a2);
    objc_msgSend(v3[1], "unlock");
    return (id *)v4;
  }
  return result;
}

- (id)addBundleIfNeeded:(uint64_t)a3 forPath:(uint64_t)a4 withType:(int)a5 isImmortal:
{
  id *v9;
  id v10;
  void *v11;
  id *v12;

  if (result)
  {
    v9 = result;
    objc_msgSend(result[1], "lock");
    v10 = (id)objc_msgSend(v9[5], "objectForKey:", a3);
    if (v10)
    {
      v11 = v10;
      objc_msgSend(v9[1], "unlock");
      return (id *)v11;
    }
    else
    {
      v12 = -[__NSBundleTables _addBundleLocked:forPath:withType:forClass:isImmortal:](v9, a2, a3, a4, 0, a5);
      objc_msgSend(v9[1], "unlock");
      return v12;
    }
  }
  return result;
}

- (id)_addBundleLocked:(uint64_t)a3 forPath:(uint64_t)a4 withType:(uint64_t)a5 forClass:(int)a6 isImmortal:
{
  id *v10;
  __int128 v11;
  id v12;
  id *v13;
  id v14;
  id v15;
  id v16;

  if (result)
  {
    v10 = result;
    *((_QWORD *)&v11 + 1) = a4;
    *(_QWORD *)&v11 = a4 - 0x10000;
    switch((unint64_t)(v11 >> 16))
    {
      case 0uLL:
      case 3uLL:
        v13 = result + 4;
        v12 = result[4];
        goto LABEL_6;
      case 1uLL:
        v13 = result + 3;
        v12 = result[3];
        goto LABEL_6;
      case 2uLL:
        v13 = result + 2;
        v12 = result[2];
LABEL_6:
        if ((objc_msgSend(v12, "containsObject:", a2) & 1) == 0)
        {
          v14 = a2;
          objc_msgSend(*v13, "addObject:", a2);
        }
        break;
      default:
        break;
    }
    if (a3)
    {
      result = (id *)objc_msgSend(v10[5], "objectForKey:", a3);
      if (result)
      {
        if (!a5)
          goto LABEL_11;
        goto LABEL_15;
      }
      v15 = a2;
      objc_msgSend(v10[5], "setObject:forKey:", a2, a3);
    }
    result = 0;
    if (!a5)
    {
LABEL_11:
      if (result)
        return result;
      goto LABEL_17;
    }
LABEL_15:
    result = (id *)objc_msgSend(v10[6], "objectForKey:", a5);
    if (result)
      return result;
    v16 = a2;
    objc_msgSend(v10[6], "setObject:forKey:", a2, a5);
    result = 0;
LABEL_17:
    if (a6)
    {
      objc_msgSend(v10[7], "addPointer:", a2);
      return 0;
    }
  }
  return result;
}

- (id)addBundle:(uint64_t)a3 forPath:(uint64_t)a4 withType:(uint64_t)a5 forClass:(int)a6 isImmortal:
{
  id *v11;
  id *v12;

  if (result)
  {
    v11 = result;
    objc_msgSend(result[1], "lock");
    v12 = -[__NSBundleTables _addBundleLocked:forPath:withType:forClass:isImmortal:](v11, a2, a3, a4, a5, a6);
    objc_msgSend(v11[1], "unlock");
    return v12;
  }
  return result;
}

- (__NSBundleTables)init
{
  __NSBundleTables *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)__NSBundleTables;
  v2 = -[__NSBundleTables init](&v4, sel_init);
  v2->_immortalBundles = -[NSPointerArray initWithOptions:]([NSPointerArray alloc], "initWithOptions:", 258);
  v2->_lock = (NSLock *)objc_opt_new();
  v2->_staticFrameworks = -[NSHashTable initWithOptions:capacity:]([NSHashTable alloc], "initWithOptions:capacity:", 5, 0);
  v2->_loadedBundles = -[NSHashTable initWithOptions:capacity:]([NSHashTable alloc], "initWithOptions:capacity:", 5, 0);
  v2->_loadedFrameworks = -[NSHashTable initWithOptions:capacity:]([NSHashTable alloc], "initWithOptions:capacity:", 5, 0);
  v2->_resolvedPathToBundles = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]([NSMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 0, 5, 0);
  v2->_bundleForClassMap = -[NSMapTable initWithKeyOptions:valueOptions:capacity:]([NSMapTable alloc], "initWithKeyOptions:valueOptions:capacity:", 256, 5, 0);
  return v2;
}

- (uint64_t)removeBundle:(uint64_t)a3 forPath:(uint64_t)a4 type:
{
  id *v7;
  id *v8;

  if (result)
  {
    v7 = (id *)result;
    objc_msgSend(*(id *)(result + 8), "lock");
    if (a3)
    {
      if (objc_msgSend(v7[5], "objectForKey:", a3))
      {
        objc_msgSend(v7[5], "removeObjectForKey:", a3);

      }
    }
    switch(a4)
    {
      case 0x10000:
        goto LABEL_8;
      case 0x40000:
        v8 = v7 + 4;
        if (!objc_msgSend(v7[4], "containsObject:", a2))
          return objc_msgSend(v7[1], "unlock");
        goto LABEL_9;
      case 0x20000:
LABEL_8:
        v8 = v7 + 3;
        if ((objc_msgSend(v7[3], "containsObject:", a2) & 1) != 0)
        {
LABEL_9:
          objc_msgSend(*v8, "removeObject:", a2);

        }
        break;
    }
    return objc_msgSend(v7[1], "unlock");
  }
  return result;
}

- (uint64_t)allBundles
{
  uint64_t v1;
  NSHashTable *v2;
  NSBundle *v3;

  if (result)
  {
    v1 = result;
    v2 = +[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 0);
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    if (v3)
      -[NSHashTable addObject:](v2, "addObject:", v3);
    objc_msgSend(*(id *)(v1 + 8), "lock");
    -[NSHashTable unionHashTable:](v2, "unionHashTable:", *(_QWORD *)(v1 + 24));
    objc_msgSend(*(id *)(v1 + 8), "unlock");
    return (uint64_t)-[NSHashTable allObjects](v2, "allObjects");
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)__NSBundleTables;
  -[__NSBundleTables dealloc](&v3, sel_dealloc);
}

- (uint64_t)addStaticFrameworkBundles:(uint64_t)result
{
  uint64_t v3;
  NSBundle *v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  _BYTE v11[128];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    v5 = +[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 0);
    objc_msgSend(*(id *)(v3 + 8), "lock");
    -[NSHashTable unionHashTable:](v5, "unionHashTable:", *(_QWORD *)(v3 + 24));
    -[NSHashTable unionHashTable:](v5, "unionHashTable:", *(_QWORD *)(v3 + 32));
    -[NSHashTable unionHashTable:](v5, "unionHashTable:", *(_QWORD *)(v3 + 16));
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v13 != v8)
            objc_enumerationMutation(a2);
          v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          if (!-[NSHashTable containsObject:](v5, "containsObject:", v10))
          {
            objc_msgSend(v10, "__static");
            objc_msgSend(*(id *)(v3 + 16), "addObject:", v10);
          }
        }
        v7 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v12, v11, 16);
      }
      while (v7);
    }
    if (v4)
      objc_msgSend(*(id *)(v3 + 24), "removeObject:", v4);
    return objc_msgSend(*(id *)(v3 + 8), "unlock");
  }
  return result;
}

- (uint64_t)allFrameworks
{
  uint64_t v1;
  NSHashTable *v2;

  if (result)
  {
    v1 = result;
    v2 = +[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 0);
    objc_msgSend(*(id *)(v1 + 8), "lock");
    -[NSHashTable unionHashTable:](v2, "unionHashTable:", *(_QWORD *)(v1 + 16));
    -[NSHashTable unionHashTable:](v2, "unionHashTable:", *(_QWORD *)(v1 + 32));
    -[NSHashTable minusHashTable:](v2, "minusHashTable:", *(_QWORD *)(v1 + 24));
    objc_msgSend(*(id *)(v1 + 8), "unlock");
    return (uint64_t)-[NSHashTable allObjects](v2, "allObjects");
  }
  return result;
}

- (uint64_t)loadedBundles
{
  uint64_t v1;
  NSHashTable *v2;
  NSBundle *v3;

  if (result)
  {
    v1 = result;
    v2 = +[NSHashTable hashTableWithOptions:](NSHashTable, "hashTableWithOptions:", 0);
    v3 = +[NSBundle mainBundle](NSBundle, "mainBundle");
    if (v3)
      -[NSHashTable addObject:](v2, "addObject:", v3);
    objc_msgSend(*(id *)(v1 + 8), "lock");
    -[NSHashTable unionHashTable:](v2, "unionHashTable:", *(_QWORD *)(v1 + 24));
    -[NSHashTable unionHashTable:](v2, "unionHashTable:", *(_QWORD *)(v1 + 16));
    -[NSHashTable unionHashTable:](v2, "unionHashTable:", *(_QWORD *)(v1 + 32));
    objc_msgSend(*(id *)(v1 + 8), "unlock");
    return (uint64_t)-[NSHashTable allObjects](v2, "allObjects");
  }
  return result;
}

@end
