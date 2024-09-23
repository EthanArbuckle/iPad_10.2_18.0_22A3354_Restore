@implementation NSDictionary(ADCoreExtensions)

- (id)AD_dictionaryForJSON
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v7);
        objc_msgSend(v3, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "stringValue");
          v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_opt_class();
          v11 = CFSTR("UNKNOWN_KEY");
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_11;
          v10 = v8;
        }
        v11 = v10;
LABEL_11:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "AD_dictionaryForJSON");
          v12 = objc_claimAutoreleasedReturnValue();
LABEL_19:
          v13 = (void *)v12;
          objc_msgSend(v2, "setObject:forKey:", v12, v11);
LABEL_20:

          goto LABEL_21;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "AD_arrayForJSON");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "AD_dataStringForJSON");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "absoluteString");
          v12 = objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_26;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v9, "dictionaryRepresentation");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "AD_dictionaryForJSON");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "setObject:forKey:", v15, v11);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: Unable to serialize the following object into JSON. Please file a radar against SearchAds Framework.\n%@ (%@)"), v9, objc_opt_class());
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            _ADLog(CFSTR("ToroLogging"), v13, 0);
          }
          goto LABEL_20;
        }
        objc_msgSend(v9, "doubleValue");
        if (fabs(v14) == INFINITY)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to serialize the following number into JSON. Please file a radar against SearchAds | iOS: %@ (%@). Self: %@"), v9, objc_opt_class(), v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setObject:forKey:", CFSTR("∞"), v11);
          if (v13)
          {
            ADSimulateCrash(3501905313, v13, 0);
            goto LABEL_20;
          }
        }
        else
        {
LABEL_26:
          objc_msgSend(v2, "setObject:forKey:", v9, v11);
        }
LABEL_21:

        ++v7;
      }
      while (v5 != v7);
      v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      v5 = v16;
    }
    while (v16);
  }

  return v2;
}

- (uint64_t)AD_jsonString
{
  return objc_msgSend(a1, "AD_jsonStringWithPrettyPrint:", 1);
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
  objc_msgSend(a1, "AD_dictionaryForJSON");
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
    objc_msgSend(a1, "AD_dictionaryForJSON");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("There was an error serializing the following dictionary into JSON (%@):\n%@"), v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _ADLog(CFSTR("ToroLogging"), v12, 0);

  }
  if (v7)
    v13 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v7, 4);
  else
    v13 = CFSTR("{}");

  return v13;
}

- (id)AD_objectForKey:()ADCoreExtensions ofKindOfClass:
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (BOOL)AD_hasObjectForKey:()ADCoreExtensions ofKindOfClass:
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "AD_objectForKey:ofKindOfClass:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

@end
