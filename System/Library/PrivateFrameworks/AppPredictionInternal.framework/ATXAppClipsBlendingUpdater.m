@implementation ATXAppClipsBlendingUpdater

+ (id)appClipsClientModelSpecification
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 13);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D811A0]);
  objc_msgSend(v2, "appClipsModelVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v3, v5, 0);

  return v6;
}

+ (void)updateBlendingLayerWithHeroAppPredictions:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a3;
  +[ATXHeroAndClipConstants sharedInstance](ATXHeroAndClipConstants, "sharedInstance");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "appClipsClientModelSpecification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appClipsMediumConfidenceScoreThreshold");
  v6 = v5;
  objc_msgSend(v14, "appClipsHighConfidenceScoreThreshold");
  +[ATXProactiveSuggestionBuilder proactiveSuggestionForAppClipsFromHeroAppPredictions:clientModelSpec:mediumThreshold:highThreshold:](ATXProactiveSuggestionBuilder, "proactiveSuggestionForAppClipsFromHeroAppPredictions:clientModelSpec:mediumThreshold:highThreshold:", v3, v4, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0D81198]);
  objc_msgSend(v4, "clientModelId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXClientModelSuggestionReceiver sharedInstance](ATXClientModelSuggestionReceiver, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "blendingLayerServer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithClientModelId:blendingLayerServer:", v10, v12);

  objc_msgSend(v13, "updateSuggestions:", v8);
}

@end
