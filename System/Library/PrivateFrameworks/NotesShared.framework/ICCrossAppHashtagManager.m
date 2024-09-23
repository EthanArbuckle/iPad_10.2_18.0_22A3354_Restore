@implementation ICCrossAppHashtagManager

+ (id)hashtagDisplayTextsFromOtherApps
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("CrossAppHashtagDisplayText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  ICCheckedDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v15;
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v15 != v9)
            objc_enumerationMutation(v6);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_12;
          }
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          continue;
        break;
      }
    }

    objc_opt_class();
    ICDynamicCast();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11, v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_12:
    v12 = (void *)objc_opt_new();
  }

  return v12;
}

+ (id)bundleIDsForHashtagSupportingAppsOtherThanNotes
{
  return &unk_1E771AB48;
}

+ (void)prefetchHashtagDisplayTextsFromOtherApps
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  _QWORD *v13;
  id v14;
  _QWORD v15[5];
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleIDsForHashtagSupportingAppsOtherThanNotes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__31;
  v16[4] = __Block_byref_object_dispose__31;
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA6AE0]), "initWithQueryString:bundleIDs:", 0, v3);
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __68__ICCrossAppHashtagManager_prefetchHashtagDisplayTextsFromOtherApps__block_invoke;
  v15[3] = &unk_1E76CBC68;
  v15[4] = v16;
  objc_msgSend(v4, "setHashTagCompletionHandler:", v15);
  v8 = v5;
  v9 = 3221225472;
  v10 = __68__ICCrossAppHashtagManager_prefetchHashtagDisplayTextsFromOtherApps__block_invoke_13;
  v11 = &unk_1E76CBC90;
  v13 = v16;
  v6 = v3;
  v12 = v6;
  v14 = a1;
  objc_msgSend(v4, "setCompletionHandler:", &v8);
  v7 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v6;
    _os_log_impl(&dword_1BD918000, v7, OS_LOG_TYPE_INFO, "Starting to fetch hashtags from bundleIDs: %@", buf, 0xCu);
  }

  objc_msgSend(v4, "start", v8, v9, v10, v11);
  _Block_object_dispose(v16, 8);

}

void __68__ICCrossAppHashtagManager_prefetchHashtagDisplayTextsFromOtherApps__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v7 = 134217984;
    v8 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "hashTagCompletionHandler returned %lu hasthags", (uint8_t *)&v7, 0xCu);
  }

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v3, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v6);

}

void __68__ICCrossAppHashtagManager_prefetchHashtagDisplayTextsFromOtherApps__block_invoke_13(uint64_t a1, void *a2)
{
  __CFString *v3;
  NSObject *v4;
  const __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = CFSTR("success.");
    if (v3)
      v5 = v3;
    v9 = 138412290;
    v10 = (uint64_t)v5;
    _os_log_impl(&dword_1BD918000, v4, OS_LOG_TYPE_INFO, "hashtagQuery completed with %@", (uint8_t *)&v9, 0xCu);
  }

  if (!v3)
  {
    v6 = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "count");
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 134218242;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_1BD918000, v6, OS_LOG_TYPE_INFO, "Fetched %lu hasthags from bundleIDs: %@", (uint8_t *)&v9, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 48), "updateUserDefaultsCacheIfNecessaryWithNewlyFetchedHastags:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  }

}

+ (void)updateUserDefaultsCacheIfNecessaryWithNewlyFetchedHastags:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1, "hashtagDisplayTextsFromOtherApps");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToSet:", v4) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("CrossAppHashtagDisplayText"));

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "postNotificationName:object:", CFSTR("ICCrossAppHashtagDisplayTextUpdatedNotification"), 0);

  }
}

@end
