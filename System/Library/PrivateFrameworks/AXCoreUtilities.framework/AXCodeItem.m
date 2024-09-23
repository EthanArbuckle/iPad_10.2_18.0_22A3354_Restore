@implementation AXCodeItem

+ (id)_codeItemQueue
{
  if (_codeItemQueue_onceToken != -1)
    dispatch_once(&_codeItemQueue_onceToken, &__block_literal_global_16);
  return (id)_codeItemQueue__queue;
}

void __28__AXCodeItem__codeItemQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("AXCodeItemAccess", 0);
  v1 = (void *)_codeItemQueue__queue;
  _codeItemQueue__queue = (uint64_t)v0;

}

+ (int64_t)codeItemTypeFromString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("dylib")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("bundle")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("framework")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("app")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("executable")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("appex")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("assistantUIBundle")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("siriUIBundle")) & 1) != 0)
  {
    v4 = 8;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("siriUIPresentationBundle")) & 1) != 0)
  {
    v4 = 9;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("uibundle")) & 1) != 0)
  {
    v4 = 10;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("qldisplay")) & 1) != 0)
  {
    v4 = 11;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("fpenroll")) & 1) != 0)
  {
    v4 = 12;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("servicebundle")) & 1) != 0)
  {
    v4 = 13;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("lockbundle")) & 1) != 0)
  {
    v4 = 14;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("XPCServices")) & 1) != 0)
  {
    v4 = 16;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("wkbundle")) & 1) != 0)
  {
    v4 = 15;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("healthplugin")) & 1) != 0)
  {
    v4 = 17;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("axbundle")))
  {
    v4 = 18;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (AXCodeItem)initWithPath:(id)a3 isDyldOpened:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  AXCodeItem *v7;
  AXCodeItem *v8;
  uint64_t v9;
  objc_super v11;

  v4 = a4;
  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AXCodeItem;
  v7 = -[AXCodeItem init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_type = -1;
    -[AXCodeItem setPath:](v7, "setPath:", v6);
    if (v4)
    {
      *(_BYTE *)&v8->_flags |= 1u;
      v9 = mach_absolute_time();
    }
    else
    {
      v9 = 0;
    }
    v8->_loadedAtTimestamp = v9;
  }

  return v8;
}

- (id)initAccessibilityCodeItemWithPath:(id)a3 targetType:(int64_t)a4 platformToTarget:(id)a5 loadOrder:(unsigned __int16)a6
{
  uint64_t v6;
  id v10;
  AXCodeItem *v11;
  AXCodeItem *v12;

  v6 = a6;
  v10 = a5;
  v11 = -[AXCodeItem initWithPath:isDyldOpened:](self, "initWithPath:isDyldOpened:", a3, 0);
  v12 = v11;
  if (v11)
  {
    -[AXCodeItem setTargetType:](v11, "setTargetType:", a4);
    -[AXCodeItem setLoadOrder:](v12, "setLoadOrder:", v6);
    -[AXCodeItem setPlatformToTarget:](v12, "setPlatformToTarget:", v10);
  }

  return v12;
}

