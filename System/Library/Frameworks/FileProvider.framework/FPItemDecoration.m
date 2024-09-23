@implementation FPItemDecoration

uint64_t __30__FPItemDecoration_initialize__block_invoke_2()
{
  return +[FPItemDecoration _invalidateCache](FPItemDecoration, "_invalidateCache");
}

void __30__FPItemDecoration_initialize__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_loadBuiltinDecorationTypes");
  +[FPProviderDomainChangesReceiver sharedChangesReceiver](FPProviderDomainChangesReceiver, "sharedChangesReceiver");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "addChangesHandler:", &__block_literal_global_22);

}

+ (void)_loadBuiltinDecorationTypes
{
  void *v3;
  const __CFURL *v4;
  CFBundleRef v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleURL");
  v4 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v5 = CFBundleCreate(0, v4);

  objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("NSFileProviderDecorations"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_loadDecorationsFromPlist:bundleIdentifier:bundle:", v6, v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "_decorationCache");
    v9 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v9, "setObject:forKey:", v8, v10);

  }
  else
  {
    fp_current_or_default_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1A0A34000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to load built-in decorations", v11, 2u);
    }
  }

  CFRelease(v5);
}

+ (id)_loadDecorationsFromPlist:(id)a3 bundleIdentifier:(id)a4 bundle:(__CFBundle *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD v24[4];
  id v25;
  __CFBundle *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __70__FPItemDecoration__loadDecorationsFromPlist_bundleIdentifier_bundle___block_invoke;
  v24[3] = &unk_1E444B2B8;
  v8 = v7;
  v25 = v8;
  v26 = a5;
  objc_msgSend(a3, "fp_map:", v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v16, "decorationIdentifier", (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v13);
  }

  v18 = (void *)objc_msgSend(v10, "copy");
  return v18;
}

- (NSString)decorationIdentifier
{
  return self->_decorationIdentifier;
}

+ (void)_invalidateCache
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = a1;
  objc_sync_enter(v2);
  objc_msgSend(v2, "_decorationCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObject:", v7);
  fp_current_or_default_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 138412290;
    v10 = v5;
    _os_log_impl(&dword_1A0A34000, v8, OS_LOG_TYPE_INFO, "[INFO] Invalidating decoration cache for %@", (uint8_t *)&v9, 0xCu);
  }

  objc_msgSend(v3, "removeObjectsForKeys:", v5);
  objc_sync_exit(v2);

  +[FPItemCollection refreshActiveCollectionsForDecorationChange](FPItemCollection, "refreshActiveCollectionsForDecorationChange");
}

+ (id)_decorationCache
{
  if (_decorationCache_once != -1)
    dispatch_once(&_decorationCache_once, &__block_literal_global_8);
  return (id)_decorationCache_cache;
}

FPItemDecoration *__70__FPItemDecoration__loadDecorationsFromPlist_bundleIdentifier_bundle___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  FPItemDecoration *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[FPItemDecoration initWithPlistEntry:bundle:bundleIdentifier:]([FPItemDecoration alloc], "initWithPlistEntry:bundle:bundleIdentifier:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
  }
  else
  {
    fp_current_or_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __70__FPItemDecoration__loadDecorationsFromPlist_bundleIdentifier_bundle___block_invoke_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);

    v4 = 0;
  }

  return v4;
}

