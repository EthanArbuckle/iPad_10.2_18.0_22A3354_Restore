@implementation ATXStackRotationSessionManager

- (ATXStackRotationSessionManager)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXStackRotationSessionManager *v7;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXStackRotationSessionManager initWithStackIdToStackRotationSessions:completedSessions:recentHomeScreenCachedSuggestions:nPlusOneSuggestionUUIDsWithFirstRotation:](self, "initWithStackIdToStackRotationSessions:completedSessions:recentHomeScreenCachedSuggestions:nPlusOneSuggestionUUIDsWithFirstRotation:", v3, v4, v5, v6);

  return v7;
}

- (ATXStackRotationSessionManager)initWithStackIdToStackRotationSessions:(id)a3 completedSessions:(id)a4 recentHomeScreenCachedSuggestions:(id)a5 nPlusOneSuggestionUUIDsWithFirstRotation:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXStackRotationSessionManager *v15;
  ATXStackRotationSessionManager *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXStackRotationSessionManager;
  v15 = -[ATXStackRotationSessionManager init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_stackIdToStackRotationSessions, a3);
    objc_storeStrong((id *)&v16->_completedSessions, a4);
    objc_storeStrong((id *)&v16->_recentHomeScreenCachedSuggestions, a5);
    objc_storeStrong((id *)&v16->_nPlusOneSuggestionUUIDsWithFirstRotation, a6);
  }

  return v16;
}

- (void)_tryPruneSessionsOverMaxLimit
{
  unint64_t v3;
  unint64_t v4;

  v3 = -[NSMutableDictionary count](self->_stackIdToStackRotationSessions, "count");
  if (v3 > kATXStackRotationSessionManagerMaxConcurrentSessions)
    -[NSMutableDictionary removeAllObjects](self->_stackIdToStackRotationSessions, "removeAllObjects");
  v4 = -[NSMutableSet count](self->_nPlusOneSuggestionUUIDsWithFirstRotation, "count");
  if (v4 > kATXStackRotationSessionManagerMaxConcurrentNPlusOneSuggestions)
    -[NSMutableSet removeAllObjects](self->_nPlusOneSuggestionUUIDsWithFirstRotation, "removeAllObjects");
}

- (void)_tryEndStackRotationSessionWithStackId:(id)a3 homeScreenEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    -[NSMutableDictionary objectForKey:](self->_stackIdToStackRotationSessions, "objectForKey:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      -[NSObject finalizeWithEndingStackChangeEvent:](v9, "finalizeWithEndingStackChangeEvent:", v8);
      -[NSMutableDictionary removeObjectForKey:](self->_stackIdToStackRotationSessions, "removeObjectForKey:", v6);
      -[NSMutableArray addObject:](self->_completedSessions, "addObject:", v10);
      __atxlog_handle_metrics();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[ATXStackRotationSessionManager _tryEndStackRotationSessionWithStackId:homeScreenEvent:].cold.1();

    }
  }
  else
  {
    __atxlog_handle_metrics();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412802;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v8;
      _os_log_error_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_ERROR, "%@ - could not end session because of missing fields, stackId: %@, homeScreenEvent: %@", (uint8_t *)&v14, 0x20u);

    }
  }

}

- (void)_tryStartStackRotationSessionWithStackId:(id)a3 homeScreenEvent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  ATXStackRotationSession *v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7 && (objc_msgSend(v7, "reason"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
  {
    -[ATXStackRotationSessionManager _tryPruneSessionsOverMaxLimit](self, "_tryPruneSessionsOverMaxLimit");
    v10 = -[ATXStackRotationSession initWithStartingStackChangeEvent:]([ATXStackRotationSession alloc], "initWithStartingStackChangeEvent:", v8);
    -[ATXStackRotationSessionManager _tryUpdateStackRotationSessionWithSystemSuggestLayout:](self, "_tryUpdateStackRotationSessionWithSystemSuggestLayout:", v10);
    -[ATXStackRotationSessionManager _tryUpdateNPlusOneStatusForSession:stackId:](self, "_tryUpdateNPlusOneStatusForSession:stackId:", v10, v6);
    -[NSMutableDictionary setValue:forKey:](self->_stackIdToStackRotationSessions, "setValue:forKey:", v10, v6);
    __atxlog_handle_metrics();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ATXStackRotationSessionManager _tryStartStackRotationSessionWithStackId:homeScreenEvent:].cold.1();

  }
  else
  {
    __atxlog_handle_metrics();
    v10 = (ATXStackRotationSession *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_ERROR))
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "reason");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138413058;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v8;
      _os_log_error_impl(&dword_1C9A3B000, &v10->super, OS_LOG_TYPE_ERROR, "%@ - could not start session because of missing fields, stackId: %@, reason: %@, homeScreenEvent: %@", (uint8_t *)&v15, 0x2Au);

    }
  }

}

