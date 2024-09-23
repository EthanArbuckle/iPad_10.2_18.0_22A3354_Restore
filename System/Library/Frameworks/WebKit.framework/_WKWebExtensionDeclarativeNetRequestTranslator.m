@implementation _WKWebExtensionDeclarativeNetRequestTranslator

+ (id)translateRules:(id)a3 errorStrings:(id *)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _WKWebExtensionDeclarativeNetRequestRule *v14;
  _WKWebExtensionDeclarativeNetRequestRule *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v29;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v6)
  {
    v7 = 0;
    v31 = *(_QWORD *)v44;
    v32 = v6;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v44 != v31)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v40;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v40 != v11)
                objc_enumerationMutation(v9);
              v13 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v12);
              v14 = [_WKWebExtensionDeclarativeNetRequestRule alloc];
              v38 = 0;
              v15 = -[_WKWebExtensionDeclarativeNetRequestRule initWithDictionary:errorString:](v14, "initWithDictionary:errorString:", v13, &v38);
              v16 = v38;
              v17 = v16;
              if (v15)
              {
                objc_msgSend(v4, "addObject:", v15);
              }
              else if (v16)
              {
                ++v7;
                if ((unint64_t)objc_msgSend(v5, "count") <= 0x31)
                  objc_msgSend(v5, "addObject:", v17);
              }

              ++v12;
            }
            while (v10 != v12);
            v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
            v10 = v18;
          }
          while (v18);
        }

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v32);

    if (v7 >= 0x33)
      objc_msgSend(v5, "addObject:", CFSTR("Error limit hit. No longer omitting errors."));
  }
  else
  {

  }
  if (a4)
    *a4 = (id)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "sortedArrayUsingComparator:", &__block_literal_global_0, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v20;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v35;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v35 != v24)
          objc_enumerationMutation(v22);
        objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "ruleInWebKitFormat");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "addObjectsFromArray:", v26);

      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
    }
    while (v23);
  }

  return v21;
}

+ (id)jsonObjectsFromData:(id)a3 errorStrings:(id *)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v15;
  id v17;
  id obj;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v15;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    v7 = *MEMORY[0x1E0CB2938];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        v19 = 0;
        WebKit::parseJSON(v9, 1, (uint64_t)&v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v19;
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v17, "addObject:", v10);
        }
        if (v11)
        {
          objc_msgSend(v11, "userInfo");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v7);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v5);
  }

  if (a4)
    *a4 = (id)objc_msgSend(v4, "copy");

  return v17;
}

@end
