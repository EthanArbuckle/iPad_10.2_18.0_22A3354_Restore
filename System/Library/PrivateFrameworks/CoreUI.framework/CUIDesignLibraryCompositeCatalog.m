@implementation CUIDesignLibraryCompositeCatalog

- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 error:(id *)a6
{
  return -[CUIDesignLibraryCompositeCatalog colorWithName:palette:displayGamut:hierarchyLevel:error:](self, "colorWithName:palette:displayGamut:hierarchyLevel:error:", a3, a4, a5, 0, a6);
}

+ (id)compositeCatalogForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7
{
  NSString *v13;
  id v14;
  id v15;
  id v16;

  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d.%d.%d.%d"), a3, a4, a5, a6);
  if (__compositeOnceToken != -1)
    dispatch_once(&__compositeOnceToken, &__block_literal_global_187);
  os_unfair_lock_lock((os_unfair_lock_t)&__compositeCatalogCacheLock);
  v14 = objc_msgSend((id)__compositeCatalogCache, "objectForKey:", v13);
  if (!v14)
  {
    v15 = objc_msgSend(a1, "_catalogsForDesignSystem:colorScheme:contrast:styling:error:", a3, a4, a5, a6, a7);
    if (v15)
    {
      v14 = objc_msgSend(objc_alloc((Class)a1), "initWithCatalogs:", v15);
      objc_msgSend((id)__compositeCatalogCache, "setObject:forKey:", v14, v13);
      v16 = v14;
    }
    else
    {
      v14 = 0;
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&__compositeCatalogCacheLock);
  return v14;
}

- (CUIDesignLibraryCompositeCatalog)initWithCatalogs:(id)a3
{
  CUIDesignLibraryCompositeCatalog *v4;
  CUIDesignLibraryCompositeCatalog *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CUIDesignLibraryCompositeCatalog;
  v4 = -[CUIDesignLibraryCompositeCatalog init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    if (a3)
    {
      v4->_catalogs = (NSArray *)a3;
    }
    else
    {

      return 0;
    }
  }
  return v5;
}

+ (id)_catalogsForDesignSystem:(int64_t)a3 colorScheme:(int64_t)a4 contrast:(int64_t)a5 styling:(int64_t)a6 error:(id *)a7
{
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSArray *v17;
  id v19;
  id v20;

  v11 = __resolvedDesignSystemForInputSystem(a3);
  v12 = objc_alloc_init((Class)NSMutableArray);
  v13 = +[CUIDesignLibraryCatalog catalogForDesignSystem:colorScheme:contrast:styling:error:](CUIDesignLibraryCatalog, "catalogForDesignSystem:colorScheme:contrast:styling:error:", v11, a4, a5, a6, a7);
  if (v13)
    objc_msgSend(v12, "addObject:", v13);
  v14 = objc_alloc_init((Class)NSMutableArray);
  switch(v11)
  {
    case 1:
      goto LABEL_6;
    case 2:
    case 3:
    case 4:
    case 7:
      v15 = +[CUIDesignLibraryCatalog catalogForDesignSystem:colorScheme:contrast:styling:error:](CUIDesignLibraryCatalog, "catalogForDesignSystem:colorScheme:contrast:styling:error:", 1, a4, a5, a6, a7);
      if (v15)
        objc_msgSend(v14, "addObject:", v15);
LABEL_6:
      if (a6 == 1)
      {
        v16 = +[CUIDesignLibraryCatalog catalogForDesignSystem:colorScheme:contrast:styling:error:](CUIDesignLibraryCatalog, "catalogForDesignSystem:colorScheme:contrast:styling:error:", 1, a4, a5, 0, a7);
        if (v16)
          objc_msgSend(v14, "addObject:", v16);
      }
      break;
    case 5:
      if (a6)
      {
        v19 = +[CUIDesignLibraryCatalog catalogForDesignSystem:colorScheme:contrast:styling:error:](CUIDesignLibraryCatalog, "catalogForDesignSystem:colorScheme:contrast:styling:error:", 5, a4, a5, 0, a7);
        if (v19)
          objc_msgSend(v14, "addObject:", v19);
        if (a6 == 1)
        {
          v20 = +[CUIDesignLibraryCatalog catalogForDesignSystem:colorScheme:contrast:styling:error:](CUIDesignLibraryCatalog, "catalogForDesignSystem:colorScheme:contrast:styling:error:", 5, a4, a5, 2, a7);
          if (v20)
            objc_msgSend(v14, "insertObject:atIndex:", v20, 0);
        }
      }
      break;
    default:
      break;
  }
  if (objc_msgSend(v14, "count"))
    objc_msgSend(v12, "addObjectsFromArray:", v14);
  v17 = +[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v12);

  return v17;
}

id __103__CUIDesignLibraryCompositeCatalog_compositeCatalogForDesignSystem_colorScheme_contrast_styling_error___block_invoke()
{
  id result;

  result = objc_alloc_init((Class)NSMutableDictionary);
  __compositeCatalogCache = (uint64_t)result;
  return result;
}

- (id)colorWithName:(int64_t)a3 palette:(int64_t)a4 displayGamut:(int64_t)a5 hierarchyLevel:(int64_t)a6 error:(id *)a7
{
  NSArray *catalogs;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id result;
  NSArray *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];

  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  catalogs = self->_catalogs;
  v14 = -[NSArray countByEnumeratingWithState:objects:count:](catalogs, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
LABEL_3:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v28 != v16)
        objc_enumerationMutation(catalogs);
      result = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17), "colorWithName:palette:displayGamut:hierarchyLevel:error:", a3, a4, a5, a6, a7);
      if (result)
        break;
      if (v15 == (id)++v17)
      {
        v15 = -[NSArray countByEnumeratingWithState:objects:count:](catalogs, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v15)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (!a4)
      return 0;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v19 = self->_catalogs;
    result = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (!result)
      return result;
    v20 = result;
    v21 = *(_QWORD *)v24;
LABEL_12:
    v22 = 0;
    while (1)
    {
      if (*(_QWORD *)v24 != v21)
        objc_enumerationMutation(v19);
      result = objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22), "colorWithName:palette:displayGamut:hierarchyLevel:error:", a3, 0, a5, a6, a7);
      if (result)
        break;
      if (v20 == (id)++v22)
      {
        v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        result = 0;
        if (v20)
          goto LABEL_12;
        return result;
      }
    }
  }
  if (a7)
    *a7 = 0;
  return result;
}

- (id)shapeEffectPresetWithName:(id)a3 error:(id *)a4
{
  NSArray *catalogs;
  id result;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  catalogs = self->_catalogs;
  result = -[NSArray countByEnumeratingWithState:objects:count:](catalogs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (result)
  {
    v8 = result;
    v9 = *(_QWORD *)v12;
    while (2)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(catalogs);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "shapeEffectPresetWithName:error:", a3, a4);
        if (result)
        {
          if (a4)
            *a4 = 0;
          return result;
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      result = -[NSArray countByEnumeratingWithState:objects:count:](catalogs, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      v8 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CUIDesignLibraryCompositeCatalog;
  -[CUIDesignLibraryCompositeCatalog dealloc](&v3, sel_dealloc);
}

@end
