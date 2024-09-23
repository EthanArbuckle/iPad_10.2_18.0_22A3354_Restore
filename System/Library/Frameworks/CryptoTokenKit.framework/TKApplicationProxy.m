@implementation TKApplicationProxy

- (id)displayNameForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    +[TKApplicationProxy _displayNamesCache](TKApplicationProxy, "_displayNamesCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[TKApplicationProxy _coreServicesLocalizedNameForBundleID:](self, "_coreServicesLocalizedNameForBundleID:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[TKApplicationProxy _displayNamesCache](TKApplicationProxy, "_displayNamesCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v6, v4);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_coreServicesLocalizedNameForBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v17;

  v3 = a3;
  v17 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v17);
  v5 = v17;
  if (!v4)
  {
    if (TK_LOG_appproxy_once != -1)
      dispatch_once(&TK_LOG_appproxy_once, &__block_literal_global_6);
    v11 = TK_LOG_appproxy_log;
    if (os_log_type_enabled((os_log_t)TK_LOG_appproxy_log, OS_LOG_TYPE_ERROR))
      -[TKApplicationProxy _coreServicesLocalizedNameForBundleID:].cold.1((uint64_t)v3, (uint64_t)v5, v11);
    v12 = v3;
    goto LABEL_11;
  }
  objc_msgSend(v4, "applicationState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValid");

  if (!v7)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v10 = v12;
    goto LABEL_17;
  }
  objc_msgSend(v4, "localizedName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v4, "localizedShortName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v4, "bundleIdentifier");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v15;

  }
LABEL_17:

  return v10;
}

+ (id)_displayNamesCache
{
  if (_displayNamesCache_oncePredicate != -1)
    dispatch_once(&_displayNamesCache_oncePredicate, &__block_literal_global_16);
  return (id)_displayNamesCache_cache;
}

void __40__TKApplicationProxy__displayNamesCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_displayNamesCache_cache;
  _displayNamesCache_cache = (uint64_t)v0;

}

- (void)_coreServicesLocalizedNameForBundleID:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B9768000, log, OS_LOG_TYPE_ERROR, "failed to get app record for %{public}@ with error: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
