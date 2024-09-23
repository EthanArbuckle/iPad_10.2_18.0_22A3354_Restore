@implementation INIntent(IntentUtilities)

- (id)atx_nonNilParameters
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = (objc_class *)MEMORY[0x24BDBCEF0];
    v3 = a1;
    v4 = objc_alloc_init(v2);
    objc_msgSend(v3, "serializedParameters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__INIntent_IntentUtilities__atx_nonNilParameters__block_invoke;
    v8[3] = &unk_250A2CF20;
    v6 = v4;
    v9 = v6;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v8);

    return v6;
  }
  else
  {
    objc_msgSend(a1, "_nonNilParameters");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)atx_parameterValueForKey:()IntentUtilities
{
  id v4;
  char isKindOfClass;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v4 && (isKindOfClass & 1) != 0)
  {
    v6 = a1;
    objc_msgSend(v6, "appIntentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("SettingsNavigationEventDonationIntent")))
    {
      v8 = objc_msgSend(v4, "isEqualToString:", CFSTR("target"));

      if (v8)
      {
        objc_msgSend(v6, "serializedParameters");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "valueForKeyPath:", CFSTR("target.value.properties"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_pas_filteredArrayWithTest:", &__block_literal_global_0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "valueForKeyPath:", CFSTR("value.value"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
        goto LABEL_10;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "serializedParameters");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(a1, "valueForKey:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:

  return v13;
}

- (id)atx_nonNilParametersByName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
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

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "atx_nonNilParameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(a1, "atx_parameterValueForKey:", v10, (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  v12 = (void *)objc_msgSend(v4, "copy");
  return v12;
}

- (id)atx_hashApproximately
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unsigned __int8 md[32];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x23B836ABC]();
  v3 = (void *)objc_opt_new();
  v4 = (void *)MEMORY[0x23B836ABC]();
  objc_msgSend(a1, "_className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataUsingEncoding:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendData:", v6);

  objc_autoreleasePoolPop(v4);
  objc_msgSend(a1, "atx_nonNilParametersByName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v7, "allKeys", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compare_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x23B836ABC]();
        objc_msgSend(v14, "dataUsingEncoding:", 4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendData:", v16);

        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        hashIt(v17, v3);

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

  v18 = objc_retainAutorelease(v3);
  CC_SHA256((const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), md);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE50]), "initWithBytes:length:", md, 8);

  objc_autoreleasePoolPop(v2);
  return v19;
}

- (uint64_t)atx_backingStoreDataHash
{
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  memset(v6, 0, sizeof(v6));
  objc_msgSend(a1, "backingStore");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "data");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = objc_retainAutorelease(v2);
  CC_SHA256((const void *)objc_msgSend(v3, "bytes"), objc_msgSend(v3, "length"), (unsigned __int8 *)v6);
  v4 = LODWORD(v6[0]);

  return v4;
}

- (BOOL)atx_isEqualToIntent:()IntentUtilities
{
  return a3
      && +[ATXIntentComparator intent:isEqualToIntent:](ATXIntentComparator, "intent:isEqualToIntent:", a1, a3);
}

@end
