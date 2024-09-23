@implementation NSManagedObject(Accounts)

- (void)encodeWithCoder:()Accounts
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(a1, "valueForKey:", v13, (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "encodeObject:forKey:", v14, v13);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

}

- (id)_obsoleteAttributes
{
  if (_obsoleteAttributes_onceToken != -1)
    dispatch_once(&_obsoleteAttributes_onceToken, &__block_literal_global_5);
  return (id)__sACDObsoleteAttributes;
}

- (id)_removeObsoleteKeysFromDictionary:()Accounts
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v4, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_obsoleteAttributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "intersectsSet:", v7))
  {
    v9 = (id)objc_msgSend(v4, "mutableCopy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v14++), (_QWORD)v16);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (void)setValuesWithObject:()Accounts
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "entity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributesByName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "entity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "relationshipsByName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "dirtyProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v20 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          if (objc_msgSend(v7, "containsObject:", v16))
          {
            objc_msgSend(v4, "valueForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "setValue:forKey:", v17, v16);

          }
          else if ((objc_msgSend(v10, "containsObject:", v16) & 1) == 0
                 && (objc_msgSend(v16, "isEqualToString:", CFSTR("credential")) & 1) == 0
                 && (objc_msgSend(v16, "isEqualToString:", CFSTR("accountProperties")) & 1) == 0
                 && (objc_msgSend(v16, "isEqualToString:", CFSTR("parent")) & 1) == 0)
          {
            NSLog((NSString *)CFSTR("Dirty property name '%@' not part of managed object."), v16);
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v13);
    }
  }
  else
  {
    objc_msgSend(v4, "dictionaryWithValuesForKeys:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_removeObsoleteKeysFromDictionary:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setValuesForKeysWithDictionary:", v18);

  }
}

- (uint64_t)validateRequiredAttributesForObject:()Accounts error:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  char v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "entity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributesByName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v8, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isOptional");

        if ((v16 & 1) == 0)
        {
          objc_msgSend(v6, "valueForKey:", v14);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("object is missing required property '%@'"), v14);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (a4)
            {
              v20 = (void *)MEMORY[0x1E0CB35C8];
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v19, *MEMORY[0x1E0CB2D50]);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "errorWithDomain:code:userInfo:", CFSTR("com.apple.accounts"), 2, v21);
              *a4 = (id)objc_claimAutoreleasedReturnValue();

            }
            v18 = 0;
            goto LABEL_14;
          }
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v11)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_14:

  return v18;
}

@end
