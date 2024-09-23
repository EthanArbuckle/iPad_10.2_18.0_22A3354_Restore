@implementation ATXHeuristicActionProducer

void __34__ATXHeuristicActionProducer_init__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint8_t v4[16];

  __atxlog_handle_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_INFO, "ATXHeuristicResultCacheExpiredSomethingNotification", v4, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

- (void)coalescedProduceActions
{
  id v2;
  NSObject *v3;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ATXHeuristicActionProducer_coalescedProduceActions__block_invoke;
  block[3] = &unk_1E82E00B0;
  block[4] = self;
  if (-[ATXHeuristicActionProducer coalescedProduceActions]::_pasOnceToken5 != -1)
    dispatch_once(&-[ATXHeuristicActionProducer coalescedProduceActions]::_pasOnceToken5, block);
  v2 = (id)-[ATXHeuristicActionProducer coalescedProduceActions]::_pasExprOnceResult;
  objc_msgSend(v2, "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
  __atxlog_handle_heuristic();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v6 = 0x3FF0000000000000;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXHeuristicActionProducer triggering coalesced produceActions in %f seconds", buf, 0xCu);
  }

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ATXHeuristicActionProducer_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[ATXHeuristicActionProducer sharedInstance]::_pasOnceToken2 != -1)
    dispatch_once(&+[ATXHeuristicActionProducer sharedInstance]::_pasOnceToken2, block);
  return (id)+[ATXHeuristicActionProducer sharedInstance]::_pasExprOnceResult;
}

void __44__ATXHeuristicActionProducer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)+[ATXHeuristicActionProducer sharedInstance]::_pasExprOnceResult;
  +[ATXHeuristicActionProducer sharedInstance]::_pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXHeuristicActionProducer)init
{
  ATXHeuristicActionProducer *v2;
  void *v3;
  uint64_t v4;
  id expireNotificationHandle;
  ATXHeuristicActionProducer *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ATXHeuristicActionProducer;
  v2 = -[ATXHeuristicActionProducer init](&v14, sel_init);
  if (v2)
  {
    if ((objc_msgSend(MEMORY[0x1E0CF8D98], "shouldComputeActions") & 1) == 0)
    {
      v6 = 0;
      goto LABEL_6;
    }
    objc_initWeak(&location, v2);
    v3 = (void *)MEMORY[0x1E0CF4F18];
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __34__ATXHeuristicActionProducer_init__block_invoke;
    v11 = &unk_1E82E0088;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v3, "addCacheExpirerNotification:", &v8);
    v4 = objc_claimAutoreleasedReturnValue();
    expireNotificationHandle = v2->_expireNotificationHandle;
    v2->_expireNotificationHandle = (id)v4;

    -[ATXHeuristicActionProducer setUpdateJobForCriteria:](v2, "setUpdateJobForCriteria:", *MEMORY[0x1E0C80748], v8, v9, v10, v11);
    -[ATXHeuristicActionProducer invalidateOnGlobalQueueWithDelay:](v2, "invalidateOnGlobalQueueWithDelay:", 5.0);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v6 = v2;
LABEL_6:

  return v6;
}

- (void)invalidateOnGlobalQueueWithDelay:(double)a3
{
  void *v5;
  void *v6;
  _QWORD v7[5];

  v5 = (void *)MEMORY[0x1E0D81598];
  dispatch_get_global_queue(9, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__ATXHeuristicActionProducer_invalidateOnGlobalQueueWithDelay___block_invoke;
  v7[3] = &unk_1E82E00B0;
  v7[4] = self;
  objc_msgSend(v5, "runAsyncOnQueue:afterDelaySeconds:block:", v6, v7, a3);

}

uint64_t __63__ATXHeuristicActionProducer_invalidateOnGlobalQueueWithDelay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  __atxlog_handle_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "ATXHeuristicActionProducer delayed invalidation upon init", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_expireNotificationHandle);

  v4.receiver = self;
  v4.super_class = (Class)ATXHeuristicActionProducer;
  -[ATXHeuristicActionProducer dealloc](&v4, sel_dealloc);
}

