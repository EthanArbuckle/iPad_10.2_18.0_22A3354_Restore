@implementation NSObject(DeepMutable)

- (id)deepMutableObject
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(a1, "count"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v3 = a1;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "deepMutableObject");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v8);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v5);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v2 = a1;
      return v2;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(a1, "count"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v3 = a1;
    v9 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v3);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * j);
          objc_msgSend(v3, "objectForKey:", v13, (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "deepMutableObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", v15, v13);

        }
        v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      }
      while (v10);
    }
  }

  return v2;
}

@end