- (FPItemDecoration)initWithPlistEntry:(id)a3 bundle:(__CFBundle *)a4 bundleIdentifier:(id)a5
{
  id v8;
  id v9;
  FPItemDecoration *v10;
  FPItemDecoration *v11;
  void *v12;
  NSString *v13;
  NSString *decorationIdentifier;
  NSObject *v15;
  NSString *imageType;
  NSString *type;
  uint64_t v18;
  FPStringFormat *labelTitle;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  FPItemDecoration *v26;
  NSString *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  objc_super v41;
  uint8_t buf[4];
  const __CFString *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  NSString *v47;
  __int16 v48;
  NSObject *v49;
  _QWORD v50[6];

  v50[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v41.receiver = self;
  v41.super_class = (Class)FPItemDecoration;
  v10 = -[FPItemDecoration init](&v41, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_13;
  objc_storeStrong((id *)&v10->_bundleIdentifier, a5);
  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "setCfBundle:", a4);
  objc_msgSend(v12, "setTableNames:", &unk_1E448F440);
  objc_msgSend(v8, "objectForKey:", CFSTR("Identifier"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FPItemDecoration initWithPlistEntry:bundle:bundleIdentifier:].cold.4();
    goto LABEL_21;
  }
  decorationIdentifier = v11->_decorationIdentifier;
  v11->_decorationIdentifier = v13;

  objc_msgSend(v8, "objectForKey:", CFSTR("BadgeImageType"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v13)
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FPItemDecoration initWithPlistEntry:bundle:bundleIdentifier:].cold.3();
    goto LABEL_21;
  }
  imageType = v11->_imageType;
  v11->_imageType = v13;

  objc_msgSend(v8, "objectForKey:", CFSTR("Category"));
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[FPItemDecoration initWithPlistEntry:bundle:bundleIdentifier:].cold.2();
    goto LABEL_21;
  }
  type = v11->_type;
  v11->_type = v13;

  v50[0] = CFSTR("Badge");
  v50[1] = CFSTR("Sharing");
  v50[2] = CFSTR("FolderBadge");
  v50[3] = CFSTR("FolderStatus");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 4);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue();
  if ((-[NSString containsObject:](v13, "containsObject:", v11->_type) & 1) == 0)
  {
    fp_current_or_default_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
LABEL_21:

      v26 = 0;
      goto LABEL_22;
    }
    v27 = v11->_type;
    -[NSString componentsJoinedByString:](v13, "componentsJoinedByString:", CFSTR(", "));
    v28 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v43 = CFSTR("NSFileProviderDecorations");
    v44 = 2112;
    v45 = v9;
    v46 = 2112;
    v47 = v27;
    v48 = 2112;
    v49 = v28;
    _os_log_error_impl(&dword_1A0A34000, v15, OS_LOG_TYPE_ERROR, "[ERROR] Malformed entry in %@ of bundle %@: type is %@. Valid types are (%@)", buf, 0x2Au);
LABEL_20:

    goto LABEL_21;
  }
  objc_msgSend(v8, "objectForKey:", CFSTR("Label"));
  v15 = objc_claimAutoreleasedReturnValue();
  +[FPStringFormat formatForPlistObject:localizationLookup:](FPStringFormat, "formatForPlistObject:localizationLookup:", v15, v12);
  v18 = objc_claimAutoreleasedReturnValue();
  labelTitle = v11->_labelTitle;
  v11->_labelTitle = (FPStringFormat *)v18;

  if (!v11->_labelTitle)
  {
    fp_current_or_default_log();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[FPItemDecoration initWithPlistEntry:bundle:bundleIdentifier:].cold.1((uint64_t)v9, v28, v29, v30, v31, v32, v33, v34);
    goto LABEL_20;
  }
  -[FPItemDecoration parentDependingKeys](v11, "parentDependingKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPItemDecoration styleDependingKeys](v11, "styleDependingKeys");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPStringFormat keyPaths](v11->_labelTitle, "keyPaths");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __63__FPItemDecoration_initWithPlistEntry_bundle_bundleIdentifier___block_invoke;
  v39[3] = &unk_1E444B2E0;
  v40 = v20;
  v36 = v20;
  objc_msgSend(v22, "fp_filter:", v39);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __63__FPItemDecoration_initWithPlistEntry_bundle_bundleIdentifier___block_invoke_2;
  v37[3] = &unk_1E444B2E0;
  v38 = v21;
  v24 = v21;
  objc_msgSend(v22, "fp_filter:", v37);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v11->_dependsOnParent = objc_msgSend(v23, "count") != 0;
  v11->_dependsOnStyle = v25 != 0;

LABEL_13:
  v26 = v11;
LABEL_22:

  return v26;
}

- (id)styleDependingKeys
{
  return &unk_1E448F470;
}

- (id)parentDependingKeys
{
  return &unk_1E448F458;
}

uint64_t __63__FPItemDecoration_initWithPlistEntry_bundle_bundleIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "containsString:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

uint64_t __63__FPItemDecoration_initWithPlistEntry_bundle_bundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(v3, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i), (_QWORD)v9) & 1) != 0)
        {
          v5 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

void __36__FPItemDecoration__decorationCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_decorationCache_cache;
  _decorationCache_cache = v0;

}

+ (void)initialize
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__FPItemDecoration_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_once != -1)
    dispatch_once(&initialize_once, block);
}

