@implementation EMSearchableIndexTopHitsQuery

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EMSearchableIndexTopHitsQuery_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_85 != -1)
    dispatch_once(&log_onceToken_85, block);
  return (OS_os_log *)(id)log_log_84;
}

void __36__EMSearchableIndexTopHitsQuery_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_84;
  log_log_84 = (uint64_t)v1;

}

- (EMSearchableIndexTopHitsQuery)initWithSearchString:(id)a3 filterQueries:(id)a4 bundleID:(id)a5 keyboardLanguage:(id)a6 updatedSuggestion:(id)a7 generateSuggestions:(BOOL)a8 logDescription:(id)a9 resultLimit:(unint64_t)a10 suggestionLimit:(unint64_t)a11 customFlags:(id)a12 feedbackQueryID:(int64_t)a13
{
  id v19;
  EMSearchableIndexTopHitsQuery *v20;
  uint64_t v21;
  NSString *searchString;
  uint64_t v23;
  NSArray *filterQueries;
  uint64_t v25;
  NSString *keyboardLanguage;
  NSMutableArray *v27;
  NSMutableArray *foundItems;
  NSMutableArray *v29;
  NSMutableArray *foundSuggestions;
  NSMutableArray *v31;
  NSMutableArray *foundInstantAnswersSuggestions;
  NSMutableDictionary *v33;
  NSMutableDictionary *foundMatchingHintsByPersistentID;
  EFPromise *v35;
  EFPromise *spotlightTopHitsQueryResultPromise;
  EFPromise *v37;
  EFPromise *spotlightTopHitsQuerySuggestionsResultPromise;
  EFPromise *v39;
  EFPromise *spotlightTopHitsQueryInstantAnswersResultPromise;
  uint64_t v41;
  NSProgress *progress;
  uint64_t v43;
  NSProgress *internalProgress;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id v57;
  id v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  int v64;
  void *v65;
  uint64_t v66;
  CSTopHitQuery *topHitSearchQuery;
  NSObject *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  const __CFString *v73;
  uint64_t v74;
  NSString *logPrefix;
  NSLock *v76;
  NSLock *lock;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  _QWORD v87[4];
  id v88;
  objc_super v89;
  _BYTE buf[12];
  __int16 v91;
  void *v92;
  __int16 v93;
  id v94;
  uint64_t v95;
  uint64_t v96;
  _QWORD v97[2];
  _QWORD v98[11];

  v98[9] = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v83 = a4;
  v79 = a5;
  v84 = a6;
  v82 = a7;
  v80 = a9;
  v19 = a12;
  v89.receiver = self;
  v89.super_class = (Class)EMSearchableIndexTopHitsQuery;
  v20 = -[EMSearchableIndexTopHitsQuery init](&v89, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v81, "copy");
    searchString = v20->_searchString;
    v20->_searchString = (NSString *)v21;

    v23 = objc_msgSend(v83, "copy");
    filterQueries = v20->_filterQueries;
    v20->_filterQueries = (NSArray *)v23;

    v25 = objc_msgSend(v84, "copy");
    keyboardLanguage = v20->_keyboardLanguage;
    v20->_keyboardLanguage = (NSString *)v25;

    v20->_generateSuggestions = a8;
    v20->_resultLimit = a10;
    objc_storeStrong((id *)&v20->_bundleID, a5);
    objc_storeStrong((id *)&v20->_logDescription, a9);
    v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    foundItems = v20->_foundItems;
    v20->_foundItems = v27;

    v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    foundSuggestions = v20->_foundSuggestions;
    v20->_foundSuggestions = v29;

    v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    foundInstantAnswersSuggestions = v20->_foundInstantAnswersSuggestions;
    v20->_foundInstantAnswersSuggestions = v31;

    v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    foundMatchingHintsByPersistentID = v20->_foundMatchingHintsByPersistentID;
    v20->_foundMatchingHintsByPersistentID = v33;

    v35 = (EFPromise *)objc_alloc_init(MEMORY[0x1E0D1EF60]);
    spotlightTopHitsQueryResultPromise = v20->_spotlightTopHitsQueryResultPromise;
    v20->_spotlightTopHitsQueryResultPromise = v35;

    v37 = (EFPromise *)objc_alloc_init(MEMORY[0x1E0D1EF60]);
    spotlightTopHitsQuerySuggestionsResultPromise = v20->_spotlightTopHitsQuerySuggestionsResultPromise;
    v20->_spotlightTopHitsQuerySuggestionsResultPromise = v37;

    v39 = (EFPromise *)objc_alloc_init(MEMORY[0x1E0D1EF60]);
    spotlightTopHitsQueryInstantAnswersResultPromise = v20->_spotlightTopHitsQueryInstantAnswersResultPromise;
    v20->_spotlightTopHitsQueryInstantAnswersResultPromise = v39;

    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", 1);
    v41 = objc_claimAutoreleasedReturnValue();
    progress = v20->_progress;
    v20->_progress = (NSProgress *)v41;

    objc_msgSend(MEMORY[0x1E0CB38A8], "discreteProgressWithTotalUnitCount:", -1);
    v43 = objc_claimAutoreleasedReturnValue();
    internalProgress = v20->_internalProgress;
    v20->_internalProgress = (NSProgress *)v43;

    -[NSProgress addChild:withPendingUnitCount:](v20->_progress, "addChild:withPendingUnitCount:", v20->_internalProgress, 1);
    v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47 = *MEMORY[0x1E0CA6800];
    v98[0] = *MEMORY[0x1E0CA69F8];
    v98[1] = v47;
    v48 = *MEMORY[0x1E0CA6A48];
    v98[2] = *MEMORY[0x1E0CA6A08];
    v98[3] = v48;
    v49 = *MEMORY[0x1E0CA6980];
    v98[4] = *MEMORY[0x1E0CA6A18];
    v98[5] = v49;
    v50 = *MEMORY[0x1E0CA6A90];
    v98[6] = *MEMORY[0x1E0CA6988];
    v98[7] = v50;
    v98[8] = *MEMORY[0x1E0CA6A60];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 9);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "addObjectsFromArray:", v51);

    -[EMSearchableIndexTopHitsQuery bundleID](v20, "bundleID");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
    {
      -[EMSearchableIndexTopHitsQuery bundleID](v20, "bundleID");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObject:", v53);

    }
    if (_os_feature_enabled_impl())
      objc_msgSend(v45, "addObject:", *MEMORY[0x1E0CA6A70]);
    if (_os_feature_enabled_impl())
    {
      v97[0] = CFSTR("com.apple.spotlight.events");
      v97[1] = CFSTR("com.apple.pommesctl");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 2);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "addObjectsFromArray:", v54);

    }
    objc_msgSend(MEMORY[0x1E0CA6B80], "topHitQueryContextWithCurrentSuggestion:", v82);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setMaxSuggestionCount:", a11);
    objc_msgSend(v55, "setMaxItemCount:", a10);
    objc_msgSend(v55, "setKeyboardLanguage:", v84);
    objc_msgSend(v55, "setFetchAttributes:", v45);
    objc_msgSend(v55, "setFilterQueries:", v83);
    objc_msgSend(v55, "setBundleIDs:", v46);
    objc_msgSend(v55, "setFeedbackQueryID:", a13);
    if (_os_feature_enabled_impl())
    {
      +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
      v56 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B99BB000, v56, OS_LOG_TYPE_DEFAULT, "[instant answers] Enabling instant answers in csTopHits query context", buf, 2u);
      }

      objc_msgSend(v55, "setEnableInstantAnswers:", 1);
    }
    if (v19 && objc_msgSend(v19, "count"))
    {
      v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __203__EMSearchableIndexTopHitsQuery_initWithSearchString_filterQueries_bundleID_keyboardLanguage_updatedSuggestion_generateSuggestions_logDescription_resultLimit_suggestionLimit_customFlags_feedbackQueryID___block_invoke;
      v87[3] = &unk_1E70F5D20;
      v58 = v57;
      v88 = v58;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v87);
      v59 = (void *)objc_msgSend(v58, "copy");
      objc_msgSend(v55, "setCustomFieldSpecifications:", v59);

      +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
      v60 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
      {
        v61 = (void *)objc_msgSend(v58, "copy");
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v61;
        _os_log_impl(&dword_1B99BB000, v60, OS_LOG_TYPE_DEFAULT, "Setting customFieldSpecifications: %@ on csContext", buf, 0xCu);

      }
    }
    v96 = *MEMORY[0x1E0CB2AB0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setProtectionClasses:", v62);

    objc_msgSend(MEMORY[0x1E0D1EEA8], "currentDevice");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v64 = objc_msgSend(v63, "isAppleSilicon");

    if (v64)
    {
      v95 = *MEMORY[0x1E0CB2AC0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "setProtectionClasses:", v65);

    }
    v66 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA6B78]), "initWithUserQueryString:queryContext:", v20->_searchString, v55);
    topHitSearchQuery = v20->_topHitSearchQuery;
    v20->_topHitSearchQuery = (CSTopHitQuery *)v66;

    +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D1EF48], "partiallyRedactedStringForString:", v20->_searchString);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v69;
      v91 = 2112;
      v92 = v55;
      v93 = 2112;
      v94 = v82;
      _os_log_impl(&dword_1B99BB000, v68, OS_LOG_TYPE_DEFAULT, "Setting top hits query with searchString: %@ and csContext: %@ with suggestion: %@", buf, 0x20u);

    }
    -[EMSearchableIndexTopHitsQuery _configureTopHitsSearchQuery:](v20, "_configureTopHitsSearchQuery:", v20->_topHitSearchQuery);
    v70 = (void *)MEMORY[0x1E0CB3940];
    -[EMSearchableIndexTopHitsQuery logDescription](v20, "logDescription");
    v71 = objc_claimAutoreleasedReturnValue();
    v72 = (void *)v71;
    v73 = &stru_1E70F6E90;
    if (v71)
      v73 = (const __CFString *)v71;
    objc_msgSend(v70, "stringWithFormat:", CFSTR("[%p %@]"), v20, v73, v79, v80);
    v74 = objc_claimAutoreleasedReturnValue();
    logPrefix = v20->_logPrefix;
    v20->_logPrefix = (NSString *)v74;

    v76 = (NSLock *)objc_alloc_init(MEMORY[0x1E0CB3740]);
    lock = v20->_lock;
    v20->_lock = v76;

    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v20);
    v85[0] = MEMORY[0x1E0C809B0];
    v85[1] = 3221225472;
    v85[2] = __203__EMSearchableIndexTopHitsQuery_initWithSearchString_filterQueries_bundleID_keyboardLanguage_updatedSuggestion_generateSuggestions_logDescription_resultLimit_suggestionLimit_customFlags_feedbackQueryID___block_invoke_106;
    v85[3] = &unk_1E70F1F78;
    objc_copyWeak(&v86, (id *)buf);
    -[NSProgress setCancellationHandler:](v20->_internalProgress, "setCancellationHandler:", v85);
    objc_destroyWeak(&v86);
    objc_destroyWeak((id *)buf);

  }
  return v20;
}

