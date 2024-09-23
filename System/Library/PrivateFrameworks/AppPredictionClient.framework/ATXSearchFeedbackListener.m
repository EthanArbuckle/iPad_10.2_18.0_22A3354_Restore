@implementation ATXSearchFeedbackListener

- (void)resultsDidBecomeVisible:(id)a3
{
  NSObject *v5;
  ATXSearchFeedbackListener *v6;
  NSObject *v7;
  uint64_t v8;
  unint64_t lastEventTimestamp;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *appBlendingCacheId;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  NSString *actionBlendingCacheId;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  NSString *v38;
  NSString *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  id obj;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  _BYTE v58[128];
  _BYTE info[12];
  __int16 v60;
  NSObject *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce, -[NSObject timestamp](v5, "timestamp"), a2))
  {
    v45 = v5;
    v6 = self;
    objc_sync_enter(v6);
    __atxlog_handle_feedback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v42 = -[NSObject triggerEvent](v5, "triggerEvent");
      -[NSObject results](v45, "results");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)info = 134218499;
      *(_QWORD *)&info[4] = v42;
      v60 = 2117;
      v61 = v45;
      v62 = 2117;
      v63 = v43;
      _os_log_debug_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: resultsDidBecomeVisible, event:%lu, feedback:%{sensitive}@, results:%{sensitive}@", info, 0x20u);

    }
    if (v6->_previousSessionHadEngagement
      && (v8 = -[NSObject timestamp](v45, "timestamp"),
          lastEventTimestamp = v6->_debounce.searchViewDidDisappear.lastEventTimestamp,
          *(_QWORD *)info = 0,
          mach_timebase_info((mach_timebase_info_t)info),
          (v8 - lastEventTimestamp) * *(unsigned int *)info / *(unsigned int *)&info[4] <= 0x2FAF07F))
    {
      __atxlog_handle_feedback();
      v49 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        -[ATXSearchFeedbackListener resultsDidBecomeVisible:].cold.2();
    }
    else
    {
      v49 = objc_opt_new();
      v46 = (void *)objc_opt_new();
      v48 = (void *)objc_opt_new();
      v47 = (void *)objc_opt_new();
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      -[NSObject results](v45, "results");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (v11)
      {
        v51 = *(_QWORD *)v53;
        *(_QWORD *)&v12 = 138412546;
        v44 = v12;
        obj = v10;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v53 != v51)
              objc_enumerationMutation(obj);
            v14 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
            -[ATXSearchFeedbackListener _sendSpotlightUIStreamEventType:searchResult:](v6, "_sendSpotlightUIStreamEventType:searchResult:", 3, v14, v44);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              objc_msgSend(v15, "proactiveSuggestion");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "uuid");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "UUIDString");
              v18 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "proactiveSuggestion");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "bundleIdExecutableObject");
              v20 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v6->_appBlendingCacheId)
              {
                objc_msgSend(v15, "response");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "blendingModelUICacheUpdateUUID");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "UUIDString");
                v23 = objc_claimAutoreleasedReturnValue();
                appBlendingCacheId = v6->_appBlendingCacheId;
                v6->_appBlendingCacheId = (NSString *)v23;

              }
              if ((-[NSMutableSet containsObject:](v6->_visibleAppUUIDs, "containsObject:", v18) & 1) == 0)
                -[NSObject addObject:](v49, "addObject:", v18);
              if ((-[NSMutableSet containsObject:](v6->_visibleAppBundleIds, "containsObject:", v20) & 1) == 0)
                objc_msgSend(v48, "addObject:", v20);

LABEL_39:
              goto LABEL_40;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = v14;
              objc_msgSend(v15, "proactiveSuggestion");
              v18 = objc_claimAutoreleasedReturnValue();
              -[NSObject uuid](v18, "uuid");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "UUIDString");
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "contextActionIdentifier");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (!v27)
                v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81138]), "initWithProactiveSuggestion:", v18);
              if (!v6->_actionBlendingCacheId)
              {
                objc_msgSend(v15, "blendingModelUICacheUpdateUUID");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "UUIDString");
                v29 = objc_claimAutoreleasedReturnValue();
                actionBlendingCacheId = v6->_actionBlendingCacheId;
                v6->_actionBlendingCacheId = (NSString *)v29;

              }
              if (v26 && (-[NSMutableSet containsObject:](v6->_visibleActionUUIDs, "containsObject:", v26) & 1) == 0)
                objc_msgSend(v46, "addObject:", v26);
              if (v27)
              {
                if ((-[NSMutableSet containsObject:](v6->_visibleActionContextIdentifiers, "containsObject:", v27) & 1) == 0)
                {
                  objc_msgSend(v47, "addObject:", v27);
                  -[ATXSearchFeedbackListener _logCAActionWithIdentifiers:eventType:](v6, "_logCAActionWithIdentifiers:eventType:", v27, 3);
                }
              }
              else
              {
                __atxlog_handle_blending();
                v35 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
                {
                  -[NSObject executableSpecification](v18, "executableSpecification");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "executableIdentifier");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)info = v44;
                  *(_QWORD *)&info[4] = v37;
                  v60 = 2112;
                  v61 = v18;
                  _os_log_error_impl(&dword_1A49EF000, v35, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: nil: %@, %@", info, 0x16u);

                }
              }

              goto LABEL_39;
            }
            v31 = objc_alloc(MEMORY[0x1E0D81138]);
            objc_msgSend(v14, "requestedTopic");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "sectionBundleIdentifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (id)objc_msgSend(v31, "initWithTopic:sectionBundleIdentifier:", v32, v33);

            if (!v15)
            {
              __atxlog_handle_blending();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v14, "requestedTopic");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                -[ATXSearchFeedbackListener resultsDidBecomeVisible:].cold.1(v34, buf, &v57, v18);
              }
              goto LABEL_39;
            }
            if ((-[NSMutableSet containsObject:](v6->_visibleActionContextIdentifiers, "containsObject:", v15) & 1) == 0)
            {
              objc_msgSend(v47, "addObject:", v15);
              -[ATXSearchFeedbackListener _logCAActionWithIdentifiers:eventType:](v6, "_logCAActionWithIdentifiers:eventType:", v15, 3);
            }
LABEL_40:

          }
          v10 = obj;
          v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
        }
        while (v11);
      }

      if ((v6->_appBlendingCacheId || v6->_actionBlendingCacheId)
        && (-[NSObject count](v49, "count") || objc_msgSend(v46, "count")))
      {
        v38 = v6->_appBlendingCacheId;
        v39 = v6->_actionBlendingCacheId;
        v40 = (void *)objc_opt_new();
        +[ATXSpotlightEvent suggestionsAppearedEventWithAppSuggestionIds:actionSuggestionIds:appBlendingCacheId:actionBlendingCacheId:date:](ATXSpotlightEvent, "suggestionsAppearedEventWithAppSuggestionIds:actionSuggestionIds:appBlendingCacheId:actionBlendingCacheId:date:", v49, v46, v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[ATXSearchFeedbackListener writeSpotlightEvent:isViewAppearEvent:](v6, "writeSpotlightEvent:isViewAppearEvent:", v41, 0);
        -[NSMutableSet addObjectsFromArray:](v6->_visibleAppUUIDs, "addObjectsFromArray:", v49);
        -[NSMutableSet addObjectsFromArray:](v6->_visibleActionUUIDs, "addObjectsFromArray:", v46);
        -[NSMutableSet addObjectsFromArray:](v6->_visibleAppBundleIds, "addObjectsFromArray:", v48);

      }
    }

    objc_sync_exit(v6);
    v5 = v45;
  }

}

