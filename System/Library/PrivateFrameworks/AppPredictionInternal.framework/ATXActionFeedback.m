@implementation ATXActionFeedback

- (id)clientModelIds
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v2, "initWithObjects:", v3, v4, v5, v6, 0);

  return v7;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_21 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_21, &__block_literal_global_124);
  return (id)sharedInstance__pasExprOnceResult_27;
}

- (ATXActionFeedback)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  ATXActionFeedback *v12;

  +[ATXPredictionContextBuilder sharedInstance](ATXPredictionContextBuilder, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionFeedbackWeights sharedInstance](ATXActionFeedbackWeights, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXActionNotificationServer sharedInstance](ATXActionNotificationServer, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9080], "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appIntentMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXDataStore sharedInstance](_ATXDataStore, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXActionFeedback initWithPredictionContextBuilder:actionFeedbackWeights:appLaunchHistogramManager:actionNotificationServer:recentEngagmentCache:appIntentMonitor:dataStore:blendingHyperParameters:](self, "initWithPredictionContextBuilder:actionFeedbackWeights:appLaunchHistogramManager:actionNotificationServer:recentEngagmentCache:appIntentMonitor:dataStore:blendingHyperParameters:", v3, v4, v5, v6, v7, v9, v10, v11);

  return v12;
}

- (ATXActionFeedback)initWithPredictionContextBuilder:(id)a3 actionFeedbackWeights:(id)a4 appLaunchHistogramManager:(id)a5 actionNotificationServer:(id)a6 recentEngagmentCache:(id)a7 appIntentMonitor:(id)a8 dataStore:(id)a9 blendingHyperParameters:(id)a10
{
  id v17;
  ATXActionFeedback *v18;
  ATXActionFeedback *v19;
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
  v28.super_class = (Class)ATXActionFeedback;
  v18 = -[ATXActionFeedback init](&v28, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_predictionContextBuilder, a3);
    objc_storeStrong((id *)&v19->_actionFeedbackWeights, a4);
    objc_storeStrong((id *)&v19->_appLaunchHistogramManager, a5);
    objc_storeStrong((id *)&v19->_notificationServer, a6);
    objc_storeStrong((id *)&v19->_recentEngagementCache, a7);
    objc_storeStrong((id *)&v19->_appIntentMonitor, a8);
    objc_storeStrong((id *)&v19->_dataStore, a9);
    objc_storeStrong((id *)&v19->_blendingHyperParameters, a10);
  }

  return v19;
}

void __35__ATXActionFeedback_sharedInstance__block_invoke()
{
  void *v0;
  ATXActionFeedback *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_alloc_init(ATXActionFeedback);
  v2 = (void *)sharedInstance__pasExprOnceResult_27;
  sharedInstance__pasExprOnceResult_27 = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

- (id)_scoredActionsFromProactiveSuggestions:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_21_2);
}

id __60__ATXActionFeedback__scoredActionsFromProactiveSuggestions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  double v6;
  void *v7;

  v2 = a2;
  objc_msgSend(v2, "atxActionExecutableObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CF9090]);
    objc_msgSend(v2, "scoreSpecification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rawScore");
    *(float *)&v6 = v6;
    v7 = (void *)objc_msgSend(v4, "initWithPredictedItem:score:", v3, v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)_feedbackStageForUIFeedbackResult:(id)a3 engagedSuggestion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  int v17;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    +[_ATXActionUtils atxActionFromProactiveSuggestion:](_ATXActionUtils, "atxActionFromProactiveSuggestion:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "intent");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        v11 = 3;
LABEL_13:

        goto LABEL_17;
      }
    }
    objc_msgSend(v7, "intent");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      objc_opt_class();
      v14 = objc_opt_isKindOfClass();

      if ((v14 & 1) == 0)
      {
        v11 = 5;
        goto LABEL_13;
      }
    }

  }
  objc_msgSend(v5, "engagedSuggestions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    goto LABEL_11;
  objc_msgSend(v5, "rejectedSuggestions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {

LABEL_11:
    v11 = 2;
    goto LABEL_17;
  }
  v17 = objc_msgSend(v5, "consumerSubType");

  if (v17 == 22)
    v11 = 4;
  else
    v11 = 2;
LABEL_17:

  return v11;
}

- (id)_actionResponseFromUIFeedbackResult:(id)a3 shownActions:(id)a4 rejectedActions:(id)a5 engagedAction:(id)a6 engagedSuggestion:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  unint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  id v36;
  id v37;
  id v38;

  v12 = a3;
  v13 = a7;
  v38 = a6;
  v37 = a5;
  v36 = a4;
  objc_msgSend(v12, "session");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shownSuggestions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionFeedback _scoredActionsFromProactiveSuggestions:](self, "_scoredActionsFromProactiveSuggestions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0CF8C48]);
  objc_msgSend(v12, "clientCacheUpdate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "feedbackMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "shownSuggestions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "blendingUICacheUpdateUUID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sessionStartDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v17, "initWithScoredActions:cacheFileData:proactiveSuggestions:blendingModelUICacheUpdateUUID:consumerSubType:predictionDate:error:", v16, v19, v20, v21, 0, v22, 0);

  v24 = objc_msgSend(v12, "consumerSubType");
  v25 = -[ATXActionFeedback _feedbackStageForUIFeedbackResult:engagedSuggestion:](self, "_feedbackStageForUIFeedbackResult:engagedSuggestion:", v12, v13);

  objc_msgSend(v14, "sessionEndDate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "updateConsumerSubType:engagedAction:shownActions:feedbackStage:explicitlyDismissedActions:searchedActionType:engagedAppString:uiFeedbackDate:", v24, v38, v36, v25, v37, 4, 0, v26);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v16;
    v28 = v12;
    objc_msgSend(v28, "partialEngagementWasCompleteMatch");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v28, "partialEngagementWasCompleteMatch");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "BOOLValue");

      objc_msgSend(v28, "matchingIntentDonatedAction");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "matchingIntentDonationDate");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "updateWithMatchingIntentDonatedAction:intentDonationDate:matchingIntentWasCompleteMatch:", v32, v33, v31 != 0);

    }
    else
    {
      objc_msgSend(v23, "updateWithMatchingIntentDonatedAction:intentDonationDate:matchingIntentWasCompleteMatch:", 0, 0, 0);
    }

    v16 = v27;
  }

  return v23;
}

