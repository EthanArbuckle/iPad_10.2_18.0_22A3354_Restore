@implementation ATXActionToPSSuggestionConverter

- (id)convertSuggestions:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  char v16;
  ATXActionToPSSuggestionConverter *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  uint64_t v29;
  id obj;
  id v31;
  uint8_t v32;
  _BYTE v33[15];
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_blending();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v40 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Starting ATXAction to PSSuggestion conversion with %lu suggestions", buf, 0xCu);
  }

  v31 = (id)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    do
    {
      v9 = 0;
      v29 = v7;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v9);
        v11 = (void *)MEMORY[0x1CAA48B6C]();
        objc_msgSend(v10, "executableSpecification");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "executableClassString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v13, "isEqualToString:", v15);

        if ((v16 & 1) == 0)
        {
          objc_msgSend(v31, "addObject:", v10);
          goto LABEL_25;
        }
        v17 = self;
        objc_msgSend(v10, "executableSpecification");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "executableObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v19, "intent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_15;
          -[ATXActionToPSSuggestionConverter psSuggestionFromINSendMessageIntent:](v17, "psSuggestionFromINSendMessageIntent:", v20);
          v21 = objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = (void *)v21;
            -[ATXActionToPSSuggestionConverter proactiveSuggestionForPeopleSuggestion:originalSuggestion:](v17, "proactiveSuggestionForPeopleSuggestion:originalSuggestion:", v21, v10);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            __atxlog_handle_blending();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
              -[ATXActionToPSSuggestionConverter convertSuggestions:].cold.2(buf, &buf[1], v24);

            objc_msgSend(v31, "addObject:", v23);
LABEL_15:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[ATXActionToPSSuggestionConverter psSuggesetionFromINStartCallIntent:](v17, "psSuggesetionFromINStartCallIntent:", v20);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                -[ATXActionToPSSuggestionConverter proactiveSuggestionForPeopleSuggestion:originalSuggestion:](v17, "proactiveSuggestionForPeopleSuggestion:originalSuggestion:", v25, v10);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                __atxlog_handle_blending();
                v27 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
                  -[ATXActionToPSSuggestionConverter convertSuggestions:].cold.1(&v32, v33, v27);

                objc_msgSend(v31, "addObject:", v26);
              }
              else
              {
                objc_msgSend(v31, "addObject:", v10);
              }

            }
            goto LABEL_24;
          }
        }
        objc_msgSend(v31, "addObject:", v10);
LABEL_24:

        self = v17;
        v7 = v29;
LABEL_25:
        objc_autoreleasePoolPop(v11);
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v7);
  }

  return v31;
}

- (id)proactiveSuggestionForPeopleSuggestion:(id)a3 originalSuggestion:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;

  v5 = (objc_class *)MEMORY[0x1E0D811D0];
  v6 = a4;
  v7 = a3;
  v8 = [v5 alloc];
  objc_msgSend(v7, "conversationIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithTitle:subtitle:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:", v9, 0, v10, 1, 1, 1);

  v12 = objc_alloc(MEMORY[0x1E0D811A8]);
  objc_msgSend(v7, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v7, v13, v15, 6);

  v17 = objc_alloc(MEMORY[0x1E0D81190]);
  objc_msgSend(v6, "clientModelSpecification");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scoreSpecification");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)objc_msgSend(v17, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v18, v16, v11, v19);
  return v20;
}

- (id)psSuggestionFromINSendMessageIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];

  v4 = a3;
  objc_msgSend(v4, "recipients");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__ATXActionToPSSuggestionConverter_psSuggestionFromINSendMessageIntent___block_invoke;
    v14[3] = &unk_1E82E9C58;
    v14[4] = self;
    objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v14);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x1E0D709B8]);
    objc_msgSend(v4, "launchId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "conversationIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "speakableGroupName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "spokenPhrase");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v7, "initWithBundleID:conversationIdentifier:groupName:recipients:", v8, v9, v11, v6);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __72__ATXActionToPSSuggestionConverter_psSuggestionFromINSendMessageIntent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "psRecipientFromINPerson:", a2);
}

- (id)psSuggesetionFromINStartCallIntent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v4 = a3;
  objc_msgSend(v4, "contacts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__ATXActionToPSSuggestionConverter_psSuggesetionFromINStartCallIntent___block_invoke;
    v12[3] = &unk_1E82E9C58;
    v12[4] = self;
    objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v12);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D709B8]);
    objc_msgSend(v4, "launchId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithBundleID:conversationIdentifier:groupName:recipients:", v9, 0, 0, v7);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __71__ATXActionToPSSuggestionConverter_psSuggesetionFromINStartCallIntent___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "psRecipientFromINPerson:", a2);
}

- (id)psRecipientFromINPerson:(id)a3
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0D709A0]);
  objc_msgSend(v4, "contactIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "personHandle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v5, "initWithIdentifier:handle:displayName:contact:", v7, v9, v10, 0);

  if (!v6)
  {

  }
  return v11;
}

- (void)convertSuggestions:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_18(&dword_1C9A3B000, (int)a2, a3, "Converted INStartCallIntent to PSSuggestion Proactive Suggestion", a1);
}

- (void)convertSuggestions:(NSObject *)a3 .cold.2(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_18(&dword_1C9A3B000, (int)a2, a3, "Converted INSendMessageIntent to PSSuggestion Proactive Suggestion", a1);
}

@end