- (void)_sendSpotlightUIStreamEventType:(int64_t)a3 searchResult:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(v6, "sectionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.spotlight.dec.zkw.recents"));

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%lu"), objc_msgSend(v10, "hash"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXSearchFeedbackListener _suggestionSubTypeStringWithResultType:](self, "_suggestionSubTypeStringWithResultType:", objc_msgSend(v6, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81208]), "initWithType:suggestionUniqueId:suggestionType:suggestionSubtype:suggestionContext:", a3, v11, CFSTR("recent"), v12, 0);
    __atxlog_handle_feedback();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v13, "eventType");
      objc_msgSend(v13, "suggestionType");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "suggestionSubtype");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "suggestionUniqueId");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v20 = v15;
      v21 = 2112;
      v22 = v16;
      v23 = 2112;
      v24 = v17;
      v25 = 2112;
      v26 = v18;
      _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "ATXSFL: uiEvent type%ld: %@ %@ %@", buf, 0x2Au);

    }
    -[ATXSearchFeedbackListener _sendSpotlightUIEvent:](self, "_sendSpotlightUIEvent:", v13);

  }
}

- (void)didStartSearch:(id)a3
{
  id v5;
  ATXSearchFeedbackListener *v6;
  NSObject *v7;
  uint64_t v8;
  NSString *currentQuery;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.didStartSearch, objc_msgSend(v5, "timestamp"), a2))
  {
    v6 = self;
    objc_sync_enter(v6);
    __atxlog_handle_feedback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(v5, "triggerEvent");
      objc_msgSend(v5, "input");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218755;
      v14 = v10;
      v15 = 2117;
      v16 = v5;
      v17 = 2117;
      v18 = v11;
      v19 = 2112;
      v20 = v12;
      _os_log_debug_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: didStartSearch, event:%lu, feedback:%{sensitive}@, input:%{sensitive}@, uuid:%@", (uint8_t *)&v13, 0x2Au);

    }
    objc_msgSend(v5, "input");
    v8 = objc_claimAutoreleasedReturnValue();
    currentQuery = v6->_currentQuery;
    v6->_currentQuery = (NSString *)v8;

    if (-[NSString length](v6->_currentQuery, "length"))
      v6->_didSearchDuringSession = 1;
    objc_sync_exit(v6);

  }
}

- (BOOL)_isDuplicateEventWithState:(id *)a3 timestamp:(unint64_t)a4 method:(SEL)a5
{
  unint64_t var0;
  unint64_t v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  _BYTE v12[12];
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  var0 = a3->var0;
  a3->var0 = a4;
  if (!self->_shouldDebounce)
    return 0;
  v7 = a4 - var0;
  *(_QWORD *)v12 = 0;
  mach_timebase_info((mach_timebase_info_t)v12);
  v8 = v7 * *(unsigned int *)v12 / *(unsigned int *)&v12[4];
  if (v8 >= 0x2FAF080)
    return 0;
  __atxlog_handle_feedback();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v12 = 138412802;
    *(_QWORD *)&v12[4] = v10;
    v13 = 2048;
    v14 = v8;
    v15 = 2048;
    v16 = 50000000;
    _os_log_impl(&dword_1A49EF000, v9, OS_LOG_TYPE_INFO, "ATXSFL SF: %@ timestamp separation (in nanosec) of %llu < %llu -- ignoring duplicate event", v12, 0x20u);

  }
  return 1;
}

- (ATXSearchFeedbackListener)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXSearchFeedbackListener *v8;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  +[ATXEngagementRecordManager sharedInstance](ATXEngagementRecordManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = -[ATXSearchFeedbackListener initWithTarget:spotlightUIBiomeStream:engagementRecordManager:actionClient:tracker:](self, "initWithTarget:spotlightUIBiomeStream:engagementRecordManager:actionClient:tracker:", v3, v4, v5, v6, v7);

  return v8;
}

- (ATXSearchFeedbackListener)initWithTarget:(id)a3 spotlightUIBiomeStream:(id)a4 engagementRecordManager:(id)a5 actionClient:(id)a6 tracker:(id)a7
{
  id v13;
  id v14;
  id v15;
  ATXSearchFeedbackListener *v16;
  NSObject *v17;
  NSString *currentQuery;
  uint64_t v19;
  NSMutableSet *visibleAppUUIDs;
  uint64_t v21;
  NSMutableSet *visibleActionUUIDs;
  uint64_t v23;
  NSMutableSet *visibleAppBundleIds;
  uint64_t v25;
  NSMutableSet *visibleActionContextIdentifiers;
  ATXSuggestionSearchResult *currentResultCard;
  uint64_t v28;
  NSMutableArray *queuedEvents;
  uint64_t v30;
  PETGoalConversionEventTracker *apAppPredictionsShownTracker;
  id v33;
  id v34;
  uint8_t buf[16];
  objc_super v36;

  v34 = a3;
  v33 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v36.receiver = self;
  v36.super_class = (Class)ATXSearchFeedbackListener;
  v16 = -[ATXSearchFeedbackListener init](&v36, sel_init);
  if (v16)
  {
    __atxlog_handle_feedback();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "ATXSFL SF: initializing ATXSearchFeedbackListener -- process likely just (re)started", buf, 2u);
    }

    objc_storeStrong((id *)&v16->_target, a3);
    objc_storeStrong((id *)&v16->_spotlightUIBiomeStream, a4);
    objc_storeStrong((id *)&v16->_engagementRecordManager, a5);
    objc_storeStrong((id *)&v16->_actionPredictionClient, a6);
    objc_storeStrong((id *)&v16->_tracker, a7);
    currentQuery = v16->_currentQuery;
    v16->_currentQuery = 0;

    v16->_didSearchDuringSession = 0;
    v19 = objc_opt_new();
    visibleAppUUIDs = v16->_visibleAppUUIDs;
    v16->_visibleAppUUIDs = (NSMutableSet *)v19;

    v21 = objc_opt_new();
    visibleActionUUIDs = v16->_visibleActionUUIDs;
    v16->_visibleActionUUIDs = (NSMutableSet *)v21;

    v23 = objc_opt_new();
    visibleAppBundleIds = v16->_visibleAppBundleIds;
    v16->_visibleAppBundleIds = (NSMutableSet *)v23;

    v25 = objc_opt_new();
    visibleActionContextIdentifiers = v16->_visibleActionContextIdentifiers;
    v16->_visibleActionContextIdentifiers = (NSMutableSet *)v25;

    currentResultCard = v16->_currentResultCard;
    v16->_currentResultCard = 0;

    v16->_hasSeenSearchViewDidAppear = 0;
    v16->_viewAppearEvent = 0;
    v28 = objc_opt_new();
    queuedEvents = v16->_queuedEvents;
    v16->_queuedEvents = (NSMutableArray *)v28;

    *(_WORD *)&v16->_currentSessionHasEngagement = 0;
    v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0D80F30]), "initWithFeatureId:opportunityEvent:conversionEvent:registerProperties:", CFSTR("AppPredictions"), CFSTR("spotlightZkwStart"), CFSTR("appPredictionsShown"), 0, v33, v34);
    apAppPredictionsShownTracker = v16->_apAppPredictionsShownTracker;
    v16->_apAppPredictionsShownTracker = (PETGoalConversionEventTracker *)v30;

  }
  return v16;
}