- (void)receiveUIFeedbackResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char isKindOfClass;
  void *v19;
  NSObject *v20;

  v4 = a3;
  objc_msgSend(v4, "shownSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils atxActionsFromProactiveSuggestions:](_ATXActionUtils, "atxActionsFromProactiveSuggestions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "rejectedSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils atxActionsFromProactiveSuggestions:](_ATXActionUtils, "atxActionsFromProactiveSuggestions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "engagedSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "count");

  if (v10)
  {
    objc_msgSend(v4, "engagedSuggestions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXActionUtils atxActionsFromProactiveSuggestions:](_ATXActionUtils, "atxActionsFromProactiveSuggestions:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "objectAtIndex:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "engagedSuggestions");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndex:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = 0;
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  -[ATXActionFeedback _actionResponseFromUIFeedbackResult:shownActions:rejectedActions:engagedAction:engagedSuggestion:](self, "_actionResponseFromUIFeedbackResult:shownActions:rejectedActions:engagedAction:engagedSuggestion:", v4, v6, v8, v13, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    __atxlog_handle_feedback();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ATXActionFeedback receiveUIFeedbackResult:].cold.1();
    goto LABEL_14;
  }
  objc_msgSend(v4, "context");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    __atxlog_handle_feedback();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      -[ATXActionFeedback receiveUIFeedbackResult:].cold.2();
LABEL_14:

    goto LABEL_15;
  }
  objc_msgSend(v4, "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionFeedback receiveFeedbackWithActionResponse:context:](self, "receiveFeedbackWithActionResponse:context:", v15, v19);

LABEL_15:
}

- (void)decayCounts
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 33);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds](_ATXFeedbackConstants, "actionDecayHalfLifeSeconds");
  objc_msgSend(v10, "decayWithHalfLifeInDays:", v6 / 86400.0);
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds](_ATXFeedbackConstants, "actionDecayHalfLifeSeconds");
  objc_msgSend(v3, "decayWithHalfLifeInDays:", v7 / 86400.0);
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds](_ATXFeedbackConstants, "actionDecayHalfLifeSeconds");
  objc_msgSend(v4, "decayWithHalfLifeInDays:", v8 / 86400.0);
  +[_ATXFeedbackConstants actionDecayHalfLifeSeconds](_ATXFeedbackConstants, "actionDecayHalfLifeSeconds");
  objc_msgSend(v5, "decayWithHalfLifeInDays:", v9 / 86400.0);

}

- (void)_assertHistogram:(id)a3 weight:(float)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;

  v5 = a3;
  if (!v5)
  {
    __atxlog_handle_feedback();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[ATXActionFeedback _assertHistogram:weight:].cold.2();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("attempted to update a nil histogram in action feedback"));
  }
  if (a4 < 0.0)
  {
    __atxlog_handle_feedback();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXActionFeedback _assertHistogram:weight:].cold.1();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("attempted to update a histogram with a negative weight in action feedback"));
  }

}

- (void)_updateAppLaunchHistogram:(int64_t)a3 bundleId:(id)a4 context:(id)a5 weight:(float)a6
{
  id v10;
  void *v11;
  double v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  id v17;

  v17 = a4;
  v10 = a5;
  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = a6;
  -[ATXActionFeedback _assertHistogram:weight:](self, "_assertHistogram:weight:", v11, v12);
  v13 = (int)a6;
  if ((int)a6 >= 1)
  {
    do
    {
      objc_msgSend(v10, "timeContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v16) = 1.0;
      objc_msgSend(v11, "addLaunchWithBundleId:date:timeZone:weight:", v17, v15, 0, v16);

      --v13;
    }
    while (v13);
  }

}

- (void)_updateAppLaunchCategoricalHistogram:(int64_t)a3 bundleId:(id)a4 category:(id)a5 context:(id)a6 weight:(float)a7
{
  id v12;
  id v13;
  void *v14;
  double v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  id v20;

  v20 = a4;
  v12 = a5;
  v13 = a6;
  -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v15 = a7;
  -[ATXActionFeedback _assertHistogram:weight:](self, "_assertHistogram:weight:", v14, v15);
  v16 = (int)a7;
  if ((int)a7 >= 1)
  {
    do
    {
      objc_msgSend(v13, "timeContext");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "date");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = 1.0;
      objc_msgSend(v14, "addLaunchWithBundleId:date:category:weight:", v20, v18, v12, v19);

      --v16;
    }
    while (v16);
  }

}

