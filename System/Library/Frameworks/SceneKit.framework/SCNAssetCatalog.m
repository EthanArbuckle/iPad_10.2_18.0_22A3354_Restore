@implementation SCNAssetCatalog

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SCNAssetCatalog;
  -[SCNAssetCatalog dealloc](&v3, sel_dealloc);
}

+ (id)assetCatalogNamed:(id)a3
{
  __CFString *v5;
  id result;

  v5 = (__CFString *)objc_msgSend(a3, "pathExtension");
  if (!-[__CFString length](v5, "length"))
    v5 = CFSTR("scnasset");
  result = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "URLForResource:withExtension:", objc_msgSend(a3, "stringByDeletingPathExtension"), v5);
  if (result)
    return (id)objc_msgSend(a1, "assetCatalogWithURL:", result);
  return result;
}

+ (id)assetCatalogWithURL:(id)a3
{
  SCNAssetCatalog *v4;

  v4 = objc_alloc_init(SCNAssetCatalog);
  v4->_catalogURL = (NSURL *)a3;
  return v4;
}

+ (id)assetCatalogForResourceURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = objc_msgSend((id)objc_msgSend(a3, "path"), "rangeOfString:", CFSTR(".scnassets"));
  if (v6)
  {
    v7 = objc_msgSend((id)objc_msgSend(a3, "path"), "substringToIndex:", v5 + 10);
    v8 = objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
  }
  else
  {
    v8 = objc_msgSend(a3, "URLByDeletingLastPathComponent");
  }
  return (id)objc_msgSend(a1, "assetCatalogWithURL:", v8);
}

- (id)URLOfResourceNamed:(id)a3
{
  NSDictionary *db;
  id result;

  db = self->_db;
  if (db)
  {
    result = -[NSDictionary valueForKey:](db, "valueForKey:", a3);
    if (!result)
      return result;
    a3 = result;
  }
  return -[NSURL URLByAppendingPathComponent:](self->_catalogURL, "URLByAppendingPathComponent:", a3);
}

- (void)cacheObject:(id)a3 withTimestamp:(double)a4 forKey:(id)a5
{
  SCNAssetCatalogCacheEntry *v9;

  if (!self->_cache)
    self->_cache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(SCNAssetCatalogCacheEntry);
  -[SCNAssetCatalogCacheEntry setItem:](v9, "setItem:", a3);
  -[SCNAssetCatalogCacheEntry setTimestamp:](v9, "setTimestamp:", a4);
  -[NSMutableDictionary setValue:forKey:](self->_cache, "setValue:forKey:", v9, a5);

}

- (id)sceneWithURL:(id)a3
{
  uint64_t v5;
  void *v6;
  SCNScene *v7;
  double v8;
  double v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend(a3, "path");
  v6 = (void *)-[NSMutableDictionary valueForKey:](self->_cache, "valueForKey:", v5);
  v7 = (SCNScene *)objc_msgSend(v6, "item");
  v8 = SCNGetFileTimestampAtURL(a3);
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "timestamp");
      if (v8 == v9)
        return v7;
      -[NSMutableDictionary setValue:forKey:](self->_cache, "setValue:forKey:", 0, v5);
    }
  }
  if (a3)
  {
    v11[0] = CFSTR("kSceneSourceForceInProcess");
    v11[1] = CFSTR("kSceneSourceCheckConsistency");
    v12[0] = MEMORY[0x1E0C9AAB0];
    v12[1] = MEMORY[0x1E0C9AAA0];
    v7 = +[SCNScene sceneWithURL:options:error:](SCNScene, "sceneWithURL:options:error:", a3, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2), 0);
    if (v7)
      -[SCNAssetCatalog cacheObject:withTimestamp:forKey:](self, "cacheObject:withTimestamp:forKey:", v7, v5, v8);
  }
  return v7;
}

- (id)sceneNamed:(id)a3
{
  return -[SCNAssetCatalog sceneWithURL:](self, "sceneWithURL:", -[SCNAssetCatalog URLOfResourceNamed:](self, "URLOfResourceNamed:", a3));
}