void __203__EMSearchableIndexTopHitsQuery_initWithSearchString_filterQueries_bundleID_keyboardLanguage_updatedSuggestion_generateSuggestions_logDescription_resultLimit_suggestionLimit_customFlags_feedbackQueryID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = objc_alloc(MEMORY[0x1E0CA6AD0]);
  v7 = (void *)objc_msgSend(v6, "initWithDisplayName:attribute:status:token:", v5, *MEMORY[0x1E0CA6A10], v8, CFSTR("Flag"));
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __203__EMSearchableIndexTopHitsQuery_initWithSearchString_filterQueries_bundleID_keyboardLanguage_updatedSuggestion_generateSuggestions_logDescription_resultLimit_suggestionLimit_customFlags_feedbackQueryID___block_invoke_106(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_cancel");

}

- (void)dealloc
{
  objc_super v3;

  -[EMSearchableIndexTopHitsQuery _cancel](self, "_cancel");
  v3.receiver = self;
  v3.super_class = (Class)EMSearchableIndexTopHitsQuery;
  -[EMSearchableIndexTopHitsQuery dealloc](&v3, sel_dealloc);
}

- (void)_configureTopHitsSearchQuery:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke;
  v12[3] = &unk_1E70F5B78;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v4, "setFoundItemsHandler:", v12);
  if (-[EMSearchableIndexTopHitsQuery generateSuggestions](self, "generateSuggestions"))
  {
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_2;
    v10[3] = &unk_1E70F5B78;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "setFoundSuggestionsHandler:", v10);
    objc_destroyWeak(&v11);
  }
  if (_os_feature_enabled_impl())
  {
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_3;
    v8[3] = &unk_1E70F5B78;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v4, "setFoundInstantAnswersHandler:", v8);
    objc_destroyWeak(&v9);
  }
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_4;
  v6[3] = &unk_1E70F5BA0;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "setCompletionHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_searchFoundItems:", v3);

}