- (void)addPlatformToTargetEntries:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AXCodeItem platformToTarget](self, "platformToTarget");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (-[AXCodeItem type](self, "type") == 18)
  {
    -[AXCodeItem platformToTarget](self, "platformToTarget");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "debugDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[AXCodeItem excludedProcesses](self, "excludedProcesses");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = -[AXCodeItem loadOrder](self, "loadOrder");
    -[AXCodeItem name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCodeItem path](self, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _AXNameForCodeItemType(-[AXCodeItem targetType](self, "targetType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("AXCodeItem<%p> [Rank:%u] %@ [AXBundle name:%@] [Platforms and Targets:%@ %@] [Excluded: %@]"), self, v9, v10, v11, v5, v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB3940];
    _AXNameForCodeItemType(-[AXCodeItem type](self, "type"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCodeItem name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCodeItem path](self, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", CFSTR("AXCodeItem<%p> [type:%@ name:%@] %@"), self, v5, v7, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AXCodeItem path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXCodeItem path](self, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)name
{
  NSString *name;

  name = self->_name;
  if (!name)
  {
    -[AXCodeItem _cacheLazyProperties](self, "_cacheLazyProperties");
    name = self->_name;
  }
  return name;
}

- (int64_t)type
{
  int64_t result;

  result = self->_type;
  if (result == -1)
  {
    -[AXCodeItem _cacheLazyProperties](self, "_cacheLazyProperties");
    return self->_type;
  }
  return result;
}

- (unsigned)loadOrder
{
  if (-[AXCodeItem _isSystemAppAccessibilityBundle](self, "_isSystemAppAccessibilityBundle"))
    return 18000;
  else
    return self->_loadOrder;
}

- (void)_cacheLazyProperties
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  void *v35;
  int v36;
  void *v37;
  int v38;
  void *v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  int v44;
  int64_t v45;
  NSString *v46;
  NSString *name;
  NSString *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  -[AXCodeItem path](self, "path", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (!v6)
    goto LABEL_43;
  v7 = v6;
  v8 = *(_QWORD *)v50;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v50 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
      objc_msgSend(v10, "pathExtension");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("dylib"));

      if (v12)
      {
        v45 = 1;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("bundle"));

      if (v14)
      {
        v45 = 2;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("framework"));

      if (v16)
      {
        v45 = 3;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("app"));

      if (v18)
      {
        v45 = 4;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("appex"));

      if (v20)
      {
        v45 = 6;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("assistantUIBundle"));

      if (v22)
      {
        v45 = 7;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("siriUIBundle"));

      if (v24)
      {
        v45 = 8;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("siriUIPresentationBundle"));

      if (v26)
      {
        v45 = 9;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("uibundle"));

      if (v28)
      {
        v45 = 10;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", CFSTR("qldisplay"));

      if (v30)
      {
        v45 = 11;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "isEqualToString:", CFSTR("fpenroll"));

      if (v32)
      {
        v45 = 12;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("servicebundle"));

      if (v34)
      {
        v45 = 13;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "isEqualToString:", CFSTR("lockbundle"));

      if (v36)
        goto LABEL_26;
      objc_msgSend(v10, "pathExtension");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("XPCServices"));

      if (v38)
      {
        v45 = 16;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("healthplugin"));

      if (v40)
      {
        v45 = 17;
        goto LABEL_42;
      }
      objc_msgSend(v10, "pathExtension");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "isEqualToString:", CFSTR("wkbundle"));

      if (v42)
      {
LABEL_26:
        v45 = 14;
LABEL_42:
        self->_type = v45;
        objc_msgSend(v10, "stringByDeletingPathExtension");
        v46 = (NSString *)objc_claimAutoreleasedReturnValue();
        name = self->_name;
        self->_name = v46;

        goto LABEL_43;
      }
      objc_msgSend(v10, "pathExtension");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isEqualToString:", CFSTR("axbundle"));

      if (v44)
      {
        v45 = 18;
        goto LABEL_42;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    if (v7)
      continue;
    break;
  }
LABEL_43:

  if (self->_type == -1)
  {
    v48 = self->_name;
    self->_name = (NSString *)CFSTR("<Uninitialized>");

    self->_type = 0;
  }
}

- (unint64_t)loadedAtTimestamp
{
  return self->_loadedAtTimestamp;
}

- (BOOL)isLoaded
{
  return *(_BYTE *)&self->_flags & 1;
}

- (void)setIsLoaded:(BOOL)a3
{
  char flags;

  flags = (char)self->_flags;
  if ((flags & 1) == 0 && a3)
  {
    self->_loadedAtTimestamp = mach_absolute_time();
    flags = (char)self->_flags;
  }
  *(_BYTE *)&self->_flags = flags & 0xFE | a3;
}

- (BOOL)isAccessibilityBundle
{
  return -[AXCodeItem type](self, "type") == 18;
}

- (BOOL)_isSystemAppAccessibilityBundle
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[AXCodeItem name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SpringBoard")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[AXCodeItem name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("Carousel")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      -[AXCodeItem name](self, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("PineBoard"));

    }
  }

  return -[AXCodeItem isAccessibilityBundle](self, "isAccessibilityBundle") & v4;
}

- (NSString)debugCodeTypeDescription
{
  return (NSString *)_AXNameForCodeItemType(-[AXCodeItem type](self, "type"));
}

- (NSBundle)cachedBundle
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  +[AXCodeItem _codeItemQueue](AXCodeItem, "_codeItemQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __26__AXCodeItem_cachedBundle__block_invoke;
  v6[3] = &unk_1E28C32B8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSBundle *)v4;
}

void __26__AXCodeItem_cachedBundle__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 8));
}