- (id)animationNamed:(id)a3
{
  uint64_t v5;
  void *v6;
  id v8;
  uint64_t v9;

  v5 = -[NSMutableDictionary valueForKey:](self->_cache, "valueForKey:");
  if (v5)
  {
    v6 = (void *)v5;
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  else
  {
    v8 = -[SCNAssetCatalog URLOfResourceNamed:](self, "URLOfResourceNamed:", a3);
    if (v8)
    {
      v9 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()), v9, 0);
      if (v6)
        -[SCNAssetCatalog cacheObject:withTimestamp:forKey:](self, "cacheObject:withTimestamp:forKey:", v6, a3, 0.0);
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (id)actionNamed:(id)a3
{
  uint64_t v5;
  void *v6;
  id v8;
  uint64_t v9;

  v5 = -[NSMutableDictionary valueForKey:](self->_cache, "valueForKey:");
  if (v5)
  {
    v6 = (void *)v5;
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  else
  {
    v8 = -[SCNAssetCatalog URLOfResourceNamed:](self, "URLOfResourceNamed:", a3);
    if (v8)
    {
      v9 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v8);
      v6 = (void *)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class()), v9, 0);
      if (v6)
        -[SCNAssetCatalog cacheObject:withTimestamp:forKey:](self, "cacheObject:withTimestamp:forKey:", v6, a3, 0.0);
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (id)particleSystemNamed:(id)a3
{
  uint64_t v5;
  id v6;

  v5 = -[NSMutableDictionary valueForKey:](self->_cache, "valueForKey:");
  if (v5)
  {
    v6 = (id)v5;
    objc_opt_class();
    objc_opt_isKindOfClass();
  }
  else
  {
    v6 = -[SCNAssetCatalog URLOfResourceNamed:](self, "URLOfResourceNamed:", a3);
    if (v6)
    {
      v6 = (id)objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", objc_msgSend(v6, "path")), 0);
      if (v6)
        -[SCNAssetCatalog cacheObject:withTimestamp:forKey:](self, "cacheObject:withTimestamp:forKey:", v6, a3, 0.0);
    }
  }
  return v6;
}

- (id)pathByMakingURLRelativeToCatalog:(id)a3
{
  return C3DCopyRelativeFromFolderURL(self->_catalogURL, a3);
}

+ (id)recursivePathsForResourcesOfType:(id)a3 inDirectory:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "enumeratorAtPath:", a4);
  v8 = objc_msgSend(v7, "nextObject");
  if (v8)
  {
    v9 = (void *)v8;
    do
    {
      if (!objc_msgSend((id)objc_msgSend(v9, "pathExtension"), "caseInsensitiveCompare:", a3))
        objc_msgSend(v6, "addObject:", objc_msgSend(a4, "stringByAppendingPathComponent:", v9));
      v9 = (void *)objc_msgSend(v7, "nextObject");
    }
    while (v9);
  }
  return v6;
}

+ (void)clearCache
{
  objc_sync_enter(a1);
  objc_msgSend((id)lookUpCache, "removeAllObjects");
  objc_sync_exit(a1);
}

+ (id)objectWithName:(id)a3 class:(Class)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (objectWithName_class__onceToken != -1)
    dispatch_once(&objectWithName_class__onceToken, &__block_literal_global_84);
  v7 = +[SCNSceneDatabase lookUpKeyForObjectNamed:class:](SCNSceneDatabase, "lookUpKeyForObjectNamed:class:", a3, a4);
  objc_sync_enter(a1);
  v8 = (void *)objc_msgSend((id)lookUpCache, "valueForKey:", v7);
  if (!v8)
  {
    v9 = (void *)objc_msgSend(a1, "recursivePathsForResourcesOfType:inDirectory:", CFSTR("scn"), objc_msgSend((id)SCNGetResourceBundle(), "bundlePath"));
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v22;
      v12 = *MEMORY[0x1E0CB2CD0];
      v20 = a1;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", v14);
          v16 = -[SCNKeyedUnarchiver initForReadingWithData:secure:]([SCNKeyedUnarchiver alloc], "initForReadingWithData:secure:", v15, C3DIOShouldActivateSecurityChecks((const __CFURL *)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v14, 0), 0));
          objc_msgSend(v16, "setClass:forClassName:", objc_opt_class(), CFSTR("SCNScene"));
          objc_msgSend(v16, "setLookUpKey:", v7);
          v17 = (void *)MEMORY[0x1E0C99E60];
          v25[0] = objc_opt_class();
          v25[1] = objc_opt_class();
          v18 = objc_msgSend(v16, "decodeObjectOfClasses:forKey:", objc_msgSend(v17, "setWithArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2)), v12);
          v8 = (void *)objc_msgSend(v16, "lookUpFoundInstance");

          if (v8 && v18)
          {
            a1 = v20;
            objc_msgSend((id)lookUpCache, "setValue:forKey:", v8, v7);
            goto LABEL_18;
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v8 = 0;
        a1 = v20;
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      v8 = 0;
    }
  }
LABEL_18:
  objc_sync_exit(a1);
  return v8;
}

id __40__SCNAssetCatalog_objectWithName_class___block_invoke()
{
  id result;

  result = objc_alloc_init(MEMORY[0x1E0C99E08]);
  lookUpCache = (uint64_t)result;
  return result;
}

- (NSURL)catalogURL
{
  return self->_catalogURL;
}

@end
