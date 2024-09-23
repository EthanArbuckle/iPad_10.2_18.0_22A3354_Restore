@implementation NSDictionary(GameControllerSettings)

- (void)initWithJSONObject:()GameControllerSettings
{
  id v4;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = v4;
    v5 = v4;
    v6 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v21;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v21 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            objc_msgSend(v7, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v14, "conformsToProtocol:", &unk_254DF1F50))
              objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v13);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v9);
    }

    v15 = (void *)objc_msgSend(a1, "initWithDictionary:", v6);
    a1 = v15;
    if (v15)
      v16 = v15;

    v17 = a1;
    v4 = v19;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)jsonObject
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v11 = (id)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a1, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v6);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(a1, "objectForKey:", v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v8, "conformsToProtocol:", &unk_254DF1F50))
          {
            objc_msgSend(v8, "jsonObject");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, v7);

          }
          else if (objc_msgSend(v8, "conformsToProtocol:", &unk_254DF37A8))
          {
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v7);
          }

        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  return v11;
}

+ (id)_gcs_jsonObjectForSerializableDictionary:()GameControllerSettings
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[NSMutableDictionary dictionaryWithCapacity:](&off_254DF4A00, "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = v10;
          objc_msgSend(v5, "objectForKeyedSubscript:", v11, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "conformsToProtocol:", &unk_254DF37A8))
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v11);
          }
          else
          {
            objc_msgSend(v12, "jsonObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, v11);

          }
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)_gcs_serializableDictionaryForJsonObject:()GameControllerSettings withValuesOfClass:
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char **v10;
  char **v11;
  char **v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  id v20;
  char **v21;
  char **v22;
  char **v23;
  void *v24;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  +[NSMutableDictionary dictionaryWithCapacity:](&off_254DF4A00, "dictionaryWithCapacity:", objc_msgSend(v5, "count"));
  v27 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v29;
    v10 = &selRef_sfSymbolsName;
    v11 = &selRef_sfSymbolsName;
    v12 = &selRef_sfSymbolsName;
    do
    {
      v13 = 0;
      v26 = v8;
      do
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(v6);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
          objc_msgSend(v6, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", v11[28])
            && (objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v16, v15);
          }
          else if (-[objc_class conformsToProtocol:](a4, "conformsToProtocol:", v12[27], v26))
          {
            v17 = objc_msgSend([a4 alloc], "initWithJSONObject:", v16);
            v18 = a4;
            v19 = v9;
            v20 = v6;
            v21 = v10;
            v22 = v11;
            v23 = v12;
            v24 = (void *)v17;
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v17, v15);

            v12 = v23;
            v11 = v22;
            v10 = v21;
            v6 = v20;
            v9 = v19;
            a4 = v18;
            v8 = v26;
          }

        }
        ++v13;
      }
      while (v8 != v13);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v8);
  }

  return v27;
}

+ (id)_gcs_serializableDictionaryForDictionaryJsonObject:()GameControllerSettings
{
  id v3;
  void *v4;

  if (a3)
  {
    v3 = a3;
    v4 = (void *)objc_msgSend(objc_alloc((Class)&off_254DF3850), "initWithJSONObject:", v3);

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_gcs_stringForJSONKey:()GameControllerSettings
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)_gcs_numberForJSONKey:()GameControllerSettings
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)_gcs_dictionaryForJSONKey:()GameControllerSettings
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)_gcs_arrayForJSONKey:()GameControllerSettings
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)_gcs_dateForJSONKey:()GameControllerSettings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (void *)objc_msgSend(objc_alloc((Class)&off_254DF3E30), "initWithJSONObject:", v1);
  else
    v2 = 0;

  return v2;
}

- (id)_gcs_uuidForJSONKey:()GameControllerSettings
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = (void *)objc_msgSend(objc_alloc((Class)&off_254DF3350), "initWithJSONObject:", v1);
  else
    v2 = 0;

  return v2;
}

- (GCSElement)_gcs_gscElementForJSONKey:()GameControllerSettings
{
  void *v1;
  GCSElement *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = -[GCSElement initWithJSONObject:]([GCSElement alloc], "initWithJSONObject:", v1);
  else
    v2 = 0;

  return v2;
}

- (GCSProfile)_gcs_gscProfileForJSONKey:()GameControllerSettings
{
  void *v1;
  GCSProfile *v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = -[GCSProfile initWithJSONObject:]([GCSProfile alloc], "initWithJSONObject:", v1);
  else
    v2 = 0;

  return v2;
}

@end