- (id)prepareBackingBundleIfNeeded:(id *)a3
{
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__5;
  v20 = __Block_byref_object_dispose__5;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5;
  v14 = __Block_byref_object_dispose__5;
  v15 = 0;
  +[AXCodeItem _codeItemQueue](AXCodeItem, "_codeItemQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AXCodeItem_prepareBackingBundleIfNeeded___block_invoke;
  block[3] = &unk_1E28C3948;
  block[4] = self;
  block[5] = &v16;
  block[6] = &v10;
  dispatch_sync(v5, block);

  v6 = (void *)v11[5];
  if (v6)
  {
    v7 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    v7 = (id)v17[5];
  }
  _Block_object_dispose(&v10, 8);

  _Block_object_dispose(&v16, 8);
  return v7;
}

void __43__AXCodeItem_prepareBackingBundleIfNeeded___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;

  v2 = (_QWORD *)a1[4];
  v3 = (void *)v2[1];
  if (v3)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), v3);
    return;
  }
  objc_msgSend(v2, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v4, "stringByDeletingLastPathComponent");
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v6, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:isDirectory:", v8, &v22);

    if ((v9 & 1) != 0)
    {
      if (v22)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v6);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = a1[4];
        v12 = *(void **)(v11 + 8);
        *(_QWORD *)(v11 + 8) = v10;

        v13 = *(void **)(a1[4] + 8);
        if (v13)
        {
          v14 = *(_QWORD *)(a1[5] + 8);
          v15 = v13;
          v16 = *(void **)(v14 + 40);
          *(_QWORD *)(v14 + 40) = v15;
LABEL_13:

          v4 = (void *)v5;
          goto LABEL_14;
        }
        objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoading"), CFSTR("Could not create bundle from URL: %@"), v6);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoading"), CFSTR("URL is not a directory as expected: %@"), v6);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoading"), CFSTR("URL does not exist: %@"), v6);
    }
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(a1[6] + 8);
    v16 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoading"), CFSTR("Code item path was empty"));
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1[6] + 8);
  v19 = *(void **)(v18 + 40);
  *(_QWORD *)(v18 + 40) = v17;

LABEL_14:
}

- (void)loadWithStrategy:(int64_t)a3 onQueue:(id)a4 completion:(id)a5
{
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD block[5];
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (!v8)
  {
    dispatch_get_global_queue(0, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_3;
LABEL_5:
    v11 = (void *)objc_msgSend(&__block_literal_global_71, "copy");
    v12 = _Block_copy(v11);
    goto LABEL_6;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  v11 = _Block_copy(v10);
  v12 = _Block_copy(v11);

LABEL_6:
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AXCodeItem_loadWithStrategy_onQueue_completion___block_invoke_2;
  block[3] = &unk_1E28C39B0;
  v15 = v12;
  v16 = a3;
  block[4] = self;
  v13 = v12;
  dispatch_async(v8, block);

}

void __50__AXCodeItem_loadWithStrategy_onQueue_completion___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  char v8;
  void (*v9)(void);
  id v10;
  id v11;
  id v12;

  if (a1[6])
  {
    v3 = a1[4];
    v2 = a1[5];
    objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("AXLoading"), CFSTR("dlopen strategy not inplemented"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, _QWORD, id))(v2 + 16))(v2, v3, 0, v10);

    return;
  }
  v4 = (void *)a1[4];
  v12 = 0;
  objc_msgSend(v4, "prepareBackingBundleIfNeeded:", &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v12;
  if (v6)
  {
    v7 = v6;
LABEL_7:
    v9 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_8;
  }
  v11 = 0;
  v8 = objc_msgSend(v5, "loadAndReturnError:", &v11);
  v7 = v11;
  if ((v8 & 1) == 0)
    goto LABEL_7;
  *(_BYTE *)(a1[4] + 16) |= 1u;
  v9 = *(void (**)(void))(a1[5] + 16);
LABEL_8:
  v9();

}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (NSMutableDictionary)platformToTarget
{
  return self->_platformToTarget;
}

- (void)setPlatformToTarget:(id)a3
{
  objc_storeStrong((id *)&self->_platformToTarget, a3);
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (NSArray)excludedProcesses
{
  return self->_excludedProcesses;
}

- (void)setExcludedProcesses:(id)a3
{
  objc_storeStrong((id *)&self->_excludedProcesses, a3);
}

- (AXCodeItem)associatedAccessibilityCodeItem
{
  return (AXCodeItem *)objc_loadWeakRetained((id *)&self->_associatedAccessibilityCodeItem);
}

- (void)setAssociatedAccessibilityCodeItem:(id)a3
{
  objc_storeWeak((id *)&self->_associatedAccessibilityCodeItem, a3);
}

- (int64_t)targetType
{
  return self->_targetType;
}

- (void)setTargetType:(int64_t)a3
{
  self->_targetType = a3;
}

- (void)setLoadOrder:(unsigned __int16)a3
{
  self->_loadOrder = a3;
}

- (AXCodeItem)targetCodeItem
{
  return (AXCodeItem *)objc_loadWeakRetained((id *)&self->_targetCodeItem);
}

- (void)setTargetCodeItem:(id)a3
{
  objc_storeWeak((id *)&self->_targetCodeItem, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_targetCodeItem);
  objc_destroyWeak((id *)&self->_associatedAccessibilityCodeItem);
  objc_storeStrong((id *)&self->_excludedProcesses, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_platformToTarget, 0);
  objc_storeStrong((id *)&self->_cachedBundle, 0);
}

@end
