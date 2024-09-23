@implementation CKContextRecentsPredictionManager

- (CKContextRecentsPredictionManager)init
{
  CKContextRecentsPredictionManager *v2;
  uint64_t v3;
  void *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *suggestionReportingQueue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKContextRecentsPredictionManager;
  v2 = -[CKContextRecentsPredictionManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24DD78E08);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)kBundleIdentifiersToNotSuggest;
    kBundleIdentifiersToNotSuggest = v3;

    v5 = dispatch_queue_create("CKContextRecentsPredictionManager reporting queue", 0);
    suggestionReportingQueue = v2->_suggestionReportingQueue;
    v2->_suggestionReportingQueue = (OS_dispatch_queue *)v5;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CKContextRecentsPredictionManager stopContributingPredictions](self, "stopContributingPredictions");
  v3.receiver = self;
  v3.super_class = (Class)CKContextRecentsPredictionManager;
  -[CKContextRecentsPredictionManager dealloc](&v3, sel_dealloc);
}

- (void)startContributingPredictions
{
  CKContextRecentsCache *recentsCache;
  CKContextRecentsCache *v4;
  CKContextRecentsCache *v5;

  recentsCache = self->_recentsCache;
  if (!recentsCache)
  {
    v4 = -[CKContextRecentsCache initWithCacheConfiguration:]([CKContextRecentsCache alloc], "initWithCacheConfiguration:", 1);
    v5 = self->_recentsCache;
    self->_recentsCache = v4;

    recentsCache = self->_recentsCache;
  }
  -[CKContextRecentsCache setDelegate:](recentsCache, "setDelegate:", self);
  -[CKContextRecentsPredictionManager _clearSuggestions](self, "_clearSuggestions");
}

- (void)stopContributingPredictions
{
  -[CKContextRecentsCache setDelegate:](self->_recentsCache, "setDelegate:", 0);
  -[CKContextRecentsPredictionManager _clearSuggestions](self, "_clearSuggestions");
}

- (void)_createClientModelIfNecessary
{
  void *v3;
  objc_class *v4;
  ATXProactiveSuggestionClientModel *v5;
  ATXProactiveSuggestionClientModel *clientModel;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (!self->_clientModel)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2050000000;
    v3 = (void *)getATXProactiveSuggestionClientModelClass_softClass;
    v11 = getATXProactiveSuggestionClientModelClass_softClass;
    if (!getATXProactiveSuggestionClientModelClass_softClass)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __getATXProactiveSuggestionClientModelClass_block_invoke;
      v7[3] = &unk_24DD77310;
      v7[4] = &v8;
      __getATXProactiveSuggestionClientModelClass_block_invoke((uint64_t)v7);
      v3 = (void *)v9[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v8, 8);
    v5 = (ATXProactiveSuggestionClientModel *)objc_msgSend([v4 alloc], "initWithClientModelId:requestDelegate:", CFSTR("ck_universal_recents"), 0);
    clientModel = self->_clientModel;
    self->_clientModel = v5;

  }
}

- (void)didInitiatePruningMaintenanceTaskForCache:(id)a3 existingRecentsUUIDs:(id)a4
{
  id WeakRetained;
  char v6;
  id v7;
  id v8;

  v8 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v7, "didInitiatePruningMaintenanceTaskForManager:existingRecentsUUIDs:", self, v8);

  }
}