- (void)_resetState
{
  NSString *currentQuery;
  ATXSuggestionSearchResult *currentResultCard;
  NSString *appBlendingCacheId;
  NSString *actionBlendingCacheId;

  currentQuery = self->_currentQuery;
  self->_currentQuery = 0;

  self->_didSearchDuringSession = 0;
  -[NSMutableSet removeAllObjects](self->_visibleAppUUIDs, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_visibleActionUUIDs, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_visibleAppBundleIds, "removeAllObjects");
  -[NSMutableSet removeAllObjects](self->_visibleActionContextIdentifiers, "removeAllObjects");
  currentResultCard = self->_currentResultCard;
  self->_currentResultCard = 0;

  appBlendingCacheId = self->_appBlendingCacheId;
  self->_appBlendingCacheId = 0;

  actionBlendingCacheId = self->_actionBlendingCacheId;
  self->_actionBlendingCacheId = 0;

  self->_hasSeenSearchViewDidAppear = 0;
  self->_viewAppearEvent = 0;
  -[NSMutableArray removeAllObjects](self->_queuedEvents, "removeAllObjects");
}

- (void)_logAppPredictionsShown
{
  -[PETGoalConversionEventTracker trackGoalOpportunityEventWithConversion:propertyValues:](self->_apAppPredictionsShownTracker, "trackGoalOpportunityEventWithConversion:propertyValues:", -[NSMutableSet count](self->_visibleAppUUIDs, "count") != 0, 0);
}

- (void)_tryRemoveLockscreenActionPredictionMatchingSuggestion:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_feedback();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXSFL: attempting to remove engaged action suggestion from lockscreen %@", (uint8_t *)&v6, 0xCu);
  }

  -[ATXActionPredictionClient removeActionPredictionNotificationsMatchingSuggestion:reply:](self->_actionPredictionClient, "removeActionPredictionNotificationsMatchingSuggestion:reply:", v4, 0);
}

- (void)_logCAActionWithIdentifier:(id)a3 suggestion:(id)a4 eventType:(int64_t)a5
{
  NSObject *v8;
  id v9;

  v8 = a3;
  v9 = a4;
  if (v8 || (v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0D81138]), "initWithProactiveSuggestion:", v9)) != 0)
  {
    -[ATXSearchFeedbackListener _logCAActionWithIdentifiers:eventType:](self, "_logCAActionWithIdentifiers:eventType:", v8, a5);
  }
  else
  {
    __atxlog_handle_blending();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ATXSearchFeedbackListener _logCAActionWithIdentifier:suggestion:eventType:].cold.1(v9, v8);
  }

}

- (void)_logCAActionWithIdentifiers:(id)a3 eventType:(int64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = (objc_class *)MEMORY[0x1E0D81208];
  v7 = a3;
  v8 = [v6 alloc];
  objc_msgSend(v7, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "subtype");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "context");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(v8, "initWithType:suggestionUniqueId:suggestionType:suggestionSubtype:suggestionContext:", a4, v9, CFSTR("action"), v10, v11);
  -[ATXSearchFeedbackListener _sendSpotlightUIEvent:](self, "_sendSpotlightUIEvent:", v12);

}

- (void)writeSpotlightEvent:(id)a3 isViewAppearEvent:(BOOL)a4
{
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4)
  {
    -[ATXSearchFeedbackListenerTarget writeSpotlightEvent:](self->_target, "writeSpotlightEvent:", v6);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = self->_queuedEvents;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          -[ATXSearchFeedbackListenerTarget writeSpotlightEvent:](self->_target, "writeSpotlightEvent:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i), (_QWORD)v12);
        }
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

    -[NSMutableArray removeAllObjects](self->_queuedEvents, "removeAllObjects");
    self->_hasSeenSearchViewDidAppear = 1;
  }
  else if (self->_hasSeenSearchViewDidAppear)
  {
    -[ATXSearchFeedbackListenerTarget writeSpotlightEvent:](self->_target, "writeSpotlightEvent:", v6);
  }
  else
  {
    -[NSMutableArray addObject:](self->_queuedEvents, "addObject:", v6);
  }

}

- (void)sendUpdateNotification
{
  notify_post("com.apple.duetexpertd.feedbackavailable");
}

- (void)searchViewDidAppear:(id)a3
{
  id v5;
  ATXSearchFeedbackListener *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int v12;
  int v13;
  const char *v14;
  const char *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.searchViewDidAppear, objc_msgSend(v5, "timestamp"), a2))
  {
    v6 = self;
    objc_sync_enter(v6);
    __atxlog_handle_feedback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v11 = objc_msgSend(v5, "viewAppearEvent");
      v12 = objc_msgSend(v5, "isOnLockScreen");
      v13 = objc_msgSend(v5, "isOverApp");
      v14 = "NO";
      v16 = 134218754;
      v17 = v11;
      if (v12)
        v15 = "YES";
      else
        v15 = "NO";
      v18 = 2112;
      v19 = v5;
      if (v13)
        v14 = "YES";
      v20 = 2080;
      v21 = v15;
      v22 = 2080;
      v23 = v14;
      _os_log_debug_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: searchViewDidAppear, event:%lu, feedback:%@, isOnLockscreen:%s, isOverApp:%s", (uint8_t *)&v16, 0x2Au);
    }

    v6->_viewAppearEvent = objc_msgSend(v5, "viewAppearEvent");
    v8 = (void *)objc_opt_new();
    +[ATXSpotlightEvent viewAppearedEventWithSFFeedback:date:](ATXSpotlightEvent, "viewAppearedEventWithSFFeedback:date:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXSearchFeedbackListener writeSpotlightEvent:isViewAppearEvent:](v6, "writeSpotlightEvent:isViewAppearEvent:", v9, 1);
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81208]), "initWithType:suggestionUniqueId:suggestionType:suggestionSubtype:suggestionContext:", 6, 0, 0, 0, 0);
    -[ATXSearchFeedbackListener _sendSpotlightUIEvent:](v6, "_sendSpotlightUIEvent:", v10);

    objc_sync_exit(v6);
  }

}

- (void)searchViewDidDisappear:(id)a3
{
  id v5;
  ATXSearchFeedbackListener *v6;
  NSObject *v7;
  _BOOL4 didSearchDuringSession;
  void *v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.searchViewDidDisappear, objc_msgSend(v5, "timestamp"), a2))
  {
    v6 = self;
    objc_sync_enter(v6);
    __atxlog_handle_feedback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[ATXSearchFeedbackListener searchViewDidDisappear:].cold.1((uint64_t)v5, (uint64_t)v11, objc_msgSend(v5, "viewDisappearEvent"));

    didSearchDuringSession = v6->_didSearchDuringSession;
    v9 = (void *)objc_opt_new();
    +[ATXSpotlightEvent viewDisappearedEventWithDidSearch:date:](ATXSpotlightEvent, "viewDisappearedEventWithDidSearch:date:", didSearchDuringSession, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXSearchFeedbackListener writeSpotlightEvent:isViewAppearEvent:](v6, "writeSpotlightEvent:isViewAppearEvent:", v10, 0);
    -[ATXSearchFeedbackListener sendUpdateNotification](v6, "sendUpdateNotification");
    -[ATXSearchFeedbackListener _logAppPredictionsShown](v6, "_logAppPredictionsShown");
    -[ATXSearchFeedbackListener _resetState](v6, "_resetState");
    v6->_previousSessionHadEngagement = v6->_currentSessionHasEngagement;
    v6->_currentSessionHasEngagement = 0;

    objc_sync_exit(v6);
  }

}

