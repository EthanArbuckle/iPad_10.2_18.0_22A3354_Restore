@implementation ATXAppPredictorFeedback

- (ATXAppPredictorFeedback)init
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  ATXAppPredictorFeedback *v7;

  +[ATXPredictionContextBuilder sharedInstance](ATXPredictionContextBuilder, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXFeedback sharedInstance](_ATXFeedback, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXAggregateLogger sharedInstance](_ATXAggregateLogger, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  v7 = -[ATXAppPredictorFeedback initWithPredictionContextBuilder:feedbackInstance:aggregateLogger:petTracker:](self, "initWithPredictionContextBuilder:feedbackInstance:aggregateLogger:petTracker:", v3, v4, v5, v6);

  return v7;
}

- (ATXAppPredictorFeedback)initWithPredictionContextBuilder:(id)a3 feedbackInstance:(id)a4 aggregateLogger:(id)a5 petTracker:(id)a6
{
  id v10;
  id v11;
  id v12;
  ATXAppPredictorFeedback *v13;
  objc_class *v14;
  id v15;
  const char *v16;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  objc_super v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)ATXAppPredictorFeedback;
  v13 = -[ATXAppPredictorFeedback init](&v21, sel_init);
  if (v13)
  {
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v16 = (const char *)objc_msgSend(v15, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create(v16, v17);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v18;

    objc_storeStrong((id *)&v13->_feedbackInstance, a4);
    objc_storeStrong((id *)&v13->_aggregateLogger, a5);
    objc_storeStrong((id *)&v13->_petTracker, a6);
  }

  return v13;
}

- (id)clientModelIds
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 17);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v2, v3, v4, 0);

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_petTracker, 0);
  objc_storeStrong((id *)&self->_aggregateLogger, 0);
  objc_storeStrong((id *)&self->_feedbackInstance, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)checkFeedbackContainsUninstalledApps:(id)a3 consumerSubType:(unsigned __int8)a4 aggregateLogger:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;
  unsigned __int8 v20;

  v7 = a3;
  v8 = a5;
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__ATXAppPredictorFeedback_checkFeedbackContainsUninstalledApps_consumerSubType_aggregateLogger___block_invoke;
  aBlock[3] = &unk_1E82DCF98;
  v18 = v7;
  v19 = v8;
  v20 = a4;
  v10 = v8;
  v11 = v7;
  v12 = _Block_copy(aBlock);
  dispatch_get_global_queue(9, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __96__ATXAppPredictorFeedback_checkFeedbackContainsUninstalledApps_consumerSubType_aggregateLogger___block_invoke_2;
  v15[3] = &unk_1E82DA9F8;
  v16 = v12;
  v14 = v12;
  dispatch_async(v13, v15);

}

void __96__ATXAppPredictorFeedback_checkFeedbackContainsUninstalledApps_consumerSubType_aggregateLogger___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  +[_ATXAppIconState sharedInstance](_ATXAppIconState, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(v2, "allInstalledAppsKnownToSpringBoard");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = *(id *)(a1 + 32);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "bundleId", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v5, "containsObject:", v12);

        v9 += v13 ^ 1u;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);

    if (v9)
      objc_msgSend(*(id *)(a1 + 40), "logPredictUninstalledApps:consumerSubType:", v9, *(unsigned __int8 *)(a1 + 48));
  }
  else
  {

  }
}

uint64_t __96__ATXAppPredictorFeedback_checkFeedbackContainsUninstalledApps_consumerSubType_aggregateLogger___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)_bundleIdsFromProactiveSuggestions:(id)a3
{
  return (id)objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_95);
}

uint64_t __62__ATXAppPredictorFeedback__bundleIdsFromProactiveSuggestions___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "bundleIdExecutableObject");
}

- (unint64_t)_engagementTypeFromEngagedSuggestion:(id)a3 engagedBundleId:(id)a4 shownBundleIds:(id)a5 didSearchDuringSession:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  int v14;
  unint64_t v15;

  v6 = a6;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v11;
  if (v10)
  {
    v13 = objc_msgSend(v11, "containsObject:", v10);
    v14 = v13;
    if (v9)
    {
      if ((v13 & 1) != 0)
      {
        v15 = 1;
        goto LABEL_13;
      }
LABEL_12:
      v15 = 2;
      goto LABEL_13;
    }
    if (objc_msgSend(v12, "containsObject:", v10))
      v15 = 3;
    else
      v15 = 1;
    if (!v14)
      goto LABEL_12;
  }
  else if (v6)
  {
    v15 = 4;
  }
  else
  {
    v15 = 5;
  }
LABEL_13:

  return v15;
}