void __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_searchFoundSuggestions:", v3);

}

void __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_searchFoundInstantAnswers:", v3);

}

void __62__EMSearchableIndexTopHitsQuery__configureTopHitsSearchQuery___block_invoke_4(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_searchDidCompleteWithError:", v3);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ : %p> query: %@"), objc_opt_class(), self, self->_topHitSearchQuery);
}

- (void)_searchFoundItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryResultPromise](self, "spotlightTopHitsQueryResultPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFinished");

  +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexTopHitsQuery logPrefix](self, "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543874;
    v16 = v10;
    v17 = 2112;
    v18 = v4;
    v19 = 1024;
    v20 = v8;
    _os_log_impl(&dword_1B99BB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ _searchFoundItems:%@ isFinished:%d", (uint8_t *)&v15, 0x1Cu);

  }
  if ((v8 & 1) == 0)
  {
    -[EMSearchableIndexTopHitsQuery internalProgress](self, "internalProgress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "becomeCurrentWithPendingUnitCount:", 1);

    -[EMSearchableIndexTopHitsQuery foundItems](self, "foundItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObjectsFromArray:", v4);

    -[EMSearchableIndexTopHitsQuery internalProgress](self, "internalProgress");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "resignCurrent");

  }
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "unlock");

}

