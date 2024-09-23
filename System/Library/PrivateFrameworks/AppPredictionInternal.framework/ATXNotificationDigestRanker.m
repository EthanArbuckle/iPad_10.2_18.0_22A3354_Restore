@implementation ATXNotificationDigestRanker

- (ATXNotificationDigestRanker)init
{
  void *v3;
  ATXNotificationDigestRanker *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXNotificationDigestRanker initWithDigestFeedback:](self, "initWithDigestFeedback:", v3);

  return v4;
}

- (ATXNotificationDigestRanker)initWithDigestFeedback:(id)a3
{
  id v5;
  ATXNotificationDigestRanker *v6;
  ATXNotificationDigestRanker *v7;
  uint64_t v8;
  ATXNotificationDigestRankingConstants *c;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ATXNotificationDigestRanker;
  v6 = -[ATXNotificationDigestRanker init](&v11, sel_init);
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

- (id)createDigestForNotificationStacks:(id)a3 outError:(id *)a4
{
  id v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[4];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  uint8_t v58[128];
  uint8_t buf[4];
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  __atxlog_handle_notification_management();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v60 = v8;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "[%@] Generating a notification digest", buf, 0xCu);

  }
  v45 = v5;
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", &__block_literal_global_66_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_pas_filteredArrayWithTest:", &__block_literal_global_68_3);
  v10 = objc_claimAutoreleasedReturnValue();
  v44 = v9;
  objc_msgSend(v9, "_pas_filteredArrayWithTest:", &__block_literal_global_69);
  v11 = objc_claimAutoreleasedReturnValue();
  v43 = (void *)v10;
  -[ATXNotificationDigestRanker appsForNotificationGroups:](self, "appsForNotificationGroups:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sortedArrayUsingComparator:", &__block_literal_global_71_1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)v11;
  -[ATXNotificationDigestRanker appsForNotificationGroups:](self, "appsForNotificationGroups:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sortedArrayUsingComparator:", &__block_literal_global_72_5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXNotificationDigestRanker chooseAppsForMarquee:](self, "chooseAppsForMarquee:", v15);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v54 != v20)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "unorderedGroups");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sortedArrayUsingComparator:", &__block_literal_global_73_1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v16, "addObjectsFromArray:", v23);
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v19);
  }

  if (objc_msgSend(v46, "count") == 1
    && (objc_msgSend(v46, "firstObject"),
        v24 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v24, "orderedGroups"),
        v25 = (void *)objc_claimAutoreleasedReturnValue(),
        v26 = objc_msgSend(v25, "count"),
        v25,
        v24,
        v26 >= 2))
  {
    objc_msgSend(v46, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "orderedGroups");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "subarrayWithRange:", 0, 2);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v46, "_pas_mappedArrayWithTransform:", &__block_literal_global_75_1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v29 = (void *)objc_opt_new();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v30 = v15;
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v32; ++j)
      {
        if (*(_QWORD *)v50 != v33)
          objc_enumerationMutation(v30);
        objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * j), "unorderedGroups");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "sortedArrayUsingComparator:", &__block_literal_global_76_0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v29, "addObjectsFromArray:", v36);
      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    }
    while (v32);
  }

  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_9;
  v47[3] = &unk_1E82EB148;
  v48 = v41;
  v37 = v41;
  objc_msgSend(v29, "_pas_filteredArrayWithTest:", v47);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF91E8]), "initWithMessageGroups:highlightedGroups:otherGroups:rankerId:", v16, v37, v38, CFSTR("engagement_digest_ranking_1"));

  return v39;
}

id __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CF91F8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithNotifications:useDigestOrder:", v3, 1);

  return v4;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCommunicationGroup");
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isCommunicationGroup") ^ 1;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "appScore");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "appScore");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "appScore");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "appScore");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "appSpecifiedScore");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "appSpecifiedScore");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

id __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "orderedGroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(a3, "appSpecifiedScore");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "appSpecifiedScore");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __74__ATXNotificationDigestRanker_createDigestForNotificationStacks_outError___block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2) ^ 1;
}

