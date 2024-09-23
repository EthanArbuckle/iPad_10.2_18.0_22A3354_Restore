@implementation NSDictionary(HealthKit)

- (id)hk_dictionaryByAddingEntriesFromDictionary:()HealthKit
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "addEntriesFromDictionary:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

- (id)hk_sortedKeys
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "allKeys");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sortedArrayUsingSelector:", sel_compare_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hk_allValuesBySortedKeys
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(a1, "hk_sortedKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__NSDictionary_HealthKit__hk_allValuesBySortedKeys__block_invoke;
  v5[3] = &unk_1E37EBF58;
  v5[4] = a1;
  objc_msgSend(v2, "hk_map:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hk_filterKeysWithBlock:()HealthKit
{
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v4[2](v4, v12);

        if (v13)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)hk_filteredDictionaryForKeys:()HealthKit
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __56__NSDictionary_HealthKit__hk_filteredDictionaryForKeys___block_invoke;
  v13 = &unk_1E37EBF80;
  v14 = v4;
  v15 = v5;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)hk_filter:()HealthKit
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __37__NSDictionary_HealthKit__hk_filter___block_invoke;
  v13 = &unk_1E37EBFA8;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)hk_map:()HealthKit
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+HealthKit.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("map"));

  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__NSDictionary_HealthKit__hk_map___block_invoke;
  v12[3] = &unk_1E37EBFA8;
  v13 = v6;
  v14 = v5;
  v7 = v6;
  v8 = v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v12);
  v9 = (void *)objc_msgSend(v7, "copy");

  return v9;
}

- (uint64_t)hk_containsValuePassingTest:()HealthKit
{
  uint64_t (**v5)(id, void *);
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  char v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSDictionary+HealthKit.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("testHandler"));

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(v6, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v5[2](v5, v10);

        if ((v11 & 1) != 0)
        {
          v7 = 1;
          goto LABEL_13;
        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

  return v7;
}

- (id)hk_replaceKeysFromSharedStringCache
{
  void *v2;
  void *v3;

  +[HKStringCache sharedCache](HKStringCache, "sharedCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryReplacingKeysFromDictionary:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
