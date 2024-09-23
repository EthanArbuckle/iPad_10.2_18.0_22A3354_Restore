@implementation ATXAnchorModelPredictionForwarder

- (ATXAnchorModelPredictionForwarder)init
{
  void *v3;
  void *v4;
  ATXAnchorModelPredictionForwarder *v5;

  v3 = (void *)objc_opt_new();
  +[ATXAnchorModelHyperParameters sharedInstance](ATXAnchorModelHyperParameters, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXAnchorModelPredictionForwarder initWithAnchorModelDataStoreWrapper:anchorModelHyperParameters:](self, "initWithAnchorModelDataStoreWrapper:anchorModelHyperParameters:", v3, v4);

  return v5;
}

- (ATXAnchorModelPredictionForwarder)initWithAnchorModelDataStoreWrapper:(id)a3 anchorModelHyperParameters:(id)a4
{
  id v7;
  id v8;
  ATXAnchorModelPredictionForwarder *v9;
  ATXAnchorModelPredictionForwarder *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXAnchorModelPredictionForwarder;
  v9 = -[ATXAnchorModelPredictionForwarder init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_storeWrapper, a3);
    objc_storeStrong((id *)&v10->_hyperParameters, a4);
  }

  return v10;
}

- (void)forwardPredictions:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  NSObject *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  __atxlog_handle_anchor();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Forwarding the following predictions:", buf, 2u);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        __atxlog_handle_anchor();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v18 = v11;
          _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v8);
  }

  -[ATXAnchorModelPredictionForwarder forwardNonModePredictions:](self, "forwardNonModePredictions:", v6);
  -[ATXAnchorModelPredictionForwarder forwardModePredictions:](self, "forwardModePredictions:", v6);

}

- (void)forwardNonModePredictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  ATXAnchorModelFeedbackMetadata *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[ATXAnchorModelPredictionForwarder actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:](self, "actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPredictionForwarder appAnchorModelPredictionTuplesForBlendingLayerFromPredictions:](self, "appAnchorModelPredictionTuplesForBlendingLayerFromPredictions:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelPredictionForwarder linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:](self, "linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_anchor();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 134217984;
    v17 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Forwarding %lu actions", (uint8_t *)&v16, 0xCu);
  }

  __atxlog_handle_anchor();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v6, "count");
    v16 = 134217984;
    v17 = v10;
    _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "Forwarding %lu apps", (uint8_t *)&v16, 0xCu);
  }

  __atxlog_handle_anchor();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(v7, "count");
    v16 = 134217984;
    v17 = v12;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "Forwarding %lu Link actions", (uint8_t *)&v16, 0xCu);
  }

  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "arrayByAddingObjectsFromArray:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = -[ATXAnchorModelFeedbackMetadata initWithAnchorSuggestionTuples:]([ATXAnchorModelFeedbackMetadata alloc], "initWithAnchorSuggestionTuples:", v14);
  -[ATXAnchorModelPredictionForwarder forwardPredictionTuplesToBlendingLayer:feedbackMetadata:](self, "forwardPredictionTuplesToBlendingLayer:feedbackMetadata:", v14, v15);

}

- (void)forwardModePredictions:(id)a3
{
  void *v4;
  NSObject *v5;
  ATXModeAnchorModelSuggestionClient *modeSuggestionClient;
  ATXModeAnchorModelSuggestionClient *v7;
  ATXModeAnchorModelSuggestionClient *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ATXAnchorModelPredictionForwarder modeAnchorModelSuggestionsFromPredictions:](self, "modeAnchorModelSuggestionsFromPredictions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    __atxlog_handle_anchor();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = objc_msgSend(v4, "count");
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "Forwarding %lu mode suggestions", (uint8_t *)&v9, 0xCu);
    }

    modeSuggestionClient = self->_modeSuggestionClient;
    if (!modeSuggestionClient)
    {
      +[ATXModeAnchorModelSuggestionClient sharedInstance](ATXModeAnchorModelSuggestionClient, "sharedInstance");
      v7 = (ATXModeAnchorModelSuggestionClient *)objc_claimAutoreleasedReturnValue();
      v8 = self->_modeSuggestionClient;
      self->_modeSuggestionClient = v7;

      modeSuggestionClient = self->_modeSuggestionClient;
    }
    -[ATXModeAnchorModelSuggestionClient anchorModelDidProvideModeSuggestions:](modeSuggestionClient, "anchorModelDidProvideModeSuggestions:", v4);
  }

}

