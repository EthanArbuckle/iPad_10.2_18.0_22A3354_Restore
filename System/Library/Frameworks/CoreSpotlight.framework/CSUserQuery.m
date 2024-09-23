@implementation CSUserQuery

+ (void)prepare
{
  objc_msgSend(a1, "prepareProtectionClasses:", &unk_1E242F280);
}

+ (void)prepareLocalResources
{
  id v2;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CSUserQuery_prepareLocalResources__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (prepareLocalResources_onceToken != -1)
    dispatch_once(&prepareLocalResources_onceToken, block);
  GetCSUserQueryParser();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_CSUserQueryPreheat");

}

void __36__CSUserQuery_prepareLocalResources__block_invoke()
{
  void *v0;
  id v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilemail")))
    v1 = (id)objc_msgSend((id)objc_opt_class(), "mailResources");

}

+ (void)prepareProtectionClasses:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t block;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;

  v4 = a3;
  block = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __40__CSUserQuery_prepareProtectionClasses___block_invoke;
  v11 = &unk_1E2401238;
  v12 = v4;
  v5 = prepareProtectionClasses__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&prepareProtectionClasses__onceToken, &block);
  objc_msgSend(a1, "prepareLocalResources", v6, block, v9, v10, v11);

}

uint64_t __40__CSUserQuery_prepareProtectionClasses___block_invoke(uint64_t a1)
{
  return +[CSSearchQuery preheat:](CSSearchQuery, "preheat:", *(_QWORD *)(a1 + 32));
}

+ (void)preheat:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  uint64_t block;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;

  v4 = a3;
  block = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __23__CSUserQuery_preheat___block_invoke;
  v11 = &unk_1E2401238;
  v12 = v4;
  v5 = preheat__onceToken;
  v6 = v4;
  if (v5 != -1)
    dispatch_once(&preheat__onceToken, &block);
  objc_msgSend(a1, "prepareLocalResources", v6, block, v9, v10, v11);

}

uint64_t __23__CSUserQuery_preheat___block_invoke(uint64_t a1)
{
  void *v1;

  if (*(_QWORD *)(a1 + 32))
    v1 = *(void **)(a1 + 32);
  else
    v1 = &unk_1E242F298;
  return +[CSSearchQuery preheat:](CSSearchQuery, "preheat:", v1);
}

+ (id)mailResources
{
  if (mailResources_onceMailResourcesToken != -1)
    dispatch_once(&mailResources_onceMailResourcesToken, &__block_literal_global_2);
  return (id)mailResources_sMailResources;
}

void __28__CSUserQuery_mailResources__block_invoke()
{
  void *v0;
  id v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2050000000;
  v0 = (void *)getSRResourcesManagerClass_softClass;
  v11 = getSRResourcesManagerClass_softClass;
  if (!getSRResourcesManagerClass_softClass)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __getSRResourcesManagerClass_block_invoke;
    v7[3] = &unk_1E2401140;
    v7[4] = &v8;
    __getSRResourcesManagerClass_block_invoke((uint64_t)v7);
    v0 = (void *)v9[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v8, 8);
  logForCSLogCategoryQuery();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __28__CSUserQuery_mailResources__block_invoke_cold_5();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v1, "performSelector:", sel_sharedResourcesManager);
      v3 = objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NSObject performSelector:withObject:](v3, "performSelector:withObject:", sel_loadAllParametersForClient_, CFSTR("Mail"));
      }
      else
      {
        logForCSLogCategoryQuery();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
          __28__CSUserQuery_mailResources__block_invoke_cold_3();

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        -[NSObject performSelector:withObject:withObject:](v3, "performSelector:withObject:withObject:", sel_resourcesForClient_options_, CFSTR("Mail"), &unk_1E2430288);
        v5 = objc_claimAutoreleasedReturnValue();
        v6 = mailResources_sMailResources;
        mailResources_sMailResources = v5;
      }
      else
      {
        logForCSLogCategoryQuery();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          __28__CSUserQuery_mailResources__block_invoke_cold_2();
      }

    }
    else
    {
      logForCSLogCategoryQuery();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __28__CSUserQuery_mailResources__block_invoke_cold_4();
    }
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    __28__CSUserQuery_mailResources__block_invoke_cold_1();
  }

}

+ (void)sortSearchableItems:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &__block_literal_global_52);
}

uint64_t __35__CSUserQuery_sortSearchableItems___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;

  v4 = a3;
  objc_msgSend(a2, "attributeSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL2"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LODWORD(v8) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
  }
  objc_msgSend(v4, "attributeSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "attributeDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("kMDQueryResultScoreL2"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    LODWORD(v13) = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v13);
    v14 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v14;
  }
  objc_msgSend(v7, "floatValue");
  v16 = v15;
  objc_msgSend(v12, "floatValue");
  if (v16 <= v17)
  {
    objc_msgSend(v7, "floatValue");
    v20 = v19;
    objc_msgSend(v12, "floatValue");
    v18 = v20 < v21;
  }
  else
  {
    v18 = -1;
  }

  return v18;
}

+ (void)updateWithTemplateSuggestions:(id)a3 searchString:(id)a4 currentSuggestion:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "length"))
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v9, "suggestionTokens", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v27 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            if (objc_msgSend(v18, "internalType") != 1)
              objc_msgSend(v12, "addObject:", v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v15);
      }

      objc_msgSend(v9, "userQueryString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSSuggestion updatedSuggestionWithCurrentSuggestion:userString:tokens:](CSSuggestion, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v9, v19, v12);
      v20 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSSuggestion subjectSuggestionWithUserString:currentSuggestion:](CSSuggestion, "subjectSuggestionWithUserString:currentSuggestion:", 0, v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (v22)
        objc_msgSend(v21, "addObject:", v22);
      +[CSSuggestion attachmentNameSuggestionWithUserString:currentSuggestion:](CSSuggestion, "attachmentNameSuggestionWithUserString:currentSuggestion:", 0, v20);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        objc_msgSend(v21, "addObject:", v23);
      +[CSSuggestion messageWithAttachmentsSuggestionWithUserString:currentSuggestion:](CSSuggestion, "messageWithAttachmentsSuggestionWithUserString:currentSuggestion:", 0, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
        objc_msgSend(v21, "addObject:", v24);
      if (_os_feature_enabled_impl() && (unint64_t)objc_msgSend(v11, "length") >= 2)
      {
        +[CSSuggestion senderContainsSuggestionWithUserString:currentSuggestion:](CSSuggestion, "senderContainsSuggestionWithUserString:currentSuggestion:", v11, v20);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v21, "addObject:", v25);

      }
      objc_msgSend(v7, "addObjectsFromArray:", v21);

      v9 = (id)v20;
    }

  }
}

+ (id)flattenCSFieldSpecifications:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "dictionaryFormat", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "displayName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setValue:forKey:", v11, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)queryContextWithUserQueryString:(id)a3 searchString:(id)a4 clientContext:(id)a5
{
  __CFString *v7;
  id v8;
  id v9;
  void *v10;
  CSSearchQueryContext *v11;
  void *v12;
  CSSearchQueryContext *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  char *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  __CFString *v47;
  void *v48;
  _QWORD v49[3];
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  v8 = a4;
  v9 = a5;
  v48 = v9;
  if (!v9)
  {
    +[CSUserQueryContext userQueryContextWithCurrentSuggestion:](CSUserQueryContext, "userQueryContextWithCurrentSuggestion:", 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v50[0] = CFSTR("kMDItemDisplayName");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFetchAttributes:", v10);

    objc_msgSend(v9, "setMaxRankedResultCount:", 100);
    objc_msgSend(v9, "setMaxSuggestionCount:", 10);
  }
  v11 = [CSSearchQueryContext alloc];
  objc_msgSend(v9, "xpc_dictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[CSSearchQueryContext initWithXPCDictionary:](v11, "initWithXPCDictionary:", v12);

  if (objc_msgSend(v9, "generateSuggestions"))
    v14 = objc_msgSend(v9, "maxSuggestionCount") > 0;
  else
    v14 = 0;
  -[CSSearchQueryContext setGenerateSuggestions:](v13, "setGenerateSuggestions:", v14);
  -[CSSearchQueryContext setMaxCount:](v13, "setMaxCount:", objc_msgSend(v9, "maxResultCount"));
  -[CSSearchQueryContext setMaxRankedResultCount:](v13, "setMaxRankedResultCount:", objc_msgSend(v9, "maxRankedResultCount"));
  -[CSSearchQueryContext setMaxSuggestionCount:](v13, "setMaxSuggestionCount:", objc_msgSend(v9, "maxSuggestionCount"));
  objc_msgSend(v9, "embeddingRelevanceThreshold");
  -[CSSearchQueryContext setEmbeddingRelevanceThreshold:](v13, "setEmbeddingRelevanceThreshold:");
  v15 = objc_msgSend(v9, "enableSuggestionTokens");
  v16 = objc_msgSend(v9, "enableRecentSuggestions");
  v17 = objc_msgSend(v9, "enableResultCountsPerSuggestion");
  v18 = (objc_msgSend(v9, "enableRankedResults") & 1) != 0 || objc_msgSend(v9, "rankingType") == 1;
  v19 = objc_msgSend(v9, "isMail");
  if (v19)
  {
    if (-[CSSearchQueryContext maxRankedResultCount](v13, "maxRankedResultCount") <= 0)
      -[CSSearchQueryContext setMaxRankedResultCount:](v13, "setMaxRankedResultCount:", -[CSSearchQueryContext maxCount](v13, "maxCount"));
    v15 = 1;
    -[CSSearchQueryContext setFilterTopHits:](v13, "setFilterTopHits:", 1);
    v16 = 1;
    v17 = 1;
  }
  -[CSSearchQueryContext setEnableSuggestionTokens:](v13, "setEnableSuggestionTokens:", v15);
  -[CSSearchQueryContext setEnableRecentSuggestions:](v13, "setEnableRecentSuggestions:", v16);
  -[CSSearchQueryContext setEnableResultCountsPerSuggestion:](v13, "setEnableResultCountsPerSuggestion:", v17);
  objc_msgSend(v9, "customFieldSpecifications");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setCustomFieldSpecifications:](v13, "setCustomFieldSpecifications:", v20);

  objc_msgSend(v9, "options");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setOptions:](v13, "setOptions:", v21);

  -[CSSearchQueryContext setFeedbackQueryID:](v13, "setFeedbackQueryID:", objc_msgSend(v9, "feedbackQueryID"));
  if (v18)
  {
    -[CSSearchQueryContext setLowPriority:](v13, "setLowPriority:", 0);
    -[CSSearchQueryContext setRankingType:](v13, "setRankingType:", 1);
    -[CSSearchQueryContext setFilterTopHits:](v13, "setFilterTopHits:", 0);
    if (-[CSSearchQueryContext maxCount](v13, "maxCount") >= 1)
      -[CSSearchQueryContext setFilterTopHits:](v13, "setFilterTopHits:", 1);
    v49[0] = CFSTR("kMDQueryResultNewMatchedExtraQueriesField");
    v49[1] = CFSTR("kMDQueryResultScoreL1");
    v49[2] = CFSTR("kMDQueryResultScoreL2");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "fetchAttributes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      objc_msgSend(v9, "fetchAttributes");
      v24 = v7;
      v25 = v8;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "arrayByAddingObjectsFromArray:", v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSearchQueryContext setFetchAttributes:](v13, "setFetchAttributes:", v27);

      v8 = v25;
      v7 = v24;
    }
    else
    {
      -[CSSearchQueryContext setFetchAttributes:](v13, "setFetchAttributes:", v22);
    }

  }
  objc_msgSend(v9, "suggestion");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v28, "copy");

  objc_msgSend(v29, "setEnableFragments:", v15);
  -[CSSearchQueryContext setSuggestion:](v13, "setSuggestion:", v29);
  v30 = &stru_1E2406B38;
  if (v7)
    v30 = v7;
  v31 = v30;
  -[CSSearchQueryContext suggestion](v13, "suggestion");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[CSSearchQueryContext suggestion](v13, "suggestion");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "userQueryString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[CSSearchQueryContext enableSuggestionTokens](v13, "enableSuggestionTokens"))
    {
      if (!v19 || v7 && v34 && (-[__CFString isEqualToString:](v31, "isEqualToString:", v34) & 1) != 0)
        goto LABEL_36;
      v47 = v7;
      v35 = v8;
      logForCSLogCategoryQuery();
      v36 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEBUG))
        +[CSUserQuery queryContextWithUserQueryString:searchString:clientContext:].cold.1(v48, v36);

      -[CSSearchQueryContext suggestion](v13, "suggestion");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSearchQueryContext suggestion](v13, "suggestion");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "currentTokens");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSSuggestion updatedSuggestionWithCurrentSuggestion:userString:tokens:](CSSuggestion, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v37, v31, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSearchQueryContext setSuggestion:](v13, "setSuggestion:", v40);

    }
    else
    {
      v47 = v7;
      v35 = v8;
      logForCSLogCategoryQuery();
      v42 = (char *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v42, OS_LOG_TYPE_DEBUG))
        +[CSUserQuery queryContextWithUserQueryString:searchString:clientContext:].cold.1(v48, v42);

      -[CSSearchQueryContext suggestion](v13, "suggestion");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSSuggestion suggestionWithUserString:currentSuggestion:](CSSuggestion, "suggestionWithUserString:currentSuggestion:", v31, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSSearchQueryContext setSuggestion:](v13, "setSuggestion:", v38);
    }

    v8 = v35;
    v7 = v47;
LABEL_36:
    -[CSSearchQueryContext suggestion](v13, "suggestion");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "userQueryString");
    v44 = objc_claimAutoreleasedReturnValue();

    -[CSSearchQueryContext suggestion](v13, "suggestion");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "searchString");
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (__CFString *)v44;
    goto LABEL_37;
  }
  v41 = v31;
LABEL_37:
  -[CSSearchQueryContext setUserQuery:](v13, "setUserQuery:", v31);
  if (v8 && v41)
    objc_msgSend(v8, "appendString:", v41);

  return v13;
}

+ (id)advancedComponentsWithSearchString:(id)a3 userQueryString:(id)a4 parseResult:(id)a5 parseOptions:(id)a6 userQueryOptions:(unsigned int)a7
{
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  char v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  void *v52;
  void *v53;
  int v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  _BOOL4 v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  id v84;
  void *v85;
  char v86;
  uint64_t v87;
  uint64_t v88;
  id obj;
  uint64_t v90;
  id v91;
  void *v92;
  id v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *v102;
  id v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  id v110;
  id v111;
  uint64_t v112;
  uint64_t v113;
  id v114;
  uint64_t v115;
  void *v116;
  void *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  id v122;
  _QWORD v123[8];
  uint64_t v124;
  uint64_t *v125;
  uint64_t v126;
  char v127;
  _QWORD v128[3];
  char v129;
  uint64_t v130;
  uint64_t *v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v110 = a4;
  v84 = a5;
  v94 = a6;
  v85 = v10;
  objc_msgSend(v10, "cs_escapedStringForSearchQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v94, "objectForKeyedSubscript:", CFSTR("kMDQueryOptionContextIdentifier"));
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v91 = (id)objc_claimAutoreleasedReturnValue();
  v104 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v84, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryAdvancedComponentsKey"));
  v146 = 0u;
  v147 = 0u;
  v144 = 0u;
  v145 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v151, 16);
  if (!v88)
  {
    v86 = 0;
    v109 = 0;
    goto LABEL_150;
  }
  v86 = 0;
  v109 = 0;
  v87 = *(_QWORD *)v145;
  v105 = *MEMORY[0x1E0CB2D28];
  v97 = 0x7FFFFFFFFFFFFFFFLL;
  v99 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v12 = 0;
    do
    {
      if (*(_QWORD *)v145 != v87)
      {
        v13 = v12;
        objc_enumerationMutation(obj);
        v12 = v13;
      }
      v90 = v12;
      v14 = *(void **)(*((_QWORD *)&v144 + 1) + 8 * v12);
      objc_msgSend(obj, "lastObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v103) = objc_msgSend(v14, "isEqualToDictionary:", v15);

      v142 = 0u;
      v143 = 0u;
      v140 = 0u;
      v141 = 0u;
      v111 = v14;
      v108 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
      if (!v108)
      {

        if ((_DWORD)v103)
        {
          v56 = 0;
          v57 = 0;
          v96 = -1;
          goto LABEL_117;
        }
        v78 = 0;
        goto LABEL_146;
      }
      v16 = 0;
      v106 = *(_QWORD *)v141;
      v107 = 0;
      v96 = -1;
      v112 = 0x7FFFFFFFFFFFFFFFLL;
      v113 = 0;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v141 != v106)
          {
            v18 = v17;
            objc_enumerationMutation(v111);
            v17 = v18;
          }
          v115 = v17;
          v19 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * v17);
          objc_msgSend(v111, "objectForKeyedSubscript:", v19);
          v117 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("ATTRS"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v116 = v20;
          if (!v20)
          {
            objc_msgSend(v117, "objectForKeyedSubscript:", CFSTR("TYPE"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v102 && objc_msgSend(v102, "isEqualToString:", CFSTR("com.apple.mail")))
            {
              if ((objc_msgSend(v22, "hasPrefix:", CFSTR("DATES")) & 1) == 0)
              {
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("MAIL")) & 1) != 0)
                  goto LABEL_18;
                v32 = objc_msgSend(v22, "hasSuffix:", CFSTR("MESSAGES"));
                v23 = 14;
                if (!v32)
                  v23 = 2;
LABEL_54:
                v113 = v23;

                goto LABEL_55;
              }
            }
            else if ((objc_msgSend(v22, "hasPrefix:", CFSTR("DATES")) & 1) == 0)
            {
              if ((objc_msgSend(v22, "hasSuffix:", CFSTR("CONTACT")) & 1) != 0)
              {
                v23 = 16;
                goto LABEL_54;
              }
              if ((objc_msgSend(v22, "hasSuffix:", CFSTR("DOCUMENTS")) & 1) == 0)
              {
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("EMAIL")) & 1) != 0)
                  goto LABEL_46;
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("EVENT")) & 1) != 0)
                {
                  v23 = 7;
                  goto LABEL_54;
                }
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("TODO")) & 1) != 0
                  || (objc_msgSend(v22, "hasSuffix:", CFSTR("EVENT_TODO")) & 1) != 0)
                {
                  v23 = 21;
                  goto LABEL_54;
                }
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("IMAGES")) & 1) != 0)
                {
                  v23 = 10;
                  goto LABEL_54;
                }
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("MOVIES")) & 1) != 0)
                {
                  v23 = 36;
                  goto LABEL_54;
                }
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("MUSIC")) & 1) != 0)
                {
                  v23 = 3;
                  goto LABEL_54;
                }
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("MAIL")) & 1) != 0)
                {
LABEL_46:
                  v23 = 11;
                  goto LABEL_54;
                }
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("MESSAGES")) & 1) != 0)
                {
LABEL_18:
                  v23 = 14;
                  goto LABEL_54;
                }
                if ((objc_msgSend(v22, "hasSuffix:", CFSTR("PDF")) & 1) == 0)
                {
                  if ((objc_msgSend(v22, "hasSuffix:", CFSTR("PRESENTATIONS")) & 1) != 0)
                  {
                    v23 = 18;
                  }
                  else if ((objc_msgSend(v22, "hasSuffix:", CFSTR("SPREADSHEETS")) & 1) != 0)
                  {
                    v23 = 23;
                  }
                  else
                  {
                    v54 = objc_msgSend(v22, "hasSuffix:", CFSTR("SOURCE"));
                    v23 = 6;
                    if (v54)
                      v23 = 22;
                  }
                  goto LABEL_54;
                }
              }
              v23 = 6;
              goto LABEL_54;
            }
            v23 = 5;
            goto LABEL_54;
          }
          if ((objc_msgSend(v20, "containsObject:", CFSTR("kMDItemContentCreationDate")) & 1) != 0)
          {
            v21 = 5;
LABEL_21:
            v113 = v21;
            goto LABEL_55;
          }
          if ((objc_msgSend(v116, "containsObject:", CFSTR("kMDItemAuthors")) & 1) != 0)
          {
            v96 = 0;
            v21 = 16;
            goto LABEL_21;
          }
          if ((objc_msgSend(v116, "containsObject:", CFSTR("kMDItemRecipients")) & 1) != 0)
          {
            v113 = 16;
            v96 = 1;
          }
          else if ((objc_msgSend(v116, "containsObject:", CFSTR("kMDItemSubject")) & 1) != 0
                 || (objc_msgSend(v116, "containsObject:", CFSTR("kMDItemTitle")) & 1) != 0
                 || objc_msgSend(v116, "containsObject:", CFSTR("kMDItemDisplayName")))
          {
            objc_msgSend(v19, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR(" "));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            +[CSUserQuery parseSearchString:parseOptions:userQueryOptions:](CSUserQuery, "parseSearchString:parseOptions:userQueryOptions:", v22, v94, a7);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryUniversalSuggestionsKey"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v25, "count"))
            {
              v138 = 0u;
              v139 = 0u;
              v136 = 0u;
              v137 = 0u;
              v26 = v25;
              v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
              if (v27)
              {
                v28 = *(_QWORD *)v137;
                while (2)
                {
                  for (i = 0; i != v27; ++i)
                  {
                    if (*(_QWORD *)v137 != v28)
                      objc_enumerationMutation(v26);
                    objc_msgSend(*(id *)(*((_QWORD *)&v136 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("suggestionTypeKey"));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    v31 = v30;
                    if (v30
                      && ((objc_msgSend(v30, "isEqualToString:", CFSTR("kQPTokenSubject")) & 1) != 0
                       || objc_msgSend(v31, "isEqualToString:", CFSTR("kQPTokenTitle"))))
                    {
                      objc_msgSend(v91, "setObject:forKey:", v26, CFSTR("suggestionResults"));

                      goto LABEL_51;
                    }

                  }
                  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v136, v149, 16);
                  if (v27)
                    continue;
                  break;
                }
              }
LABEL_51:

            }
            else
            {
              objc_msgSend(v91, "setObject:forKey:", MEMORY[0x1E0C9AA60], CFSTR("suggestionResults"));
            }

            v23 = 34;
            goto LABEL_54;
          }
LABEL_55:
          v130 = 0;
          v131 = &v130;
          v132 = 0x3032000000;
          v133 = __Block_byref_object_copy__0;
          v134 = __Block_byref_object_dispose__0;
          v135 = 0;
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v135 = (id)objc_claimAutoreleasedReturnValue();
          v128[0] = 0;
          v128[1] = v128;
          v128[2] = 0x2020000000;
          v129 = 0;
          v124 = 0;
          v125 = &v124;
          v126 = 0x2020000000;
          v127 = 0;
          v33 = objc_msgSend(v19, "length");
          v123[0] = MEMORY[0x1E0C809B0];
          v123[1] = 3221225472;
          v123[2] = __108__CSUserQuery_advancedComponentsWithSearchString_userQueryString_parseResult_parseOptions_userQueryOptions___block_invoke;
          v123[3] = &unk_1E24012A0;
          v123[4] = v19;
          v123[5] = v128;
          v123[6] = &v130;
          v123[7] = &v124;
          objc_msgSend(v19, "enumerateLinguisticTagsInRange:scheme:options:orthography:usingBlock:", 0, v33, v105, 4, 0, v123);
          if (objc_msgSend((id)v131[5], "count") && *((_BYTE *)v125 + 24))
            objc_msgSend((id)v131[5], "addObject:", CFSTR(")"));
          objc_msgSend((id)v131[5], "componentsJoinedByString:", &stru_1E2406B38);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v122 = 0;
          objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", v34, 1, &v122);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = v122;
          objc_msgSend(v35, "matchesInString:options:range:", v110, 0, 0, objc_msgSend(v110, "length"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v36, "count"))
          {
            objc_msgSend(v36, "lastObject");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v37, "numberOfRanges") < 2)
              goto LABEL_81;
            v97 = objc_msgSend(v37, "rangeAtIndex:", 0);
            v38 = v117;
            v112 = objc_msgSend(v37, "rangeAtIndex:", objc_msgSend(v37, "numberOfRanges") - 1);
            v107 = v39;
            if ((v103 & 1) != 0)
            {
              objc_msgSend(v110, "substringWithRange:", v112, v39);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              v100 = objc_msgSend(v110, "length") - v112;
              objc_msgSend(v110, "substringWithRange:");
              v101 = (void *)objc_claimAutoreleasedReturnValue();

              if (v113 == 5)
              {
                +[CSUserQuery parseSearchString:parseOptions:userQueryOptions:](CSUserQuery, "parseSearchString:parseOptions:userQueryOptions:", v101, v94, a7);
                v92 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v92, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryUniversalSuggestionsKey"));
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v95, "count"))
                {
                  v120 = 0u;
                  v121 = 0u;
                  v118 = 0u;
                  v119 = 0u;
                  v103 = v95;
                  v40 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v118, v148, 16);
                  if (v40)
                  {
                    v41 = *(_QWORD *)v119;
                    while (2)
                    {
                      for (j = 0; j != v40; ++j)
                      {
                        if (*(_QWORD *)v119 != v41)
                          objc_enumerationMutation(v103);
                        v43 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * j);
                        objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("suggestionTypeKey"));
                        v44 = (void *)objc_claimAutoreleasedReturnValue();
                        if (v44)
                        {
                          objc_msgSend(v43, "objectForKeyedSubscript:", CFSTR("suggestionTypeKey"));
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          v46 = objc_msgSend(v45, "isEqualToString:", CFSTR("kQPTokenDate"));

                          if ((v46 & 1) != 0)
                          {

                            objc_msgSend(v91, "setObject:forKey:", v103, CFSTR("suggestionResults"));
                            LOBYTE(v103) = 1;
                            goto LABEL_79;
                          }
                        }
                      }
                      v40 = objc_msgSend(v103, "countByEnumeratingWithState:objects:count:", &v118, v148, 16);
                      if (v40)
                        continue;
                      break;
                    }
                  }

                }
                v47 = v98;

                LOBYTE(v103) = 0;
                v100 = v107;
                v101 = v47;
