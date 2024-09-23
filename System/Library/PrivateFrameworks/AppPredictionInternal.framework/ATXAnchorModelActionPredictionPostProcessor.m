@implementation ATXAnchorModelActionPredictionPostProcessor

- (ATXAnchorModelActionPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3
{
  id v4;
  void *v5;
  ATXAnchorModelActionPredictionPostProcessor *v6;

  v4 = a3;
  +[ATXActionPredictionBlacklist sharedInstanceWithAppPredictionBlacklist](ATXActionPredictionBlacklist, "sharedInstanceWithAppPredictionBlacklist");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXAnchorModelActionPredictionPostProcessor initWithAnchorModelPrediction:blacklist:](self, "initWithAnchorModelPrediction:blacklist:", v4, v5);

  return v6;
}

- (ATXAnchorModelActionPredictionPostProcessor)initWithAnchorModelPrediction:(id)a3 blacklist:(id)a4
{
  id v7;
  id v8;
  ATXAnchorModelActionPredictionPostProcessor *v9;
  ATXAnchorModelActionPredictionPostProcessor *v10;
  uint64_t v11;
  ATXAnchorModelDataStoreWrapper *storeWrapper;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)ATXAnchorModelActionPredictionPostProcessor;
  v9 = -[ATXAnchorModelActionPredictionPostProcessor init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_anchorModelPrediction, a3);
    v11 = objc_opt_new();
    storeWrapper = v10->_storeWrapper;
    v10->_storeWrapper = (ATXAnchorModelDataStoreWrapper *)v11;

    objc_storeStrong((id *)&v10->_blacklist, a4);
  }

  return v10;
}

- (id)recoverATXScoredAction
{
  uint64_t *p_anchorModelPrediction;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;

  p_anchorModelPrediction = (uint64_t *)&self->_anchorModelPrediction;
  -[ATXAnchorModelPrediction candidateType](self->_anchorModelPrediction, "candidateType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("action"));

  if (v5)
  {
    -[ATXAnchorModelDataStoreWrapper scoredActionFromAnchorModelPrediction:](self->_storeWrapper, "scoredActionFromAnchorModelPrediction:", self->_anchorModelPrediction);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      __atxlog_handle_anchor();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        -[ATXAnchorModelActionPredictionPostProcessor recoverATXScoredAction].cold.1(p_anchorModelPrediction, v9);

    }
  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (id)postProcessScoredAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  ATXAnchorModelPrediction *anchorModelPrediction;
  const char *v14;
  void *v15;
  ATXAnchorModelPrediction *v17;
  int v18;
  ATXAnchorModelPrediction *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    return 0;
  v5 = v4;
  objc_msgSend(v4, "predictedItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "intent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_7;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v5, "predictedItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "intent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "shouldPredictIntent:", v10);

  if ((v11 & 1) != 0)
  {
    if (-[ATXAnchorModelActionPredictionPostProcessor scoredActionIsBlacklisted:](self, "scoredActionIsBlacklisted:", v5))
    {
      __atxlog_handle_anchor();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        anchorModelPrediction = self->_anchorModelPrediction;
        v18 = 138412290;
        v19 = anchorModelPrediction;
        v14 = "Suppresing anchor model prediction because scoredAction is blacklisted. Prediction: %@";
LABEL_10:
        _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 0xCu);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
LABEL_7:
    -[ATXAnchorModelActionPredictionPostProcessor replaceActionWithUpcomingMediaIfNeeded:](self, "replaceActionWithUpcomingMediaIfNeeded:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    return v15;
  }
  __atxlog_handle_anchor();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = self->_anchorModelPrediction;
    v18 = 138412290;
    v19 = v17;
    v14 = "Suppresing anchor model prediction because action valuation says we shouldn't predict the intent. Prediction: %@";
    goto LABEL_10;
  }
LABEL_11:

  return 0;
}

- (BOOL)scoredActionIsBlacklisted:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "predictedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:](_ATXActionUtils, "getBundleIdAndActionTypeFromActionKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      LOBYTE(self) = 1;
      goto LABEL_7;
    }
    objc_msgSend(v7, "first");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "second");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(self) = !-[ATXActionPredictionBlacklist shouldPredictBundleId:action:](self->_blacklist, "shouldPredictBundleId:action:", v9, v10);

  }
  else
  {
    self = (ATXAnchorModelActionPredictionPostProcessor *)self->_blacklist;
    objc_msgSend(v4, "predictedItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self) = -[ATXAnchorModelActionPredictionPostProcessor isBundleIdBlacklisted:](self, "isBundleIdBlacklisted:", v9);
  }

LABEL_7:
  return (char)self;
}

- (id)replaceActionWithUpcomingMediaIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  ATXAnchorModelPrediction *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  ATXAnchorModelPrediction *v23;
  void *v24;
  void *v25;
  ATXAnchorModelPrediction *anchorModelPrediction;
  int v28;
  ATXAnchorModelPrediction *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "predictedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "intent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXAnchorModelActionPredictionPostProcessor shouldCheckUpcomingMediaForIntent:](self, "shouldCheckUpcomingMediaForIntent:", v6);

  if (v7)
  {
    __atxlog_handle_anchor();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Checking Upcoming Media for Anchor Model prediction...", (uint8_t *)&v28, 2u);
    }

    objc_msgSend(v4, "predictedItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "predictedItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "intent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAnchorModelActionPredictionPostProcessor replacementIntentFromUpcomingMediaForBundleId:intent:](self, "replacementIntentFromUpcomingMediaForBundleId:intent:", v10, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[ATXAnchorModelActionPredictionPostProcessor replacementActionWithResolvedMediaIntentContainer:originalAction:](self, "replacementActionWithResolvedMediaIntentContainer:originalAction:", v13, v4);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_anchor();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_INFO, "Updating Anchor Model prediction with Upcoming Media...", (uint8_t *)&v28, 2u);
      }

      __atxlog_handle_anchor();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v4, "predictedItem");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "actionTitle");
        v18 = (ATXAnchorModelPrediction *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "predictedItem");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "actionSubtitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412546;
        v29 = v18;
        v30 = 2112;
        v31 = v20;
        _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_INFO, "Old action title: %@, subtitle: %@", (uint8_t *)&v28, 0x16u);

      }
      __atxlog_handle_anchor();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v14, "predictedItem");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "actionTitle");
        v23 = (ATXAnchorModelPrediction *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "predictedItem");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "actionSubtitle");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138412546;
        v29 = v23;
        v30 = 2112;
        v31 = v25;
        _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "New action title: %@, subtitle: %@", (uint8_t *)&v28, 0x16u);

      }
    }
    else
    {
      __atxlog_handle_anchor();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        anchorModelPrediction = self->_anchorModelPrediction;
        v28 = 138412290;
        v29 = anchorModelPrediction;
        _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "Suppresing Anchor Model prediction because of Upcoming Media. Prediction: %@", (uint8_t *)&v28, 0xCu);
      }
      v14 = 0;
    }

  }
  else
  {
    v14 = v4;
  }

  return v14;
}

- (BOOL)shouldCheckUpcomingMediaForIntent:(id)a3
{
  id v3;
  BOOL v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  if (!v3)
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelActionPredictionPostProcessor shouldCheckUpcomingMediaForIntent:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[ATXAnchorModelActionPredictionPostProcessor shouldCheckUpcomingMediaForIntent:].cold.2(v5, v13, v14, v15, v16, v17, v18, v19);
LABEL_8:

    v4 = 0;
    goto LABEL_9;
  }
  v4 = 1;
LABEL_9:

  return v4;
}