- (void)applyFinalFeedbackForActionResponse:(id)a3 engagementType:(unint64_t)a4 context:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  float v17;
  float v18;
  float v19;
  float v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  double v40;
  void *v41;
  _ATXDataStore *dataStore;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  double v55;
  NSObject *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t i;
  void *v63;
  void *v64;
  char v65;
  NSObject *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  ATXActionFeedback *v71;
  id v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  _UNKNOWN **v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  double v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  NSObject *v87;
  double v88;
  void *v89;
  _ATXDataStore *v90;
  uint64_t v91;
  _UNKNOWN **v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  NSObject *v98;
  double v99;
  uint64_t v100;
  unint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  ATXActionFeedback *v106;
  id v107;
  uint64_t v108;
  id obj;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  _BYTE v123[128];
  uint8_t v124[128];
  uint8_t buf[4];
  double v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  void *v130;
  __int16 v131;
  void *v132;
  __int16 v133;
  void *v134;
  __int16 v135;
  void *v136;
  uint64_t v137;

  v137 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  __atxlog_handle_feedback();
  v10 = objc_claimAutoreleasedReturnValue();
  v110 = v8;
  v106 = self;
  v107 = v9;
  v101 = a4;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CF8C40], "engagementTypeToString:", a4);
    v11 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(v8, "consumerSubType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF8C40], "actionFeedbackStageToString:", objc_msgSend(v8, "feedbackStage"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "shownActions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "engagedAction");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "explicitlyDismissedActions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v126 = v11;
    v127 = 2112;
    v128 = (uint64_t)v12;
    v129 = 2112;
    v130 = v13;
    v131 = 2112;
    v132 = v14;
    v133 = 2112;
    v134 = v15;
    v135 = 2112;
    v136 = v16;
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "applyFinalFeedbackForActionResponse called with engagement type: %@, consumerSubType: %@, feedbackStage: %@, shownActions:%@, engagedAction:%@, explicitlyRejectedActions:%@", buf, 0x3Eu);

    self = v106;
    a4 = v101;

  }
  -[ATXActionFeedbackWeights confirmWeightForFeedbackStage:consumerSubType:](self->_actionFeedbackWeights, "confirmWeightForFeedbackStage:consumerSubType:", objc_msgSend(v8, "feedbackStage"), objc_msgSend(v8, "consumerSubType"));
  v18 = v17;
  -[ATXActionFeedbackWeights rejectWeightForFeedbackStage:consumerSubType:](self->_actionFeedbackWeights, "rejectWeightForFeedbackStage:consumerSubType:", objc_msgSend(v8, "feedbackStage"), objc_msgSend(v8, "consumerSubType"));
  v20 = v19;
  objc_msgSend(v9, "locationMotionContext");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v21, "geohash");

  objc_msgSend(v9, "locationMotionContext");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = objc_msgSend(v22, "coarseGeohash");

  objc_msgSend(v8, "engagedAction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend(v8, "engagedAction");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "actionKey");
    v25 = objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = 0;
  }

  objc_msgSend(v9, "timeContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "date");
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v112 = (void *)v25;
  if (v25)
  {
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
LABEL_23:
        v48 = 1;
        goto LABEL_24;
      case 2uLL:
      case 3uLL:
      case 4uLL:
        objc_msgSend(v8, "engagedAction");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "isHeuristic");

        __atxlog_handle_feedback();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);
        if (v28)
        {
          if (v30)
          {
            *(_DWORD *)buf = 134218242;
            v126 = v18;
            v127 = 2112;
            v128 = v25;
            _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_INFO, "Final engagement of weight %f feedback for heuristic action prediction: %@", buf, 0x16u);
          }

          objc_msgSend(v8, "engagedAction");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "heuristic");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v33 = v18;
          -[ATXActionFeedback _updateAppLaunchHistogram:bundleId:context:weight:](self, "_updateAppLaunchHistogram:bundleId:context:weight:", 35, v32, v9, v33);
        }
        else
        {
          if (v30)
          {
            *(_DWORD *)buf = 134218242;
            v126 = v18;
            v127 = 2112;
            v128 = v25;
            _os_log_impl(&dword_1C9A3B000, v29, OS_LOG_TYPE_INFO, "Final engagement feedback of weight %f for model-based action prediction: %@", buf, 0x16u);
          }

          objc_msgSend(v8, "engagedAction");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "bundleId");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v25);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          *(float *)&v35 = v18;
          -[ATXActionFeedback _updateAppLaunchCategoricalHistogram:bundleId:category:context:weight:](self, "_updateAppLaunchCategoricalHistogram:bundleId:category:context:weight:", 33, v32, v34, v9, v35);

        }
        objc_msgSend(v8, "engagedAction");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "slotSet");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        __atxlog_handle_feedback();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
          -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:].cold.4();

        if (v18 == 0.0)
        {
          __atxlog_handle_feedback();
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(MEMORY[0x1E0CF8C40], "actionFeedbackStageToString:", objc_msgSend(v8, "feedbackStage"));
            v40 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(v8, "consumerSubType"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v126 = v40;
            v127 = 2112;
            v128 = (uint64_t)v41;
            _os_log_impl(&dword_1C9A3B000, v39, OS_LOG_TYPE_DEFAULT, "Encountered confirmation feedback with a weight of 0 for feedbackStage=%@ and consumerSubType=%@", buf, 0x16u);

          }
        }
        else
        {
          dataStore = self->_dataStore;
          +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v25);
          v39 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "engagedAction");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "bundleId");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "engagedAction");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "engagedAction");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "actionUUID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v100) = objc_msgSend(v8, "consumerSubType");
          -[_ATXDataStore recordConfirms:rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:](dataStore, "recordConfirms:rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:", 2, v39, v44, v45, v37, v47, v18, 0.0, v105, v100, v103, v102);

          a4 = v101;
        }

        goto LABEL_22;
      case 5uLL:
LABEL_28:
        __atxlog_handle_feedback();
        v54 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CF8C40], "engagementTypeToString:", a4);
          v55 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412290;
          v126 = v55;
          _os_log_impl(&dword_1C9A3B000, v54, OS_LOG_TYPE_INFO, "Exact slot match required on non-rejected items for engagement type %@", buf, 0xCu);

        }
        objc_msgSend(v8, "engagedAction");
        v53 = objc_claimAutoreleasedReturnValue();
        goto LABEL_31;
      case 6uLL:
LABEL_27:
        objc_msgSend(v8, "matchingIntentDonatedAction");
        v53 = objc_claimAutoreleasedReturnValue();
LABEL_31:
        v111 = (void *)v53;
        v48 = 1;
        break;
      default:
LABEL_70:
        v48 = 0;