- (id)digitalHealthBlacklist
{
  return +[ATXDigitalHealthBlacklist sharedInstance](ATXDigitalHealthBlacklist, "sharedInstance");
}

- (id)actionPredictionBlacklist
{
  return +[ATXActionPredictionBlacklist sharedInstanceWithAppPredictionBlacklist](ATXActionPredictionBlacklist, "sharedInstanceWithAppPredictionBlacklist");
}

- (id)bundleIdForAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "_bundleIdForDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(v3, "bundleId");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  ATXBundleIdReplacementForBundleId();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isActionBlacklisted:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;

  -[ATXHeuristicActionProducer bundleIdForAction:](self, "bundleIdForAction:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicActionProducer digitalHealthBlacklist](self, "digitalHealthBlacklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blacklistedBundleIds");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[ATXHeuristicActionProducer actionPredictionBlacklist](self, "actionPredictionBlacklist");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isBundleIdBlacklisted:", v4);

  }
  return v7;
}

- (BOOL)userAlreadyEngagedWithAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  char v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CF9080], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recentActions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v3);

  return v6;
}

void __53__ATXHeuristicActionProducer_coalescedProduceActions__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = dispatch_queue_create("ATXUpdateActionPredictionCache", v4);
  v6 = objc_alloc(MEMORY[0x1E0D81618]);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ATXHeuristicActionProducer_coalescedProduceActions__block_invoke_2;
  v9[3] = &unk_1E82E00B0;
  v9[4] = *(_QWORD *)(a1 + 32);
  v7 = objc_msgSend(v6, "initWithQueue:operation:", v5, v9);

  v8 = (void *)-[ATXHeuristicActionProducer coalescedProduceActions]::_pasExprOnceResult;
  -[ATXHeuristicActionProducer coalescedProduceActions]::_pasExprOnceResult = v7;

  objc_autoreleasePoolPop(v2);
}

id __53__ATXHeuristicActionProducer_coalescedProduceActions__block_invoke_2(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "produceActions");
}

- (id)produceActions
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  unint64_t v17;
  int v18;
  uint64_t v19;
  void *v20;
  char v21;
  ATXActionResult *v22;
  NSObject *v23;
  float v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  unint64_t v30;
  unint64_t v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE buf[12];
  __int16 v47;
  double v48;
  int v49;
  __int16 v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  sel_getName(a2);
  v37 = (void *)os_transaction_create();
  v3 = objc_opt_new();
  v4 = (void *)MEMORY[0x1E0CF4F18];
  v39 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionsWithLocationManager:", v5);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_heuristic();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend(v38, "count", v37);
    v47 = 2112;
    v48 = *(double *)&v38;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Got %tu heuristic predictions: %@", buf, 0x16u);
  }

  if (!v38)
  {
    v32 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_37;
  }
  v40 = (void *)objc_opt_new();
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v38;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (!v7)
    goto LABEL_28;
  v8 = *(_QWORD *)v43;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v43 != v8)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
      if (-[ATXHeuristicActionProducer isActionBlacklisted:](self, "isActionBlacklisted:", v10, v37))
      {
        __atxlog_handle_heuristic();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v10;
          _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Heuristic action %@ is blacklisted.", buf, 0xCu);
        }
