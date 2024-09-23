@implementation ATXSingleSuggestionSessionTrackingContext

- (ATXSingleSuggestionSessionTrackingContext)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ATXSingleSuggestionSessionTrackingContext *v8;

  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = -[ATXSingleSuggestionSessionTrackingContext initWithMostRecentlySeenHomescreenBlendingCacheUUID:mostRecentAppSpotlightBlendingCacheUUID:mostRecentActionSpotlightBlendingCacheUUID:suggestionsWidgetIds:appPredictionPanelIds:mostRecentClientCacheUpdateUUIDByClientModelId:currentlyTrackedSessions:completedSessions:](self, "initWithMostRecentlySeenHomescreenBlendingCacheUUID:mostRecentAppSpotlightBlendingCacheUUID:mostRecentActionSpotlightBlendingCacheUUID:suggestionsWidgetIds:appPredictionPanelIds:mostRecentClientCacheUpdateUUIDByClientModelId:currentlyTrackedSessions:completedSessions:", 0, 0, 0, v3, v4, v5, v6, v7);

  return v8;
}

- (ATXSingleSuggestionSessionTrackingContext)initWithMostRecentlySeenHomescreenBlendingCacheUUID:(id)a3 mostRecentAppSpotlightBlendingCacheUUID:(id)a4 mostRecentActionSpotlightBlendingCacheUUID:(id)a5 suggestionsWidgetIds:(id)a6 appPredictionPanelIds:(id)a7 mostRecentClientCacheUpdateUUIDByClientModelId:(id)a8 currentlyTrackedSessions:(id)a9 completedSessions:(id)a10
{
  id v17;
  ATXSingleSuggestionSessionTrackingContext *v18;
  ATXSingleSuggestionSessionTrackingContext *v19;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v27 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v22 = a8;
  v21 = a9;
  v17 = a10;
  v28.receiver = self;
  v28.super_class = (Class)ATXSingleSuggestionSessionTrackingContext;
  v18 = -[ATXSingleSuggestionSessionTrackingContext init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_mostRecentHomescreenBlendingCacheUUID, a3);
    objc_storeStrong((id *)&v19->_mostRecentAppSpotlightBlendingCacheUUID, a4);
    objc_storeStrong((id *)&v19->_mostRecentActionSpotlightBlendingCacheUUID, a5);
    objc_storeStrong((id *)&v19->_suggestionsWidgetIds, a6);
    objc_storeStrong((id *)&v19->_appPredictionPanelIds, a7);
    objc_storeStrong((id *)&v19->_mostRecentClientCacheUpdateUUIDByClientModelId, a8);
    objc_storeStrong((id *)&v19->_currentlyTrackedSessions, a9);
    objc_storeStrong((id *)&v19->_completedSessions, a10);
  }

  return v19;
}

- (id)removeStoredCompletedSessionsAndReturnCompletedSessionsCopy
{
  void *v3;

  v3 = (void *)-[NSMutableArray copy](self->_completedSessions, "copy");
  -[NSMutableArray removeAllObjects](self->_completedSessions, "removeAllObjects");
  return v3;
}

- (id)clientModelIdsToConsider
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 23);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 44);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

- (id)_persistentIdentifierForSuggestion:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "clientModelSpecification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "clientModelId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "executableSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "executableIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@-%@"), v7, v9);

  return v10;
}