- (void)_clearSuggestions
{
  OUTLINED_FUNCTION_3(&dword_21A9DC000, MEMORY[0x24BDACB70], a3, "Clearing suggestions to ATX", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

- (void)modeDidChangeToModeWithUUIDString:(id)a3 forCache:(id)a4
{
  id v6;
  id v7;
  CKContextRecentsPredictionManager *v8;
  id suggestionsContributionBlock;
  id v10;
  OS_os_transaction *suggestionDonationTransaction;
  id v12;
  id v13;
  dispatch_block_t v14;
  id v15;
  dispatch_time_t v16;
  uint8_t v17[8];
  _QWORD block[4];
  id v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v6;
    _os_log_impl(&dword_21A9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Mode did change to mode with identifier: %@", buf, 0xCu);
  }
  v8 = self;
  objc_sync_enter(v8);
  suggestionsContributionBlock = v8->_suggestionsContributionBlock;
  if (suggestionsContributionBlock)
  {
    dispatch_block_cancel(suggestionsContributionBlock);
    v10 = v8->_suggestionsContributionBlock;
    v8->_suggestionsContributionBlock = 0;

    suggestionDonationTransaction = v8->_suggestionDonationTransaction;
    v8->_suggestionDonationTransaction = 0;

  }
  objc_initWeak((id *)buf, v8);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__CKContextRecentsPredictionManager_modeDidChangeToModeWithUUIDString_forCache___block_invoke;
  block[3] = &unk_24DD77208;
  objc_copyWeak(&v21, (id *)buf);
  v12 = v6;
  v19 = v12;
  v13 = v7;
  v20 = v13;
  v14 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v15 = v8->_suggestionsContributionBlock;
  v8->_suggestionsContributionBlock = v14;

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_21A9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Scheduling predictions contribution", v17, 2u);
  }
  v16 = dispatch_time(0, 10000000000);
  dispatch_after(v16, (dispatch_queue_t)v8->_suggestionReportingQueue, v8->_suggestionsContributionBlock);

  objc_destroyWeak(&v21);
  objc_destroyWeak((id *)buf);
  objc_sync_exit(v8);

}

void __80__CKContextRecentsPredictionManager_modeDidChangeToModeWithUUIDString_forCache___block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    v3 = WeakRetained;
    objc_sync_enter(v3);
    v4 = os_transaction_create();
    v5 = (void *)v3[6];
    v3[6] = v4;

    objc_msgSend(v3, "_handleModeChangeToModeWithUUIDString:forCache:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    v6 = (void *)v3[2];
    v3[2] = 0;

    objc_sync_exit(v3);
    WeakRetained = v7;
  }

}

- (void)_handleModeChangeToModeWithUUIDString:(id)a3 forCache:(id)a4
{
  id v6;
  id v7;
  CKContextRecentsCache *recentsCache;
  OS_os_transaction *suggestionDonationTransaction;
  _QWORD v10[4];
  id v11;
  CKContextRecentsPredictionManager *v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_21A9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Handling mode change to mode: %@", buf, 0xCu);
  }
  -[CKContextRecentsPredictionManager _clearSuggestions](self, "_clearSuggestions");
  if (objc_msgSend(v6, "length"))
  {
    objc_initWeak((id *)buf, self);
    recentsCache = self->_recentsCache;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __84__CKContextRecentsPredictionManager__handleModeChangeToModeWithUUIDString_forCache___block_invoke;
    v10[3] = &unk_24DD77230;
    objc_copyWeak(&v13, (id *)buf);
    v11 = v6;
    v12 = self;
    -[CKContextRecentsCache retrieveRecentsForPredictionWithReply:](recentsCache, "retrieveRecentsForPredictionWithReply:", v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    suggestionDonationTransaction = self->_suggestionDonationTransaction;
    self->_suggestionDonationTransaction = 0;

  }
}

