@implementation MSParsecSearchSession

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__MSParsecSearchSession_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken != -1)
    dispatch_once(&log_onceToken, block);
  return (OS_os_log *)(id)log_log;
}

void __28__MSParsecSearchSession_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log;
  log_log = (uint64_t)v1;

}

+ (id)sharedSession
{
  if (sharedSession_onceToken != -1)
    dispatch_once(&sharedSession_onceToken, &__block_literal_global_6);
  return (id)sharedSession_sharedSession;
}

void __38__MSParsecSearchSession_sharedSession__block_invoke()
{
  MSParsecSearchSession *v0;
  void *v1;

  v0 = objc_alloc_init(MSParsecSearchSession);
  v1 = (void *)sharedSession_sharedSession;
  sharedSession_sharedSession = (uint64_t)v0;

}

- (MSParsecSearchSession)init
{
  MSParsecSearchSession *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  PARSession *session;
  NSMutableArray *v10;
  NSMutableArray *currentFeedback;
  objc_super v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v13.receiver = self;
  v13.super_class = (Class)MSParsecSearchSession;
  v2 = -[MSParsecSearchSession init](&v13, sel_init);
  if (v2)
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v3 = (void *)getPARSessionConfigurationClass_softClass;
    v22 = getPARSessionConfigurationClass_softClass;
    if (!getPARSessionConfigurationClass_softClass)
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __getPARSessionConfigurationClass_block_invoke;
      v17 = &unk_1E716E028;
      v18 = &v19;
      __getPARSessionConfigurationClass_block_invoke((uint64_t)&v14);
      v3 = (void *)v20[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v19, 8);
    v5 = (void *)objc_msgSend([v4 alloc], "initWithId:userAgent:", CFSTR("com.apple.mail"), CFSTR("Mail/1"));
    v19 = 0;
    v20 = &v19;
    v21 = 0x2050000000;
    v6 = (void *)getPARSessionClass_softClass;
    v22 = getPARSessionClass_softClass;
    if (!getPARSessionClass_softClass)
    {
      v14 = MEMORY[0x1E0C809B0];
      v15 = 3221225472;
      v16 = __getPARSessionClass_block_invoke;
      v17 = &unk_1E716E028;
      v18 = &v19;
      __getPARSessionClass_block_invoke((uint64_t)&v14);
      v6 = (void *)v20[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v19, 8);
    objc_msgSend(v7, "sharedPARSessionWithConfiguration:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
    session = v2->_session;
    v2->_session = (PARSession *)v8;

    v2->_currentQueryID = 0;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    currentFeedback = v2->_currentFeedback;
    v2->_currentFeedback = v10;

  }
  return v2;
}

- (int64_t)feedbackQueryID
{
  return self->_currentQueryID;
}

- (void)sendLogsToSettings
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  +[MSParsecSearchSession log](MSParsecSearchSession, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[MSParsecSearchSession currentFeedback](self, "currentFeedback");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_1B9D1A000, v3, OS_LOG_TYPE_DEFAULT, "Reporting feedback to settings %@", (uint8_t *)&v6, 0xCu);

  }
  -[MSParsecSearchSession currentFeedback](self, "currentFeedback");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllObjects");

}

- (void)reportFeedback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int64_t currentQueryID;
  int v9;
  int64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSParsecSearchSession session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reportFeedback:queryId:", v4, self->_currentQueryID);

  -[MSParsecSearchSession currentFeedback](self, "currentFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v4);

  +[MSParsecSearchSession log](MSParsecSearchSession, "log");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    currentQueryID = self->_currentQueryID;
    v9 = 134218242;
    v10 = currentQueryID;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_1B9D1A000, v7, OS_LOG_TYPE_INFO, "Reporting queryID: %lld feedback: %@", (uint8_t *)&v9, 0x16u);
  }

}