- (void)forwardPredictionTuplesToBlendingLayer:(id)a3 feedbackMetadata:(id)a4
{
  id v6;
  void *v7;
  ATXProactiveSuggestionClientModel *anchorModelClientModel;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  ATXProactiveSuggestionClientModel *v13;
  ATXProactiveSuggestionClientModel *v14;
  void *v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", &__block_literal_global_66);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  anchorModelClientModel = self->_anchorModelClientModel;
  if (!anchorModelClientModel)
  {
    v9 = objc_alloc(MEMORY[0x1E0D81198]);
    -[ATXAnchorModelPredictionForwarder clientModelId](self, "clientModelId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "blendingLayerServer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (ATXProactiveSuggestionClientModel *)objc_msgSend(v9, "initWithClientModelId:blendingLayerServer:", v10, v12);
    v14 = self->_anchorModelClientModel;
    self->_anchorModelClientModel = v13;

    anchorModelClientModel = self->_anchorModelClientModel;
  }
  +[ATXAnchorModelFeedbackMetadata archivedDataForAnchorFeedbackMetadata:](ATXAnchorModelFeedbackMetadata, "archivedDataForAnchorFeedbackMetadata:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXProactiveSuggestionClientModel updateSuggestions:feedbackMetadata:](anchorModelClientModel, "updateSuggestions:feedbackMetadata:", v7, v15);

  __atxlog_handle_anchor();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134217984;
    v18 = objc_msgSend(v7, "count");
    _os_log_impl(&dword_1C9A3B000, v16, OS_LOG_TYPE_DEFAULT, "Done forwarding %lu predictions to the blending layer.", (uint8_t *)&v17, 0xCu);
  }

}

uint64_t __93__ATXAnchorModelPredictionForwarder_forwardPredictionTuplesToBlendingLayer_feedbackMetadata___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "second");
}

- (id)clientModelId
{
  return (id)objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 1);
}

- (id)clientModelSpec
{
  void *v3;
  void *v4;
  void *v5;

  -[ATXAnchorModelPredictionForwarder clientModelId](self, "clientModelId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelHyperParameters abGroup](self->_hyperParameters, "abGroup");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v3, v4, 1);

  return v5;
}

- (id)actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  +[ATXAnchorModelActionPredictionPostProcessor anchorPredictionScoredActionTuplesFromPredictions:](ATXAnchorModelActionPredictionPostProcessor, "anchorPredictionScoredActionTuplesFromPredictions:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelHyperParameters anchorsDisabledForHomescreen](self->_hyperParameters, "anchorsDisabledForHomescreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __102__ATXAnchorModelPredictionForwarder_actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke;
  v9[3] = &unk_1E82DF550;
  v9[4] = self;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __102__ATXAnchorModelPredictionForwarder_actionAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  objc_msgSend(v3, "mediumBlendingConfidenceScoreThreshold");
  v6 = v5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "highBlendingConfidenceScoreThreshold");
  v8 = v7;
  objc_msgSend(v4, "first");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "second");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "anchorType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchor anchorTypeStringToClassName:](ATXAnchor, "anchorTypeStringToClassName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v12) ^ 1;
  v14 = +[ATXProactiveSuggestionBuilder predictionReasonsForAnchorModelPrediction:](ATXProactiveSuggestionBuilder, "predictionReasonsForAnchorModelPrediction:", v9);
  objc_msgSend(*(id *)(a1 + 32), "clientModelSpec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestionBuilder proactiveSuggestionsForAnchorModelFromScoredActionWithReason:clientModelSpec:mediumThreshold:highThreshold:allowedOnHomescreen:predictionReasons:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsForAnchorModelFromScoredActionWithReason:clientModelSpec:mediumThreshold:highThreshold:allowedOnHomescreen:predictionReasons:", v10, v15, v13, v14, v6, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v9, v16);
  else
    v17 = 0;

  return v17;
}

- (id)linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions:(id)a3
{
  ATXAnchorModelHyperParameters *hyperParameters;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;
  id v14;

  hyperParameters = self->_hyperParameters;
  v5 = a3;
  -[ATXAnchorModelHyperParameters anchorsDisabledForHomescreen](hyperParameters, "anchorsDisabledForHomescreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __106__ATXAnchorModelPredictionForwarder_linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke;
  v12[3] = &unk_1E82DF578;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(v5, "_pas_mappedArrayWithTransform:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __106__ATXAnchorModelPredictionForwarder_linkActionAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke(id *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;

  v3 = a2;
  objc_msgSend(*((id *)a1[4] + 3), "mediumBlendingConfidenceScoreThreshold");
  v5 = v4;
  objc_msgSend(*((id *)a1[4] + 3), "highBlendingConfidenceScoreThreshold");
  v7 = v6;
  objc_msgSend(v3, "candidateType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("linkaction"));

  if (v9)
  {
    v10 = (void *)*((_QWORD *)a1[4] + 1);
    objc_msgSend(v3, "candidateId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "dateIntervalForPrediction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "startDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "linkActionBiomeEventFromCandidateId:date:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v3, "anchorType");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXAnchor anchorTypeStringToClassName:](ATXAnchor, "anchorTypeStringToClassName:", v15);
      v16 = objc_claimAutoreleasedReturnValue();

      v33 = (void *)v16;
      v17 = objc_msgSend(a1[5], "containsObject:", v16) ^ 1;
      +[ATXProactiveSuggestionBuilder predictionReasonForAnchorModelPrediction:](ATXProactiveSuggestionBuilder, "predictionReasonForAnchorModelPrediction:", v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_alloc(MEMORY[0x1E0CF8F08]);
      objc_msgSend(v14, "eventBody");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bundleIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "eventBody");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "action");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)objc_msgSend(v19, "initWithBundleId:action:", v21, v23);

      objc_msgSend(v3, "score");
      v26 = v25;
      objc_msgSend(a1[4], "clientModelSpec");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXProactiveSuggestionBuilder proactiveSuggestionForLinkActionPrediction:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:](ATXProactiveSuggestionBuilder, "proactiveSuggestionForLinkActionPrediction:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:", v24, v27, v18, v17, v26, v5, v7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
      {
        objc_msgSend(a1[6], "updatedLinkActionSuggestion:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
          v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v3, v29);
        else
          v30 = 0;
        v31 = v33;

      }
      else
      {
        v30 = 0;
        v31 = v33;
      }

    }
    else
    {
      v30 = 0;
    }

  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (id)appAnchorModelPredictionTuplesForBlendingLayerFromPredictions:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[5];
  id v10;

  objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_24_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXAnchorModelHyperParameters anchorsDisabledForHomescreen](self->_hyperParameters, "anchorsDisabledForHomescreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __99__ATXAnchorModelPredictionForwarder_appAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke_2;
  v9[3] = &unk_1E82DF5E0;
  v9[4] = self;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "_pas_mappedArrayWithTransform:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __99__ATXAnchorModelPredictionForwarder_appAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  ATXAnchorModelAppPredictionPostProcessor *v3;
  uint64_t v4;

  v2 = a2;
  v3 = -[ATXAnchorModelAppPredictionPostProcessor initWithAnchorModelPrediction:]([ATXAnchorModelAppPredictionPostProcessor alloc], "initWithAnchorModelPrediction:", v2);

  v4 = -[ATXAnchorModelAppPredictionPostProcessor shouldPredictAnchorModelAppPrediction](v3, "shouldPredictAnchorModelAppPrediction");
  return v4;
}

