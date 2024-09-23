@implementation MapsUILayout

+ (id)buildAttributedDisplayStringForComponents:(id)a3 forContainingView:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  objc_msgSend(a1, "_buildAttributedDisplayStringForComponents:isRTL:", v6, objc_msgSend(a4, "effectiveUserInterfaceLayoutDirection") == 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)buildAttributedDisplayStringForComponents:(id)a3
{
  return (id)objc_msgSend(a1, "buildAttributedDisplayStringForComponents:reverseIfRTLLayout:", a3, 1);
}

+ (id)buildAttributedDisplayStringForComponents:(id)a3 reverseIfRTLLayout:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v7, "userInterfaceLayoutDirection") == 1;

  }
  objc_msgSend(a1, "_buildAttributedDisplayStringForComponents:isRTL:", v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_buildAttributedDisplayStringForComponents:(id)a3 isRTL:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (a4)
    objc_msgSend(v5, "reverseObjectEnumerator");
  else
    objc_msgSend(v5, "objectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "appendAttributedString:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), (_QWORD)v16);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  v14 = (void *)objc_msgSend(v8, "copy");
  return v14;
}

@end