LABEL_24:
        __atxlog_handle_feedback();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:].cold.3(a4, v49);

        v50 = (void *)MEMORY[0x1E0C99DA0];
        v51 = *MEMORY[0x1E0C99768];
        objc_msgSend(MEMORY[0x1E0CF8C40], "engagementTypeToString:", a4);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "raise:format:", v51, CFSTR("Invalid engagement type of %@ encountered"), v52);

        v111 = 0;
        break;
    }
  }
  else
  {
LABEL_22:
    switch(a4)
    {
      case 0uLL:
      case 1uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
        goto LABEL_23;
      case 2uLL:
      case 6uLL:
        goto LABEL_27;
      case 3uLL:
        __atxlog_handle_feedback();
        v98 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E0CF8C40], "engagementTypeToString:", 3);
          v99 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412290;
          v126 = v99;
          _os_log_impl(&dword_1C9A3B000, v98, OS_LOG_TYPE_INFO, "Only actionKey match required on non-rejected items for engagement type %@", buf, 0xCu);

        }
        objc_msgSend(v8, "matchingIntentDonatedAction");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 0;
        break;
      case 4uLL:
      case 5uLL:
        goto LABEL_28;
      default:
        goto LABEL_70;
    }
  }
  __atxlog_handle_feedback();
  v56 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:].cold.2(v8, v56);

  v113 = (void *)objc_opt_new();
  v119 = 0u;
  v120 = 0u;
  v121 = 0u;
  v122 = 0u;
  objc_msgSend(v8, "shownActions");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v120;
    v61 = 1;
    do
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v120 != v60)
          objc_enumerationMutation(v57);
        v63 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * i);
        if (v48)
        {
          if (+[_ATXActionUtils isContainmentBetweenAction:other:](_ATXActionUtils, "isContainmentBetweenAction:other:", v111, *(_QWORD *)(*((_QWORD *)&v119 + 1) + 8 * i)))
          {
            continue;
          }
        }
        else
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i), "actionKey");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v112, "isEqualToString:", v64);

          if ((v65 & 1) != 0)
            continue;
        }
        __atxlog_handle_feedback();
        v66 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          v126 = v20;
          v127 = 2048;
          v128 = v61 + i;
          v129 = 2112;
          v130 = v63;
          _os_log_debug_impl(&dword_1C9A3B000, v66, OS_LOG_TYPE_DEBUG, "Rejecting (with weight %f at rank %lu) action: %@", buf, 0x20u);
        }

        objc_msgSend(v113, "addObject:", v63);
      }
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
      v61 += i;
    }
    while (v59);
  }

  __atxlog_handle_feedback();
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = v113;
  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
    -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:].cold.1(v113, v67);

  v69 = v110;
  v71 = v106;
  v70 = v107;
  if (objc_msgSend(v113, "count"))
  {
    v72 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v110, "explicitlyDismissedActions");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = (void *)objc_msgSend(v72, "initWithArray:", v73);

    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    obj = v113;
    v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
    if (v74)
    {
      v75 = v74;
      v114 = *(_QWORD *)v116;
      v76 = &off_1E82D9000;
      do
      {
        v77 = 0;
        v108 = v75;
        do
        {
          if (*(_QWORD *)v116 != v114)
            objc_enumerationMutation(obj);
          v78 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v77);
          objc_msgSend(v78, "heuristic");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "length");

          if (v80)
          {
            objc_msgSend(v78, "heuristic");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v82 = v20;
            -[ATXActionFeedback _updateAppLaunchHistogram:bundleId:context:weight:](v71, "_updateAppLaunchHistogram:bundleId:context:weight:", 36, v81, v70, v82);
          }
          else
          {
            objc_msgSend(v78, "bundleId");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            v83 = v76[65];
            objc_msgSend(v78, "actionKey");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "getActionTypeFromActionKey:", v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            *(float *)&v86 = v20;
            -[ATXActionFeedback _updateAppLaunchCategoricalHistogram:bundleId:category:context:weight:](v71, "_updateAppLaunchCategoricalHistogram:bundleId:category:context:weight:", 34, v81, v85, v70, v86);

          }
          if (v20 == 0.0)
          {
            __atxlog_handle_feedback();
            v87 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(MEMORY[0x1E0CF8C40], "actionFeedbackStageToString:", objc_msgSend(v110, "feedbackStage"));
              v88 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(v110, "consumerSubType"));
              v89 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412546;
              v126 = v88;
              v127 = 2112;
              v128 = (uint64_t)v89;
              _os_log_impl(&dword_1C9A3B000, v87, OS_LOG_TYPE_DEFAULT, "Encountered rejection feedback with a weight of 0 for feedbackStage=%@ and consumerSubType=%@", buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(v78, "slotSet");
            v87 = objc_claimAutoreleasedReturnValue();
            v90 = v71->_dataStore;
            if (objc_msgSend(v104, "containsObject:", v78))
              v91 = 2;
            else
              v91 = 1;
            v92 = v76;
            v93 = v76[65];
            objc_msgSend(v78, "actionKey");
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v93, "getActionTypeFromActionKey:", v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "bundleId");
            v96 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "actionUUID");
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v100) = objc_msgSend(v110, "consumerSubType");
            -[_ATXDataStore recordConfirms:rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:](v90, "recordConfirms:rejects:forFeedbackType:forActionType:bundleId:action:slotSet:actionUUID:date:consumerSubType:geohash:coarseGeohash:", v91, v95, v96, v78, v87, v97, 0.0, v20, v105, v100, v103, v102);

            v71 = v106;
            v70 = v107;

            v76 = v92;
            v75 = v108;

          }
          ++v77;
        }
        while (v75 != v77);
        v75 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v123, 16);
      }
      while (v75);
    }

    v69 = v110;
    v68 = v113;
  }
  -[ATXActionFeedback sessionLogWithActionResponse:engagementType:context:](v71, "sessionLogWithActionResponse:engagementType:context:", v69, v101, v70);
  -[ATXActionFeedback logHeuristicFeedback:](v71, "logHeuristicFeedback:", v69);
  ATXUpdatePredictionsDefaultInterval(3);

}

