@implementation NSMapTable(GKAdditions)

- (void)_gkEnumerateKeysAndObjectsUsingBlock:()GKAdditions
{
  void (**v5)(id, uint64_t, void *, char *);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("No block passed to NSMapTable's %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKCollectionUtils.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (block)\n[%s (%s:%d)]"), v8, "-[NSMapTable(GKAdditions) _gkEnumerateKeysAndObjectsUsingBlock:]", objc_msgSend(v10, "UTF8String"), 458);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }
  v23 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = a1;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
LABEL_5:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v15)
        objc_enumerationMutation(v12);
      v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
      objc_msgSend(v12, "objectForKey:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5[2](v5, v17, v18, &v23);

      if (v23)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v14)
          goto LABEL_5;
        break;
      }
    }
  }

}

@end
