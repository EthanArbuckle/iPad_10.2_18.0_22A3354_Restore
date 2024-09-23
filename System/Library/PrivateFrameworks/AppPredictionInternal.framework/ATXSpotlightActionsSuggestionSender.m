@implementation ATXSpotlightActionsSuggestionSender

+ (id)identifiersForSuggestionsFromLayout:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  id v17;
  id obj;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v17 = v3;
    objc_msgSend(v3, "collections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    if (v20)
    {
      v19 = *(_QWORD *)v28;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v28 != v19)
            objc_enumerationMutation(obj);
          v21 = v5;
          v6 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v5);
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          objc_msgSend(v6, "suggestions");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v24;
            do
            {
              v11 = 0;
              do
              {
                if (*(_QWORD *)v24 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v11);
                v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81138]), "initWithProactiveSuggestion:", v12);
                if (v13)
                {
                  objc_msgSend(v4, "addObject:", v13);
                }
                else
                {
                  __atxlog_handle_blending();
                  v14 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                  {
                    objc_msgSend(v12, "executableSpecification");
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "executableIdentifier");
                    v15 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v32 = v15;
                    v33 = 2112;
                    v34 = v12;
                    _os_log_error_impl(&dword_1C9A3B000, v14, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: nil: %@, %@", buf, 0x16u);

                  }
                }

                ++v11;
              }
              while (v9 != v11);
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
            }
            while (v9);
          }

          v5 = v21 + 1;
        }
        while (v21 + 1 != v20);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
      }
      while (v20);
    }

    v3 = v17;
  }
  else
  {
    v4 = (void *)objc_opt_new();
  }

  return v4;
}

+ (id)identifiersForDirectionsSuggestionFromLayout:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_opt_new();
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v22 = v3;
    objc_msgSend(v3, "collections");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v25)
    {
      v24 = *(_QWORD *)v32;
      do
      {
        v5 = 0;
        do
        {
          if (*(_QWORD *)v32 != v24)
            objc_enumerationMutation(obj);
          v26 = v5;
          v6 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v5);
          v27 = 0u;
          v28 = 0u;
          v29 = 0u;
          v30 = 0u;
          objc_msgSend(v6, "suggestions");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v28;
            do
            {
              for (i = 0; i != v9; ++i)
              {
                if (*(_QWORD *)v28 != v10)
                  objc_enumerationMutation(v7);
                v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
                objc_msgSend(v12, "atxShortcutsActionExecutableObject");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v13, "contextualAction");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();

                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v13, "contextualAction");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v16, "uniqueIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v12, "uiSpecification");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "title");
                  v19 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(v4, "setObject:forKeyedSubscript:", v19, v17);
                }

              }
              v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
            }
            while (v9);
          }

          v5 = v26 + 1;
        }
        while (v26 + 1 != v25);
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v25);
    }

    v20 = (void *)objc_msgSend(v4, "copy");
    v3 = v22;
  }
  else
  {
    v20 = (void *)objc_opt_new();
  }

  return v20;
}

+ (id)identifierForNowPlayingSuggestionFromLayout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "collections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v21)
    {
      v6 = *(_QWORD *)v27;
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v8, "suggestions", v20);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v23 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                objc_msgSend(v14, "uiSpecification");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "predictionReasons");

                if ((v16 & 0x40000) != 0)
                {
                  objc_msgSend(v14, "executableSpecification");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "executableIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_21;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v11)
                continue;
              break;
            }
          }

          v6 = v20;
        }
        v17 = 0;
        v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v21);
    }
    else
    {
      v17 = 0;
    }
LABEL_21:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)identifierForOngoingCallSuggestionFromLayout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v3, "collections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v21)
    {
      v6 = *(_QWORD *)v27;
      v20 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v6)
            objc_enumerationMutation(v5);
          v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v8, "suggestions", v20);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v11; ++j)
              {
                if (*(_QWORD *)v23 != v12)
                  objc_enumerationMutation(v9);
                v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                objc_msgSend(v14, "uiSpecification");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                v16 = objc_msgSend(v15, "predictionReasons");

                if ((v16 & 0x80000) != 0)
                {
                  objc_msgSend(v14, "executableSpecification");
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v18, "executableIdentifier");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  goto LABEL_21;
                }
              }
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v11)
                continue;
              break;
            }
          }

          v6 = v20;
        }
        v17 = 0;
        v21 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v21);
    }
    else
    {
      v17 = 0;
    }
LABEL_21:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (ATXSpotlightActionsSuggestionSender)init
{
  ATXSpotlightActionsSuggestionSender *v2;
  uint64_t v3;
  NSDictionary *previousDirectionsIdentifiers;
  uint64_t v5;
  NSSet *previousIdentifiers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXSpotlightActionsSuggestionSender;
  v2 = -[ATXSpotlightActionsSuggestionSender init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    previousDirectionsIdentifiers = v2->_previousDirectionsIdentifiers;
    v2->_previousDirectionsIdentifiers = (NSDictionary *)v3;

    v5 = objc_opt_new();
    previousIdentifiers = v2->_previousIdentifiers;
    v2->_previousIdentifiers = (NSSet *)v5;

  }
  return v2;
}