- (void)sessionLogWithActionResponse:(id)a3 engagementType:(unint64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;

  v7 = a5;
  v8 = a3;
  __atxlog_handle_feedback();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[ATXActionFeedback sessionLogWithActionResponse:engagementType:context:].cold.1();

  +[ATXActionSessionLog performSessionLoggingWithActionResponse:engagementType:context:isShadowLog:forTestingMode:](ATXActionSessionLog, "performSessionLoggingWithActionResponse:engagementType:context:isShadowLog:forTestingMode:", v8, a4, v7, 0, 0);
}

- (void)receiveFeedbackWithActionResponse:(id)a3 context:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  ATXRecentActionEngagementCache *recentEngagementCache;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  NSObject *v31;
  void *v32;
  char v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  BOOL v55;
  NSObject *v56;
  uint64_t v57;
  void *v58;
  char v59;
  void *v60;
  int v61;
  uint64_t v62;
  id v63;
  ATXActionFeedback *obj;
  uint8_t v65[16];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  id v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v63 = a4;
  obj = self;
  objc_sync_enter(obj);
  __atxlog_handle_feedback();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v77 = v6;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_INFO, "receiveFeedbackWithActionResponse called with actionResponse of %@", buf, 0xCu);
  }

  switch(objc_msgSend(v6, "feedbackStage"))
  {
    case 0:
    case 1:
    case 7:
    case 8:
      __atxlog_handle_feedback();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0CF8C40], "actionFeedbackStageToString:", objc_msgSend(v6, "feedbackStage"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXActionFeedback receiveFeedbackWithActionResponse:context:].cold.5(v9, (uint64_t)buf, v8);
      }

      v10 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(MEMORY[0x1E0CF8C40], "actionFeedbackStageToString:", objc_msgSend(v6, "feedbackStage"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("invalid feedbackStage of %@ on ATXActionResponse"), v11);
      goto LABEL_64;
    case 2:
    case 3:
      objc_msgSend(v6, "engagedAction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12 == 0;

      if (v13)
      {
        -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:](obj, "applyFinalFeedbackForActionResponse:engagementType:context:", v6, 5, v63);
      }
      else
      {
        recentEngagementCache = obj->_recentEngagementCache;
        objc_msgSend(v6, "engagedAction");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXRecentActionEngagementCache addEngagedAction:](recentEngagementCache, "addEngagedAction:", v15);

      }
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      objc_msgSend(v6, "explicitlyDismissedActions");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v71;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v71 != v29)
              objc_enumerationMutation(v27);
            -[ATXRecentActionEngagementCache addEngagedAction:](obj->_recentEngagementCache, "addEngagedAction:", *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * i));
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
        }
        while (v28);
      }
      goto LABEL_37;
    case 4:
    case 6:
      objc_msgSend(v6, "engagedAction");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16 == 0;

      if (!v17)
      {
        __atxlog_handle_feedback();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "engagedAction");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXActionFeedback receiveFeedbackWithActionResponse:context:].cold.1(v19, (uint64_t)buf, v18);
        }

        v20 = (void *)MEMORY[0x1E0C99DA0];
        objc_msgSend(v6, "engagedAction");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "raise:format:", *MEMORY[0x1E0C99768], CFSTR("non-nil engagedAction in lock screen expiration feedback: %@"), v21);

      }
      goto LABEL_18;
    case 5:
      objc_msgSend(v6, "engagedAction");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22 == 0;

      if (v23)
      {
LABEL_18:
        -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:](obj, "applyFinalFeedbackForActionResponse:engagementType:context:", v6, 5, v63);
      }
      else
      {
        objc_msgSend(v6, "engagedAction");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "actionType") == 1;

        if (v25)
        {
          __atxlog_handle_feedback();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            -[ATXActionFeedback receiveFeedbackWithActionResponse:context:].cold.2();

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("NSUA with background execution"));
        }
        else
        {
          objc_msgSend(v6, "engagedAction");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXRecentActionEngagementCache addEngagedAction:](obj->_recentEngagementCache, "addEngagedAction:", v27);
          if (objc_msgSend(v27, "isHeuristic"))
          {
            __atxlog_handle_feedback();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              -[ATXActionFeedback receiveFeedbackWithActionResponse:context:].cold.3();
          }
          else
          {
            objc_msgSend(v27, "intent");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32 && (v33 = objc_msgSend(v27, "isHeuristic"), v32, (v33 & 1) == 0))
            {
              objc_msgSend(v27, "actionKey");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v34);
              v31 = objc_claimAutoreleasedReturnValue();

              v35 = objc_alloc(MEMORY[0x1E0CB3588]);
              objc_msgSend(v63, "timeContext");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "date");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v63, "timeContext");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "date");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = (void *)objc_msgSend(v35, "initWithStartDate:endDate:", v37, v39);

              v41 = objc_alloc(MEMORY[0x1E0CF8ED8]);
              objc_msgSend(v27, "bundleId");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = (void *)objc_msgSend(v41, "initWithBundleId:intentType:dateInterval:action:", v42, v31, v40, v27);

              LODWORD(v44) = 1.0;
              -[ATXAppIntentMonitor updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:](obj->_appIntentMonitor, "updateActionPredictionPipelineForIntentEvent:weight:appSessionStartDate:appSessionEndDate:", v43, 0, 0, v44);

            }
            else
            {
              __atxlog_handle_feedback();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
                -[ATXActionFeedback receiveFeedbackWithActionResponse:context:].cold.4();
            }
          }

