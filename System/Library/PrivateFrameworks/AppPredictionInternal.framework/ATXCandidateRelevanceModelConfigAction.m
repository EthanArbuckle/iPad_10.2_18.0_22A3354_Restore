@implementation ATXCandidateRelevanceModelConfigAction

- (ATXCandidateRelevanceModelConfigAction)init
{
  ATXCandidateRelevanceModelConfigAction *v2;
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
  v15.super_class = (Class)ATXCandidateRelevanceModelConfigAction;
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
    -[ATXCandidateRelevanceModelConfigAction setActionBlacklist:](v2, "setActionBlacklist:", v12);

    +[ATXDigitalHealthBlacklist sharedInstance](ATXDigitalHealthBlacklist, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXCandidateRelevanceModelConfigAction setAppDigitalHealthBlacklist:](v2, "setAppDigitalHealthBlacklist:", v13);

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
  return +[ATXCandidateRelevanceModelDatasetGeneratorConfigAction candidatePublisherFromStartTime:](ATXCandidateRelevanceModelDatasetGeneratorConfigAction, "candidatePublisherFromStartTime:", a3);
}

- (id)proactiveSuggestionForCandidate:(id)a3 prediction:(float)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v6 = (objc_class *)MEMORY[0x1E0D811A0];
  v7 = a3;
  v8 = [v6 alloc];
  -[ATXCandidateRelevanceModelConfig clientModel](self, "clientModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientModelId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v10, CFSTR("1.0"), 0);

  objc_msgSend(v7, "biomeStoreData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    goto LABEL_5;
  objc_msgSend(v12, "actionKey");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("INPlayMediaIntent"));

  if (!v15
    || (+[ATXMediaActionPrediction updatedPlayMediaAction:](ATXMediaActionPrediction, "updatedPlayMediaAction:", v12), v16 = objc_claimAutoreleasedReturnValue(), v12, (v12 = (void *)v16) != 0))
  {
    v17 = objc_alloc(MEMORY[0x1E0CF9090]);
    *(float *)&v18 = a4;
    v19 = (void *)objc_msgSend(v17, "initWithPredictedItem:score:", v12, v18);
    +[ATXProactiveSuggestionBuilder _executableSpecForScoredAction:](ATXProactiveSuggestionBuilder, "_executableSpecForScoredAction:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 2, a4);
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "actionBehavioralReason");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXProactiveSuggestionBuilder _uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:](ATXProactiveSuggestionBuilder, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:", v19, v21, v11, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v11, v20, v24, v21);
  }
  else
  {
LABEL_5:
    v25 = 0;
  }

  return v25;
}

- (BOOL)candidateIsStillValidToSuggest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;

  objc_msgSend(a3, "biomeStoreData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_ATXActionUtils getActionTypeFromActionKey:](_ATXActionUtils, "getActionTypeFromActionKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ATXCandidateRelevanceModelConfig installedAppsKnownToSpringBoard](self, "installedAppsKnownToSpringBoard");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "containsObject:", v8);

    -[ATXCandidateRelevanceModelConfigAction actionBlacklist](self, "actionBlacklist");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "shouldPredictBundleId:action:", v11, v6);

    -[ATXCandidateRelevanceModelConfigAction appDigitalHealthBlacklist](self, "appDigitalHealthBlacklist");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "blacklistedBundleIds");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "containsObject:", v15);

    if (v9)
      v17 = v12 & (v16 ^ 1);
    else
      v17 = 0;
  }
  else
  {
    v17 = 0;
  }

  return v17;
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