- (unint64_t)_engagementTypeFromUIFeedbackResult:(id)a3 engagedSuggestion:(id)a4 engagedBundleId:(id)a5 shownBundleIds:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  char isKindOfClass;
  void *v16;
  unint64_t v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  char v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(a3, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sessionMetadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_msgSend(v13, "sessionMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) != 0)
    goto LABEL_2;
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
  {
    v17 = -[ATXAppPredictorFeedback _engagementTypeFromEngagedSuggestion:engagedBundleId:shownBundleIds:didSearchDuringSession:](self, "_engagementTypeFromEngagedSuggestion:engagedBundleId:shownBundleIds:didSearchDuringSession:", v10, v11, v12, 0);
    goto LABEL_11;
  }
  objc_msgSend(v13, "sessionMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v20 = objc_opt_isKindOfClass();

  if ((v20 & 1) == 0)
  {
    v17 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v13, "sessionMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "engagedBundleId");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
    goto LABEL_2;
  objc_msgSend(v16, "engagedBundleIdInTopAppsVisible");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "BOOLValue");

  if ((v23 & 1) != 0)
    v17 = 6;
  else
LABEL_2:
    v17 = -[ATXAppPredictorFeedback _engagementTypeFromEngagedSuggestion:engagedBundleId:shownBundleIds:didSearchDuringSession:](self, "_engagementTypeFromEngagedSuggestion:engagedBundleId:shownBundleIds:didSearchDuringSession:", v10, v11, v12, objc_msgSend(v16, "didSearchDuringSession"));

LABEL_11:
  return v17;
}

- (id)_engagedBundleIdFromEngagedSuggestion:(id)a3 feedbackSession:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  v5 = a4;
  objc_msgSend(a3, "bundleIdExecutableObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
  {
    objc_msgSend(v5, "sessionMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "engagedAppString");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v8 = 0;
        goto LABEL_9;
      }
      objc_msgSend(v9, "engagedBundleId");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (id)v10;
LABEL_9:

    goto LABEL_10;
  }
  v8 = v6;
LABEL_10:

  return v8;
}

- (void)receiveUIFeedbackResult:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSObject *queue;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  _QWORD block[5];
  id v53;
  id v54;
  id v55;
  id v56;
  NSObject *v57;
  id v58;
  id v59;
  uint64_t v60;
  unint64_t v61;
  char v62;

  v5 = a3;
  __atxlog_handle_feedback();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ATXAppPredictorFeedback receiveUIFeedbackResult:].cold.5((uint64_t)v5, v6);

  objc_msgSend(v5, "shownSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = objc_msgSend(v5, "consumerSubType");
    v10 = objc_msgSend(MEMORY[0x1E0CF9508], "consumerTypeForSubType:", v9);
    if (!(_DWORD)v9 || (v11 = v10) == 0)
    {
      __atxlog_handle_feedback();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXAppPredictorFeedback receiveUIFeedbackResult:].cold.1(v13, v32, v33, v34, v35, v36, v37, v38);
      goto LABEL_24;
    }
    objc_msgSend(v5, "engagedSuggestions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "session");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppPredictorFeedback _engagedBundleIdFromEngagedSuggestion:feedbackSession:](self, "_engagedBundleIdFromEngagedSuggestion:feedbackSession:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "shownSuggestions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppPredictorFeedback _bundleIdsFromProactiveSuggestions:](self, "_bundleIdsFromProactiveSuggestions:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "rejectedSuggestions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppPredictorFeedback _bundleIdsFromProactiveSuggestions:](self, "_bundleIdsFromProactiveSuggestions:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = -[ATXAppPredictorFeedback _engagementTypeFromUIFeedbackResult:engagedSuggestion:engagedBundleId:shownBundleIds:](self, "_engagementTypeFromUIFeedbackResult:engagedSuggestion:engagedBundleId:shownBundleIds:", v5, v13, v15, v17);
    if (!v20)
    {
LABEL_23:

LABEL_24:
      goto LABEL_25;
    }
    v21 = v20;
    v50 = v15;
    v51 = v19;
    v49 = v17;
    objc_msgSend(v5, "clientCacheUpdate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "feedbackMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAppPredictionFeedbackItem feedbackItemsForCacheFileData:](ATXAppPredictionFeedbackItem, "feedbackItemsForCacheFileData:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = v24;
    if (!objc_msgSend(v24, "count"))
    {
      __atxlog_handle_feedback();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
        -[ATXAppPredictorFeedback receiveUIFeedbackResult:].cold.2(v30);
      v17 = v49;
      v15 = v50;
      v19 = v51;
      v29 = v48;
      goto LABEL_22;
    }
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "abGroupIdentifiers");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndexedSubscript:", v9);
    v47 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "context");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      objc_opt_class();
      v17 = v49;
      v15 = v50;
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        sel_getName(a2);
        v28 = (void *)os_transaction_create();
        queue = self->_queue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __51__ATXAppPredictorFeedback_receiveUIFeedbackResult___block_invoke;
        block[3] = &unk_1E82E2320;
        block[4] = self;
        v60 = v11;
        v62 = v9;
        v29 = v48;
        v53 = v48;
        v61 = v21;
        v54 = v50;
        v55 = v49;
        v56 = v51;
        v30 = v47;
        v57 = v47;
        v58 = v27;
        v59 = v28;
        v31 = v28;
        dispatch_sync(queue, block);

LABEL_21:
        v19 = v51;
LABEL_22:

        goto LABEL_23;
      }
      __atxlog_handle_feedback();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
        -[ATXAppPredictorFeedback receiveUIFeedbackResult:].cold.4((uint64_t)v27, v31);
    }
    else
    {
      __atxlog_handle_feedback();
      v31 = objc_claimAutoreleasedReturnValue();
      v17 = v49;
      v15 = v50;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[ATXAppPredictorFeedback receiveUIFeedbackResult:].cold.3(v31, v39, v40, v41, v42, v43, v44, v45);
    }
    v30 = v47;
    v29 = v48;
    goto LABEL_21;
  }
LABEL_25:

}

id __51__ATXAppPredictorFeedback_receiveUIFeedbackResult___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend((id)objc_opt_class(), "receiveFeedbackForConsumerType:consumerSubType:feedbackItemsForResponse:engagementType:engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:abGroupIdentifier:context:feedbackInstance:aggregateLogger:petTracker:", *(_QWORD *)(a1 + 96), *(unsigned __int8 *)(a1 + 112), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  objc_autoreleasePoolPop(v2);
  return (id)objc_opt_self();
}

+ (void)receiveFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 feedbackItemsForResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 abGroupIdentifier:(id)a10 context:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  id v26;

  v24 = a4;
  v15 = a11;
  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a5;
  v21 = (void *)objc_opt_class();
  +[_ATXFeedback sharedInstance](_ATXFeedback, "sharedInstance");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  +[_ATXAggregateLogger sharedInstance](_ATXAggregateLogger, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_opt_new();
  objc_msgSend(v21, "receiveFeedbackForConsumerType:consumerSubType:feedbackItemsForResponse:engagementType:engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:abGroupIdentifier:context:feedbackInstance:aggregateLogger:petTracker:", a3, v24, v20, a6, v19, v18, v17, v16, v15, v26, v22, v23);

}

+ (void)receiveFeedbackForConsumerType:(unint64_t)a3 consumerSubType:(unsigned __int8)a4 feedbackItemsForResponse:(id)a5 engagementType:(unint64_t)a6 engagedBundleId:(id)a7 bundleIdsShown:(id)a8 explicitlyRejectedBundleIds:(id)a9 abGroupIdentifier:(id)a10 context:(id)a11 feedbackInstance:(id)a12 aggregateLogger:(id)a13 petTracker:(id)a14
{
  uint64_t v16;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v40;
  void *v41;
  void *v42;
  unint64_t v43;
  BOOL v44;
  uint64_t v45;
  unint64_t v46;
  void *v47;
  void *v48;
  id v49;
  float v50;
  id v51;
  unint64_t v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  void *v60;
  uint64_t v61;
  id v62;
  uint64_t v63;
  id v64;
  void *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  id v69;
  void *v70;
  NSObject *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  unint64_t v83;
  unint64_t v85;
  BOOL v86;
  uint64_t v87;
  void *v88;
  unsigned int v89;
  void *v90;
  id v91;
  unint64_t v92;
  id v93;
  unint64_t v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  uint8_t buf[4];
  void *v100;
  __int16 v101;
  void *v102;
  __int16 v103;
  id v104;
  __int16 v105;
  id v106;
  __int16 v107;
  id v108;
  _BYTE v109[128];
  uint64_t v110;

  v16 = a4;
  v110 = *MEMORY[0x1E0C80C00];
  v18 = a5;
  v91 = a7;
  v19 = a8;
  v79 = a9;
  v93 = a10;
  v81 = a11;
  v80 = a12;
  v20 = a13;
  v77 = a14;
  v21 = v18;
  v78 = a1;
  v89 = v16;
  v90 = v20;
  objc_msgSend(a1, "checkFeedbackContainsUninstalledApps:consumerSubType:aggregateLogger:", v21, v16, v20);
  v22 = (void *)objc_opt_new();
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v23 = v21;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
  if (!v24)
    goto LABEL_15;
  v25 = v24;
  v26 = 0;
  v27 = *(_QWORD *)v96;
  do
  {
    v28 = 0;
    do
    {
      if (*(_QWORD *)v96 != v27)
        objc_enumerationMutation(v23);
      v29 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v28);
      objc_msgSend(v29, "bundleId");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v19, "containsObject:", v30);

      if (v31)
      {
        objc_msgSend(v22, "addIndex:", v26 + v28);
        __atxlog_handle_default();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          goto LABEL_10;
        *(_DWORD *)buf = 138412290;
        v100 = v29;
        v33 = v32;
        v34 = "Displayed item in feedback:\n%@";
      }
      else
      {
        __atxlog_handle_default();
        v32 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          goto LABEL_10;
        *(_DWORD *)buf = 138412290;
        v100 = v29;
        v33 = v32;
        v34 = "Non-displayed item in feedback:\n%@";
      }
      _os_log_debug_impl(&dword_1C9A3B000, v33, OS_LOG_TYPE_DEBUG, v34, buf, 0xCu);
LABEL_10:

      ++v28;
    }
    while (v25 != v28);
    v35 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v95, v109, 16);
    v25 = v35;
    v26 += v28;
  }
  while (v35);
