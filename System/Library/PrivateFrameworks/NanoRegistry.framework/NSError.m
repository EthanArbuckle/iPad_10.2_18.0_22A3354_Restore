@implementation NSError

+ (id)nr_filteredPlistDictionary:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
    {
      v6 = v5;
      v18 = v2;
      v7 = 0;
      v8 = *(_QWORD *)v20;
      while (1)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v4);
          v10 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v7 = 1;
            goto LABEL_17;
          }
          objc_msgSend(v4, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[NSError nr_filteredPlistDictionary:](MEMORY[0x1E0CB35C8], v11);
            v12 = objc_claimAutoreleasedReturnValue();
LABEL_13:
            v13 = (void *)v12;
            if ((void *)v12 != v11)
              v7 = 1;
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, v10);

            goto LABEL_16;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[NSError nr_filteredPlistArray:](MEMORY[0x1E0CB35C8], v11);
            v12 = objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
          if (+[NSError nr_isPlistObject:](MEMORY[0x1E0CB35C8], v11))
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, v10);
          else
            v7 = 1;
LABEL_16:

LABEL_17:
          ++v9;
        }
        while (v6 != v9);
        v14 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        v6 = v14;
        if (!v14)
        {

          v15 = v3;
          v2 = v18;
          if ((v7 & 1) != 0)
            goto LABEL_28;
          goto LABEL_27;
        }
      }
    }

  }
  else
  {
    v3 = 0;
  }
LABEL_27:
  v15 = v3;
  v3 = v2;
LABEL_28:
  v16 = v3;

  return v16;
}

+ (uint64_t)nr_isPlistObject:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (qword_1ECE239A0 != -1)
    dispatch_once(&qword_1ECE239A0, &__block_literal_global_17);
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v3 = (id)_MergedGlobals_16;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

void __47__NSError_NRSafeDescription__nr_isPlistObject___block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = v7;

}

+ (id)nr_filteredPlistArray:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v17 = v2;
      v7 = 0;
      v8 = *(_QWORD *)v19;
      while (1)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            +[NSError nr_filteredPlistDictionary:](MEMORY[0x1E0CB35C8], v10);
            v11 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (+[NSError nr_isPlistObject:](MEMORY[0x1E0CB35C8], v10))
                objc_msgSend(v3, "addObject:", v10);
              else
                v7 = 1;
              goto LABEL_14;
            }
            +[NSError nr_filteredPlistArray:](MEMORY[0x1E0CB35C8], v10);
            v11 = objc_claimAutoreleasedReturnValue();
          }
          v12 = (void *)v11;
          if ((void *)v11 != v10)
            v7 = 1;
          objc_msgSend(v3, "addObject:", v11);

LABEL_14:
          ++v9;
        }
        while (v6 != v9);
        v13 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        v6 = v13;
        if (!v13)
        {

          v14 = v3;
          v2 = v17;
          if ((v7 & 1) != 0)
            goto LABEL_25;
          goto LABEL_24;
        }
      }
    }

  }
  else
  {
    v3 = 0;
  }
LABEL_24:
  v14 = v3;
  v3 = v2;
LABEL_25:
  v15 = v3;

  return v15;
}

@end