LABEL_79:

              }
              else
              {
                LOBYTE(v103) = 1;
                if (v113 != 16)
                  v100 = v107;
              }

              v11 = v101;
              v107 = v100;
              v99 = v112;
LABEL_81:
              v38 = v117;
            }
            else
            {
              LOBYTE(v103) = 0;
            }
            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("QUERY"));
            v48 = objc_claimAutoreleasedReturnValue();

            if (v113 == 5 && v48 && v112 != 0x7FFFFFFFFFFFFFFFLL)
            {
              objc_msgSend(v110, "substringWithRange:", v112, v107);
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "objectForKeyedSubscript:", v48);
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v50 == 0;

              if (v51)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "set");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "setObject:forKey:", v52, v48);

              }
              objc_msgSend(v104, "objectForKeyedSubscript:", v48);
              v53 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "addObject:", v49);

            }
            v109 = (void *)v48;
          }

          _Block_object_dispose(&v124, 8);
          _Block_object_dispose(v128, 8);
          _Block_object_dispose(&v130, 8);

          v17 = v115 + 1;
          v16 = v117;
        }
        while (v115 + 1 != v108);
        v55 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v140, v150, 16);
        v108 = v55;
        v16 = v117;
      }
      while (v55);

      if ((v103 & 1) == 0)
      {
        if (v112 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_145;
        v63 = objc_msgSend(v110, "length");
        v64 = v112 + v107;
        if (v112 + v107 == objc_msgSend(v110, "length"))
          goto LABEL_145;
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = v63 - v64;
        v67 = objc_msgSend(v110, "rangeOfCharacterFromSet:options:range:", v65, 8, v64, v66);
        v69 = v68;

        if (v67 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v64 = v67 + v69;
          v66 = objc_msgSend(v110, "length") - (v67 + v69);
        }
        v70 = v110;
        if (v99 != 0x7FFFFFFFFFFFFFFFLL && v109)
        {
          objc_msgSend(v110, "substringWithRange:");
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v104, "objectForKeyedSubscript:", v109);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = v72 == 0;

          if (v73)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "setObject:forKey:", v74, v109);

          }
          objc_msgSend(v104, "objectForKeyedSubscript:", v109);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "addObject:", v71);

          v70 = v110;
        }
        if (v64)
        {
          objc_msgSend(v70, "substringWithRange:", 0, v64);
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v91, "setObject:forKey:", v76, CFSTR("internalString"));

          v70 = v110;
        }
        objc_msgSend(v70, "substringWithRange:", v64, v66);
        v86 = 1;
        v77 = v11;
        v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_143:

        goto LABEL_144;
      }
      v56 = v117;
      v57 = v113;
LABEL_117:
      if (v97 && v97 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v58 = v57;
        objc_msgSend(v110, "substringWithRange:", 0, v97);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "setObject:forKey:", v59, CFSTR("internalString"));

        v57 = v58;
      }
      v117 = v56;
      if (v56)
      {
        v60 = v57;
        objc_msgSend(v91, "setObject:forKey:", v56, CFSTR("advancedComponents"));
        v57 = v60;
      }
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v57);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKey:", v61, CFSTR("suggestionTokenKind"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v96);
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v91, "setObject:forKey:", v62, CFSTR("suggestionTokenScope"));

      if (objc_msgSend(v11, "length"))
      {
        v86 = 1;
      }
      else
      {
        v79 = v85;

        v11 = v79;
      }
      objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("suggestionResults"));
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      if (v77)
        goto LABEL_143;
      if (objc_msgSend(v11, "length"))
      {
        +[CSUserQuery parseSearchString:parseOptions:userQueryOptions:](CSUserQuery, "parseSearchString:parseOptions:userQueryOptions:", v11, v94, a7);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryUniversalSuggestionsKey"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v80, "count"))
          objc_msgSend(v91, "setObject:forKey:", v80, CFSTR("suggestionResults"));

        goto LABEL_143;
      }
LABEL_144:
      v99 = 0;
LABEL_145:
      v78 = v117;
LABEL_146:

      v12 = v90 + 1;
    }
    while (v90 + 1 != v88);
    v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v144, v151, 16);
  }
  while (v88);
LABEL_150:

  if (objc_msgSend(v104, "count"))
    objc_msgSend(v91, "setObject:forKey:", v104, CFSTR("reparseDateKeys"));
  objc_msgSend(v91, "setObject:forKey:", v11, CFSTR("suggestionString"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v86 & 1);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "setObject:forKey:", v81, CFSTR("hasAdvancedComponents"));

  v82 = v91;
  return v82;
}

void __108__CSUserQuery_advancedComponentsWithSearchString_userQueryString_parseResult_parseOptions_userQueryOptions___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "substringWithRange:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "isEqualToString:", CFSTR(":"));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count")
    && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", CFSTR("\\s*?"));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", CFSTR("("));
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  }
  else if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") >= 3
         && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", CFSTR("\\s*?"));
  }

}

+ (BOOL)skipTextSemanticSearchForSearchString:(id)a3 tokenCount:(id)a4 queryContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  int v13;
  unint64_t v14;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!objc_msgSend(v7, "length"))
  {
    v11 = 1;
    v10 = v7;
    goto LABEL_9;
  }
  objc_msgSend(v7, "normalizeForSemanticSearch");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "length") && (objc_msgSend(v10, "isAllNumbersOrSpaces") & 1) == 0)
  {
    if (v9 && (objc_msgSend(v9, "isPhotos") & 1) == 0)
    {
      if (objc_msgSend(v8, "unsignedIntValue") < 2)
        goto LABEL_4;
      v13 = objc_msgSend(v10, "containsCJK");
      v14 = objc_msgSend(v10, "length");
      if (v13)
      {
        if (v14 < 3)
          goto LABEL_4;
      }
      else if (v14 < 6)
      {
        goto LABEL_4;
      }
    }
    v11 = 0;
    goto LABEL_9;
  }
LABEL_4:
  v11 = 1;
LABEL_9:

  return v11;
}

+ (id)trimCharactersInString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3500];
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsSeparatedByCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)removeSuggestionsAndTrimChars:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD v23[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __45__CSUserQuery_removeSuggestionsAndTrimChars___block_invoke;
  v23[3] = &unk_1E24012C8;
  v8 = v5;
  v24 = v8;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v23);
  if (objc_msgSend(v8, "count"))
  {
    v9 = (void *)objc_msgSend(v6, "mutableCopy");
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v8, "reverseObjectEnumerator", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v20;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v20 != v13)
            objc_enumerationMutation(v10);
          v15 = objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v14), "rangeValue");
          objc_msgSend(v9, "replaceCharactersInRange:withString:", v15, v16, &stru_1E2406B38);
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v12);
    }

    objc_msgSend(a1, "trimCharactersInString:", v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "trimCharactersInString:", v6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void __45__CSUserQuery_removeSuggestionsAndTrimChars___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  if (objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("kMDItemTextContent"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", a3, a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

+ (id)parseSearchString:(id)a3 parseOptions:(id)a4 userQueryOptions:(unsigned int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v5 = *(_QWORD *)&a5;
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    GetCSUserQueryParser();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_CSQueryCreateQueryDictionaryWithOptionsDict:attribute:input:options:", v8, 0, v7, v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)parseResultWithSearchString:(id)a3 parseOptions:(id)a4 queryContext:(id)a5 isZKW:(BOOL)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  char v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  char v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  void *v53;
  void *v54;
  int v55;
  uint64_t v56;
  void *v57;
  void *v58;
  int v59;
  void *v60;
  char isKindOfClass;
  void *v62;
  int v63;
  NSObject *v64;
  uint64_t v65;
  id v66;
  void *v67;
  void *v68;
  char v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  _CSEmbedding *v77;
  void *v78;
  _CSEmbedding *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  float v91;
  float v92;
  void *v93;
  _BOOL8 v94;
  void *v95;
  int v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  float v101;
  uint64_t v102;
  double v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  void *v107;
  int v108;
  NSObject *v109;
  _BOOL4 v110;
  uint64_t v111;
  const char *v112;
  NSObject *v113;
  uint32_t v114;
  uint64_t v115;
  NSObject *v116;
  uint64_t v117;
  _CSEmbedding *v118;
  char *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  int v126;
  NSObject *v127;
  void *v128;
  void *v129;
  void *v130;
  id v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t i;
  void *v136;
  id v137;
  id v138;
  void *v139;
  void *v140;
  id v141;
  id v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  unint64_t v148;
  void *v149;
  void *v150;
  char v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id v157;
  id v158;
  id v159;
  void *v160;
  void *v161;
  uint64_t v163;
  void *v164;
  void *v165;
  char v166;
  void *v167;
  _CSEmbedding *v168;
  int v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  char v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  uint64_t v197;
  _BYTE v198[128];
  _BYTE v199[128];
  _BYTE buf[12];
  __int16 v201;
  id v202;
  uint64_t v203;

  v203 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v10, "suggestion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "queryString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "length"))
  {
    logForCSLogCategoryQuery();
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEBUG))
      +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:].cold.5(v10, v15);

    objc_msgSend(v12, "addObject:", v14);
  }
  objc_msgSend(v10, "userQuery");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isFinder"))
  {
    objc_msgSend(v16, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFC"), &stru_1E2406B38);
    v17 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v17;
  }
  v175 = v14;
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = v8;
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = v16;
  objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = v19;
  if (objc_msgSend(v21, "length"))
  {

  }
  else
  {
    v22 = objc_msgSend(v19, "length");

    if (!v22)
      goto LABEL_168;
  }
  v179 = v12;
  v188 = v11;
  +[CSUserQuery parseSearchString:parseOptions:userQueryOptions:](CSUserQuery, "parseSearchString:parseOptions:userQueryOptions:", v187, v9, objc_msgSend(v10, "userQueryOptions"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v185 = v9;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("disableKeywordSearch"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "BOOLValue");

  objc_msgSend(v10, "attributedUserQuery");
  v27 = objc_claimAutoreleasedReturnValue();
  v183 = v10;
  if (!v27)
    goto LABEL_16;
  v28 = (void *)v27;
  objc_msgSend(v10, "bundleIDs");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v29, "count"))
  {

    goto LABEL_16;
  }
  objc_msgSend(v10, "bundleIDs");
  v30 = v23;
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectAtIndexedSubscript:", 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isEqual:", CFSTR("com.apple.mobileslideshow"));

  v23 = v30;
  if (!v33)
  {
LABEL_16:
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryDefaultStringKey"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  objc_msgSend(v10, "attributedUserQuery");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSUserQuery removeSuggestionsAndTrimChars:](CSUserQuery, "removeSuggestionsAndTrimChars:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v35, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = \"%@*\"cdwt"), CFSTR("kMDItemTextContent"), v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
  }

LABEL_17:
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryAttributedInputKey"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryUnderstandingOutputKey"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v173 = v38;
  if (v38)
  {
    v39 = objc_msgSend(v38, "mutableCopy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v39 = objc_claimAutoreleasedReturnValue();
  }
  v40 = (void *)v39;
  v9 = v185;
  if (objc_msgSend(v37, "count"))
    objc_msgSend(v40, "setObject:forKeyedSubscript:", v37, CFSTR("attributedParses"));
  if (v36)
    v41 = v26;
  else
    v41 = 1;
  if ((v41 & 1) == 0)
    objc_msgSend(v24, "addObject:", v36);
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryConfidenceKey"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryNLPStringKey"));
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("kMDQueryOptionContextIdentifier"));
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v26 & 1) == 0
    && objc_msgSend(v182, "length")
    && (objc_msgSend(v36, "isEqualToString:", v182) & 1) == 0
    && (objc_msgSend(v42, "isEqualToString:", CFSTR("kMDUserQueryDictionaryQueryConfidenceLowValue")) & 1) == 0
    && (objc_msgSend(v42, "isEqualToString:", CFSTR("kMDUserQueryDictionaryQueryConfidenceNoneValue")) & 1) == 0)
  {
    logForCSLogCategoryQuery();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
      +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:].cold.4();

    if ((objc_msgSend(v183, "isPhotos") & 1) != 0)
      goto LABEL_42;
    objc_msgSend(v183, "bundleIDs");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v44, "count") == 1)
    {
      objc_msgSend(v183, "bundleIDs");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v45, "containsObject:", CFSTR("com.apple.mobileslideshow")))
      {

LABEL_42:
        if (objc_msgSend(v183, "enableInstantAnswers")
          && objc_msgSend(v182, "rangeOfString:", CFSTR("kMDItemEvent")) != 0x7FFFFFFFFFFFFFFFLL)
        {
          logForCSLogCategoryQuery();
          v47 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
            +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:].cold.3();

          objc_msgSend(v188, "setObject:forKey:", v182, CFSTR("instantAnswers"));
        }
        goto LABEL_47;
      }
      v181 = objc_msgSend(v184, "isEqualToString:", CFSTR("com.apple.photos"));

      if ((v181 & 1) != 0)
        goto LABEL_42;
    }
    else
    {
      v46 = objc_msgSend(v184, "isEqualToString:", CFSTR("com.apple.photos"));

      if ((v46 & 1) != 0)
        goto LABEL_42;
    }
    objc_msgSend(v24, "addObject:", v182);
    goto LABEL_42;
  }
LABEL_47:
  v174 = v36;
  objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryInputAttributesKey"));
  v10 = v183;
  v11 = v188;
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v177 = v23;
  v178 = v42;
  v171 = v40;
  v172 = v37;
  if (v180)
  {
    objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("kMDQueryOptionEmbeddingEnabledKey"));
    v48 = objc_claimAutoreleasedReturnValue();
    if (!v48
      || (v49 = (void *)v48,
          objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("kMDQueryOptionEmbeddingEnabledKey")),
          v50 = (void *)objc_claimAutoreleasedReturnValue(),
          v51 = objc_msgSend(v50, "BOOLValue"),
          v50,
          v49,
          !v51))
    {
LABEL_124:
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("attributedResultKey"));
      v120 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v177;
      if (v120)
      {
        v121 = v40;
        v122 = v37;
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("forwardAttributedInput"));
        v123 = objc_claimAutoreleasedReturnValue();
        if (v123)
        {
          v124 = (void *)v123;
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("forwardAttributedInput"));
          v125 = (void *)objc_claimAutoreleasedReturnValue();
          v126 = objc_msgSend(v125, "BOOLValue");

          v23 = v177;
          if (v126)
            objc_msgSend(v11, "setObject:forKey:", v120, CFSTR("attributedInput"));
        }
        logForCSLogCategoryQuery();
        v127 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_DEBUG))
          +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:].cold.1();

        v37 = v122;
        v40 = v121;
      }

      goto LABEL_132;
    }
    objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("forwardEmbeddings"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (v52)
    {
      objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("forwardEmbeddings"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v185;
      v55 = objc_msgSend(v53, "BOOLValue") ^ 1;

    }
    else
    {
      v54 = v185;
      LOBYTE(v55) = 1;
    }

    objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("addAnnNode"));
    v56 = objc_claimAutoreleasedReturnValue();
    if (!v56
      || (v57 = (void *)v56,
          objc_msgSend(v54, "objectForKeyedSubscript:", CFSTR("addAnnNode")),
          v58 = (void *)objc_claimAutoreleasedReturnValue(),
          v59 = objc_msgSend(v58, "BOOLValue"),
          v58,
          v57,
          !v59))
    {
      v63 = 0;
LABEL_69:
      objc_msgSend(v180, "objectForKeyedSubscript:", CFSTR("embeddingResultKey"));
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v76 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v79 = 0;
        v107 = 0;
        v9 = v185;
        goto LABEL_118;
      }
      v169 = v63;
      objc_msgSend(v10, "setQueryEmbedding:", v76);
      v77 = [_CSEmbedding alloc];
      objc_msgSend(v10, "queryEmbedding");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v79 = -[_CSEmbedding initWithEncodedData:](v77, "initWithEncodedData:", v78);

      if (!v79)
      {
        v107 = 0;
        v9 = v185;
        v63 = v169;
        goto LABEL_118;
      }
      -[_CSEmbedding vectors](v79, "vectors");
      v168 = v79;
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "count");

      if (!v81)
      {
        v107 = 0;
        v9 = v185;
        v63 = v169;
LABEL_117:
        v79 = v168;
LABEL_118:
        if (v63 && !objc_msgSend(v107, "length"))
        {
          v118 = v79;
          logForCSLogCategoryDefault();
          v119 = (char *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled((os_log_t)v119, OS_LOG_TYPE_ERROR))
            +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:].cold.2(v10, v119);

          objc_msgSend(v24, "addObject:", CFSTR("(false)"));
          v79 = v118;
        }

        v11 = v188;
        goto LABEL_124;
      }
      -[_CSEmbedding properties](v168, "properties");
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "objectForKey:", CFSTR("vec_scale"));
      v165 = (void *)objc_claimAutoreleasedReturnValue();

      -[_CSEmbedding properties](v168, "properties");
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v83, "objectForKey:", CFSTR("vec_bias"));
      v164 = (void *)objc_claimAutoreleasedReturnValue();

      if ((v55 & 1) == 0)
      {
        v84 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v10, "embeddingRelevanceThreshold");
        objc_msgSend(v84, "numberWithDouble:");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v85, CFSTR("embeddingRelevanceThreshold"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", -[_CSEmbedding version](v168, "version"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v86, CFSTR("embeddingVersion"));

        if (v165 && v164)
        {
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v165, CFSTR("embeddingScale"));
          objc_msgSend(v40, "setObject:forKeyedSubscript:", v164, CFSTR("embeddingBias"));
        }
        objc_msgSend(v188, "setObject:forKey:", v168, CFSTR("kQPPhotosEmbedding"));
      }
      v63 = v169;
      if (v169)
      {
        objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("annMaxCount"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "unsignedLongValue");
        if (v88)
          v89 = v88;
        else
          v89 = 100;

        objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("annMaxDistance"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "floatValue");
        v92 = v91;

        objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("annBruteForce"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = objc_msgSend(v93, "unsignedIntValue") != 0;

        objc_msgSend(v185, "objectForKeyedSubscript:", CFSTR("annIncludeSecondaryTextEmbedding"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v96 = objc_msgSend(v95, "BOOLValue");

        v195 = 0u;
        v196 = 0u;
        if (v96)
          v97 = &unk_1E242F2C8;
        else
          v97 = &unk_1E242F2B0;
        v193 = 0uLL;
        v194 = 0uLL;
        v98 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v193, v199, 16);
        if (v98)
        {
          v99 = v98;
          v100 = 0;
          v101 = *(float *)"ףp?";
          if (v92 != 0.0)
            v101 = v92;
          v102 = *(_QWORD *)v194;
          v103 = v101;
          do
          {
            v104 = 0;
            v105 = v100;
            do
            {
              if (*(_QWORD *)v194 != v102)
                objc_enumerationMutation(v97);
              v106 = *(_QWORD *)(*((_QWORD *)&v193 + 1) + 8 * v104);
              if (objc_msgSend(v105, "length"))
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ || aNN.data(%@, 0, %ld, %f, %u)"), v105, v106, v89, *(_QWORD *)&v103, v94);
              else
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("aNN.data(%@, 0, %ld, %f, %u)"), v106, v89, *(_QWORD *)&v103, v94, v163);
              v100 = (void *)objc_claimAutoreleasedReturnValue();

              ++v104;
              v105 = v100;
            }
            while (v99 != v104);
            v99 = objc_msgSend(v97, "countByEnumeratingWithState:objects:count:", &v193, v199, 16);
          }
          while (v99);
        }
        else
        {
          v100 = 0;
        }
        if (objc_msgSend(v100, "length"))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@)"), v100);
          v107 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "addObject:", v107);
          v10 = v183;
          v108 = objc_msgSend(v183, "privateQuery");
          logForCSLogCategoryDefault();
          v109 = objc_claimAutoreleasedReturnValue();
          v110 = os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT);
          v40 = v171;
          v37 = v172;
          if (v108)
          {
            v9 = v185;
            v63 = v169;
            if (v110)
            {
              v111 = objc_msgSend(v183, "queryID");
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)&buf[4] = v111;
              v112 = "qid=%ld - CSUserQuery: semanticQuery, enabled";
              v113 = v109;
              v114 = 12;
LABEL_112:
              _os_log_impl(&dword_18C42F000, v113, OS_LOG_TYPE_DEFAULT, v112, buf, v114);
            }
          }
          else
          {
            v9 = v185;
            v63 = v169;
            if (v110)
            {
              v115 = objc_msgSend(v183, "queryID");
              *(_DWORD *)buf = 134218242;
              *(_QWORD *)&buf[4] = v115;
              v201 = 2112;
              v202 = v107;
              v112 = "qid=%ld - CSUserQuery: semanticQuery, using <%@>";
              v113 = v109;
              v114 = 22;
              goto LABEL_112;
            }
          }

          goto LABEL_114;
        }
        v107 = v100;
        v9 = v185;
        v10 = v183;
        v40 = v171;
        v37 = v172;
        v63 = v169;
      }
      else
      {
        v107 = 0;
        v9 = v185;
      }
LABEL_114:
      logForCSLogCategoryDefault();
      v116 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
      {
        v117 = objc_msgSend(v10, "queryID");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v117;
        _os_log_impl(&dword_18C42F000, v116, OS_LOG_TYPE_DEFAULT, "qid=%ld - CSUserQuery: semanticQuery, enabled", buf, 0xCu);
      }

      goto LABEL_117;
    }
    v166 = v55;
    if (v177
      && (objc_msgSend(v177, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryTokenCountKey")),
          v60 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v60,
          (isKindOfClass & 1) != 0))
    {
      objc_msgSend(v177, "objectForKey:", CFSTR("kMDUserQueryDictionaryQueryTokenCountKey"));
      v62 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v62 = &unk_1E242FBF8;
    }
    v167 = v62;
    v55 = +[CSUserQuery skipTextSemanticSearchForSearchString:tokenCount:queryContext:](CSUserQuery, "skipTextSemanticSearchForSearchString:tokenCount:queryContext:", v187, v62, v183);
    if (v55)
    {
      logForCSLogCategoryQuery();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        v65 = objc_msgSend(v183, "queryID");
        CSRedactString(v187, 1);
        v66 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v65;
        v201 = 2112;
        v202 = v66;
        _os_log_impl(&dword_18C42F000, v64, OS_LOG_TYPE_DEFAULT, "qid=%ld - CSUserQuery: skipping semantic search for query %@", buf, 0x16u);

      }
    }
    else
    {
      if (!objc_msgSend(v183, "isMail"))
        goto LABEL_68;
      objc_msgSend((id)objc_opt_class(), "mailResources");
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v67)
        goto LABEL_68;
      objc_msgSend((id)objc_opt_class(), "mailResources");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_opt_respondsToSelector();

      if ((v69 & 1) == 0)
        goto LABEL_68;
      v70 = (void *)MEMORY[0x1E0C99DB8];
      objc_msgSend((id)objc_opt_class(), "mailResources");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "methodSignatureForSelector:", sel_logForTrigger_queryID_);
      v72 = v40;
      v73 = v37;
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "invocationWithMethodSignature:", v74);
      v64 = objc_claimAutoreleasedReturnValue();

      v37 = v73;
      v40 = v72;
      v10 = v183;

      -[NSObject setSelector:](v64, "setSelector:", sel_logForTrigger_queryID_);
      objc_msgSend((id)objc_opt_class(), "mailResources");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setTarget:](v64, "setTarget:", v75);

      *(_QWORD *)buf = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("8F368B27-2C13-43A2-89E6-E6FF80E2FE94"));
      -[NSObject setArgument:atIndex:](v64, "setArgument:atIndex:", buf, 2);
      v197 = objc_msgSend(v183, "feedbackQueryID");
      -[NSObject setArgument:atIndex:](v64, "setArgument:atIndex:", &v197, 3);
      -[NSObject invoke](v64, "invoke");

    }
LABEL_68:
    v63 = v55 ^ 1;

    LOBYTE(v55) = v166;
    goto LABEL_69;
  }