LABEL_15:

  v36 = +[ATXAppPredictorFeedback _outcomeForEngagementType:](ATXAppPredictorFeedback, "_outcomeForEngagementType:", a6);
  v88 = (void *)objc_opt_new();
  v37 = objc_msgSend(v19, "count");
  v38 = v36 - 3;
  v85 = v36;
  if (v36 == 3 || v36 == 6)
    v40 = v37 + 1;
  else
    v40 = v37;
  v92 = v40;
  v41 = v91;
  v42 = v93;
  if (objc_msgSend(v23, "count") && v92)
  {
    v43 = 0;
    v44 = v38 < 3;
    v45 = 3;
    if (v38 < 3)
      v45 = 4;
    v87 = v45;
    if (!v91)
      v44 = 1;
    v86 = v44;
    v83 = v36 - 1;
    v46 = 1;
    while (1)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v46 - 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "bundleId");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "objectAtIndexedSubscript:", v46 - 1);
      v49 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v50 = *(float *)(objc_msgSend(v49, "scoreInputs") + 300);

      if (objc_msgSend(v19, "containsObject:", v48))
        break;
      if (v41 && (objc_msgSend(v48, "isEqualToString:", v41) & 1) != 0)
      {
        v57 = 2;
        goto LABEL_40;
      }
LABEL_45:

      if (v46 < objc_msgSend(v23, "count"))
      {
        ++v46;
        if (v43 < v92)
          continue;
      }
      goto LABEL_49;
    }
    if (v50 == 0.0)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v46 - 1);
      v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v52 = v43;
      v53 = (uint64_t)*(float *)(objc_msgSend(v51, "scoreInputs") + 288);
      objc_msgSend(v23, "objectAtIndexedSubscript:", v46 - 1);
      v54 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v55 = objc_msgSend(v54, "scoreInputs");
      v56 = v53;
      v43 = v52;
      +[ATXAppPredictorFeedback logShownMMMetricsEntryForBundle:anchorType:consumerSubType:score:](ATXAppPredictorFeedback, "logShownMMMetricsEntryForBundle:anchorType:consumerSubType:score:", v48, v56, v89, *(float *)(v55 + 280));

    }
    v57 = v87;
    if (!v86)
    {
      if (objc_msgSend(v48, "isEqualToString:", v91))
      {
        if (v83 >= 8)
          v57 = 0;
        else
          v57 = qword_1C9E80368[v83];
        goto LABEL_40;
      }
      v57 = 3;
    }
    objc_msgSend(v88, "addObject:", v48);
LABEL_40:
    v94 = v43 + 1;
    objc_msgSend(v23, "objectAtIndexedSubscript:", v46 - 1);
    v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v59 = objc_msgSend(v58, "scoreInputs");
    objc_msgSend(v23, "objectAtIndexedSubscript:", v46 - 1);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "totalScore");
    v61 = v59;
    v42 = v93;
    objc_msgSend(v90, "logPredictionOfAppWithBundleId:inputs:outcome:rank:score:forABGroup:", v48, v61, v57, v46 - 1, v93);

    if (v57 || v50 != 0.0)
    {
      v41 = v91;
    }
    else
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v46 - 1);
      v62 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v63 = (uint64_t)*(float *)(objc_msgSend(v62, "scoreInputs") + 288);
      objc_msgSend(v23, "objectAtIndexedSubscript:", v46 - 1);
      v64 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v41 = v91;
      +[ATXAppPredictorFeedback logEngagedMMMetricsEntryForBundle:anchorType:consumerSubType:score:](ATXAppPredictorFeedback, "logEngagedMMMetricsEntryForBundle:anchorType:consumerSubType:score:", v91, v63, v89, *(float *)(objc_msgSend(v64, "scoreInputs") + 280));

      v42 = v93;
    }
    v43 = v94;
    goto LABEL_45;
  }
LABEL_49:
  v65 = v79;
  v66 = v89;
  v67 = a3;
  v68 = v85;
  if ((objc_msgSend(MEMORY[0x1E0D81590], "isClassCLocked") & 1) == 0 && a3 <= 0xF && ((1 << a3) & 0xC006) != 0)
  {
    v69 = v41;
    v70 = v69;
    if (a6 == 6)
    {

      v70 = 0;
    }
    objc_msgSend(v80, "feedbackLaunchedWithConsumerType:forBundleId:rejected:explicitlyRejected:context:", a3, v70, v88, v79, v81);
    __atxlog_handle_feedback();
    v71 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v89);
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v79;
      objc_msgSend(MEMORY[0x1E0CF9508], "stringForEngagementType:", a6);
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v100 = v72;
      v101 = 2112;
      v102 = v73;
      v103 = 2112;
      v104 = v70;
      v105 = 2112;
      v106 = v88;
      v107 = 2112;
      v108 = v79;
      _os_log_impl(&dword_1C9A3B000, v71, OS_LOG_TYPE_DEFAULT, "ATXAppPredictorFeedback recorded feedback for consumerSubType: %@ \nengagementType: %@ \nengaged: %@ \nrejected: %@ explicitlyRejected: %@", buf, 0x34u);

      v42 = v93;
      v68 = v85;
    }

    v66 = v89;
    v67 = a3;
  }
  objc_msgSend(v90, "logPredictionEventWith:outcome:forABGroup:consumerType:andSubType:", v19, v68, v42, v67, v66);
  __atxlog_handle_feedback();
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
  {
    +[_ATXAggregateLogger stringForPredictionOutcome:](_ATXAggregateLogger, "stringForPredictionOutcome:", v85);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v66);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v100 = v75;
    v101 = 2112;
    v102 = v76;
    v103 = 2112;
    v104 = v93;
    v105 = 2112;
    v106 = v19;
    _os_log_impl(&dword_1C9A3B000, v74, OS_LOG_TYPE_DEFAULT, "ATXAppPredictorFeedback logged session with outcome: %@ consumerSubType: %@, abGroup: %@, bundleIdsShown: %@", buf, 0x2Au);

    v42 = v93;
  }

  objc_msgSend(v78, "_tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType:engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:abGroupIdentifier:tracker:", v66, v41, v19, v65, v42, v77);
  +[ATXAppPredictorFeedback _sessionObjectLoggingForFeedbackItems:engagedBundleId:shownBundleIdIndexes:consumerType:consumerSubType:outcome:context:](ATXAppPredictorFeedback, "_sessionObjectLoggingForFeedbackItems:engagedBundleId:shownBundleIdIndexes:consumerType:consumerSubType:outcome:context:", v23, v41, v22, v67, v66, v85, v81);

}