void __84__CKContextRecentsPredictionManager__handleModeChangeToModeWithUUIDString_forCache___block_invoke(uint64_t a1, void *a2, void *a3)
{
  _QWORD *WeakRetained;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  objc_class *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_class *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_class *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  objc_class *v45;
  void *v46;
  void *v47;
  objc_class *v48;
  void *v49;
  _QWORD *v50;
  void *v51;
  _BOOL8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  id v65;
  id v66;
  id obj;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *context;
  void *v77;
  void *v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t buf[8];
  uint64_t v84;
  Class (*v85)(uint64_t);
  void *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t v91;
  _BYTE v92[128];
  uint64_t v93;

  v93 = *MEMORY[0x24BDAC8D0];
  v65 = a2;
  v73 = a3;
  v69 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (objc_msgSend(v65, "count") && objc_msgSend(v73, "count"))
    {
      v72 = WeakRetained;
      objc_msgSend(WeakRetained, "_recentsEligibleForDonationMatchingMode:fromRecents:uuidsToCounts:", *(_QWORD *)(a1 + 32), v65, v73);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v64, "count"))
      {
        objc_msgSend(WeakRetained, "_createClientModelIfNecessary");
        objc_msgSend(WeakRetained, "_retrieveModeConfigurations");
        v68 = objc_claimAutoreleasedReturnValue();
        v66 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v79 = 0u;
        v80 = 0u;
        v81 = 0u;
        v82 = 0u;
        obj = v64;
        v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
        if (v71)
        {
          v70 = *(_QWORD *)v80;
          do
          {
            for (i = 0; i != v71; ++i)
            {
              if (*(_QWORD *)v80 != v70)
                objc_enumerationMutation(obj);
              v7 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
              context = (void *)MEMORY[0x22074E22C]();
              v8 = objc_alloc(MEMORY[0x24BDD1960]);
              objc_msgSend(v7, "userActivityData");
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              v78 = (void *)objc_msgSend(v8, "_initWithUserActivityData:", v9);

              v88 = 0;
              v89 = &v88;
              v90 = 0x2050000000;
              v10 = (void *)getATXProactiveSuggestionClientModelSpecificationClass_softClass;
              v91 = getATXProactiveSuggestionClientModelSpecificationClass_softClass;
              if (!getATXProactiveSuggestionClientModelSpecificationClass_softClass)
              {
                *(_QWORD *)buf = MEMORY[0x24BDAC760];
                v84 = 3221225472;
                v85 = __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke;
                v86 = &unk_24DD77310;
                v87 = &v88;
                __getATXProactiveSuggestionClientModelSpecificationClass_block_invoke((uint64_t)buf);
                v10 = (void *)v89[3];
              }
              v11 = objc_retainAutorelease(v10);
              _Block_object_dispose(&v88, 8);
              v77 = (void *)objc_msgSend([v11 alloc], "initWithClientModelId:clientModelVersion:", CFSTR("ck_universal_recents"), CFSTR("1.0"));
              objc_msgSend(v7, "title");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v12, "length"))
              {
                objc_msgSend(v7, "uuid");
                v13 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "objectForKeyedSubscript:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "unsignedIntValue");

                objc_msgSend(v7, "modeIdentifier");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "_modeForModeIdentifier:withConfigurations:", v16, v68);
                v75 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v72, "_userFacingReasonStringForRecentWithNumberOfInstances:mode:", v15, v75);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "associatedBundleId");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                v88 = 0;
                v89 = &v88;
                v90 = 0x2050000000;
                v18 = (void *)getATXActionClass_softClass;
                v91 = getATXActionClass_softClass;
                if (!getATXActionClass_softClass)
                {
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  v84 = 3221225472;
                  v85 = __getATXActionClass_block_invoke;
                  v86 = &unk_24DD77310;
                  v87 = &v88;
                  __getATXActionClass_block_invoke((uint64_t)buf);
                  v18 = (void *)v89[3];
                }
                v19 = objc_retainAutorelease(v18);
                _Block_object_dispose(&v88, 8);
                v20 = [v19 alloc];
                v21 = objc_alloc(MEMORY[0x24BDD1880]);
                objc_msgSend(v7, "uuid");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = (void *)objc_msgSend(v21, "initWithUUIDString:", v22);
                LOBYTE(v63) = 0;
                v24 = (void *)objc_msgSend(v20, "initWithNSUserActivity:actionUUID:bundleId:contentAttributeSet:itemIdentifier:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v78, v23, v74, 0, 0, CFSTR("ck_universal_recents_mode"), 0, 0, v63, v12, v17);

                v88 = 0;
                v89 = &v88;
                v90 = 0x2050000000;
                v25 = (void *)getATXProactiveSuggestionExecutableSpecificationClass_softClass;
                v91 = getATXProactiveSuggestionExecutableSpecificationClass_softClass;
                if (!getATXProactiveSuggestionExecutableSpecificationClass_softClass)
                {
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  v84 = 3221225472;
                  v85 = __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke;
                  v86 = &unk_24DD77310;
                  v87 = &v88;
                  __getATXProactiveSuggestionExecutableSpecificationClass_block_invoke((uint64_t)buf);
                  v25 = (void *)v89[3];
                }
                v26 = objc_retainAutorelease(v25);
                _Block_object_dispose(&v88, 8);
                v27 = [v26 alloc];
                v28 = (void *)MEMORY[0x24BDD17C8];
                objc_msgSend(v7, "title");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "stringWithFormat:", CFSTR("Recent with title: %@"), v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "uuid");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = (void *)objc_msgSend(v27, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v24, v30, v31, 2);

                v88 = 0;
                v89 = &v88;
                v90 = 0x2050000000;
                v33 = (void *)getATXProactiveSuggestionUISpecificationClass_softClass;
                v91 = getATXProactiveSuggestionUISpecificationClass_softClass;
                if (!getATXProactiveSuggestionUISpecificationClass_softClass)
                {
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  v84 = 3221225472;
                  v85 = __getATXProactiveSuggestionUISpecificationClass_block_invoke;
                  v86 = &unk_24DD77310;
                  v87 = &v88;
                  __getATXProactiveSuggestionUISpecificationClass_block_invoke((uint64_t)buf);
                  v33 = (void *)v89[3];
                }
                v34 = objc_retainAutorelease(v33);
                _Block_object_dispose(&v88, 8);
                v35 = [v34 alloc];
                v88 = 0;
                v89 = &v88;
                v90 = 0x2050000000;
                v36 = (void *)getATXProactiveSuggestionLayoutConfigClass_softClass;
                v91 = getATXProactiveSuggestionLayoutConfigClass_softClass;
                if (!getATXProactiveSuggestionLayoutConfigClass_softClass)
                {
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  v84 = 3221225472;
                  v85 = __getATXProactiveSuggestionLayoutConfigClass_block_invoke;
                  v86 = &unk_24DD77310;
                  v87 = &v88;
                  __getATXProactiveSuggestionLayoutConfigClass_block_invoke((uint64_t)buf);
                  v36 = (void *)v89[3];
                }
                v37 = objc_retainAutorelease(v36);
                _Block_object_dispose(&v88, 8);
                objc_msgSend(v37, "layoutConfigurationsForLayoutOptions:", 40);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                LOWORD(v62) = 256;
                v39 = (void *)objc_msgSend(v35, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v12, v17, v17, v38, 1, 1, v62);

                v40 = *(void **)(v69 + 40);
                objc_msgSend(v7, "uuid");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v73, "objectForKeyedSubscript:", v41);
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v40, "_suggestionConfidenceForRecent:withCount:", v7, objc_msgSend(v42, "unsignedIntegerValue"));

                v88 = 0;
                v89 = &v88;
                v90 = 0x2050000000;
                v44 = (void *)getATXProactiveSuggestionScoreSpecificationClass_softClass;
                v91 = getATXProactiveSuggestionScoreSpecificationClass_softClass;
                if (!getATXProactiveSuggestionScoreSpecificationClass_softClass)
                {
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  v84 = 3221225472;
                  v85 = __getATXProactiveSuggestionScoreSpecificationClass_block_invoke;
                  v86 = &unk_24DD77310;
                  v87 = &v88;
                  __getATXProactiveSuggestionScoreSpecificationClass_block_invoke((uint64_t)buf);
                  v44 = (void *)v89[3];
                }
                v45 = objc_retainAutorelease(v44);
                _Block_object_dispose(&v88, 8);
                v46 = (void *)objc_msgSend([v45 alloc], "initWithRawScore:suggestedConfidenceCategory:", v43, 1.0);
                v88 = 0;
                v89 = &v88;
                v90 = 0x2050000000;
                v47 = (void *)getATXProactiveSuggestionClass_softClass;
                v91 = getATXProactiveSuggestionClass_softClass;
                if (!getATXProactiveSuggestionClass_softClass)
                {
                  *(_QWORD *)buf = MEMORY[0x24BDAC760];
                  v84 = 3221225472;
                  v85 = __getATXProactiveSuggestionClass_block_invoke;
                  v86 = &unk_24DD77310;
                  v87 = &v88;
                  __getATXProactiveSuggestionClass_block_invoke((uint64_t)buf);
                  v47 = (void *)v89[3];
                }
                v48 = objc_retainAutorelease(v47);
                _Block_object_dispose(&v88, 8);
                v49 = (void *)objc_msgSend([v48 alloc], "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v77, v32, v39, v46);
                if (v49)
                  objc_msgSend(v66, "addObject:", v49);

              }
              objc_autoreleasePoolPop(context);
            }
            v71 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v92, 16);
          }
          while (v71);
        }

        if (objc_msgSend(v66, "count"))
        {
          objc_msgSend(v72, "_updateBlendingLayerWithSuggestions:", v66);
          v50 = v72;
        }
        else
        {
          v50 = v72;
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21A9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "There were no new suggestions for ATX", buf, 2u);
          }
        }
        v61 = (void *)v50[6];
        v50[6] = 0;

        v60 = (void *)v68;
      }
      else
      {
        v52 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
        if (v52)
          __84__CKContextRecentsPredictionManager__handleModeChangeToModeWithUUIDString_forCache___block_invoke_cold_1(v52, v53, v54, v55, v56, v57, v58, v59);
        v60 = (void *)WeakRetained[6];
        WeakRetained[6] = 0;
      }

      WeakRetained = v72;
    }
    else
    {
      v51 = (void *)WeakRetained[6];
      WeakRetained[6] = 0;

    }
  }

}

