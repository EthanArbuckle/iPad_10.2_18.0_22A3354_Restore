@implementation WKWebViewConfiguration(QLUtilities)

- (void)ql_initWithForegroundPriorityAndSourceBundleIdentifier:()QLUtilities
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_sharedDataStoreForBundleIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDFA928]);
    v7 = objc_alloc_init(MEMORY[0x24BDFA9C8]);
    v5 = (void *)objc_msgSend(v6, "_initWithConfiguration:", v7);

  }
  v8 = (void *)objc_msgSend(a1, "init");
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setWebsiteDataStore:", v5);
    objc_msgSend(v9, "_setClientNavigationsRunAtForegroundPriority:", 1);
  }

  return v9;
}

- (id)_sharedDataStoreForBundleIdentifier:()QLUtilities
{
  id v3;
  id v4;
  void *v5;
  id v6;

  v3 = a3;
  if (_sharedDataStoreForBundleIdentifier__once != -1)
    dispatch_once(&_sharedDataStoreForBundleIdentifier__once, &__block_literal_global_18);
  v4 = (id)_sharedDataStoreForBundleIdentifier__sharedWebKitDataStoreByBundleIdentifier;
  objc_sync_enter(v4);
  objc_msgSend((id)_sharedDataStoreForBundleIdentifier__sharedWebKitDataStoreByBundleIdentifier, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDFA9C8]);
    objc_msgSend(v6, "setSourceApplicationBundleIdentifier:", v3);
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFA928]), "_initWithConfiguration:", v6);
    objc_msgSend((id)_sharedDataStoreForBundleIdentifier__sharedWebKitDataStoreByBundleIdentifier, "setObject:forKeyedSubscript:", v5, v3);

  }
  objc_sync_exit(v4);

  return v5;
}

@end