LABEL_132:
  objc_msgSend(v11, "setObject:forKey:", v40, CFSTR("queryUnderstandingOutput"));
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("queryUnderstandingOutput"));
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setQueryUnderstandingOutput:", v128);

  if (objc_msgSend(v184, "isEqualToString:", CFSTR("com.apple.mobileslideshow")))
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryUniversalSuggestionsKey"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v129;
    if (v129)
    {
      v191 = 0u;
      v192 = 0u;
      v189 = 0u;
      v190 = 0u;
      v131 = v129;
      v132 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v189, v198, 16);
      if (v132)
      {
        v133 = v132;
        v134 = *(_QWORD *)v190;
        do
        {
          for (i = 0; i != v133; ++i)
          {
            if (*(_QWORD *)v190 != v134)
              objc_enumerationMutation(v131);
            objc_msgSend(*(id *)(*((_QWORD *)&v189 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("descriptionKey"));
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v136, "length") && (objc_msgSend(v24, "containsObject:", v136) & 1) == 0)
              objc_msgSend(v24, "addObject:", v136);

          }
          v133 = objc_msgSend(v131, "countByEnumeratingWithState:objects:count:", &v189, v198, 16);
        }
        while (v133);
      }

      v9 = v185;
      v10 = v183;
      v40 = v171;
      v37 = v172;
    }

  }
  if (objc_msgSend(v24, "count"))
  {
    v137 = v10;
    v138 = v11;
    v139 = v23;
    if ((unint64_t)objc_msgSend(v24, "count") > 1)
    {
      v143 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v24, "allObjects");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "componentsJoinedByString:", CFSTR(" || "));
      v141 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v143, "stringWithFormat:", CFSTR("(%@)"), v141);
      v142 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v24, "allObjects");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "lastObject");
      v141 = (id)objc_claimAutoreleasedReturnValue();
      v142 = v141;
    }

    objc_msgSend(v179, "addObject:", v142);
    v23 = v139;
    v11 = v138;
    v10 = v137;
  }
  v144 = v178;
  if (objc_msgSend(v186, "length"))
  {
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryUniversalSuggestionsKey"));
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v145, "count"))
      objc_msgSend(v11, "setObject:forKey:", v145, CFSTR("suggestions"));
    v170 = v145;
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryAttributedInputKey"));
    v146 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("kMDUserQueryDictionaryQueryAttributedInputSourcesKey"));
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v146, "count"))
    {
      v148 = 0;
      do
      {
        objc_msgSend(v146, "objectAtIndexedSubscript:", v148);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        if (v148 >= objc_msgSend(v147, "count")
          || (objc_msgSend(v147, "objectAtIndexedSubscript:", v148),
              v150 = (void *)objc_claimAutoreleasedReturnValue(),
              v151 = objc_msgSend(v150, "isEqual:", CFSTR("kMDUserQueryDictionaryAttributedInputSourceU2Based")),
              v150,
              (v151 & 1) == 0))
        {
          if (objc_msgSend(v149, "length"))
          {
            objc_msgSend(v149, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("kQPSender"), 0, 0, 0, objc_msgSend(v149, "length"));
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v152, "length"))
            {
              objc_msgSend(v188, "setObject:forKey:", v152, CFSTR("senderCompletionString"));
            }
            else
            {
              objc_msgSend(v149, "attribute:atIndex:longestEffectiveRange:inRange:", CFSTR("kQPRecipient"), 0, 0, 0, objc_msgSend(v149, "length"));
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v153, "length"))
                objc_msgSend(v188, "setObject:forKey:", v153, CFSTR("recipientCompletionString"));

            }
          }
        }

        ++v148;
      }
      while (v148 < objc_msgSend(v146, "count"));
    }

    v9 = v185;
    v10 = v183;
    v11 = v188;
    v23 = v177;
    v144 = v178;
    v40 = v171;
    v37 = v172;
  }

  v12 = v179;
LABEL_168:
  if (objc_msgSend(v12, "count"))
  {
    v154 = v186;
    v155 = v176;
    if ((unint64_t)objc_msgSend(v12, "count") > 1)
    {
      v161 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v12, "allObjects");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "componentsJoinedByString:", CFSTR(" && "));
      v157 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v161, "stringWithFormat:", CFSTR("(%@)"), v157);
      v158 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v12, "allObjects");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "lastObject");
      v157 = (id)objc_claimAutoreleasedReturnValue();
      v158 = v157;
    }

    objc_msgSend(v11, "setObject:forKey:", v158, CFSTR("queryString"));
    if (objc_msgSend(v158, "containsString:", CFSTR("**")))
      objc_msgSend(v10, "setHasFreeTextQuery:", 1);
    v159 = v11;

    v160 = v175;
  }
  else
  {
    v159 = 0;
    v160 = v175;
    v155 = v176;
    v154 = v186;
  }

  return v159;
}

- (id)queryStringWithQueryContext:(id)a3 searchString:(id)a4 options:(id)a5
{
  void *v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  id v22;
  __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  _QWORD *v26;
  void *v27;
  id v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  const __CFString *v34;
  const __CFString *v35;
  const __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  BOOL v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  unint64_t v46;
  uint64_t v47;
  void *v48;
  char v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  NSObject *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const __CFString *v69;
  id v70;
  void *v71;
  id v72;
  void *v73;
  void *v74;
  NSObject *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  NSString *v81;
  NSString *searchString;
  _CSSuggestionToken *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  int64_t *p_currentTokenKind;
  id v98;
  uint64_t v99;
  void *v100;
  void *v101;
  void *v102;
  char v103;
  CSSuggestion *v104;
  void *v105;
  unint64_t v106;
  void *v107;
  CSSuggestion *v108;
  void *v109;
  CSSuggestion *v110;
  CSSuggestion *v111;
  void *v112;
  void *v113;
  void *v114;
  unint64_t v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t i;
  void *v127;
  void *v128;
  void *v129;
  unint64_t v130;
  void *v131;
  CSSuggestion *v132;
  void *v133;
  CSSuggestion *v134;
  void *v135;
  void *v136;
  BOOL v137;
  void *v138;
  void *v139;
  id v140;
  void *v141;
  void *v142;
  void *v143;
  _BOOL4 v144;
  void *v145;
  _BOOL4 v146;
  NSObject *v147;
  id v148;
  void *v149;
  uint64_t v150;
  int64_t v151;
  const __CFString *v152;
  void *v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  void *v157;
  unint64_t v158;
  uint64_t *v159;
  int v161;
  uint64_t v162;
  int v163;
  uint64_t v164;
  int64_t currentTokenScope;
  void *v166;
  void *v167;
  void *v168;
  int v169;
  NSObject *v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  _BOOL4 v175;
  void *v176;
  void *v177;
  id v178;
  __CFString *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  int v190;
  void *v191;
  void *v192;
  int v193;
  void *v194;
  void *v195;
  void *v196;
  NSObject *v197;
  uint64_t v198;
  id v199;
  NSObject *v200;
  NSObject *v201;
  uint64_t v202;
  id v203;
  NSObject *v204;
  uint64_t v205;
  void *v206;
  NSObject *v207;
  uint64_t v208;
  void *v209;
  NSObject *v210;
  uint64_t v211;
  void *v212;
  id v213;
  NSObject *v214;
  void *v215;
  void *v216;
  void *v217;
  NSObject *v218;
  uint64_t v219;
  id v220;
  NSObject *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  NSObject *v226;
  uint64_t v227;
  void *v228;
  id v229;
  NSObject *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  NSObject *v237;
  uint64_t v238;
  id v239;
  NSObject *v240;
  NSObject *v241;
  uint64_t v242;
  id v243;
  NSObject *v244;
  uint64_t v245;
  id v246;
  void *v247;
  void *v248;
  unint64_t v249;
  _BOOL8 v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  _BOOL4 v258;
  void *v259;
  void *v260;
  void *v261;
  void *v263;
  int v264;
  int v265;
  void *v266;
  void *v267;
  __CFString *v268;
  id v269;
  void *v270;
  unsigned int v271;
  __CFString *v272;
  id v273;
  int v274;
  int v276;
  void *v277;
  int v278;
  void *v279;
  void *v280;
  void *v281;
  id v282;
  void *v283;
  void *v284;
  id v285;
  int v286;
  id v287;
  id obj;
  void *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  int v293;
  void *v294;
  void *v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  _QWORD v304[4];
  id v305;
  uint64_t v306;
  _QWORD v307[4];
  char v308;
  unsigned __int8 v309;
  uint64_t v310;
  uint64_t *v311;
  uint64_t v312;
  uint64_t v313;
  void *v314;
  void *v315;
  __CFString *v316;
  _BYTE v317[128];
  id v318;
  _BYTE v319[128];
  _QWORD v320[2];
  _QWORD v321[4];
  _QWORD v322[2];
  _BYTE buf[24];
  const __CFString *v324;
  _QWORD v325[6];

  v325[3] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v285 = a4;
  v273 = a5;
  v295 = v8;
  objc_msgSend(v8, "userQuery");
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v285, "stringByTrimmingCharactersInSet:", v9);
  v266 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v273);
  v281 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "queryID"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "setObject:forKey:", v10, CFSTR("queryID"));

  objc_msgSend(v8, "keyboardLanguage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "setValue:forKey:", v11, CFSTR("keyboardLanguage"));

  CSGetCurrentLocale(0, 0);
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "languageIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v281, "setValue:forKey:", v12, CFSTR("localeLanguage"));

  objc_msgSend(v8, "bundleIDs");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = (void *)MEMORY[0x1E0C9AA60];
  if (v13)
    v15 = (void *)v13;
  v16 = v15;

  v17 = (void *)0x1E0CB3000;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = v16;
    if ((objc_msgSend(v16, "containsObject:", v19) & 1) == 0)
    {
      objc_msgSend(v16, "arrayByAddingObject:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = v16;
  }
  if ((objc_msgSend(v295, "isMail") & 1) != 0)
  {
    v293 = 1;
  }
  else if (objc_msgSend(v20, "count"))
  {
    v293 = objc_msgSend(v20, "containsObject:", CFSTR("com.apple.mobilemail"));
  }
  else
  {
    v293 = 0;
  }
  if ((objc_msgSend(v295, "isPhotos") & 1) != 0)
  {
    v278 = 1;
  }
  else if (objc_msgSend(v20, "count"))
  {
    v278 = objc_msgSend(v20, "containsObject:", CFSTR("com.apple.mobileslideshow"));
  }
  else
  {
    v278 = 0;
  }
  if ((objc_msgSend(v295, "isSafari") & 1) != 0)
  {
    v276 = 1;
  }
  else if (objc_msgSend(v20, "count"))
  {
    v276 = objc_msgSend(v20, "containsObject:", CFSTR("com.apple.mobilesafari"));
  }
  else
  {
    v276 = 0;
  }
  if ((objc_msgSend(v295, "isNotes") & 1) != 0)
  {
    v21 = 1;
  }
  else if (objc_msgSend(v20, "count"))
  {
    v21 = objc_msgSend(v20, "containsObject:", CFSTR("com.apple.mobilenotes"));
  }
  else
  {
    v21 = 0;
  }
  v267 = v20;
  if (objc_msgSend(v20, "count"))
    v274 = objc_msgSend(v20, "containsObject:", CFSTR("com.apple.Spotlight"));
  else
    v274 = 0;
  v286 = objc_msgSend(v19, "cs_isPommesCtl");
  v265 = _os_feature_enabled_impl();
  v264 = _os_feature_enabled_impl();
  v309 = 0;
  v22 = CSGetCurrentLocale(0, (uint64_t)&v309);
  if (v293)
    v271 = objc_msgSend(v295, "pommesZKW");
  else
    v271 = 0;
  v23 = v19;
  v268 = v23;
  if (((v293 ^ 1 | v278 | v276 | v21 | v274) & 1) == 0)
  {

    v23 = CFSTR("com.apple.mobilemail");
  }
  if (((v278 ^ 1 | v293 | v276 | v21 | v274) & 1) == 0)
  {

    v23 = CFSTR("com.apple.mobileslideshow");
  }
  if (((v276 ^ 1 | v293 | v278 | v21 | v274) & 1) == 0)
  {

    v23 = CFSTR("com.apple.mobilesafari");
  }
  if (((v21 ^ 1 | v293 | v278 | v276 | v274) & 1) == 0)
  {

    v23 = CFSTR("com.apple.mobilenotes");
  }
  if (v274)
  {

    v272 = CFSTR("com.apple.Spotlight");
  }
  else
  {
    v272 = v23;
  }
  if (((v293 | v286) & 1) != 0 || (v278 & 1) != 0 || (v276 & _os_feature_enabled_impl()) == 1)
  {
    logForCSLogCategoryQuery();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.9(v295);

    objc_msgSend(v295, "setPommes:", 1);
  }
  if ((objc_msgSend(v295, "disableSemanticSearch") & 1) == 0)
  {
    v25 = MEMORY[0x1E0C809B0];
    v307[0] = MEMORY[0x1E0C809B0];
    v307[1] = 3221225472;
    v307[2] = __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke;
    v307[3] = &__block_descriptor_33_e5_v8__0l;
    v308 = v278;
    v26 = v307;
    if (queryStringWithQueryContext_searchString_options__onceToken != -1)
      dispatch_once(&queryStringWithQueryContext_searchString_options__onceToken, v26);

    v310 = 0;
    v311 = &v310;
    v312 = 0x2050000000;
    v27 = (void *)getGMAvailabilityWrapperClass_softClass;
    v313 = getGMAvailabilityWrapperClass_softClass;
    if (!getGMAvailabilityWrapperClass_softClass)
    {
      *(_QWORD *)buf = v25;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getGMAvailabilityWrapperClass_block_invoke;
      v324 = (const __CFString *)&unk_1E2401140;
      v325[0] = &v310;
      __getGMAvailabilityWrapperClass_block_invoke((uint64_t)buf);
      v27 = (void *)v311[3];
    }
    v28 = objc_retainAutorelease(v27);
    _Block_object_dispose(&v310, 8);
    v29 = objc_msgSend(v28, "currentWithUseCaseIdentifiers:", &unk_1E242F2E0);
    v5 = (void *)v29;
    if (queryStringWithQueryContext_searchString_options__isFeatureFlagsEnabled)
      v30 = v29 > 1;
    else
      v30 = 1;
    v31 = v30;
    logForCSLogCategoryQuery();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = objc_msgSend(v295, "queryID");
      v34 = CFSTR("allowing");
      if ((_DWORD)v31)
        v34 = CFSTR("disallowing");
      *(_DWORD *)buf = 134218754;
      *(_QWORD *)&buf[4] = v33;
      if (queryStringWithQueryContext_searchString_options__isFeatureFlagsEnabled)
        v35 = CFSTR("YES");
      else
        v35 = CFSTR("NO");
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v34;
      *(_WORD *)&buf[22] = 2112;
      v324 = v35;
      if ((unint64_t)v5 <= 1)
        v36 = CFSTR("YES");
      else
        v36 = CFSTR("NO");
      LOWORD(v325[0]) = 2112;
      *(_QWORD *)((char *)v325 + 2) = v36;
      _os_log_impl(&dword_18C42F000, v32, OS_LOG_TYPE_INFO, "qid=%ld - CSUserQuery: %@ semantic search, isFeatureFlagsEnabled: %@, isGMOptedIn: %@", buf, 0x2Au);
    }

    objc_msgSend(v295, "setDisableSemanticSearch:", v31);
  }
  if ((objc_msgSend(v295, "generateSuggestions") & 1) == 0)
    objc_msgSend(v295, "setUserQueryOptions:", objc_msgSend(v295, "userQueryOptions") | 0x1000);
  if ((objc_msgSend(v295, "disableSemanticSearch") & 1) != 0 || objc_msgSend(v295, "disableNLP"))
  {
    objc_msgSend(v281, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("kMDQueryOptionEmbeddingEnabledKey"));
    objc_msgSend(v281, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("addAnnNode"));
  }
  else
  {
    objc_msgSend(v281, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kMDQueryOptionEmbeddingEnabledKey"));
    objc_msgSend(v281, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("addAnnNode"));
    objc_msgSend(v295, "fetchAttributes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v322[0] = CFSTR("kMDQueryResultRetrievalType");
    v322[1] = CFSTR("kMDQueryResultEmbeddingDistances");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v322, 2);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v295, "setFetchAttributes:", v39);

  }
  objc_msgSend(v295, "customFieldSpecifications");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40 == 0;
  v269 = v40;

  if (!v41)
  {
    +[CSUserQuery flattenCSFieldSpecifications:](CSUserQuery, "flattenCSFieldSpecifications:", v269);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v281, "setValue:forKey:", v42, CFSTR("kMDQueryOptionCustomFieldSpecifications"));

  }
  if (v272)
    objc_msgSend(v281, "setObject:forKey:", v272, CFSTR("kMDQueryOptionContextIdentifier"));
  if (objc_msgSend(v295, "privateQuery"))
    objc_msgSend(v281, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kMDQueryOptionPrivateParsingKey"));
  if (v273)
    objc_msgSend(v281, "addEntriesFromDictionary:", v273);
  if (v278)
  {
    objc_msgSend(v281, "setObject:forKeyedSubscript:", CFSTR("com.apple.photos"), CFSTR("kMDQueryOptionContextIdentifier"));
    v43 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v281, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("forwardEmbeddings"));
    v44 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v295, "bundleIDs");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "count");
    if (v46 < 2)
    {
      v47 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend(v17, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) ^ 1;
    }
    objc_msgSend(v44, "numberWithInt:", v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v281, "setValue:forKey:", v48, CFSTR("addAnnNode"));

    if (v46 > 1)
    {

    }
    v49 = objc_msgSend(v295, "disableNLP");
    v50 = MEMORY[0x1E0C9AAA0];
    v51 = MEMORY[0x1E0C9AAA0];
    if ((v49 & 1) == 0)
    {
      if (objc_msgSend(v295, "disableU2", MEMORY[0x1E0C9AAA0]))
        v51 = v50;
      else
        v51 = v43;
    }
    objc_msgSend(v281, "setValue:forKey:", v51, CFSTR("kMDQueryOptionU2EnabledKey"));
    if ((-[CSSearchQueryContext embeddingGenerationTimeout](self->_clientContext, "embeddingGenerationTimeout") & 0x8000000000000000) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[CSSearchQueryContext embeddingGenerationTimeout](self->_clientContext, "embeddingGenerationTimeout"));
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v281, "setValue:forKey:", v52, CFSTR("kMDQueryOptionEmbeddingGenerationTimeout"));

    }
    if (objc_msgSend(v295, "disableSafetyCheck"))
    {
      objc_msgSend(v281, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("loadAnnotations"));
    }
    else
    {
      v53 = MEMORY[0x1E0C9AAB0];
      objc_msgSend(v281, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("loadAnnotations"));
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "objectForKey:", CFSTR("EmbeddingQuerySafetyCheck"));
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = objc_msgSend(v56, "BOOLForKey:", CFSTR("EmbeddingQuerySafetyCheck"));

        logForCSLogCategoryDefault();
        v58 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v57;
          _os_log_impl(&dword_18C42F000, v58, OS_LOG_TYPE_INFO, "[EmbeddingQuerySafetyCheck]: %d", buf, 8u);
        }

        if (v57)
          v59 = v53;
        else
          v59 = v50;
        objc_msgSend(v281, "setValue:forKey:", v59, CFSTR("loadAnnotations"));
      }

    }
    objc_msgSend(v295, "filterQueries");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_msgSend(v295, "filterQueries");
      v61 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v61 = (id)MEMORY[0x1E0C9AA60];
    }

    objc_msgSend(v295, "setFilterQueries:", v61);
  }
  +[CSUserQuery parseResultWithSearchString:parseOptions:queryContext:isZKW:](CSUserQuery, "parseResultWithSearchString:parseOptions:queryContext:isZKW:", v285, v281, v295, v271);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v279 = v62;
  if (v62)
  {
    objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("queryString"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    if (v63)
      objc_msgSend(v277, "addObject:", v63);
    -[CSUserQuery handleParseResult:](self, "handleParseResult:", v279);

    if (!v271)
      goto LABEL_123;
    goto LABEL_118;
  }
  if ((v271 & 1) != 0)
  {
LABEL_118:
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "dateByAddingTimeInterval:", -2678400.0);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "timeIntervalSinceReferenceDate");
    v67 = v66;

    if ((v293 & 1) != 0)
    {
      v321[0] = CFSTR("com_apple_mail_dateReceived");
      v321[1] = CFSTR("kMDItemUserSharedReceivedDate");
      v321[2] = CFSTR("kMDItemUserSharedSentDate");
      v321[3] = CFSTR("kMDItemContentCreationDate");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v321, 4);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = CFSTR("com_apple_mail_read = 1");
    }
    else
    {
      v320[0] = CFSTR("kMDItemContentCreationDate");
      v320[1] = CFSTR("kMDItemContentModificationDate");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v320, 2);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = CFSTR("true");
    }
    v70 = v68;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v304[0] = MEMORY[0x1E0C809B0];
    v304[1] = 3221225472;
    v304[2] = __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_332;
    v304[3] = &unk_1E2401310;
    v72 = v71;
    v305 = v72;
    v306 = v67;
    objc_msgSend(v70, "enumerateObjectsUsingBlock:", v304);
    objc_msgSend(v72, "componentsJoinedByString:", CFSTR(" || "));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@) && (%@))"), v73, v69);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v277, "addObject:", v74);

    objc_msgSend(v295, "setPommesZKW:", 1);
    goto LABEL_123;
  }
  objc_msgSend(v277, "addObject:", CFSTR("(true)"));
LABEL_123:
  if (!objc_msgSend(v295, "generateSuggestions"))
  {
    v289 = v266;
    v287 = v285;
    goto LABEL_302;
  }
  if (v293 | v278)
  {
    logForCSLogCategoryQuery();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG))
      -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.8(v295);

    objc_msgSend(v295, "setPommesSuggestions:", 1);
  }
  objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("hasAdvancedComponents"));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = objc_msgSend(v76, "BOOLValue");

  if (v77)
  {
    objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("internalString"));
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    if (v78)
    {
      objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("internalString"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("internalQuery"));
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](self->_searchString, "stringByReplacingOccurrencesOfString:withString:options:range:", v79, &stru_1E2406B38, 8, 0, -[NSString length](self->_searchString, "length"));
      v81 = (NSString *)objc_claimAutoreleasedReturnValue();
      searchString = self->_searchString;
      self->_searchString = v81;

      v83 = -[_CSSuggestionToken initWithUserString:queryString:]([_CSSuggestionToken alloc], "initWithUserString:queryString:", v79, v80);
      objc_msgSend(v295, "suggestion");
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "suggestionTokens");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v85, "arrayByAddingObject:", v83);
      v86 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v295, "suggestion");
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSSuggestion updatedSuggestionWithCurrentSuggestion:userString:tokens:](CSSuggestion, "updatedSuggestionWithCurrentSuggestion:userString:tokens:", v87, v294, v86);
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "setSuggestion:", v88);

      objc_msgSend(v295, "suggestion");
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "userQueryString");
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "setUserQuery:", v90);

    }
    objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("suggestionString"));
    v91 = objc_claimAutoreleasedReturnValue();
    v92 = (void *)v91;
    if (v91)
      v93 = (void *)v91;
    else
      v93 = v285;
    v287 = v93;

    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v287, "stringByTrimmingCharactersInSet:", v94);
    v289 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v295, "setNormalizedSearchQuery:", v289);
    objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("suggestionTokenKind"));
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v95)
    {
      objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("suggestionTokenKind"));
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      p_currentTokenKind = &self->_currentTokenKind;
      self->_currentTokenKind = (int)objc_msgSend(v96, "intValue");

    }
    else
    {
      p_currentTokenKind = &self->_currentTokenKind;
      self->_currentTokenKind = 0;
    }

    objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("suggestionTokenKind"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    if (v120)
    {
      objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("suggestionTokenScope"));
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      if (v121)
      {
        objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("suggestionTokenScope"));
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        self->_currentTokenScope = (int)objc_msgSend(v122, "intValue");

      }
      else
      {
        self->_currentTokenScope = -1;
      }

    }
    else
    {
      self->_currentTokenScope = -1;
    }

    objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("suggestions"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (*p_currentTokenKind == 16
      && objc_msgSend(obj, "count")
      && (objc_msgSend(obj, "firstObject"),
          v123 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v123, "objectForKeyedSubscript:", CFSTR("suggestionTypeKey")),
          v124 = (void *)objc_claimAutoreleasedReturnValue(),
          v123,
          LODWORD(v123) = objc_msgSend(v124, "isEqualToString:", CFSTR("kQPTokenMe")),
          v124,
          (_DWORD)v123))
    {
      v98 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v302 = 0u;
      v303 = 0u;
      v300 = 0u;
      v301 = 0u;
      obj = obj;
      v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v300, v319, 16);
      if (v125)
      {
        v292 = *(_QWORD *)v301;
        do
        {
          for (i = 0; i != v125; ++i)
          {
            if (*(_QWORD *)v301 != v292)
              objc_enumerationMutation(obj);
            v127 = *(void **)(*((_QWORD *)&v300 + 1) + 8 * i);
            objc_msgSend(v127, "objectForKeyedSubscript:", CFSTR("suggestionTokensKey"));
            v128 = (void *)objc_claimAutoreleasedReturnValue();
            v129 = (void *)objc_msgSend(v127, "mutableCopy");
            if (objc_msgSend(v128, "count"))
            {
              v130 = 0;
              do
              {
                objc_msgSend(v128, "objectAtIndexedSubscript:", v130);
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "setObject:forKeyedSubscript:", v131, CFSTR("suggestionTokensKey"));

                v132 = [CSSuggestion alloc];
                objc_msgSend(v295, "suggestion");
                v133 = (void *)objc_claimAutoreleasedReturnValue();
                v134 = -[CSSuggestion initWithUserString:currentSuggestion:suggestionTokenResult:](v132, "initWithUserString:currentSuggestion:suggestionTokenResult:", v294, v133, v129);

                if (v134)
                {
                  -[CSSuggestion setEnableFragments:](v134, "setEnableFragments:", objc_msgSend(v295, "enableSuggestionTokens"));
                  objc_msgSend(v98, "addObject:", v134);
                }

                ++v130;
              }
              while (v130 < objc_msgSend(v128, "count"));
            }

          }
          v125 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v300, v319, 16);
        }
        while (v125);
      }

      objc_msgSend(v98, "allObjects");
      v283 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSUserQuery handleFoundSuggestions:](self, "handleFoundSuggestions:", v283);

    }
    else
    {
      objc_msgSend(v295, "suggestion");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      +[CSSuggestion advancedSuggestionWithUserString:currentSuggestion:parseResult:](CSSuggestion, "advancedSuggestionWithUserString:currentSuggestion:parseResult:", v294, v135, v279);
      v98 = (id)objc_claimAutoreleasedReturnValue();

      if (v98)
      {
        objc_msgSend(v98, "setEnableFragments:", objc_msgSend(v295, "enableSuggestionTokens"));
        v318 = v98;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v318, 1);
        v284 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSUserQuery handleFoundNLPSuggestions:](self, "handleFoundNLPSuggestions:", v284);

      }
    }
    goto LABEL_212;
  }
  objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("suggestions"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(obj, "count"))
  {
    v289 = v266;
    v287 = v285;
    goto LABEL_213;
  }
  v98 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v282 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v298 = 0u;
  v299 = 0u;
  v296 = 0u;
  v297 = 0u;
  obj = obj;
  v291 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v296, v317, 16);
  if (!v291)
    goto LABEL_181;
  v290 = *(_QWORD *)v297;
  do
  {
    v99 = 0;
    do
    {
      if (*(_QWORD *)v297 != v290)
        objc_enumerationMutation(obj);
      v100 = *(void **)(*((_QWORD *)&v296 + 1) + 8 * v99);
      objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("suggestionTypeKey"));
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = v101;
      if ((v293 & 1) != 0)
      {
        if (!v101)
          goto LABEL_160;
      }
      else
      {
        if (v101)
          v103 = v286;
        else
          v103 = 0;
        if ((v103 & 1) == 0)
        {
          if (v101)
          {
LABEL_153:
            if (objc_msgSend(v102, "isEqualToString:", CFSTR("kQPTokenMe")))
            {
              objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("suggestionTokensKey"));
              v104 = (CSSuggestion *)objc_claimAutoreleasedReturnValue();
              v105 = (void *)objc_msgSend(v100, "mutableCopy");
              if (-[CSSuggestion count](v104, "count"))
              {
                v106 = 0;
                do
                {
                  -[CSSuggestion objectAtIndexedSubscript:](v104, "objectAtIndexedSubscript:", v106);
                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v105, "setObject:forKeyedSubscript:", v107, CFSTR("suggestionTokensKey"));

                  v108 = [CSSuggestion alloc];
                  objc_msgSend(v295, "suggestion");
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  v110 = -[CSSuggestion initWithUserString:currentSuggestion:suggestionTokenResult:](v108, "initWithUserString:currentSuggestion:suggestionTokenResult:", v294, v109, v105);

                  if (v110)
                  {
                    -[CSSuggestion setEnableFragments:](v110, "setEnableFragments:", objc_msgSend(v295, "enableSuggestionTokens"));
                    objc_msgSend(v98, "addObject:", v110);
                  }

                  ++v106;
                }
                while (v106 < -[CSSuggestion count](v104, "count"));
              }

              goto LABEL_165;
            }
          }
LABEL_160:
          v111 = [CSSuggestion alloc];
          objc_msgSend(v295, "suggestion");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = -[CSSuggestion initWithUserString:currentSuggestion:suggestionTokenResult:](v111, "initWithUserString:currentSuggestion:suggestionTokenResult:", v294, v112, v100);

          if (!v104)
          {
LABEL_165:

            goto LABEL_166;
          }
          -[CSSuggestion currentToken](v104, "currentToken");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v295, "setIsDateQueryContext:", objc_msgSend(v113, "tokenKind") == 5);

          -[CSSuggestion setEnableFragments:](v104, "setEnableFragments:", objc_msgSend(v295, "enableSuggestionTokens"));
          -[CSSuggestion currentToken](v104, "currentToken");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v113) = objc_msgSend(v114, "tokenKind") == 16;

          if ((_DWORD)v113)
          {
            objc_msgSend(v98, "addObject:", v104);
            goto LABEL_165;
          }
          if (v309)
          {
LABEL_164:
            objc_msgSend(v282, "addObject:", v104);
            goto LABEL_165;
          }
          v115 = objc_msgSend(v285, "length");
          if (v115 > 2)
          {
            if ((unint64_t)objc_msgSend(v285, "length") >= 2)
              goto LABEL_164;
          }
          else
          {
            -[CSSuggestion currentToken](v104, "currentToken");
            v280 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v280, "tokenKind") == 5)
            {

              goto LABEL_165;
            }
            if ((unint64_t)objc_msgSend(v285, "length") >= 2)
            {

              goto LABEL_164;
            }
          }
          -[CSSuggestion currentToken](v104, "currentToken");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = objc_msgSend(v116, "tokenKind");

          if (v115 >= 3)
          {
            if (v117 != 5)
              goto LABEL_165;
          }
          else
          {

            if (v117 != 5)
              goto LABEL_165;
          }
          goto LABEL_164;
        }
      }
      if ((objc_msgSend(v101, "isEqualToString:", CFSTR("kQPSuggestion")) & 1) == 0)
        goto LABEL_153;