- (void)logEngagedSpotlightActionSuggestion:(id)a3 contextActionIdentifier:(id)a4
{
  NSString *actionBlendingCacheId;
  NSString *currentQuery;
  id v8;
  id v9;
  void *v10;
  id v11;

  actionBlendingCacheId = self->_actionBlendingCacheId;
  currentQuery = self->_currentQuery;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  +[ATXSpotlightEvent actionSuggestionTappedEventWithSuggestion:actionBlendingCacheId:currentQuery:date:](ATXSpotlightEvent, "actionSuggestionTappedEventWithSuggestion:actionBlendingCacheId:currentQuery:date:", v9, actionBlendingCacheId, currentQuery, v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  -[ATXSearchFeedbackListener writeSpotlightEvent:isViewAppearEvent:](self, "writeSpotlightEvent:isViewAppearEvent:", v11, 0);
  -[ATXEngagementRecordManager addEngagedSuggestion:engagementRecordType:](self->_engagementRecordManager, "addEngagedSuggestion:engagementRecordType:", v9, 1);
  -[ATXSearchFeedbackListener _tryRemoveLockscreenActionPredictionMatchingSuggestion:](self, "_tryRemoveLockscreenActionPredictionMatchingSuggestion:", v9);
  +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:](ATXMFeedbackConversionLogger, "logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:", 0, 21, self->_tracker);
  +[ATXBlendingCaptureRateTracker logSpotlightActionCaptureWithTracker:](ATXBlendingCaptureRateTracker, "logSpotlightActionCaptureWithTracker:", self->_tracker);
  +[ATXBlendingCaptureRateTracker logSpotlightAppDiversionWithCaptureType:tracker:](ATXBlendingCaptureRateTracker, "logSpotlightAppDiversionWithCaptureType:tracker:", 2000, self->_tracker);
  -[ATXSearchFeedbackListener _logCAActionWithIdentifier:suggestion:eventType:](self, "_logCAActionWithIdentifier:suggestion:eventType:", v8, v9, 4);

}

- (void)didEngageResult:(id)a3
{
  id v5;
  ATXSearchFeedbackListener *v6;
  NSObject *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  NSString *appBlendingCacheId;
  NSString *currentQuery;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  char v29;
  uint64_t v30;
  ATXSuggestionSearchResult *currentResultCard;
  void *v32;
  char v33;
  uint64_t v34;
  ATXSuggestionSearchResult *v35;
  void *v36;
  char v37;
  uint64_t v38;
  ATXSuggestionSearchResult *v39;
  void *v40;
  char v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  id v58;
  uint64_t v59;
  NSObject *v60;
  void *v61;
  int v62;
  uint64_t v63;
  __int16 v64;
  uint64_t v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  int v69;
  __int16 v70;
  int v71;
  __int16 v72;
  id v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.didEngageResult, objc_msgSend(v5, "timestamp"), a2))
  {
    v6 = self;
    objc_sync_enter(v6);
    __atxlog_handle_feedback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v45 = objc_msgSend(v5, "triggerEvent");
      v46 = objc_msgSend(v5, "destination");
      v47 = objc_msgSend(v5, "actionTarget");
      v48 = objc_msgSend(v5, "actionEngaged");
      v49 = objc_msgSend(v5, "matchesUnengagedSuggestion");
      objc_msgSend(v5, "result");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = 134219522;
      v63 = v45;
      v64 = 2048;
      v65 = v46;
      v66 = 2048;
      v67 = v47;
      v68 = 1024;
      v69 = v48;
      v70 = 1024;
      v71 = v49;
      v72 = 2112;
      v73 = v5;
      v74 = 2112;
      v75 = v50;
      _os_log_debug_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: didEngageResult, event:%lu, destination:%lu, actionTarget:%lu, actionEngaged:%{BOOL}d, matchedUnengagedSuggestion:%{BOOL}d, feedback:%@, result:%@", (uint8_t *)&v62, 0x40u);

    }
    if (objc_msgSend(v5, "triggerEvent") == 2
      && objc_msgSend(v5, "destination") == 2
      && !objc_msgSend(v5, "actionTarget"))
    {
      objc_msgSend(v5, "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        objc_msgSend(v5, "result");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "proactiveSuggestion");
        v11 = objc_claimAutoreleasedReturnValue();

        -[NSObject uuid](v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "UUIDString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        __atxlog_handle_feedback();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          -[NSObject bundleIdExecutableObject](v11, "bundleIdExecutableObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v62 = 138412290;
          v63 = (uint64_t)v15;
          _os_log_impl(&dword_1A49EF000, v14, OS_LOG_TYPE_DEFAULT, "ATXSFL: didEngageResult app bundle id: %@", (uint8_t *)&v62, 0xCu);

        }
        appBlendingCacheId = v6->_appBlendingCacheId;
        if (appBlendingCacheId)
        {
          currentQuery = v6->_currentQuery;
          v18 = (void *)objc_opt_new();
          +[ATXSpotlightEvent appSuggestionTappedEventWithSuggestion:appBlendingCacheId:currentQuery:date:](ATXSpotlightEvent, "appSuggestionTappedEventWithSuggestion:appBlendingCacheId:currentQuery:date:", v11, appBlendingCacheId, currentQuery, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          -[ATXSearchFeedbackListener writeSpotlightEvent:isViewAppearEvent:](v6, "writeSpotlightEvent:isViewAppearEvent:", v19, 0);
          -[ATXEngagementRecordManager addEngagedSuggestion:engagementRecordType:](v6->_engagementRecordManager, "addEngagedSuggestion:engagementRecordType:", v11, 1);

        }
        +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:](ATXMFeedbackConversionLogger, "logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:", 0, 9, v6->_tracker);
        +[ATXBlendingCaptureRateTracker logSpotlightAppCaptureWithTracker:](ATXBlendingCaptureRateTracker, "logSpotlightAppCaptureWithTracker:", v6->_tracker);
        __atxlog_handle_feedback();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[ATXSearchFeedbackListener didEngageResult:].cold.1();

LABEL_68:
LABEL_69:
        v6->_currentSessionHasEngagement = 1;
        objc_sync_exit(v6);

        goto LABEL_70;
      }
    }
    if (objc_msgSend(v5, "triggerEvent") == 2
      && objc_msgSend(v5, "destination") == 3
      && !objc_msgSend(v5, "actionTarget"))
    {
      objc_msgSend(v5, "result");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v22 = objc_opt_isKindOfClass();

      if ((v22 & 1) != 0)
      {
        objc_msgSend(v5, "result");
        v11 = objc_claimAutoreleasedReturnValue();
        -[NSObject proactiveSuggestion](v11, "proactiveSuggestion");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "UUIDString");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject contextActionIdentifier](v11, "contextActionIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXSearchFeedbackListener logEngagedSpotlightActionSuggestion:contextActionIdentifier:](v6, "logEngagedSpotlightActionSuggestion:contextActionIdentifier:", v23, v26);

        __atxlog_handle_feedback();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          -[ATXSearchFeedbackListener didEngageResult:].cold.2();

        goto LABEL_68;
      }
    }
    if (objc_msgSend(v5, "triggerEvent") == 2
      && objc_msgSend(v5, "destination") == 2
      && !objc_msgSend(v5, "actionTarget"))
    {
      objc_msgSend(v5, "result");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v29 = objc_opt_isKindOfClass();

      if ((v29 & 1) != 0)
      {
        objc_msgSend(v5, "result");
        v30 = objc_claimAutoreleasedReturnValue();
        currentResultCard = v6->_currentResultCard;
        v6->_currentResultCard = (ATXSuggestionSearchResult *)v30;

        __atxlog_handle_feedback();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[ATXSearchFeedbackListener didEngageResult:].cold.3();
        goto LABEL_68;
      }
    }
    if (objc_msgSend(v5, "triggerEvent") == 5
      && objc_msgSend(v5, "destination") == 1
      && !objc_msgSend(v5, "actionTarget"))
    {
      objc_msgSend(v5, "result");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v33 = objc_opt_isKindOfClass();

      if ((v33 & 1) != 0)
      {
        objc_msgSend(v5, "result");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = v6->_currentResultCard;
        v6->_currentResultCard = (ATXSuggestionSearchResult *)v34;

        __atxlog_handle_feedback();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[ATXSearchFeedbackListener didEngageResult:].cold.4();
        goto LABEL_68;
      }
    }
    if (objc_msgSend(v5, "triggerEvent") == 2
      && objc_msgSend(v5, "destination") == 1
      && !objc_msgSend(v5, "actionTarget"))
    {
      objc_msgSend(v5, "result");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v37 = objc_opt_isKindOfClass();

      if ((v37 & 1) != 0)
      {
        objc_msgSend(v5, "result");
        v38 = objc_claimAutoreleasedReturnValue();
        v39 = v6->_currentResultCard;
        v6->_currentResultCard = (ATXSuggestionSearchResult *)v38;

        __atxlog_handle_feedback();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          -[ATXSearchFeedbackListener didEngageResult:].cold.5();
        goto LABEL_68;
      }
    }
    if (objc_msgSend(v5, "triggerEvent") != 2)
      goto LABEL_69;
    if (objc_msgSend(v5, "actionTarget"))
      goto LABEL_69;
    objc_msgSend(v5, "result");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    getSFSearchResult_SpotlightExtrasClass();
    v41 = objc_opt_isKindOfClass();

    if ((v41 & 1) == 0)
      goto LABEL_69;
    objc_msgSend(v5, "result");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject applicationBundleIdentifier](v11, "applicationBundleIdentifier");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSObject predictionsFeedbackActionType](v11, "predictionsFeedbackActionType") == 3)
    {
      v43 = v42;
      if (-[NSMutableSet count](v6->_visibleActionUUIDs, "count"))
        +[ATXBlendingCaptureRateTracker logSpotlightActionDiversionWithCaptureType:tracker:](ATXBlendingCaptureRateTracker, "logSpotlightActionDiversionWithCaptureType:tracker:", 3001, v6->_tracker);
      v44 = 3;
      if (!v42)
      {
LABEL_63:
        v54 = 0;
        goto LABEL_65;
      }
    }
    else if (-[NSObject predictionsFeedbackActionType](v11, "predictionsFeedbackActionType") == 1)
    {
      v51 = v42;
      if (-[NSMutableSet count](v6->_visibleActionUUIDs, "count"))
        +[ATXBlendingCaptureRateTracker logSpotlightActionDiversionWithCaptureType:tracker:](ATXBlendingCaptureRateTracker, "logSpotlightActionDiversionWithCaptureType:tracker:", 3001, v6->_tracker);
      v44 = 1;
      if (!v42)
        goto LABEL_63;
    }
    else
    {
      if (!objc_msgSend(v42, "length")
        || (objc_msgSend(v42, "hasPrefix:", CFSTR("com.apple.other")) & 1) != 0
        || objc_msgSend(v5, "destination") != 2
        || (objc_msgSend(v5, "result"),
            v55 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v55, "sectionBundleIdentifier"),
            v56 = (void *)objc_claimAutoreleasedReturnValue(),
            v57 = objc_msgSend(v56, "isEqualToString:", CFSTR("com.apple.application")),
            v56,
            v55,
            !v57))
      {
        v54 = 0;
        v44 = 4;
        goto LABEL_65;
      }
      v58 = v42;
      if (-[NSMutableSet count](v6->_visibleAppBundleIds, "count"))
      {
        if (-[NSMutableSet containsObject:](v6->_visibleAppBundleIds, "containsObject:", v58))
          v59 = 2002;
        else
          v59 = 2001;
        +[ATXBlendingCaptureRateTracker logSpotlightAppDiversionWithCaptureType:tracker:](ATXBlendingCaptureRateTracker, "logSpotlightAppDiversionWithCaptureType:tracker:", v59, v6->_tracker);
      }
      v44 = 4;
      if (!v42)
        goto LABEL_63;
    }
    v52 = (void *)objc_opt_new();
    +[ATXSpotlightEvent searchResultTappedWithEngagedBundleId:searchedActionType:date:](ATXSpotlightEvent, "searchResultTappedWithEngagedBundleId:searchedActionType:date:", v42, v44, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXSearchFeedbackListener writeSpotlightEvent:isViewAppearEvent:](v6, "writeSpotlightEvent:isViewAppearEvent:", v53, 0);
    v54 = v42;