LABEL_25:

        continue;
      }
      if (!-[ATXHeuristicActionProducer userAlreadyEngagedWithAction:](self, "userAlreadyEngagedWithAction:", v10))
      {
        v13 = objc_alloc(MEMORY[0x1E0CF9090]);
        v14 = (void *)objc_opt_class();
        objc_msgSend(v10, "heuristic");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "generateScoreForHeuristic:", v15);
        *(float *)&v16 = v16;
        v11 = objc_msgSend(v13, "initWithPredictedItem:score:", v10, v16);

        v17 = +[ATXHeuristicActionProducer actionExperienceForScoredHeuristicAction:](ATXHeuristicActionProducer, "actionExperienceForScoredHeuristicAction:", v11);
        if (v17 - 1 > 1)
        {
          __atxlog_handle_heuristic();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            -[NSObject score](v11, "score");
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v10;
            v47 = 2048;
            v48 = v24;
            _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, "Action is not medium or high confidence: %@ score: %f", buf, 0x16u);
          }

        }
        else
        {
          -[NSObject score](v11, "score");
          *(_QWORD *)buf = CFSTR("heuristic");
          v49 = v18;
          v19 = 16;
          v50 = 0;
          do
          {
            *(float *)&buf[v19] = -31337.0;
            v19 += 4;
          }
          while (v19 != 3284);
          objc_msgSend(v10, "heuristic");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("bestAppHandoff:unknown"));

          if ((v21 & 1) == 0)
          {
            LOBYTE(v50) = v17 == 2;
            HIBYTE(v50) = v17 == 1;
          }
          v22 = -[ATXActionResult initWithScoredAction:predictionItem:actionKey:]([ATXActionResult alloc], "initWithScoredAction:predictionItem:actionKey:", v11, buf, CFSTR("heuristic"));
          objc_msgSend(v39, "addObject:", v22);
          objc_msgSend(v40, "addObject:", v10);

        }
        goto LABEL_25;
      }
      __atxlog_handle_heuristic();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v10;
        _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "User already engaged with action. Not going to surface action: %@", buf, 0xCu);
      }

      objc_msgSend(v40, "addObject:", v10);
    }
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  }
  while (v7);
LABEL_28:

  __atxlog_handle_heuristic();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v26 = objc_msgSend(v39, "count");
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v26;
    v47 = 2112;
    v48 = *(double *)&v39;
    _os_log_impl(&dword_1C9A3B000, v25, OS_LOG_TYPE_DEFAULT, "Got %tu action results: %@", buf, 0x16u);
  }

  ATXSortedActionResults(v39);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "maxHeuristicAppActionCount");

  v30 = objc_msgSend(v39, "count");
  if (v30 >= v29)
    v31 = v29;
  else
    v31 = v30;
  objc_msgSend(v27, "subarrayWithRange:", 0, v31, v37);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_heuristic();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    v34 = objc_msgSend(v32, "count");
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = v34;
    v47 = 2112;
    v48 = *(double *)&v32;
    _os_log_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEFAULT, "Got %tu action results after sorting and filtering: %@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CF9080], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "clearRecentHeuristicEngagementsExceptForActions:", v40);

  +[ATXActionBlendingUpdater updateBlendingLayerWithHeuristicPredictions:](ATXActionBlendingUpdater, "updateBlendingLayerWithHeuristicPredictions:", v32);
  -[ATXHeuristicActionProducer scheduleNextHeuristicRefreshGivenActions:](self, "scheduleNextHeuristicRefreshGivenActions:", v32);

LABEL_37:
  return v32;
}

+ (unint64_t)actionExperienceForScoredHeuristicAction:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = +[ATXDisplayCacheLockscreenFilter _getPredictionConfidenceForActions:](ATXDisplayCacheLockscreenFilter, "_getPredictionConfidenceForActions:", v4);

  return v5;
}