- (void)updateWithClientModelCacheUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  uint64_t v22;
  ATXSingleSuggestionSession *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  NSMutableDictionary *mostRecentClientCacheUpdateUUIDByClientModelId;
  void *v30;
  NSMutableDictionary *v31;
  __int128 v32;
  void *v33;
  uint64_t v34;
  id obj;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  NSObject *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXSingleSuggestionSessionTrackingContext _tryPruneSingleSuggestionSessionsIfOverMaxNum](self, "_tryPruneSingleSuggestionSessionsIfOverMaxNum");
  objc_msgSend(v4, "clientModelId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[ATXSingleSuggestionSessionTrackingContext clientModelIdsToConsider](self, "clientModelIdsToConsider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

    if (v7)
    {
      v33 = v5;
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v4, "suggestions");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v8)
      {
        v10 = v8;
        v11 = *(_QWORD *)v37;
        *(_QWORD *)&v9 = 138412802;
        v32 = v9;
        do
        {
          v12 = 0;
          v34 = v10;
          do
          {
            if (*(_QWORD *)v37 != v11)
              objc_enumerationMutation(obj);
            v13 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v12);
            -[ATXSingleSuggestionSessionTrackingContext _persistentIdentifierForSuggestion:](self, "_persistentIdentifierForSuggestion:", v13, v32);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary objectForKey:](self->_currentlyTrackedSessions, "objectForKey:", v14);
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = v15;
            if (v15)
            {
              -[NSObject associatedClientModelCacheUUIDs](v15, "associatedClientModelCacheUUIDs");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "uuid");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v17, "addObject:", v18);

              __atxlog_handle_metrics();
              v19 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
              {
                v20 = (objc_class *)objc_opt_class();
                NSStringFromClass(v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v32;
                v41 = v21;
                v42 = 2112;
                v43 = v33;
                v44 = 2112;
                v45 = v16;
                _os_log_debug_impl(&dword_1C9A3B000, v19, OS_LOG_TYPE_DEBUG, "%@ - updated existing suggestion session with new clientModelId: %@, %@", buf, 0x20u);

              }
            }
            else
            {
              v22 = v11;
              v23 = [ATXSingleSuggestionSession alloc];
              objc_msgSend(v4, "uuid");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "feedbackMetadata");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = -[ATXSingleSuggestionSession initWithTrackedProactiveSuggestion:clientModelCacheUUID:feedbackMetadata:](v23, "initWithTrackedProactiveSuggestion:clientModelCacheUUID:feedbackMetadata:", v13, v24, v25);

              -[NSMutableDictionary setObject:forKey:](self->_currentlyTrackedSessions, "setObject:forKey:", v19, v14);
              __atxlog_handle_metrics();
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
              {
                v27 = (objc_class *)objc_opt_class();
                NSStringFromClass(v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = v32;
                v41 = v28;
                v42 = 2112;
                v43 = v33;
                v44 = 2112;
                v45 = v19;
                _os_log_debug_impl(&dword_1C9A3B000, v26, OS_LOG_TYPE_DEBUG, "%@ - starting suggestion session for clientModelId: %@, %@", buf, 0x20u);

              }
              v11 = v22;
              v10 = v34;
            }

            ++v12;
          }
          while (v10 != v12);
          v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        }
        while (v10);
      }

      mostRecentClientCacheUpdateUUIDByClientModelId = self->_mostRecentClientCacheUpdateUUIDByClientModelId;
      objc_msgSend(v4, "uuid");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = mostRecentClientCacheUpdateUUIDByClientModelId;
      v5 = v33;
      -[NSMutableDictionary setObject:forKey:](v31, "setObject:forKey:", v30, v33);

    }
  }

}

- (void)updateWithBlendingUICacheUpdate:(id)a3
{
  int v4;
  NSUUID *v5;
  NSUUID *mostRecentHomescreenBlendingCacheUUID;
  NSUUID *v7;
  NSUUID *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  void *v33;
  id *p_isa;
  char v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  NSObject *v58;
  objc_class *v59;
  void *v60;
  void *v61;
  void *v62;
  ATXSingleSuggestionSessionTrackingContext *v63;
  id obj;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint8_t v84[128];
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v68 = a3;
  v4 = objc_msgSend(v68, "consumerSubType");
  switch(v4)
  {
    case 34:
      objc_msgSend(v68, "uuid");
      v7 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      mostRecentHomescreenBlendingCacheUUID = self->_mostRecentHomescreenBlendingCacheUUID;
      self->_mostRecentHomescreenBlendingCacheUUID = v7;
      break;
    case 21:
      objc_msgSend(v68, "uuid");
      v8 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      mostRecentHomescreenBlendingCacheUUID = self->_mostRecentActionSpotlightBlendingCacheUUID;
      self->_mostRecentActionSpotlightBlendingCacheUUID = v8;
      break;
    case 9:
      objc_msgSend(v68, "uuid");
      v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
      mostRecentHomescreenBlendingCacheUUID = self->_mostRecentAppSpotlightBlendingCacheUUID;
      self->_mostRecentAppSpotlightBlendingCacheUUID = v5;
      break;
    default:
      goto LABEL_8;
  }

LABEL_8:
  v9 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v68, "clientModelCacheUpdateUUIDs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = (void *)objc_msgSend(v9, "initWithArray:", v11);

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v63 = self;
  -[NSMutableDictionary allValues](self->_currentlyTrackedSessions, "allValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v80 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        objc_msgSend(v17, "associatedClientModelCacheUUIDs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "intersectsSet:", v70);

        if (v19)
        {
          objc_msgSend(v17, "associatedBlendingCacheUUIDs");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v68, "uuid");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v20, "containsObject:", v21);

          if ((v22 & 1) == 0)
          {
            objc_msgSend(v17, "associatedBlendingCacheUUIDs");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "uuid");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v24);

            __atxlog_handle_metrics();
            v25 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              v26 = (objc_class *)objc_opt_class();
              NSStringFromClass(v26);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "uuid");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v86 = v27;
              v87 = 2112;
              v88 = v28;
              v89 = 2112;
              v90 = v17;
              _os_log_debug_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEBUG, "%@ - updated blending uuids with %@ for session: %@", buf, 0x20u);

            }
          }
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v79, v91, 16);
    }
    while (v14);
  }

  objc_msgSend(v68, "uiCache");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v68, "uiCache");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v31, "allSuggestionsInLayout");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    p_isa = (id *)&v63->super.isa;
  }
  else
  {
    objc_opt_class();
    v35 = objc_opt_isKindOfClass();

    p_isa = (id *)&v63->super.isa;
    if ((v35 & 1) == 0)
      goto LABEL_49;
    objc_msgSend(v68, "uiCache");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "allSuggestionsInCachedSuggestions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "cachedSuggestionWidgetLayouts");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "allKeys");
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v37, "count"))
    {
      -[NSMutableSet removeAllObjects](v63->_suggestionsWidgetIds, "removeAllObjects");
      -[NSMutableSet addObjectsFromArray:](v63->_suggestionsWidgetIds, "addObjectsFromArray:", v37);
    }
    objc_msgSend(v32, "cachedAppPredictionPanelLayouts");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "allKeys");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v39, "count"))
    {
      -[NSMutableSet removeAllObjects](v63->_appPredictionPanelIds, "removeAllObjects");
      -[NSMutableSet addObjectsFromArray:](v63->_appPredictionPanelIds, "addObjectsFromArray:", v39);
    }

  }
  if (v33)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(p_isa[7], "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
    if (v67)
    {
      v65 = *(_QWORD *)v76;
      v66 = v33;
      do
      {
        v40 = 0;
        do
        {
          if (*(_QWORD *)v76 != v65)
            objc_enumerationMutation(obj);
          v69 = v40;
          v41 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v40);
          objc_msgSend(v41, "suggestion");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "executableSpecification");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = objc_msgSend(v43, "executableObjectHash");

          v73 = 0u;
          v74 = 0u;
          v71 = 0u;
          v72 = 0u;
          v45 = v33;
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
          if (v46)
          {
            v47 = v46;
            v48 = *(_QWORD *)v72;
            do
            {
              for (j = 0; j != v47; ++j)
              {
                if (*(_QWORD *)v72 != v48)
                  objc_enumerationMutation(v45);
                v50 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * j);
                objc_msgSend(v50, "executableSpecification");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = objc_msgSend(v51, "executableObjectHash");

                if (v44 == v52)
                {
                  objc_msgSend(v41, "matchingSuggestionUUIDs");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v50, "uuid");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  v55 = objc_msgSend(v53, "containsObject:", v54);

                  if ((v55 & 1) == 0)
                  {
                    objc_msgSend(v41, "matchingSuggestionUUIDs");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "uuid");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v56, "addObject:", v57);

                    __atxlog_handle_metrics();
                    v58 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
                    {
                      v59 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v59);
                      v60 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v50, "uuid");
                      v61 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412802;
                      v86 = v60;
                      v87 = 2112;
                      v88 = v61;
                      v89 = 2112;
                      v90 = v41;
                      _os_log_debug_impl(&dword_1C9A3B000, v58, OS_LOG_TYPE_DEBUG, "%@ - updated matching suggestion with %@ for session: %@", buf, 0x20u);

                    }
                  }
                }
              }
              v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
            }
            while (v47);
          }

          v40 = v69 + 1;
          v33 = v66;
        }
        while (v69 + 1 != v67);
        v67 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      }
      while (v67);
    }

    p_isa = (id *)&v63->super.isa;
  }