+ (id)_fetchFromCacheWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFBundle *Unique;
  void *ValueForInfoDictionaryKey;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_sync_enter(v8);
  objc_msgSend(v8, "_decorationCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKey:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "bundleURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      Unique = (__CFBundle *)_CFBundleCreateUnique();

    }
    else
    {
      Unique = 0;
    }
    ValueForInfoDictionaryKey = (void *)CFBundleGetValueForInfoDictionaryKey(Unique, CFSTR("NSExtension"));
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(ValueForInfoDictionaryKey, "objectForKey:", CFSTR("NSFileProviderDecorations"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    v10 = (void *)MEMORY[0x1E0C9AA70];
    if (v12)
    {
      if (Unique)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "_loadDecorationsFromPlist:bundleIdentifier:bundle:", v16, v7, Unique);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }
    objc_msgSend(v9, "setObject:forKey:", v10, v7);
    if (Unique)
      CFRelease(Unique);

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v8);
  return v17;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p: %@>"), objc_opt_class(), self, self->_decorationIdentifier);
}

+ (id)decorationWithIdentifier:(id)a3 bundleIdentifier:(id)a4
{
  return +[FPItemDecoration _fetchFromCacheWithIdentifier:bundleIdentifier:](FPItemDecoration, "_fetchFromCacheWithIdentifier:bundleIdentifier:", a3, a4);
}

- (BOOL)requiresFetchingInfoFirst
{
  return self->_dependsOnParent;
}

- (id)labelWithItem:(id)a3 error:(id *)a4
{
  return -[FPItemDecoration labelWithItem:error:style:](self, "labelWithItem:error:style:", a3, a4, 0);
}

- (id)labelWithItem:(id)a3 error:(id *)a4 style:(unint64_t)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v16 = CFSTR("item");
  +[_FPItemDecorationValueResolver resolverForItem:style:](_FPItemDecorationValueResolver, "resolverForItem:style:", a3, a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (self->_dependsOnParent)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[FPItemDecoration decorationIdentifier](self, "decorationIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_opt_class();
    NSStringFromSelector(sel_labelWithInfo_error_);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("FPItemDecoration.m"), 273, CFSTR("Label for decoration %@ depends on parent. %@ %@ should be called for folder status."), v11, v12, v13);

  }
  -[FPStringFormat evaluateWithValuesByName:error:](self->_labelTitle, "evaluateWithValuesByName:error:", v9, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)labelWithInfo:(id)a3 error:(id *)a4
{
  return -[FPItemDecoration labelWithInfo:error:style:](self, "labelWithInfo:error:style:", a3, a4, 0);
}