LABEL_166:

      ++v99;
    }
    while (v99 != v291);
    v118 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v296, v317, 16);
    v291 = v118;
  }
  while (v118);
LABEL_181:

  objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("senderCompletionString"));
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v119, "length"))
  {

    goto LABEL_210;
  }
  objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("recipientCompletionString"));
  v136 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v136, "length") == 0;

  if (!v137)
LABEL_210:
    objc_msgSend(v282, "removeAllObjects");
  objc_msgSend(v98, "allObjects");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSUserQuery handleFoundSuggestions:](self, "handleFoundSuggestions:", v138);

  objc_msgSend(v282, "allObjects");
  v139 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSUserQuery handleFoundNLPSuggestions:](self, "handleFoundNLPSuggestions:", v139);

  v289 = v266;
  v287 = v285;

LABEL_212:
LABEL_213:

  if (v293 && objc_msgSend(v295, "enableSuggestionTokens"))
  {
    v140 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v295, "suggestion");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUserQuery updateWithTemplateSuggestions:searchString:currentSuggestion:](CSUserQuery, "updateWithTemplateSuggestions:searchString:currentSuggestion:", v140, v289, v141);

    -[CSUserQuery handleFoundTemplateSuggestions:](self, "handleFoundTemplateSuggestions:", v140);
  }
  if (v278)
  {
    objc_msgSend(v295, "suggestion");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "queryString");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v143, "length") != 0;

  }
  else
  {
    v144 = 0;
  }
  if (objc_msgSend(v289, "length") || (objc_msgSend(v295, "pommesZKW") | v144) == 1)
  {
    objc_msgSend(v295, "completionString");
    v145 = (void *)objc_claimAutoreleasedReturnValue();
    v146 = objc_msgSend(v145, "length") == 0;

    if (v146)
    {
      if (objc_msgSend(v295, "pommesSuggestions"))
      {
        if (queryStringWithQueryContext_searchString_options__onceAttributesToken == -1)
          goto LABEL_229;
        v263 = &__block_literal_global_354;
LABEL_398:
        dispatch_once(&queryStringWithQueryContext_searchString_options__onceAttributesToken, v263);
        goto LABEL_229;
      }
      if (!v265)
      {
        if (queryStringWithQueryContext_searchString_options__onceAttributesToken == -1)
          goto LABEL_229;
        v263 = &__block_literal_global_438;
        goto LABEL_398;
      }
      if (queryStringWithQueryContext_searchString_options__onceAttributesToken != -1)
      {
        v263 = &__block_literal_global_435;
        goto LABEL_398;
      }
LABEL_229:
      logForCSLogCategoryQuery();
      v147 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
        -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.7(v295);

      v148 = v287;
      objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("senderCompletionString"));
      v149 = (void *)objc_claimAutoreleasedReturnValue();
      v150 = objc_msgSend(v149, "length");

      if (v150)
      {
        v151 = 0;
        v152 = CFSTR("senderCompletionString");
        goto LABEL_235;
      }
      objc_msgSend(v279, "objectForKeyedSubscript:", CFSTR("recipientCompletionString"));
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      v154 = objc_msgSend(v153, "length");

      if (v154)
      {
        v152 = CFSTR("recipientCompletionString");
        v151 = 1;
LABEL_235:
        objc_msgSend(v279, "objectForKeyedSubscript:", v152);
        v155 = objc_claimAutoreleasedReturnValue();

        self->_currentTokenScope = v151;
        self->_currentTokenKind = 16;
        v148 = (id)v155;
      }
      objc_msgSend(v148, "stringByAppendingString:", CFSTR("*"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "setCompletionString:", v156);

      objc_msgSend(v295, "completionString");
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v158 = objc_msgSend(v157, "length");

      if ((objc_msgSend(v295, "pommesSuggestions") | v265) == 1)
      {
        objc_msgSend(v295, "setCompletionResultCount:", 100);
        if (((v293 | v278 | v276 | v274) & 1) != 0)
        {
          v159 = &queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
          if (v158 > 4)
          {
            v161 = 352;
          }
          else if (v158 > 1 || v144)
          {
            v161 = 288;
          }
          else
          {
            v159 = &queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes;
            v161 = 256;
          }
LABEL_253:
          objc_msgSend(v295, "setCompletionAttributes:", *v159);
        }
        else
        {
          if (v158)
          {
            v161 = 4352;
            v159 = &queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
            goto LABEL_253;
          }
          v161 = 256;
        }
        if (v265 && v264)
          v161 |= 0x4000u;
      }
      else
      {
        if (v158 > 4)
        {
          if (v158 <= 8)
          {
            if (v158 == 8)
            {
              v162 = 50;
            }
            else if (v158 <= 6)
            {
              v162 = 25;
            }
            else
            {
              v162 = 40;
            }
          }
          else
          {
            v162 = 65;
          }
          objc_msgSend(v295, "setCompletionResultCount:", v162);
          objc_msgSend(v295, "setCompletionAttributes:", queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes);
        }
        else
        {
          objc_msgSend(v295, "setCompletionResultCount:", 20);
          if (v158 <= 1)
          {
            objc_msgSend(v295, "setCompletionAttributes:", queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes);
            v161 = 4096;
            goto LABEL_267;
          }
          objc_msgSend(v295, "setCompletionAttributes:", queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes);
        }
        v161 = 12320;
      }
LABEL_267:
      v163 = objc_msgSend(v295, "pommesSuggestions");
      v164 = v161 | 4u;
      if (v163)
      {
        currentTokenScope = self->_currentTokenScope;
        if ((unint64_t)(currentTokenScope + 1) <= 1)
          LODWORD(v164) = v161 | 0x204;
        if (currentTokenScope == 1 || currentTokenScope == -1)
          LODWORD(v164) = v164 | 0x400;
        if (self->_currentTokenKind == 5)
          v164 = v164;
        else
          v164 = v164 | 0x800;
      }
      objc_msgSend(v295, "setCompletionOptions:", v164);
      objc_msgSend(v295, "setCompletionWeights:", 0);

    }
  }
  objc_msgSend(v295, "suggestion");
  v166 = (void *)objc_claimAutoreleasedReturnValue();
  if (v166)
  {
    objc_msgSend(v295, "suggestion");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v167, "suggestionTokens");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v168, "count"))
    {
      v169 = objc_msgSend(v295, "enableResultCountsPerSuggestion");

      if (!v169)
        goto LABEL_302;
    }
    else
    {

    }
  }
  if (_os_feature_enabled_impl())
  {
    logForCSLogCategoryQuery();
    v170 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v170, OS_LOG_TYPE_DEBUG))
      -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.6(v295);

    objc_msgSend(v295, "normalizedSearchQuery");
    v171 = (void *)objc_claimAutoreleasedReturnValue();

    if (v171)
    {
      objc_msgSend(v295, "normalizedSearchQuery");
      v172 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CSUserQuery queryContext](self, "queryContext");
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "userQuery");
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = objc_msgSend(v174, "length") == 0;
      -[CSUserQuery queryContext](self, "queryContext");
      v176 = (void *)objc_claimAutoreleasedReturnValue();
      v177 = v176;
      if (v175)
      {
        objc_msgSend(v176, "suggestion");
        v178 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v178, "userQueryString");
        v172 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v176, "userQuery");
        v178 = (id)objc_claimAutoreleasedReturnValue();
        v172 = v178;
      }

    }
    if (objc_msgSend(v172, "length"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(kMDItemContentType=\"<:b:>.contact\" && kMDItemDisplayName=\"%@*\"cwdt)"), v172);
      v179 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else if (v271)
    {
      v179 = CFSTR("(kMDItemContentType=\"<:b:>.contact\" && _kMDItemPersonScore<1)");
    }
    else
    {
      v179 = 0;
    }
    if (-[__CFString length](v179, "length"))
    {
      objc_msgSend(v295, "fetchAttributes");
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      if (v180)
      {
        objc_msgSend(v295, "setFetchAttributes:", v180);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D20], "array");
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v295, "setFetchAttributes:", v181);

      }
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "addObject:", CFSTR("kMDItemDisplayName"));
      objc_msgSend(v182, "addObject:", CFSTR("kMDItemEmailAddresses"));
      objc_msgSend(v182, "addObject:", CFSTR("kMDItemAlternateEmailAddresses"));
      objc_msgSend(v182, "addObject:", CFSTR("kMDItemPhoneNumbers"));
      objc_msgSend(v182, "addObject:", CFSTR("kMDItemAlternatePhoneNumbers"));
      objc_msgSend(v182, "addObject:", CFSTR("kMDItemAlternateNames"));
      objc_msgSend(v182, "addObject:", CFSTR("kMDItemContactKeywords"));
      objc_msgSend(v182, "addObject:", CFSTR("_kMDItemPersonScore"));
      objc_msgSend(v182, "addObject:", CFSTR("_kMDItemPersonVersion"));
      objc_msgSend(v182, "addObject:", CFSTR("_kMDItemPersonInCount"));
      objc_msgSend(v182, "addObject:", CFSTR("_kMDItemPersonOutCount"));
      objc_msgSend(v182, "addObject:", CFSTR("_kMDItemPersonCount"));
      objc_msgSend(v182, "addObject:", CFSTR("_kMDItemPersonEntityIdentifier"));
      objc_msgSend(v182, "addObject:", CFSTR("_kMDItemDomainIdentifier"));
      objc_msgSend(v182, "addObject:", CFSTR("com_apple_spotlight_contacts_type"));
      objc_msgSend(v295, "fetchAttributes");
      v183 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v182, "allObjects");
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v183, "arrayByAddingObjectsFromArray:", v184);
      v185 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "setFetchAttributes:", v185);

      v316 = v179;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v316, 1);
      v186 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "setAdditionalQueries:", v186);

      objc_msgSend(v295, "setAdditionalBundleIDs:", &unk_1E242F370);
      objc_msgSend(v295, "setGrouped:", 1);

    }
  }
LABEL_302:
  objc_msgSend(v279, "objectForKey:", CFSTR("instantAnswers"));
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v289, "lowercaseString");
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v295, "enableInstantAnswers")
    || ((objc_msgSend(v295, "advancedQuery") | v271) & 1) != 0
    || !+[CSInstantAnswers isInstantAnswerTriggerQuery:isCJK:isSearchTool:](CSInstantAnswers, "isInstantAnswerTriggerQuery:isCJK:isSearchTool:", v188, v309, 0))
  {
    goto LABEL_389;
  }
  if (!_os_feature_enabled_impl())
  {
    if (!_os_feature_enabled_impl())
      goto LABEL_389;
    LOBYTE(v190) = 0;
LABEL_315:
    objc_msgSend(v295, "clientBundleID");
    v192 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v192, "hasPrefix:", CFSTR("com.apple.omniSearch")) & 1) != 0)
    {
      v193 = 1;
    }
    else
    {
      objc_msgSend(v295, "clientBundleID");
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v194, "hasPrefix:", CFSTR("com.apple.intelligenceflow")) & 1) != 0)
      {
        v193 = 1;
      }
      else if (objc_msgSend(v267, "containsObject:", CFSTR("com.apple.omniSearch")))
      {
        objc_msgSend(v295, "clientBundleID");
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v195, "isEqualToString:", CFSTR("com.apple.corespotlight.InternalTestsHost")) & 1) != 0)
        {
          v193 = 1;
        }
        else
        {
          objc_msgSend(v295, "clientBundleID");
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          v193 = objc_msgSend(v196, "hasPrefix:", CFSTR("com.apple.SpotlightUITests"));

        }
      }
      else
      {
        v193 = 0;
      }

    }
    if ((v190 & 1) == 0)
      goto LABEL_361;
LABEL_329:
    logForCSLogCategoryQuery();
    v197 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v197, OS_LOG_TYPE_DEFAULT))
    {
      v198 = objc_msgSend(v295, "queryID");
      CSRedactString(v188, 1);
      v199 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      *(_QWORD *)&buf[4] = v198;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v199;
      _os_log_impl(&dword_18C42F000, v197, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] CSUserQuery: enabling instant answers for searchString = %@", buf, 0x16u);

    }
    logForCSLogCategoryQuery();
    v200 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v200, OS_LOG_TYPE_DEBUG))
      -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.5();

    if (+[CSInstantAnswers overrideParsedQuery:](CSInstantAnswers, "overrideParsedQuery:", v188))
    {
      logForCSLogCategoryQuery();
      v201 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v201, OS_LOG_TYPE_DEFAULT))
      {
        v202 = objc_msgSend(v295, "queryID");
        CSRedactString(v188, 1);
        v203 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v202;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v203;
        _os_log_impl(&dword_18C42F000, v201, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] Overriding parsed query for searchString = %@", buf, 0x16u);

      }
    }
    else if (v187)
    {
      logForCSLogCategoryQuery();
      v204 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v204, OS_LOG_TYPE_DEFAULT))
      {
        v205 = objc_msgSend(v295, "queryID");
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v205;
        _os_log_impl(&dword_18C42F000, v204, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] using instantAnswersQuery from QueryParser", buf, 0xCu);
      }

      v315 = v187;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v315, 1);
      v206 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v295, "setInstantAnswersQueries:", v206);
LABEL_344:

      logForCSLogCategoryQuery();
      v210 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
      {
        v211 = objc_msgSend(v295, "queryID");
        objc_msgSend(v295, "instantAnswersQueries");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        CSRedactStringArray(v212, 1);
        v213 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        *(_QWORD *)&buf[4] = v211;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v213;
        _os_log_impl(&dword_18C42F000, v210, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] instantAnswersQuery = %@", buf, 0x16u);

      }
      logForCSLogCategoryQuery();
      v214 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v214, OS_LOG_TYPE_DEBUG))
        -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.4(v295);

      objc_msgSend(v295, "instantAnswersQueries");
      v215 = (void *)objc_claimAutoreleasedReturnValue();

      if (v215)
      {
        objc_msgSend(v295, "filterQueries");
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSInstantAnswers instantAnswersMailboxes:](CSInstantAnswers, "instantAnswersMailboxes:", v216);
        v217 = (void *)objc_claimAutoreleasedReturnValue();

        logForCSLogCategoryQuery();
        v218 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v218, OS_LOG_TYPE_DEFAULT))
        {
          v219 = objc_msgSend(v295, "queryID");
          CSRedactStringArray(v217, 1);
          v220 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v219;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v220;
          _os_log_impl(&dword_18C42F000, v218, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] mailboxes = %@", buf, 0x16u);

        }
        logForCSLogCategoryQuery();
        v221 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG))
          -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.3();

        if (v217)
        {
          objc_msgSend(v295, "instantAnswersQueries");
          v222 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v222, "arrayByAddingObjectsFromArray:", v217);
          v223 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v223, "componentsJoinedByString:", CFSTR(" && "));
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          v314 = v224;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v314, 1);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v295, "setInstantAnswersQueries:", v225);

        }
        logForCSLogCategoryQuery();
        v226 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v226, OS_LOG_TYPE_DEFAULT))
        {
          v227 = objc_msgSend(v295, "queryID");
          objc_msgSend(v295, "instantAnswersQueries");
          v228 = (void *)objc_claimAutoreleasedReturnValue();
          CSRedactStringArray(v228, 1);
          v229 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v227;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v229;
          _os_log_impl(&dword_18C42F000, v226, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] final instantAnswersQuery = %@", buf, 0x16u);

        }
        logForCSLogCategoryQuery();
        v230 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v230, OS_LOG_TYPE_DEBUG))
          -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.2(v295);

        objc_msgSend(v295, "fetchAttributes");
        v231 = (void *)objc_claimAutoreleasedReturnValue();
        if (v231)
        {
          objc_msgSend(v295, "setFetchAttributes:", v231);
        }
        else
        {
          v232 = (void *)objc_opt_new();
          objc_msgSend(v295, "setFetchAttributes:", v232);

        }
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v233 = (void *)objc_claimAutoreleasedReturnValue();
        if (queryStringWithQueryContext_searchString_options__onceAttributesToken_497 != -1)
          dispatch_once(&queryStringWithQueryContext_searchString_options__onceAttributesToken_497, &__block_literal_global_499);
        objc_msgSend(v233, "addObjectsFromArray:", queryStringWithQueryContext_searchString_options__commonEventAttributes);
        objc_msgSend(v233, "addObjectsFromArray:", queryStringWithQueryContext_searchString_options__flightEventAttributes);
        objc_msgSend(v233, "addObjectsFromArray:", queryStringWithQueryContext_searchString_options__hotelEventAttributes);
        objc_msgSend(v295, "fetchAttributes");
        v234 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v233, "allObjects");
        v235 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v234, "arrayByAddingObjectsFromArray:", v235);
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v295, "setFetchAttributes:", v236);

        objc_msgSend(v295, "setInstantAnswersBundleIDs:", &unk_1E242F388);
        objc_msgSend(v295, "setGrouped:", 1);

        if ((v193 & 1) == 0)
          goto LABEL_389;
LABEL_367:
        logForCSLogCategoryQuery();
        v237 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v237, OS_LOG_TYPE_DEFAULT))
        {
          v238 = objc_msgSend(v295, "queryID");
          CSRedactString(v188, 1);
          v239 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v238;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v239;
          _os_log_impl(&dword_18C42F000, v237, OS_LOG_TYPE_DEFAULT, "[personal answers][query][qid=%ld] CSUserQuery: enabling personal answers for searchString = %@", buf, 0x16u);

        }
        logForCSLogCategoryQuery();
        v240 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v240, OS_LOG_TYPE_DEBUG))
          -[CSUserQuery queryStringWithQueryContext:searchString:options:].cold.1();

        if (+[CSInstantAnswers overrideParsedQuery:](CSInstantAnswers, "overrideParsedQuery:", v188))
        {
          logForCSLogCategoryQuery();
          v241 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v241, OS_LOG_TYPE_DEFAULT))
          {
            v242 = objc_msgSend(v295, "queryID");
            CSRedactString(v188, 1);
            v243 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v242;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v243;
            _os_log_impl(&dword_18C42F000, v241, OS_LOG_TYPE_DEFAULT, "[personal answers][query][qid=%ld] Overriding parsed query for searchString = %@", buf, 0x16u);

          }
        }
        logForCSLogCategoryQuery();
        v244 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v244, OS_LOG_TYPE_DEFAULT))
        {
          v245 = objc_msgSend(v295, "queryID");
          CSRedactString(v188, 1);
          v246 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v245;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v246;
          _os_log_impl(&dword_18C42F000, v244, OS_LOG_TYPE_DEFAULT, "[personal answers][query][qid=%ld] using fallback personalAnswerQuery for searchString = %@", buf, 0x16u);

        }
        objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v188, "componentsSeparatedByCharactersInSet:", v247);
        v248 = (void *)objc_claimAutoreleasedReturnValue();

        if ((unint64_t)objc_msgSend(v248, "count") >= 2)
          v249 = 2;
        else
          v249 = 3;
        if (v309)
        {
          if ((unint64_t)objc_msgSend(v188, "length") < 3)
          {
            v250 = 1;
LABEL_386:
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v251 = (void *)objc_claimAutoreleasedReturnValue();
            +[CSPersonalAnswers personalAnswersFallbackQueries:queryComponents:searchString:answerAttributeIntents:isShortQuery:locale:](CSPersonalAnswers, "personalAnswersFallbackQueries:queryComponents:searchString:answerAttributeIntents:isShortQuery:locale:", v248, MEMORY[0x1E0C9AA60], v188, v251, v250, CFSTR("en"));
            v252 = (void *)objc_claimAutoreleasedReturnValue();
            if (v252)
            {
              +[CSPersonalAnswers attributesFromIntent:](CSPersonalAnswers, "attributesFromIntent:", v251);
              v253 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v295, "fetchAttributes");
              v254 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v253, "allObjects");
              v255 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v254, "arrayByAddingObjectsFromArray:", v255);
              v256 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v295, "setFetchAttributes:", v256);

              objc_msgSend(v295, "setInstantAnswersBundleIDs:", &unk_1E242F3A0);
              objc_msgSend(v295, "setInstantAnswersQueries:", v252);
              objc_msgSend(v251, "allObjects");
              v257 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v295, "setAnswerAttributes:", v257);

              objc_msgSend(v295, "setGrouped:", 1);
            }

            goto LABEL_389;
          }
          if (v309)
          {
            v250 = 0;
            goto LABEL_386;
          }
        }
        v250 = objc_msgSend(v188, "length") <= v249;
        goto LABEL_386;
      }
LABEL_361:
      if (!v193)
        goto LABEL_389;
      goto LABEL_367;
    }
    logForCSLogCategoryQuery();
    v207 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
    {
      v208 = objc_msgSend(v295, "queryID");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v208;
      _os_log_impl(&dword_18C42F000, v207, OS_LOG_TYPE_DEFAULT, "[instant answers][query][qid=%ld] NOT using instantAnswersQuery from QueryParser", buf, 0xCu);
    }

    objc_msgSend(v277, "allObjects");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSInstantAnswers instantAnswersFallbackQueries:queryComponents:isCJK:](CSInstantAnswers, "instantAnswersFallbackQueries:queryComponents:isCJK:", v188, v206, v309);
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v295, "setInstantAnswersQueries:", v209);

    goto LABEL_344;
  }
  objc_msgSend(v295, "clientBundleID");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v189, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) != 0)
  {
    v190 = 1;
  }
  else
  {
    objc_msgSend(v295, "clientBundleID");
    v191 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v191, "isEqualToString:", CFSTR("com.apple.corespotlight.InternalTestsHost")))
      v190 = objc_msgSend(v267, "containsObject:", CFSTR("com.apple.omniSearch")) ^ 1;
    else
      v190 = 0;

  }
  if ((_os_feature_enabled_impl() & 1) != 0)
    goto LABEL_315;
  if (v190)
  {
    v193 = 0;
    goto LABEL_329;
  }