- (void)_searchFoundSuggestions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lock");

  -[EMSearchableIndexTopHitsQuery spotlightTopHitsQuerySuggestionsResultPromise](self, "spotlightTopHitsQuerySuggestionsResultPromise");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "future");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isFinished");

  +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexTopHitsQuery logPrefix](self, "logPrefix");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[EMCSLoggingAdditions publicDescriptionForSuggestionArray:](EMCSLoggingAdditions, "publicDescriptionForSuggestionArray:", v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543874;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    v20 = 1024;
    v21 = v8;
    _os_log_impl(&dword_1B99BB000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ _searchFoundSuggestions:%@ isFinished:%d", (uint8_t *)&v16, 0x1Cu);

  }
  if ((v8 & 1) == 0)
  {
    -[EMSearchableIndexTopHitsQuery internalProgress](self, "internalProgress");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "becomeCurrentWithPendingUnitCount:", 1);

    -[EMSearchableIndexTopHitsQuery foundSuggestions](self, "foundSuggestions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObjectsFromArray:", v4);

    -[EMSearchableIndexTopHitsQuery internalProgress](self, "internalProgress");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "resignCurrent");

  }
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "unlock");

}

- (void)_searchFoundInstantAnswers:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  int v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lock");

  -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryInstantAnswersResultPromise](self, "spotlightTopHitsQueryInstantAnswersResultPromise");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "future");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isFinished");

  +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexTopHitsQuery logPrefix](self, "logPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v28, "count");
    *(_DWORD *)buf = 138544130;
    v35 = (uint64_t)v9;
    v36 = 2112;
    v37 = (uint64_t)v28;
    v38 = 1024;
    v39 = v7;
    v40 = 2048;
    v41 = v10;
    _os_log_impl(&dword_1B99BB000, v8, OS_LOG_TYPE_DEFAULT, "[instant answers] %{public}@ _searchFoundInstantAnswers:%@ isFinished:%d with instant answers count: %ld", buf, 0x26u);

  }
  if ((v7 & 1) == 0)
  {
    -[EMSearchableIndexTopHitsQuery internalProgress](self, "internalProgress");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "becomeCurrentWithPendingUnitCount:", 1);

    +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v35 = 1;
      _os_log_impl(&dword_1B99BB000, v12, OS_LOG_TYPE_DEFAULT, "[instant answers] Sending %lu eligible instant answer to the suggester", buf, 0xCu);
    }

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v13 = v28;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v30 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[EMSearchableIndexTopHitsQuery foundInstantAnswersSuggestions](self, "foundInstantAnswersSuggestions");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v18, "count"))
          {
            v19 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v17, "instantAnswer");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "instantAnswersKind"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v19) = objc_msgSend(&unk_1E711F6E8, "containsObject:", v21);

            if (!(_DWORD)v19)
              continue;
            -[EMSearchableIndexTopHitsQuery foundInstantAnswersSuggestions](self, "foundInstantAnswersSuggestions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "addObject:", v17);
          }

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v14);
    }

    +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[EMSearchableIndexTopHitsQuery foundInstantAnswersSuggestions](self, "foundInstantAnswersSuggestions");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMSearchableIndexTopHitsQuery foundInstantAnswersSuggestions](self, "foundInstantAnswersSuggestions");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");
      *(_DWORD *)buf = 138412546;
      v35 = (uint64_t)v23;
      v36 = 2048;
      v37 = v25;
      _os_log_impl(&dword_1B99BB000, v22, OS_LOG_TYPE_DEFAULT, "[instant answers] Final found instant answers are:%@ with count:%lu", buf, 0x16u);

    }
    -[EMSearchableIndexTopHitsQuery internalProgress](self, "internalProgress");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "resignCurrent");

  }
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "unlock");

}

