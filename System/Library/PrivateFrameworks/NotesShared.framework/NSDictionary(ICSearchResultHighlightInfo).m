@implementation NSDictionary(ICSearchResultHighlightInfo)

+ (id)highlightInfoForSearchStringWithPrefixMatchInAllFields:()ICSearchResultHighlightInfo language:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v5)
  {
    +[ICSearchQueryTokenizer tokensFromString:language:](ICSearchQueryTokenizer, "tokensFromString:language:", v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, &unk_1E771A5D0);
    v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, &unk_1E771A5E8);
    objc_msgSend(v10, "addObjectsFromArray:", v8);

  }
  v11 = (void *)objc_msgSend(v7, "copy");

  return v11;
}

+ (id)mergeHighlightInfo:()ICSearchResultHighlightInfo withHighlighInfo:
{
  unint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)v6;
  if (!(v5 | v6))
  {
    v8 = 0;
    goto LABEL_16;
  }
  if (!v5)
  {
LABEL_15:
    v8 = (void *)objc_msgSend((id)v6, "copy");
    goto LABEL_16;
  }
  if (!v6)
  {
    v6 = v5;
    goto LABEL_15;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend((id)v5, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v13);

  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v16);

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v10;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend((id)v5, "objectForKeyedSubscript:", v21);
        v22 = v5;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v21);
        v24 = v7;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "mergeFieldElement:withElement:", v23, v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, v21);

        v7 = v24;
        v5 = v22;
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v18);
  }

  v8 = (void *)objc_msgSend(v9, "copy");
LABEL_16:

  return v8;
}

+ (id)mergeFieldElement:()ICSearchResultHighlightInfo withElement:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = v5;
  if (!v5)
    goto LABEL_17;
  if (!v6)
  {
    v6 = v5;
LABEL_17:
    v9 = (id)objc_msgSend(v6, "mutableCopy");
    goto LABEL_18;
  }
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v11 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "allKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v13);

  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v7, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithArray:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v16);

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v10;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v28 != v19)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(v8, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v21);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v22, "unionSet:", v23);
        if (v24)
          objc_msgSend(v22, "unionSet:", v24);
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, v21);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v18);
  }

LABEL_18:
  return v9;
}

+ (uint64_t)highlightInfoContainsPrefixMatch:()ICSearchResultHighlightInfo
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(v3, "allKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", &unk_1E771A5E8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            v12 = 1;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_12:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)decomposedHighlightInfo:()ICSearchResultHighlightInfo
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v25 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v22 = v3;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v39;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(obj);
        v24 = v4;
        v5 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v4);
        v27 = objc_msgSend(v5, "unsignedIntegerValue");
        objc_msgSend(v22, "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v28 = objc_msgSend(&unk_1E771ABA8, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        if (v28)
        {
          v26 = *(_QWORD *)v35;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v35 != v26)
                objc_enumerationMutation(&unk_1E771ABA8);
              v8 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
              if ((objc_msgSend(v8, "unsignedIntegerValue") & v27) != 0)
              {
                v29 = i;
                objc_msgSend(v25, "objectForKeyedSubscript:", v8);
                v9 = (id)objc_claimAutoreleasedReturnValue();
                if (!v9)
                {
                  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                  objc_msgSend(v25, "setObject:forKeyedSubscript:", v9, v8);
                }
                v32 = 0u;
                v33 = 0u;
                v30 = 0u;
                v31 = 0u;
                v10 = objc_msgSend(&unk_1E771ABC0, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                if (v10)
                {
                  v11 = v10;
                  v12 = *(_QWORD *)v31;
                  do
                  {
                    for (j = 0; j != v11; ++j)
                    {
                      if (*(_QWORD *)v31 != v12)
                        objc_enumerationMutation(&unk_1E771ABC0);
                      v14 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j);
                      objc_msgSend(v6, "objectForKeyedSubscript:", v14);
                      v15 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v15)
                      {
                        objc_msgSend(v9, "objectForKeyedSubscript:", v14);
                        v16 = (id)objc_claimAutoreleasedReturnValue();
                        if (!v16)
                        {
                          v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
                          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, v14);
                        }
                        objc_msgSend(v15, "allObjects");
                        v17 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "addObjectsFromArray:", v17);

                      }
                    }
                    v11 = objc_msgSend(&unk_1E771ABC0, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
                  }
                  while (v11);
                }

                i = v29;
              }
            }
            v28 = objc_msgSend(&unk_1E771ABA8, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
          }
          while (v28);
        }

        v4 = v24 + 1;
      }
      while (v24 + 1 != v23);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v23);
  }

  v18 = (void *)objc_msgSend(v25, "copy");
  return v18;
}

@end