LABEL_389:
  objc_msgSend(v295, "setCurrentTokenScope:", self->_currentTokenScope);
  objc_msgSend(v295, "setDisableNLP:", 1);
  if (!objc_msgSend(v277, "count"))
    objc_msgSend(v277, "addObject:", CFSTR("(true)"));
  v258 = objc_msgSend(v277, "count") == 1;
  objc_msgSend(v277, "allObjects");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  v260 = v259;
  if (v258)
    objc_msgSend(v259, "firstObject");
  else
    objc_msgSend(v259, "componentsJoinedByString:", CFSTR(" && "));
  v261 = (void *)objc_claimAutoreleasedReturnValue();

  return v261;
}

uint64_t __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
  {
    if (*(_BYTE *)(a1 + 32))
    {
      if ((_os_feature_enabled_impl() & 1) != 0)
      {
        result = 1;
        goto LABEL_8;
      }
      if (*(_BYTE *)(a1 + 32))
      {
        result = 0;
        goto LABEL_8;
      }
    }
    result = _os_feature_enabled_impl();
  }
LABEL_8:
  queryStringWithQueryContext_searchString_options__isFeatureFlagsEnabled = result;
  return result;
}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_332(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ > %f)"), a2, *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_353()
{
  void *v0;
  void *v1;

  v0 = (void *)queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes = (uint64_t)&unk_1E242F2F8;

  v1 = (void *)queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes = (uint64_t)&unk_1E242F310;

}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_2()
{
  void *v0;

  v0 = (void *)queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes = (uint64_t)&unk_1E242F328;

  objc_storeStrong((id *)&queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes, (id)queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes);
}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_3()
{
  void *v0;
  void *v1;

  v0 = (void *)queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sDefaultCompletionAttributes = (uint64_t)&unk_1E242F340;

  v1 = (void *)queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes;
  queryStringWithQueryContext_searchString_options__sZKWCompletionAttributes = (uint64_t)&unk_1E242F358;

}

void __64__CSUserQuery_queryStringWithQueryContext_searchString_options___block_invoke_498()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[16];
  _QWORD v7[15];
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("kMDItemEventMessageIdentifier");
  v8[1] = CFSTR("kMDItemEventGroupIdentifier");
  v8[2] = CFSTR("kMDItemEventFallbackGroupIdentifier");
  v8[3] = CFSTR("kMDItemEventType");
  v8[4] = CFSTR("kMDItemEventIsAllDay");
  v8[5] = CFSTR("kMDItemStartDate");
  v8[6] = CFSTR("kMDItemEndDate");
  v8[7] = CFSTR("com_apple_mail_messageID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)queryStringWithQueryContext_searchString_options__commonEventAttributes;
  queryStringWithQueryContext_searchString_options__commonEventAttributes = v0;

  v7[0] = CFSTR("kMDItemEventFlightNumber");
  v7[1] = CFSTR("kMDItemEventFlightCheckInUrl");
  v7[2] = CFSTR("kMDItemEventFlightBookingInfoUrl");
  v7[3] = CFSTR("kMDItemEventFlightStatus");
  v7[4] = CFSTR("kMDItemEventFlightCarrier");
  v7[5] = CFSTR("kMDItemEventFlightCarrierCode");
  v7[6] = CFSTR("kMDItemEventFlightArrivalDateTime");
  v7[7] = CFSTR("kMDItemEventFlightArrivalTimeZone");
  v7[8] = CFSTR("kMDItemEventFlightDepartureDateTime");
  v7[9] = CFSTR("kMDItemEventFlightDepartureTimeZone");
  v7[10] = CFSTR("kMDItemEventFlightArrivalAirportCode");
  v7[11] = CFSTR("kMDItemEventFlightDepartureAirportCode");
  v7[12] = CFSTR("kMDItemEventFlightArrivalTerminal");
  v7[13] = CFSTR("kMDItemEventFlightDepartureTerminal");
  v7[14] = CFSTR("kMDItemEventFlightConfirmationNumber");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 15);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)queryStringWithQueryContext_searchString_options__flightEventAttributes;
  queryStringWithQueryContext_searchString_options__flightEventAttributes = v2;

  v6[0] = CFSTR("kMDItemEventHotelReservationId");
  v6[1] = CFSTR("kMDItemEventHotelUnderName");
  v6[2] = CFSTR("kMDItemEventHotelProvider");
  v6[3] = CFSTR("kMDItemEventHotelModifyReservationUrl");
  v6[4] = CFSTR("kMDItemEventHotelCheckinDate");
  v6[5] = CFSTR("kMDItemEventHotelCheckinTime");
  v6[6] = CFSTR("kMDItemEventHotelCheckoutDate");
  v6[7] = CFSTR("kMDItemEventHotelCheckoutTime");
  v6[8] = CFSTR("kMDItemEventHotelTimeZone");
  v6[9] = CFSTR("kMDItemEventHotelReservationForName");
  v6[10] = CFSTR("kMDItemEventHotelReservationForAddress");
  v6[11] = CFSTR("kMDItemEventHotelReservationForStreetAddress");
  v6[12] = CFSTR("kMDItemEventHotelReservationForAddressLocality");
  v6[13] = CFSTR("kMDItemEventHotelReservationForAddressRegion");
  v6[14] = CFSTR("kMDItemEventHotelReservationForAddressPostalCode");
  v6[15] = CFSTR("kMDItemEventHotelReservationForAddressCountry");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 16);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)queryStringWithQueryContext_searchString_options__hotelEventAttributes;
  queryStringWithQueryContext_searchString_options__hotelEventAttributes = v4;

}

- (CSUserQuery)initWithQueryString:(id)a3 queryContext:(id)a4
{
  id v6;
  CSUserQuery *v7;
  CSUserQuery *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSUserQuery;
  v7 = -[CSSearchQuery initWithQueryString:queryContext:](&v10, sel_initWithQueryString_queryContext_, a3, v6);
  v8 = v7;
  if (v7)
    commonInit(v7, v6, v6, &stru_1E2406B38, 0);

  return v8;
}

- (CSUserQuery)initWithQueryString:(id)a3 context:(id)a4
{
  id v6;
  CSUserQuery *v7;
  CSUserQuery *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CSUserQuery;
  v7 = -[CSSearchQuery initWithQueryString:context:](&v10, sel_initWithQueryString_context_, a3, v6);
  v8 = v7;
  if (v7)
    commonInit(v7, v6, v6, &stru_1E2406B38, 0);

  return v8;
}

- (CSUserQuery)initWithUserQueryString:(id)a3 queryContext:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  CSUserQuery *v12;
  void *v13;
  objc_super v15;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CB37A0];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  +[CSUserQuery queryContextWithUserQueryString:searchString:clientContext:](CSUserQuery, "queryContextWithUserQueryString:searchString:clientContext:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryQuery();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CSUserQuery initWithUserQueryString:queryContext:].cold.1();

  v15.receiver = self;
  v15.super_class = (Class)CSUserQuery;
  v12 = -[CSSearchQuery initWithQueryString:queryContext:](&v15, sel_initWithQueryString_queryContext_, &stru_1E2406B38, v10);
  if (v12)
  {
    objc_msgSend(v6, "getParserOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    commonInit(v12, v10, v6, v9, v13);

  }
  return v12;
}

- (CSUserQuery)initWithUserAttributedQueryString:(id)a3 userQueryContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CSUserQuery *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "setAttributedUserQuery:", v7);
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[CSUserQuery initWithUserQueryString:userQueryContext:](self, "initWithUserQueryString:userQueryContext:", v8, v6);
  return v9;
}

- (CSUserQuery)initWithUserQueryString:(NSString *)userQueryString userQueryContext:(CSUserQueryContext *)userQueryContext
{
  CSUserQueryContext *v6;
  objc_class *v7;
  NSString *v8;
  id v9;
  void *v10;
  NSObject *v11;
  CSUserQuery *v12;
  void *v13;
  objc_super v15;

  v6 = userQueryContext;
  v7 = (objc_class *)MEMORY[0x1E0CB37A0];
  v8 = userQueryString;
  v9 = objc_alloc_init(v7);
  +[CSUserQuery queryContextWithUserQueryString:searchString:clientContext:](CSUserQuery, "queryContextWithUserQueryString:searchString:clientContext:", v8, v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryQuery();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[CSUserQuery initWithUserQueryString:queryContext:].cold.1();

  v15.receiver = self;
  v15.super_class = (Class)CSUserQuery;
  v12 = -[CSSearchQuery initWithQueryString:queryContext:](&v15, sel_initWithQueryString_queryContext_, &stru_1E2406B38, v10);
  if (v12)
  {
    -[CSUserQueryContext getParserOptions](v6, "getParserOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    commonInit(v12, v10, v6, v9, v13);

  }
  return v12;
}

- (BOOL)isTopHitQuery
{
  return self->_queryIsTopHit;
}

- (id)queryContext
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSUserQuery;
  -[CSSearchQuery queryContext](&v3, sel_queryContext);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)clientContext
{
  return self->_clientContext;
}

- (id)foundNLPSuggestions
{
  return self->_nlpSuggestions;
}

- (id)foundTemplateSuggestions
{
  return self->_templateSuggestions;
}

- (id)foundSuggestions
{
  return self->_suggestions;
}

- (id)foundCompletions
{
  return self->_completions;
}

- (id)foundInstantAnswers
{
  return self->_instantAnswers;
}

- (void)handleFoundNLPSuggestions:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __41__CSUserQuery_handleFoundNLPSuggestions___block_invoke;
    v5[3] = &unk_1E24013B8;
    v5[4] = self;
    v6 = v4;
    -[CSSearchQuery populateSuggestionCount:completionHandler:](self, "populateSuggestionCount:completionHandler:", v6, v5);

  }
}

void __41__CSUserQuery_handleFoundNLPSuggestions___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "queryContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "queryID");
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218498;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_18C42F000, v3, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle suggestion batches %@ for query:%@", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 336), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

}

- (void)handleFoundTemplateSuggestions:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__CSUserQuery_handleFoundTemplateSuggestions___block_invoke;
    v5[3] = &unk_1E24013B8;
    v5[4] = self;
    v6 = v4;
    -[CSSearchQuery populateSuggestionCount:completionHandler:](self, "populateSuggestionCount:completionHandler:", v6, v5);

  }
}

void __46__CSUserQuery_handleFoundTemplateSuggestions___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "queryContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "queryID");
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218498;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_18C42F000, v3, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle suggestion batches %@ for query:%@", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 344), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

}

- (void)handleFoundInstantAnswers:(id)a3
{
  id v4;
  CSUserQuery *v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  id v11;
  __int16 v12;
  CSUserQuery *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = self;
    objc_sync_enter(v5);
    logForCSLogCategoryQuery();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      -[CSUserQuery queryContext](v5, "queryContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 134218498;
      v9 = objc_msgSend(v7, "queryID");
      v10 = 2112;
      v11 = v4;
      v12 = 2112;
      v13 = v5;
      _os_log_debug_impl(&dword_18C42F000, v6, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle instant answer batches %@ for query:%@", (uint8_t *)&v8, 0x20u);

    }
    -[NSMutableArray addObjectsFromArray:](v5->_instantAnswers, "addObjectsFromArray:", v4);
    objc_sync_exit(v5);

  }
}

- (void)handleFoundSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CSUserQuery *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  CSUserQuery *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("resultCount != %lu"), 0x7FFFFFFFFFFFFFFFLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "count"))
  {
    v7 = self;
    objc_sync_enter(v7);
    logForCSLogCategoryQuery();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[CSUserQuery queryContext](v7, "queryContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218498;
      v15 = objc_msgSend(v11, "queryID");
      v16 = 2112;
      v17 = v6;
      v18 = 2112;
      v19 = v7;
      _os_log_debug_impl(&dword_18C42F000, v8, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle suggestion batches %@ for query:%@", buf, 0x20u);

    }
    -[NSMutableArray addObjectsFromArray:](v7->_suggestions, "addObjectsFromArray:", v6);
    objc_sync_exit(v7);

  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("resultCount == %lu"), 0x7FFFFFFFFFFFFFFFLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v10, "count"))
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __38__CSUserQuery_handleFoundSuggestions___block_invoke;
    v12[3] = &unk_1E24013B8;
    v12[4] = self;
    v13 = v10;
    -[CSSearchQuery populateSuggestionCount:completionHandler:](self, "populateSuggestionCount:completionHandler:", v13, v12);

  }
}

void __38__CSUserQuery_handleFoundSuggestions___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "queryContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "queryID");
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218498;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_18C42F000, v3, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle suggestion batches %@ for query:%@", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 352), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

}

- (void)handleParseResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CSAttributedQuery *v9;
  void *v10;
  CSAttributedQuery *v11;
  void *v12;
  CSAttributedQuery *v13;
  void (**v14)(_QWORD, _QWORD);
  void (**v15)(_QWORD, _QWORD);
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSUserQuery attributedQueryHandler](self, "attributedQueryHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kQPPhotosEmbedding"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("queryUnderstandingOutput"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("attributedParse"));
      v9 = (CSAttributedQuery *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kQPQUOutputTokenInfo"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = [CSAttributedQuery alloc];
        v16[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[CSAttributedQuery initWithAttributedParses:outputTokenInfo:embedding:](v11, "initWithAttributedParses:outputTokenInfo:embedding:", v12, v10, v6);

      }
      else
      {
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("attributedParses"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[CSAttributedQuery initWithAttributedParses:outputTokenInfo:embedding:]([CSAttributedQuery alloc], "initWithAttributedParses:outputTokenInfo:embedding:", v10, 0, v6);
      }
      -[CSUserQuery attributedQueryHandler](self, "attributedQueryHandler");
      v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, CSAttributedQuery *))v15)[2](v15, v13);

    }
    else
    {
      v9 = -[CSAttributedQuery initWithAttributedQuery:embedding:]([CSAttributedQuery alloc], "initWithAttributedQuery:embedding:", 0, v6);
      -[CSUserQuery attributedQueryHandler](self, "attributedQueryHandler");
      v14 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, CSAttributedQuery *))v14)[2](v14, v9);

    }
  }

}

- (void)handleFoundItems:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSUserQuery;
  v4 = a3;
  -[CSSearchQuery handleFoundItems:](&v5, sel_handleFoundItems_, v4);
  -[CSUserQuery processInstantAnswersWithFoundItems:](self, "processInstantAnswersWithFoundItems:", v4, v5.receiver, v5.super_class);

}

- (void)handleFoundCompletions:(id)a3
{
  id v4;
  _QWORD v5[5];
  id v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __38__CSUserQuery_handleFoundCompletions___block_invoke;
    v5[3] = &unk_1E24013B8;
    v5[4] = self;
    v6 = v4;
    -[CSSearchQuery populateSuggestionCount:completionHandler:](self, "populateSuggestionCount:completionHandler:", v6, v5);

  }
}

void __38__CSUserQuery_handleFoundCompletions___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  logForCSLogCategoryQuery();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(*(id *)(a1 + 32), "queryContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "queryID");
    v7 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 134218498;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_debug_impl(&dword_18C42F000, v3, OS_LOG_TYPE_DEBUG, "qid=%ld - Handle completion batches %@ for query:%@", (uint8_t *)&v8, 0x20u);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 360), "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

}

- (NSInteger)foundSuggestionCount
{
  CSUserQuery *v2;
  NSInteger foundSuggestionCount;

  v2 = self;
  objc_sync_enter(v2);
  foundSuggestionCount = v2->_foundSuggestionCount;
  objc_sync_exit(v2);

  return foundSuggestionCount;
}

- (id)processToContacts:(id)a3 resultsToMultiQuery:(id)a4 contactsTo:(id)a5 processedContacts:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v37;
  CSUserQuery *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (-[CSSearchQuery isCancelled](self, "isCancelled"))
  {
    v14 = 0;
  }
  else
  {
    v15 = objc_msgSend(v12, "count");
    if (v15 == objc_msgSend(v11, "count"))
    {
      v38 = self;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
      v16 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v12, "count"))
      {
        v17 = 0;
        do
        {
          objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

          if (v19)
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setScope:", 2);

            objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject addObject:](v16, "addObject:", v21);

            objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v22);

          }
          ++v17;
        }
        while (v17 < objc_msgSend(v12, "count"));
      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = 0u;
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v39 = v10;
      v24 = v10;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v41;
        do
        {
          for (i = 0; i != v26; ++i)
          {
            if (*(_QWORD *)v41 != v27)
              objc_enumerationMutation(v24);
            v29 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
            if (objc_msgSend(v13, "containsObject:", v29))
              objc_msgSend(v23, "addObject:", v29);
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v40, v52, 16);
        }
        while (v26);
      }

      logForCSLogCategoryDefault();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        -[CSUserQuery queryContext](v38, "queryContext");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "queryID");
        v33 = objc_msgSend(v13, "count");
        v34 = -[NSObject count](v16, "count");
        v35 = objc_msgSend(v23, "count");
        *(_DWORD *)buf = 134218752;
        v45 = v32;
        v46 = 2048;
        v47 = v33;
        v48 = 2048;
        v49 = v34;
        v50 = 2048;
        v51 = v35;
        _os_log_impl(&dword_18C42F000, v30, OS_LOG_TYPE_INFO, "qid=%ld - [ContactSearch] Processed contacts: %lu, Recipient contacts: %lu, Total trimmed contacts: %lu", buf, 0x2Au);

      }
      v14 = (void *)objc_msgSend(v23, "copy");

      v10 = v39;
    }
    else
    {
      logForCSLogCategoryQuery();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      {
        -[CSUserQuery queryContext](self, "queryContext");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218496;
        v45 = objc_msgSend(v37, "queryID");
        v46 = 2048;
        v47 = objc_msgSend(v12, "count");
        v48 = 2048;
        v49 = objc_msgSend(v11, "count");
        _os_log_fault_impl(&dword_18C42F000, v16, OS_LOG_TYPE_FAULT, "qid=%ld - [ContactSearch] suggestions.count %lu != results.count %lu", buf, 0x20u);

      }
      v14 = 0;
    }

  }
  return v14;
}

- (id)processFromContacts:(id)a3 resultsFromMultiQuery:(id)a4 contactsFrom:(id)a5 processedContacts:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  uint64_t v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  if (!-[CSSearchQuery isCancelled](self, "isCancelled"))
  {
    -[CSUserQuery queryContext](self, "queryContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "currentTokenScope") == 1)
    {

    }
    else
    {
      v14 = objc_msgSend(v10, "count");
      v15 = objc_msgSend(v9, "count");

      if (v14 != v15)
      {
        logForCSLogCategoryQuery();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
        {
          -[CSUserQuery queryContext](self, "queryContext");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 134218496;
          v46 = objc_msgSend(v38, "queryID");
          v47 = 2048;
          v48 = objc_msgSend(v10, "count");
          v49 = 2048;
          v50 = objc_msgSend(v9, "count");
          _os_log_fault_impl(&dword_18C42F000, v16, OS_LOG_TYPE_FAULT, "qid=%ld - [ContactSearch] suggestions.count %lu != results.count %lu", buf, 0x20u);

        }
        v12 = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
    v16 = objc_claimAutoreleasedReturnValue();
    -[CSUserQuery queryContext](self, "queryContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "currentTokenScope") == 1)
    {
LABEL_12:

    }
    else
    {
      v18 = 0;
      while (1)
      {
        v19 = objc_msgSend(v10, "count");

        if (v18 >= v19)
          break;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "count");

        if (v21)
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setScope:", 1);

          objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v16, "addObject:", v23);

          objc_msgSend(v10, "objectAtIndexedSubscript:", v18);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v24);

        }
        ++v18;
        -[CSUserQuery queryContext](self, "queryContext");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "currentTokenScope") == 1)
          goto LABEL_12;
      }
    }
    v39 = v11;
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    objc_msgSend(v10, "differenceFromArray:", v16);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "insertions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v41 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * i), "object");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v28);
    }

    logForCSLogCategoryDefault();
    v32 = objc_claimAutoreleasedReturnValue();
    v11 = v39;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      -[CSUserQuery queryContext](self, "queryContext");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "queryID");
      v35 = objc_msgSend(v39, "count");
      v36 = -[NSObject count](v16, "count");
      *(_DWORD *)buf = 134218496;
      v46 = v34;
      v47 = 2048;
      v48 = v35;
      v49 = 2048;
      v50 = v36;
      _os_log_impl(&dword_18C42F000, v32, OS_LOG_TYPE_INFO, "qid=%ld - [ContactSearch] Processed contacts: %lu, Author contacts: %lu", buf, 0x20u);

    }
    goto LABEL_26;
  }
  v12 = 0;
LABEL_27:

  return v12;
}

- (void)filterContactPeopleSuggestions:(id)a3 cachedSuggestionsEmailToScope:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t k;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  void *v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  unint64_t m;
  void *v46;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  BOOL v53;
  void *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  uint64_t v59;
  _CSMultiQuery *contactCountingQuerySearchFrom;
  void *v61;
  id obj;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  uint64_t i;
  id v68;
  uint64_t v69;
  char v70;
  id v71;
  CSUserQuery *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t j;
  _QWORD v76[5];
  id v77;
  id v78;
  id v79;
  id v80;
  uint64_t *v81;
  _BYTE *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  uint64_t v95;
  uint64_t *v96;
  uint64_t v97;
  uint64_t (*v98)(uint64_t, uint64_t);
  void (*v99)(uint64_t);
  id v100;
  _BYTE buf[24];
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  _BYTE v105[128];
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v71 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  v72 = self;
  if (-[CSSearchQuery isCancelled](self, "isCancelled"))
  {
    v9[2](v9, 0);
    goto LABEL_49;
  }
  if (!objc_msgSend(v8, "count"))
  {
    ((void (**)(id, id))v9)[2](v9, v8);
    goto LABEL_49;
  }
  v61 = v9;
  v95 = 0;
  v96 = &v95;
  v97 = 0x3032000000;
  v98 = __Block_byref_object_copy__0;
  v99 = __Block_byref_object_dispose__0;
  v100 = 0;
  v100 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSUserQuery queryContext](self, "queryContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "containsString:", CFSTR("@"));

  if (v12)
  {
    -[CSUserQuery queryContext](v72, "queryContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userQuery");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[_CSContactSearch filterContactsBasedOnUserQueryString:contacts:](_CSContactSearch, "filterContactsBasedOnUserQueryString:contacts:", v14, v8);
    v15 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v15;
  }
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  obj = v8;
  v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  if (!v64)
    goto LABEL_42;
  v63 = *(_QWORD *)v92;
  do
  {
    for (i = 0; i != v64; ++i)
    {
      if (*(_QWORD *)v92 != v63)
        objc_enumerationMutation(obj);
      v16 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * i);
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v66 = v16;
      objc_msgSend(v16, "emailAddresses", v61);
      v68 = (id)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
      if (!v74)
      {
        v69 = 1;
        v70 = 0;
        goto LABEL_38;
      }
      v73 = *(_QWORD *)v88;
      v69 = 1;
      v70 = 0;
      do
      {
        for (j = 0; j != v74; ++j)
        {
          if (*(_QWORD *)v88 != v73)
            objc_enumerationMutation(v68);
          v17 = *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * j);
          v83 = 0u;
          v84 = 0u;
          v85 = 0u;
          v86 = 0u;
          -[CSUserQuery queryContext](v72, "queryContext");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "suggestion");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "previousSuggestionTokens");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
          if (!v21)
            goto LABEL_32;
          v22 = *(_QWORD *)v84;
          while (2)
          {
            for (k = 0; k != v21; ++k)
            {
              if (*(_QWORD *)v84 != v22)
                objc_enumerationMutation(v20);
              v24 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * k);
              objc_msgSend(v24, "itemSummary");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (v25)
              {
                objc_msgSend(v24, "itemSummary");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "allEmailAddresses");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "count") == 0;

                if (!v28)
                {
                  objc_msgSend(v24, "itemSummary");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "allEmailAddresses");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = objc_msgSend(v30, "containsObject:", v17);

                  if (v31)
                  {
                    if (objc_msgSend(v24, "selectedScope"))
                    {
                      if (objc_msgSend(v24, "selectedScope") != 1)
                        continue;
                      v70 = 1;
                      v32 = 1;
                    }
                    else
                    {
                      v70 = 1;
                      v32 = 2;
                    }
                    v69 = v32;
                    goto LABEL_32;
                  }
                }
              }
            }
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v83, v105, 16);
            if (v21)
              continue;
            break;
          }
LABEL_32:

          objc_msgSend(v71, "objectForKeyedSubscript:", v17);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "isEqualToNumber:", &unk_1E242FC10);

          if ((v34 & 1) != 0)
          {
            v70 = 1;
            v69 = 2;
            goto LABEL_38;
          }
        }
        v74 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v87, v106, 16);
      }
      while (v74);
LABEL_38:

      objc_msgSend(v66, "setScope:", v69);
      v35 = v65;
      if ((v70 & 1) != 0)
        v35 = (void *)v96[5];
      objc_msgSend(v35, "addObject:", v66);
    }
    v64 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v91, v107, 16);
  }
  while (v64);