LABEL_37:
        }
      }
      break;
    default:
      break;
  }
  v45 = objc_msgSend(v6, "consumerSubType");
  objc_msgSend(MEMORY[0x1E0CF9508], "uiTypeForActionConsumerSubType:", v45);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v6, "shownActions");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v67;
    do
    {
      v49 = 0;
      do
      {
        if (*(_QWORD *)v67 != v48)
          objc_enumerationMutation(v46);
        v50 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v49);
        objc_msgSend(v50, "actionKey");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "engagedAction");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = objc_msgSend(v52, "isEqual:", v50);

        if ((_DWORD)v53)
        {
          objc_msgSend(v6, "engagedAction");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v54, "actionType") == 1)
          {

            goto LABEL_47;
          }
          v55 = objc_msgSend(v6, "feedbackStage") == 5;

          if (v55)
          {
LABEL_47:
            __atxlog_handle_feedback();
            v56 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v65 = 0;
              _os_log_impl(&dword_1C9A3B000, v56, OS_LOG_TYPE_INFO, "logging direct engagement on NSUserActivity-based UI or background-executable intent interaction", v65, 2u);
            }

LABEL_50:
            v57 = 4;
          }
          else
          {
            if (objc_msgSend(v6, "feedbackStage") != 3)
              goto LABEL_50;
            objc_msgSend(v6, "matchingIntentDonatedAction");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (v58 && (v59 = objc_msgSend(v6, "matchingIntentWasCompleteMatch"), v58, (v59 & 1) != 0))
            {
              v57 = 2;
            }
            else
            {
              objc_msgSend(v6, "matchingIntentDonatedAction");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              if (v60 && (v61 = objc_msgSend(v6, "matchingIntentWasCompleteMatch"), v60, !v61))
                v57 = 3;
              else
                v57 = 6;
            }
          }
          -[ATXActionFeedback applyFinalFeedbackForActionResponse:engagementType:context:](obj, "applyFinalFeedbackForActionResponse:engagementType:context:", v6, v57, v63);
        }
        -[_ATXDataStore updateOrInsertPredictionsAndFeedbackForAppAction:feedbackReceived:forUIType:](obj->_dataStore, "updateOrInsertPredictionsAndFeedbackForAppAction:feedbackReceived:forUIType:", v51, v53, v11);

        ++v49;
      }
      while (v47 != v49);
      v62 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      v47 = v62;
    }
    while (v62);
  }

LABEL_64:
  objc_sync_exit(obj);

}

- (void)receiveLockscreenFeedbackWithAction:(id)a3 actionResponse:(id)a4 engagement:(BOOL)a5 triggeredByUserInteraction:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  v12 = (id)objc_opt_new();
  -[ATXActionFeedback receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:](self, "receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:", v11, v10, v7, v6, v12);

}

- (void)receiveLockscreenFeedbackWithAction:(id)a3 actionResponse:(id)a4 engagement:(BOOL)a5 triggeredByUserInteraction:(BOOL)a6 currentDate:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  NSObject *v23;
  const char *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id *v33;
  void *v34;
  int v35;
  NSObject *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  const __CFString *v46;
  __int16 v47;
  const __CFString *v48;
  uint64_t v49;

  v8 = a6;
  v9 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a7;
  sel_getName(a2);
  v16 = (void *)os_transaction_create();
  __atxlog_handle_feedback();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "actionKey");
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    v20 = CFSTR("NO");
    if (v9)
      v21 = CFSTR("YES");
    else
      v21 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v44 = v18;
    v46 = v21;
    v45 = 2112;
    if (v8)
      v20 = CFSTR("YES");
    v47 = 2112;
    v48 = v20;
    _os_log_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEFAULT, "received lockscreen feedback for actionKey: %@ with engagment: %@ and triggeredByUserInteraction: %@", buf, 0x20u);

  }
  buf[0] = 0;
  v22 = (const __CFString *)*MEMORY[0x1E0CF9510];
  if (CFPreferencesGetAppBooleanValue(CFSTR("displayDonationsOnLockscreen"), (CFStringRef)*MEMORY[0x1E0CF9510], buf))
  {
    __atxlog_handle_feedback();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v24 = "Developer mode detected -- skipping lock screen action feedback for notification";
LABEL_14:
      _os_log_impl(&dword_1C9A3B000, v23, OS_LOG_TYPE_DEFAULT, v24, buf, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  buf[0] = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("zkwActionsDemoModeEnabled"), v22, buf))
  {
    __atxlog_handle_feedback();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v24 = "Demo mode detected -- skipping lock screen action feedback for notification";
      goto LABEL_14;
    }
LABEL_15:

    goto LABEL_16;
  }
  if (!v9 || v8)
  {
    -[ATXPredictionContextBuilderProtocol predictionContextForCurrentContext](self->_predictionContextBuilder, "predictionContextForCurrentContext");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v26)
    {
      __atxlog_handle_feedback();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ATXActionFeedback receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:].cold.1();

      goto LABEL_33;
    }
    if (v9 || v8)
    {
      if (!v8 || v9)
      {
        if (!v9 || !v8)
        {
          __atxlog_handle_feedback();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            -[ATXActionFeedback receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:].cold.2();

          objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("reached end of receiveLockscreenFeedbackWithAction"));
          goto LABEL_33;
        }
        objc_msgSend(v13, "userActivity");
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        if (v31)
        {
          v39 = v13;
          v32 = (void *)MEMORY[0x1E0C99D20];
          v33 = &v39;
        }
        else
        {
          objc_msgSend(v13, "intent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v34, "atx_supportsBackgroundExecution");

          if (v35)
          {
            v38 = v13;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "updateConsumerSubType:engagedAction:shownActions:feedbackStage:explicitlyDismissedActions:searchedActionType:engagedAppString:uiFeedbackDate:", 22, v13, v27, 5, 0, 4, 0, v15, v37);
            goto LABEL_32;
          }
          __atxlog_handle_feedback();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v44 = (uint64_t)v13;
            _os_log_impl(&dword_1C9A3B000, v36, OS_LOG_TYPE_DEFAULT, "received lockscreen feedback for action with non-background executable Intent: %@", buf, 0xCu);
          }

          v37 = v13;
          v32 = (void *)MEMORY[0x1E0C99D20];
          v33 = &v37;
        }
        objc_msgSend(v32, "arrayWithObjects:count:", v33, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "updateConsumerSubType:engagedAction:shownActions:feedbackStage:explicitlyDismissedActions:searchedActionType:engagedAppString:uiFeedbackDate:", 22, v13, v27, 2, 0, 4, 0, v15, v37);
        goto LABEL_32;
      }
      v41 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v41, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateConsumerSubType:engagedAction:shownActions:feedbackStage:explicitlyDismissedActions:searchedActionType:engagedAppString:uiFeedbackDate:", 22, 0, v27, 2, v29, 4, 0, v15);

    }
    else
    {
      v42 = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "updateConsumerSubType:engagedAction:shownActions:feedbackStage:explicitlyDismissedActions:searchedActionType:engagedAppString:uiFeedbackDate:", 22, 0, v27, 4, 0, 4, 0, v15, v37);
    }