- (void)_searchDidCompleteWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  EMSearchableIndexTopHitsQueryResult *v9;
  void *v10;
  void *v11;
  void *v12;
  EMSearchableIndexSuggestionsQueryResult *v13;
  void *v14;
  EMSearchableIndexSuggestionsQueryResult *v15;
  EMSearchableIndexInstantAnswersQueryResult *v16;
  void *v17;
  EMSearchableIndexInstantAnswersQueryResult *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  EMSearchableIndexTopHitsQueryResult *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexTopHitsQuery logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ef_publicDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v36 = v6;
    v37 = 2114;
    v38 = v7;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ _searchDidComplete error:%{public}@", buf, 0x16u);

  }
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "lock");

  v9 = [EMSearchableIndexTopHitsQueryResult alloc];
  -[EMSearchableIndexTopHitsQuery topHitSearchQuery](self, "topHitSearchQuery");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSearchableIndexTopHitsQuery foundItems](self, "foundItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[EMSearchableIndexTopHitsQuery foundMatchingHintsByPersistentID](self, "foundMatchingHintsByPersistentID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[EMSearchableIndexTopHitsQueryResult initWithTopHitSearchQuery:foundItems:foundMatchingHintsByPersistentID:](v9, "initWithTopHitSearchQuery:foundItems:foundMatchingHintsByPersistentID:", v10, v11, v12);

  -[EMSearchableIndexTopHitsQuery setTopHitSearchQuery:](self, "setTopHitSearchQuery:", 0);
  v13 = [EMSearchableIndexSuggestionsQueryResult alloc];
  -[EMSearchableIndexTopHitsQuery foundSuggestions](self, "foundSuggestions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[EMSearchableIndexSuggestionsQueryResult initWithSuggestions:](v13, "initWithSuggestions:", v14);

  if (_os_feature_enabled_impl())
  {
    v16 = [EMSearchableIndexInstantAnswersQueryResult alloc];
    -[EMSearchableIndexTopHitsQuery foundInstantAnswersSuggestions](self, "foundInstantAnswersSuggestions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[EMSearchableIndexInstantAnswersQueryResult initWithInstantAnswersSuggestions:](v16, "initWithInstantAnswersSuggestions:", v17);

  }
  else
  {
    v18 = 0;
  }
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "unlock");

  -[EMSearchableIndexTopHitsQuery internalProgress](self, "internalProgress");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "completedUnitCount");
  -[EMSearchableIndexTopHitsQuery internalProgress](self, "internalProgress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTotalUnitCount:", v21);

  if (v4)
  {
    -[EMSearchableIndexTopHitsQuery spotlightTopHitsQuerySuggestionsResultPromise](self, "spotlightTopHitsQuerySuggestionsResultPromise");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "finishWithError:", v4);

    -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryResultPromise](self, "spotlightTopHitsQueryResultPromise");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "finishWithError:", v4);

    if (_os_feature_enabled_impl())
    {
      -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryInstantAnswersResultPromise](self, "spotlightTopHitsQueryInstantAnswersResultPromise");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "finishWithError:", v4);