LABEL_49:
  objc_msgSend(v68, "cacheCreationDate");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(p_isa, "_tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:", v62);

}

- (void)updateWithUIEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "spotlightEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ATXSingleSuggestionSessionTrackingContext _updateSingleSuggestionSessionsWithSpotlightUIEvent:](self, "_updateSingleSuggestionSessionsWithSpotlightUIEvent:", v4);
    if (objc_msgSend(v4, "eventType") == 2)
    {
      objc_msgSend(v4, "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSingleSuggestionSessionTrackingContext _tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:](self, "_tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:", v5);

    }
  }
  objc_msgSend(v10, "homeScreenEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[ATXSingleSuggestionSessionTrackingContext _updateSingleSuggestionSessionsWithHomeScreenUIEvent:](self, "_updateSingleSuggestionSessionsWithHomeScreenUIEvent:", v6);
    objc_msgSend(v6, "eventTypeString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("DeviceLocked"));

    if (v8)
    {
      objc_msgSend(v6, "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXSingleSuggestionSessionTrackingContext _tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:](self, "_tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:", v9);

    }
  }

}

- (void)_tryPruneSingleSuggestionSessionsIfOverMaxNum
{
  void *v0;
  objc_class *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v1);
  objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_9();
  OUTLINED_FUNCTION_2_11();
  OUTLINED_FUNCTION_0_6(&dword_1C9A3B000, v2, v3, "%@ - currentlyTrackedSessions has length of: %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_updateSingleSuggestionSessionsWithSpotlightUIEvent:(id)a3
{
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = objc_msgSend(v10, "eventType") - 3;
  if (v4 <= 4)
  {
    v5 = qword_1C9E80810[v4];
    objc_msgSend(v10, "appSuggestionIds");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "appBlendingCacheId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSingleSuggestionSessionTrackingContext _updateCurrentlyTrackedSessionsWithSessionStatus:consumerSubType:suggestionUUIDs:blendingCacheUUID:](self, "_updateCurrentlyTrackedSessionsWithSessionStatus:consumerSubType:suggestionUUIDs:blendingCacheUUID:", v5, 9, v6, v7);

    objc_msgSend(v10, "actionSuggestionIds");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "actionBlendingCacheId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSingleSuggestionSessionTrackingContext _updateCurrentlyTrackedSessionsWithSessionStatus:consumerSubType:suggestionUUIDs:blendingCacheUUID:](self, "_updateCurrentlyTrackedSessionsWithSessionStatus:consumerSubType:suggestionUUIDs:blendingCacheUUID:", v5, 21, v8, v9);

  }
}

- (void)_updateSingleSuggestionSessionsWithHomeScreenUIEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  BOOL v11;
  unsigned int v12;
  unsigned int v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "blendingCacheId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widgetUniqueId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "widgetBundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stackLocation");
  if (v4 && v5 && v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v4);
    if (v7)
    {
      objc_msgSend(v15, "eventTypeString");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Unknown")) & 1) != 0)
      {
LABEL_6:
        v9 = v8;
LABEL_20:

        goto LABEL_21;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Tapped")) & 1) != 0)
      {
        v10 = 2;
      }
      else if ((objc_msgSend(v8, "isEqualToString:", CFSTR("ContextMenuDismissOnce")) & 1) != 0
             || (objc_msgSend(v8, "isEqualToString:", CFSTR("ContextMenuNeverShowAgain")) & 1) != 0)
      {
        v10 = 3;
      }
      else
      {
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("WidgetAppeared")) & 1) != 0
          || (objc_msgSend(v8, "isEqualToString:", CFSTR("WidgetDisappeared")) & 1) != 0)
        {
          goto LABEL_6;
        }
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SuggestionsAppeared")) & 1) == 0)
        {
          if ((objc_msgSend(v8, "isEqualToString:", CFSTR("SuggestionsDisappeared")) & 1) == 0
            && (objc_msgSend(v8, "isEqualToString:", CFSTR("WidgetOccluded")) & 1) == 0)
          {
            objc_msgSend(v8, "isEqualToString:", CFSTR("WidgetUnoccluded"));
          }
          goto LABEL_6;
        }
        v10 = 1;
      }

      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CF89A8]))
      {
        v11 = ATXStackLocationIsTodayPage() == 0;
        v12 = 37;
        v13 = 40;
LABEL_16:
        if (v11)
          v14 = v12;
        else
          v14 = v13;
        objc_msgSend(v15, "suggestionIds");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "blendingCacheId");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        -[ATXSingleSuggestionSessionTrackingContext _updateCurrentlyTrackedSessionsWithSessionStatus:consumerSubType:suggestionUUIDs:blendingCacheUUID:](self, "_updateCurrentlyTrackedSessionsWithSessionStatus:consumerSubType:suggestionUUIDs:blendingCacheUUID:", v10, v14, v9, v8);
        goto LABEL_20;
      }
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CF9480]))
      {
        v11 = ATXStackLocationIsTodayPage() == 0;
        v12 = 36;
        v13 = 39;
        goto LABEL_16;
      }
    }