LABEL_32:

    -[ATXActionFeedback receiveFeedbackWithActionResponse:context:](self, "receiveFeedbackWithActionResponse:context:", v14, v26);
LABEL_33:

    goto LABEL_16;
  }
  __atxlog_handle_feedback();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    -[ATXActionFeedback receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:].cold.3();

  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("received lockscreen feedback with triggeredByUserInteraction: NO and engagement: YES"));
LABEL_16:

}

- (void)unloadCachedHistograms
{
  -[_ATXAppLaunchHistogramManager purgeHistogramForLaunchType:](self->_appLaunchHistogramManager, "purgeHistogramForLaunchType:", 33);
  -[_ATXAppLaunchHistogramManager purgeHistogramForLaunchType:](self->_appLaunchHistogramManager, "purgeHistogramForLaunchType:", 34);
  -[_ATXAppLaunchHistogramManager purgeHistogramForLaunchType:](self->_appLaunchHistogramManager, "purgeHistogramForLaunchType:", 35);
  -[_ATXAppLaunchHistogramManager purgeHistogramForLaunchType:](self->_appLaunchHistogramManager, "purgeHistogramForLaunchType:", 36);
}

- (void)resetData
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 33);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchHistogramManager categoricalHistogramForLaunchType:](self->_appLaunchHistogramManager, "categoricalHistogramForLaunchType:", 34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ATXAppLaunchHistogramManager histogramForLaunchType:](self->_appLaunchHistogramManager, "histogramForLaunchType:", 36);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resetData");
  objc_msgSend(v3, "resetData");
  objc_msgSend(v4, "resetData");
  objc_msgSend(v5, "resetData");

}

- (void)logHeuristicFeedback:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "engagedAction");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "engagedAction");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heuristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "engagedAction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXActionFeedback logHeuristicFeedbackToPortraitForAction:withActionType:](self, "logHeuristicFeedbackToPortraitForAction:withActionType:", v9, 2);

      objc_msgSend(v4, "engagedAction");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXActionFeedback logHeuristicFeedbackToSuggestionsForAction:withActionType:](self, "logHeuristicFeedbackToSuggestionsForAction:withActionType:", v10, 5);

    }
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "shownActions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v30 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v16, "heuristic");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          -[ATXActionFeedback logHeuristicFeedbackToPortraitForAction:withActionType:](self, "logHeuristicFeedbackToPortraitForAction:withActionType:", v16, 1);
          -[ATXActionFeedback logHeuristicFeedbackToSuggestionsForAction:withActionType:](self, "logHeuristicFeedbackToSuggestionsForAction:withActionType:", v16, 4);
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v13);
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(v4, "explicitlyDismissedActions", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * j);
        objc_msgSend(v23, "heuristic");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
          -[ATXActionFeedback logHeuristicFeedbackToSuggestionsForAction:withActionType:](self, "logHeuristicFeedbackToSuggestionsForAction:withActionType:", v23, 8);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v20);
  }

}

- (void)logHeuristicFeedbackToSuggestionsForAction:(id)a3 withActionType:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  unsigned __int16 v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unsigned __int16 v25;
  _QWORD v26[5];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "heuristicMetadata");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "heuristicMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CF8A48];
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CF8A48]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v5, "heuristic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("checkInForEvent"));

      if (v12)
      {
        objc_msgSend(v5, "userActivity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "activityType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB3418]);

        if (v15)
          v16 = 26;
        else
          v16 = 25;
        v27 = 0;
        v28 = &v27;
        v29 = 0x2050000000;
        v17 = (void *)getSGSuggestionsServiceClass_softClass;
        v30 = getSGSuggestionsServiceClass_softClass;
        if (!getSGSuggestionsServiceClass_softClass)
        {
          v26[0] = MEMORY[0x1E0C809B0];
          v26[1] = 3221225472;
          v26[2] = __getSGSuggestionsServiceClass_block_invoke;
          v26[3] = &unk_1E82DA7D8;
          v26[4] = &v27;
          __getSGSuggestionsServiceClass_block_invoke((uint64_t)v26);
          v17 = (void *)v28[3];
        }
        v18 = objc_retainAutorelease(v17);
        _Block_object_dispose(&v27, 8);
        if (!v18)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[ATXActionFeedback logHeuristicFeedbackToSuggestionsForAction:withActionType:]");
          v25 = v16;
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("ATXActionFeedback.m"), 769, CFSTR("Failed to dyload SGSuggestionService"));

          v16 = v25;
        }
        __atxlog_handle_heuristic();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          -[ATXActionFeedback logHeuristicFeedbackToSuggestionsForAction:withActionType:].cold.1();

        objc_msgSend(v18, "serviceForEvents");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "heuristicMetadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v9);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "logEventInteractionForEventWithUniqueKey:interface:actionType:", v22, v16, v4);

      }
    }
  }

}

