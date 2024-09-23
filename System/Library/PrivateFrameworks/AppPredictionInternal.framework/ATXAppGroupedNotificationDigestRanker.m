@implementation ATXAppGroupedNotificationDigestRanker

- (ATXAppGroupedNotificationDigestRanker)init
{
  void *v3;
  ATXAppGroupedNotificationDigestRanker *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXAppGroupedNotificationDigestRanker initWithDigestFeedback:](self, "initWithDigestFeedback:", v3);

  return v4;
}

- (ATXAppGroupedNotificationDigestRanker)initWithDigestFeedback:(id)a3
{
  id v5;
  ATXAppGroupedNotificationDigestRanker *v6;
  ATXAppGroupedNotificationDigestRanker *v7;
  uint64_t v8;
  ATXNotificationDigestRankingConstants *c;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXAppGroupedNotificationDigestRanker;
  v6 = -[ATXAppGroupedNotificationDigestRanker init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_digestFeedback, a3);
    +[ATXNotificationDigestRankingConstants sharedInstance](ATXNotificationDigestRankingConstants, "sharedInstance");
    v8 = objc_claimAutoreleasedReturnValue();
    c = v7->_c;
    v7->_c = (ATXNotificationDigestRankingConstants *)v8;

  }
  return v7;
}

- (id)createDigestForAppGroupedNotificationStacks:(id)a3 maxGlobalMarqueeGroups:(unint64_t)a4 maxAppMarqueeGroups:(unint64_t)a5 outError:(id *)a6
{
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  const __CFString *v36;
  uint8_t buf[4];
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  __atxlog_handle_notification_management();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v13;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_INFO, "[%@] Generating a notification digest", buf, 0xCu);

  }
  if (v10 || !a6)
  {
    -[ATXAppGroupedNotificationDigestRanker getRankedAppsFromAppGroupedNotificationStacks:maxAppMarqueeGroups:](self, "getRankedAppsFromAppGroupedNotificationStacks:maxAppMarqueeGroups:", v10, a5);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_opt_new();
    -[ATXAppGroupedNotificationDigestRanker bfsSelectGlobalMarqueeGroupsFromApps:maxCount:groupFilter:](self, "bfsSelectGlobalMarqueeGroupsFromApps:maxCount:groupFilter:", v18, a4, &__block_literal_global_96_0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addObjectsFromArray:", v20);

    if (objc_msgSend(v19, "count") < a4)
    {
      -[ATXAppGroupedNotificationDigestRanker bfsSelectGlobalMarqueeGroupsFromApps:maxCount:groupFilter:](self, "bfsSelectGlobalMarqueeGroupsFromApps:maxCount:groupFilter:", v18, a4, &__block_literal_global_97);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v21);

    }
    v22 = (void *)objc_opt_new();
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v16 = v18;
    v23 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v31;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(v16);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v26), "groupsWithComms", (_QWORD)v30);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "addObjectsFromArray:", v27);

          ++v26;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v24);
    }

    objc_msgSend(v16, "_pas_mappedArrayWithTransform:", &__block_literal_global_99);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91E8]), "initWithAppDigests:highlightedGroups:messageGroups:rankerId:", v28, v19, v22, CFSTR("engagement_digest_ranking_2"));

  }
  else
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0CB2FE0];
    v35 = *MEMORY[0x1E0CB2938];
    v36 = CFSTR("Missing argument. Notification stacks were nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 22, v16);
    v17 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

uint64_t __137__ATXAppGroupedNotificationDigestRanker_createDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_outError___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupsWithoutCommsWithPreviewableAttachment");
}

uint64_t __137__ATXAppGroupedNotificationDigestRanker_createDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_outError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupsWithoutCommsWithoutPreviewableAttachment");
}

id __137__ATXAppGroupedNotificationDigestRanker_createDigestForAppGroupedNotificationStacks_maxGlobalMarqueeGroups_maxAppMarqueeGroups_outError___block_invoke_3(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (objc_class *)MEMORY[0x1E0CF91E0];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "bundleId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appMarqueeGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nonAppMarqueeGroups");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v4, "initWithBundleId:appMarqueeGroups:nonAppMarqueeGroups:", v5, v6, v7);
  return v8;
}

- (id)getRankedAppsFromAppGroupedNotificationStacks:(id)a3 maxAppMarqueeGroups:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[6];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __107__ATXAppGroupedNotificationDigestRanker_getRankedAppsFromAppGroupedNotificationStacks_maxAppMarqueeGroups___block_invoke;
  v29[3] = &unk_1E82EB5F0;
  v29[4] = self;
  v29[5] = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v29);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CF94E0];
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", &__block_literal_global_107_2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sampleWeightedArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v13), "unsignedIntegerValue", (_QWORD)v25));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v36, 16);
    }
    while (v11);
  }

  v15 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_110);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_msgSend(v17, "count");
  if (v18 != objc_msgSend(v8, "count"))
  {
    __atxlog_handle_notification_management();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v17, "count");
      v23 = objc_msgSend(v8, "count");
      *(_DWORD *)buf = 138412802;
      v31 = v21;
      v32 = 2048;
      v33 = v22;
      v34 = 2048;
      v35 = v23;
      _os_log_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_INFO, "[%@] Found %lu bundleIds for %lu apps. # of bundle IDs should equal # of apps. Proceeding anyway.", buf, 0x20u);

    }
  }

  return v8;
}

_App *__107__ATXAppGroupedNotificationDigestRanker_getRankedAppsFromAppGroupedNotificationStacks_maxAppMarqueeGroups___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _App *v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = -[_App initWithNotificationStacks:maxAppMarqueeGroups:digestFeedback:]([_App alloc], "initWithNotificationStacks:maxAppMarqueeGroups:digestFeedback:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    __atxlog_handle_notification_management();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "[%@] notificationsStacks == nil. Skipping.", (uint8_t *)&v9, 0xCu);

    }
    v4 = 0;
  }

  return v4;
}

uint64_t __107__ATXAppGroupedNotificationDigestRanker_getRankedAppsFromAppGroupedNotificationStacks_maxAppMarqueeGroups___block_invoke_105(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "digestRankingScore");
  return objc_msgSend(v2, "numberWithDouble:");
}

uint64_t __107__ATXAppGroupedNotificationDigestRanker_getRankedAppsFromAppGroupedNotificationStacks_maxAppMarqueeGroups___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleId");
}

- (id)bfsSelectGlobalMarqueeGroupsFromApps:(id)a3 maxCount:(unint64_t)a4 groupFilter:(id)a5
{
  void (**v7)(id, _QWORD);
  void *v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v7 = (void (**)(id, _QWORD))a5;
  v8 = (void *)objc_opt_new();
  if (a4)
  {
    v9 = 0;
    do
    {
      v19 = objc_msgSend(v8, "count", v18);
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v23 = 0u;
      v10 = v18;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v21 != v13)
              objc_enumerationMutation(v10);
            v7[2](v7, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v9 < objc_msgSend(v15, "count"))
            {
              if (objc_msgSend(v8, "count") == a4)
              {

                goto LABEL_15;
              }
              objc_msgSend(v15, "objectAtIndexedSubscript:", v9);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v16);

            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
          if (v12)
            continue;
          break;
        }
      }
LABEL_15:

      if (objc_msgSend(v8, "count") == a4)
        break;
      if (v19 == objc_msgSend(v8, "count"))
        break;
      ++v9;
    }
    while (v9 != a4);
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_digestFeedback, 0);
}

@end