LABEL_21:

  }
}

- (void)_updateCurrentlyTrackedSessionsWithSessionStatus:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 suggestionUUIDs:(id)a5 blendingCacheUUID:(id)a6
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  BOOL v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  unsigned int v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v38 = a4;
  v57 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a6;
  v9 = v8;
  if (v7 && v8)
  {
    v30 = v7;
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v8);
    if (v10)
    {
      v29 = v9;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      obj = v7;
      v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      if (v34)
      {
        v33 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v44 != v33)
              objc_enumerationMutation(obj);
            v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
            if (v12)
            {
              v35 = i;
              v41 = 0u;
              v42 = 0u;
              v39 = 0u;
              v40 = 0u;
              -[NSMutableDictionary allValues](self->_currentlyTrackedSessions, "allValues");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
              if (v14)
              {
                v15 = v14;
                v16 = *(_QWORD *)v40;
                do
                {
                  for (j = 0; j != v15; ++j)
                  {
                    if (*(_QWORD *)v40 != v16)
                      objc_enumerationMutation(v13);
                    v18 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
                    objc_msgSend(v18, "matchingSuggestionUUIDs");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    v20 = objc_msgSend(v19, "containsObject:", v12);

                    objc_msgSend(v18, "associatedBlendingCacheUUIDs");
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    v22 = objc_msgSend(v21, "containsObject:", v10);

                    if (v20)
                      v23 = v22 == 0;
                    else
                      v23 = 1;
                    if (!v23 && objc_msgSend(v18, "tryUpdateSessionStatus:consumerSubType:", a3, v38))
                    {
                      __atxlog_handle_metrics();
                      v24 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
                      {
                        v25 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v25);
                        v36 = (void *)objc_claimAutoreleasedReturnValue();
                        +[ATXSingleSuggestionSession stringForSuggestionSessionStatus:](ATXSingleSuggestionSession, "stringForSuggestionSessionStatus:", a3);
                        v26 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v38);
                        v27 = objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138413058;
                        v48 = v36;
                        v49 = 2112;
                        v50 = v26;
                        v51 = 2112;
                        v52 = v27;
                        v28 = (void *)v27;
                        v53 = 2112;
                        v54 = v18;
                        _os_log_debug_impl(&dword_1C9A3B000, v24, OS_LOG_TYPE_DEBUG, "%@ - updated status with %@ for consumerSubType: %@, session: %@", buf, 0x2Au);

                      }
                    }
                  }
                  v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
                }
                while (v15);
              }

              i = v35;
            }

          }
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
        }
        while (v34);
      }

      v9 = v29;
    }

    v7 = v30;
  }

}

