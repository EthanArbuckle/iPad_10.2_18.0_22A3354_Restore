@implementation NSDictionary(GKCollectionUtils)

- (id)_gkDictionaryByRemovingObjectsForKeys:()GKCollectionUtils
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObjectsForKeys:", v4);

  return v5;
}

- (id)_gkDictionaryByRemovingObjectForKey:()GKCollectionUtils
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObjectForKey:", v4);

  return v5;
}

- (id)_gkSubDictionaryWithKeys:()GKCollectionUtils
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKey:", v11, (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v5, "setObject:forKey:", v12, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_gkSubDictionaryWithKeys:()GKCollectionUtils mappedToNewKeys:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[5];
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "count");
  if (v8 != objc_msgSend(v6, "count"))
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Assertion failed"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKCollectionUtils.m");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ ([newKeys count] == [keys count])\n[%s (%s:%d)]"), v10, "-[NSDictionary(GKCollectionUtils) _gkSubDictionaryWithKeys:mappedToNewKeys:]", objc_msgSend(v12, "UTF8String"), 329);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v13);
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __76__NSDictionary_GKCollectionUtils___gkSubDictionaryWithKeys_mappedToNewKeys___block_invoke;
  v20[3] = &unk_1E75B07F8;
  v20[4] = a1;
  v15 = v14;
  v21 = v15;
  v22 = v7;
  v16 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v20);
  v17 = v22;
  v18 = v15;

  return v18;
}

+ (id)_gkDictionaryWithFormEncodedString:()GKCollectionUtils
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    v5 = a3;
    objc_msgSend(v4, "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkAddEntriesFromFormEncodedString:", v5);

    objc_msgSend(a1, "dictionaryWithDictionary:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)_gkValuesForKeys:()GKCollectionUtils
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_gkDictionaryWithValue:()GKCollectionUtils forKey:
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a3 && a4)
  {
    v6 = a4;
    v7 = a3;
    v8 = (void *)objc_msgSend(a1, "mutableCopy");
    objc_msgSend(v8, "setObject:forKey:", v7, v6);

    v9 = (id)objc_msgSend(v8, "copy");
  }
  else
  {
    v9 = a1;
  }
  return v9;
}

- (id)_gkAddEntriesFrom:()GKCollectionUtils
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0C99E08];
    v5 = a3;
    objc_msgSend(v4, "dictionaryWithDictionary:", a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addEntriesFromDictionary:", v5);

    v7 = (id)objc_msgSend(v6, "copy");
  }
  else
  {
    v7 = a1;
  }
  return v7;
}

- (uint64_t)BOOLValueFromKey:()GKCollectionUtils defaultValue:
{
  void *v5;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (uint64_t)integerValueFromKey:()GKCollectionUtils defaultValue:
{
  void *v5;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "integerValue");

  return a4;
}

@end