LABEL_65:
    __atxlog_handle_feedback();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      +[ATXActionPredictionTypes actionTypeToString:](ATXActionPredictionTypes, "actionTypeToString:", v44);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSearchFeedbackListener didEngageResult:].cold.6((uint64_t)v54, v61, (uint64_t)&v62, v60);
    }

    goto LABEL_68;
  }
LABEL_70:

}

- (void)cardViewDidDisappear:(id)a3
{
  id v4;
  ATXSearchFeedbackListener *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSString *actionBlendingCacheId;
  void *v11;
  void *v12;
  NSObject *v13;
  ATXSuggestionSearchResult *currentResultCard;
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  __atxlog_handle_feedback();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXSearchFeedbackListener cardViewDidDisappear:].cold.3((uint64_t)v4, (uint64_t)v15, objc_msgSend(v4, "cardDisappearEvent"));

  if (v5->_currentResultCard && v5->_appBlendingCacheId && v5->_actionBlendingCacheId)
  {
    if (objc_msgSend(v4, "cardDisappearEvent") == 7)
    {
      -[ATXSuggestionSearchResult proactiveSuggestion](v5->_currentResultCard, "proactiveSuggestion");
      v7 = objc_claimAutoreleasedReturnValue();
      -[NSObject uuid](v7, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      actionBlendingCacheId = v5->_actionBlendingCacheId;
      v11 = (void *)objc_opt_new();
      +[ATXSpotlightEvent actionSuggestionDismissedEventWithSuggestionId:actionBlendingCacheId:date:](ATXSpotlightEvent, "actionSuggestionDismissedEventWithSuggestionId:actionBlendingCacheId:date:", v9, actionBlendingCacheId, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[ATXSearchFeedbackListener writeSpotlightEvent:isViewAppearEvent:](v5, "writeSpotlightEvent:isViewAppearEvent:", v12, 0);
      -[ATXEngagementRecordManager addEngagedSuggestion:engagementRecordType:](v5->_engagementRecordManager, "addEngagedSuggestion:engagementRecordType:", v7, 1);
      -[ATXSearchFeedbackListener _tryRemoveLockscreenActionPredictionMatchingSuggestion:](v5, "_tryRemoveLockscreenActionPredictionMatchingSuggestion:", v7);
      +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:](ATXMFeedbackConversionLogger, "logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:", 1, 21, v5->_tracker);
      __atxlog_handle_feedback();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        -[ATXSearchFeedbackListener cardViewDidDisappear:].cold.1();

    }
    else
    {
      __atxlog_handle_feedback();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[ATXSearchFeedbackListener cardViewDidDisappear:].cold.2();
    }

    currentResultCard = v5->_currentResultCard;
    v5->_currentResultCard = 0;

  }
  objc_sync_exit(v5);

}