- (void)_tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *currentlyTrackedSessions;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  currentlyTrackedSessions = self->_currentlyTrackedSessions;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __101__ATXSingleSuggestionSessionTrackingContext__tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate___block_invoke;
  v9[3] = &unk_1E82E8448;
  v9[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](currentlyTrackedSessions, "enumerateKeysAndObjectsUsingBlock:", v9);
  -[NSMutableDictionary removeObjectsForKeys:](self->_currentlyTrackedSessions, "removeObjectsForKeys:", v7);

}

void __101__ATXSingleSuggestionSessionTrackingContext__tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  BOOL v28;
  id v29;
  NSObject *v30;
  int v31;
  int v32;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v6, "suggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientModelSpecification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clientModelId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(v6, "associatedClientModelCacheUUIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v10);

  }
  else
  {
    v12 = 0;
  }
  v13 = *(_QWORD **)(a1 + 32);
  if (v13[1])
  {
    objc_msgSend(v6, "associatedBlendingCacheUUIDs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));

    v13 = *(_QWORD **)(a1 + 32);
  }
  else
  {
    v15 = 0;
  }
  if (v13[3])
  {
    objc_msgSend(v6, "associatedBlendingCacheUUIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v16, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

    v13 = *(_QWORD **)(a1 + 32);
  }
  else
  {
    v32 = 0;
  }
  if (v13[2])
  {
    objc_msgSend(v6, "associatedBlendingCacheUUIDs");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));

  }
  else
  {
    v18 = 0;
  }
  objc_msgSend(v6, "sessionExpirationDate");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    v21 = *(void **)(a1 + 40);
    if (!v21)
    {

      goto LABEL_23;
    }
    objc_msgSend(v6, "sessionExpirationDate");
    v31 = v15;
    v22 = v10;
    v23 = v12;
    v24 = v9;
    v25 = v5;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "timeIntervalSinceDate:", v26);
    v28 = v27 <= 0.0;

    v5 = v25;
    v9 = v24;
    v12 = v23;
    v10 = v22;
    v15 = v31;
  }
  else
  {
    v28 = 0;
  }

  if (((v12 | v15 | v32 | v18) & 1) == 0 && !v28)
  {
    v29 = v5;
    objc_msgSend(v6, "setCompleted:", 1);
    __atxlog_handle_metrics();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      __101__ATXSingleSuggestionSessionTrackingContext__tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate___block_invoke_cold_1((uint64_t)v6, v30);

    v5 = v29;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v29);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", v6);
  }
LABEL_23:

}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ - currentlyTrackedSessions: %@"), v5, self->_currentlyTrackedSessions);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)checkAndReportDecodingFailureIfNeededForid:(id)a3 key:(id)a4 coder:(id)a5 errorDomain:(id)a6 errorCode:(int64_t)a7
{
  id v11;
  id v12;
  id v13;
  BOOL v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!a3)
  {
    objc_msgSend(v12, "error");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v14 = 1;
      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "containsValueForKey:", v11) & 1) == 0)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v21 = *MEMORY[0x1E0CB2D50];
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to decode key %@"), v11, v21);
      v22[0] = v17;
      v14 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v16, "initWithDomain:code:userInfo:", v13, a7, v18);

      objc_msgSend(v12, "failWithError:", v19);
      goto LABEL_7;
    }
  }
  v14 = 0;