LABEL_42:

  -[CSUserQuery queryContext](v72, "queryContext");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  +[CSUserQuery generateFilterQueriesBasedOnPreviousSuggestions:](CSUserQuery, "generateFilterQueriesBasedOnPreviousSuggestions:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryDefault();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    -[CSUserQuery queryContext](v72, "queryContext");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "queryID");
    v41 = objc_msgSend(obj, "count");
    v42 = objc_msgSend((id)v96[5], "count");
    v43 = objc_msgSend(v65, "count");
    *(_DWORD *)buf = 134218752;
    *(_QWORD *)&buf[4] = v40;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v41;
    *(_WORD *)&buf[22] = 2048;
    v102 = v42;
    v103 = 2048;
    v104 = v43;
    _os_log_impl(&dword_18C42F000, v38, OS_LOG_TYPE_INFO, "qid=%ld - [ContactSearch] Total contacts: %lu, Cached contacts: %lu, Fresh contacts: %lu", buf, 0x2Au);

  }
  v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v65, "count"));
  for (m = 0; ; ++m)
  {
    -[CSUserQuery queryContext](v72, "queryContext", v61);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v46, "currentTokenScope") == 1)
      break;
    v47 = m < objc_msgSend(v65, "count");

    if (!v47)
      goto LABEL_51;
    objc_msgSend(v65, "objectAtIndexedSubscript:", m);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "emailAddresses");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v49);

  }
LABEL_51:
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v102) = 0;
  -[CSUserQuery queryContext](v72, "queryContext");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "suggestion");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "previousSuggestionTokens");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "count") != 0;

  LOBYTE(v102) = v53;
  v54 = (void *)objc_msgSend(v44, "copy");
  -[CSUserQuery queryContext](v72, "queryContext");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  v76[0] = MEMORY[0x1E0C809B0];
  v76[1] = 3221225472;
  v76[2] = __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke;
  v76[3] = &unk_1E2401408;
  v76[4] = v72;
  v8 = obj;
  v77 = v8;
  v57 = v65;
  v78 = v57;
  v81 = &v95;
  v80 = v61;
  v58 = v37;
  v79 = v58;
  v82 = buf;
  +[_CSMultiQuery countingQueryForEmailsArrays:scope:context:contextualFilterQueries:includeSecondaryRecipients:completionHandler:](_CSMultiQuery, "countingQueryForEmailsArrays:scope:context:contextualFilterQueries:includeSecondaryRecipients:completionHandler:", v54, 1, v55, v58, v56, v76);
  v59 = objc_claimAutoreleasedReturnValue();
  contactCountingQuerySearchFrom = v72->_contactCountingQuerySearchFrom;
  v72->_contactCountingQuerySearchFrom = (_CSMultiQuery *)v59;

  -[_CSMultiQuery start](v72->_contactCountingQuerySearchFrom, "start");
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v95, 8);
  v9 = (void (**)(id, _QWORD))v61;
LABEL_49:

}

void __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  _BOOL4 v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  _QWORD v27[5];
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "processFromContacts:resultsFromMultiQuery:contactsFrom:processedContacts:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
LABEL_18:
    (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
    goto LABEL_19;
  }
  if (objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v32;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v32 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v11), "emailAddresses");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v9);
    }

    objc_msgSend(*(id *)(a1 + 32), "queryContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[2] = __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_534;
    v27[3] = &unk_1E24013E0;
    v15 = *(void **)(a1 + 40);
    v27[4] = *(_QWORD *)(a1 + 32);
    v16 = *(_QWORD *)(a1 + 56);
    v27[1] = 3221225472;
    v28 = v15;
    v29 = v7;
    v26 = *(_OWORD *)(a1 + 64);
    v17 = (id)v26;
    v30 = v26;
    +[_CSMultiQuery countingQueryForEmailsArrays:scope:context:contextualFilterQueries:includeSecondaryRecipients:completionHandler:](_CSMultiQuery, "countingQueryForEmailsArrays:scope:context:contextualFilterQueries:includeSecondaryRecipients:completionHandler:", v6, 2, v13, v16, v14, v27);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(void **)(v19 + 392);
    *(_QWORD *)(v19 + 392) = v18;

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 392), "start");
    goto LABEL_19;
  }
  v21 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "count");
  logForCSLogCategoryDefault();
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG);
  if (!v21)
  {
    if (v23)
      __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_cold_1(v3);

    goto LABEL_18;
  }
  if (v23)
    __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_cold_2(v3);

  v24 = *(_QWORD *)(a1 + 64);
  v25 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "copy");
  (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v25);

LABEL_19:
}

void __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_534(uint64_t a1, uint64_t a2)
{
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "processToContacts:resultsToMultiQuery:contactsTo:processedContacts:", *(_QWORD *)(a1 + 40), a2, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

- (id)peopleSuggestionsWithContactSearchResults:(id)a3
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CSSuggestion *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  CSSuggestion *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id obj;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[21];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v3;
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v35)
  {
    v33 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v38 != v33)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        if (objc_msgSend(v5, "scope") == 2)
          v6 = &unk_1E242FC28;
        else
          v6 = &unk_1E242FBF8;
        if ((objc_msgSend(v5, "sourceType") & 1) != 0)
          v7 = 12;
        else
          v7 = 4;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSString length](self->_searchString, "length"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = v8;
        v41[1] = &unk_1E242FC28;
        v41[2] = &unk_1E242FC40;
        v41[3] = &unk_1E242FC58;
        v41[4] = &unk_1E2430328;
        v41[5] = &unk_1E2430338;
        v41[6] = &unk_1E242FC28;
        v41[7] = &unk_1E242FC28;
        v41[8] = &unk_1E242FC28;
        v41[9] = &unk_1E242FC28;
        v41[10] = &unk_1E242FC28;
        v41[11] = &unk_1E242FC70;
        v41[12] = &unk_1E2430348;
        v41[13] = &unk_1E2430358;
        v41[14] = &unk_1E242FC88;
        v41[15] = v6;
        v9 = v5;
        v41[16] = &unk_1E242FC28;
        v41[17] = &unk_1E242FBF8;
        v41[18] = &unk_1E242FC28;
        v41[19] = &unk_1E242FC28;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v7);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v41[20] = v10;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 21);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v12 = [CSSuggestion alloc];
        -[CSUserQuery queryContext](self, "queryContext");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "userQuery");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSUserQuery queryContext](self, "queryContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "suggestion");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (uint64_t)v17;
        if (!v17)
        {
          objc_msgSend(v9, "emailAddresses");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v18 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v18;
        }
        v36 = v9;
        objc_msgSend(v9, "emailAddresses");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[CSSuggestion initWithUserString:currentSuggestion:displayString:attributeValues:attributeStrings:options:](v12, "initWithUserString:currentSuggestion:displayString:attributeValues:attributeStrings:options:", v14, v16, v18, v11, v19, MEMORY[0x1E0C9AA70]);

        if (!v17)
        {

        }
        -[CSSuggestion currentToken](v20, "currentToken");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setInternalType:", 4);

        -[CSSuggestion currentToken](v20, "currentToken");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setBundleType:", 1);

        -[CSSuggestion currentToken](v20, "currentToken");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "itemSummary");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          -[CSSuggestion currentToken](v20, "currentToken");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "itemSummary");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "nameComponents");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setNameComponents:", v27);

        }
        if (v20)
          objc_msgSend(v30, "addObject:", v20);

      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v35);
  }

  return v30;
}

- (void)handleSuggestions
{
  void *v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(a1, "queryContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14(v4, v5);
  objc_msgSend(a2, "count");
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v6, v7, "qid=%ld - CSUserQuery: returning %lu suggestions", v8, v9, v10, v11, 0);

  OUTLINED_FUNCTION_6();
}

- (void)handleInstantAnswers
{
  CSUserQuery *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v2 = self;
  objc_sync_enter(v2);
  -[CSUserQuery foundInstantAnswers](v2, "foundInstantAnswers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v7, "addObjectsFromArray:", v4);
  }
  else
  {
    v7 = 0;
  }

  objc_sync_exit(v2);
  -[CSUserQuery foundInstantAnswersHandler](v2, "foundInstantAnswersHandler");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5 && v7)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v7);

}

- (void)handleCompletion:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[CSUserQuery handleSuggestions](self, "handleSuggestions");
  -[CSUserQuery handleInstantAnswers](self, "handleInstantAnswers");
  v5.receiver = self;
  v5.super_class = (Class)CSUserQuery;
  -[CSSearchQuery handleCompletion:](&v5, sel_handleCompletion_, v4);

}

- (void)handleQueryRewritten
{
  CSUserQuery *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_queryRewritten = 1;
  objc_sync_exit(obj);

}

- (void)userEngagedWithItem:(id)a3 visibleItems:(id)a4 userInteractionType:(int64_t)a5
{
  if (!a5)
    -[CSUserQuery userEngagedWithResult:visibleResults:interactionType:](self, "userEngagedWithResult:visibleResults:interactionType:", a3, a4, 8);
}

- (void)userEngagedWithResult:(id)a3 visibleResults:(id)a4 interactionType:(int)a5
{
  -[CSUserQuery userEngagedWithResult:interactionType:](self, "userEngagedWithResult:interactionType:", a3, *(_QWORD *)&a5);
}

- (BOOL)queryRewritten
{
  CSUserQuery *v2;
  BOOL queryRewritten;

  v2 = self;
  objc_sync_enter(v2);
  queryRewritten = v2->_queryRewritten;
  objc_sync_exit(v2);

  return queryRewritten;
}

- (void)willStartQuery
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v2, v3, "qid=%ld - CSUserQuery: generating query", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

- (void)start
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  NSUInteger v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[CSSearchQuery queryString](self, "queryString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    v6 = 0;
    goto LABEL_18;
  }
  -[CSUserQuery queryContext](self, "queryContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "normalizedSearchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "live");
  if (v8)
  {
    objc_msgSend(v7, "clientBundleID");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.mobilemail")))
    {

LABEL_10:
      logForCSLogCategoryQuery();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        -[CSUserQuery queryContext](self, "queryContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "queryID");
        -[CSUserQuery queryContext](self, "queryContext");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "clientBundleID");
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 134218242;
        v30 = v13;
        v31 = 2080;
        v32 = objc_msgSend(v15, "UTF8String");
        _os_log_impl(&dword_18C42F000, v11, OS_LOG_TYPE_DEFAULT, "qid=%ld - CSUserQuery: %s query is a live query; also disabling blocking on index here.",
          buf,
          0x16u);

      }
      objc_msgSend(v7, "setDisableBlockingOnIndex:", 1);
      goto LABEL_13;
    }
  }
  objc_msgSend(v7, "clientBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.mobileslideshow"));

  if (v8)
  {

    if ((v10 & 1) != 0)
      goto LABEL_10;
  }
  else if (v10)
  {
    goto LABEL_10;
  }
LABEL_13:
  -[CSUserQuery foundSuggestionsHandler](self, "foundSuggestionsHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 && objc_msgSend(v7, "maxSuggestionCount");
  objc_msgSend(v7, "setGenerateSuggestions:", v17);
  -[CSUserQuery foundInstantAnswersHandler](self, "foundInstantAnswersHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnableInstantAnswers:", v18 != 0);
  -[CSSearchQuery updateQueryContext:](self, "updateQueryContext:", v7);

LABEL_18:
  -[CSUserQuery queryContext](self, "queryContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "isMail"))
  {
    v20 = -[NSString length](self->_searchString, "length");

    if (v20)
      goto LABEL_22;
    objc_msgSend((id)objc_opt_class(), "mailResources");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_22:
  if (!objc_msgSend(v6, "length"))
  {
    -[CSUserQuery queryContext](self, "queryContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "userQuery");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");
    -[CSUserQuery queryContext](self, "queryContext");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v23)
    {
      objc_msgSend(v24, "userQuery");
      v26 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v24, "suggestion");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "userQueryString");
      v26 = objc_claimAutoreleasedReturnValue();

      v6 = v27;
    }

    v6 = (void *)v26;
  }
  -[CSUserQuery startContactSearchIfNeededWithSearchQuery:](self, "startContactSearchIfNeededWithSearchQuery:", v6);
  v28.receiver = self;
  v28.super_class = (Class)CSUserQuery;
  -[CSSearchQuery start](&v28, sel_start);

}

- (void)cancel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _CSContactSearch *contactSearch;
  _CSMultiQuery *contactCountingQuerySearchFrom;
  _CSMultiQuery *contactCountingQuerySearchTo;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  GetCSUserQueryParser();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CFSTR("queryID");
  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[CSUserQuery queryContext](self, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "queryID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_CSUserQueryCancelQueryWithReferenceDict:", v7);

  contactSearch = self->_contactSearch;
  if (contactSearch)
    -[_CSContactSearch cancel](contactSearch, "cancel");
  contactCountingQuerySearchFrom = self->_contactCountingQuerySearchFrom;
  if (contactCountingQuerySearchFrom)
    -[_CSMultiQuery cancel](contactCountingQuerySearchFrom, "cancel");
  contactCountingQuerySearchTo = self->_contactCountingQuerySearchTo;
  if (contactCountingQuerySearchTo)
    -[_CSMultiQuery cancel](contactCountingQuerySearchTo, "cancel");
  v11.receiver = self;
  v11.super_class = (Class)CSUserQuery;
  -[CSSearchQuery cancel](&v11, sel_cancel);
}

+ (id)normalizeAndTrimContacts:(id)a3 maxCount:(int64_t)a4
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  unint64_t v24;
  void *v25;
  unint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v27 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v11, "contactIdentifier", v27);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "contactIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v11, "contactIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "emailAddresses");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v15, "initWithArray:", v18);

            objc_msgSend(v11, "emailAddresses");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "addObjectsFromArray:", v20);

            objc_msgSend(v11, "contactIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "objectForKeyedSubscript:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setEmailAddresses:", v19);

          }
          else
          {
            objc_msgSend(v6, "addObject:", v11);
            objc_msgSend(v11, "contactIdentifier");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v11, v19);
          }

        }
        else
        {
          objc_msgSend(v6, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v8);
  }

  v23 = objc_msgSend(v6, "count");
  if (v23 >= v27)
    v24 = v27;
  else
    v24 = v23;
  objc_msgSend(v6, "subarrayWithRange:", 0, v24, v27);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (void)startContactSearchWithUserQuery:(id)a3 maxCount:(int64_t)a4
{
  id v6;
  int64_t v7;
  id v8;
  CSUserQuery *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  dispatch_semaphore_t v21;
  _CSContactSearch *v22;
  void *v23;
  uint64_t v24;
  _CSContactSearch *contactSearch;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  CSUserQuery *val;
  NSMutableArray *obj;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD v35[4];
  NSObject *v36;
  id v37;
  id v38[2];
  id location;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 10;
  if (a4)
    v7 = a4;
  v28 = (void *)v7;
  v29 = v6;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = self;
  objc_sync_enter(v9);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  val = v9;
  obj = v9->_suggestions;
  v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
  if (v33)
  {
    v32 = *(_QWORD *)v45;
    do
    {
      v34 = 0;
      do
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v34);
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v10, "currentToken", v28);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemSummary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "emailAddresses");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v14)
        {
          v15 = *(_QWORD *)v41;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v41 != v15)
                objc_enumerationMutation(v13);
              v17 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v16);
              v18 = (void *)MEMORY[0x1E0CB37E8];
              objc_msgSend(v10, "currentToken");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "numberWithUnsignedLong:", objc_msgSend(v19, "selectedScope"));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "setObject:forKeyedSubscript:", v20, v17);

              ++v16;
            }
            while (v14 != v16);
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v14);
        }

        ++v34;
      }
      while (v34 != v33);
      v33 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    }
    while (v33);
  }

  objc_sync_exit(val);
  v21 = dispatch_semaphore_create(0);
  objc_storeStrong((id *)&val->_contactSearchSemaphore, v21);
  val->_contactSearchSemaphoreWaitTime = dispatch_time(0, 350000000);
  v22 = [_CSContactSearch alloc];
  -[CSUserQuery queryContext](val, "queryContext");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[_CSContactSearch initWithQuery:queryID:autocompleteEnabled:](v22, "initWithQuery:queryID:autocompleteEnabled:", v29, objc_msgSend(v23, "queryID"), 1);
  contactSearch = val->_contactSearch;
  val->_contactSearch = (_CSContactSearch *)v24;

  location = 0;
  objc_initWeak(&location, val);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __56__CSUserQuery_startContactSearchWithUserQuery_maxCount___block_invoke;
  v35[3] = &unk_1E2401458;
  objc_copyWeak(v38, &location);
  v26 = v21;
  v36 = v26;
  v38[1] = v28;
  v27 = v8;
  v37 = v27;
  -[_CSContactSearch setCompletionHandler:](val->_contactSearch, "setCompletionHandler:", v35);
  -[_CSContactSearch start](val->_contactSearch, "start");

  objc_destroyWeak(v38);
  objc_destroyWeak(&location);

}

void __56__CSUserQuery_startContactSearchWithUserQuery_maxCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if ((objc_msgSend(WeakRetained, "isCancelled") & 1) != 0 || !objc_msgSend(v5, "count"))
    {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    }
    else
    {
      +[CSUserQuery normalizeAndTrimContacts:maxCount:](CSUserQuery, "normalizeAndTrimContacts:maxCount:", v5, *(_QWORD *)(a1 + 56));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __56__CSUserQuery_startContactSearchWithUserQuery_maxCount___block_invoke_2;
      v11[3] = &unk_1E2401430;
      objc_copyWeak(&v13, (id *)(a1 + 48));
      v12 = *(id *)(a1 + 32);
      objc_msgSend(v8, "filterContactPeopleSuggestions:cachedSuggestionsEmailToScope:completionHandler:", v9, v10, v11);

      objc_destroyWeak(&v13);
    }
  }

}

void __56__CSUserQuery_startContactSearchWithUserQuery_maxCount___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_sync_enter(v6);
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 134217984;
      v9 = objc_msgSend(v3, "count");
      _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_INFO, "[ContactSearch]: %lu available after contact filtering", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(v6, "setContactSearchResults:", v3);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    objc_sync_exit(v6);

  }
}

+ (id)generateFilterQueriesBasedOnPreviousSuggestions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "filterQueries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v3, "filterQueries");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v5, "initWithArray:", v6);

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }

  objc_msgSend(v3, "suggestion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "previousSuggestionTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v3, "suggestion", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "previousSuggestionTokens");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v24 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v18, "tokenQueryString");
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
          {
            objc_msgSend(v18, "tokenQueryString");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v20);

          }
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v15);
    }

    objc_msgSend(v7, "addObjectsFromArray:", v11);
  }
  v21 = (void *)objc_msgSend(v7, "copy");

  return v21;
}

- (void)startContactSearchIfNeededWithSearchQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;

  v4 = a3;
  -[CSUserQuery queryContext](self, "queryContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isMail") & 1) == 0)
    goto LABEL_5;
  -[CSUserQuery queryContext](self, "queryContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "generateSuggestions");

  if (v7)
  {
    if (objc_msgSend(v4, "length"))
    {
      -[CSUserQuery queryContext](self, "queryContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSUserQuery startContactSearchWithUserQuery:maxCount:](self, "startContactSearchWithUserQuery:maxCount:", v4, objc_msgSend(v5, "maxSuggestionCount"));
LABEL_5:

      goto LABEL_6;
    }
    logForCSLogCategoryDefault();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[CSUserQuery startContactSearchIfNeededWithSearchQuery:].cold.1();

  }
LABEL_6:

}

- (CSUserQuery)initWithSearchString:(id)a3 keyboardLanguage:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  CSUserQuery *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "setKeyboardLanguage:", v9);

  objc_msgSend(v11, "setFetchAttributes:", v8);
  objc_msgSend(v11, "setUserQuery:", v10);

  objc_msgSend(v11, "setLowPriority:", 0);
  v12 = -[CSUserQuery initWithQueryString:context:](self, "initWithQueryString:context:", &stru_1E2406B38, v11);

  return v12;
}

- (CSUserQuery)initWithUserString:(id)a3 queryContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CSUserQuery *v9;
  CSUserQuery *v10;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "setUserQuery:", v6);
  objc_msgSend(v7, "setGenerateSuggestions:", objc_msgSend(v7, "maxSuggestionCount") != 0);
  -[CSUserQuery queryStringWithQueryContext:searchString:options:](self, "queryStringWithQueryContext:searchString:options:", v7, 0, MEMORY[0x1E0C9AA70]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)CSUserQuery;
  v9 = -[CSSearchQuery initWithQueryString:queryContext:](&v12, sel_initWithQueryString_queryContext_, v8, v7);
  v10 = v9;
  if (v9)
    commonInit(v9, v7, v7, v6, 0);

  return v10;
}

- (id)keyboardLanguage
{
  void *v2;
  void *v3;

  -[CSUserQuery queryContext](self, "queryContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardLanguage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setFilterQueries:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[CSUserQuery queryContext](self, "queryContext");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilterQueries:", v4);

}

- (id)filterQueries
{
  void *v2;
  void *v3;

  -[CSUserQuery queryContext](self, "queryContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "filterQueries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)userEngagedWithResult:(id)a3 interactionType:(int)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSUserQuery;
  -[CSSearchQuery userEngagedWithResult:interactionType:](&v4, sel_userEngagedWithResult_interactionType_, a3, *(_QWORD *)&a4);
}

- (void)prepareSearch
{
  void *v3;
  void *v4;
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
  objc_super v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)CSUserQuery;
  -[CSSearchQuery prepareSearch](&v17, sel_prepareSearch);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[CSUserQuery queryContext](self, "queryContext", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchAttributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("kMDItemDonatedEvent")) & 1) != 0)
        break;
      if ((objc_msgSend(v9, "isEqualToString:", CFSTR("kMDQueryResultInstantAnswers")) & 1) != 0)
      {

        -[CSUserQuery queryContext](self, "queryContext");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "fetchAttributes");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "arrayByAddingObject:", CFSTR("kMDItemDonatedEvent"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CSUserQuery queryContext](self, "queryContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setFetchAttributes:", v11);

        break;
      }
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)foundSuggestionsHandler
{
  return objc_getProperty(self, a2, 440, 1);
}

- (void)setFoundSuggestionsHandler:(void *)foundSuggestionsHandler
{
  objc_setProperty_atomic_copy(self, a2, foundSuggestionsHandler, 440);
}

- (id)foundInstantAnswersHandler
{
  return objc_getProperty(self, a2, 448, 1);
}

- (void)setFoundInstantAnswersHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 448);
}

- (id)foundInstantAnswersHandlerOld
{
  return objc_getProperty(self, a2, 456, 1);
}

- (void)setFoundInstantAnswersHandlerOld:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 456);
}

- (id)attributedQueryHandler
{
  return objc_getProperty(self, a2, 464, 1);
}

- (void)setAttributedQueryHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 464);
}

- (NSArray)contactSearchResults
{
  return self->_contactSearchResults;
}

- (void)setContactSearchResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (OS_dispatch_semaphore)contactSearchSemaphore
{
  return self->_contactSearchSemaphore;
}

- (unint64_t)contactSearchSemaphoreWaitTime
{
  return self->_contactSearchSemaphoreWaitTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSearchSemaphore, 0);
  objc_storeStrong((id *)&self->_contactSearchResults, 0);
  objc_storeStrong(&self->_attributedQueryHandler, 0);
  objc_storeStrong(&self->_foundInstantAnswersHandlerOld, 0);
  objc_storeStrong(&self->_foundInstantAnswersHandler, 0);
  objc_storeStrong(&self->_foundSuggestionsHandler, 0);
  objc_storeStrong((id *)&self->_contactCountingQuerySearchTo, 0);
  objc_storeStrong((id *)&self->_contactCountingQuerySearchFrom, 0);
  objc_storeStrong((id *)&self->_contactSearch, 0);
  objc_storeStrong((id *)&self->_instantAnswers, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_templateSuggestions, 0);
  objc_storeStrong((id *)&self->_nlpSuggestions, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_parserOptions, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)handleFoundInstantAnswer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD);

  v4 = a3;
  logForCSLogCategoryQuery();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[CSUserQuery(CSInstantAnswer) handleFoundInstantAnswer:].cold.1();

  -[CSUserQuery foundInstantAnswersHandlerOld](self, "foundInstantAnswersHandlerOld");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[CSUserQuery foundInstantAnswersHandlerOld](self, "foundInstantAnswersHandlerOld");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v7)[2](v7, v4);

  }
}

- (void)processInstantAnswersWithFoundItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  CSInstantAnswer *v16;
  CSUserQuery *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CSUserQuery foundInstantAnswersHandlerOld](self, "foundInstantAnswersHandlerOld");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v17 = self;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "attributeSet");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "donatedEvent");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v13, "type");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("flight"));

            if (v15)
            {
              v16 = -[CSInstantAnswer initWithEvent:]([CSInstantAnswer alloc], "initWithEvent:", v13);
              objc_msgSend(v6, "addObject:", v16);

            }
          }

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    -[CSUserQuery handleFoundInstantAnswer:](v17, "handleFoundInstantAnswer:", v6);
  }

}