id __99__ATXAnchorModelPredictionForwarder_appAnchorModelPredictionTuplesForBlendingLayerFromPredictions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "mediumBlendingConfidenceScoreThreshold");
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "highBlendingConfidenceScoreThreshold");
  v7 = v6;
  objc_msgSend(v3, "anchorType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXAnchor anchorTypeStringToClassName:](ATXAnchor, "anchorTypeStringToClassName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9) ^ 1;
  objc_msgSend(*(id *)(a1 + 32), "clientModelSpec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestionBuilder proactiveSuggestionForAppWithAnchorModelPrediction:clientModelSpec:mediumThreshold:highThreshold:allowedOnHomescreen:](ATXProactiveSuggestionBuilder, "proactiveSuggestionForAppWithAnchorModelPrediction:clientModelSpec:mediumThreshold:highThreshold:allowedOnHomescreen:", v3, v11, v10, v5, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v3, v12);
  else
    v13 = 0;

  return v13;
}

- (id)modeAnchorModelSuggestionsFromPredictions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _UNKNOWN **v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  id v28;
  uint64_t v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v28 = (id)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v32;
    v7 = &off_1E82D6000;
    do
    {
      v8 = 0;
      v29 = v5;
      do
      {
        if (*(_QWORD *)v32 != v6)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v8);
        v10 = (void *)objc_msgSend(objc_alloc((Class)v7[385]), "initWithAnchorModelPrediction:", v9);
        if (objc_msgSend(v10, "shouldPredictAnchorModelModePrediction"))
        {
          objc_msgSend(v9, "candidateId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          +[ATXAnchorModelDataStoreWrapper modeDetailsFromModeCandidateId:](ATXAnchorModelDataStoreWrapper, "modeDetailsFromModeCandidateId:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = objc_alloc(MEMORY[0x1E0D80DF8]);
          objc_msgSend(v12, "modeUUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v12, "isStart");
          objc_msgSend(v9, "anchorType");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "score");
          v18 = v17;
          v19 = v6;
          v20 = objc_msgSend(v9, "numUniqueOccurrencesAfterAnchor");
          objc_msgSend(v9, "posteriorProbability");
          v22 = v21;
          objc_msgSend(v9, "classConditionalProbability");
          v24 = v23;
          objc_msgSend(v10, "serializedTriggers");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)objc_msgSend(v13, "initWithModeUUID:isStart:anchorType:score:numUniqueOccurrencesAfterAnchor:posteriorProbability:classConditionalProbability:serializedTriggers:", v14, v15, v16, v20, v25, v18, v22, v24);

          objc_msgSend(v28, "addObject:", v26);
          v6 = v19;
          v7 = &off_1E82D6000;

          v5 = v29;
        }

        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v5);
  }

  return v28;
}

- (ATXProactiveSuggestionClientModel)anchorModelClientModel
{
  return self->_anchorModelClientModel;
}

- (void)setAnchorModelClientModel:(id)a3
{
  objc_storeStrong((id *)&self->_anchorModelClientModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeSuggestionClient, 0);
  objc_storeStrong((id *)&self->_hyperParameters, 0);
  objc_storeStrong((id *)&self->_anchorModelClientModel, 0);
  objc_storeStrong((id *)&self->_storeWrapper, 0);
}

@end
