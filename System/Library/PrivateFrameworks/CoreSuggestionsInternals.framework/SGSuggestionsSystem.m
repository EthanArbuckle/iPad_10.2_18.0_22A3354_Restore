@implementation SGSuggestionsSystem

+ (void)_beforeSystemInitialization
{
  id v2;
  id v3;

  +[SGDCloudKitSync setSharedInstanceConfigurationBlock:](SGDCloudKitSync, "setSharedInstanceConfigurationBlock:", &__block_literal_global_5373);
  if ((objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) == 0)
  {
    v2 = +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v3 = +[SGSqlEntityStore defaultHarvestStore](SGSqlEntityStore, "defaultHarvestStore");
  }
}

+ (void)start
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  const char *v7;
  NSObject *v8;
  int out_token;

  +[SGSuggestionsSystem _beforeSystemInitialization](SGSuggestionsSystem, "_beforeSystemInitialization");
  if (objc_msgSend(MEMORY[0x1E0D81590], "isUnlocked"))
  {
    +[SGSqlEntityStore defaultHarvestStore](SGSqlEntityStore, "defaultHarvestStore");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v2)
      v5 = v3 == 0;
    else
      v5 = 1;
    if (v5)
      retrySuggestionsInitializationWhenUnlocked();
    else
      finishSuggestionsSetup(v2, v3);

  }
  else
  {
    retrySuggestionsInitializationWhenUnlocked();
  }
  +[SGXPCActivityManager sharedInstance](SGXPCActivityManager, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerActivitiesWithSystem");

  out_token = 0;
  v7 = (const char *)objc_msgSend((id)*MEMORY[0x1E0D19DA0], "UTF8String");
  dispatch_get_global_queue(9, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  notify_register_dispatch(v7, &out_token, v8, &__block_literal_global_19);

}

void __28__SGSuggestionsSystem_start__block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  sgLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v1 = 0;
    _os_log_debug_impl(&dword_1C3607000, v0, OS_LOG_TYPE_DEBUG, "Preparing for queries", v1, 2u);
  }

}

void __50__SGSuggestionsSystem__beforeSystemInitialization__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = a2;
  objc_msgSend(v2, "setNewEntitiesCallback:", &__block_literal_global_5);
  objc_msgSend(v2, "setDeleteAllSyncedItemsCallback:", &__block_literal_global_8);
  v6 = (id)objc_opt_new();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C40]), "initWithContainerIdentifier:environment:", CFSTR("com.apple.CoreSuggestions.PseudoEvents"), 1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C94C28]), "initWithContainerID:options:", v3, v6);
  objc_msgSend(v4, "privateCloudDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDatabase:", v5);

}

uint64_t __50__SGSuggestionsSystem__beforeSystemInitialization__block_invoke_3()
{
  void *v0;
  void *v1;

  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D197F0], "fromSync");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "deleteItemsWithEntityTag:", v1);

  return 1;
}

uint64_t __50__SGSuggestionsSystem__beforeSystemInitialization__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  +[SGSqlEntityStore defaultStore](SGSqlEntityStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "writeEntity:", v2);

  return 1;
}

@end
