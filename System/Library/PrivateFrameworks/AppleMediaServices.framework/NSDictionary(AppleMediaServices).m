@implementation NSDictionary(AppleMediaServices)

- (id)ams_mapWithTransform:()AppleMediaServices
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __57__NSDictionary_AppleMediaServices__ams_mapWithTransform___block_invoke;
  v13 = &unk_1E25479B0;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ams_sanitizedForSecureCoding
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_filterUsingTest:", &__block_literal_global_2_6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_mapWithTransform:", &__block_literal_global_3_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ams_filterUsingTest:()AppleMediaServices
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
  v12 = __56__NSDictionary_AppleMediaServices__ams_filterUsingTest___block_invoke;
  v13 = &unk_1E25479B0;
  v14 = v5;
  v15 = v4;
  v6 = v5;
  v7 = v4;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v6, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ams_arrayUsingTransform:()AppleMediaServices
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __60__NSDictionary_AppleMediaServices__ams_arrayUsingTransform___block_invoke;
  v13 = &unk_1E25479B0;
  v14 = v5;
  v15 = v4;
  v6 = v4;
  v7 = v5;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", &v10);
  v8 = (void *)objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)ams_objectForKey:()AppleMediaServices defaultValue:
{
  id v6;
  id v7;

  v6 = a4;
  objc_msgSend(a1, "objectForKeyedSubscript:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = v6;

  return v7;
}

- (id)ams_objectForCaseInsensitiveKey:()AppleMediaServices
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if (!objc_msgSend(v4, "caseInsensitiveCompare:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9)))
        {
          objc_msgSend(a1, "objectForKeyedSubscript:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)hashedDescription
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "ams_mapWithTransform:", &__block_literal_global_145);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_generateDescriptionWithSubObjects:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)ams_componentsJoinedByString:()AppleMediaServices
{
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(a1, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v7 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("%@:%@"), v8, v9);
      if (v7 != objc_msgSend(v6, "count") - 1)
        objc_msgSend(v5, "appendString:", v4);

      ++v7;
    }
    while (v7 < objc_msgSend(v6, "count"));
  }
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (id)ams_dictionaryByAddingEntriesFromDictionary:()AppleMediaServices
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

- (id)ams_firstKeyPassingTest:()AppleMediaServices
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_firstKeyObjectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "first");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ams_firstKeyObjectPassingTest:()AppleMediaServices
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__78;
  v15 = __Block_byref_object_dispose__78;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__NSDictionary_AppleMediaServices__ams_firstKeyObjectPassingTest___block_invoke;
  v8[3] = &unk_1E25479D8;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)ams_firstObjectPassingTest:()AppleMediaServices
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "ams_firstKeyObjectPassingTest:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "second");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ams_dictionaryRemovingKeys:()AppleMediaServices
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "removeObjectsForKeys:", v4);

  v6 = (void *)objc_msgSend(v5, "copy");
  return v6;
}

@end