+ (id)trimSuggestions:(id)a3 options:(id)a4 peopleSelectedScope:(int64_t)a5 isShortQuery:(BOOL)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  void *v43;
  void *v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  unint64_t v75;
  unint64_t v76;
  void *v77;
  char *v78;
  unint64_t v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  _BYTE v99[128];
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v88 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maxCount"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("maxCount"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (int)objc_msgSend(v11, "intValue");

    }
    else
    {
      v12 = 5;
    }

  }
  else
  {
    v12 = 5;
  }
  v81 = v9;
  v82 = v8;
  if (objc_msgSend(v8, "count") && objc_msgSend(v8, "count") > v12)
  {
    v80 = v12;
    v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v87 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v86 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v85 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v84 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
    if (!v14)
      goto LABEL_35;
    v15 = v14;
    v16 = *(_QWORD *)v91;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v91 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * i);
        objc_msgSend(v18, "suggestionTokens", v80);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastObject");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "tokenKind");

        objc_msgSend(v18, "suggestionTokens");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "lastObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "internalType");

        objc_msgSend(v18, "currentToken");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23) = objc_msgSend(v25, "isMailingList");

        if (!(_DWORD)v23 || !a6)
        {
          objc_msgSend(v18, "currentToken");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "megadomeCompositeScore");
          if (v27 == 0.0)
          {

          }
          else
          {
            objc_msgSend(v18, "currentToken");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "megadomeCompositeScore");
            v30 = v29;

            if (v30 <= 0.000001)
              continue;
          }
          if ((a5 & 0x8000000000000000) == 0 && v21 == 16)
          {
            objc_msgSend(v18, "suggestionTokens");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "lastObject");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "updateScopeSelection:", a5);

          }
          v33 = v87;
          if (v21 != 16)
            v33 = v86;
          if (v24 != 6)
            v33 = v84;
          if (v24 == 4)
            v33 = v83;
          if (v24 == 3)
            v34 = v85;
          else
            v34 = v33;
          objc_msgSend(v34, "addObject:", v18);
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v90, v98, 16);
      if (!v15)
      {
LABEL_35:

        v35 = _os_feature_enabled_impl();
        v36 = objc_msgSend(v83, "count");
        v37 = v80;
        if (v36 >= v80)
          v38 = v80;
        else
          v38 = v36;
        if (v35)
        {
          objc_msgSend(v83, "subarrayWithRange:", 0, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = (void *)objc_msgSend(v39, "mutableCopy");

          v41 = objc_msgSend(v87, "count");
          if (v41 >= v80)
            v42 = v80;
          else
            v42 = v41;
          objc_msgSend(v87, "subarrayWithRange:", 0, v42, v80);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObjectsFromArray:", v43);

          objc_msgSend(v40, "sortUsingSelector:", sel_compareByRank_);
          v44 = v88;
        }
        else
        {
          objc_msgSend(v83, "sortUsingSelector:", sel_compareByRank_);
          objc_msgSend(v83, "subarrayWithRange:", 0, v38);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = v88;
          objc_msgSend(v88, "addObjectsFromArray:", v66);

          v67 = objc_msgSend(v87, "count");
          if (v67 >= v80)
            v68 = v80;
          else
            v68 = v67;
          objc_msgSend(v87, "sortUsingSelector:", sel_compareByRank_, v80);
          objc_msgSend(v87, "subarrayWithRange:", 0, v68);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v64 = v81;
        v65 = v82;
        objc_msgSend(v44, "addObjectsFromArray:", v40);

        v69 = objc_msgSend(v86, "count");
        if (v69 >= v37)
          v70 = v37;
        else
          v70 = v69;
        objc_msgSend(v86, "sortUsingSelector:", sel_compareByRank_);
        objc_msgSend(v86, "subarrayWithRange:", 0, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObjectsFromArray:", v71);

        v72 = objc_msgSend(v85, "count");
        if (v72 >= v37)
          v73 = v37;
        else
          v73 = v72;
        objc_msgSend(v85, "sortUsingSelector:", sel_compareByRank_);
        objc_msgSend(v85, "subarrayWithRange:", 0, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObjectsFromArray:", v74);

        v75 = objc_msgSend(v84, "count");
        if (v75 >= v37)
          v76 = v37;
        else
          v76 = v75;
        objc_msgSend(v84, "sortUsingSelector:", sel_compareByRank_);
        objc_msgSend(v84, "subarrayWithRange:", 0, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObjectsFromArray:", v77);

        logForCSLogCategoryQuery();
        v78 = (char *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v78, OS_LOG_TYPE_DEBUG))
          +[CSUserQuery(CSSuggestionBlending) trimSuggestions:options:peopleSelectedScope:isShortQuery:].cold.1(v44, v78);

        goto LABEL_80;
      }
    }
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v45 = v8;
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
  if (!v46)
    goto LABEL_62;
  v47 = v46;
  v48 = *(_QWORD *)v95;
  do
  {
    for (j = 0; j != v47; ++j)
    {
      if (*(_QWORD *)v95 != v48)
        objc_enumerationMutation(v45);
      v50 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * j);
      objc_msgSend(v50, "suggestionTokens");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "lastObject");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "internalType");

      objc_msgSend(v50, "suggestionTokens");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "lastObject");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v55, "tokenKind");

      objc_msgSend(v50, "currentToken");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v55) = objc_msgSend(v57, "isMailingList");

      if (!(_DWORD)v55 || !a6)
      {
        objc_msgSend(v50, "currentToken");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v58, "isMegadomeToken") & 1) != 0)
        {
          objc_msgSend(v50, "currentToken");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "megadomeCompositeScore");
          v61 = v60;

          if (v61 <= 0.000001)
            continue;
        }
        else
        {

        }
        if ((a5 & 0x8000000000000000) == 0 && v56 == 16 && (v53 == 6 || v53 == 3))
        {
          objc_msgSend(v50, "suggestionTokens");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "lastObject");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "updateScopeSelection:", a5);

        }
        objc_msgSend(v88, "addObject:", v50);
      }
    }
    v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
  }
  while (v47);
LABEL_62:

  v64 = v81;
  v65 = v82;
  v44 = v88;
  if (_os_feature_enabled_impl())
    objc_msgSend(v88, "sortUsingSelector:", sel_compareByRank_);
LABEL_80:

  return v44;
}

+ (id)dedupSuggestions:(id)a3 queryContextScopeIsToPerson:(BOOL)a4 seenContactInfoToSuggestion:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t k;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t m;
  void *v57;
  id v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
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
  __int128 v83;
  __int128 v84;
  __int128 v85;
  _BYTE v86[128];
  _BYTE v87[128];
  _BYTE v88[128];
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v6 = a4;
  v91 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v7;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
  if (v62)
  {
    v61 = *(_QWORD *)v71;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v71 != v61)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v9);
        objc_msgSend(v10, "currentToken");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "itemSummary");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "name");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v64 = v14;
        v65 = v9;
        if (objc_msgSend(v14, "length"))
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "mergeSuggestionAndUpdateLocalizedAttributedString:queryContextScopeIsToPerson:", v10, v6);
            v17 = v16;
          }

        }
        else
        {
          v16 = 0;
        }
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        objc_msgSend(v10, "currentToken");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "itemSummary");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "allEmailAddresses");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v67;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v67 != v23)
                objc_enumerationMutation(v20);
              if (!v16)
              {
                objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "lowercaseString");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v8, "objectForKey:", v25);
                v16 = (id)objc_claimAutoreleasedReturnValue();

                if (v16)
                {
                  objc_msgSend(v16, "mergeSuggestionAndUpdateLocalizedAttributedString:queryContextScopeIsToPerson:", v10, v6);
                  v26 = v16;
                }

              }
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v66, v86, 16);
          }
          while (v22);
        }

        if (!v16)
        {
          v16 = v10;
          objc_msgSend(v59, "addObject:", v16);
        }
        v27 = v8;
        v28 = v10;
        v29 = v16;
        objc_msgSend(v28, "currentToken");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "itemSummary");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "name");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "lowercaseString");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v33, "length"))
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, v33);
        v63 = v33;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        objc_msgSend(v28, "currentToken");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "itemSummary");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "allEmailAddresses");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        if (v37)
        {
          v38 = v37;
          v39 = *(_QWORD *)v83;
          do
          {
            for (j = 0; j != v38; ++j)
            {
              if (*(_QWORD *)v83 != v39)
                objc_enumerationMutation(v36);
              objc_msgSend(*(id *)(*((_QWORD *)&v82 + 1) + 8 * j), "lowercaseString");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, v41);

            }
            v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
          }
          while (v38);
        }

        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        objc_msgSend(v28, "currentToken");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "itemSummary");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "alternateNames");
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
        if (v45)
        {
          v46 = v45;
          v47 = *(_QWORD *)v79;
          do
          {
            for (k = 0; k != v46; ++k)
            {
              if (*(_QWORD *)v79 != v47)
                objc_enumerationMutation(v44);
              objc_msgSend(*(id *)(*((_QWORD *)&v78 + 1) + 8 * k), "lowercaseString");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, v49);

            }
            v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v78, v89, 16);
          }
          while (v46);
        }

        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        objc_msgSend(v28, "currentToken");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "itemSummary");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "phoneNumbers");
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
        if (v53)
        {
          v54 = v53;
          v55 = *(_QWORD *)v75;
          do
          {
            for (m = 0; m != v54; ++m)
            {
              if (*(_QWORD *)v75 != v55)
                objc_enumerationMutation(v52);
              objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * m), "lowercaseString");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "setObject:forKeyedSubscript:", v29, v57);

            }
            v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v74, v88, 16);
          }
          while (v54);
        }

        v9 = v65 + 1;
      }
      while (v65 + 1 != v62);
      v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v87, 16);
    }
    while (v62);
  }

  return v59;
}

+ (id)suggestionsByDetectingEmailIntentForPeopleSuggestions:(id)a3
{
  return (id)objc_msgSend(a3, "mutableCopy");
}

+ (id)dedupedDateSuggestions:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id obj;
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v9, "suggestionTokens");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "lastObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "tokenKind");

        v16 = 0;
        v17 = &v16;
        v18 = 0x2020000000;
        v19 = 0;
        if (v12 != 5
          || (v15[0] = MEMORY[0x1E0C809B0],
              v15[1] = 3221225472,
              v15[2] = __60__CSUserQuery_CSSuggestionBlending__dedupedDateSuggestions___block_invoke,
              v15[3] = &unk_1E2404F50,
              v15[4] = v9,
              v15[5] = &v16,
              objc_msgSend(v5, "enumerateObjectsUsingBlock:", v15),
              !*((_BYTE *)v17 + 24)))
        {
          objc_msgSend(v5, "addObject:", v9);
          objc_msgSend(v4, "addObject:", v9);
        }
        _Block_object_dispose(&v16, 8);
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  return v4;
}

void __60__CSUserQuery_CSSuggestionBlending__dedupedDateSuggestions___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;

  objc_msgSend(a2, "suggestionTokens");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "suggestionTokens");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqualToString:", v11);

  if (v12)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)dedupedSuggestions:(id)a3 options:(id)a4
{
  return +[CSUserQuery dedupedSuggestions:queryContextScopeIsToPerson:options:](CSUserQuery, "dedupedSuggestions:queryContextScopeIsToPerson:options:", a3, 0, a4);
}

+ (id)dedupedSuggestions:(id)a3 queryContextScopeIsToPerson:(BOOL)a4 options:(id)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  uint64_t v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char *v51;
  _BOOL4 v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id obj;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v53 = a4;
  v65 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v54 = v7;
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("filterByCount"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("filterByCount"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "BOOLValue") ^ 1;

    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 1;
  }
  v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v59 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v6;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v61;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v61 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v16);
        objc_msgSend(v17, "suggestionTokens");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "tokenKind");

        objc_msgSend(v17, "suggestionTokens");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "lastObject");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "internalType");

        if ((v11 & 1) != 0 || objc_msgSend(v17, "resultCount"))
        {
          v24 = v59;
          if (v23 == 3)
            goto LABEL_21;
          if (v23 != 4)
          {
            v25 = v57;
            if (v20 != 16)
              v25 = v12;
            if (v23 == 6)
              v24 = v25;
            else
              v24 = v12;
            goto LABEL_21;
          }
          objc_msgSend(v17, "currentToken");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "bundleType");

          if (v27 == 1)
          {
            objc_msgSend(v17, "currentToken");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "isMegadomeToken");

            if (v29)
              v24 = v56;
            else
              v24 = v55;
LABEL_21:
            objc_msgSend(v24, "addObject:", v17);
          }
        }
        ++v16;
      }
      while (v14 != v16);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      v14 = v30;
    }
    while (v30);
  }

  v31 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (_os_feature_enabled_impl())
  {
    +[CSUserQuery dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:](CSUserQuery, "dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:", v55, v53, v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    +[CSUserQuery dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:](CSUserQuery, "dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:", v57, v53, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    +[CSUserQuery dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:](CSUserQuery, "dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:", v56, v53, v31);
    v35 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "arrayByAddingObjectsFromArray:", v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "arrayByAddingObjectsFromArray:", v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "sortedArrayUsingSelector:", sel_compareByRank_);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compareByRank_);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)objc_msgSend(v39, "mutableCopy");

    +[CSUserQuery dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:](CSUserQuery, "dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:", v40, v53, v31);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "addObjectsFromArray:", v59);
    objc_msgSend(v32, "addObjectsFromArray:", v38);

    v56 = (id)v35;
    v42 = 0x1E23FE000;
  }
  else
  {
    objc_msgSend(v55, "sortedArrayUsingSelector:", sel_compareByRank_);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)objc_msgSend(v43, "mutableCopy");

    +[CSUserQuery dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:](CSUserQuery, "dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:", v44, v53, v31);
    v45 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "sortedArrayUsingSelector:", sel_compareByRank_);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = (void *)objc_msgSend(v46, "mutableCopy");

    v33 = (void *)v45;
    v42 = 0x1E23FE000uLL;

    +[CSUserQuery dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:](CSUserQuery, "dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:", v47, v53, v31);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "sortedArrayUsingSelector:", sel_compareByRank_);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_msgSend(v48, "mutableCopy");

    +[CSUserQuery dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:](CSUserQuery, "dedupSuggestions:queryContextScopeIsToPerson:seenContactInfoToSuggestion:", v49, v53, v31);
    v41 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v32, "addObjectsFromArray:", v59);
    objc_msgSend(v32, "addObjectsFromArray:", v33);
    objc_msgSend(v32, "addObjectsFromArray:", v34);
  }
  objc_msgSend(v32, "addObjectsFromArray:", v41);
  objc_msgSend(*(id *)(v42 + 3976), "suggestionsByDetectingEmailIntentForPeopleSuggestions:", v32);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  logForCSLogCategoryQuery();
  v51 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEBUG))
    +[CSUserQuery(CSSuggestionBlending) dedupedSuggestions:queryContextScopeIsToPerson:options:].cold.1(v50, v51);

  return v50;
}

+ (id)orderedSuggestionsForPhotos:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("maxCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("maxCount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (int)objc_msgSend(v9, "intValue");

    }
    else
    {
      v10 = 5;
    }

  }
  else
  {
    v10 = 5;
  }
  +[CSUserQuery orderedSuggestions:options:](CSUserQuery, "orderedSuggestions:options:", v5, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  if (v10 >= v12)
    v13 = v12;
  else
    v13 = v10;
  objc_msgSend(v11, "subarrayWithRange:", 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)collectUnigrams:(id)a3 locale:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void *v18;
  id v19;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v6, "localeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __60__CSUserQuery_CSSuggestionBlending__collectUnigrams_locale___block_invoke;
    v18 = &unk_1E2404F78;
    v9 = v7;
    v19 = v9;
    +[CSAttributeEvaluator enumerateTokensForString:locale:options:withHandler:](CSAttributeEvaluator, "enumerateTokensForString:locale:options:withHandler:", v5, v8, 0, &v15);

    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v9, "count") - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", CFSTR("%@*"), v11, v15, v16, v17, v18);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:atIndexedSubscript:", v12, objc_msgSend(v9, "count") - 1);

      v13 = (void *)objc_msgSend(v9, "copy");
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __60__CSUserQuery_CSSuggestionBlending__collectUnigrams_locale___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

+ (id)emailSpecialChars
{
  if (emailSpecialChars_onceToken != -1)
    dispatch_once(&emailSpecialChars_onceToken, &__block_literal_global_27);
  return (id)emailSpecialChars_specialChars;
}

void __54__CSUserQuery_CSSuggestionBlending__emailSpecialChars__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E242F9B8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)emailSpecialChars_specialChars;
  emailSpecialChars_specialChars = v0;

}

+ (id)computeEmailAddressTopicalityScore:(id)a3 inputEmailAddress:(id)a4 queryUnigrams:(id)a5 locale:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  int v34;
  double v35;
  unint64_t v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  id v44;
  int v45;
  BOOL v46;
  char v47;
  double v48;
  void *v49;
  int v50;
  double v51;
  char v52;
  char v53;
  id v54;
  unint64_t v55;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (!objc_msgSend(v9, "length") || !objc_msgSend(v10, "length"))
  {
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[CSUserQuery(CSSuggestionBlending) computeEmailAddressTopicalityScore:inputEmailAddress:queryUnigrams:locale:].cold.1(v14, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_8;
  }
  v13 = objc_msgSend(v10, "rangeOfString:options:", CFSTR("@"), 4);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    logForCSLogCategoryDefault();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[CSUserQuery(CSSuggestionBlending) computeEmailAddressTopicalityScore:inputEmailAddress:queryUnigrams:locale:].cold.2(v14, v15, v16, v17, v18, v19, v20, v21);
LABEL_8:

    v29 = 0;
    goto LABEL_9;
  }
  v31 = v13;
  v32 = objc_msgSend(v10, "length") - 1;
  while (1)
  {
    v33 = 0;
    if (!v32 || v32 < v31)
      break;
    v34 = objc_msgSend(v10, "characterAtIndex:", v32--);
    if (v34 == 46)
    {
      v33 = v32 + 1;
      break;
    }
  }
  v35 = 0.0;
  if (objc_msgSend(v11, "count"))
  {
    v53 = 0;
    v52 = 0;
    v36 = 0;
    v54 = v12;
    v55 = 0;
    do
    {
      +[CSUserQuery emailSpecialChars](CSUserQuery, "emailSpecialChars");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v36);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(v37, "containsObject:", v38);

      if ((v39 & 1) == 0)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v36);
        v40 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v41 = objc_msgSend(v40, "UTF8String");
        objc_msgSend(v12, "localeIdentifier");
        v42 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        objc_msgSend(v42, "UTF8String");
        if (v41)
        {
          v43 = icu_search_context_create();

          if (v43)
          {
            if (v55 >= objc_msgSend(v10, "length"))
            {
              icu_ctx_release();
              v12 = v54;
            }
            else
            {
              objc_msgSend(v10, "substringFromIndex:", v55);
              v44 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              objc_msgSend(v44, "UTF8String");
              v45 = icu_search_match();

              if (v45)
              {
                if (v55 > v31)
                {
                  if (v33)
                    v46 = v55 > v33;
                  else
                    v46 = 0;
                  v47 = v46;
                  v52 = v47;
                  v53 = 1;
                }
                ++v55;
              }
              v12 = v54;
              icu_ctx_release();
            }
          }
        }
        else
        {

        }
      }
      ++v36;
    }
    while (v36 < objc_msgSend(v11, "count"));
    v35 = 0.0;
    if ((v53 & 1) != 0)
    {
      v48 = fmin((double)0 / (double)(objc_msgSend(v10, "length") + ~v31), 1.0);
      if ((v52 & 1) != 0 && (unint64_t)objc_msgSend(v9, "length") <= 3)
      {
        objc_msgSend(v10, "substringFromIndex:", v33 + 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "isEqualToString:", CFSTR(".com"));

        if (v50)
          v51 = 0.005;
        else
          v51 = 0.05;
      }
      else
      {
        v51 = 0.8;
      }
      v35 = v48 * v51;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v35 + 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v29;
}

+ (double)computeTopicalityScoreForName:(id)a3 inputName:(id)a4 numTokensInName:(unint64_t)a5 isContactsSuggestion:(BOOL)a6 queryUnigrams:(id)a7 isFirstName:(BOOL)a8 locale:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  unint64_t v23;
  int v24;
  id v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  _BOOL4 v29;
  void *v30;
  unint64_t v31;
  unint64_t v32;
  BOOL v34;
  char v35;
  id v36;
  _BOOL4 v37;

  v9 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a9;
  v18 = 0.0;
  if (!objc_msgSend(v14, "length"))
    goto LABEL_33;
  v19 = objc_msgSend(v15, "length");
  if (!a5 || !v19)
    goto LABEL_33;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@*"), v14);
  v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v20 = objc_msgSend(v36, "UTF8String");
  objc_msgSend(v17, "localeIdentifier");
  v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v21, "UTF8String");
  if (v20)
  {
    v22 = icu_search_context_create();

    if (v22)
    {
      objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
      v35 = icu_search_match();
      icu_ctx_release();
    }
    else
    {
      v35 = 0;
    }
  }
  else
  {

    v35 = 0;
  }
  v37 = v9;
  v34 = a6;
  if (objc_msgSend(v16, "count"))
  {
    v23 = 0;
    v24 = 0;
    do
    {
      objc_msgSend(v16, "objectAtIndexedSubscript:", v23);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v26 = objc_msgSend(v25, "UTF8String");
      objc_msgSend(v17, "localeIdentifier");
      v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v27, "UTF8String");
      if (v26)
      {
        v28 = icu_search_context_create();

        if (v28)
        {
          objc_msgSend(objc_retainAutorelease(v15), "UTF8String");
          v24 += icu_search_match();
          icu_ctx_release();
        }
      }
      else
      {

      }
      ++v23;
    }
    while (v23 < objc_msgSend(v16, "count"));
  }
  else
  {
    v24 = 0;
  }
  if ((v35 & 1) != 0)
  {
    v18 = 1.0;
    if (objc_msgSend(v16, "count") == a5)
    {
      v29 = v37;
      v30 = v36;
      if (v34 || (unint64_t)objc_msgSend(v14, "length") >= 4)
      {
        if (objc_msgSend(v15, "length"))
          v18 = 2.0;
        else
          v18 = 2.1;
      }
      goto LABEL_30;
    }
  }
  else
  {
    v31 = objc_msgSend(v16, "count");
    if (v31 <= a5)
      v32 = a5;
    else
      v32 = v31;
    v18 = (double)v24 / (double)v32;
  }
  v29 = v37;
  v30 = v36;
LABEL_30:
  if (v29)
    v18 = v18 * 1.05;

LABEL_33:
  return v18;
}

+ (double)computeScoreForNameUnigrams:(id)a3 queryUnigrams:(id)a4 queryString:(id)a5 locale:(id)a6 isContactsSuggestion:(BOOL)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  uint64_t v25;
  double v26;

  v7 = a7;
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (!objc_msgSend(v11, "count"))
  {
    v19 = 0.0;
    goto LABEL_17;
  }
  objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion__onceToken != -1)
  {
    dispatch_once(&computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion__onceToken, &__block_literal_global_46);
    if (v14)
      goto LABEL_4;
LABEL_7:
    v18 = 1;
    goto LABEL_8;
  }
  if (!v14)
    goto LABEL_7;
LABEL_4:
  v16 = (void *)computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion__cjkLocales;
  objc_msgSend(v14, "languageCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "containsObject:", v17) ^ 1;

LABEL_8:
  +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v13, v15, 1, v7, v12, 1, v14);
  v19 = v20;
  if (objc_msgSend(v11, "count") != 1)
  {
    objc_msgSend(v11, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR(" "));
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v13, v22, objc_msgSend(v11, "count") - 1, v7, v12, 0, v14);
    if (v19 < v23)
      v19 = v23;
    if ((v18 & 1) == 0)
    {
      objc_msgSend(v11, "subarrayWithRange:", 1, objc_msgSend(v11, "count") - 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", &stru_1E2406B38);
      v25 = objc_claimAutoreleasedReturnValue();

      +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v13, v25, 1, v7, v12, 0, v14);
      if (v19 < v26)
        v19 = v26;
      v22 = (void *)v25;
    }

  }
LABEL_17:

  return v19;
}

void __119__CSUserQuery_CSSuggestionBlending__computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E242F9D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion__cjkLocales;
  computeScoreForNameUnigrams_queryUnigrams_queryString_locale_isContactsSuggestion__cjkLocales = v0;

}