LABEL_13:

    }
  }
  else
  {
    +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      -[EMSearchableIndexTopHitsQuery logPrefix](self, "logPrefix");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMSearchableIndexTopHitsQuery foundItems](self, "foundItems");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMSearchableIndexTopHitsQuery foundSuggestions](self, "foundSuggestions");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      +[EMCSLoggingAdditions publicDescriptionForSuggestionArray:](EMCSLoggingAdditions, "publicDescriptionForSuggestionArray:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[EMSearchableIndexTopHitsQuery foundInstantAnswersSuggestions](self, "foundInstantAnswersSuggestions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v36 = v27;
      v37 = 2112;
      v38 = v28;
      v39 = 2112;
      v40 = v30;
      v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_1B99BB000, v26, OS_LOG_TYPE_DEFAULT, "[instant answers] %{public}@ _searchDidComplete foundLibraryItems:%@ foundSuggestionItems:%@ foundInstantAnswersItems: %@", buf, 0x2Au);

    }
    -[EMSearchableIndexTopHitsQuery spotlightTopHitsQuerySuggestionsResultPromise](self, "spotlightTopHitsQuerySuggestionsResultPromise");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "finishWithResult:", v15);

    -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryResultPromise](self, "spotlightTopHitsQueryResultPromise");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "finishWithResult:", v34);

    if (_os_feature_enabled_impl())
    {
      -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryInstantAnswersResultPromise](self, "spotlightTopHitsQueryInstantAnswersResultPromise");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "finishWithResult:", v18);
      goto LABEL_13;
    }
  }

}

- (id)topHitsQueryResult
{
  void *v2;
  void *v3;

  -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryResultPromise](self, "spotlightTopHitsQueryResultPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)topHitsQuerySuggestionResult
{
  void *v2;
  void *v3;

  -[EMSearchableIndexTopHitsQuery spotlightTopHitsQuerySuggestionsResultPromise](self, "spotlightTopHitsQuerySuggestionsResultPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)topHitsQueryInstantAnswersResult
{
  void *v2;
  void *v3;

  -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryInstantAnswersResultPromise](self, "spotlightTopHitsQueryInstantAnswersResultPromise");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "future");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)start
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexTopHitsQuery logPrefix](self, "logPrefix");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSearchableIndexTopHitsQuery topHitSearchQuery](self, "topHitSearchQuery");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0D1EF48];
    -[EMSearchableIndexTopHitsQuery searchString](self, "searchString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "partiallyRedactedStringForString:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMSearchableIndexTopHitsQuery filterQueries](self, "filterQueries");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v5;
    v15 = 2112;
    v16 = v6;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    _os_log_impl(&dword_1B99BB000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ starting query:%@ searchString:%@ filter:%@", (uint8_t *)&v13, 0x2Au);

  }
  -[EMSearchableIndexTopHitsQuery topHitSearchQuery](self, "topHitSearchQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "start");

  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "unlock");

}

- (void)cancel
{
  id v2;

  -[EMSearchableIndexTopHitsQuery progress](self, "progress");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (void)_cancel
{
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  CSTopHitQuery *topHitSearchQuery;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lock");

  -[EMSearchableIndexTopHitsQuery topHitSearchQuery](self, "topHitSearchQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[EMSearchableIndexTopHitsQuery log](EMSearchableIndexTopHitsQuery, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EMSearchableIndexTopHitsQuery logPrefix](self, "logPrefix");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v6;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_1B99BB000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ cancelling query:%@", (uint8_t *)&v15, 0x16u);

  }
  -[CSTopHitQuery setCompletionHandler:](self->_topHitSearchQuery, "setCompletionHandler:", 0);
  -[CSTopHitQuery setFoundItemHandler:](self->_topHitSearchQuery, "setFoundItemHandler:", 0);
  -[CSTopHitQuery setFoundSuggestionsHandler:](self->_topHitSearchQuery, "setFoundSuggestionsHandler:", 0);
  if (_os_feature_enabled_impl())
    -[CSTopHitQuery setFoundInstantAnswersHandler:](self->_topHitSearchQuery, "setFoundInstantAnswersHandler:", 0);
  objc_msgSend(v4, "cancel");
  topHitSearchQuery = self->_topHitSearchQuery;
  self->_topHitSearchQuery = 0;

  -[EMSearchableIndexTopHitsQuery lock](self, "lock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unlock");

  -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryResultPromise](self, "spotlightTopHitsQueryResultPromise");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "future");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cancel");

  -[EMSearchableIndexTopHitsQuery spotlightTopHitsQuerySuggestionsResultPromise](self, "spotlightTopHitsQuerySuggestionsResultPromise");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "future");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "cancel");

  if (_os_feature_enabled_impl())
  {
    -[EMSearchableIndexTopHitsQuery spotlightTopHitsQueryInstantAnswersResultPromise](self, "spotlightTopHitsQueryInstantAnswersResultPromise");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "future");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cancel");

  }
}