+ (void)_tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType:(unsigned __int8)a3 engagedBundleId:(id)a4 bundleIdsShown:(id)a5 explicitlyRejectedBundleIds:(id)a6 abGroupIdentifier:(id)a7 tracker:(id)a8
{
  uint64_t v12;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;

  v12 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  objc_msgSend(a5, "_pas_filteredArrayWithTest:", &__block_literal_global_31_0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    if (v14)
      v19 = objc_msgSend(MEMORY[0x1E0CF8CE8], "isAppClipWebClipBundleId:", v14);
    else
      v19 = 0;
    objc_msgSend(v15, "_pas_filteredArrayWithTest:", &__block_literal_global_33);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v19 && (objc_msgSend(v18, "containsObject:", v14) & 1) != 0)
      v22 = 1;
    else
      v22 = 2 * (v21 != 0);
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setEngagementType:", v22);
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v12);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setConsumerSubType:", v24);

    objc_msgSend(v23, "setNumSuggestionsShown:", objc_msgSend(v18, "count"));
    objc_msgSend(v23, "setAbGroup:", v16);
    objc_msgSend(v17, "trackScalarForMessage:", v23);
    __atxlog_handle_metrics();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      +[ATXAppPredictorFeedback _tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType:engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:abGroupIdentifier:tracker:].cold.1((uint64_t)a1, v23, v25);

  }
}

uint64_t __178__ATXAppPredictorFeedback__tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_abGroupIdentifier_tracker___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CF8CE8], "isAppClipWebClipBundleId:", a2);
}

uint64_t __178__ATXAppPredictorFeedback__tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType_engagedBundleId_bundleIdsShown_explicitlyRejectedBundleIds_abGroupIdentifier_tracker___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CF8CE8], "isAppClipWebClipBundleId:", a2);
}

+ (void)logShownMMMetricsEntryForBundle:(id)a3 anchorType:(int64_t)a4 consumerSubType:(unsigned __int8)a5 score:(double)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a5 == 35)
  {
    v8 = a3;
    v14 = (id)objc_opt_new();
    objc_msgSend(v14, "setBundleId:", v8);

    objc_msgSend(v14, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a4));
    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "abGroupIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setAbGroup:", v11);
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConsumerSubType:", v12);

    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trackDistributionForMessage:value:", v14, a6);

  }
}

+ (void)logEngagedMMMetricsEntryForBundle:(id)a3 anchorType:(int64_t)a4 consumerSubType:(unsigned __int8)a5 score:(double)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (a5 == 35)
  {
    v8 = a3;
    v14 = (id)objc_opt_new();
    objc_msgSend(v14, "setAnchor:", +[ATXMMAppPredictionExpert mmAnchorTypeToMMProtobufAnchor:](ATXMMAppPredictionExpert, "mmAnchorTypeToMMProtobufAnchor:", a4));
    objc_msgSend(v14, "setBundleId:", v8);

    +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "abGroupIdentifiers");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", 16);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "setAbGroup:", v11);
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", 35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setConsumerSubType:", v12);

    objc_msgSend(MEMORY[0x1E0D80F28], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "trackDistributionForMessage:value:", v14, a6);

  }
}

+ (unint64_t)_outcomeForEngagementType:(unint64_t)a3
{
  unint64_t result;
  NSObject *v4;

  result = 0;
  switch(a3)
  {
    case 0uLL:
    case 7uLL:
      __atxlog_handle_default();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[ATXAppPredictorFeedback _outcomeForEngagementType:].cold.1(a3, v4);

      result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Invalid ATXEngagementType value of %lu received in feedback"), a3);
      __break(1u);
      break;
    case 2uLL:
      result = 3;
      break;
    case 3uLL:
      result = 2;
      break;
    case 4uLL:
    case 5uLL:
    case 6uLL:
      result = a3;
      break;
    default:
      return result;
  }
  return result;
}

+ (void)_sessionObjectLoggingForFeedbackItems:(id)a3 engagedBundleId:(id)a4 shownBundleIdIndexes:(id)a5 consumerType:(unint64_t)a6 consumerSubType:(unsigned __int8)a7 outcome:(unint64_t)a8 context:(id)a9
{
  uint64_t v10;
  id v14;
  id v15;
  id v16;
  char v17;
  void *v18;
  double v19;
  double v20;
  int v21;
  double v22;
  void *v23;
  void *v24;
  id v25;

  v10 = a7;
  v25 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a9;
  v17 = objc_msgSend(v16, "isOverridden");
  if ((a8 & 0xFFFFFFFFFFFFFFFELL) != 4 && (v17 & 1) == 0)
  {
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sessionObjectLogSamplingRate");
    v20 = v19;

    v21 = objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild");
    v22 = v20 * 10.0;
    if (v20 * 10.0 > 1.0)
      v22 = 1.0;
    if (!v21)
      v22 = v20;
    if (+[_ATXAggregateLogger yesWithProbability:](_ATXAggregateLogger, "yesWithProbability:", v22))
    {
      v23 = (void *)MEMORY[0x1CAA48B6C]();
      +[ATXAppPredictorFeedback constructSessionLogDictionaryWithFeedbackItems:engagedBundleId:shownBundleIdIndexes:consumerType:consumerSubType:outcome:annotation:context:](ATXAppPredictorFeedback, "constructSessionLogDictionaryWithFeedbackItems:engagedBundleId:shownBundleIdIndexes:consumerType:consumerSubType:outcome:annotation:context:", v25, v14, v15, a6, v10, a8, 0, v16);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXAWDUtils logAppPredictionDictionaryViaAWD:](ATXAWDUtils, "logAppPredictionDictionaryViaAWD:", v24);

      objc_autoreleasePoolPop(v23);
    }
  }

}