- (void)updateWithUIEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  int v29;

  objc_msgSend(a3, "homeScreenEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "eventTypeString");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
    {
      v7 = 0;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HomeScreenPageShown")) & 1) != 0)
    {
      v7 = 1;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("HomeScreenDisappeared")) & 1) != 0)
    {
      v7 = 2;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackChanged")) & 1) != 0)
    {
      v7 = 3;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetTapped")) & 1) != 0)
    {
      v7 = 4;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetLongLook")) & 1) != 0)
    {
      v7 = 5;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetUserFeedback")) & 1) != 0)
    {
      v7 = 6;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("UserStackConfigChanged")) & 1) != 0)
    {
      v7 = 7;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DeviceLocked")) & 1) != 0)
    {
      v7 = 8;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("DeviceUnlocked")) & 1) != 0)
    {
      v7 = 9;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PinnedWidgetAdded")) & 1) != 0)
    {
      v7 = 10;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PinnedWidgetDeleted")) & 1) != 0)
    {
      v7 = 11;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SpecialPageAppeared")) & 1) != 0)
    {
      v7 = 12;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("SpecialPageDisappeared")) & 1) != 0)
    {
      v7 = 13;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackShown")) & 1) != 0)
    {
      v7 = 14;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackDisappeared")) & 1) != 0)
    {
      v7 = 15;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackCreated")) & 1) != 0)
    {
      v7 = 16;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackDeleted")) & 1) != 0)
    {
      v7 = 17;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetAddedToStack")) & 1) != 0)
    {
      v7 = 18;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("WidgetRemovedFromStack")) & 1) != 0)
    {
      v7 = 19;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("StackVisibilityChanged")) & 1) != 0)
    {
      v7 = 20;
    }
    else if ((objc_msgSend(v6, "isEqualToString:", CFSTR("AppAdded")) & 1) != 0)
    {
      v7 = 21;
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("AppRemoved")))
    {
      v7 = 22;
    }
    else
    {
      v7 = 0;
    }

    objc_msgSend(v5, "stackId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      switch(v7)
      {
        case 3:
          -[ATXStackRotationSessionManager _tryEndStackRotationSessionWithStackId:homeScreenEvent:](self, "_tryEndStackRotationSessionWithStackId:homeScreenEvent:", v8, v5);
          -[ATXStackRotationSessionManager _tryStartStackRotationSessionWithStackId:homeScreenEvent:](self, "_tryStartStackRotationSessionWithStackId:homeScreenEvent:", v8, v5);
          break;
        case 4:
          -[NSMutableDictionary objectForKey:](self->_stackIdToStackRotationSessions, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            goto LABEL_80;
          objc_msgSend(v5, "widgetUniqueId");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "widgetUniqueId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v10, "isEqualToString:", v11);

          if (!v12)
            goto LABEL_80;
          objc_msgSend(v9, "markStackTapped");
          __atxlog_handle_metrics();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[ATXStackRotationSessionManager updateWithUIEvent:].cold.3();
          goto LABEL_79;
        case 6:
          objc_msgSend(v5, "reason");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary objectForKey:](self->_stackIdToStackRotationSessions, "objectForKey:", v8);
          v14 = objc_claimAutoreleasedReturnValue();
          v13 = v14;
          if (!v9 || !v14)
            goto LABEL_79;
          NSStringForATXHomeScreenWidgetExplicitFeedback();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v9, "isEqualToString:", v15);

          if (v16)
          {
            -[NSObject markAddedToStack](v13, "markAddedToStack");
            __atxlog_handle_metrics();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
              -[ATXStackRotationSessionManager updateWithUIEvent:].cold.4();
          }
          else
          {
            NSStringForATXHomeScreenWidgetExplicitFeedback();
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v9, "isEqualToString:", v26);

            if (v27)
            {
              -[NSObject markRejectedRotationDismissOnce](v13, "markRejectedRotationDismissOnce");
              __atxlog_handle_metrics();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                -[ATXStackRotationSessionManager updateWithUIEvent:].cold.5();
            }
            else
            {
              NSStringForATXHomeScreenWidgetExplicitFeedback();
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v9, "isEqualToString:", v28);

              if (!v29)
                goto LABEL_79;
              -[NSObject markRejectedRotationNeverShowAgain](v13, "markRejectedRotationNeverShowAgain");
              __atxlog_handle_metrics();
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
                -[ATXStackRotationSessionManager updateWithUIEvent:].cold.6();
            }
          }

LABEL_79:
LABEL_80:

          break;
        case 14:
          -[NSMutableDictionary objectForKey:](self->_stackIdToStackRotationSessions, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            goto LABEL_80;
          objc_msgSend(v5, "widgetUniqueId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "widgetUniqueId");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v18, "isEqualToString:", v19);

          if (!v20)
            goto LABEL_80;
          objc_msgSend(v5, "date");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "markStackShownAtDate:", v21);

          __atxlog_handle_metrics();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[ATXStackRotationSessionManager updateWithUIEvent:].cold.1();
          goto LABEL_79;
        case 15:
          -[NSMutableDictionary objectForKey:](self->_stackIdToStackRotationSessions, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            goto LABEL_80;
          objc_msgSend(v5, "widgetUniqueId");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "widgetUniqueId");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v22, "isEqualToString:", v23);

          if (!v24)
            goto LABEL_80;
          objc_msgSend(v5, "date");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "markStackHiddenAtDate:", v25);

          __atxlog_handle_metrics();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[ATXStackRotationSessionManager updateWithUIEvent:].cold.2();
          goto LABEL_79;
        case 17:
          -[NSMutableDictionary objectForKey:](self->_stackIdToStackRotationSessions, "objectForKey:", v8);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v9)
            goto LABEL_80;
          -[ATXStackRotationSessionManager _tryEndStackRotationSessionWithStackId:homeScreenEvent:](self, "_tryEndStackRotationSessionWithStackId:homeScreenEvent:", v8, v5);
          __atxlog_handle_metrics();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[ATXStackRotationSessionManager updateWithUIEvent:].cold.7();
          goto LABEL_79;
        default:
          break;
      }
    }

  }
}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "uiCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    goto LABEL_20;
  objc_msgSend(v4, "uiCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cachedTopOfStackLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "count"))
  {

LABEL_5:
    -[NSMutableArray addObject:](self->_recentHomeScreenCachedSuggestions, "addObject:", v7);
    goto LABEL_6;
  }
  objc_msgSend(v7, "cachedSuggestedWidgetsLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    goto LABEL_5;
LABEL_6:
  if ((unint64_t)-[NSMutableArray count](self->_recentHomeScreenCachedSuggestions, "count") >= 3)
  {
    do
      -[NSMutableArray removeObjectAtIndex:](self->_recentHomeScreenCachedSuggestions, "removeObjectAtIndex:", 0);
    while ((unint64_t)-[NSMutableArray count](self->_recentHomeScreenCachedSuggestions, "count") > 2);
  }
  -[ATXStackRotationSessionManager uuidsOfNPlusOneSuggestionsFromCachedSuggestions:](self, "uuidsOfNPlusOneSuggestionsFromCachedSuggestions:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = (void *)-[NSMutableSet copy](self->_nPlusOneSuggestionUUIDsWithFirstRotation, "copy", 0);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        if ((objc_msgSend(v11, "containsObject:", v17) & 1) == 0)
          -[NSMutableSet removeObject:](self->_nPlusOneSuggestionUUIDsWithFirstRotation, "removeObject:", v17);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v14);
  }

  __atxlog_handle_metrics();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    -[ATXStackRotationSessionManager updateWithBlendingUICacheUpdate:].cold.1();

LABEL_20:
}

