@implementation ATXDemoStackAndWidgetProvider

+ (BOOL)isDemoModeEnabled
{
  int v2;
  void *v3;
  char v4;

  v2 = objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.AppPredictionExpert"));
    v4 = objc_msgSend(v3, "BOOLForKey:", CFSTR("ATXWidgetsDemoModeEnabled"));

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (void)startYourEngines
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0D10170]);
  v3 = (void *)sDescriptorProvider;
  sDescriptorProvider = (uint64_t)v2;

}

+ (id)demoStackAndWidgets
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[10];
  _QWORD v42[10];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
    return 0;
  v30 = a1;
  v3 = objc_alloc(MEMORY[0x1E0C99E08]);
  objc_msgSend((id)sDescriptorProvider, "descriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v3, "initWithCapacity:", objc_msgSend(v4, "count"));

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend((id)sDescriptorProvider, "descriptors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v37 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v10, "extensionBundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "kind");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithFormat:", CFSTR("%@-%@"), v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "setObject:forKeyedSubscript:", v10, v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    }
    while (v7);
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.AppPredictionExpert"));
  v41[0] = CFSTR("ATXWidgetsDemoNumberOfWidgetsInStack");
  v41[1] = CFSTR("ATXWidgetsDemoStackWidget1");
  v42[0] = &unk_1E4DC14B8;
  v42[1] = &unk_1E4DC2E18;
  v41[2] = CFSTR("ATXWidgetsDemoStackWidget2");
  v41[3] = CFSTR("ATXWidgetsDemoStackWidget3");
  v42[2] = &unk_1E4DC2E40;
  v42[3] = &unk_1E4DC2E68;
  v41[4] = CFSTR("ATXWidgetsDemoStackWidget4");
  v41[5] = CFSTR("ATXWidgetsDemoNumberOfWidgetsInGallery");
  v42[4] = &unk_1E4DC2E90;
  v42[5] = &unk_1E4DC14B8;
  v41[6] = CFSTR("ATXWidgetsDemoGalleryWidget1");
  v41[7] = CFSTR("ATXWidgetsDemoGalleryWidget2");
  v42[6] = &unk_1E4DC2E40;
  v42[7] = &unk_1E4DC2E90;
  v41[8] = CFSTR("ATXWidgetsDemoGalleryWidget3");
  v41[9] = CFSTR("ATXWidgetsDemoGalleryWidget4");
  v42[8] = &unk_1E4DC2E68;
  v42[9] = &unk_1E4DC2E18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "registerDefaults:", v16);

  objc_msgSend(v30, "_widgetArrayForPrefixKey:countKey:defaults:descriptors:", CFSTR("ATXWidgetsDemoStackWidget"), CFSTR("ATXWidgetsDemoNumberOfWidgetsInStack"), v15, v31);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "_widgetArrayForPrefixKey:countKey:defaults:descriptors:", CFSTR("ATXWidgetsDemoGalleryWidget"), CFSTR("ATXWidgetsDemoNumberOfWidgetsInGallery"), v15, v31);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_opt_new();
  if (+[ATXDemoStackAndWidgetProvider _shouldShowStackInGallery](ATXDemoStackAndWidgetProvider, "_shouldShowStackInGallery"))
  {
    v20 = (void *)objc_opt_new();
    v21 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v20, "setSmallDefaultStack:", v21);

    v22 = (void *)objc_msgSend(v17, "copy");
    objc_msgSend(v20, "setMediumDefaultStack:", v22);

    objc_msgSend(v20, "setSuggestedSize:", 1);
    objc_msgSend(v19, "addObject:", v20);

  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v23 = v18;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v33;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v33 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v19, "addObject:", *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * j));
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v25);
  }

  v28 = (void *)objc_msgSend(v19, "copy");
  return v28;
}

+ (id)_widgetArrayForPrefixKey:(id)a3 countKey:(id)a4 defaults:(id)a5 descriptors:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v18;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_msgSend(v10, "integerForKey:", a4);
  v18 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v12);
  if (v12 >= 1)
  {
    v13 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%ld"), v9, ++v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dictionaryForKey:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        objc_msgSend(a1, "_widgetFromDictionary:descriptors:", v15, v11);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v18, "addObject:", v16);

      }
    }
    while (v12 != v13);
  }

  return v18;
}

+ (id)_widgetFromDictionary:(id)a3 descriptors:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  const __CFString *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(v5, "objectForKey:", CFSTR("extensionBundleId"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E4D5DB30;
  objc_msgSend(v5, "objectForKey:", CFSTR("kind"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = &stru_1E4D5DB30;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@-%@"), v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setAvocadoDescriptor:", v15);
    objc_msgSend(v5, "objectForKey:", CFSTR("appBundleId"));
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
      v19 = (const __CFString *)v17;
    else
      v19 = &stru_1E4D5DB30;
    objc_msgSend(v16, "setAppBundleId:", v19);

    v20 = 1;
    objc_msgSend(v16, "setRankType:", 1);
    objc_msgSend(v5, "objectForKey:", CFSTR("size"));
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    if (v21)
      v23 = (__CFString *)v21;
    else
      v23 = &stru_1E4D5DB30;
    v24 = v23;

    if ((-[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("medium")) & 1) == 0)
    {
      if ((-[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("large")) & 1) != 0)
      {
        v20 = 2;
      }
      else if (-[__CFString isEqualToString:](v24, "isEqualToString:", CFSTR("extraLarge")))
      {
        v20 = 4;
      }
      else
      {
        v20 = 0;
      }
    }
    objc_msgSend(v16, "setSuggestedSize:", v20);

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (BOOL)_shouldShowStackInGallery
{
  void *v2;
  char v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.DuetExpertCenter.AppPredictionExpert"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ATXWidgetsDemoShouldShowStackInGallery"));

  return v3;
}

@end
