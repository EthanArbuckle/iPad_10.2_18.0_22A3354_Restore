@implementation _DKEventStatsUtilities

+ (id)componentsPrunedOfLeadingBlanksFromComponents:(uint64_t)a1
{
  id v2;
  void *v3;

  v2 = a2;
  objc_opt_self();
  while (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {

      return v2;
    }
    objc_msgSend(v2, "removeObjectAtIndex:", 0);

  }
  return v2;
}

+ (id)safeStringWithString:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = safeStringWithString__initialized;
  v5 = a3;
  if (v4 != -1)
    dispatch_once(&safeStringWithString__initialized, &__block_literal_global_396);
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", safeStringWithString__nonPermittedCharacterSet);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  +[_DKEventStatsUtilities componentsPrunedOfLeadingBlanksFromComponents:]((uint64_t)a1, v7);
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("_"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)safeStringsWithStrings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(a1, "safeStringWithString:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

  }
  v13 = (void *)objc_msgSend(0, "copy", (_QWORD)v15);

  return v13;
}

@end