- (void)_updateBlendingLayerWithSuggestions:(id)a3
{
  ATXProactiveSuggestionClientModel *clientModel;
  id v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  dispatch_block_t v9;
  id suggestionsClearingBlock;
  dispatch_time_t v11;
  _QWORD v12[4];
  id v13;
  id location;

  clientModel = self->_clientModel;
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (v6 >= 2)
    v7 = 2;
  else
    v7 = v6;
  objc_msgSend(v5, "subarrayWithRange:", 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXProactiveSuggestionClientModel updateSuggestions:completionHandler:](clientModel, "updateSuggestions:completionHandler:", v8, &__block_literal_global);
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke_35;
  v12[3] = &unk_24DD77298;
  objc_copyWeak(&v13, &location);
  v9 = dispatch_block_create((dispatch_block_flags_t)0, v12);
  suggestionsClearingBlock = self->_suggestionsClearingBlock;
  self->_suggestionsClearingBlock = v9;

  v11 = dispatch_time(0, 300000000000);
  dispatch_after(v11, (dispatch_queue_t)self->_suggestionReportingQueue, self->_suggestionsClearingBlock);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4;

  v4 = a3;
  if ((v4 || (a2 & 1) == 0) && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke_cold_1();

}

void __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke_35(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_clearSuggestions");
    v2 = (void *)v3[3];
    v3[3] = 0;

    WeakRetained = v3;
  }

}

