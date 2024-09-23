@implementation ATXAppDisplayIdentifiers

+ (NSSet)allIdentifiers
{
  return (NSSet *)(id)SBSCopyDisplayIdentifiers();
}

+ (NSSet)appIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "allIdentifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(a1, "isWidgetOrWebClipIdentifier:", v9) & 1) == 0
          && (objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple.downloadingicon")) & 1) == 0)
        {
          objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

+ (BOOL)isWidgetOrWebClipIdentifier:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  _QWORD v14[6];

  v14[5] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "length") == 36)
  {
    v4 = v3;
  }
  else
  {
    if (objc_msgSend(v3, "length") != 32)
    {
      v12 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "substringToIndex:", 8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "substringWithRange:", 8, 4, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    objc_msgSend(v3, "substringWithRange:", 12, 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v7;
    objc_msgSend(v3, "substringWithRange:", 16, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v8;
    objc_msgSend(v3, "substringFromIndex:", 20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("-"));
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
  v12 = v11 != 0;

LABEL_7:
  return v12;
}

@end