- (void)blendingLayerDidUpdateSpotlightUICache:(id)a3
{
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - received new ui cache", (uint8_t *)&v8, 0xCu);

  }
  -[ATXSpotlightActionsSuggestionSender _processChanges:](self, "_processChanges:", v4);
  -[ATXSpotlightActionsSuggestionSender _sendSpotlightSuggestionUpdateNotification:](self, "_sendSpotlightSuggestionUpdateNotification:", v4);

}

- (void)_processChanges:(id)a3
{
  id v4;
  NSSet *v5;
  void *v6;
  void *v7;
  id v8;
  NSSet *previousIdentifiers;
  NSObject *v10;
  NSObject *v11;

  if (a3)
  {
    v4 = a3;
    objc_msgSend((id)objc_opt_class(), "identifiersForSuggestionsFromLayout:", v4);
    v5 = (NSSet *)objc_claimAutoreleasedReturnValue();

    v6 = (void *)-[NSSet mutableCopy](v5, "mutableCopy");
    objc_msgSend(v6, "minusSet:", self->_previousIdentifiers);
    v7 = (void *)-[NSSet mutableCopy](self->_previousIdentifiers, "mutableCopy");
    objc_msgSend(v7, "minusSet:", v5);
    v8 = objc_alloc_init(MEMORY[0x1E0D81200]);
    previousIdentifiers = self->_previousIdentifiers;
    self->_previousIdentifiers = v5;

    __atxlog_handle_metrics();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      -[ATXSpotlightActionsSuggestionSender _processChanges:].cold.2(v7);

    -[ATXSpotlightActionsSuggestionSender _logCAEvents:eventType:toStream:](self, "_logCAEvents:eventType:toStream:", v7, 2, v8);
    __atxlog_handle_metrics();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[ATXSpotlightActionsSuggestionSender _processChanges:].cold.1(v6);

    -[ATXSpotlightActionsSuggestionSender _logCAEvents:eventType:toStream:](self, "_logCAEvents:eventType:toStream:", v6, 1, v8);
  }
}

- (void)_logCAEvents:(id)a3 eventType:(int64_t)a4 toStream:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v14 = objc_alloc(MEMORY[0x1E0D81208]);
        objc_msgSend(v13, "uniqueIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "subtype");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "context");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v14, "initWithType:suggestionUniqueId:suggestionType:suggestionSubtype:suggestionContext:", a4, v15, CFSTR("action"), v16, v17);

        objc_msgSend(v8, "sendEvent:", v18);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

}

- (void)_sendSpotlightSuggestionUpdateNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *v6;
  NSString *v7;
  int v8;
  NSString *v9;
  NSString *v10;
  int v11;
  NSString *previousOngoingCallIdentifier;
  NSString *v13;
  NSDictionary *v14;
  _BOOL4 v15;
  NSDictionary *previousDirectionsIdentifiers;
  __int16 v17[7];
  Boolean keyExistsAndHasValidFormat;

  v4 = a3;
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("zkwTriggerUIRefresh"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat)&& objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
  {
    __atxlog_handle_blending();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v17[0] = 0;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Internal: trigger for all changes", (uint8_t *)v17, 2u);
    }

    notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0CF8B48], "UTF8String"));
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "identifierForNowPlayingSuggestionFromLayout:", v4);
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 == self->_previousNowPlayingIdentifier)
      v8 = 0;
    else
      v8 = !-[NSString isEqualToString:](v6, "isEqualToString:");
    objc_storeStrong((id *)&self->_previousNowPlayingIdentifier, v7);
    objc_msgSend((id)objc_opt_class(), "identifierForOngoingCallSuggestionFromLayout:", v4);
    v9 = (NSString *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9 == self->_previousOngoingCallIdentifier)
      v11 = 0;
    else
      v11 = !-[NSString isEqualToString:](v9, "isEqualToString:");
    previousOngoingCallIdentifier = self->_previousOngoingCallIdentifier;
    self->_previousOngoingCallIdentifier = v10;
    v13 = v10;

    objc_msgSend((id)objc_opt_class(), "identifiersForDirectionsSuggestionFromLayout:", v4);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v15 = -[NSDictionary isEqualToDictionary:](v14, "isEqualToDictionary:", self->_previousDirectionsIdentifiers);
    previousDirectionsIdentifiers = self->_previousDirectionsIdentifiers;
    self->_previousDirectionsIdentifiers = v14;

    if (((v8 | v11) & 1) != 0 || !v15)
      notify_post((const char *)objc_msgSend((id)*MEMORY[0x1E0CF8B48], "UTF8String"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousIdentifiers, 0);
  objc_storeStrong((id *)&self->_previousDirectionsIdentifiers, 0);
  objc_storeStrong((id *)&self->_previousNowPlayingIdentifier, 0);
  objc_storeStrong((id *)&self->_previousOngoingCallIdentifier, 0);
}

- (void)_processChanges:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "Added %lu events - ATXSpotlightUIEvent", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

- (void)_processChanges:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "Removed %lu events - ATXSpotlightUIEvent", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_1();
}

@end