- (NSString)searchString
{
  return self->_searchString;
}

- (NSArray)filterQueries
{
  return self->_filterQueries;
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (unint64_t)resultLimit
{
  return self->_resultLimit;
}

- (NSString)logDescription
{
  return self->_logDescription;
}

- (CSTopHitQuery)topHitSearchQuery
{
  return (CSTopHitQuery *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTopHitSearchQuery:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)generateSuggestions
{
  return self->_generateSuggestions;
}

- (void)setGenerateSuggestions:(BOOL)a3
{
  self->_generateSuggestions = a3;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSMutableArray)foundItems
{
  return self->_foundItems;
}

- (void)setFoundItems:(id)a3
{
  objc_storeStrong((id *)&self->_foundItems, a3);
}

- (NSMutableArray)foundSuggestions
{
  return self->_foundSuggestions;
}

- (void)setFoundSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_foundSuggestions, a3);
}

- (NSMutableArray)foundInstantAnswersSuggestions
{
  return self->_foundInstantAnswersSuggestions;
}

- (void)setFoundInstantAnswersSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_foundInstantAnswersSuggestions, a3);
}

- (NSMutableDictionary)foundMatchingHintsByPersistentID
{
  return self->_foundMatchingHintsByPersistentID;
}

- (void)setFoundMatchingHintsByPersistentID:(id)a3
{
  objc_storeStrong((id *)&self->_foundMatchingHintsByPersistentID, a3);
}

- (EFPromise)spotlightTopHitsQueryResultPromise
{
  return self->_spotlightTopHitsQueryResultPromise;
}

- (void)setSpotlightTopHitsQueryResultPromise:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightTopHitsQueryResultPromise, a3);
}

- (EFPromise)spotlightTopHitsQuerySuggestionsResultPromise
{
  return self->_spotlightTopHitsQuerySuggestionsResultPromise;
}

- (void)setSpotlightTopHitsQuerySuggestionsResultPromise:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightTopHitsQuerySuggestionsResultPromise, a3);
}

- (EFPromise)spotlightTopHitsQueryInstantAnswersResultPromise
{
  return self->_spotlightTopHitsQueryInstantAnswersResultPromise;
}

- (void)setSpotlightTopHitsQueryInstantAnswersResultPromise:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightTopHitsQueryInstantAnswersResultPromise, a3);
}

- (NSProgress)progress
{
  return self->_progress;
}

- (void)setProgress:(id)a3
{
  objc_storeStrong((id *)&self->_progress, a3);
}

- (NSProgress)internalProgress
{
  return self->_internalProgress;
}

- (void)setInternalProgress:(id)a3
{
  objc_storeStrong((id *)&self->_internalProgress, a3);
}

- (NSString)logPrefix
{
  return self->_logPrefix;
}

- (void)setLogPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_logPrefix, a3);
}

- (NSLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
  objc_storeStrong((id *)&self->_lock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_storeStrong((id *)&self->_internalProgress, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_spotlightTopHitsQueryInstantAnswersResultPromise, 0);
  objc_storeStrong((id *)&self->_spotlightTopHitsQuerySuggestionsResultPromise, 0);
  objc_storeStrong((id *)&self->_spotlightTopHitsQueryResultPromise, 0);
  objc_storeStrong((id *)&self->_foundMatchingHintsByPersistentID, 0);
  objc_storeStrong((id *)&self->_foundInstantAnswersSuggestions, 0);
  objc_storeStrong((id *)&self->_foundSuggestions, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_topHitSearchQuery, 0);
  objc_storeStrong((id *)&self->_logDescription, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
  objc_storeStrong((id *)&self->_filterQueries, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

@end