LABEL_7:

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *mostRecentHomescreenBlendingCacheUUID;
  id v5;

  mostRecentHomescreenBlendingCacheUUID = self->_mostRecentHomescreenBlendingCacheUUID;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", mostRecentHomescreenBlendingCacheUUID, CFSTR("codingKeyForRecentHomeScreenBlendingCacheUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostRecentAppSpotlightBlendingCacheUUID, CFSTR("codingKeyForRecentAppSpotlightBlendingCacheUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostRecentActionSpotlightBlendingCacheUUID, CFSTR("codingKeyForRecentActionSpotlightBlendingCacheUUID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_suggestionsWidgetIds, CFSTR("codingKeyForSuggestionsWidgetIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_appPredictionPanelIds, CFSTR("codingKeyForAppPredictionPanelIds"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostRecentClientCacheUpdateUUIDByClientModelId, CFSTR("codingKeyForRecentClientCacheUpdatesByClientModelId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_currentlyTrackedSessions, CFSTR("codingKeyForCurrentlyTrackedSessions"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_completedSessions, CFSTR("codingKeyForCompletedSessions"));

}

- (ATXSingleSuggestionSessionTrackingContext)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  ATXSingleSuggestionSessionTrackingContext *v52;
  ATXSingleSuggestionSessionTrackingContext *v53;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v61;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0D81610];
  v5 = objc_opt_class();
  __atxlog_handle_metrics();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v5, CFSTR("codingKeyForRecentHomeScreenBlendingCacheUUID"), v3, 0, CFSTR("com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext"), -1, v6);
  v59 = objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0D81610];
  v8 = objc_opt_class();
  __atxlog_handle_metrics();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v8, CFSTR("codingKeyForRecentActionSpotlightBlendingCacheUUID"), v3, 0, CFSTR("com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext"), -1, v9);
  v58 = objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D81610];
  v11 = objc_opt_class();
  __atxlog_handle_metrics();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "robustDecodeObjectOfClass:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v11, CFSTR("codingKeyForRecentAppSpotlightBlendingCacheUUID"), v3, 0, CFSTR("com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext"), -1, v12);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D81610];
  v14 = (void *)MEMORY[0x1CAA48B6C]();
  v15 = objc_alloc(MEMORY[0x1E0C99E60]);
  v16 = objc_opt_class();
  v17 = (void *)objc_msgSend(v15, "initWithObjects:", v16, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v14);
  __atxlog_handle_metrics();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v17, CFSTR("codingKeyForSuggestionsWidgetIds"), v3, 1, CFSTR("com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext"), -1, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E0D81610];
    v21 = (void *)MEMORY[0x1CAA48B6C]();
    v22 = objc_alloc(MEMORY[0x1E0C99E60]);
    v23 = objc_opt_class();
    v24 = (void *)objc_msgSend(v22, "initWithObjects:", v23, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v21);
    __atxlog_handle_metrics();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v24, CFSTR("codingKeyForAppPredictionPanelIds"), v3, 1, CFSTR("com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext"), -1, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (v26)
    {
      v27 = (void *)MEMORY[0x1CAA48B6C]();
      v28 = objc_alloc(MEMORY[0x1E0C99E60]);
      v29 = objc_opt_class();
      v30 = objc_opt_class();
      v31 = (void *)objc_msgSend(v28, "initWithObjects:", v29, v30, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v27);
      v32 = (void *)MEMORY[0x1E0D81610];
      __atxlog_handle_metrics();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v31, CFSTR("codingKeyForRecentClientCacheUpdatesByClientModelId"), v3, 1, CFSTR("com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext"), -1, v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v57 = v34;
        v55 = v31;
        v35 = (void *)MEMORY[0x1CAA48B6C]();
        v36 = objc_alloc(MEMORY[0x1E0C99E60]);
        v37 = objc_opt_class();
        v38 = objc_opt_class();
        v39 = objc_msgSend(v36, "initWithObjects:", v37, v38, objc_opt_class(), 0);
        objc_autoreleasePoolPop(v35);
        v40 = (void *)MEMORY[0x1E0D81610];
        __atxlog_handle_metrics();
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v39, CFSTR("codingKeyForCurrentlyTrackedSessions"), v3, 1, CFSTR("com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext"), -1, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        v56 = (void *)v39;
        if (v42)
        {
          v43 = (void *)MEMORY[0x1CAA48B6C]();
          v44 = objc_alloc(MEMORY[0x1E0C99E60]);
          v45 = objc_opt_class();
          v46 = (void *)objc_msgSend(v44, "initWithObjects:", v45, objc_opt_class(), 0);
          objc_autoreleasePoolPop(v43);
          v47 = (void *)MEMORY[0x1E0D81610];
          __atxlog_handle_metrics();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "robustDecodeObjectOfClasses:forKey:withCoder:expectNonNull:errorDomain:errorCode:logHandle:", v46, CFSTR("codingKeyForCompletedSessions"), v3, 1, CFSTR("com.apple.duetexpertd.ATXSingleSuggestionSessionTrackingContext"), -1, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();

          if (v49)
          {
            v50 = (void *)v59;
            v51 = (void *)v58;
            v52 = -[ATXSingleSuggestionSessionTrackingContext initWithMostRecentlySeenHomescreenBlendingCacheUUID:mostRecentAppSpotlightBlendingCacheUUID:mostRecentActionSpotlightBlendingCacheUUID:suggestionsWidgetIds:appPredictionPanelIds:mostRecentClientCacheUpdateUUIDByClientModelId:currentlyTrackedSessions:completedSessions:](self, "initWithMostRecentlySeenHomescreenBlendingCacheUUID:mostRecentAppSpotlightBlendingCacheUUID:mostRecentActionSpotlightBlendingCacheUUID:suggestionsWidgetIds:appPredictionPanelIds:mostRecentClientCacheUpdateUUIDByClientModelId:currentlyTrackedSessions:completedSessions:", v59, v61, v58, v19, v26, v57, v42, v49);
            v53 = v52;
          }
          else
          {
            v53 = 0;
            v50 = (void *)v59;
            v52 = self;
            v51 = (void *)v58;
          }

        }
        else
        {
          v53 = 0;
          v50 = (void *)v59;
          v52 = self;
          v51 = (void *)v58;
        }
        v31 = v55;
        v34 = v57;

      }
      else
      {
        v53 = 0;
        v50 = (void *)v59;
        v52 = self;
        v51 = (void *)v58;
      }

    }
    else
    {
      v53 = 0;
      v50 = (void *)v59;
      v52 = self;
      v51 = (void *)v58;
    }

  }
  else
  {
    v53 = 0;
    v50 = (void *)v59;
    v52 = self;
    v51 = (void *)v58;
  }

  return v53;
}

