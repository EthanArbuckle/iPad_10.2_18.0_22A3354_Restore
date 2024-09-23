@implementation LoopQuicktimeMetadata

+ (id)metadataArrayForDictionary:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v9;

  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", a3, 1, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v9;
  if (v4)
  {
    NSLog(CFSTR("metadataArrayForDictionary: error converting to JSON data"));
    v5 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v3, 4);
    v7 = objc_alloc_init(MEMORY[0x1E0C8B278]);
    objc_msgSend(v7, "setKeySpace:", *MEMORY[0x1E0C8A9E8]);
    objc_msgSend(v7, "setKey:", qword_1EFEC8000);
    objc_msgSend(v7, "setDataType:", *MEMORY[0x1E0CA2498]);
    objc_msgSend(v7, "setValue:", v6);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

+ (id)metadataDictionaryForAssetURL:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  objc_msgSend(MEMORY[0x1E0C8AF90], "assetWithURL:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "metadataForFormat:", *MEMORY[0x1E0C8A908]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C8B220], "metadataItemsFromArray:withKey:keySpace:", v3, qword_1EFEC8000, 0);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      v9 = 0;
      v10 = v7;
      do
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v9), "stringValue");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dataUsingEncoding:", 4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v12, 0, &v17);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v17;

        if (v13)
          sub_1D4C8A42C();

        ++v9;
        v10 = v7;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)arrayFromDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3
    && (v16 = 0u,
        v17 = 0u,
        v14 = 0u,
        v15 = 0u,
        (v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16)) != 0))
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
          v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ : %@"), v10, v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v12);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)metadataStringArrayForAssetURL:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "metadataDictionaryForAssetURL:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "arrayFromDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)metadataStringForArray:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  __CFString *v12;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (objc_msgSend(v3, "count"))
    {
      v5 = 0;
      v6 = &stru_1E98652B8;
      do
      {
        objc_msgSend(v4, "objectAtIndexedSubscript:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v5)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@; %@"), v6, v7);
          v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v9 = v7;
        }
        v10 = v9;

        ++v5;
        v6 = v10;
      }
      while (v5 < objc_msgSend(v4, "count"));
    }
    else
    {
      v10 = &stru_1E98652B8;
    }
    v12 = v10;
    v11 = v12;
  }
  else
  {
    v11 = 0;
    v12 = &stru_1E98652B8;
  }

  return v11;
}

+ (id)metadataStringForAssetURL:(id)a3
{
  void *v3;
  void *v4;

  +[LoopQuicktimeMetadata metadataStringArrayForAssetURL:](LoopQuicktimeMetadata, "metadataStringArrayForAssetURL:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[LoopQuicktimeMetadata metadataStringForArray:](LoopQuicktimeMetadata, "metadataStringForArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