- (id)replacementIntentFromUpcomingMediaForBundleId:(id)a3 intent:(id)a4
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x1E0CF8CE8];
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v5, "isSystemAppForBundleId:", v7);
  objc_msgSend(MEMORY[0x1E0CF9170], "getUpcomingMediaForBundle:isInternalApplication:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXMediaActionPrediction resolvePlayMediaIntent:withUpcomingMedia:](ATXMediaActionPrediction, "resolvePlayMediaIntent:withUpcomingMedia:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)replacementActionWithResolvedMediaIntentContainer:(id)a3 originalAction:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  ATXAnchorModelPrediction *v21;
  NSObject *v22;
  ATXAnchorModelPrediction *anchorModelPrediction;
  uint64_t v25;
  uint8_t buf[4];
  ATXAnchorModelPrediction *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "first");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "second");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "BOOLValue");
  if (v8)
  {
    if ((v10 & 1) != 0)
    {
      objc_msgSend(v6, "predictedItem");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setLaunchId:", v12);

      v13 = objc_alloc(MEMORY[0x1E0CF8C20]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "predictedItem");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bundleId");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v25) = 1;
      v17 = (void *)objc_msgSend(v13, "initWithIntent:actionUUID:bundleId:heuristic:heuristicMetadata:criteria:isFutureMedia:title:subtitle:", v8, v14, v16, 0, 0, 0, v25, 0, 0);

      v18 = objc_alloc(MEMORY[0x1E0CF9090]);
      objc_msgSend(v6, "score");
      v19 = (id)objc_msgSend(v18, "initWithPredictedItem:score:", v17);

    }
    else
    {
      __atxlog_handle_anchor();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        anchorModelPrediction = self->_anchorModelPrediction;
        *(_DWORD *)buf = 138412290;
        v27 = anchorModelPrediction;
        _os_log_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_INFO, "Returning original Anchor Model prediction because we didn't use Upcoming Media to update the prediction. Prediction: \n%@", buf, 0xCu);
      }

      v19 = v6;
    }
  }
  else
  {
    __atxlog_handle_anchor();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = self->_anchorModelPrediction;
      *(_DWORD *)buf = 138412290;
      v27 = v21;
      _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_INFO, "Suppresing Anchor Model prediction because intent returned by Upcoming Media was nil. Prediction: \n%@", buf, 0xCu);
    }

    v19 = 0;
  }

  return v19;
}