- (void)reportSearchViewAppeared:(BOOL)a3 currentMailboxScope:(BOOL)a4 languages:(id)a5
{
  _BOOL8 v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v11 = a5;
  v8 = objc_alloc(MEMORY[0x1E0D8C6B8]);
  if (v6)
    v9 = 9;
  else
    v9 = 26;
  v10 = (void *)objc_msgSend(v8, "initWithEvent:", v9);
  if (v6)
    ++self->_currentQueryID;
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v10);
  if (v6)
    -[MSParsecSearchSession reportQueryWithRestrictedComponents:triggerEvent:searchType:hasCurrentMailboxScope:searchViewAppeared:languages:](self, "reportQueryWithRestrictedComponents:triggerEvent:searchType:hasCurrentMailboxScope:searchViewAppeared:languages:", MEMORY[0x1E0C9AA60], 9, 1, v5, 1, v11);

}

- (void)reportQueryWithRestrictedComponents:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 hasCurrentMailboxScope:(BOOL)a6 searchViewAppeared:(BOOL)a7 languages:(id)a8
{
  _BOOL8 v10;
  id v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint8_t v37[24];
  uint64_t v38;

  v10 = a6;
  v38 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a8;
  -[MSParsecSearchSession currentLocalSearchFeedback](self, "currentLocalSearchFeedback");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    -[MSParsecSearchSession reportLocalSearchEnded](self, "reportLocalSearchEnded");
  if (!a7)
    ++self->_currentQueryID;
  +[MSParsecSearchSessionQueryComponent _structuredQueryForComponents:hasCurrentMailboxScope:languages:](MSParsecSearchSessionQueryComponent, "_structuredQueryForComponents:hasCurrentMailboxScope:languages:", v14, v10, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[MSParsecSearchSession log](MSParsecSearchSession, "log");
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    -[MSParsecSearchSession indexState](self, "indexState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MSParsecSearchSession reportQueryWithRestrictedComponents:triggerEvent:searchType:hasCurrentMailboxScope:searchViewAppeared:languages:].cold.1(v19, v37, v18);
  }

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C738]), "initWithInput:triggerEvent:searchType:indexType:queryId:", v17, a4, a5, 0, self->_currentQueryID);
  v21 = objc_alloc_init(MEMORY[0x1E0D8C438]);
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[MSParsecSearchSession indexState](self, "indexState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "numberWithInteger:", objc_msgSend(v23, "percentMessagesIndexed"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPercentMessagesIndexed:", v24);

  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[MSParsecSearchSession indexState](self, "indexState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "numberWithInteger:", objc_msgSend(v26, "percentAttachmentsIndexed"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setPercentAttachmentsIndexed:", v27);

  v28 = (void *)MEMORY[0x1E0CB37E8];
  -[MSParsecSearchSession indexState](self, "indexState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "numberWithInteger:", objc_msgSend(v29, "totalMessageCount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTotalMessageCount:", v30);

  v31 = (void *)MEMORY[0x1E0CB37E8];
  -[MSParsecSearchSession indexState](self, "indexState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "numberWithInteger:", objc_msgSend(v32, "indexedMessageCount"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setIndexedMessageCount:", v33);

  v34 = (void *)MEMORY[0x1E0CB37E8];
  -[MSParsecSearchSession indexState](self, "indexState");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "numberWithInteger:", objc_msgSend(v35, "indexType"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setSearchIndex:", v36);

  objc_msgSend(v20, "setIndexState:", v21);
  -[MSParsecSearchSession setCurrentLocalSearchFeedback:](self, "setCurrentLocalSearchFeedback:", v20);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v20);

}

- (void)reportQueryWithRestrictedComponents:(id)a3 triggerEvent:(unint64_t)a4 searchType:(unint64_t)a5 hasCurrentMailboxScope:(BOOL)a6 languages:(id)a7
{
  -[MSParsecSearchSession reportQueryWithRestrictedComponents:triggerEvent:searchType:hasCurrentMailboxScope:searchViewAppeared:languages:](self, "reportQueryWithRestrictedComponents:triggerEvent:searchType:hasCurrentMailboxScope:searchViewAppeared:languages:", a3, a4, a5, a6, 0, a7);
}

- (void)reportLocalSearchEnded
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_alloc(MEMORY[0x1E0D8C368]);
  -[MSParsecSearchSession currentLocalSearchFeedback](self, "currentLocalSearchFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "initWithStartSearch:", v4);

  -[MSParsecSearchSession setCurrentLocalSearchFeedback:](self, "setCurrentLocalSearchFeedback:", 0);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v5);

}