+ (double)generateScoreForHeuristic:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  int v23;
  id v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "histogramForLaunchType:", 35);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "histogramForLaunchType:", 36);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v33[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }
  objc_msgSend(v6, "totalLaunchesForBundleIds:", v8);
  v10 = v9;
  objc_msgSend(v7, "totalLaunchesForBundleIds:", v8);
  v12 = v11;
  objc_msgSend(v6, "totalLaunches");
  v14 = v13;
  objc_msgSend(v7, "totalLaunches");
  v16 = v15;
  __atxlog_handle_heuristic();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138544386;
    v24 = v3;
    v25 = 2048;
    v26 = v10;
    v27 = 2048;
    v28 = v12;
    v29 = 2048;
    v30 = v14;
    v31 = 2048;
    v32 = v16;
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "Heuristic: %{public}@ confirms: %f rejects: %f total confirms: %f rejects: %f", (uint8_t *)&v23, 0x34u);
  }

  objc_msgSend(v4, "heuristicsBaseScore");
  v19 = v18;
  +[_ATXActionUtils computeNormalizedBetaDistEngagementScoreWithPriorAlpha:priorBeta:confirms:rejects:totalConfirms:totalRejects:](_ATXActionUtils, "computeNormalizedBetaDistEngagementScoreWithPriorAlpha:priorBeta:confirms:rejects:totalConfirms:totalRejects:", objc_msgSend(v4, "heuristicsEngagementPriorAlpha"), objc_msgSend(v4, "heuristicsEngagementPriorBeta"), v10, v12, v14, v16);
  v21 = v20;

  return v19 * v21;
}

- (void)scheduleNextHeuristicRefreshGivenActions:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[ATXHeuristicActionProducer firstUpdateDateForActions:](self, "firstUpdateDateForActions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    __atxlog_handle_heuristic();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Scheduling next ATXHeuristicActionProducer refresh for date: %@", (uint8_t *)&v7, 0xCu);
    }

    -[ATXHeuristicActionProducer _criteriaForJobOnDate:](self, "_criteriaForJobOnDate:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHeuristicActionProducer setUpdateJobForCriteria:](self, "setUpdateJobForCriteria:", v6);

  }
}

- (void)setUpdateJobForCriteria:(id)a3
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __54__ATXHeuristicActionProducer_setUpdateJobForCriteria___block_invoke;
  handler[3] = &unk_1E82E00D8;
  handler[4] = self;
  xpc_activity_register("com.apple.duetexpertd.heuristicactionproducer-refresh", a3, handler);
}

void __54__ATXHeuristicActionProducer_setUpdateJobForCriteria___block_invoke(uint64_t a1, void *a2)
{
  _xpc_activity_s *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  v3 = a2;
  if (xpc_activity_get_state(v3) == 2 && (objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) == 0)
  {
    __atxlog_handle_heuristic();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXHeuristicActionProducer producing actions due to prescheduled CTS update job.", v6, 2u);
    }

    v5 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(*(id *)(a1 + 32), "coalescedProduceActions");
    objc_autoreleasePoolPop(v5);
  }

}

- (id)firstUpdateDateForActions:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void (**v6)(void *, void *);
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _QWORD aBlock[4];
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__37;
  v30 = __Block_byref_object_dispose__37;
  v31 = 0;
  v4 = (void *)objc_opt_new();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__ATXHeuristicActionProducer_firstUpdateDateForActions___block_invoke;
  aBlock[3] = &unk_1E82E0100;
  v5 = v4;
  v24 = v5;
  v25 = &v26;
  v6 = (void (**)(void *, void *))_Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0CF4F18], "nextCacheExpirationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v7);

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v3;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v20;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v11), "scoredAction", (_QWORD)v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predictedItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "criteria");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v15);

        objc_msgSend(v14, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v6[2](v6, v16);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v32, 16);
    }
    while (v9);
  }

  v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

void __56__ATXHeuristicActionProducer_firstUpdateDateForActions___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v9 = v3;
    objc_msgSend(v3, "earlierDate:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);

    v4 = v9;
    if (v5 == v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "earlierDate:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v8 = v7;
      else
        v8 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v8);

      v4 = v9;
    }
  }

}

- (id)_criteriaForJobOnDate:(id)a3
{
  double v3;
  double v4;
  xpc_object_t v5;

  objc_msgSend(a3, "timeIntervalSinceNow");
  v4 = v3;
  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80760], (uint64_t)v4);
  xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E0C80790], 300);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C808B8], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80738], 1);
  xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E0C80898], 0);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_expireNotificationHandle, 0);
}

@end