- (id)_userFacingReasonStringForRecentWithNumberOfInstances:(unint64_t)a3 mode:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(v6, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    if (a3 > 4)
      -[CKContextRecentsPredictionManager _oftenUsedStringForMode:](self, "_oftenUsedStringForMode:", v6);
    else
      -[CKContextRecentsPredictionManager _recentlyUsedStringForMode:](self, "_recentlyUsedStringForMode:", v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 > 4)
      v10 = CFSTR("Often used during this Focus");
    else
      v10 = CFSTR("Recently used during this Focus");
    -[CKContextRecentsPredictionManager _localizedStringForKey:](self, "_localizedStringForKey:", v10);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v9;

  return v11;
}

- (id)_oftenUsedStringForMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v4 = a3;
  switch(objc_msgSend(v4, "semanticType"))
  {
    case -1:
      v5 = (void *)MEMORY[0x24BDD17C8];
      -[CKContextRecentsPredictionManager _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("Often used during %@ Focus"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v7);
      self = (CKContextRecentsPredictionManager *)objc_claimAutoreleasedReturnValue();

      break;
    case 0:
      v8 = CFSTR("Often used during Do Not Disturb");
      goto LABEL_13;
    case 1:
      v8 = CFSTR("Often used during Sleep Focus");
      goto LABEL_13;
    case 2:
      v8 = CFSTR("Often used during Driving Focus");
      goto LABEL_13;
    case 3:
      v8 = CFSTR("Often used during Fitness Focus");
      goto LABEL_13;
    case 4:
      v8 = CFSTR("Often used during Work Focus");
      goto LABEL_13;
    case 5:
      v8 = CFSTR("Often used during Personal Focus");
      goto LABEL_13;
    case 6:
      v8 = CFSTR("Often used during Reading Focus");
      goto LABEL_13;
    case 7:
      v8 = CFSTR("Often used during Gaming Focus");
      goto LABEL_13;
    case 8:
      v8 = CFSTR("Often used during Mindfulness Focus");
      goto LABEL_13;
    case 9:
      v8 = CFSTR("Often used during Reduce Interruptions Focus");
LABEL_13:
      -[CKContextRecentsPredictionManager _localizedStringForKey:](self, "_localizedStringForKey:", v8);
      self = (CKContextRecentsPredictionManager *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return self;
}

- (id)_recentlyUsedStringForMode:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v4 = a3;
  switch(objc_msgSend(v4, "semanticType"))
  {
    case -1:
      v5 = (void *)MEMORY[0x24BDD17C8];
      -[CKContextRecentsPredictionManager _localizedStringForKey:](self, "_localizedStringForKey:", CFSTR("Recently used during %@ Focus"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", v6, v7);
      self = (CKContextRecentsPredictionManager *)objc_claimAutoreleasedReturnValue();

      break;
    case 0:
      v8 = CFSTR("Recently used during Do Not Disturb");
      goto LABEL_13;
    case 1:
      v8 = CFSTR("Recently used during Sleep Focus");
      goto LABEL_13;
    case 2:
      v8 = CFSTR("Recently used during Driving Focus");
      goto LABEL_13;
    case 3:
      v8 = CFSTR("Recently used during Fitness Focus");
      goto LABEL_13;
    case 4:
      v8 = CFSTR("Recently used during Work Focus");
      goto LABEL_13;
    case 5:
      v8 = CFSTR("Recently used during Personal Focus");
      goto LABEL_13;
    case 6:
      v8 = CFSTR("Recently used during Reading Focus");
      goto LABEL_13;
    case 7:
      v8 = CFSTR("Recently used during Gaming Focus");
      goto LABEL_13;
    case 8:
      v8 = CFSTR("Recently used during Mindfulness Focus");
      goto LABEL_13;
    case 9:
      v8 = CFSTR("Recently used during Reduce Interruptions Focus");
LABEL_13:
      -[CKContextRecentsPredictionManager _localizedStringForKey:](self, "_localizedStringForKey:", v8);
      self = (CKContextRecentsPredictionManager *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      break;
  }

  return self;
}

- (int64_t)_suggestionConfidenceForRecent:(id)a3 withCount:(unint64_t)a4
{
  id v5;
  int64_t v6;
  _BOOL4 v7;

  v5 = a3;
  if (a4 < 0xB)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG);
    if (a4 < 6)
    {
      if (v7)
        -[CKContextRecentsPredictionManager _suggestionConfidenceForRecent:withCount:].cold.3(v5);
      v6 = 2;
    }
    else
    {
      if (v7)
        -[CKContextRecentsPredictionManager _suggestionConfidenceForRecent:withCount:].cold.2(v5);
      v6 = 3;
    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[CKContextRecentsPredictionManager _suggestionConfidenceForRecent:withCount:].cold.1(v5);
    v6 = 4;
  }

  return v6;
}

- (id)eligiblePredictionsMatchingMode:(id)a3 forRecents:(id)a4 uuidsToCounts:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "count"))
  {
    -[CKContextRecentsPredictionManager _recentsEligibleForDonationMatchingMode:fromRecents:uuidsToCounts:](self, "_recentsEligibleForDonationMatchingMode:fromRecents:uuidsToCounts:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v11;
}

- (void)retrievePredictionsForMode:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  id v8;
  CKContextRecentsCache *recentsCache;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (objc_msgSend(v6, "length"))
    {
      v8 = v6;
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("Custom")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("Unknown")) & 1) == 0
        && (objc_msgSend(v8, "isEqualToString:", CFSTR("Default")) & 1) == 0
        && ((objc_msgSend(v8, "isEqualToString:", CFSTR("Home")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Working")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Exercising")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Driving")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Bedtime")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Gaming")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Reading")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Traveling")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Learning")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Streaming")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("ScreenSharing")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("ScreenRecording")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("AirPlayMirroring")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("Mindfulness")) & 1) != 0
         || (objc_msgSend(v8, "isEqualToString:", CFSTR("ReduceInterruptions")) & 1) != 0))
      {

        objc_initWeak(&location, self);
        recentsCache = self->_recentsCache;
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __74__CKContextRecentsPredictionManager_retrievePredictionsForMode_withReply___block_invoke;
        v10[3] = &unk_24DD772C0;
        objc_copyWeak(&v13, &location);
        v12 = v7;
        v11 = v8;
        -[CKContextRecentsCache retrieveRecentsForPredictionWithReply:](recentsCache, "retrieveRecentsForPredictionWithReply:", v10);

        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        goto LABEL_8;
      }

    }
    (*((void (**)(id, _QWORD))v7 + 2))(v7, MEMORY[0x24BDBD1A8]);
  }
