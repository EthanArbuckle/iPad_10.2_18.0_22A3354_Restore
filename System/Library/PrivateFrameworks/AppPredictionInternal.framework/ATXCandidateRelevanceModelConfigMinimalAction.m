@implementation ATXCandidateRelevanceModelConfigMinimalAction

- (ATXCandidateRelevanceModelConfigMinimalAction)init
{
  ATXCandidateRelevanceModelConfigMinimalAction *v2;
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *v3;
  void *v4;
  ATXCandidateRelevanceLogisticRegressionModelTrainingPlan *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)ATXCandidateRelevanceModelConfigMinimalAction;
  v2 = -[ATXCandidateRelevanceModelConfig init](&v15, sel_init);
  if (v2)
  {
    v3 = [ATXCandidateRelevanceLogisticRegressionModelTrainingPlan alloc];
    -[ATXCandidateRelevanceModelConfig modelTrainingPlanParameters](v2, "modelTrainingPlanParameters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[ATXCandidateRelevanceLogisticRegressionModelTrainingPlan initWithParameters:](v3, "initWithParameters:", v4);
    -[ATXCandidateRelevanceModelConfig setModelTrainingPlan:](v2, "setModelTrainingPlan:", v5);

    v6 = (void *)objc_opt_new();
    -[ATXCandidateRelevanceModelConfig setDatastore:](v2, "setDatastore:", v6);

    v7 = objc_alloc(MEMORY[0x1E0D81198]);
    objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "blendingLayerServer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithClientModelId:blendingLayerServer:", v8, v10);
    -[ATXCandidateRelevanceModelConfig setClientModel:](v2, "setClientModel:", v11);

    +[ATXActionPredictionBlacklist sharedInstanceWithAppPredictionBlacklist](ATXActionPredictionBlacklist, "sharedInstanceWithAppPredictionBlacklist");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCandidateRelevanceModelConfigMinimalAction setActionBlacklist:](v2, "setActionBlacklist:", v12);

    +[ATXDigitalHealthBlacklist sharedInstance](ATXDigitalHealthBlacklist, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCandidateRelevanceModelConfigMinimalAction setAppDigitalHealthBlacklist:](v2, "setAppDigitalHealthBlacklist:", v13);

  }
  return v2;
}

- (id)datasetGenerator
{
  ATXCandidateRelevanceModelDatasetGenerator *v2;
  void *v3;
  ATXCandidateRelevanceModelDatasetGenerator *v4;

  v2 = [ATXCandidateRelevanceModelDatasetGenerator alloc];
  v3 = (void *)objc_opt_new();
  v4 = -[ATXCandidateRelevanceModelDatasetGenerator initWithConfig:](v2, "initWithConfig:", v3);

  return v4;
}

- (id)candidatePublisherFromStartTime:(double)a3
{
  return +[ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction candidatePublisherFromStartTime:](ATXCandidateRelevanceModelDatasetGeneratorConfigMinimalAction, "candidatePublisherFromStartTime:", a3);
}

- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  objc_msgSend(a3, "biomeStoreData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionFromDatastoreLookup");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_5;
  v8 = (void *)v7;
  objc_msgSend(v6, "actionType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("INPlayMediaIntent"));

  if (!v10
    || (+[ATXMediaActionPrediction updatedPlayMediaAction:](ATXMediaActionPrediction, "updatedPlayMediaAction:", v8), v11 = objc_claimAutoreleasedReturnValue(), v8, (v8 = (void *)v11) != 0))
  {
    v12 = objc_alloc(MEMORY[0x1E0D811A0]);
    -[ATXCandidateRelevanceModelConfig clientModel](self, "clientModel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientModelId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v14, CFSTR("1.0"), 0);

    v16 = objc_alloc(MEMORY[0x1E0CF9090]);
    *(float *)&v17 = a4;
    v18 = (void *)objc_msgSend(v16, "initWithPredictedItem:score:", v8, v17);
    +[ATXProactiveSuggestionBuilder _executableSpecForScoredAction:](ATXProactiveSuggestionBuilder, "_executableSpecForScoredAction:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 2, a4);
    v21 = (void *)objc_opt_new();
    objc_msgSend(v21, "actionBehavioralReason");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXProactiveSuggestionBuilder _uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:](ATXProactiveSuggestionBuilder, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:", v18, v20, v15, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v15, v19, v23, v20);
  }
  else
  {
LABEL_5:
    v24 = 0;
  }

  return v24;
}

- (BOOL)candidateIsStillValidToSuggest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  char v16;

  objc_msgSend(a3, "biomeStoreData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCandidateRelevanceModelConfig installedAppsKnownToSpringBoard](self, "installedAppsKnownToSpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  -[ATXCandidateRelevanceModelConfigMinimalAction actionBlacklist](self, "actionBlacklist");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "shouldPredictBundleId:action:", v9, v10);

  -[ATXCandidateRelevanceModelConfigMinimalAction appDigitalHealthBlacklist](self, "appDigitalHealthBlacklist");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "blacklistedBundleIds");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "containsObject:", v14);

  if (v7)
    v16 = v11 & (v15 ^ 1);
  else
    v16 = 0;

  return v16;
}

- (id)heuristicSuggestionsForContext:(id)a3 currentSuggestionExecutableIds:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
}

- (ATXDigitalHealthBlacklist)appDigitalHealthBlacklist
{
  return self->_appDigitalHealthBlacklist;
}

- (void)setAppDigitalHealthBlacklist:(id)a3
{
  objc_storeStrong((id *)&self->_appDigitalHealthBlacklist, a3);
}

- (ATXActionPredictionBlacklist)actionBlacklist
{
  return self->_actionBlacklist;
}

- (void)setActionBlacklist:(id)a3
{
  objc_storeStrong((id *)&self->_actionBlacklist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBlacklist, 0);
  objc_storeStrong((id *)&self->_appDigitalHealthBlacklist, 0);
}

@end