- (id)removeAndReturnCompletedSessions
{
  void *v3;

  if (-[NSMutableArray count](self->_completedSessions, "count"))
  {
    v3 = (void *)-[NSMutableArray copy](self->_completedSessions, "copy");
    -[NSMutableArray removeAllObjects](self->_completedSessions, "removeAllObjects");
  }
  else
  {
    v3 = (void *)objc_opt_new();
  }
  return v3;
}

- (id)removeAllAndReturnCompletedSystemSuggestSessions
{
  void *v2;
  void *v3;

  -[ATXStackRotationSessionManager removeAndReturnCompletedSessions](self, "removeAndReturnCompletedSessions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_filteredArrayWithTest:", &__block_literal_global_164);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __82__ATXStackRotationSessionManager_removeAllAndReturnCompletedSystemSuggestSessions__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "rotationReason");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringForATXHomeScreenStackChangeReason();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

- (void)_tryUpdateNPlusOneStatusForSession:(id)a3 stackId:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ATXStackRotationSessionManager *v15;
  uint64_t *v16;
  uint64_t *v17;
  _QWORD *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[3];
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = a4;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMutableArray reverseObjectEnumerator](self->_recentHomeScreenCachedSuggestions, "reverseObjectEnumerator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v10), "cachedSuggestedWidgetsLayouts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __77__ATXStackRotationSessionManager__tryUpdateNPlusOneStatusForSession_stackId___block_invoke;
        v13[3] = &unk_1E82E6DC0;
        v14 = v6;
        v15 = self;
        v16 = &v29;
        v17 = &v25;
        v18 = v23;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v33, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "updateIsNPlusOneRotation:isFirstNPlusOneRotation:", *((unsigned __int8 *)v30 + 24), *((unsigned __int8 *)v26 + 24));
  _Block_object_dispose(v23, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

}