+ (id)computeRankingScoreForSuggestion:(id)a3 queryString:(id)a4 locale:(id)a5
{
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  unsigned int v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  id v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t j;
  void *v99;
  void *v100;
  NSObject *v101;
  const __CFString *v102;
  const __CFString *v103;
  double v104;
  const __CFString *v105;
  const __CFString *v106;
  const __CFString *v107;
  double v108;
  const __CFString *v109;
  double v110;
  double v111;
  double v112;
  int v113;
  const __CFString *v114;
  void *v116;
  void *v117;
  double v118;
  const __CFString *v119;
  const __CFString *v120;
  __CFString *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  unsigned int v130;
  _BOOL4 v131;
  void *v132;
  id v133;
  void *v134;
  void *v135;
  void *v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  uint8_t buf[4];
  id v146;
  __int16 v147;
  void *v148;
  __int16 v149;
  double v150;
  __int16 v151;
  __CFString *v152;
  __int16 v153;
  double v154;
  __int16 v155;
  double v156;
  __int16 v157;
  double v158;
  __int16 v159;
  const __CFString *v160;
  __int16 v161;
  const __CFString *v162;
  __int16 v163;
  double v164;
  __int16 v165;
  const __CFString *v166;
  __int16 v167;
  const __CFString *v168;
  __int16 v169;
  const __CFString *v170;
  __int16 v171;
  const __CFString *v172;
  __int16 v173;
  double v174;
  __int16 v175;
  const __CFString *v176;
  _BYTE v177[128];
  _BYTE v178[128];
  uint64_t v179;

  v179 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "currentToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0x1E23FE000uLL;
  v136 = v8;
  +[CSUserQuery collectUnigrams:locale:](CSUserQuery, "collectUnigrams:locale:", v7, v8);
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v135, "count"))
  {
    v26 = 0;
    goto LABEL_115;
  }
  v143 = 0u;
  v144 = 0u;
  v141 = 0u;
  v142 = 0u;
  v134 = v9;
  objc_msgSend(v9, "itemSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allEmailAddresses");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v141, v178, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v142;
    v17 = 0.0;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v142 != v16)
          objc_enumerationMutation(v12);
        v19 = *(void **)(*((_QWORD *)&v141 + 1) + 8 * i);
        objc_msgSend(*(id *)(v10 + 3976), "computeEmailAddressTopicalityScore:inputEmailAddress:queryUnigrams:locale:", v7, v19, v135, v136);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20;
        if (v20)
        {
          objc_msgSend(v20, "doubleValue");
          if (v17 < v22)
            v17 = v22;
          if ((v15 & 1) != 0)
          {
            v23 = 0;
          }
          else
          {
            objc_msgSend(v134, "itemSummary");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "name");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v19, "isEqualToString:", v25);

            v10 = 0x1E23FE000;
          }
          v15 |= v23;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v141, v178, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
    v17 = 0.0;
  }

  v27 = v134;
  if (objc_msgSend(v134, "suggestionTokenDataSources")
    && objc_msgSend(v134, "suggestionTokenDataSources"))
  {
    v28 = (objc_msgSend(v134, "suggestionTokenDataSources") >> 1) & 1;
    v131 = objc_msgSend(v134, "suggestionTokenDataSources") & 1;
    v29 = (objc_msgSend(v134, "suggestionTokenDataSources") >> 2) & 1;
  }
  else
  {
    if (objc_msgSend(v134, "internalType") == 4 && objc_msgSend(v134, "bundleType") == 1)
      v28 = objc_msgSend(v134, "isMegadomeToken") ^ 1;
    else
      v28 = 0;
    v131 = objc_msgSend(v134, "internalType") == 6 && objc_msgSend(v134, "tokenKind") == 16;
    v29 = objc_msgSend(v134, "isMegadomeToken");
  }
  v30 = 0.0;
  v130 = v28;
  if ((v15 & 1) == 0)
  {
    v31 = *(void **)(v10 + 3976);
    objc_msgSend(v134, "itemSummary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "name");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "collectUnigrams:locale:", v33, v136);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = *(void **)(v10 + 3976);
    objc_msgSend(v134, "itemSummary");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "name");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v7, v37, objc_msgSend(v34, "count"), v28, v135, 0, v136);
    v30 = v38;

    objc_msgSend(v134, "itemSummary");
    v39 = objc_claimAutoreleasedReturnValue();
    if (!v39)
      goto LABEL_36;
    v40 = (void *)v39;
    objc_msgSend(v134, "itemSummary");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "nameComponents");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v42)
    {
LABEL_36:
      v50 = *(void **)(v10 + 3976);
      objc_msgSend(v134, "itemSummary");
      v28 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v28, "name");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "collectUnigrams:locale:", v51, v136);
      v52 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v28) = v130;
      objc_msgSend(*(id *)(v10 + 3976), "computeScoreForNameUnigrams:queryUnigrams:queryString:locale:isContactsSuggestion:", v52, v135, v7, v136, v130);
      if (v30 < v53)
        v30 = v53;
      goto LABEL_48;
    }
    objc_msgSend(v134, "itemSummary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "nameComponents");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "givenName");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "length");

    if (!v46)
    {
LABEL_49:

      goto LABEL_50;
    }
    objc_msgSend(v134, "itemSummary");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "nameComponents");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "middleName");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = v34;
    if (objc_msgSend(v49, "length"))
    {

    }
    else
    {
      objc_msgSend(v134, "itemSummary");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "nameComponents");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "familyName");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = objc_msgSend(v56, "length");

      v27 = v134;
      if (!v57)
      {
        objc_msgSend(v134, "itemSummary");
        v28 = objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)v28, "nameComponents");
        v116 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v116, "givenName");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        +[CSUserQuery collectUnigrams:locale:](CSUserQuery, "collectUnigrams:locale:", v117, v136);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

        LODWORD(v28) = v130;
        +[CSUserQuery computeScoreForNameUnigrams:queryUnigrams:queryString:locale:isContactsSuggestion:](CSUserQuery, "computeScoreForNameUnigrams:queryUnigrams:queryString:locale:isContactsSuggestion:", v52, v135, v7, v136, v130);
        if (v30 < v118)
          v30 = v118;
        goto LABEL_47;
      }
    }
    objc_msgSend(v27, "itemSummary");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "nameComponents");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "givenName");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUserQuery collectUnigrams:locale:](CSUserQuery, "collectUnigrams:locale:", v60, v136);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "itemSummary");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "nameComponents");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "middleName");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUserQuery collectUnigrams:locale:](CSUserQuery, "collectUnigrams:locale:", v63, v136);
    v132 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "itemSummary");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "nameComponents");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "familyName");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUserQuery collectUnigrams:locale:](CSUserQuery, "collectUnigrams:locale:", v66, v136);
    v126 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "itemSummary");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "nameComponents");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "givenName");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v7, v69, objc_msgSend(v52, "count"), v130, v135, 1, v136);
    v71 = v70;

    if (v30 >= v71)
      v71 = v30;
    objc_msgSend(v27, "itemSummary");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "nameComponents");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "middleName");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v7, v74, objc_msgSend(v132, "count"), v130, v135, 0, v136);
    v76 = v75;

    if (v71 < v76)
      v71 = v76;
    objc_msgSend(v134, "itemSummary");
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)v28, "nameComponents");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "familyName");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    +[CSUserQuery computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:](CSUserQuery, "computeTopicalityScoreForName:inputName:numTokensInName:isContactsSuggestion:queryUnigrams:isFirstName:locale:", v7, v78, objc_msgSend(v126, "count"), v130, v135, 0, v136);
    v30 = v79;

    LODWORD(v28) = v130;
    if (v71 >= v30)
      v30 = v71;

LABEL_47:
    v34 = v128;
LABEL_48:

    v27 = v134;
    goto LABEL_49;
  }
LABEL_50:
  v129 = objc_msgSend(v27, "selectedScope");
  if (v129)
  {
    v80 = v30 * 0.35;
    v81 = 0.15;
  }
  else
  {
    v80 = v30 * 0.7;
    v81 = 0.3;
  }
  v82 = v17 * v81;
  if (v80 >= v82)
    v83 = v80;
  else
    v83 = v82;
  v84 = v83 * 4.0;
  if (v131)
    v84 = v83 * 4.0 + 0.15;
  if ((_DWORD)v28)
    v85 = v84 + 0.5;
  else
    v85 = v84;
  if (v29)
  {
    objc_msgSend(v27, "megadomeCompositeScore");
    if (v86 > 0.000001)
    {
      objc_msgSend(v27, "megadomeCompositeScore");
      v85 = v85 + v87 * 0.1;
      if (objc_msgSend(v27, "isMailingList"))
        v85 = v85 * 0.01;
    }
  }
  if (objc_msgSend(v27, "hasRecentActivity"))
    v85 = v85 + 0.5;
  if (objc_msgSend(v27, "hasUsedDate"))
    v88 = v85 + 0.5;
  else
    v88 = v85;
  objc_msgSend(v27, "age");
  v133 = v7;
  if (v89 > 0.1)
  {
    objc_msgSend(v27, "age");
    if (v90 < 15552000.0)
    {
      objc_msgSend(v27, "age");
      v88 = v88 + v91 * 0.5 / -15552000.0 + 0.5;
    }
  }
  v92 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v140 = 0u;
  objc_msgSend(v27, "itemSummary");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v93, "allEmailAddresses");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v137, v177, 16);
  if (v95)
  {
    v96 = v95;
    v97 = *(_QWORD *)v138;
    do
    {
      for (j = 0; j != v96; ++j)
      {
        if (*(_QWORD *)v138 != v97)
          objc_enumerationMutation(v94);
        v99 = *(void **)(*((_QWORD *)&v137 + 1) + 8 * j);
        if ((unint64_t)objc_msgSend(v99, "length") > 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%c%lu%c"), objc_msgSend(v99, "characterAtIndex:", 0), objc_msgSend(v99, "length") - 2, objc_msgSend(v99, "characterAtIndex:", objc_msgSend(v99, "length") - 1));
          v100 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v92, "addObject:", v100);

        }
        else
        {
          objc_msgSend(v92, "addObject:", v99);
        }
      }
      v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v137, v177, 16);
    }
    while (v96);
  }

  logForCSLogCategoryDefault();
  v101 = objc_claimAutoreleasedReturnValue();
  v7 = v133;
  v9 = v134;
  if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v134, "itemSummary");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v127, "name");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "itemSummary");
    v124 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v124, "allEmailAddresses");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v122 = objc_msgSend(v123, "count");
    if (v122)
    {
      objc_msgSend(v92, "componentsJoinedByString:", CFSTR(", "));
      v121 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v121 = CFSTR("NIL");
    }
    if (objc_msgSend(v134, "hasRecentActivity"))
      v102 = CFSTR("YES");
    else
      v102 = CFSTR("NO");
    v120 = v102;
    if (objc_msgSend(v134, "hasUsedDate"))
      v103 = CFSTR("YES");
    else
      v103 = CFSTR("NO");
    v119 = v103;
    objc_msgSend(v134, "age");
    if (v130)
      v105 = CFSTR("YES");
    else
      v105 = CFSTR("NO");
    if (v131)
      v106 = CFSTR("YES");
    else
      v106 = CFSTR("NO");
    if (v129)
      v107 = CFSTR("NO");
    else
      v107 = CFSTR("YES");
    v108 = v104 / 86400.0;
    if (objc_msgSend(v134, "isMegadomeToken"))
      v109 = CFSTR("YES");
    else
      v109 = CFSTR("NO");
    objc_msgSend(v134, "megadomeCompositeScore");
    if (v110 == 0.0)
    {
      v112 = -1.0;
    }
    else
    {
      objc_msgSend(v134, "megadomeCompositeScore");
      v112 = v111;
    }
    v113 = objc_msgSend(v134, "isMailingList");
    *(_DWORD *)buf = 138416130;
    if (v113)
      v114 = CFSTR("YES");
    else
      v114 = CFSTR("NO");
    v146 = v133;
    v147 = 2112;
    v148 = v125;
    v149 = 2048;
    v150 = v30;
    v151 = 2112;
    v152 = v121;
    v153 = 2048;
    v154 = v17;
    v155 = 2048;
    v156 = v88;
    v157 = 2048;
    v158 = v83;
    v159 = 2112;
    v160 = v120;
    v161 = 2112;
    v162 = v119;
    v163 = 2048;
    v164 = v108;
    v165 = 2112;
    v166 = v105;
    v167 = 2112;
    v168 = v106;
    v169 = 2112;
    v170 = v107;
    v171 = 2112;
    v172 = v109;
    v173 = 2048;
    v174 = v112;
    v175 = 2112;
    v176 = v114;
    _os_log_impl(&dword_18C42F000, v101, OS_LOG_TYPE_INFO, "[Pommes_Suggestions]: query: %@, name: %@ (score: %f), email: %@ (score: %f), composite_score: %f, text_score: %f, recent_activity: %@, has_used_date: %@, age: %f, is_contact: %@, is_pommes: %@, is_author: %@, is_megadome: %@, megadome_score: %f, mailing_list: %@", buf, 0xA2u);
    if (v122)

    v7 = v133;
    v9 = v134;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v88);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_115:
  return v26;
}

+ (void)computeRankingScoreForSuggestions:(id)a3 queryString:(id)a4 locale:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v20 = v8;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v16, "suggestionTokens");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastObject");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v18, "internalType") == 4
            || objc_msgSend(v18, "localCompletionType") == 10
            || objc_msgSend(v18, "tokenKind") == 16)
          {
            objc_msgSend(a1, "computeRankingScoreForSuggestion:queryString:locale:", v16, v9, v10);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v18, "setScore:", v19);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    v8 = v20;
  }

}

+ (id)orderedSuggestions:(id)a3 options:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __CFString *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  __CFString *v33;
  __CFString *v34;
  id v35;
  uint64_t v36;
  unint64_t v37;
  void *v38;
  unint64_t v39;
  double v40;
  unint64_t v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t k;
  void *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t m;
  void *v71;
  char *v72;
  uint64_t v74;
  void *v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  __CFString *v81;
  id v82;
  id v83;
  id obj;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  _BYTE v102[128];
  _BYTE v103[128];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("maxCount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("maxCount"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v9, "integerValue");

    }
    else
    {
      v74 = 5;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("filterByCount"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("filterByCount"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v13, "BOOLValue") ^ 1;

    }
    else
    {
      v11 = 1;
    }

    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("personWeight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("personWeight"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v10 = v16;

    }
    else
    {
      v10 = 0.0;
    }

  }
  else
  {
    v10 = 0.0;
    v11 = 1;
    v74 = 5;
  }
  v75 = v7;
  v79 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v78 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v76 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v83 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v82 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v80 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  obj = v5;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
  if (!v17)
  {
    v81 = 0;
    goto LABEL_47;
  }
  v18 = v17;
  v81 = 0;
  v19 = *(_QWORD *)v98;
  do
  {
    for (i = 0; i != v18; ++i)
    {
      if (*(_QWORD *)v98 != v19)
        objc_enumerationMutation(obj);
      v21 = *(__CFString **)(*((_QWORD *)&v97 + 1) + 8 * i);
      if ((v11 & 1) != 0 || objc_msgSend(*(id *)(*((_QWORD *)&v97 + 1) + 8 * i), "resultCount"))
      {
        -[__CFString localizedAttributedSuggestion](v21, "localizedAttributedSuggestion");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "string");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();

        if (v23)
          v24 = v23;
        else
          v24 = &stru_1E2406B38;
        v25 = v24;
        v26 = -[__CFString suggestionKind](v21, "suggestionKind");
        if (v26 == 1)
        {
          objc_msgSend(v83, "addObject:", v21);
          goto LABEL_42;
        }
        if (v26 == 2)
        {
          -[__CFString suggestionTokens](v21, "suggestionTokens");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "lastObject");
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          v29 = objc_msgSend(v28, "tokenKind");
          if (v29 == 46)
          {
            v34 = v21;

            v81 = v34;
            goto LABEL_41;
          }
          v30 = v82;
          if (v29 == 16)
          {
            v30 = v80;
            if ((objc_msgSend(v80, "containsObject:", v25) & 1) != 0)
              goto LABEL_41;
            v31 = v77;
LABEL_34:
            objc_msgSend(v31, "addObject:", v21);
            v32 = v30;
            v33 = v25;
          }
          else
          {
            if (!v29)
            {
              if (objc_msgSend(v28, "internalType") == 3 || (objc_msgSend(v82, "containsObject:", v25) & 1) == 0)
              {
                v31 = v79;
                goto LABEL_34;
              }
LABEL_41:

              goto LABEL_42;
            }
            if (objc_msgSend(v28, "internalType") == 3)
              v32 = v78;
            else
              v32 = v76;
            v33 = v21;
          }
          objc_msgSend(v32, "addObject:", v33);
          goto LABEL_41;
        }
LABEL_42:

        continue;
      }
    }
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v97, v104, 16);
  }
  while (v18);
LABEL_47:

  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v36 = v74 - objc_msgSend(v78, "count");
  if (v36 < 0)
  {
    v49 = 0;
    v38 = v79;
  }
  else
  {
    v37 = objc_msgSend(v77, "count");
    v38 = v79;
    v39 = objc_msgSend(v79, "count");
    v40 = (1.0 - v10) * (double)(unint64_t)v36;
    v41 = (unint64_t)v40;
    v42 = v36 - (unint64_t)v40;
    v43 = v36 - v39;
    if (v36 - v39 >= v37)
      v43 = v37;
    if (v39 < v41)
    {
      v44 = v39;
    }
    else
    {
      v43 = v36 - (unint64_t)v40;
      v44 = (unint64_t)v40;
    }
    v45 = v36 - v37;
    if (v36 - v37 >= v39)
      v45 = v39;
    if (v39 >= v41)
      v46 = v45;
    else
      v46 = v39;
    if (v42 > v37)
      v47 = v37;
    else
      v47 = v43;
    if (v42 > v37)
      v48 = v46;
    else
      v48 = v44;
    v49 = 0;
    if (v47)
    {
      while (v49 < objc_msgSend(v77, "count"))
      {
        objc_msgSend(v77, "objectAtIndexedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "setRank:", v49);
        objc_msgSend(v35, "addObject:", v50);

        if (v47 == ++v49)
        {
          v49 = v47;
          break;
        }
      }
    }
    if (v81)
    {
      if (objc_msgSend(v77, "count"))
        v51 = v35;
      else
        v51 = v78;
      objc_msgSend(v51, "addObject:", v81);
    }
    if (v48)
    {
      v52 = 0;
      while (v52 < objc_msgSend(v79, "count"))
      {
        objc_msgSend(v79, "objectAtIndexedSubscript:", v52);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setRank:", v49 + v52);
        objc_msgSend(v35, "addObject:", v53);

        if (v48 == ++v52)
        {
          v49 += v52;
          goto LABEL_80;
        }
      }
      v49 += v52;
    }
  }
LABEL_80:
  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v54 = v78;
  v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
  if (v55)
  {
    v56 = v55;
    v57 = *(_QWORD *)v94;
    do
    {
      for (j = 0; j != v56; ++j)
      {
        if (*(_QWORD *)v94 != v57)
          objc_enumerationMutation(v54);
        v59 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * j);
        objc_msgSend(v59, "setRank:", v49 + j);
        objc_msgSend(v35, "addObject:", v59);
      }
      v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v93, v103, 16);
      v49 += j;
    }
    while (v56);
  }

  v91 = 0u;
  v92 = 0u;
  v89 = 0u;
  v90 = 0u;
  v60 = v76;
  v61 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
  if (v61)
  {
    v62 = v61;
    v63 = *(_QWORD *)v90;
    do
    {
      for (k = 0; k != v62; ++k)
      {
        if (*(_QWORD *)v90 != v63)
          objc_enumerationMutation(v60);
        v65 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * k);
        objc_msgSend(v65, "setRank:", v49 + k);
        objc_msgSend(v35, "addObject:", v65);
      }
      v62 = objc_msgSend(v60, "countByEnumeratingWithState:objects:count:", &v89, v102, 16);
      v49 += k;
    }
    while (v62);
  }

  v87 = 0u;
  v88 = 0u;
  v85 = 0u;
  v86 = 0u;
  v66 = v83;
  v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
  if (v67)
  {
    v68 = v67;
    v69 = *(_QWORD *)v86;
    do
    {
      for (m = 0; m != v68; ++m)
      {
        if (*(_QWORD *)v86 != v69)
          objc_enumerationMutation(v66);
        v71 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * m);
        objc_msgSend(v71, "setRank:", v49 + m);
        objc_msgSend(v35, "addObject:", v71);
      }
      v68 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", &v85, v101, 16);
      v49 += m;
    }
    while (v68);
  }

  logForCSLogCategoryQuery();
  v72 = (char *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled((os_log_t)v72, OS_LOG_TYPE_DEBUG))
    +[CSUserQuery(CSSuggestionBlending) orderedSuggestions:options:].cold.1(v35, v72);

  return v35;
}

+ (id)dedupedNextTokenSuggestions:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v6, "suggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "suggestionTokens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = 0;
    do
    {
      objc_msgSend(v6, "suggestion");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "suggestionTokens");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "displayString");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "addObject:", v16);
      ++v12;
      objc_msgSend(v6, "suggestion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "suggestionTokens");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

    }
    while (v12 < v19);
  }
  v30 = v6;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v20 = v5;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v32 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        objc_msgSend(v25, "suggestionTokens");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "displayString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v8, "containsObject:", v28) & 1) == 0)
          objc_msgSend(v7, "addObject:", v25);

      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v22);
  }

  return v7;
}

+ (void)filteredTemplateSuggestions:(id)a3 nlpSuggestions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v27 = v6;
    v28 = v5;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v34;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v12);
        objc_msgSend(v13, "currentToken", v27);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "tokenKind") == 2)
        {
          objc_msgSend(v13, "currentToken");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "nlpCompletionType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", CFSTR("kQPTokenAttachmentAny"));

          if ((v17 & 1) != 0)
          {
            v18 = v13;
            objc_msgSend(v8, "removeObject:", v18);

            if (!v18)
              goto LABEL_24;
            v31 = 0u;
            v32 = 0u;
            v29 = 0u;
            v30 = 0u;
            v5 = v28;
            v19 = v28;
            v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v20)
            {
              v21 = v20;
              v22 = *(_QWORD *)v30;
              while (2)
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v30 != v22)
                    objc_enumerationMutation(v19);
                  v24 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
                  objc_msgSend(v24, "currentToken");
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  v26 = objc_msgSend(v25, "internalType");

                  if (v26 == 9)
                  {
                    objc_msgSend(v19, "removeObject:", v24);
                    goto LABEL_26;
                  }
                }
                v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
                if (v21)
                  continue;
                break;
              }
            }
LABEL_26:

            if (objc_msgSend(v18, "numberOfMessageWithAttachmentTokens") <= 1)
              objc_msgSend(v19, "addObject:", v18);
            goto LABEL_28;
          }
        }
        else
        {

        }
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

    v18 = 0;
LABEL_24:
    v5 = v28;
LABEL_28:
    v7 = v27;

  }
}

void __28__CSUserQuery_mailResources__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "Failed to soft-link SpotlightResources", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __28__CSUserQuery_mailResources__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "Failed to soft-link resourcesForClient", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __28__CSUserQuery_mailResources__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "Failed to soft-link loadAllParametersForClient", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __28__CSUserQuery_mailResources__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_3(&dword_18C42F000, v0, v1, "Failed to soft-link sharedResourcesManager", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

void __28__CSUserQuery_mailResources__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_18C42F000, v0, v1, "CSUserQuery: loading trial parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

+ (void)queryContextWithUserQueryString:(void *)a1 searchString:(const char *)a2 clientContext:.cold.1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v2, v3, "qid=%ld - CSUserQuery: updating current suggestion with userQueryString", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

+ (void)parseResultWithSearchString:parseOptions:queryContext:isZKW:.cold.1()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(v0, v1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v2, v3, "qid=%ld - CSUserQuery: annotated input \"<%@>\", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

+ (void)parseResultWithSearchString:(void *)a1 parseOptions:(char *)a2 queryContext:isZKW:.cold.2(void *a1, char *a2)
{
  uint8_t v3[24];

  OUTLINED_FUNCTION_7(a1, a2);
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_18C42F000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "qid=%ld - CSUserQuery: semanticQuery failed to generate, using \"(false)\", v3, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

+ (void)parseResultWithSearchString:parseOptions:queryContext:isZKW:.cold.3()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(v0, v1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v2, v3, "qid=%ld - CSUserQuery: instantAnswersQuery <%@>", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

+ (void)parseResultWithSearchString:parseOptions:queryContext:isZKW:.cold.4()
{
  void *v0;
  const char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(v0, v1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v2, v3, "qid=%ld - CSUserQuery: nlQuery <%@>", v4, v5, v6, v7, v8);
  OUTLINED_FUNCTION_2_0();
}

+ (void)parseResultWithSearchString:(void *)a1 parseOptions:(const char *)a2 queryContext:isZKW:.cold.5(void *a1, const char *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_7(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v3, v4, "qid=%ld - CSUserQuery: suggestion engagement %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

- (void)queryStringWithQueryContext:searchString:options:.cold.1()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11();
  objc_msgSend(v0, "queryID");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v1, v2, "[debug][personal answers][query][qid=%ld] CSUserQuery: enabling personal answers for searchString = %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "queryID");
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "instantAnswersQueries");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v2, v3, "[debug][instant answers][query][qid=%ld] final instantAnswersQuery = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)queryStringWithQueryContext:searchString:options:.cold.3()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11();
  objc_msgSend(v0, "queryID");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v1, v2, "[debug][instant answers][query][qid=%ld] mailboxes = %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "queryID");
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "instantAnswersQueries");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v2, v3, "[debug][instant answers][query][qid=%ld] instantAnswersQuery = %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_6();
}

- (void)queryStringWithQueryContext:searchString:options:.cold.5()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_11();
  objc_msgSend(v0, "queryID");
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v1, v2, "[debug][instant answers][query][qid=%ld] CSUserQuery: enabling instant answers for searchString = %@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.6(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "queryID");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v1, v2, "qid=%ld - CSUserQuery: enabling kg people suggestions", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.7(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "queryID");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v1, v2, "qid=%ld - CSUserQuery: enabling completions", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.8(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "queryID");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v1, v2, "qid=%ld - CSUserQuery: enabling pommes suggestions", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)queryStringWithQueryContext:(void *)a1 searchString:options:.cold.9(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "queryID");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v1, v2, "qid=%ld - CSUserQuery: enabling pommes ranking", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithUserQueryString:queryContext:.cold.1()
{
  void *v0;
  const char *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(v0, v1);
  objc_msgSend((id)OUTLINED_FUNCTION_12(), "suggestion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_18C42F000, v3, v4, "qid=%ld - CSUserQuery: creating query with suggestion object <%@>", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_6();
}

void __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_cold_1(id *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "queryContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14(v2, v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v4, v5, "qid=%ld - [ContactSearch] Autoscoping couldn't be computed for any contacts", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

void __94__CSUserQuery_filterContactPeopleSuggestions_cachedSuggestionsEmailToScope_completionHandler___block_invoke_cold_2(id *a1)
{
  void *v1;
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(*a1, "queryContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14(v2, v3);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_0(&dword_18C42F000, v4, v5, "qid=%ld - [ContactSearch] All contacts are already processed or have [FROM] scopes", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2_0();
}

- (void)startContactSearchIfNeededWithSearchQuery:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_18C42F000, v0, v1, "[ContactSearch] Not fetching contacts for empty query string", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8();
}

@end
