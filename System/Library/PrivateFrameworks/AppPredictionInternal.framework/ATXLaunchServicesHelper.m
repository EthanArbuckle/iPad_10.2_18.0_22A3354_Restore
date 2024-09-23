@implementation ATXLaunchServicesHelper

+ (BOOL)bundleIsExtension:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CA5848];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:error:", v4, 0);

  return v5 != 0;
}

+ (id)getGenreIdsForBundleId:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (objc_class *)MEMORY[0x1E0CA5870];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v5, 1, 0);

  v7 = 0;
  if ((objc_msgSend(v6, "isLaunchProhibited") & 1) == 0)
  {
    objc_msgSend(a1, "getGenreIdsForRecord:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

+ (id)getGenreIdsForRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  void *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v3, "iTunesMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "genreIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v18 = v3;
  objc_msgSend(v3, "iTunesMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subgenres");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v20 != v11)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("genreId"), v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v14 = v13;
          if (!v10)
            v10 = (void *)objc_opt_new();
          objc_msgSend(v10, "addObject:", v14);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  objc_msgSend(MEMORY[0x1E0D81638], "tupleWithFirst:second:", v17, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