void __77__ATXStackRotationSessionManager__tryUpdateNPlusOneStatusForSession_stackId___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v7)
    goto LABEL_17;
  v8 = v7;
  v9 = *(_QWORD *)v22;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v22 != v9)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      objc_msgSend(v11, "widgetUniqueId", (_QWORD)v21);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "widgetUniqueId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqualToString:", v13);

      if (v14)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        objc_msgSend(v11, "allSuggestionsInLayout");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "firstObject");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          v17 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
          objc_msgSend(v16, "uuid");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v17) = objc_msgSend(v17, "containsObject:", v18);

          if ((v17 & 1) != 0)
          {
LABEL_16:
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

            goto LABEL_17;
          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
          v19 = *(void **)(*(_QWORD *)(a1 + 40) + 32);
          objc_msgSend(v16, "uuid");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v20);
        }
        else
        {
          __atxlog_handle_metrics();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
            __77__ATXStackRotationSessionManager__tryUpdateNPlusOneStatusForSession_stackId___block_invoke_cold_1();
        }

        goto LABEL_16;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v8)
      continue;
    break;
  }
LABEL_17:

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    *a4 = 1;

}

- (void)_tryUpdateStackRotationSessionWithSystemSuggestLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "rotationReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringForATXHomeScreenStackChangeReason();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[NSMutableArray reverseObjectEnumerator](self->_recentHomeScreenCachedSuggestions, "reverseObjectEnumerator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      v12 = MEMORY[0x1E0C809B0];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v13), "cachedTopOfStackLayouts");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15[0] = v12;
          v15[1] = 3221225472;
          v15[2] = __88__ATXStackRotationSessionManager__tryUpdateStackRotationSessionWithSystemSuggestLayout___block_invoke;
          v15[3] = &unk_1E82E6190;
          v16 = v4;
          objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v15);

          ++v13;
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
}

void __88__ATXStackRotationSessionManager__tryUpdateStackRotationSessionWithSystemSuggestLayout___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "widgetUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "widgetUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "updateWithSystemSuggestSuggestionLayout:", v7);

}