- (id)_categoryOrder
{
  if (_categoryOrder_onceToken != -1)
    dispatch_once(&_categoryOrder_onceToken, &__block_literal_global_12);
  return (id)_categoryOrder_order;
}

void __39__MSParsecSearchSession__categoryOrder__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[20];

  v2[19] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("cr");
  v2[1] = CFSTR("tophit");
  v2[2] = CFSTR("instantanswer");
  v2[3] = CFSTR("suggestion");
  v2[4] = CFSTR("people");
  v2[5] = CFSTR("date");
  v2[6] = CFSTR("subject");
  v2[7] = CFSTR("tu");
  v2[8] = CFSTR("tf");
  v2[9] = CFSTR("tv");
  v2[10] = CFSTR("attachment");
  v2[11] = CFSTR("mailbox");
  v2[12] = CFSTR("free_text");
  v2[13] = CFSTR("user_typed");
  v2[14] = CFSTR("document");
  v2[15] = CFSTR("link");
  v2[16] = CFSTR("flag");
  v2[17] = CFSTR("sender_contains");
  v2[18] = CFSTR("subject_contains");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 19);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_categoryOrder_order;
  _categoryOrder_order = v0;

}

- (void)reportRankingFeedbackForSuggestions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (v4)
  {
    -[MSParsecSearchSession _categoryOrder](self, "_categoryOrder");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v6);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v4, "objectForKeyedSubscript:", v10, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            -[MSParsecSearchSession _sectionFeedbackForBundleIdentifier:results:](self, "_sectionFeedbackForBundleIdentifier:results:", v10, v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObject:", v12);

          }
        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C600]), "initWithSections:blendingDuration:", v5, 0.0);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v13);

}

- (void)reportSuggestionsVisible:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  MSParsecSearchSession *v16;
  id v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  objc_msgSend(v17, "ef_mapSelector:", sel_feedbackResult);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = self;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v17;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend(v10, "inlineCard");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "cardSections");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "firstObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v13, "cardSectionId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v14);

          }
        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C828]), "initWithResults:triggerEvent:", v18, 0);
  objc_msgSend(v15, "setUniqueIdentifiersOfVisibleCardSections:", v4);
  -[MSParsecSearchSession reportFeedback:](v16, "reportFeedback:", v15);

}

- (void)reportTopHitSelected:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "feedbackResult");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C628]), "initWithResult:triggerEvent:destination:", v5, 2, 0);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v4);

}

- (void)reportInstantAnswerCardSelected:(id)a3 cardSectionID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_msgSend(a3, "feedbackResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0D8C218]);
  objc_msgSend(v7, "setCardSectionId:", v11);
  v8 = objc_alloc_init(MEMORY[0x1E0D8C820]);
  v9 = objc_alloc_init(MEMORY[0x1E0D8C1E0]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C2A8]), "initWithCommand:cardSection:result:button:", v8, v7, v6, v9);
  objc_msgSend(v10, "setTriggerEvent:", 2);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v10);

}

- (void)reportInstantAnswerButtonSelected:(id)a3 cardSectionID:(id)a4 command:(id)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  objc_msgSend(a3, "feedbackResult");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0D8C218]);
  objc_msgSend(v10, "setCardSectionId:", v13);
  v11 = objc_alloc_init(MEMORY[0x1E0D8C1E0]);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C2A8]), "initWithCommand:cardSection:result:button:", v8, v10, v9, v11);
  objc_msgSend(v12, "setTriggerEvent:", 2);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v12);

}

- (void)reportSuggestionSelected:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "feedbackResult");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C628]), "initWithResult:triggerEvent:destination:", v5, 2, 0);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v4);

}

- (void)reportDidGoToCommittedSearch
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C338]), "initWithInput:endpoint:", &stru_1E7171180, 0);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:");

}