- (id)appsForNotificationGroups:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  ATXNotificationDigestApp *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v24;
    *(_QWORD *)&v8 = 138412546;
    v22 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v12, "bundleId", v22, (_QWORD)v23);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v5, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v14)
          {
            v15 = -[ATXNotificationDigestApp initWithBundleId:digestFeedback:digestConstants:]([ATXNotificationDigestApp alloc], "initWithBundleId:digestFeedback:digestConstants:", v13, self->_digestFeedback, self->_c);
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v13);

          }
          objc_msgSend(v5, "objectForKeyedSubscript:", v13);
          v16 = objc_claimAutoreleasedReturnValue();
          -[NSObject addGroup:](v16, "addGroup:", v12);
        }
        else
        {
          __atxlog_handle_notification_management();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "groupId");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v22;
            v28 = v18;
            v29 = 2112;
            v30 = v19;
            _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "[%@] Missing bundle ID for group with ID %@", buf, 0x16u);

          }
        }

      }
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)chooseAppsForMarquee:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  void *v11;
  char v13;

  v4 = a3;
  v5 = -[ATXNotificationDigestRankingConstants numMarqueeSpots](self->_c, "numMarqueeSpots");
  v13 = 0;
  objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_81);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationDigestRanker sampleAppsForMarquee:numToSample:hasAutomaticMarqueeBeenUsedFlag:](self, "sampleAppsForMarquee:numToSample:hasAutomaticMarqueeBeenUsedFlag:", v6, v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5 - objc_msgSend(v7, "count");
  if (v8)
  {
    objc_msgSend(v4, "_pas_filteredArrayWithTest:", &__block_literal_global_82_1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXNotificationDigestRanker sampleAppsForMarquee:numToSample:hasAutomaticMarqueeBeenUsedFlag:](self, "sampleAppsForMarquee:numToSample:hasAutomaticMarqueeBeenUsedFlag:", v10, v8, &v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v11);
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = v7;
  }

  return v9;
}

uint64_t __52__ATXNotificationDigestRanker_chooseAppsForMarquee___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasImage");
}

uint64_t __52__ATXNotificationDigestRanker_chooseAppsForMarquee___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasImage") ^ 1;
}

- (id)sampleAppsForMarquee:(id)a3 numToSample:(unint64_t)a4 hasAutomaticMarqueeBeenUsedFlag:(BOOL *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a4 && objc_msgSend(v7, "count"))
  {
    v9 = (void *)MEMORY[0x1E0CF94E0];
    objc_msgSend(v8, "_pas_mappedArrayWithTransform:", &__block_literal_global_85_0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sampleWeightedArray:numToSample:", v10, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v11;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "unsignedIntegerValue", (_QWORD)v24));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    if (!*a5)
    {
      objc_msgSend(v8, "_pas_filteredArrayWithTest:", &__block_literal_global_86_0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count") && objc_msgSend(v12, "count"))
      {
        v20 = arc4random_uniform(objc_msgSend(v19, "count"));
        objc_msgSend(v19, "objectAtIndexedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "containsObject:", v21) & 1) == 0)
        {
          objc_msgSend(v19, "objectAtIndexedSubscript:", v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:atIndexedSubscript:", v22, objc_msgSend(v12, "count") - 1);

        }
        *a5 = 1;

      }
    }

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v12;
}

uint64_t __96__ATXNotificationDigestRanker_sampleAppsForMarquee_numToSample_hasAutomaticMarqueeBeenUsedFlag___block_invoke(uint64_t a1, void *a2)
{
  void *v2;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "appScore");
  return objc_msgSend(v2, "numberWithDouble:");
}

uint64_t __96__ATXNotificationDigestRanker_sampleAppsForMarquee_numToSample_hasAutomaticMarqueeBeenUsedFlag___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEligibleForAutomaticMarquee");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_c, 0);
  objc_storeStrong((id *)&self->_digestFeedback, 0);
}

@end
