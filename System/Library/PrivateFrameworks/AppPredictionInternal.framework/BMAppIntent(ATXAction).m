@implementation BMAppIntent(ATXAction)

- (id)atxAction
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  v3 = (void *)MEMORY[0x1E0CB3710];
  v4 = objc_opt_class();
  objc_msgSend(a1, "interaction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", v4, v5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;

  objc_autoreleasePoolPop(v2);
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x1E0CF8C20]);
    objc_msgSend(v6, "intent");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_opt_new();
    objc_msgSend(a1, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v14) = 0;
    v12 = (void *)objc_msgSend(v8, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v9, v10, v11, 0, 0, 0, v14, 0, 0);

  }
  else
  {
    __atxlog_handle_feedback();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[BMAppIntent(ATXAction) atxAction].cold.1((uint64_t)v7, v9);
    v12 = 0;
  }

  return v12;
}

- (void)atxAction
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "IntentEventIsCompleteEngagement - Error unarchiving intent: %@", (uint8_t *)&v2, 0xCu);
}

@end
