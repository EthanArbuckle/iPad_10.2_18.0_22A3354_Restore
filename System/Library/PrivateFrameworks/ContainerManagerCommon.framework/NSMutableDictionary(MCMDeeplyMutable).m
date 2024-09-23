@implementation NSMutableDictionary(MCMDeeplyMutable)

- (void)MCM_replaceDeepDictionariesWithReplaceHandler:()MCMDeeplyMutable
{
  void (**v4)(id, void *, void *);
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id obj;
  uint64_t v17;
  _BYTE v18[128];
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_findKeyPathsSortedByDepthFirstOfKindOfClass:", objc_opt_class());
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
  if (v5)
  {
    v6 = v5;
    v17 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(a1, "_dictionaryAtKeyPath:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 != v9)
        {
          objc_msgSend(v8, "lastObject");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_msgSend(v8, "mutableCopy");
          objc_msgSend(v12, "removeLastObject");
          v13 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(a1, "_mutableDictionaryAtKeyPath:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (v10)
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, v11);
          else
            objc_msgSend(v14, "removeObjectForKey:", v11);

        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v19, v18, 16);
    }
    while (v6);
  }

}

- (void)MCM_overlayDictionary:()MCMDeeplyMutable existingValuesTakePrecedent:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  void *context;
  _QWORD v22[4];
  id v23;
  id v24;
  _BYTE v25[128];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v4;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, MEMORY[0x1E0C9AA60]);
  while (objc_msgSend(v5, "count"))
  {
    context = (void *)MEMORY[0x1D17D7010]();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v7);
    objc_msgSend(a1, "_mutableDictionaryAtKeyPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v8, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v7, "arrayByAddingObject:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v22[0] = MEMORY[0x1E0C809B0];
          v22[1] = 3221225472;
          v22[2] = __91__NSMutableDictionary_MCMDeeplyMutable__MCM_overlayDictionary_existingValuesTakePrecedent___block_invoke;
          v22[3] = &unk_1E8CB5058;
          v23 = v5;
          v24 = v16;
          v17 = v16;
          objc_msgSend(a1, "_overlayValueAtKey:intoTargetDictionary:fromSourceDictionary:targetTakePrecedent:nestedDictionaryHandler:", v15, v9, v8, a4, v22);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v25, 16);
      }
      while (v12);
    }

    objc_autoreleasePoolPop(context);
  }

}

- (id)MCM_deepCopy
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  _BYTE v16[128];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_findKeyPathsSortedByDepthFirstOfKindOfClass:", objc_opt_class());
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v18 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(a1, "_dictionaryAtKeyPath:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "lastObject");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v6, "mutableCopy");
        objc_msgSend(v9, "removeLastObject");
        v10 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(a1, "_mutableDictionaryAtKeyPath:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v7, "copy");
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v8);

      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v16, 16);
    }
    while (v3);
  }
  v13 = (void *)objc_msgSend(a1, "copy");

  return v13;
}

- (void)_overlayValueAtKey:()MCMDeeplyMutable intoTargetDictionary:fromSourceDictionary:targetTakePrecedent:nestedDictionaryHandler:
{
  id v11;
  void (**v12)(id, void *);
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v11 = a4;
  v12 = a7;
  objc_msgSend(a5, "objectForKeyedSubscript:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12[2](v12, v13);
  }
  else if (!a6
         || (objc_msgSend(v11, "objectForKeyedSubscript:", v15),
             v14 = (void *)objc_claimAutoreleasedReturnValue(),
             v14,
             !v14))
  {
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, v15, v15);
  }

}

- (id)_findKeyPathsSortedByDepthFirstOfKindOfClass:()MCMDeeplyMutable
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BYTE v17[128];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v2 = objc_alloc(MEMORY[0x1E0C99E20]);
  v3 = (void *)objc_msgSend(v2, "initWithObjects:", MEMORY[0x1E0C9AA60], 0);
  v4 = v3;
  while (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "anyObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);
    objc_msgSend(a1, "_dictionaryAtKeyPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "arrayByAddingObject:", v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v1, "addObject:", v13);
            objc_msgSend(v4, "addObject:", v13);

          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v17, 16);
      }
      while (v8);
    }

    v3 = v4;
  }
  objc_msgSend(v1, "sortUsingComparator:", &__block_literal_global_1176);
  v14 = (void *)objc_msgSend(v1, "copy");

  return v14;
}

- (id)_dictionaryAtKeyPath:()MCMDeeplyMutable
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BYTE v12[128];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      v10 = v5;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(v10, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9));
        v5 = (id)objc_claimAutoreleasedReturnValue();

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v12, 16);
    }
    while (v7);
  }

  return v5;
}

- (id)_mutableDictionaryAtKeyPath:()MCMDeeplyMutable
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  _BYTE v15[128];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = a1;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = v5;
    do
    {
      v10 = 0;
      v11 = v9;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_msgSend(v11, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_createOrConvertToMutableDictionaryFromDictionary:", v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v12);

        ++v10;
        v11 = v9;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v15, 16);
    }
    while (v7);
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (id)_createOrConvertToMutableDictionaryFromDictionary:()MCMDeeplyMutable
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = v3;
  if (!v3 || (v5 = (void *)objc_msgSend(v3, "mutableCopy")) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end