- (void)logHeuristicFeedbackToPortraitForAction:(id)a3 withActionType:(unsigned __int16)a4
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "heuristicMetadata");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v5, "heuristicMetadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("eventIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v5, "heuristic");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("showExtraordinaryEvent"));

      if ((v11 & 1) != 0)
      {
        v12 = 4;
        goto LABEL_9;
      }
      objc_msgSend(v5, "heuristic");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hasPrefix:", CFSTR("meetingDND")))
      {

      }
      else
      {
        objc_msgSend(v5, "heuristic");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "hasPrefix:", CFSTR("suggestedEventDND"));

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v5, "heuristic");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("runningLate"));

          if ((v21 & 1) != 0)
          {
            v12 = 3;
          }
          else
          {
            objc_msgSend(v5, "heuristic");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(v22, "hasPrefix:", CFSTR("sendETA"));

            if ((v23 & 1) != 0)
            {
              v12 = 10;
            }
            else
            {
              objc_msgSend(v5, "heuristic");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = objc_msgSend(v24, "hasPrefix:", CFSTR("requestRideToNextEvent"));

              if ((v25 & 1) != 0)
              {
                v12 = 5;
              }
              else
              {
                objc_msgSend(v5, "heuristic");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "hasPrefix:", CFSTR("setAlarmForUnusualEarlyEvents"));

                if ((v27 & 1) == 0)
                {
                  __atxlog_handle_heuristic();
                  v17 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                    -[ATXActionFeedback logHeuristicFeedbackToPortraitForAction:withActionType:].cold.2(v5, v17);
                  goto LABEL_12;
                }
                v12 = 9;
              }
            }
          }
LABEL_9:
          __atxlog_handle_heuristic();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
            -[ATXActionFeedback logHeuristicFeedbackToPortraitForAction:withActionType:].cold.1();

          v17 = objc_opt_new();
          objc_msgSend(v5, "heuristicMetadata");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", *MEMORY[0x1E0CF8A40]);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject logEventInteractionForEventWithEventIdentifier:interface:actionType:](v17, "logEventInteractionForEventWithEventIdentifier:interface:actionType:", v19, v12, v4);

LABEL_12:
          goto LABEL_13;
        }
      }
      v12 = 7;
      goto LABEL_9;
    }
  }
LABEL_13:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendingHyperParameters, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_appIntentMonitor, 0);
  objc_storeStrong((id *)&self->_recentEngagementCache, 0);
  objc_storeStrong((id *)&self->_notificationServer, 0);
  objc_storeStrong((id *)&self->_appLaunchHistogramManager, 0);
  objc_storeStrong((id *)&self->_actionFeedbackWeights, 0);
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
}

- (void)receiveUIFeedbackResult:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "The context is nil even though -receiveFeedbackWithActionResponse:context: expects a non-null value", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)receiveUIFeedbackResult:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "The context is not a ATXPredictionContext which -receiveFeedbackWithActionResponse:context: expects", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_assertHistogram:weight:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "attempted to update a histogram with a negative weight in action feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)_assertHistogram:weight:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "attempted to update a nil histogram in action feedback", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)applyFinalFeedbackForActionResponse:(void *)a1 engagementType:(NSObject *)a2 context:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, v3, "Rejected action count: %lu", v4);
  OUTLINED_FUNCTION_1();
}

- (void)applyFinalFeedbackForActionResponse:(void *)a1 engagementType:(NSObject *)a2 context:.cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "shownActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "count");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a2, v4, "Shown action count: %lu", v5);

  OUTLINED_FUNCTION_1();
}

- (void)applyFinalFeedbackForActionResponse:(uint64_t)a1 engagementType:(NSObject *)a2 context:.cold.3(uint64_t a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF8C40], "engagementTypeToString:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "Invalid engagement type of %@ encountered", v5);

  OUTLINED_FUNCTION_1();
}

- (void)applyFinalFeedbackForActionResponse:engagementType:context:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, v0, v1, "Final slot set in engagment feedback for action prediction: %@", v2);
}

- (void)sessionLogWithActionResponse:engagementType:context:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Generating Session Log", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)receiveFeedbackWithActionResponse:(NSObject *)a3 context:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a3, (uint64_t)a3, "non-nil engagedAction in lock screen expiration feedback: %@", (uint8_t *)a2);

}

- (void)receiveFeedbackWithActionResponse:context:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "NSUA with background execution", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)receiveFeedbackWithActionResponse:context:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Not updating action prediction pipeline for engaged heuristic", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)receiveFeedbackWithActionResponse:context:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_1C9A3B000, v0, v1, "detected nil intent for engaged action", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)receiveFeedbackWithActionResponse:(NSObject *)a3 context:.cold.5(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a3, (uint64_t)a3, "invalid feedbackStage of %@ on ATXActionResponse", (uint8_t *)a2);

}

- (void)receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "No context - cannot process feedback while class-c locked!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "reached end of receiveLockscreenFeedbackWithAction", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)receiveLockscreenFeedbackWithAction:actionResponse:engagement:triggeredByUserInteraction:currentDate:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, v0, v1, "received lockscreen feedback with triggeredByUserInteraction: NO and engagement: YES", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)logHeuristicFeedbackToSuggestionsForAction:withActionType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Logging Heuristic interactions to Suggestions", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)logHeuristicFeedbackToPortraitForAction:withActionType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "Logging Heuristic interactions to Portrait", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)logHeuristicFeedbackToPortraitForAction:(void *)a1 withActionType:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "heuristic");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "No supported interface for heuristic: %@", v5);

  OUTLINED_FUNCTION_1();
}

@end