- (id)uuidsOfNPlusOneSuggestionsFromCachedSuggestions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "cachedSuggestedWidgetsLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __82__ATXStackRotationSessionManager_uuidsOfNPlusOneSuggestionsFromCachedSuggestions___block_invoke;
  v9[3] = &unk_1E82DE4A0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __82__ATXStackRotationSessionManager_uuidsOfNPlusOneSuggestionsFromCachedSuggestions___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v8), "allSuggestionsInLayout");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v10, "uuid");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSMutableDictionary hash](self->_stackIdToStackRotationSessions, "hash");
  return -[NSMutableArray hash](self->_completedSessions, "hash") - v3 + 32 * v3;
}

- (BOOL)isEqual:(id)a3
{
  ATXStackRotationSessionManager *v4;
  ATXStackRotationSessionManager *v5;
  BOOL v6;

  v4 = (ATXStackRotationSessionManager *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXStackRotationSessionManager isEqualToATXStackRotationSessionManager:](self, "isEqualToATXStackRotationSessionManager:", v5);

  return v6;
}

- (BOOL)isEqualToATXStackRotationSessionManager:(id)a3
{
  id *v4;
  NSMutableDictionary *stackIdToStackRotationSessions;
  NSMutableDictionary *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  char v9;
  char v10;
  NSMutableArray *v11;
  NSMutableArray *v12;

  v4 = (id *)a3;
  stackIdToStackRotationSessions = self->_stackIdToStackRotationSessions;
  v6 = (NSMutableDictionary *)v4[1];
  if (stackIdToStackRotationSessions == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = stackIdToStackRotationSessions;
    v9 = -[NSMutableDictionary isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
    {
      v10 = 0;
      goto LABEL_9;
    }
  }
  v11 = self->_completedSessions;
  v12 = v11;
  if (v11 == v4[2])
    v10 = 1;
  else
    v10 = -[NSMutableArray isEqual:](v11, "isEqual:");

LABEL_9:
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *stackIdToStackRotationSessions;
  id v5;

  stackIdToStackRotationSessions = self->_stackIdToStackRotationSessions;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", stackIdToStackRotationSessions, CFSTR("mapping"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_completedSessions, CFSTR("completedSessions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recentHomeScreenCachedSuggestions, CFSTR("recentHomeScreenCachedSuggestions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nPlusOneSuggestionUUIDsWithFirstRotation, CFSTR("nPlusOneRotationStatus"));

}

- (ATXStackRotationSessionManager)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ATXStackRotationSessionManager *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v41;

  v4 = a3;
  v5 = (void *)MEMORY[0x1CAA48B6C]();
  v6 = objc_alloc(MEMORY[0x1E0C99E60]);
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v5);
  v10 = (void *)MEMORY[0x1E0D81610];
  __atxlog_handle_metrics();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v9, CFSTR("mapping"), v4, 1, CFSTR("com.apple.proactive.ATXStackRotationSessionManager"), -1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_msgSend(v4, "error"), v13 = (void *)objc_claimAutoreleasedReturnValue(), v13, !v13))
  {
    v15 = (void *)MEMORY[0x1E0D81610];
    v16 = (void *)MEMORY[0x1CAA48B6C]();
    v17 = objc_alloc(MEMORY[0x1E0C99E60]);
    v18 = objc_opt_class();
    v19 = (void *)objc_msgSend(v17, "initWithObjects:", v18, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v16);
    __atxlog_handle_metrics();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v19, CFSTR("completedSessions"), v4, 1, CFSTR("com.apple.proactive.ATXStackRotationSessionManager"), -1, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 && (objc_msgSend(v4, "error"), v22 = (void *)objc_claimAutoreleasedReturnValue(), v22, !v22))
    {
      v23 = (void *)MEMORY[0x1CAA48B6C]();
      v41 = objc_alloc(MEMORY[0x1E0C99E60]);
      v24 = objc_opt_class();
      v25 = objc_opt_class();
      v26 = objc_opt_class();
      v27 = (void *)objc_msgSend(v41, "initWithObjects:", v24, v25, v26, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v23);

      v28 = (void *)MEMORY[0x1E0D81610];
      __atxlog_handle_metrics();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v27, CFSTR("recentHomeScreenCachedSuggestions"), v4, 1, CFSTR("com.apple.proactive.ATXStackRotationSessionManager"), -1, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30
        && (objc_msgSend(v4, "error"), v31 = (void *)objc_claimAutoreleasedReturnValue(), v31, !v31))
      {
        v32 = (void *)MEMORY[0x1CAA48B6C]();
        v33 = objc_alloc(MEMORY[0x1E0C99E60]);
        v34 = objc_opt_class();
        v35 = objc_msgSend(v33, "initWithObjects:", v34, objc_opt_class(), 0);
        objc_autoreleasePoolPop(v32);

        v36 = (void *)MEMORY[0x1E0D81610];
        __atxlog_handle_metrics();
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v35, CFSTR("nPlusOneRotationStatus"), v4, 1, CFSTR("com.apple.proactive.ATXStackRotationSessionManager"), -1, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        if (v38
          && (objc_msgSend(v4, "error"), v39 = (void *)objc_claimAutoreleasedReturnValue(), v39, !v39))
        {
          self = -[ATXStackRotationSessionManager initWithStackIdToStackRotationSessions:completedSessions:recentHomeScreenCachedSuggestions:nPlusOneSuggestionUUIDsWithFirstRotation:](self, "initWithStackIdToStackRotationSessions:completedSessions:recentHomeScreenCachedSuggestions:nPlusOneSuggestionUUIDsWithFirstRotation:", v12, v21, v30, v38);
          v14 = self;
        }
        else
        {
          v14 = 0;
        }

        v27 = (void *)v35;
      }
      else
      {
        v14 = 0;
      }

      v9 = v27;
    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSMutableDictionary)stackIdToStackRotationSessions
{
  return self->_stackIdToStackRotationSessions;
}

