@implementation NSArray(INCacheSupport)

- (id)_intents_cacheableObjects
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE038EE8, (_QWORD)v13))
        {
          objc_msgSend(v8, "_intents_cacheableObjects");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "count"))
            objc_msgSend(v2, "unionSet:", v9);

        }
        else if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE056518))
        {
          objc_msgSend(v2, "addObject:", v8);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  if (objc_msgSend(v2, "count"))
    v10 = v2;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

- (void)_intents_updateContainerWithCache:()INCacheSupport
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = a1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v10, "conformsToProtocol:", &unk_1EE038EE8, (_QWORD)v16))
        {
          objc_msgSend(v10, "_intents_updateContainerWithCache:", v4);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v11 = v10;
            objc_msgSend(v11, "_identifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "cacheableObjectForIdentifier:", v12);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
            {
              objc_msgSend(v11, "_identifier");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "cacheableObjectForIdentifier:", v14);
              v15 = (void *)objc_claimAutoreleasedReturnValue();

              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v15, "_imageSize");
                objc_msgSend(v11, "_setImageSize:");
              }

            }
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

}

@end
