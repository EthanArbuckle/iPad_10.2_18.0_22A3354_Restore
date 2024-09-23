@implementation AXTeachableMomentsManager

+ (id)sharedManager
{
  if (sharedManager_onceToken_2 != -1)
    dispatch_once(&sharedManager_onceToken_2, &__block_literal_global_26);
  return (id)sharedManager_Manager_0;
}

void __42__AXTeachableMomentsManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_Manager_0;
  sharedManager_Manager_0 = v0;

}

+ (id)_systemBuildVersion
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "operatingSystemVersion");
    v6 = v16;
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v3, "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "operatingSystemVersion");
    v11 = v15;
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v8, "numberWithInteger:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@.%@"), v7, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_teachableItemsForFeature:(id)a3
{
  id v4;
  NSDictionary *data;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = a3;
  data = self->_data;
  if (!data)
  {
    v6 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend((id)objc_opt_class(), "_systemBuildVersion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("TeachableMoments-%@-%@"), v9, CFSTR("iOS"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "URLForResource:withExtension:", v10, CFSTR("plist"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dictionaryWithContentsOfURL:", v11);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = self->_data;
    self->_data = v12;

    data = self->_data;
  }
  -[NSDictionary objectForKey:](data, "objectForKey:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "objectForKey:", CFSTR("items"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[AXTeachableMomentsManager _teachableItemsFromItems:feature:](self, "_teachableItemsFromItems:feature:", v17, v4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)summaryForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(a1, "_systemBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_SUMMARY_%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)_nameForFeature:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_FEATURE_TITLE"), a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)notificationTitleForFeature:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(a1, "_systemBuildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("WhatsNew_%@_%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AXLocStringKeyForModel(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_teachableItemsFromItems:(id)a3 feature:(id)a4
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id obj;
  void *v23;
  id v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  objc_msgSend((id)objc_opt_class(), "_systemBuildVersion");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (id)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v28)
  {
    v27 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_opt_class();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("supportedPlatforms"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_19;
        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (!v11)
          goto LABEL_20;
        v12 = v11;
        v26 = v7;
        v13 = 0;
        v14 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v12; ++j)
          {
            if (*(_QWORD *)v30 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("ipad")))
              v13 |= AXDeviceIsPad();
            if (objc_msgSend(v16, "isEqualToString:", CFSTR("iphone")))
              v13 |= AXDeviceIsPhone();
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        }
        while (v12);

        v7 = v26;
        if ((v13 & 1) != 0)
        {
LABEL_19:
          v10 = (id)objc_opt_new();
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("title"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          LocalizedItemString(v17, (uint64_t)v23);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setItemTitle:", v18);

          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("description"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          LocalizedItemString(v19, (uint64_t)v23);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setItemDescription:", v20);

          objc_msgSend(v10, "setVersion:", v23);
          objc_msgSend(v10, "setFeature:", v25);
          objc_msgSend(v24, "addObject:", v10);
LABEL_20:

        }
      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v28);
  }

  return v24;
}

+ (BOOL)teachableMomentSeenForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "teachableMomentsNotificationsSeen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "_systemBuildVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "compare:options:", v7, 64) != -1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)markTeachableMomentSeenForNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "teachableMomentsNotificationsSeen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v6, "mutableCopy");

  if (!v9)
    v9 = (id)objc_opt_new();
  objc_msgSend(a1, "_systemBuildVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, v4);

  +[AXSettings sharedInstance](AXSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTeachableMomentsNotificationsSeen:", v9);

}

+ (id)teachableItemsForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_teachableItemsForFeature:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end