+ (int64_t)getEngagedItemIndexWithFeedbackItems:(id)a3 engagedItem:(id)a4
{
  id v5;
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  char v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v7 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bundleId");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v6, "isEqualToString:", v9);

      if ((v10 & 1) != 0)
        break;
      if (++v7 >= (unint64_t)objc_msgSend(v5, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v7 = -1;
  }

  return v7;
}

+ (id)constructFeatureDictionaryWithFeedbackItems:(id)a3 engagedItem:(id)a4 shownItemIndexes:(id)a5 consumerType:(unint64_t)a6 histogramBundleIdTable:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  unint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void (**v36)(void *, void *);
  int64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void (**v52)(void *, void *);
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v64;
  void *v65;
  unint64_t v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD aBlock[4];
  id v86;
  id v87;
  unint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a7;
  v15 = (id)objc_msgSend(v11, "count");
  if (v15)
  {
    v70 = v14;
    v71 = v13;
    v72 = v12;
    v16 = objc_msgSend(v13, "count");
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v66 = a6;
    if (a6 == 8)
      v19 = objc_msgSend(v17, "extraIntentsToLog");
    else
      v19 = objc_msgSend(v17, "extraAppsToLog");
    v20 = v19;

    if (v16 + v20 >= (uint64_t)v15)
      v21 = (unint64_t)v15;
    else
      v21 = v16 + v20;
    v22 = (void *)objc_opt_new();
    v89 = 0u;
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v68 = v11;
    v23 = v11;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v90;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v90 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
          objc_msgSend(v28, "bundleId");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKeyedSubscript:", v28, v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v89, v95, 16);
      }
      while (v25);
    }

    v30 = (void *)objc_opt_new();
    v31 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v22, "allKeys");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v31, "initWithArray:", v32);

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __136__ATXAppPredictorFeedback_constructFeatureDictionaryWithFeedbackItems_engagedItem_shownItemIndexes_consumerType_histogramBundleIdTable___block_invoke;
    aBlock[3] = &unk_1E82E2388;
    v34 = v33;
    v86 = v34;
    v35 = v30;
    v87 = v35;
    v88 = v21;
    v36 = (void (**)(void *, void *))_Block_copy(aBlock);
    v37 = +[ATXAppPredictorFeedback getEngagedItemIndexWithFeedbackItems:engagedItem:](ATXAppPredictorFeedback, "getEngagedItemIndexWithFeedbackItems:engagedItem:", v23, v72);
    if (v37 != -1)
    {
      objc_msgSend(v23, "objectAtIndexedSubscript:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v36[2](v36, v38);

    }
    v83 = 0u;
    v84 = 0u;
    v82 = 0u;
    v81 = 0u;
    objc_msgSend(v23, "objectsAtIndexes:", v71, v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v82;
      do
      {
        for (j = 0; j != v41; ++j)
        {
          if (*(_QWORD *)v82 != v42)
            objc_enumerationMutation(v39);
          v36[2](v36, *(void **)(*((_QWORD *)&v81 + 1) + 8 * j));
        }
        v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v81, v94, 16);
      }
      while (v41);
    }

    v79 = 0u;
    v80 = 0u;
    v77 = 0u;
    v78 = 0u;
    v69 = v34;
    +[ATXUtils shuffle:](ATXUtils, "shuffle:", v34);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
    if (v45)
    {
      v46 = v45;
      v47 = *(_QWORD *)v78;
LABEL_26:
      v48 = 0;
      while (1)
      {
        if (*(_QWORD *)v78 != v47)
          objc_enumerationMutation(v44);
        v49 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v48);
        if (objc_msgSend(v35, "count") >= v21)
          break;
        objc_msgSend(v22, "objectForKeyedSubscript:", v49);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v36[2](v36, v50);

        if (v46 == ++v48)
        {
          v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v77, v93, 16);
          if (v46)
            goto LABEL_26;
          break;
        }
      }
    }

    v51 = v69;
    if (v66 == 8 && v64 != -1)
    {
      v73[0] = MEMORY[0x1E0C809B0];
      v73[1] = 3221225472;
      v73[2] = __136__ATXAppPredictorFeedback_constructFeatureDictionaryWithFeedbackItems_engagedItem_shownItemIndexes_consumerType_histogramBundleIdTable___block_invoke_2;
      v73[3] = &unk_1E82E23B0;
      v74 = v22;
      v75 = v69;
      v76 = v35;
      v52 = (void (**)(void *, void *))_Block_copy(v73);
      objc_msgSend(v23, "objectAtIndexedSubscript:", v64);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "bundleId");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      +[_ATXActionUtils getBundleIdAndActionTypeFromActionKey:](_ATXActionUtils, "getBundleIdAndActionTypeFromActionKey:", v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();

      if (v55)
      {
        objc_msgSend(v55, "first");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "second");
        v67 = v53;
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v65);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:](_ATXActionUtils, "actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:", v57, 0, 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "allKeysFilteredBy:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        v52[2](v52, v59);
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v56);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        +[_ATXActionUtils actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:](_ATXActionUtils, "actionKeyFilterForCandidateBundleIds:candidateActionTypes:blacklist:", 0, v60, 0);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "allKeysFilteredBy:", v61);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        v52[2](v52, v62);
        v51 = v69;

        v53 = v67;
      }

    }
    v15 = v35;

    v11 = v68;
    v13 = v71;
    v12 = v72;
    v14 = v70;
  }

  return v15;
}

void __136__ATXAppPredictorFeedback_constructFeatureDictionaryWithFeedbackItems_engagedItem_shownItemIndexes_consumerType_histogramBundleIdTable___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3)
    && (unint64_t)objc_msgSend(*(id *)(a1 + 40), "count") < *(_QWORD *)(a1 + 48))
  {
    v4 = *(void **)(a1 + 40);
    +[ATXAppPredictorFeedback _appDictionaryForFeedbackItem:](ATXAppPredictorFeedback, "_appDictionaryForFeedbackItem:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

    objc_msgSend(*(id *)(a1 + 32), "removeObject:", v3);
  }

}

void __136__ATXAppPredictorFeedback_constructFeatureDictionaryWithFeedbackItems_engagedItem_shownItemIndexes_consumerType_histogramBundleIdTable___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
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
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1CAA48B6C](v4);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8, (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8))
        {
          v11 = *(void **)(a1 + 48);
          +[ATXAppPredictorFeedback _appDictionaryForFeedbackItem:](ATXAppPredictorFeedback, "_appDictionaryForFeedbackItem:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v12);

          objc_msgSend(*(id *)(a1 + 40), "removeObject:", v8);
        }

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v5 != v7);
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v5 = v4;
    }
    while (v4);
  }

}