- (id)labelWithInfo:(id)a3 error:(id *)a4 style:(unint64_t)a5
{
  id v8;
  _FPItemDecorationFallbackLookup *v9;
  void *v10;
  _FPItemDecorationFallbackLookup *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count"))
  {
    v9 = [_FPItemDecorationFallbackLookup alloc];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __46__FPItemDecoration_labelWithInfo_error_style___block_invoke;
    v19[3] = &__block_descriptor_40_e16__16__0__FPItem_8l;
    v19[4] = a5;
    objc_msgSend(v8, "fp_map:", v19);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_FPItemDecorationFallbackLookup initWithItems:](v9, "initWithItems:", v10);

    v20[0] = CFSTR("item");
    objc_msgSend(v8, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[_FPItemDecorationValueResolver resolverForItem:style:](_FPItemDecorationValueResolver, "resolverForItem:style:", v12, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v13;
    v20[1] = CFSTR("rootItem");
    objc_msgSend(v8, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_FPItemDecorationValueResolver resolverForItem:style:](_FPItemDecorationValueResolver, "resolverForItem:style:", v14, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[2] = CFSTR("parentItem");
    v21[1] = v15;
    v21[2] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[FPStringFormat evaluateWithValuesByName:error:](self->_labelTitle, "evaluateWithValuesByName:error:", v16, a4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

id __46__FPItemDecoration_labelWithInfo_error_style___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[_FPItemDecorationValueResolver resolverForItem:style:](_FPItemDecorationValueResolver, "resolverForItem:style:", a2, *(_QWORD *)(a1 + 32));
}

- (id)labelsWithInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 dependsOnStyle;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dependsOnStyle = self->_dependsOnStyle;
  v17 = 0u;
  v18 = 0u;
  if (dependsOnStyle)
    v9 = &unk_1E448F4A0;
  else
    v9 = &unk_1E448F488;
  v19 = 0uLL;
  v20 = 0uLL;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v9);
        -[FPItemDecoration labelWithInfo:error:style:](self, "labelWithInfo:error:style:", v6, a4, objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v17));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
          objc_msgSend(v7, "addObject:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v11);
  }
  if (objc_msgSend(v7, "count", (_QWORD)v17))
    v15 = v7;
  else
    v15 = 0;

  return v15;
}

- (id)labelsWithItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  _BOOL4 dependsOnStyle;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dependsOnStyle = self->_dependsOnStyle;
  v21 = 0u;
  v22 = 0u;
  if (dependsOnStyle)
    v9 = &unk_1E448F4D0;
  else
    v9 = &unk_1E448F4B8;
  v23 = 0uLL;
  v24 = 0uLL;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        v20 = 0;
        -[FPItemDecoration labelWithItem:error:style:](self, "labelWithItem:error:style:", v6, &v20, objc_msgSend(v14, "unsignedIntegerValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v20;
        v17 = v16;
        if (v15)
        {
          objc_msgSend(v7, "addObject:", v15);
        }
        else if (a4 && v16)
        {
          *a4 = objc_retainAutorelease(v16);
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }
  if (objc_msgSend(v7, "count"))
    v18 = v7;
  else
    v18 = 0;

  return v18;
}

- (void)folderStatusForItem:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__FPItemDecoration_folderStatusForItem_completionHandler___block_invoke;
  v8[3] = &unk_1E444B328;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  +[FPItemDecoration fetchInfoForItem:completionHandler:](FPItemDecoration, "fetchInfoForItem:completionHandler:", a3, v8);

}

void __58__FPItemDecoration_folderStatusForItem_completionHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (a3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v7 = 0;
    objc_msgSend(v4, "labelWithInfo:error:", a2, &v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v7;
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  }
}

+ (void)fetchInfoForItem:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[FPItemManager defaultManager](FPItemManager, "defaultManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "_fetchHierarchyForItemID:recursively:completionHandler:", v7, 1, v5);
}

+ (id)infoForItem:(id)a3 parentInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("FPItemDecoration.m"), 365, CFSTR("parentInfo has wrong type"));

  }
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "arrayByAddingObjectsFromArray:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)type
{
  return self->_type;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)imageType
{
  return self->_imageType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_labelTitle, 0);
  objc_storeStrong((id *)&self->_decorationIdentifier, 0);
}

void __70__FPItemDecoration__loadDecorationsFromPlist_bundleIdentifier_bundle___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_2(&dword_1A0A34000, a2, a3, "[ERROR] Malformed entry in %@ entry of bundle %@", a5, a6, a7, a8, 2u);
}

- (void)initWithPlistEntry:(uint64_t)a3 bundle:(uint64_t)a4 bundleIdentifier:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5_2(&dword_1A0A34000, a2, a3, "[ERROR] Malformed entry in %@ of bundle %@", a5, a6, a7, a8, 2u);
}

- (void)initWithPlistEntry:bundle:bundleIdentifier:.cold.2()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_6_3();
  v1 = (void *)objc_opt_class();
  OUTLINED_FUNCTION_7_1(v1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3();
  v3 = OUTLINED_FUNCTION_0_6(v2);
  OUTLINED_FUNCTION_1_3(&dword_1A0A34000, v4, v5, "[ERROR] Malformed entry in %@ of bundle %@: object for key %@ should have class %@, but has %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5_0();
}

- (void)initWithPlistEntry:bundle:bundleIdentifier:.cold.3()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_6_3();
  v1 = (void *)objc_opt_class();
  OUTLINED_FUNCTION_7_1(v1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3();
  v3 = OUTLINED_FUNCTION_0_6(v2);
  OUTLINED_FUNCTION_1_3(&dword_1A0A34000, v4, v5, "[ERROR] Malformed entry in %@ of bundle %@: object for key %@ should have class %@, but has %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5_0();
}

- (void)initWithPlistEntry:bundle:bundleIdentifier:.cold.4()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_6_3();
  v1 = (void *)objc_opt_class();
  OUTLINED_FUNCTION_7_1(v1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_3();
  v3 = OUTLINED_FUNCTION_0_6(v2);
  OUTLINED_FUNCTION_1_3(&dword_1A0A34000, v4, v5, "[ERROR] Malformed entry in %@ of bundle %@: object for key %@ should have class %@, but has %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_5_0();
}

@end
