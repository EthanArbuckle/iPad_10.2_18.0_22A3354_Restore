@implementation NSURL(GEOExtras)

+ (id)_geo_URLWithString:()GEOExtras tokenSubstitutions:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (a3)
  {
    v6 = (void *)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v33 = v5;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          v14 = objc_msgSend(v6, "rangeOfString:", v13, v33);
          if (v14 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v16 = v14;
            v17 = v15;
            objc_msgSend(v6, "replaceCharactersInRange:withString:", v14, v15, &stru_1E1C241D0);
            objc_msgSend(v34, "addObject:", v13);
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v16, v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "setObject:forKey:", v18, v13);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v10);
    }

    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __58__NSURL_GEOExtras___geo_URLWithString_tokenSubstitutions___block_invoke;
    v39[3] = &unk_1E1C0B3D8;
    v19 = v7;
    v40 = v19;
    objc_msgSend(v34, "sortUsingComparator:", v39);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v21 = v34;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j), v33);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "addObjectsFromArray:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v23);
    }

    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v33;
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v27, "queryItems");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v27, "queryItems");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)objc_msgSend(v29, "mutableCopy");

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
      }

      objc_msgSend(v30, "addObjectsFromArray:", v20);
      objc_msgSend(v27, "setQueryItems:", v30);

    }
    objc_msgSend(v27, "URL", v33);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

@end