+ (id)constructSessionLogDictionaryWithFeedbackItems:(id)a3 engagedBundleId:(id)a4 shownBundleIdIndexes:(id)a5 consumerType:(unint64_t)a6 consumerSubType:(unsigned __int8)a7 outcome:(unint64_t)a8 annotation:(id)a9 context:(id)a10
{
  uint64_t v11;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
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
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  BOOL v43;
  double v44;
  void *v45;
  double v46;
  double v47;
  BOOL v48;
  double v49;
  void *v50;
  double v51;
  double v52;
  BOOL v53;
  double v54;
  void *v55;
  double v56;
  double v57;
  BOOL v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  BOOL v63;
  double v64;
  void *v65;
  double v66;
  double v67;
  BOOL v68;
  double v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  BOOL v78;
  double v79;
  void *v80;
  double v81;
  double v82;
  BOOL v83;
  double v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  double v89;
  double v90;
  BOOL v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  double v96;
  double v97;
  BOOL v98;
  double v99;
  void *v100;
  double v101;
  double v102;
  BOOL v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  BOOL v108;
  double v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  double v114;
  double v115;
  BOOL v116;
  double v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  void *v138;
  void *v139;
  void *v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  void *v146;
  void *v147;
  void *v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  void *v154;
  void *v155;
  void *v156;
  double v157;
  double v158;
  double v159;
  double v160;
  double v161;
  void *v162;
  void *v163;
  void *v164;
  unsigned int v166;
  void *v167;
  void *v168;
  void *v169;
  unint64_t v170;
  void *v171;
  void *v172;
  id v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;

  v11 = a7;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a9;
  v19 = a10;
  if ((objc_msgSend(v19, "isOverridden") & 1) != 0)
  {
    v20 = 0;
  }
  else
  {
    v180 = v18;
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v181 = v15;
    +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = a6;
    +[ATXAppPredictorFeedback constructFeatureDictionaryWithFeedbackItems:engagedItem:shownItemIndexes:consumerType:histogramBundleIdTable:](ATXAppPredictorFeedback, "constructFeatureDictionaryWithFeedbackItems:engagedItem:shownItemIndexes:consumerType:histogramBundleIdTable:", v15, v16, v17, a6, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("AppData"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v23, CFSTR("Outcome"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", +[ATXAppPredictorFeedback getEngagedItemIndexWithFeedbackItems:engagedItem:](ATXAppPredictorFeedback, "getEngagedItemIndexWithFeedbackItems:engagedItem:", v15, v16));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v24, CFSTR("EngagedApp"));

    objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E83CC910, CFSTR("session_log_version"));
    +[ATXFileUtil cacheAgeForConsumerType:](ATXFileUtil, "cacheAgeForConsumerType:", v11);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", floor(v25 / 10.0) * 10.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v26, CFSTR("PredictionCacheAge"));

    objc_msgSend(v19, "timeContext");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "date");
    v174 = (void *)objc_claimAutoreleasedReturnValue();

    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "histogramForLaunchType:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "histogramForLaunchType:", 1);
    v179 = (void *)objc_claimAutoreleasedReturnValue();

    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "histogramForLaunchType:", 2);
    v178 = (void *)objc_claimAutoreleasedReturnValue();

    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "histogramForLaunchType:", 3);
    v177 = (void *)objc_claimAutoreleasedReturnValue();

    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "histogramForLaunchType:", 5);
    v176 = (void *)objc_claimAutoreleasedReturnValue();

    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "categoricalHistogramForLaunchType:", 4);
    v175 = (void *)objc_claimAutoreleasedReturnValue();

    +[_ATXAppLaunchHistogramManager sharedInstance](_ATXAppLaunchHistogramManager, "sharedInstance");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "categoricalHistogramForLaunchType:", 37);
    v36 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "userContext");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "lastAppLaunch");
    v38 = objc_claimAutoreleasedReturnValue();

    v167 = (void *)v36;
    v171 = (void *)v38;
    v166 = v11;
    if (v38)
    {
      +[_ATXAppLaunchSequenceManager sharedInstance](_ATXAppLaunchSequenceManager, "sharedInstance");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "launchSequenceForBundle:", v38);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v40 = 0;
    }
    objc_msgSend(v29, "totalLaunches");
    v42 = fabs(v41);
    v43 = v42 <= INFINITY;
    if (v42 >= INFINITY)
      v44 = -31337.0;
    else
      v44 = v41;
    if (v43)
      v41 = v44;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v41);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v45, CFSTR("TotalLaunches"));

    objc_msgSend(v29, "totalTimeOfDayLaunchesForDate:", v174);
    v47 = fabs(v46);
    v48 = v47 <= INFINITY;
    if (v47 >= INFINITY)
      v49 = -31337.0;
    else
      v49 = v46;
    if (v48)
      v46 = v49;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v46);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v50, CFSTR("TotalTimeOfDayLaunches"));

    objc_msgSend(v179, "totalLaunches");
    v52 = fabs(v51);
    v53 = v52 <= INFINITY;
    if (v52 >= INFINITY)
      v54 = -31337.0;
    else
      v54 = v51;
    if (v53)
      v51 = v54;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v51);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v55, CFSTR("TotalSpotlightLaunches"));

    objc_msgSend(v179, "totalTimeOfDayLaunchesForDate:", v174);
    v57 = fabs(v56);
    v58 = v57 <= INFINITY;
    if (v57 >= INFINITY)
      v59 = -31337.0;
    else
      v59 = v56;
    if (v58)
      v56 = v59;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v56);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v60, CFSTR("TotalSpotlightTimeOfDayLaunches"));

    objc_msgSend(v178, "totalLaunches");
    v62 = fabs(v61);
    v63 = v62 <= INFINITY;
    if (v62 >= INFINITY)
      v64 = -31337.0;
    else
      v64 = v61;
    if (v63)
      v61 = v64;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v61);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v65, CFSTR("TotalDayOfWeekLaunches"));

    objc_msgSend(v178, "totalTimeOfDayLaunchesForDate:", v174);
    v67 = fabs(v66);
    v68 = v67 <= INFINITY;
    if (v67 >= INFINITY)
      v69 = -31337.0;
    else
      v69 = v66;
    if (v68)
      v66 = v69;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v66);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v70, CFSTR("TotalCurrentDayOfWeekLaunches"));

    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "component:fromDate:", 32, v174);
    v73 = objc_msgSend(v71, "component:fromDate:", 512, v174) - 1;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v72 / 4);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v74, CFSTR("TimeOfDayInterval"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v75, CFSTR("DayOfWeek"));

    objc_msgSend(v40, "subsequentLaunchTotalCount");
    v77 = fabs(v76);
    v78 = v77 <= INFINITY;
    if (v77 >= INFINITY)
      v79 = -31337.0;
    else
      v79 = v76;
    if (v78)
      v76 = v79;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v76);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v80, CFSTR("TotalLaunchSequences"));

    objc_msgSend(v177, "totalLaunches");
    v82 = fabs(v81);
    v83 = v82 <= INFINITY;
    if (v82 >= INFINITY)
      v84 = -31337.0;
    else
      v84 = v81;
    if (v83)
      v81 = v84;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v81);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v85, CFSTR("TotalAirplaneModeLaunches"));

    v86 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v19, "deviceStateContext");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v86, "numberWithInt:", objc_msgSend(v87, "inAirplaneMode"));
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v88, CFSTR("InAirplaneMode"));

    objc_msgSend(v176, "totalLaunches");
    v90 = fabs(v89);
    v91 = v90 <= INFINITY;
    if (v90 >= INFINITY)
      v92 = -31337.0;
    else
      v92 = v89;
    if (v91)
      v89 = v92;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v89);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v93, CFSTR("TotalTrendingLaunches"));

    objc_msgSend(v19, "deviceStateContext");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v94, "wifiSSID");
    v95 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v175, "totalLaunches");
    v97 = fabs(v96);
    v98 = v97 <= INFINITY;
    if (v97 >= INFINITY)
      v99 = -31337.0;
    else
      v99 = v96;
    if (v98)
      v96 = v99;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v96);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v100, CFSTR("TotalWifiLaunches"));

    v172 = v29;
    v173 = v17;
    v168 = v40;
    if (objc_msgSend(v95, "length"))
    {
      objc_msgSend(v175, "totalLaunchesForCategory:", v95);
      v102 = fabs(v101);
      v103 = v102 <= INFINITY;
      if (v102 >= INFINITY)
        v104 = -31337.0;
      else
        v104 = v101;
      if (v103)
        v101 = v104;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v101);
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v105, CFSTR("TotalSSIDLaunches"));

    }
    else
    {
      objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E83CC928, CFSTR("TotalSSIDLaunches"));
    }
    objc_msgSend(v167, "totalLaunches");
    v107 = fabs(v106);
    v108 = v107 <= INFINITY;
    if (v107 >= INFINITY)
      v109 = -31337.0;
    else
      v109 = v106;
    if (v108)
      v106 = v109;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v106);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v110, CFSTR("CoreMotionLaunches"));

    v111 = (void *)MEMORY[0x1E0D80E00];
    objc_msgSend(v19, "locationMotionContext");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v111, "getMotionStringFromMotionType:", objc_msgSend(v112, "motionType"));
    v113 = (void *)objc_claimAutoreleasedReturnValue();

    v169 = v71;
    if (objc_msgSend(v113, "length"))
    {
      objc_msgSend(v167, "totalLaunchesForCategory:", v113);
      v115 = fabs(v114);
      v116 = v115 <= INFINITY;
      if (v115 >= INFINITY)
        v117 = -31337.0;
      else
        v117 = v114;
      if (v116)
        v114 = v117;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", (uint64_t)v114);
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v118, CFSTR("CoreMotionCurrentMotionLaunches"));

    }
    else
    {
      objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E83CC928, CFSTR("CoreMotionCurrentMotionLaunches"));
    }
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerType:", v170);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v119, CFSTR("ConsumerType"));

    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v166);
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v120, CFSTR("ConsumerSubType"));

    if (objc_msgSend(v180, "length"))
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v180, CFSTR("annotation"));
    if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
      objc_msgSend(v20, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("IsInternalBuild"));
    if ((v166 - 48) > 0xD0u)
    {
      +[_ATXAppPredictor sharedInstance](_ATXAppPredictor, "sharedInstance");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "abGroupIdentifiers");
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v123, "objectAtIndexedSubscript:", v166);
      v124 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setObject:forKeyedSubscript:", v124, CFSTR("ABGroup"));
    }
    else
    {
      v121 = objc_msgSend(v20, "setObject:forKeyedSubscript:", CFSTR("ERROR!"), CFSTR("ABGroup"));
    }
    v125 = (void *)MEMORY[0x1CAA48B6C](v121);
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v126, "sessionLoggingCurrentLOITypeEnable"))
    {
      objc_msgSend(v19, "locationMotionContext");
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v127, "currentLOI");
      v128 = (void *)objc_claimAutoreleasedReturnValue();

      if (v128)
        v129 = objc_msgSend(v128, "type");
      else
        v129 = -1;
      objc_msgSend(MEMORY[0x1E0D80DC8], "stringForLOIType:", v129);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v130, CFSTR("CurrentLOIType"));

    }
    if (objc_msgSend(v126, "sessionLoggingHomeDistanceEnable"))
    {
      v131 = (void *)objc_opt_class();
      objc_msgSend(v19, "locationMotionContext");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "distanceFromHomeOfCurrentLocationInMeters");
      v134 = v133;
      objc_msgSend(v126, "sessionLoggingDistanceAccuracy");
      objc_msgSend(v131, "_bucketize:bucketSize:", v134, v135);
      v137 = v136;

      if (v137 >= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v138, CFSTR("LocationDistanceFromHome"));

      }
    }
    if (objc_msgSend(v126, "sessionLoggingWorkDistanceEnable"))
    {
      v139 = (void *)objc_opt_class();
      objc_msgSend(v19, "locationMotionContext");
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v140, "distanceFromWorkOfCurrentLocationInMeters");
      v142 = v141;
      objc_msgSend(v126, "sessionLoggingDistanceAccuracy");
      objc_msgSend(v139, "_bucketize:bucketSize:", v142, v143);
      v145 = v144;

      if (v145 >= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v146, CFSTR("LocationDistanceFromWork"));

      }
    }
    if (objc_msgSend(v126, "sessionLoggingSchoolDistanceEnable"))
    {
      v147 = (void *)objc_opt_class();
      objc_msgSend(v19, "locationMotionContext");
      v148 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v148, "distanceFromSchoolOfCurrentLocationInMeters");
      v150 = v149;
      objc_msgSend(v126, "sessionLoggingDistanceAccuracy");
      objc_msgSend(v147, "_bucketize:bucketSize:", v150, v151);
      v153 = v152;

      if (v153 >= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v154, CFSTR("LocationDistanceFromSchool"));

      }
    }
    if (objc_msgSend(v126, "sessionLoggingGymDistanceEnable"))
    {
      v155 = (void *)objc_opt_class();
      objc_msgSend(v19, "locationMotionContext");
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v156, "distanceFromGymOfCurrentLocationInMeters");
      v158 = v157;
      objc_msgSend(v126, "sessionLoggingDistanceAccuracy");
      objc_msgSend(v155, "_bucketize:bucketSize:", v158, v159);
      v161 = v160;

      if (v161 >= 0.0)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v162, CFSTR("LocationDistanceFromGym"));

      }
    }
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXAppPredictorFeedback _getLastAppsWithEngagedApp:limit:](ATXAppPredictorFeedback, "_getLastAppsWithEngagedApp:limit:", v16, objc_msgSend(v163, "sessionLoggingAppSequenceLength"));
    v164 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v164, "count"))
      objc_msgSend(v20, "setObject:forKeyedSubscript:", v164, CFSTR("AppSequence"));

    objc_autoreleasePoolPop(v125);
    v18 = v180;
    v15 = v181;
    v17 = v173;
  }

  return v20;
}