+ (id)anchorPredictionScoredActionTuplesFromPredictions:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  char v19;
  const __CFString *v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  ATXAnchorModelActionPredictionPostProcessor *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  __CFString *v29;
  __CFString *v30;
  ATXScoredActionWithReason *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v44;
  uint64_t v45;
  id obj;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t buf[4];
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v44 = (void *)objc_opt_new();
  __atxlog_handle_anchor();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_INFO, "============================================================================\n", buf, 2u);
  }

  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = objc_msgSend(v3, "count");
    *(_DWORD *)buf = 134217984;
    v53 = v6;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_INFO, "Action prediction post processor STARTING processing anchor model %lu predictions", buf, 0xCu);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = &dword_1C9A3B000;
    v11 = *(_QWORD *)v49;
    v12 = CFSTR("action");
    do
    {
      v13 = 0;
      v45 = v8;
      do
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
        v15 = (void *)MEMORY[0x1CAA48B6C]();
        __atxlog_handle_anchor();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(v10, v16, OS_LOG_TYPE_INFO, "====\n", buf, 2u);
        }

        __atxlog_handle_anchor();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          v53 = v9;
          _os_log_impl(v10, v17, OS_LOG_TYPE_INFO, "Action prediction post processor STARTING processing anchor model prediction %lu.", buf, 0xCu);
        }

        objc_msgSend(v14, "candidateType");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "isEqualToString:", v12);

        if ((v19 & 1) != 0)
        {
          v47 = v15;
          v20 = v12;
          v21 = v9;
          v22 = v11;
          v23 = v10;
          v24 = -[ATXAnchorModelActionPredictionPostProcessor initWithAnchorModelPrediction:]([ATXAnchorModelActionPredictionPostProcessor alloc], "initWithAnchorModelPrediction:", v14);
          -[ATXAnchorModelActionPredictionPostProcessor recoverATXScoredAction](v24, "recoverATXScoredAction");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXAnchorModelActionPredictionPostProcessor postProcessScoredAction:](v24, "postProcessScoredAction:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          +[ATXProactiveSuggestionBuilder predictionReasonForAnchorModelPrediction:](ATXProactiveSuggestionBuilder, "predictionReasonForAnchorModelPrediction:", v14);
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = (void *)v27;
          v29 = &stru_1E82FDC98;
          if (v27)
            v29 = (__CFString *)v27;
          v30 = v29;

          if (v26)
          {
            v31 = -[ATXScoredActionWithReason initWithScoredAction:predictionReason:]([ATXScoredActionWithReason alloc], "initWithScoredAction:predictionReason:", v26, v30);
            v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v14, v31);
            objc_msgSend(v44, "addObject:", v32);

          }
          __atxlog_handle_anchor();
          v33 = objc_claimAutoreleasedReturnValue();
          v10 = v23;
          v34 = v21;
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v53 = v21;
            _os_log_impl(v10, v33, OS_LOG_TYPE_INFO, "Action prediction post processor DONE processing anchor model prediction %lu. \n====\n", buf, 0xCu);
          }

          __atxlog_handle_anchor();
          v35 = objc_claimAutoreleasedReturnValue();
          v12 = v20;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v10, v35, OS_LOG_TYPE_INFO, "====\n", buf, 2u);
          }

          v9 = v34 + 1;
          v11 = v22;
          v8 = v45;
          v15 = v47;
        }
        else
        {
          __atxlog_handle_anchor();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            v53 = v9;
            _os_log_impl(v10, v36, OS_LOG_TYPE_INFO, "Prediction was not an action. Action prediction post processor DONE processing anchor model prediction %lu.", buf, 0xCu);
          }

          __atxlog_handle_anchor();
          v24 = (ATXAnchorModelActionPredictionPostProcessor *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(v10, &v24->super, OS_LOG_TYPE_INFO, "====\n", buf, 2u);
          }
        }

        objc_autoreleasePoolPop(v15);
        ++v13;
      }
      while (v8 != v13);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
    }
    while (v8);
  }

  objc_msgSend(a1, "inPlaceDeduplicateAnchorPredictionScoredActionTuples:", v44);
  __atxlog_handle_anchor();
  v37 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    v38 = objc_msgSend(obj, "count");
    v39 = objc_msgSend(v44, "count");
    *(_DWORD *)buf = 134218240;
    v53 = v38;
    v54 = 2048;
    v55 = v39;
    _os_log_impl(&dword_1C9A3B000, v37, OS_LOG_TYPE_DEFAULT, "Action prediction post processor DONE processing anchor model %lu predictions. Left with %lu predictions.", buf, 0x16u);
  }

  __atxlog_handle_anchor();
  v40 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v40, OS_LOG_TYPE_DEFAULT, "============================================================================\n", buf, 2u);
  }

  v41 = (void *)objc_msgSend(v44, "copy");
  return v41;
}

+ (void)inPlaceDeduplicateAnchorPredictionScoredActionTuples:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_33);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionPredictionsProcessor indicesOfNonDuplicateScoredActions:](ATXActionPredictionsProcessor, "indicesOfNonDuplicateScoredActions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_anchor();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v10 = 134217984;
    v11 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Deduplicating action predictions. Number of original predictions: %lu...", (uint8_t *)&v10, 0xCu);
  }

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, objc_msgSend(v3, "count"));
  objc_msgSend(v7, "removeIndexes:", v5);
  objc_msgSend(v3, "removeObjectsAtIndexes:", v7);
  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = objc_msgSend(v3, "count");
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "After deduplicating, number of action predictions: %lu. Done.", (uint8_t *)&v10, 0xCu);
  }

}

id __100__ATXAnchorModelActionPredictionPostProcessor_inPlaceDeduplicateAnchorPredictionScoredActionTuples___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "second");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scoredAction");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blacklist, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
  objc_storeStrong((id *)&self->_anchorModelPrediction, 0);
}

- (void)recoverATXScoredAction
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Unable to retrieve ATXScoredAction for Anchor Model prediction. Skipping this prediction. %@", (uint8_t *)&v3, 0xCu);
}

- (void)shouldCheckUpcomingMediaForIntent:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Ignoring Upcoming Media for Anchor Model prediction because there's no intent...", a5, a6, a7, a8, 0);
}

- (void)shouldCheckUpcomingMediaForIntent:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, a1, a3, "Ignoring Upcoming Media for Anchor Model prediction because intent is not INPlayMediaIntent...", a5, a6, a7, a8, 0);
}

@end