- (void)didEngageCardSection:(id)a3
{
  id v5;
  ATXSearchFeedbackListener *v6;
  NSObject *v7;
  void *v8;
  ATXSuggestionSearchResult *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  ATXSuggestionSearchResult *currentResultCard;
  NSString *actionBlendingCacheId;
  NSString *currentQuery;
  void *v21;
  void *v22;
  void *v23;
  ATXSuggestionSearchResult *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  __int16 v30;
  id v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!-[ATXSearchFeedbackListener _isDuplicateEventWithState:timestamp:method:](self, "_isDuplicateEventWithState:timestamp:method:", &self->_debounce.didEngageCardSection, objc_msgSend(v5, "timestamp"), a2))
  {
    v6 = self;
    objc_sync_enter(v6);
    __atxlog_handle_feedback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v25 = objc_msgSend(v5, "triggerEvent");
      objc_msgSend(v5, "destination");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = 134219010;
      v29 = v25;
      v30 = 2112;
      v31 = v5;
      v32 = 2112;
      v33 = v26;
      v34 = 2048;
      v35 = objc_msgSend(v5, "actionCardType");
      v36 = 2048;
      v37 = objc_msgSend(v5, "actionTarget");
      _os_log_debug_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEBUG, "ATXSFL SF: didEngageCardSection, event:%lu, feedback:%@, destination:%@, actionCardType:%lu, actionTarget:%lu", (uint8_t *)&v28, 0x34u);

    }
    if (objc_msgSend(v5, "triggerEvent") == 2
      && !objc_msgSend(v5, "actionCardType")
      && (objc_msgSend(v5, "destination"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      && (v15 = objc_msgSend(v5, "actionTarget") == 0, v14, v15))
    {
      -[ATXSuggestionSearchResult proactiveSuggestion](v6->_currentResultCard, "proactiveSuggestion");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      currentResultCard = v6->_currentResultCard;
      if (!currentResultCard)
        goto LABEL_22;
      if (!v6->_appBlendingCacheId)
        goto LABEL_21;
      actionBlendingCacheId = v6->_actionBlendingCacheId;
      if (!actionBlendingCacheId)
        goto LABEL_21;
      currentQuery = v6->_currentQuery;
      v21 = (void *)objc_opt_new();
      +[ATXSpotlightEvent actionSuggestionTappedEventWithSuggestion:actionBlendingCacheId:currentQuery:date:](ATXSpotlightEvent, "actionSuggestionTappedEventWithSuggestion:actionBlendingCacheId:currentQuery:date:", v8, actionBlendingCacheId, currentQuery, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      -[ATXSearchFeedbackListener writeSpotlightEvent:isViewAppearEvent:](v6, "writeSpotlightEvent:isViewAppearEvent:", v22, 0);
      -[ATXEngagementRecordManager addEngagedSuggestion:engagementRecordType:](v6->_engagementRecordManager, "addEngagedSuggestion:engagementRecordType:", v8, 1);
      -[ATXSearchFeedbackListener _tryRemoveLockscreenActionPredictionMatchingSuggestion:](v6, "_tryRemoveLockscreenActionPredictionMatchingSuggestion:", v8);
      +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:](ATXMFeedbackConversionLogger, "logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:", 0, 21, v6->_tracker);
      +[ATXBlendingCaptureRateTracker logSpotlightActionCaptureWithTracker:](ATXBlendingCaptureRateTracker, "logSpotlightActionCaptureWithTracker:", v6->_tracker);
      +[ATXBlendingCaptureRateTracker logSpotlightAppDiversionWithCaptureType:tracker:](ATXBlendingCaptureRateTracker, "logSpotlightAppDiversionWithCaptureType:tracker:", 2000, v6->_tracker);

      currentResultCard = v6->_currentResultCard;
      if (!currentResultCard)
      {
LABEL_22:
        v24 = 0;
      }
      else
      {
LABEL_21:
        -[ATXSuggestionSearchResult contextActionIdentifier](currentResultCard, "contextActionIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXSearchFeedbackListener _logCAActionWithIdentifier:suggestion:eventType:](v6, "_logCAActionWithIdentifier:suggestion:eventType:", v23, v8, 4);

        v24 = v6->_currentResultCard;
      }
      v6->_currentResultCard = 0;

      __atxlog_handle_feedback();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        -[ATXSearchFeedbackListener didEngageCardSection:].cold.2();

    }
    else
    {
      if (objc_msgSend(v5, "triggerEvent") != 2 || objc_msgSend(v5, "actionCardType") != 1)
        goto LABEL_27;
      objc_msgSend(v5, "destination");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        if (objc_msgSend(v5, "actionTarget"))
        {
LABEL_27:
          objc_sync_exit(v6);

          goto LABEL_28;
        }
        v9 = v6->_currentResultCard;
        if (v9)
        {
          -[ATXSuggestionSearchResult contextActionIdentifier](v9, "contextActionIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXSearchFeedbackListener _logCAActionWithIdentifier:suggestion:eventType:](v6, "_logCAActionWithIdentifier:suggestion:eventType:", v10, 0, 4);

        }
        __atxlog_handle_feedback();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          -[ATXSuggestionSearchResult contextActionIdentifier](v6->_currentResultCard, "contextActionIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "uniqueIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXSearchFeedbackListener didEngageCardSection:].cold.1(v13, (uint8_t *)&v28, v11, v12);
        }

        v8 = v6->_currentResultCard;
        v6->_currentResultCard = 0;
      }
    }

    goto LABEL_27;
  }
LABEL_28:

}