+ (double)_bucketize:(double)result bucketSize:(double)a4
{
  if (result >= 0.0)
    return (double)(int)(result / a4) * a4;
  return result;
}

+ (id)_getLastAppsWithEngagedApp:(id)a3 limit:(int)a4
{
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _ATXAppLaunch *v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  id v16;
  unint64_t v17;
  _ATXAppLaunch *v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "dateByAddingTimeInterval:", -7200.0);
  v7 = objc_claimAutoreleasedReturnValue();
  +[_ATXDuetHelper sharedInstance](_ATXDuetHelper, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)v7;
  objc_msgSend(v8, "getAppLaunchesBetweenStartDate:endDate:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (!v5 || (-[__CFString isEqualToString:](v5, "isEqualToString:", &stru_1E82FDC98) & 1) != 0)
  {
    v11 = v5;
    v5 = CFSTR("NONE");
    goto LABEL_4;
  }
  if (!objc_msgSend(v10, "count"))
    goto LABEL_5;
  objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v10, "count") - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", v5);

  if (!v20)
  {
LABEL_4:

LABEL_5:
    v12 = -[_ATXAppLaunch initWithBundleId:startDate:endDate:timeZone:reason:]([_ATXAppLaunch alloc], "initWithBundleId:startDate:endDate:timeZone:reason:", v5, v6, v6, 0, 0);
    objc_msgSend(v10, "addObject:", v12);

    goto LABEL_6;
  }
  objc_msgSend(v11, "endDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v21);
  v23 = v22;

  if (v23 > 300.0)
    goto LABEL_5;
LABEL_6:
  v13 = objc_msgSend(v10, "count");
  v14 = objc_msgSend(v10, "count");
  if (v13 <= a4)
  {
    if (v14 >= a4)
    {
      v16 = v10;
    }
    else
    {
      v16 = (id)objc_opt_new();
      if (objc_msgSend(v10, "count") != a4)
      {
        v17 = 0;
        do
        {
          v18 = -[_ATXAppLaunch initWithBundleId:startDate:endDate:timeZone:reason:]([_ATXAppLaunch alloc], "initWithBundleId:startDate:endDate:timeZone:reason:", CFSTR("NONE"), v6, v6, 0, 0);
          objc_msgSend(v16, "addObject:", v18);

          ++v17;
        }
        while (a4 - objc_msgSend(v10, "count") > v17);
      }
      objc_msgSend(v16, "addObjectsFromArray:", v10);
    }
  }
  else
  {
    objc_msgSend(v10, "subarrayWithRange:", v14 - a4, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v15, "mutableCopy");

  }
  v24 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v25 = v16;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v34 != v28)
          objc_enumerationMutation(v25);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "bundleId");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "addObject:", v30);

      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v27);
  }

  return v24;
}