LABEL_8:

}

void __74__CKContextRecentsPredictionManager_retrievePredictionsForMode_withReply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && objc_msgSend(v9, "count") && objc_msgSend(v5, "count"))
  {
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(WeakRetained, "_recentsEligibleForDonationMatchingMode:fromRecents:uuidsToCounts:", *(_QWORD *)(a1 + 32), v9, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (id)_recentsEligibleForDonationMatchingMode:(id)a3 fromRecents:(id)a4 uuidsToCounts:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  id v33;
  void *v34;
  void *v35;
  int v36;
  int v37;
  NSObject *v38;
  const char *v39;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  double v46;
  double v47;
  _BOOL4 v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  void *v53;
  id v54;
  id v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  id obj;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint8_t buf[4];
  unint64_t v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v61 = a5;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v71 = (unint64_t)v7;
    _os_log_impl(&dword_21A9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "🔮 Finding recents eligible prediction for mode: %@", buf, 0xCu);
  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v67 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v15, "modeIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isEqualToString:", v7);

        if (v17)
          objc_msgSend(v9, "addObject:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v66, v77, 16);
    }
    while (v12);
  }

  if (!objc_msgSend(v9, "count"))
  {
    v51 = (void *)MEMORY[0x24BDBD1A8];
    goto LABEL_61;
  }
  v54 = v10;
  objc_msgSend(v9, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDBCE60];
  v53 = v18;
  objc_msgSend(v18, "absoluteTimestamp");
  objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v9;
  v56 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v9, "reverseObjectEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
  if (!v20)
    goto LABEL_56;
  v21 = v20;
  v22 = MEMORY[0x24BDACB70];
  v23 = *(_QWORD *)v63;
  do
  {
    for (j = 0; j != v21; ++j)
    {
      if (*(_QWORD *)v63 != v23)
        objc_enumerationMutation(obj);
      v25 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v25, "associatedBundleId");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v25, "absoluteTimestamp");
        objc_msgSend(v27, "dateWithTimeIntervalSinceReferenceDate:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v71 = (unint64_t)v7;
        v72 = 2112;
        v73 = v26;
        v74 = 2112;
        v75 = v28;
        _os_log_impl(&dword_21A9DC000, v22, OS_LOG_TYPE_INFO, "Considering recent for mode: %@ from bundle: %@, date: %@", buf, 0x20u);

      }
      objc_msgSend(v25, "uuid");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v61, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "unsignedIntValue");
      v32 = v31;

      if (v31 - 33 > 0xFFFFFFDF)
      {
        v33 = objc_alloc(MEMORY[0x24BDD1960]);
        objc_msgSend(v25, "userActivityData");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (void *)objc_msgSend(v33, "_initWithUserActivityData:", v34);

        if (v35)
        {
          v36 = objc_msgSend(v35, "isEligibleForPrediction");
          v37 = objc_msgSend(v35, "isEligibleForPublicIndexing");
          if ((v36 & 1) != 0 || (v37 & 1) != 0)
          {
            if ((v37 & ~v36) != 1 || v32 > 4)
            {
              objc_msgSend(v35, "expirationDate");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x24BDBCE60], "date");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (v41
                && (objc_msgSend(v41, "earlierDate:", v42),
                    v43 = (void *)objc_claimAutoreleasedReturnValue(),
                    v43,
                    v43 == v41))
              {
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21A9DC000, v22, OS_LOG_TYPE_INFO, "--- rejecting because past expiration date", buf, 2u);
                }
              }
              else
              {
                objc_msgSend(v25, "associatedBundleId");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v44, "length")
                  && !objc_msgSend((id)kBundleIdentifiersToNotSuggest, "containsObject:", v44))
                {
                  v58 = (void *)MEMORY[0x24BDBCE60];
                  objc_msgSend(v25, "absoluteTimestamp");
                  objc_msgSend(v58, "dateWithTimeIntervalSinceReferenceDate:");
                  v59 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "timeIntervalSinceDate:", v57);
                  v47 = fabs(v46);
                  v48 = os_log_type_enabled(v22, OS_LOG_TYPE_INFO);
                  if (v47 <= 1800.0)
                  {
                    if (v48)
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_21A9DC000, v22, OS_LOG_TYPE_INFO, "--- accepting as valid candidate", buf, 2u);
                    }
                    objc_msgSend(v56, "addObject:", v25);
                  }
                  else if (v48)
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_21A9DC000, v22, OS_LOG_TYPE_INFO, "--- rejecting because too old", buf, 2u);
                  }

                }
                else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21A9DC000, v22, OS_LOG_TYPE_INFO, "--- rejecting because bundle identifier is not allowed", buf, 2u);
                }

              }
            }
            else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              v38 = v22;
              v39 = "--- rejecting publicly indexable prediction due to insufficient count";