- (BOOL)isEqual:(id)a3
{
  ATXSingleSuggestionSessionTrackingContext *v4;
  ATXSingleSuggestionSessionTrackingContext *v5;
  BOOL v6;

  v4 = (ATXSingleSuggestionSessionTrackingContext *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[ATXSingleSuggestionSessionTrackingContext isEqualToATXSingleSuggestionSessionTrackingContext:](self, "isEqualToATXSingleSuggestionSessionTrackingContext:", v5);

  return v6;
}

- (BOOL)isEqualToATXSingleSuggestionSessionTrackingContext:(id)a3
{
  id *v4;
  NSUUID *mostRecentHomescreenBlendingCacheUUID;
  NSUUID *v6;
  NSUUID *v7;
  NSUUID *v8;
  char v9;
  NSUUID *mostRecentAppSpotlightBlendingCacheUUID;
  NSUUID *v11;
  NSUUID *v12;
  NSUUID *v13;
  char v14;
  NSUUID *mostRecentActionSpotlightBlendingCacheUUID;
  NSUUID *v16;
  NSUUID *v17;
  NSUUID *v18;
  char v19;
  NSMutableSet *suggestionsWidgetIds;
  NSMutableSet *v21;
  NSMutableSet *v22;
  NSMutableSet *v23;
  char v24;
  NSMutableSet *appPredictionPanelIds;
  NSMutableSet *v26;
  NSMutableSet *v27;
  NSMutableSet *v28;
  char v29;
  NSMutableDictionary *mostRecentClientCacheUpdateUUIDByClientModelId;
  NSMutableDictionary *v31;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  char v34;
  NSMutableDictionary *currentlyTrackedSessions;
  NSMutableDictionary *v36;
  NSMutableDictionary *v37;
  NSMutableDictionary *v38;
  char v39;
  char v40;
  NSMutableArray *v42;
  NSMutableArray *v43;

  v4 = (id *)a3;
  mostRecentHomescreenBlendingCacheUUID = self->_mostRecentHomescreenBlendingCacheUUID;
  v6 = (NSUUID *)v4[1];
  if (mostRecentHomescreenBlendingCacheUUID == v6)
  {

  }
  else
  {
    v7 = v6;
    v8 = mostRecentHomescreenBlendingCacheUUID;
    v9 = -[NSUUID isEqual:](v8, "isEqual:", v7);

    if ((v9 & 1) == 0)
      goto LABEL_27;
  }
  mostRecentAppSpotlightBlendingCacheUUID = self->_mostRecentAppSpotlightBlendingCacheUUID;
  v11 = (NSUUID *)v4[2];
  if (mostRecentAppSpotlightBlendingCacheUUID == v11)
  {

  }
  else
  {
    v12 = v11;
    v13 = mostRecentAppSpotlightBlendingCacheUUID;
    v14 = -[NSUUID isEqual:](v13, "isEqual:", v12);

    if ((v14 & 1) == 0)
      goto LABEL_27;
  }
  mostRecentActionSpotlightBlendingCacheUUID = self->_mostRecentActionSpotlightBlendingCacheUUID;
  v16 = (NSUUID *)v4[3];
  if (mostRecentActionSpotlightBlendingCacheUUID == v16)
  {

  }
  else
  {
    v17 = v16;
    v18 = mostRecentActionSpotlightBlendingCacheUUID;
    v19 = -[NSUUID isEqual:](v18, "isEqual:", v17);

    if ((v19 & 1) == 0)
      goto LABEL_27;
  }
  suggestionsWidgetIds = self->_suggestionsWidgetIds;
  v21 = (NSMutableSet *)v4[4];
  if (suggestionsWidgetIds == v21)
  {

  }
  else
  {
    v22 = v21;
    v23 = suggestionsWidgetIds;
    v24 = -[NSMutableSet isEqual:](v23, "isEqual:", v22);

    if ((v24 & 1) == 0)
      goto LABEL_27;
  }
  appPredictionPanelIds = self->_appPredictionPanelIds;
  v26 = (NSMutableSet *)v4[5];
  if (appPredictionPanelIds == v26)
  {

  }
  else
  {
    v27 = v26;
    v28 = appPredictionPanelIds;
    v29 = -[NSMutableSet isEqual:](v28, "isEqual:", v27);

    if ((v29 & 1) == 0)
      goto LABEL_27;
  }
  mostRecentClientCacheUpdateUUIDByClientModelId = self->_mostRecentClientCacheUpdateUUIDByClientModelId;
  v31 = (NSMutableDictionary *)v4[6];
  if (mostRecentClientCacheUpdateUUIDByClientModelId == v31)
  {

  }
  else
  {
    v32 = v31;
    v33 = mostRecentClientCacheUpdateUUIDByClientModelId;
    v34 = -[NSMutableDictionary isEqual:](v33, "isEqual:", v32);

    if ((v34 & 1) == 0)
      goto LABEL_27;
  }
  currentlyTrackedSessions = self->_currentlyTrackedSessions;
  v36 = (NSMutableDictionary *)v4[7];
  if (currentlyTrackedSessions == v36)
  {

  }
  else
  {
    v37 = v36;
    v38 = currentlyTrackedSessions;
    v39 = -[NSMutableDictionary isEqual:](v38, "isEqual:", v37);

    if ((v39 & 1) == 0)
    {
LABEL_27:
      v40 = 0;
      goto LABEL_28;
    }
  }
  v42 = self->_completedSessions;
  v43 = v42;
  if (v42 == v4[8])
    v40 = 1;
  else
    v40 = -[NSMutableArray isEqual:](v42, "isEqual:");

LABEL_28:
  return v40;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = -[NSUUID hash](self->_mostRecentHomescreenBlendingCacheUUID, "hash");
  v4 = -[NSUUID hash](self->_mostRecentAppSpotlightBlendingCacheUUID, "hash") - v3 + 32 * v3;
  v5 = -[NSUUID hash](self->_mostRecentActionSpotlightBlendingCacheUUID, "hash") - v4 + 32 * v4;
  v6 = -[NSMutableSet hash](self->_suggestionsWidgetIds, "hash") - v5 + 32 * v5;
  v7 = -[NSMutableSet hash](self->_appPredictionPanelIds, "hash") - v6 + 32 * v6;
  v8 = -[NSMutableDictionary hash](self->_mostRecentClientCacheUpdateUUIDByClientModelId, "hash") - v7 + 32 * v7;
  v9 = -[NSMutableDictionary hash](self->_currentlyTrackedSessions, "hash") - v8 + 32 * v8;
  return -[NSMutableArray hash](self->_completedSessions, "hash") - v9 + 32 * v9;
}

- (NSUUID)mostRecentHomescreenBlendingCacheUUID
{
  return self->_mostRecentHomescreenBlendingCacheUUID;
}

- (void)setMostRecentHomescreenBlendingCacheUUID:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentHomescreenBlendingCacheUUID, a3);
}

