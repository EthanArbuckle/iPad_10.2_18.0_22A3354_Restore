@implementation INExecutionInfoResolver

- (id)resolveIntentExecutionInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[INExecutionInfoResolver _resolveIntentExecutionInfoBySwappingIdentifiers:](self, "_resolveIntentExecutionInfoBySwappingIdentifiers:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

  -[INExecutionInfoResolver _resolveIntentExecutionInfoByLinkingExtensionToApp:](self, "_resolveIntentExecutionInfoByLinkingExtensionToApp:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v8;
  v12 = v11;

  -[INExecutionInfoResolver _resolveIntentExecutionInfoUsingCounterparts:](self, "_resolveIntentExecutionInfoUsingCounterparts:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v12;
  v16 = v15;

  return v16;
}

- (id)resolveUserActivityExecutionInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  -[INExecutionInfoResolver _resolveUserActivityExecutionInfoBySwappingIdentifiers:](self, "_resolveUserActivityExecutionInfoBySwappingIdentifiers:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

  -[INExecutionInfoResolver _resolveUserActivityExecutionInfoByLinkingFileProvidersToFilesApp:](self, "_resolveUserActivityExecutionInfoByLinkingFileProvidersToFilesApp:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v8;
  v12 = v11;

  -[INExecutionInfoResolver _resolveUserActivityExecutionInfoUsingCounterparts:](self, "_resolveUserActivityExecutionInfoUsingCounterparts:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  if (v13)
    v15 = (void *)v13;
  else
    v15 = v12;
  v16 = v15;

  return v16;
}

- (id)localIdentifiersForCounterpartIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[INExecutionInfoResolver _counterpartMapper](self, "_counterpartMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localIdentifiersForCounterpartIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)counterpartIdentifiersForLocalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[INExecutionInfoResolver _counterpartMapper](self, "_counterpartMapper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "counterpartIdentifiersForLocalIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_resolveExecutionInfo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[INExecutionInfoResolver _resolveExecutionInfoBySwappingIdentifiers:](self, "_resolveExecutionInfoBySwappingIdentifiers:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (void *)v5;
  else
    v7 = v4;
  v8 = v7;

  -[INExecutionInfoResolver _resolveExecutionInfoByLinkingExtensionToApp:](self, "_resolveExecutionInfoByLinkingExtensionToApp:", v8);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (void *)v9;
  else
    v11 = v8;
  v12 = v11;

  return v12;
}

- (id)_resolveExecutionInfoBySwappingIdentifiers:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;
  INExecutionInfo *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  objc_msgSend(a3, "launchableAppBundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (INThisProcessCanMapLSDatabase(0))
    {
      v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v3, 0);
      if (v4)
      {
LABEL_4:
        objc_msgSend(v4, "containingBundleRecord");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v6 = v5;
          else
            v6 = 0;
        }
        else
        {
          v6 = 0;
        }
        v13 = v6;

        v14 = [INExecutionInfo alloc];
        objc_msgSend(v13, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "bundleIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "URL");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "bundleIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[INExecutionInfo _initWithLaunchableAppBundleId:displayableAppBundleId:containingAppBundleURL:extensionBundleId:](v14, "_initWithLaunchableAppBundleId:displayableAppBundleId:containingAppBundleURL:extensionBundleId:", v15, v16, v17, v18);

        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v3, "isEqualToString:", v9);

      if (v10)
      {
        v11 = v8;
        if (v11)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v4 = v12;

      }
      else
      {
        v4 = 0;
      }

      if (v4)
        goto LABEL_4;
    }
    v7 = 0;
LABEL_21:

    goto LABEL_22;
  }
  v7 = 0;
LABEL_22:

  return v7;
}

- (id)_resolveExecutionInfoByLinkingExtensionToApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  INExecutionInfo *v10;
  void *v11;
  id v12;

  v4 = a3;
  objc_msgSend(v4, "extensionBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[INExecutionInfoResolver _frameworkMapper](self, "_frameworkMapper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "launchableAppBundleIdentifierForSystemExtensionBundleIdentifier:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    -[INExecutionInfoResolver _frameworkMapper](self, "_frameworkMapper");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "displayableAppBundleIdentifierForSystemExtensionBundleIdentifier:", v5);
    v9 = objc_claimAutoreleasedReturnValue();

    if (v9 | v7)
    {
      v10 = [INExecutionInfo alloc];
      objc_msgSend(v4, "containingAppBundleURL");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[INExecutionInfo _initWithLaunchableAppBundleId:displayableAppBundleId:containingAppBundleURL:extensionBundleId:](v10, "_initWithLaunchableAppBundleId:displayableAppBundleId:containingAppBundleURL:extensionBundleId:", v7, v9, v11, v5);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_resolveIntentExecutionInfoBySwappingIdentifiers:(id)a3
{
  id v4;
  void *v5;
  INIntentExecutionInfo *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[INExecutionInfoResolver _resolveExecutionInfoBySwappingIdentifiers:](self, "_resolveExecutionInfoBySwappingIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [INIntentExecutionInfo alloc];
    objc_msgSend(v4, "intentClassName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "preferredCallProvider");
    objc_msgSend(v5, "launchableAppBundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayableAppBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiExtensionBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containingAppBundleURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[INIntentExecutionInfo _initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:](v6, "_initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:", v7, v8, v9, v10, v11, v12, v13);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_resolveIntentExecutionInfoByLinkingExtensionToApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  INIntentExecutionInfo *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[INExecutionInfoResolver _resolveExecutionInfoByLinkingExtensionToApp:](self, "_resolveExecutionInfoByLinkingExtensionToApp:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "displayableAppBundleId");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "preferredCallProvider") == 2)
    {

      v7 = CFSTR("com.apple.facetime");
    }
    v8 = [INIntentExecutionInfo alloc];
    objc_msgSend(v4, "intentClassName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "preferredCallProvider");
    objc_msgSend(v6, "launchableAppBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "extensionBundleId");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiExtensionBundleId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "containingAppBundleURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[INIntentExecutionInfo _initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:](v8, "_initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:", v9, v10, v11, v7, v12, v13, v14);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_resolveIntentExecutionInfoUsingCounterparts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  INExecutionInfoResolver *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  uint64_t v38;
  INIntentExecutionInfo *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "launchableAppBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "intentClassName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INExecutionInfoResolver localIdentifiersForCounterpartIdentifier:](self, "localIdentifiersForCounterpartIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __72__INExecutionInfoResolver__resolveIntentExecutionInfoUsingCounterparts___block_invoke;
  v43[3] = &unk_1E228BEA8;
  v8 = v4;
  v44 = v8;
  v9 = v6;
  v45 = v9;
  objc_msgSend(v7, "if_compactMap:", v43);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v10, "count") < 2)
  {
    objc_msgSend(v10, "anyObject");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global_28740);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      objc_msgSend((id)v13, "bundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v47 = "-[INExecutionInfoResolver _resolveIntentExecutionInfoUsingCounterparts:]";
      v48 = 2114;
      v49 = v5;
      v50 = 2114;
      v51 = (uint64_t)v16;
      _os_log_error_impl(&dword_18BEBC000, v15, OS_LOG_TYPE_ERROR, "%s Matched multiple launchable counterpart applications for %{public}@, choosing %{public}@", buf, 0x20u);

    }
  }
  objc_msgSend(v8, "displayableAppBundleId");
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = self;
  v19 = (void *)v17;
  -[INExecutionInfoResolver localIdentifiersForCounterpartIdentifier:](v18, "localIdentifiersForCounterpartIdentifier:", v17);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v20;
  if ((unint64_t)objc_msgSend(v20, "count") < 2)
  {
    objc_msgSend(v20, "anyObject");
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = v13;
    v22 = v10;
    objc_msgSend(v20, "allObjects");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sortedArrayUsingSelector:", sel_compare_);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = objc_claimAutoreleasedReturnValue();

    v26 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v47 = "-[INExecutionInfoResolver _resolveIntentExecutionInfoUsingCounterparts:]";
      v48 = 2114;
      v49 = v19;
      v50 = 2114;
      v51 = v25;
      _os_log_error_impl(&dword_18BEBC000, v26, OS_LOG_TYPE_ERROR, "%s Matched multiple displayable counterpart applications for %{public}@, choosing %{public}@", buf, 0x20u);
    }
    v10 = v22;
    v13 = v21;
  }
  if (v13 | v25)
  {
    v39 = [INIntentExecutionInfo alloc];
    v38 = objc_msgSend(v8, "preferredCallProvider");
    objc_msgSend((id)v13, "bundleIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionBundleId");
    v27 = v9;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uiExtensionBundleId");
    v41 = v5;
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v13, "URL");
    v40 = v19;
    v30 = v13;
    v31 = v10;
    v32 = v8;
    v33 = v7;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[INIntentExecutionInfo _initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:](v39, "_initWithIntentClassName:preferredCallProvider:launchableAppBundleId:displayableAppBundleId:extensionBundleId:uiExtensionBundleId:containingAppBundleURL:", v27, v38, v37, v25, v28, v29, v34);

    v7 = v33;
    v8 = v32;
    v10 = v31;
    v13 = v30;
    v19 = v40;

    v5 = v41;
    v9 = v27;

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

- (id)_resolveUserActivityExecutionInfoBySwappingIdentifiers:(id)a3
{
  id v4;
  void *v5;
  INUserActivityExecutionInfo *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  -[INExecutionInfoResolver _resolveExecutionInfoBySwappingIdentifiers:](self, "_resolveExecutionInfoBySwappingIdentifiers:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [INUserActivityExecutionInfo alloc];
    objc_msgSend(v4, "userActivityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "launchableAppBundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "containingAppBundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionBundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[INUserActivityExecutionInfo _initWithUserActivityType:launchableAppBundleId:containingAppBundleURL:extensionBundleId:](v6, "_initWithUserActivityType:launchableAppBundleId:containingAppBundleURL:extensionBundleId:", v7, v8, v9, v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_resolveUserActivityExecutionInfoByLinkingFileProvidersToFilesApp:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  INUserActivityExecutionInfo *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a3;
  objc_msgSend(v3, "extensionBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5848]), "initWithBundleIdentifier:error:", v4, 0);
    objc_msgSend(v5, "extensionPointRecord");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.fileprovider-nonui"));

    v9 = 0;
    if (v8)
    {
      v10 = [INUserActivityExecutionInfo alloc];
      objc_msgSend(v3, "userActivityType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "containingAppBundleURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "extensionBundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[INUserActivityExecutionInfo _initWithUserActivityType:launchableAppBundleId:containingAppBundleURL:extensionBundleId:](v10, "_initWithUserActivityType:launchableAppBundleId:containingAppBundleURL:extensionBundleId:", v11, CFSTR("com.apple.DocumentsApp"), v12, v13);

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_resolveUserActivityExecutionInfoUsingCounterparts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  INUserActivityExecutionInfo *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "launchableAppBundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userActivityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INExecutionInfoResolver localIdentifiersForCounterpartIdentifier:](self, "localIdentifiersForCounterpartIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __78__INExecutionInfoResolver__resolveUserActivityExecutionInfoUsingCounterparts___block_invoke;
  v22[3] = &unk_1E228BF10;
  v8 = v6;
  v23 = v8;
  objc_msgSend(v7, "if_compactMap:", v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v9, "count") < 2)
  {
    objc_msgSend(v9, "anyObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sortedArrayUsingComparator:", &__block_literal_global_12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = (void *)INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v14 = v13;
      objc_msgSend(v12, "bundleIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v25 = "-[INExecutionInfoResolver _resolveUserActivityExecutionInfoUsingCounterparts:]";
      v26 = 2114;
      v27 = v5;
      v28 = 2114;
      v29 = v15;
      _os_log_error_impl(&dword_18BEBC000, v14, OS_LOG_TYPE_ERROR, "%s Matched multiple counterpart applications for %{public}@, choosing %{public}@", buf, 0x20u);

    }
  }
  if (v12)
  {
    v16 = [INUserActivityExecutionInfo alloc];
    objc_msgSend(v12, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "URL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "extensionBundleId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[INUserActivityExecutionInfo _initWithUserActivityType:launchableAppBundleId:containingAppBundleURL:extensionBundleId:](v16, "_initWithUserActivityType:launchableAppBundleId:containingAppBundleURL:extensionBundleId:", v8, v17, v18, v19);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (INExecutionCounterpartMapper)_counterpartMapper
{
  INExecutionCounterpartMapper *counterpartMapper;
  INExecutionCounterpartMapper *v4;
  INExecutionCounterpartMapper *v5;

  counterpartMapper = self->_counterpartMapper;
  if (!counterpartMapper)
  {
    v4 = objc_alloc_init(INExecutionCounterpartMapper);
    v5 = self->_counterpartMapper;
    self->_counterpartMapper = v4;

    counterpartMapper = self->_counterpartMapper;
  }
  return counterpartMapper;
}

- (INExecutionFrameworkMapper)_frameworkMapper
{
  INExecutionFrameworkMapper *frameworkMapper;
  INExecutionFrameworkMapper *v4;
  INExecutionFrameworkMapper *v5;

  frameworkMapper = self->_frameworkMapper;
  if (!frameworkMapper)
  {
    v4 = objc_alloc_init(INExecutionFrameworkMapper);
    v5 = self->_frameworkMapper;
    self->_frameworkMapper = v4;

    frameworkMapper = self->_frameworkMapper;
  }
  return frameworkMapper;
}

- (NSDictionary)_counterpartMapping
{
  return self->__counterpartMapping;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__counterpartMapping, 0);
  objc_storeStrong((id *)&self->_frameworkMapper, 0);
  objc_storeStrong((id *)&self->_counterpartMapper, 0);
}

id __78__INExecutionInfoResolver__resolveUserActivityExecutionInfoUsingCounterparts___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CA5870];
  v4 = a2;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0);

  objc_msgSend(v5, "applicationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isInstalled");

  v8 = 0;
  if (v7)
  {
    objc_msgSend(v5, "if_userActivityTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "containsObject:", *(_QWORD *)(a1 + 32)))
      v10 = v5;
    else
      v10 = 0;
    v8 = v10;

  }
  return v8;
}

uint64_t __78__INExecutionInfoResolver__resolveUserActivityExecutionInfoUsingCounterparts___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "localizedNameWithContext:", &stru_1E2295770);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedNameWithContext:", &stru_1E2295770);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

id __72__INExecutionInfoResolver__resolveIntentExecutionInfoUsingCounterparts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
  objc_msgSend(v4, "applicationState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInstalled");

  v7 = 0;
  if (v6)
  {
    +[INAppInfo appInfoWithApplicationRecord:](INAppInfo, "appInfoWithApplicationRecord:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "supportedActionsByExtensions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 32), "extensionBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0CA5848]);
      objc_msgSend(*(id *)(a1 + 32), "extensionBundleId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      v14 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:error:", v13, &v22);
      v15 = v22;

      if (v14)
      {
        objc_msgSend(v14, "if_extensionAttributesDictionary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("IntentsSupported"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "addObjectsFromArray:", v17);
      }
      else
      {
        v18 = INSiriLogContextIntents;
        if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v24 = "-[INExecutionInfoResolver _resolveIntentExecutionInfoUsingCounterparts:]_block_invoke";
          v25 = 2114;
          v26 = v15;
          _os_log_error_impl(&dword_18BEBC000, v18, OS_LOG_TYPE_ERROR, "%s Failed to create application extension record: %{public}@", buf, 0x16u);
        }
      }

    }
    if (v10)
    {
      if (objc_msgSend(v10, "containsObject:", *(_QWORD *)(a1 + 40)))
        v19 = v4;
      else
        v19 = 0;
      v7 = v19;
    }
    else
    {
      v20 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "-[INExecutionInfoResolver _resolveIntentExecutionInfoUsingCounterparts:]_block_invoke";
        v25 = 2114;
        v26 = v3;
        v27 = 2114;
        v28 = 0;
        _os_log_error_impl(&dword_18BEBC000, v20, OS_LOG_TYPE_ERROR, "%s Failed to get the supported intents for %{public}@: %{public}@", buf, 0x20u);
      }
      v7 = 0;
    }

  }
  return v7;
}

uint64_t __72__INExecutionInfoResolver__resolveIntentExecutionInfoUsingCounterparts___block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

+ (id)defaultResolver
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__INExecutionInfoResolver_defaultResolver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (defaultResolver_onceToken != -1)
    dispatch_once(&defaultResolver_onceToken, block);
  return (id)defaultResolver_resolver;
}

void __42__INExecutionInfoResolver_defaultResolver__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)defaultResolver_resolver;
  defaultResolver_resolver = (uint64_t)v0;

}

@end