- (void)reportMessageListResultsFetched:(id)a3 isFinished:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v4 = a4;
  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (v4)
    -[MSParsecSearchSession reportLocalSearchEnded](self, "reportLocalSearchEnded");
  -[MSParsecSearchSession _sectionFeedbackForBundleIdentifier:results:](self, "_sectionFeedbackForBundleIdentifier:results:", CFSTR("com.apple.mail.search.messagelist"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D8C600]);
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithSections:blendingDuration:", v9, 0.0);

  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v10);
}

- (id)_sectionFeedbackForBundleIdentifier:(id)a3 results:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v5 = a3;
  objc_msgSend(a4, "ef_compactMap:", &__block_literal_global_28);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6D8]), "initWithResults:section:localSectionPosition:personalizationScore:", v6, 0, 0, 0.0);
  v8 = objc_alloc_init(MEMORY[0x1E0D8C650]);
  objc_msgSend(v8, "setBundleIdentifier:", v5);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIdentifier:", v10);

  objc_msgSend(v7, "setSection:", v8);
  return v7;
}

id __69__MSParsecSearchSession__sectionFeedbackForBundleIdentifier_results___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = a2;
  v3 = objc_alloc(MEMORY[0x1E0D8C648]);
  objc_msgSend(v2, "feedbackResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithResult:hiddenResults:duplicateResults:localResultPosition:", v4, 0, 0, 0);

  return v5;
}

- (void)reportMessageListResultsVisible:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "ef_compactMapSelector:", sel_feedbackResult);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C828]), "initWithResults:triggerEvent:", v5, 0);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v4);

}

- (void)reportMessageListResultEngaged:(id)a3 engagementAction:(int64_t)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "feedbackResult");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a4 >= 5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSParsecSearchSession.m"), 292, CFSTR("Using undefined MSParsecSearchSessionEngagementAction %ld to create SFResultEngagementFeedback"), 0);

    v7 = 0;
  }
  else
  {
    v7 = qword_1B9D34D08[a4];
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C628]), "initWithResult:triggerEvent:destination:", v10, v7, 0);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:", v9);

}

- (void)reportQueryClearedEvent:(int64_t)a3
{
  int64_t v5;
  id v7;
  id v8;

  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSParsecSearchSession.m"), 312, CFSTR("Using undefined MSParsecSearchSessionClearedEvent %ld to create SFClearInputFeedback"), a3);

    v5 = 0;
  }
  else
  {
    v5 = a3 + 1;
  }
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C240]), "initWithEvent:", v5);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:");

}

- (void)reportSearchEndedEvent:(int64_t)a3
{
  uint64_t v5;
  id v7;
  id v8;

  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSParsecSearchSession.m"), 332, CFSTR("Using undefined MSParsecSearchSessionEndEvent %ld to create SFSearchViewDisappearFeedback"), a3);

    v5 = 0;
  }
  else
  {
    v5 = qword_1B9D34D30[a3];
  }
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D8C6C0]), "initWithEvent:", v5);
  -[MSParsecSearchSession reportFeedback:](self, "reportFeedback:");
  -[MSParsecSearchSession sendLogsToSettings](self, "sendLogsToSettings");

}

- (MSParsecSearchIndexState)indexState
{
  return (MSParsecSearchIndexState *)objc_getProperty(self, a2, 8, 1);
}

- (void)setIndexState:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PARSession)session
{
  return self->_session;
}

- (int64_t)currentQueryID
{
  return self->_currentQueryID;
}

- (void)setCurrentQueryID:(int64_t)a3
{
  self->_currentQueryID = a3;
}

- (NSMutableArray)currentFeedback
{
  return self->_currentFeedback;
}

- (SFStartLocalSearchFeedback)currentLocalSearchFeedback
{
  return self->_currentLocalSearchFeedback;
}

- (void)setCurrentLocalSearchFeedback:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocalSearchFeedback, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocalSearchFeedback, 0);
  objc_storeStrong((id *)&self->_currentFeedback, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_indexState, 0);
}

- (void)reportQueryWithRestrictedComponents:(os_log_t)log triggerEvent:searchType:hasCurrentMailboxScope:searchViewAppeared:languages:.cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B9D1A000, log, OS_LOG_TYPE_DEBUG, "Sending Parsec indexState: %@", buf, 0xCu);

}

@end