- (NSMutableArray)completedSessions
{
  return self->_completedSessions;
}

- (NSMutableArray)recentHomeScreenCachedSuggestions
{
  return self->_recentHomeScreenCachedSuggestions;
}

- (NSMutableSet)nPlusOneSuggestionUUIDsWithFirstRotation
{
  return self->_nPlusOneSuggestionUUIDsWithFirstRotation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nPlusOneSuggestionUUIDsWithFirstRotation, 0);
  objc_storeStrong((id *)&self->_recentHomeScreenCachedSuggestions, 0);
  objc_storeStrong((id *)&self->_completedSessions, 0);
  objc_storeStrong((id *)&self->_stackIdToStackRotationSessions, 0);
}

- (void)_tryEndStackRotationSessionWithStackId:homeScreenEvent:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - marked stack rotation status as completed: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_tryStartStackRotationSessionWithStackId:homeScreenEvent:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - starting stack rotation session: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithUIEvent:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - updated dwell start date for session %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithUIEvent:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - updated dwell end date for session %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithUIEvent:.cold.3()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - handled tap for session %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithUIEvent:.cold.4()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - handled N+1 added to stack for session %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithUIEvent:.cold.5()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - handled N+1 rotation dismissed once for session %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithUIEvent:.cold.6()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - handled N+1 rotation never show again for session %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithUIEvent:.cold.7()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - handled stack delete for session %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)updateWithBlendingUICacheUpdate:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_4_0();
  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ N+1: _nPlusOneSuggestionUUIDsWithFirstRotation: %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __77__ATXStackRotationSessionManager__tryUpdateNPlusOneStatusForSession_stackId___block_invoke_cold_1()
{
  NSObject *v0;
  objc_class *v1;
  void *v2;
  uint8_t v3[24];
  uint64_t v4;

  OUTLINED_FUNCTION_4_0();
  v4 = *MEMORY[0x1E0C80C00];
  v1 = (objc_class *)objc_opt_class();
  NSStringFromClass(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  _os_log_fault_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_FAULT, "%@ N+1 - could not find suggestion in stack rotation layout: %@", v3, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
