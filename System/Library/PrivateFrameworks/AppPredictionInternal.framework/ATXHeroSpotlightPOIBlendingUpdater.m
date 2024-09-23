@implementation ATXHeroSpotlightPOIBlendingUpdater

+ (void)updateBlendingLayerWithHeroAppPredictions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(a1, "clientModelSpecForHeroSpotlightPOIPredictions");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[ATXProactiveSuggestionBuilder proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions:clientModelSpec:](ATXProactiveSuggestionBuilder, "proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions:clientModelSpec:", v4, v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "clientModelForHeroSpotlightPOIPredictions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateSuggestions:", v5);

}

+ (id)clientModelSpecForHeroSpotlightPOIPredictions
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 45);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v2, CFSTR("1.0"), 0);

  return v3;
}

+ (id)clientModelForHeroSpotlightPOIPredictions
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 45);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0D81198]);
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blendingLayerServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithClientModelId:blendingLayerServer:", v2, v5);

  return v6;
}

@end
