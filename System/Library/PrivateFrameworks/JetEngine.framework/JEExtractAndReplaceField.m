@implementation JEExtractAndReplaceField

+ (id)metricsAfterExtractAndReplaceSubFieldWithConfig:(id)a3 metrics:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  id obj;
  uint64_t v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("extractFromLists"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("replacementField"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("subFieldToExtract"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v5;
  objc_msgSend(v5, "objectForKey:", CFSTR("replacementIndexSubField"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v30 = v6;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v6);
  v31 = (id)objc_claimAutoreleasedReturnValue();
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v7;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v32)
  {
    v29 = *(_QWORD *)v41;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v41 != v29)
          objc_enumerationMutation(obj);
        v33 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v10);
        v34 = v10;
        objc_msgSend(v30, "objectForKey:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v13 = v11;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v37 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              objc_msgSend(v18, "objectForKey:", v8);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              if (v19)
              {
                objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v18);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v9, "containsObject:", v19))
                {
                  v21 = (void *)MEMORY[0x1E0CB37E8];
                  v22 = objc_msgSend(v9, "indexOfObject:", v19);
                }
                else
                {
                  objc_msgSend(v9, "addObject:", v19);
                  v21 = (void *)MEMORY[0x1E0CB37E8];
                  v22 = objc_msgSend(v9, "count") - 1;
                }
                objc_msgSend(v21, "numberWithInteger:", v22);
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setObject:forKey:", v23, v35);

                objc_msgSend(v20, "removeObjectForKey:", v8);
                objc_msgSend(v12, "addObject:", v20);

              }
              else
              {
                objc_msgSend(v12, "addObject:", v18);
              }

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v15);
        }

        objc_msgSend(v31, "setObject:forKey:", v12, v33);
        v10 = v34 + 1;
      }
      while (v34 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v32);
  }

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKey:", v24, v26);

  }
  return v31;
}

@end
