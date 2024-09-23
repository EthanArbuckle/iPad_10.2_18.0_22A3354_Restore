@implementation NSString(INJSONSerialization)

- (id)_intents_encodeWithJSONEncoder:()INJSONSerialization codableDescription:
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = a1;
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v8, "_formatKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v10, CFSTR("formatKey"));

    objc_msgSend(v8, "_table");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v11, CFSTR("table"));

    objc_msgSend(v8, "_bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v12, CFSTR("bundleIdentifier"));

    objc_msgSend(v8, "_bundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "encodeObject:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v14, CFSTR("bundleURL"));

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    objc_msgSend(v8, "_arguments", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v31;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v31 != v19)
            objc_enumerationMutation(v16);
          objc_msgSend(v6, "encodeObject:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v20));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "if_addObjectIfNonNil:", v21);

          ++v20;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v18);
    }

    if (!objc_msgSend(v15, "count"))
    {

      v15 = 0;
    }
    v22 = (void *)objc_msgSend(v15, "copy");

    objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v22, CFSTR("arguments"));
    objc_msgSend(v6, "_storedConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "languageCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v6, "configuration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "languageCode");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizeForLanguage:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "if_setObjectIfNonNil:forKey:", v27, CFSTR("localizedValue"));

    }
    v28 = (id)objc_msgSend(v9, "copy");

  }
  else
  {

    v28 = v8;
  }

  return v28;
}

+ (INDeferredLocalizedString)_intents_decodeWithJSONDecoder:()INJSONSerialization codableDescription:from:
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  INDeferredLocalizedString *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("formatKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("table"));
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = objc_opt_class();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("bundleURL"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "decodeObjectOfClass:from:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("arguments"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (void *)v11;
    v32 = (void *)v10;
    v30 = (void *)v12;
    if (v17)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v20 = v18;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v34 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(v7, "decodeObjectOfClass:from:", objc_opt_class(), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "if_addObjectIfNonNil:", v26);

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v23);
    }

    if (v32)
    {
      v28 = v30;
      v27 = v31;
      v19 = -[INDeferredLocalizedString initWithDeferredFormat:fromTable:bundleIdentifier:bundleURL:arguments:]([INDeferredLocalizedString alloc], "initWithDeferredFormat:fromTable:bundleIdentifier:bundleURL:arguments:", v32, v31, v30, v15, v16);
    }
    else
    {
      v19 = 0;
      v28 = v30;
      v27 = v31;
    }

  }
  else
  {

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v19 = (INDeferredLocalizedString *)v9;
    else
      v19 = 0;
  }

  return v19;
}

@end
