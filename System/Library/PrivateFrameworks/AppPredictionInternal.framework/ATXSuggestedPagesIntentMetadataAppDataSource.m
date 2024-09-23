@implementation ATXSuggestedPagesIntentMetadataAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;

  v6 = a4;
  if (a3 == 4)
  {
    v7 = 127;
  }
  else
  {
    if (a3 != 11)
    {
      v8 = 0;
      goto LABEL_7;
    }
    v7 = 15;
  }
  -[ATXSuggestedPagesIntentMetadataAppDataSource _appsMatchingShortcutAvailability:](self, "_appsMatchingShortcutAvailability:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v8;
}

- (id)_appsMatchingShortcutAvailability:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  unint64_t v15;

  v4 = (void *)objc_opt_new();
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "App");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "atx_publisherFromStartDate:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterWithIsIncluded:", &__block_literal_global_6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke_3;
  v13[3] = &unk_1E82DAF40;
  v15 = a3;
  v10 = v4;
  v14 = v10;
  v11 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", &__block_literal_global_10, v13);

  return v10;
}

BOOL __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;

  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v2, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bundleID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      objc_msgSend(v5, "interaction");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length") != 0;

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;

  v3 = a2;
  v4 = (void *)MEMORY[0x1CAA48B6C]();
  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = objc_opt_class();
  objc_msgSend(v3, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interaction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", v6, v8, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;

  objc_autoreleasePoolPop(v4);
  if (!v9)
  {
    __atxlog_handle_modes();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke_3_cold_1((uint64_t)v10, v15);
    goto LABEL_6;
  }
  objc_msgSend(v9, "intent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 40) & objc_msgSend(v11, "shortcutAvailability");

  if (v12)
  {
    v13 = *(void **)(a1 + 32);
    v14 = objc_alloc(MEMORY[0x1E0CF8E50]);
    objc_msgSend(v3, "eventBody");
    v15 = objc_claimAutoreleasedReturnValue();
    -[NSObject bundleID](v15, "bundleID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v14, "initWithBundleId:predictionSource:", v16, CFSTR("Intent Metadata"));
    objc_msgSend(v13, "addObject:", v17);

LABEL_6:
  }

}

void __82__ATXSuggestedPagesIntentMetadataAppDataSource__appsMatchingShortcutAvailability___block_invoke_3_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXSuggestedPagesIntentMetadataAppDataSource: Could not unarchive interaction: %@", (uint8_t *)&v2, 0xCu);
}

@end
