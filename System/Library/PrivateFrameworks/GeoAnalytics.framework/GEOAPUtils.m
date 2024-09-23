@implementation GEOAPUtils

+ (id)GEOAPApplicationIdentifier
{
  if (GEOAPOverrideApplicationId)
    return (id)GEOAPOverrideApplicationId;
  GEOApplicationIdentifierOrProcessName();
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int)functionalAppGroup
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__GEOAPUtils_functionalAppGroup__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_254316C40 != -1)
    dispatch_once(&qword_254316C40, block);
  return _MergedGlobals_10;
}

void __32__GEOAPUtils_functionalAppGroup__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  unint64_t v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "GEOAPApplicationIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  GEOConfigGetArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v33;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v33 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v7), "lowercaseString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", v2);

        if (v9)
        {
          v22 = 0x254316000;
          v23 = 1;
LABEL_29:
          *(_DWORD *)(v22 + 3128) = v23;

          goto LABEL_30;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
      if (v5)
        continue;
      break;
    }
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  GEOConfigGetArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v29;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v13), "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v2);

        if (v15)
        {
          v22 = 0x254316000;
          v23 = 2;
          goto LABEL_29;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
      if (v11)
        continue;
      break;
    }
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  GEOConfigGetArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    while (2)
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "lowercaseString", (_QWORD)v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "isEqualToString:", v2);

        if (v21)
        {
          v22 = 0x254316000uLL;
          v23 = 3;
          goto LABEL_29;
        }
        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      if (v17)
        continue;
      break;
    }
  }

  _MergedGlobals_10 = 0;
LABEL_30:

}

+ (id)firstPartySet
{
  if (qword_254316C50 != -1)
    dispatch_once(&qword_254316C50, &__block_literal_global_9);
  return (id)qword_254316C48;
}

void __27__GEOAPUtils_firstPartySet__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_250DE00D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_254316C48;
  qword_254316C48 = v0;

}

+ (id)daemonIdAdditions
{
  return (id)GEOConfigGetArray();
}

+ (id)daemonSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__GEOAPUtils_daemonSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_254316C60 != -1)
    dispatch_once(&qword_254316C60, block);
  return (id)qword_254316C58;
}

void __23__GEOAPUtils_daemonSet__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  objc_msgSend(v0, "addObjectsFromArray:", &unk_250DE00F0);
  objc_msgSend((id)objc_opt_class(), "daemonIdAdditions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v11 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length"))
        {
          objc_msgSend(v6, "lowercaseString");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v0, "addObject:", v7);

        }
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v3);
  }
  v8 = objc_msgSend(v0, "copy");
  v9 = (void *)qword_254316C58;
  qword_254316C58 = v8;

}

+ (int)myAppType
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__GEOAPUtils_myAppType__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_254316C68 != -1)
    dispatch_once(&qword_254316C68, block);
  return dword_254316C3C;
}

void __23__GEOAPUtils_myAppType__block_invoke()
{
  void *v0;
  id v1;

  v0 = (void *)objc_opt_class();
  GEOApplicationIdentifierOrProcessName();
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appTypeForAppId:resultBlock:", v1, &__block_literal_global_45);

}

void __23__GEOAPUtils_myAppType__block_invoke_2(uint64_t a1, int a2)
{
  dword_254316C3C = a2;
}

+ (void)appTypeForAppId:(id)a3 resultBlock:(id)a4
{
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  int v16;
  id v17;

  v17 = a3;
  v5 = (void (**)(id, uint64_t, _QWORD))a4;
  if (!objc_msgSend(v17, "isEqualToString:", *MEMORY[0x24BE3CB30]))
  {
    objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") >= 3)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com")) & 1) != 0)
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("apple"));

        if (v9)
        {
          objc_msgSend(v6, "lastObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lowercaseString");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend((id)objc_opt_class(), "firstPartySet");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "containsObject:", v11);

          if ((v13 & 1) != 0)
          {
            v14 = 0;
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "daemonSet");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "containsObject:", v11);

            if (v16)
              v14 = 3;
            else
              v14 = 1;
          }

          goto LABEL_12;
        }
      }
      else
      {

      }
    }
    if (objc_msgSend(v6, "count") == 1)
      v14 = 3;
    else
      v14 = 2;
LABEL_12:
    v5[2](v5, v14, 0);

    goto LABEL_13;
  }
  v5[2](v5, 0, 1);
LABEL_13:

}

+ (id)GEOAPCachePath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "GEOAPApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)dailyAggregationTimestampFromDate:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v3 = (objc_class *)MEMORY[0x24BDBCE48];
  v4 = a3;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  objc_msgSend(v6, "components:fromDate:", 60, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setHour:", objc_msgSend(v7, "hour") - 4);
  objc_msgSend(v6, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 28, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateFromComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x24BDD15D0]);
  objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTimeZone:", v12);

  objc_msgSend(v11, "setFormatOptions:", 883);
  objc_msgSend(v11, "stringFromDate:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)currentDailyAggregationTimestamp
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE3D008], "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bestReferenceDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "dailyAggregationTimestampFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