- (void)didPerformCommand:(id)a3
{
  ATXSpotlightFeedbackManager *v4;
  NSObject *v5;
  ATXSpotlightFeedbackManager *v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  void *v10;
  ATXSpotlightFeedbackManager *v11;
  NSObject *v12;
  NSObject *v13;
  ATXSpotlightFeedbackManager *v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  ATXSpotlightFeedbackManager *v18;
  NSObject *v19;
  int v20;
  ATXSpotlightFeedbackManager *v21;
  int v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  int v26;
  NSObject *v27;
  int v28;
  ATXSpotlightFeedbackManager *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  ATXSpotlightFeedbackManager *v41;
  __int16 v42;
  NSObject *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = (ATXSpotlightFeedbackManager *)a3;
  __atxlog_handle_zkw_hide();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[ATXSpotlightFeedbackManager command](v4, "command");
    v6 = (ATXSpotlightFeedbackManager *)objc_claimAutoreleasedReturnValue();
    v40 = 138412290;
    v41 = v6;
    _os_log_impl(&dword_1A49EF000, v5, OS_LOG_TYPE_DEFAULT, "ATXSFL: didPerformCommand ---> %@", (uint8_t *)&v40, 0xCu);

  }
  -[ATXSearchFeedbackListener _sendSpotlightUIStreamAppEngageWithFeedback:](self, "_sendSpotlightUIStreamAppEngageWithFeedback:", v4);
  -[ATXSpotlightFeedbackManager result](v4, "result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXSearchFeedbackListener _sendSpotlightUIStreamEventType:searchResult:](self, "_sendSpotlightUIStreamEventType:searchResult:", 4, v7);
  -[ATXSpotlightFeedbackManager command](v4, "command");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[ATXSpotlightFeedbackManager command](v4, "command");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSearchFeedbackListener bundleIdentifierFromResult:](self, "bundleIdentifierFromResult:", v7);
    v11 = (ATXSpotlightFeedbackManager *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_zkw_hide();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v40 = 138412290;
      v41 = v11;
      _os_log_impl(&dword_1A49EF000, v12, OS_LOG_TYPE_DEFAULT, "ATXSFL: bundleId ---> %@", (uint8_t *)&v40, 0xCu);
    }

    __atxlog_handle_zkw_hide();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v7, "identifier");
      v14 = (ATXSpotlightFeedbackManager *)objc_claimAutoreleasedReturnValue();
      v40 = 138412290;
      v41 = v14;
      _os_log_impl(&dword_1A49EF000, v13, OS_LOG_TYPE_DEFAULT, "ATXSFL: searchResultIdentifier ---> %@", (uint8_t *)&v40, 0xCu);

    }
    __atxlog_handle_zkw_hide();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v10, "category");
      v40 = 67109120;
      LODWORD(v41) = v16;
      _os_log_impl(&dword_1A49EF000, v15, OS_LOG_TYPE_DEFAULT, "ATXSFL: category ---> %d", (uint8_t *)&v40, 8u);
    }

    __atxlog_handle_zkw_hide();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "proactiveIdentifier");
      v18 = (ATXSpotlightFeedbackManager *)objc_claimAutoreleasedReturnValue();
      v40 = 138412290;
      v41 = v18;
      _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "ATXSFL: proactiveIdentifier ---> %@", (uint8_t *)&v40, 0xCu);

    }
    __atxlog_handle_zkw_hide();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = objc_msgSend(v10, "shouldClearWholeSection");
      v40 = 67109120;
      LODWORD(v41) = v20;
      _os_log_impl(&dword_1A49EF000, v19, OS_LOG_TYPE_DEFAULT, "ATXSFL: shouldClearWholeSection ---> %{BOOL}d", (uint8_t *)&v40, 8u);
    }

    v21 = objc_alloc_init(ATXSpotlightFeedbackManager);
    switch(objc_msgSend(v10, "category"))
    {
      case 0u:
        __atxlog_handle_zkw_hide();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          v26 = objc_msgSend(v10, "category");
          v40 = 67109120;
          LODWORD(v41) = v26;
          _os_log_impl(&dword_1A49EF000, v25, OS_LOG_TYPE_DEFAULT, "ATXSFL: no hiding action for category %d", (uint8_t *)&v40, 8u);
        }
        goto LABEL_31;
      case 1u:
      case 2u:
        v22 = objc_msgSend(v10, "shouldClearWholeSection");
        __atxlog_handle_zkw_hide();
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        if (v22)
        {
          if (v24)
          {
            v40 = 138412290;
            v41 = v11;
            _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "ATXSFL: User disabled all shortcut suggestions from bundleId: %@", (uint8_t *)&v40, 0xCu);
          }

          -[ATXSpotlightFeedbackManager addHiddenAutoShortcutIdentifier:](v21, "addHiddenAutoShortcutIdentifier:", v11);
        }
        else
        {
          if (v24)
          {
            objc_msgSend(v7, "identifier");
            v29 = (ATXSpotlightFeedbackManager *)objc_claimAutoreleasedReturnValue();
            v40 = 138412290;
            v41 = v29;
            _os_log_impl(&dword_1A49EF000, v23, OS_LOG_TYPE_DEFAULT, "ATXSFL: User has hidden auto shortcut with signature: %@. Will not show this specific shortcut suggestion", (uint8_t *)&v40, 0xCu);

          }
          objc_msgSend(v7, "identifier");
          v25 = objc_claimAutoreleasedReturnValue();
          -[ATXSpotlightFeedbackManager stringByAppendingString:](v11, "stringByAppendingString:", v25);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXSpotlightFeedbackManager addHiddenAutoShortcutIdentifier:](v21, "addHiddenAutoShortcutIdentifier:", v30);

LABEL_31:
        }
LABEL_32:
        __atxlog_handle_zkw_hide();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "proactiveIdentifier");
          v32 = objc_claimAutoreleasedReturnValue();
          v40 = 138412546;
          v41 = v21;
          v42 = 2112;
          v43 = v32;
          _os_log_impl(&dword_1A49EF000, v31, OS_LOG_TYPE_DEFAULT, "ATXSFL: feedbackManager %@ addHiddenActionExecutableIdentifier %@", (uint8_t *)&v40, 0x16u);

        }
        break;
      case 3u:
        objc_msgSend(v10, "proactiveIdentifier");
        v25 = objc_claimAutoreleasedReturnValue();
        -[ATXSpotlightFeedbackManager addHiddenContextIdentifier:](v21, "addHiddenContextIdentifier:", v25);
        goto LABEL_31;
      case 6u:
        __atxlog_handle_zkw_hide();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = objc_msgSend(v10, "category");
          v40 = 67109120;
          LODWORD(v41) = v28;
          _os_log_impl(&dword_1A49EF000, v27, OS_LOG_TYPE_DEFAULT, "ATXSFL: hiding app suggestion for category %d", (uint8_t *)&v40, 8u);
        }

        if (!objc_msgSend(v7, "isLocalApplicationResult"))
          goto LABEL_32;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_32;
        objc_msgSend(v7, "proactiveSuggestion");
        v25 = objc_claimAutoreleasedReturnValue();
        -[ATXSpotlightFeedbackManager addHiddenAppSuggestionBundleIdentifier:](v21, "addHiddenAppSuggestionBundleIdentifier:", v25);
        goto LABEL_31;
      default:
        objc_msgSend(v10, "proactiveIdentifier");
        v25 = objc_claimAutoreleasedReturnValue();
        -[ATXSpotlightFeedbackManager addHiddenActionExecutableIdentifier:](v21, "addHiddenActionExecutableIdentifier:", v25);
        goto LABEL_31;
    }
  }
  -[ATXSpotlightFeedbackManager result](v4, "result");
  v33 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v34 = v33;
    -[NSObject proactiveSuggestion](v34, "proactiveSuggestion");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_zkw_hide();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v35, "uiSpecification");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "title");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 138413058;
      v41 = v4;
      v42 = 2112;
      v43 = v34;
      v44 = 2112;
      v45 = (uint64_t)v38;
      v46 = 2112;
      v47 = v35;
      _os_log_impl(&dword_1A49EF000, v36, OS_LOG_TYPE_DEFAULT, "didPerformCommand ---> %@ result = %@ suggestion (%@) = %@", (uint8_t *)&v40, 0x2Au);

    }
  }
  else
  {
    __atxlog_handle_zkw_hide();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v39 = objc_opt_class();
      v40 = 138412802;
      v41 = v4;
      v42 = 2112;
      v43 = v33;
      v44 = 2112;
      v45 = v39;
      _os_log_impl(&dword_1A49EF000, v34, OS_LOG_TYPE_DEFAULT, "didPerformCommand ---> %@ result = %@ class = %@", (uint8_t *)&v40, 0x20u);
    }
  }

}

