@implementation NSDictionary(LSPluginQueryAdditions)

- (id)ls_parseQueryForIdentifiers:()LSPluginQueryAdditions
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (_NSIsNSArray())
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
          if (_NSIsNSString())
          {
            objc_msgSend(v11, "ls_cleanForPluginQuery", (_QWORD)v15);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12)
              objc_msgSend(v5, "addObject:", v12);

          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else if (_NSIsNSString())
  {
    objc_msgSend(v6, "ls_cleanForPluginQuery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      objc_msgSend(v5, "addObject:", v13);

  }
  return v5;
}

- (uint64_t)ls_hashQuery
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__NSDictionary_LSPluginQueryAdditions__ls_hashQuery__block_invoke;
  v3[3] = &unk_1E1044A00;
  v3[4] = &v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

@end