- (NSUUID)mostRecentAppSpotlightBlendingCacheUUID
{
  return self->_mostRecentAppSpotlightBlendingCacheUUID;
}

- (void)setMostRecentAppSpotlightBlendingCacheUUID:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentAppSpotlightBlendingCacheUUID, a3);
}

- (NSUUID)mostRecentActionSpotlightBlendingCacheUUID
{
  return self->_mostRecentActionSpotlightBlendingCacheUUID;
}

- (void)setMostRecentActionSpotlightBlendingCacheUUID:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentActionSpotlightBlendingCacheUUID, a3);
}

- (NSMutableSet)suggestionsWidgetIds
{
  return self->_suggestionsWidgetIds;
}

- (void)setSuggestionsWidgetIds:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsWidgetIds, a3);
}

- (NSMutableSet)appPredictionPanelIds
{
  return self->_appPredictionPanelIds;
}

- (void)setAppPredictionPanelIds:(id)a3
{
  objc_storeStrong((id *)&self->_appPredictionPanelIds, a3);
}

- (NSMutableDictionary)mostRecentClientCacheUpdateUUIDByClientModelId
{
  return self->_mostRecentClientCacheUpdateUUIDByClientModelId;
}

- (void)setMostRecentClientCacheUpdateUUIDByClientModelId:(id)a3
{
  objc_storeStrong((id *)&self->_mostRecentClientCacheUpdateUUIDByClientModelId, a3);
}

- (NSMutableDictionary)currentlyTrackedSessions
{
  return self->_currentlyTrackedSessions;
}

- (void)setCurrentlyTrackedSessions:(id)a3
{
  objc_storeStrong((id *)&self->_currentlyTrackedSessions, a3);
}

- (NSMutableArray)completedSessions
{
  return self->_completedSessions;
}

- (void)setCompletedSessions:(id)a3
{
  objc_storeStrong((id *)&self->_completedSessions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedSessions, 0);
  objc_storeStrong((id *)&self->_currentlyTrackedSessions, 0);
  objc_storeStrong((id *)&self->_mostRecentClientCacheUpdateUUIDByClientModelId, 0);
  objc_storeStrong((id *)&self->_appPredictionPanelIds, 0);
  objc_storeStrong((id *)&self->_suggestionsWidgetIds, 0);
  objc_storeStrong((id *)&self->_mostRecentActionSpotlightBlendingCacheUUID, 0);
  objc_storeStrong((id *)&self->_mostRecentAppSpotlightBlendingCacheUUID, 0);
  objc_storeStrong((id *)&self->_mostRecentHomescreenBlendingCacheUUID, 0);
}

void __101__ATXSingleSuggestionSessionTrackingContext__tryMarkCurrentlyTrackedSessionsAsCompleteWithEventDate___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  objc_class *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;

  v4 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v5;
  v8 = 2112;
  v9 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "%@ - marked session as completed: %@", (uint8_t *)&v6, 0x16u);

  OUTLINED_FUNCTION_1_1();
}

@end