+ (id)_getLastAppIntentsWithEngagedAction:(id)a3 combinedIntentStream:(id)a4 limit:(int)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  id v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id obj;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "dateByAddingTimeInterval:", -14400.0);
  v56 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "getActivityAndIntentEventsBetweenStartDate:endDate:ascending:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v10, "mutableCopy");

  objc_msgSend(v7, "actionKey");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    objc_msgSend(v7, "actionKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", &stru_1E82FDC98);

    if ((v15 & 1) == 0)
    {
      if (objc_msgSend(v11, "count"))
      {
        v54 = v9;
        objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "action");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "actionKey");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "actionKey");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqualToString:", v19);

        if (v20)
        {
          objc_msgSend(v16, "endDate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v54;
          objc_msgSend(v54, "timeIntervalSinceDate:", v21);
          v23 = v22;

          if (v23 <= 30.0)
            goto LABEL_9;
        }
        else
        {

          v9 = v54;
        }
      }
      v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8ED8]), "initWithBundleId:intentType:dateInterval:action:", CFSTR("NONE"), CFSTR("NONE"), 0, v7);
      objc_msgSend(v11, "insertObject:atIndex:", v24, 0);

    }
  }
LABEL_9:
  v57 = (void *)objc_opt_new();
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v25 = v11;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
  if (v26)
  {
    v27 = v26;
    v53 = v7;
    v55 = v9;
    v52 = v8;
    v28 = 0;
    v29 = 0;
    v30 = *(_QWORD *)v61;
    v31 = a5;
    v32 = &stru_1E82FDC98;
    obj = v25;
    v59 = v31;
    while (2)
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v61 != v30)
          objc_enumerationMutation(obj);
        if (v28 == v31)
        {
          v43 = obj;

          v8 = v52;
          v7 = v53;
          v9 = v55;
          v46 = (void *)v56;
          v45 = v57;
          goto LABEL_30;
        }
        v34 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(v34, "action");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "actionKey");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(v34, "action");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "actionKey");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "isEqualToString:", v32);

          if (v39)
          {
            ++v29;
            v31 = v59;
          }
          else
          {
            if ((-[__CFString isEqualToString:](v32, "isEqualToString:", &stru_1E82FDC98) & 1) == 0)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%ld"), v32, v29);
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "addObject:", v40);

              ++v28;
            }
            v31 = v59;
            objc_msgSend(v34, "action");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "actionKey");
            v42 = objc_claimAutoreleasedReturnValue();

            v32 = (__CFString *)v42;
            v29 = 1;
          }
        }
      }
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v64, 16);
      if (v27)
        continue;
      break;
    }
    v43 = obj;

    if (v29)
    {
      if (v28 == v31)
      {
        v8 = v52;
        v7 = v53;
        v9 = v55;
        v45 = v57;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%ld"), v32, v29);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v57;
        objc_msgSend(v57, "addObject:", v44);

        ++v28;
        v8 = v52;
        v7 = v53;
        v9 = v55;
      }
      v47 = v59;
    }
    else
    {
      v47 = v31;
      v8 = v52;
      v7 = v53;
      v9 = v55;
      v45 = v57;
    }
  }
  else
  {

    v28 = 0;
    v47 = a5;
    v32 = &stru_1E82FDC98;
    v45 = v57;
    v43 = v25;
  }
  v48 = v47 - v28;
  v46 = (void *)v56;
  if (v47 > v28)
  {
    do
    {
      objc_msgSend(v45, "addObject:", CFSTR("NONE"));
      --v48;
    }
    while (v48);
  }
LABEL_30:
  objc_msgSend(v45, "reverseObjectEnumerator");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "allObjects");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

+ (id)_appDictionaryForFeedbackItem:(id)a3
{
  id v3;
  void *v4;
  uint64_t i;
  id v6;
  double v7;
  double v8;
  BOOL v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
  double v19;
  double v20;
  BOOL v21;
  double v22;
  void *v23;
  void *v24;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 818);
  for (i = 0; i != 817; ++i)
  {
    v6 = objc_retainAutorelease(v3);
    v7 = *(float *)(objc_msgSend(v6, "scoreInputs") + 4 * i);
    v8 = fabs(v7);
    v9 = v8 <= INFINITY;
    if (v8 >= INFINITY)
      v10 = -31337.0;
    else
      v10 = v7;
    if (v9)
      v7 = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_ATXScoreTypes aggdStringForScoreInput:](_ATXScoreTypes, "aggdStringForScoreInput:", i);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, v12);

  }
  +[_ATXAppInfoManager sharedInstance](_ATXAppInfoManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "genreIdForBundleId:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, CFSTR("GenreId"));

  objc_msgSend(v6, "bundleId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "subGenreIdsForBundleId:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("SubGenreIds"));

  objc_msgSend(v6, "totalScore");
  v19 = v18;
  v20 = fabs(v19);
  v21 = v20 <= INFINITY;
  if (v20 >= INFINITY)
    v22 = -31337.0;
  else
    v22 = v19;
  if (v21)
    v19 = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v23, CFSTR("Score"));

  objc_msgSend(v6, "bundleId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v24, CFSTR("BundleId"));

  return v4;
}

- (void)_syncForTests
{
  dispatch_sync((dispatch_queue_t)self->_queue, &__block_literal_global_146);
}

- (void)receiveUIFeedbackResult:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "ATXAppPredictorFeedback receiveUIFeedbackResult received an invalid unknown consumer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)receiveUIFeedbackResult:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "ATXAppPredictorFeedback feedbackItemsForCacheFileData returned 0 feedback items", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)receiveUIFeedbackResult:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1C9A3B000, a1, a3, "Not processing feedback because returned context object was nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)receiveUIFeedbackResult:(uint64_t)a1 .cold.4(uint64_t a1, NSObject *a2)
{
  objc_class *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Unexpected type of context: %{public}@", (uint8_t *)&v5, 0xCu);

}

- (void)receiveUIFeedbackResult:(uint64_t)a1 .cold.5(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "ATXAppPredictorFeedback receiveUIFeedbackResult got result - %@", (uint8_t *)&v2, 0xCu);
}

+ (void)_tryLogInstalledAppClipSessionEngagementMetricWithConsumerSubType:(NSObject *)a3 engagedBundleId:bundleIdsShown:explicitlyRejectedBundleIds:abGroupIdentifier:tracker:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  int v10;
  void *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "consumerSubType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a2, "engagementType");
  if (v8 > 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E82E23F0[(int)v8];
  }
  v10 = objc_msgSend(a2, "numSuggestionsShown");
  objc_msgSend(a2, "abGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138413314;
  v13 = v6;
  v14 = 2112;
  v15 = v7;
  v16 = 2112;
  v17 = v9;
  v18 = 1024;
  v19 = v10;
  v20 = 2112;
  v21 = v11;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBInstalledAppClipSessionEngagementTracker with consumerSubType: %@ and engagementType: %@ numSuggestionsShown: %u abGroup: %@", buf, 0x30u);

}

+ (void)_outcomeForEngagementType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "Invalid ATXEngagementType value of %lu received in feedback", (uint8_t *)&v2, 0xCu);
}

@end
