@implementation NSDictionary(ARPersonDetectionData)

- (id)recursiveObjectForKey:()ARPersonDetectionData deleteKeys:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "addObject:", v7);
  objc_msgSend(a1, "_recursiveObjectForKey:visited:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v7);

  objc_msgSend(v6, "addObjectsFromArray:", v8);
  return v9;
}

- (id)_recursiveObjectForKey:()ARPersonDetectionData visited:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "objectForKey:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (id)objc_msgSend(v7, "mutableCopy");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v18 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          if ((objc_msgSend(v6, "containsObject:", v14) & 1) == 0)
          {
            objc_msgSend(v6, "addObject:", v14);
            objc_msgSend(a1, "_recursiveObjectForKey:visited:", v14, v6);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v15, "allObjects");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObjectsFromArray:", v16);

            }
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v11);
    }

    v7 = v18;
  }
  else
  {
    v8 = v7;
  }

  return v8;
}

@end