LABEL_41:
              _os_log_impl(&dword_21A9DC000, v38, OS_LOG_TYPE_INFO, v39, buf, 2u);
            }
          }
          else if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v38 = v22;
            v39 = "--- rejecting because ineligible for predictions or public indexing";
            goto LABEL_41;
          }
        }

        continue;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v71 = v31;
        _os_log_impl(&dword_21A9DC000, v22, OS_LOG_TYPE_INFO, "--- rejecting due to occurence count: %lu", buf, 0xCu);
      }
    }
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
  }
  while (v21);
LABEL_56:

  v49 = objc_msgSend(v56, "count");
  if (v49 >= 2)
    v50 = 2;
  else
    v50 = v49;
  objc_msgSend(v56, "subarrayWithRange:", 0, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v54;
  v9 = v55;
LABEL_61:

  return v51;
}

- (id)_localizedStringForKey:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/ContextKitPrediction.framework"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_createDoNotDisturbServiceIfNecessary
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21A9DC000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not obtain reference to DNDModeConfigurationService", v0, 2u);
  OUTLINED_FUNCTION_5();
}

- (id)_retrieveModeConfigurations
{
  DNDModeConfigurationService *dndService;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  id v8;
  id v10;

  -[CKContextRecentsPredictionManager _createDoNotDisturbServiceIfNecessary](self, "_createDoNotDisturbServiceIfNecessary");
  dndService = self->_dndService;
  v10 = 0;
  -[DNDModeConfigurationService modeConfigurationsReturningError:](dndService, "modeConfigurationsReturningError:", &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 0;
  if (v7)
  {
    v8 = v4;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[CKContextRecentsPredictionManager _retrieveModeConfigurations].cold.1();
    v8 = 0;
  }

  return v8;
}

- (id)_modeForModeIdentifier:(id)a3 withConfigurations:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, void *, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length")
    && (objc_msgSend(v6, "allKeys"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v8))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __79__CKContextRecentsPredictionManager__modeForModeIdentifier_withConfigurations___block_invoke;
    v14 = &unk_24DD772E8;
    v15 = v5;
    v16 = &v17;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", &v11);
    objc_msgSend((id)v18[5], "mode", v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __79__CKContextRecentsPredictionManager__modeForModeIdentifier_withConfigurations___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "mode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v10)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }

}

- (CKContextRecentsCache)recentsCache
{
  return self->_recentsCache;
}

- (CKContextRecentsPredictionManagerDelegate)delegate
{
  return (CKContextRecentsPredictionManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentsCache, 0);
  objc_storeStrong((id *)&self->_suggestionDonationTransaction, 0);
  objc_storeStrong((id *)&self->_dndService, 0);
  objc_storeStrong((id *)&self->_suggestionReportingQueue, 0);
  objc_storeStrong(&self->_suggestionsClearingBlock, 0);
  objc_storeStrong(&self->_suggestionsContributionBlock, 0);
  objc_storeStrong((id *)&self->_clientModel, 0);
}

void __84__CKContextRecentsPredictionManager__handleModeChangeToModeWithUUIDString_forCache___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_21A9DC000, MEMORY[0x24BDACB70], a3, "No eligible recents for donation.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_5();
}

void __73__CKContextRecentsPredictionManager__updateBlendingLayerWithSuggestions___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21A9DC000, MEMORY[0x24BDACB70], v0, "Error updating suggestions to ATX: %@", v1, v2, v3, v4, v5);
}

- (void)_suggestionConfidenceForRecent:(void *)a1 withCount:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "uuid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21A9DC000, MEMORY[0x24BDACB70], v2, "Reporting high confidence for recent: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_suggestionConfidenceForRecent:(void *)a1 withCount:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "uuid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21A9DC000, MEMORY[0x24BDACB70], v2, "Reporting medium confidence for recent: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_suggestionConfidenceForRecent:(void *)a1 withCount:.cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  objc_msgSend(a1, "uuid");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_21A9DC000, MEMORY[0x24BDACB70], v2, "Reporting low confidence for recent: %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_1();
}

- (void)_retrieveModeConfigurations
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2(&dword_21A9DC000, MEMORY[0x24BDACB70], v0, "Could not obtain mode configurations: %{public}@", v1, v2, v3, v4, v5);
}

@end