- (void)_sendSpotlightUIStreamAppEngageWithFeedback:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "command");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    __atxlog_handle_zkw_hide();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "result");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sectionBundleIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138412290;
      v23 = (uint64_t)v9;
      _os_log_impl(&dword_1A49EF000, v7, OS_LOG_TYPE_DEFAULT, "ATXSFL: sendSpotlightUIStreamAppEngageWithFeedback commandEngagementFeedback.result.sectionBundleIdentifier ='%@'", (uint8_t *)&v22, 0xCu);

    }
    objc_msgSend(v4, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.searchd.zkw.apps"));

    objc_msgSend(v4, "command");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationBundleIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "length"))
    {
      if (v12)
        v15 = 4;
      else
        v15 = 5;
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81208]), "initWithType:suggestionUniqueId:suggestionType:suggestionSubtype:suggestionContext:", v15, v14, CFSTR("app"), 0, 0);
      __atxlog_handle_feedback();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(v16, "eventType");
        objc_msgSend(v16, "suggestionType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "suggestionSubtype");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "suggestionUniqueId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 134218754;
        v23 = v18;
        v24 = 2112;
        v25 = v19;
        v26 = 2112;
        v27 = v20;
        v28 = 2112;
        v29 = v21;
        _os_log_impl(&dword_1A49EF000, v17, OS_LOG_TYPE_DEFAULT, "ATXSFL: uiEvent type%ld: %@ %@ %@", (uint8_t *)&v22, 0x2Au);

      }
      -[ATXSearchFeedbackListener _sendSpotlightUIEvent:](self, "_sendSpotlightUIEvent:", v16);

    }
  }

}

- (void)_sendSpotlightUIEvent:(id)a3
{
  id v4;
  uint64_t *p_viewAppearEvent;
  NSObject *v6;

  v4 = a3;
  p_viewAppearEvent = (uint64_t *)&self->_viewAppearEvent;
  if ((self->_viewAppearEvent | 8) == 0x1E)
  {
    -[ATXSpotlightUIBiomeStream sendEvent:](self->_spotlightUIBiomeStream, "sendEvent:", v4);
  }
  else
  {
    __atxlog_handle_metrics();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[ATXSearchFeedbackListener _sendSpotlightUIEvent:].cold.1(p_viewAppearEvent, v4, v6);

  }
}

- (id)_suggestionSubTypeStringWithResultType:(int)a3
{
  if (a3 > 0x27)
    return 0;
  else
    return off_1E4D5CAB0[a3];
}

- (id)bundleIdentifierFromResult:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  getSFSearchResult_SpotlightExtrasClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "relatedAppIdentifier");
  else
    objc_msgSend(v3, "applicationBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)shouldDebounce
{
  return self->_shouldDebounce;
}

- (void)setShouldDebounce:(BOOL)a3
{
  self->_shouldDebounce = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedEvents, 0);
  objc_storeStrong((id *)&self->_actionBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_appBlendingCacheId, 0);
  objc_storeStrong((id *)&self->_currentResultCard, 0);
  objc_storeStrong((id *)&self->_visibleActionContextIdentifiers, 0);
  objc_storeStrong((id *)&self->_visibleAppBundleIds, 0);
  objc_storeStrong((id *)&self->_visibleAppUUIDs, 0);
  objc_storeStrong((id *)&self->_visibleActionUUIDs, 0);
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_actionPredictionClient, 0);
  objc_storeStrong((id *)&self->_engagementRecordManager, 0);
  objc_storeStrong((id *)&self->_apAppPredictionsShownTracker, 0);
  objc_storeStrong((id *)&self->_spotlightUIBiomeStream, 0);
  objc_storeStrong((id *)&self->_target, 0);
}

- (void)_logCAActionWithIdentifier:(void *)a1 suggestion:(NSObject *)a2 eventType:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  uint8_t v6[12];
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "executableSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_2();
  v7 = 2112;
  v8 = a1;
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: nil: %@, %@", v6, 0x16u);

}

- (void)searchViewDidDisappear:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6_6(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A49EF000, v5, v3, "ATXSFL SF: searchViewDidDisappear, event:%lu, feedback:%@", v4);
}

- (void)resultsDidBecomeVisible:(_QWORD *)a3 .cold.1(void *a1, uint8_t *buf, _QWORD *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_1A49EF000, log, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: nil topic: %@", buf, 0xCu);

  OUTLINED_FUNCTION_7_5();
}

- (void)resultsDidBecomeVisible:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  v3 = 2048;
  v4 = 50000000;
  OUTLINED_FUNCTION_1_1(&dword_1A49EF000, v0, v1, "ATXSFL SF: resultsDidBecomeVisible handling was SKIPPED because previous session had engagement and within time interval of previous searchViewDidDisappear - separationNanosec: %llu, separationMax: %llu", v2);
  OUTLINED_FUNCTION_2();
}

- (void)didEngageResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXSFL: handled app prediction tap of uuid: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didEngageResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXSFL: handled action prediction engagement via JR running UI with uuid: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)didEngageResult:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "ATXSFL: handled action prediction NSUA or non-bg intent engagement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)didEngageResult:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "ATXSFL: handled user orb on action prediction card", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)didEngageResult:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "ATXSFL: handled action prediction tap on bg-exec intent, bringing up the platter", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)didEngageResult:(uint64_t)a3 .cold.6(uint64_t a1, void *a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_1_1(&dword_1A49EF000, a4, a3, "ATXSFL: handled engagement via search with engagedBundleId: %@ searchedActionType: %@", (uint8_t *)a3);

  OUTLINED_FUNCTION_7_5();
}

- (void)cardViewDidDisappear:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXSFL: handled action prediction explicit dismissal with uuid: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)cardViewDidDisappear:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3_3(&dword_1A49EF000, v0, v1, "ATXSFL: handled action card close", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)cardViewDidDisappear:(uint64_t)a3 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_6_6(a1, a2, a3, 3.8521e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A49EF000, v5, v3, "ATXSFL SF: cardViewDidDisappear, event:%lu, feedback:%@", v4);
}

- (void)didEngageCardSection:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A49EF000, log, OS_LOG_TYPE_DEBUG, "ATXSFL: handled action prediction engagement on card with identifier: %@", buf, 0xCu);

  OUTLINED_FUNCTION_7_5();
}

- (void)didEngageCardSection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_11(&dword_1A49EF000, v0, v1, "ATXSFL: handled action prediction engagement on card with uuid: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_sendSpotlightUIEvent:(NSObject *)a3 .cold.1(uint64_t *a1, void *a2, NSObject *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = *a1;
  objc_msgSend(MEMORY[0x1E0D81208], "stringForATXSpotlightUIEventType:", objc_msgSend(a2, "eventType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "eventType");
  objc_msgSend(a2, "suggestionType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "suggestionUniqueId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "suggestionSubtype");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "suggestionContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 134219522;
  v13 = v5;
  v14 = 2112;
  v15 = v6;
  v16 = 2048;
  v17 = v7;
  v18 = 2112;
  v19 = v8;
  v20 = 2112;
  v21 = v9;
  v22 = 2112;
  v23 = v10;
  v24 = 2112;
  v25 = v11;
  _os_log_debug_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_DEBUG, "SKIP type %lu: %@ - ATXSpotlightUIEvent\n\teventType: %lu\n\tsuggestionType: %@\n\tsuggestionUniqueId: %@\n\tsuggestionSubtype: %@\n\tsuggestionContext: %@", (uint8_t *)&v12, 0x48u);

}

@end
