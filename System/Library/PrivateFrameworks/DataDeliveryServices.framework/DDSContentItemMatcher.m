@implementation DDSContentItemMatcher

+ (id)assetContentItemsMatching:(id)a3 contentItems:(id)a4 parentAsset:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  DDSContentItem *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v32;
  id v33;
  uint64_t v34;
  id obj;
  void *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  _QWORD v44[5];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v32 = a5;
  objc_msgSend(v32, "attributes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v9;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v46;
    v37 = a1;
    v38 = v8;
    do
    {
      v13 = 0;
      v34 = v11;
      do
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v13);
        objc_msgSend(v14, "objectForKey:", CFSTR("ContentType"));
        v42 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ContentType"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("Locale"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v15)
        {
          v17 = v15;
        }
        else
        {
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("AssetLocale"));
          v17 = (id)objc_claimAutoreleasedReturnValue();
        }
        v41 = v17;

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Locale"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKey:", CFSTR("AssetRegion"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          v20 = v18;
        }
        else
        {
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("AssetRegion"));
          v20 = (id)objc_claimAutoreleasedReturnValue();
        }
        v39 = v20;

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AssetRegion"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "allObjects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __76__DDSContentItemMatcher_assetContentItemsMatching_contentItems_parentAsset___block_invoke;
        v44[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
        v44[4] = a1;
        v23 = (void *)MEMORY[0x1DF0A321C](v44);
        v24 = objc_opt_class();
        objc_msgSend(v43, "allObjects");
        v25 = (DDSContentItem *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)v24;
        v27 = (void *)v42;
        if (objc_msgSend(v26, "_anyStringIn:matches:acceptUnspecifiedValue:", v25, v42, 1))
        {
          v28 = (void *)objc_opt_class();
          objc_msgSend(v40, "allObjects");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v28, "_anyStringIn:matches:acceptUnspecifiedValue:", v29, v41, 1) & 1) != 0)
          {
            v30 = objc_msgSend((id)objc_opt_class(), "_anyDictionaryIn:matches:shouldLenientlyMatch:", v22, v39, v23);

            v11 = v34;
            v27 = (void *)v42;
            if (!v30)
              goto LABEL_18;
            v25 = -[DDSContentItem initWithParentAsset:contents:]([DDSContentItem alloc], "initWithParentAsset:contents:", v32, v14);
            objc_msgSend(v33, "addObject:", v25);
          }
          else
          {

            v11 = v34;
            v27 = (void *)v42;
          }
        }

LABEL_18:
        ++v13;
        a1 = v37;
        v8 = v38;
      }
      while (v11 != v13);
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v11);
  }

  return v33;
}

+ (BOOL)_anyStringIn:(id)a3 matches:(id)a4 acceptUnspecifiedValue:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v5 = a5;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v9 = v7;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v17;
        while (2)
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v17 != v12)
              objc_enumerationMutation(v9);
            if ((objc_msgSend((id)objc_opt_class(), "_string:matches:acceptUnspecifiedValue:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i), v8, v5, (_QWORD)v16) & 1) != 0)
            {

              goto LABEL_13;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
          if (v11)
            continue;
          break;
        }
      }

      v14 = 0;
    }
    else
    {
      v14 = objc_msgSend((id)objc_opt_class(), "_string:matches:acceptUnspecifiedValue:", &stru_1EA1420B0, v8, 1);
    }
  }
  else
  {
LABEL_13:
    v14 = 1;
  }

  return v14;
}

+ (BOOL)_string:(id)a3 matches:(id)a4 acceptUnspecifiedValue:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  BOOL v12;

  v5 = a5;
  v7 = a3;
  v8 = &stru_1EA1420B0;
  if (a4)
    v8 = (__CFString *)a4;
  v9 = v8;
  v10 = v9;
  if (!v5)
  {
    if (!v7)
    {
      v12 = 1;
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  v11 = -[__CFString length](v9, "length");
  v12 = 1;
  if (v7 && v11)
LABEL_8:
    v12 = objc_msgSend(v7, "caseInsensitiveCompare:", v10) == 0;
LABEL_10:

  return v12;
}

+ (BOOL)_anyDictionaryIn:(id)a3 matches:(id)a4 shouldLenientlyMatch:(id)a5
{
  id v7;
  id v8;
  uint64_t (**v9)(id, _QWORD);
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  uint64_t v16;
  char v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (uint64_t (**)(id, _QWORD))a5;
  if (v7)
  {
    if (objc_msgSend(v7, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            if (v9)
              v16 = v9[2](v9, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
            else
              v16 = 0;
            if ((objc_msgSend((id)objc_opt_class(), "_dictionary:matches:acceptUnspecifiedAttribute:lenientMatch:", v15, v8, v16 ^ 1, v16, (_QWORD)v19) & 1) != 0)
            {

              goto LABEL_16;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v12)
            continue;
          break;
        }
      }

      v17 = 0;
    }
    else
    {
      v17 = objc_msgSend((id)objc_opt_class(), "_dictionary:matches:acceptUnspecifiedAttribute:lenientMatch:", MEMORY[0x1E0C9AA70], v8, 1, 0);
    }
  }
  else
  {
LABEL_16:
    v17 = 1;
  }

  return v17;
}

uint64_t __76__DDSContentItemMatcher_assetContentItemsMatching_contentItems_parentAsset___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  v3 = objc_msgSend((id)objc_opt_class(), "shouldLenientlyMatchWithContentItemsForRegion:", v2);

  return v3;
}

+ (BOOL)shouldLenientlyMatchWithContentItemsForRegion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("City"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Province"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Country"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "length") == 0;

    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_dictionary:(id)a3 matches:(id)a4 acceptUnspecifiedAttribute:(BOOL)a5 lenientMatch:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  id obj;
  _BOOL4 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v6 = a6;
  v23 = a5;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (v8 && objc_msgSend(v9, "count"))
  {
    if (objc_msgSend(v8, "count"))
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      objc_msgSend(v8, "allKeys");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v25;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v25 != v13)
              objc_enumerationMutation(obj);
            v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            objc_msgSend(v8, "objectForKeyedSubscript:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (!v6 || objc_msgSend(v16, "length"))
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", v15);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = objc_msgSend((id)objc_opt_class(), "_string:matches:acceptUnspecifiedValue:", v17, v18, v23);

              if ((v19 & 1) == 0)
              {

                v20 = 0;
                goto LABEL_17;
              }
            }

          }
          v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
          if (v12)
            continue;
          break;
        }
      }
      v20 = 1;
LABEL_17:

    }
    else
    {
      v20 = objc_msgSend(v10, "count") == 0;
    }
  }
  else
  {
    v20 = 1;
  }

  return v20;
}

@end
