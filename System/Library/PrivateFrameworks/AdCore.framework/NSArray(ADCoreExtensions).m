@implementation NSArray(ADCoreExtensions)

- (id)AD_arrayForJSON
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v4)
  {
    v6 = 0;
    goto LABEL_28;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v18;
  do
  {
    v8 = 0;
    do
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v3);
      v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v8);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "AD_arrayForJSON");
        v10 = objc_claimAutoreleasedReturnValue();
LABEL_14:
        v11 = (void *)v10;
        objc_msgSend(v2, "addObject:", v10);

        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "AD_dictionaryForJSON");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "AD_dataStringForJSON");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "absoluteString");
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_14;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_22:
        objc_msgSend(v2, "addObject:", v9);
        goto LABEL_15;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "doubleValue");
        if (fabs(v12) != INFINITY)
          goto LABEL_22;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to serialize the following number into JSON. Please file a radar against SearchAds | iOS: %@ (%@). Self: %@"), v9, objc_opt_class(), v3);
        v14 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v2, "addObject:", CFSTR("∞"));
        v6 = (void *)v14;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Unable to serialize the following object into JSON. Please file a radar against SearchAds Framework.\n%@ (%@)"), v9, objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _ADLog(CFSTR("ToroLogging"), v13, 0);

      }
LABEL_15:
      if (v6)
        ADSimulateCrash(2696598945, v6, 0);
      ++v8;
    }
    while (v5 != v8);
    v15 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    v5 = v15;
  }
  while (v15);
LABEL_28:

  return v2;
}

- (__CFString)AD_jsonStringWithPrettyPrint:()ADCoreExtensions
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  id v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB36D8];
  objc_msgSend(a1, "AD_arrayForJSON");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "dataWithJSONObject:options:error:", v6, v4, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v8, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "AD_arrayForJSON");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("There was an error serializing the following array into JSON (%@):\n%@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v12, 0);

  }
  if (v7)
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
  else
    v13 = CFSTR("[]");

  return v13;
}

- (uint64_t)AD_jsonString
{
  return objc_msgSend(a1, "AD_jsonStringWithPrettyPrint:", 1);
}

@end
