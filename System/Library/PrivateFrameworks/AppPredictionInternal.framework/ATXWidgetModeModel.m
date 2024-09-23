@implementation ATXWidgetModeModel

- (ATXWidgetModeModel)initWithMode:(unint64_t)a3 globalWidgetPopularityModel:(id)a4
{
  id v7;
  ATXWidgetModeModel *v8;
  ATXWidgetModeModel *v9;
  uint64_t v10;
  ATXWidgetModeEntityModelWeights *widgetModeEntityModelWeights;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ATXWidgetModeModel;
  v8 = -[ATXWidgetModeModel init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    v10 = objc_opt_new();
    widgetModeEntityModelWeights = v9->_widgetModeEntityModelWeights;
    v9->_widgetModeEntityModelWeights = (ATXWidgetModeEntityModelWeights *)v10;

    objc_storeStrong((id *)&v9->_widgetPopularityModel, a4);
  }

  return v9;
}

- (id)scoredEntitiesWithScoredAppEntities:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  ATXModeEntityCorrelator *v21;
  _QWORD v22[5];
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  +[ATXWidgetModeModel fetchAvailableWidgets](ATXWidgetModeModel, "fetchAvailableWidgets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXModeEntityModelTrainer eventProviderForMode:](ATXModeEntityModelTrainer, "eventProviderForMode:", self->_mode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v21 = -[ATXModeEntityCorrelator initWithModeEventProvider:entityEventProvider:]([ATXModeEntityCorrelator alloc], "initWithModeEventProvider:entityEventProvider:", v7, 0);
    -[ATXModeEntityCorrelator entityFeaturesForWidgetScoring](v21, "entityFeaturesForWidgetScoring");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __58__ATXWidgetModeModel_scoredEntitiesWithScoredAppEntities___block_invoke;
    v25[3] = &unk_1E82DB268;
    v25[4] = self;
    v10 = v6;
    v26 = v10;
    v11 = v6;
    v12 = v4;
    v13 = v4;
    v27 = v13;
    v14 = v5;
    v28 = v14;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v25);
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __58__ATXWidgetModeModel_scoredEntitiesWithScoredAppEntities___block_invoke_2;
    v22[3] = &unk_1E82DB290;
    v22[4] = self;
    v15 = v13;
    v4 = v12;
    v6 = v11;
    v23 = v15;
    v16 = v14;
    v24 = v16;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v22);
    v17 = v24;
    v18 = v16;

  }
  else
  {
    __atxlog_handle_modes();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      -[ATXWidgetModeModel scoredEntitiesWithScoredAppEntities:].cold.1(v19);

  }
  return v5;
}

void __58__ATXWidgetModeModel_scoredEntitiesWithScoredAppEntities___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "widgetModeEntityForWidgetId:widgetFeatures:availableWidgets:scoredAppEntities:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 56), "setObject:forKey:", v3, v4);

}

void __58__ATXWidgetModeModel_scoredEntitiesWithScoredAppEntities___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  for (i = 1; i != 5; ++i)
  {
    objc_msgSend(*(id *)(a1 + 32), "widgetModeEntityForDescriptor:widgetSize:scoredAppEntities:", a3, i, *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = *(void **)(a1 + 48);
      objc_msgSend(v6, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v11 = *(void **)(a1 + 48);
        objc_msgSend(v7, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v7, v12);

      }
    }

  }
}

+ (id)fetchAvailableWidgets
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0CF9210], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "homeScreenDescriptors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__ATXWidgetModeModel_fetchAvailableWidgets__block_invoke;
  v7[3] = &unk_1E82DB2B8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __43__ATXWidgetModeModel_fetchAvailableWidgets__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v3, "extensionIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containerBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extensionBundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "kind");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@:%@:%@"), v6, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __43__ATXWidgetModeModel_fetchAvailableWidgets__block_invoke_cold_1(v3, v12);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, v10);
  }

}

- (id)widgetModeEntityForWidgetId:(id)a3 widgetFeatures:(id)a4 availableWidgets:(id)a5 scoredAppEntities:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  ATXWidgetModeModel *v39;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v9, "entity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "widget");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "extensionIdentity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containerBundleIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  if (!v15)
    goto LABEL_8;
  v16 = (void *)v15;
  objc_msgSend(v13, "extensionIdentity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "extensionBundleIdentifier");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!v18)
  {

LABEL_8:
    goto LABEL_9;
  }
  v19 = (void *)v18;
  objc_msgSend(v13, "kind");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v39 = self;
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v13, "extensionIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "containerBundleIdentifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extensionIdentity");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "extensionBundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "kind");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("%@:%@:%@"), v23, v25, v26);

    objc_msgSend(v10, "objectForKeyedSubscript:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      objc_msgSend(v13, "extensionIdentity");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "containerBundleIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXWidgetModeModel scoredWidgetModeEntityWithWidgetFeatures:widget:scoredApp:](v39, "scoredWidgetModeEntityWithWidgetFeatures:widget:scoredApp:", v9, v13, v31);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_12;
  }
LABEL_9:
  __atxlog_handle_modes();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v13, "extensionIdentity");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "containerBundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "extensionIdentity");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "extensionBundleIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "kind");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v41 = "-[ATXWidgetModeModel widgetModeEntityForWidgetId:widgetFeatures:availableWidgets:scoredAppEntities:]";
    v42 = 2112;
    v43 = v34;
    v44 = 2112;
    v45 = v36;
    v46 = 2112;
    v47 = v37;
    _os_log_impl(&dword_1C9A3B000, v32, OS_LOG_TYPE_DEFAULT, "%s: Widget properties containerBundleIdentifier:'%@' extensionBundleIdentifier:'%@' kind:'%@' must all be non-null in order to be scored.", buf, 0x2Au);

  }
  v28 = 0;
LABEL_12:

  return v28;
}

- (id)widgetModeEntityForDescriptor:(id)a3 widgetSize:(int64_t)a4 scoredAppEntities:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v9 = a5;
  v10 = CHSWidgetFamilyMaskFromWidgetFamily();
  if ((objc_msgSend(v8, "supportedFamilies") & v10) != 0)
  {
    v11 = objc_alloc(MEMORY[0x1E0D10148]);
    objc_msgSend(v8, "extensionIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "kind");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithExtensionIdentity:kind:family:intent:activityIdentifier:", v12, v13, a4, 0, 0);

    objc_msgSend(v8, "extensionIdentity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "containerBundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    -[ATXWidgetModeModel scoredWidgetModeEntityWithWidgetFeatures:widget:scoredApp:](self, "scoredWidgetModeEntityWithWidgetFeatures:widget:scoredApp:", 0, v14, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)scoredWidgetModeEntityWithWidgetFeatures:(id)a3 widget:(id)a4 scoredApp:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v8 = a3;
  v9 = a5;
  if (!v8)
  {
    v10 = a4;
    v8 = (id)objc_opt_new();
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9218]), "initWithWidget:", v10);

    objc_msgSend(v8, "setEntity:", v11);
  }
  -[ATXWidgetModeModel addEntitySpecificFeaturesToWidgetFeatures:scoredApp:](self, "addEntitySpecificFeaturesToWidgetFeatures:scoredApp:", v8, v9);
  -[ATXWidgetModeModel scoreFromCorrelationStatistics:](self, "scoreFromCorrelationStatistics:", v8);
  v13 = v12;
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setScore:", v13);
  objc_msgSend(v8, "jsonRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFeatureVector:", v15);

  objc_msgSend(v8, "entity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setScoreMetadata:", v14);

  objc_msgSend(v8, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)addEntitySpecificFeaturesToWidgetFeatures:(id)a3 scoredApp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v6 = a3;
  if (v6)
  {
    v28 = v6;
    v7 = a4;
    objc_msgSend(v28, "entitySpecificFeatures");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = v8;
    else
      v10 = (id)objc_opt_new();
    v11 = v10;

    v12 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "scoreMetadata");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "score");
    objc_msgSend(v12, "numberWithDouble:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setParentAppScore:", v14);

    objc_msgSend(v28, "entity");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "widget");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(v16, "extensionIdentity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "extensionBundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "kind");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v17, "initWithFormat:", CFSTR("%@:%@"), v19, v20);

    v22 = (void *)MEMORY[0x1E0CB37E8];
    -[ATXGlobalWidgetPopularityModel scoreForBundleIdAndKind:scalingFactor:](self->_widgetPopularityModel, "scoreForBundleIdAndKind:scalingFactor:", v21, 1.0);
    objc_msgSend(v22, "numberWithDouble:");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWidgetGlobalPrior:", v23);
    objc_msgSend(v7, "scoreMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "featureVector");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("correlationEntitySpecificFeatures"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("globalModeAffinityPrior"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
      objc_msgSend(v11, "setParentAppGlobalPrior:", v27);
    objc_msgSend(v28, "setEntitySpecificFeatures:", v11);

    v6 = v28;
  }

}

- (double)scoreFromCorrelationStatistics:(id)a3
{
  ATXWidgetModeEntityModelWeights *widgetModeEntityModelWeights;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  unsigned int v23;
  float v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;

  widgetModeEntityModelWeights = self->_widgetModeEntityModelWeights;
  v5 = a3;
  -[ATXWidgetModeEntityModelWeights classConditionalProbability](widgetModeEntityModelWeights, "classConditionalProbability");
  v7 = v6;
  objc_msgSend(v5, "classConditionalProbability");
  v9 = v7 * v8;
  v10 = objc_msgSend(v5, "globalOccurrences");
  -[ATXWidgetModeEntityModelWeights globalPopularity](self->_widgetModeEntityModelWeights, "globalPopularity");
  v12 = v11;
  objc_msgSend(v5, "globalPopularity");
  v14 = v12 * v13;
  -[ATXWidgetModeEntityModelWeights posteriorProbability](self->_widgetModeEntityModelWeights, "posteriorProbability");
  v16 = v15;
  objc_msgSend(v5, "posteriorProbability");
  v18 = v16 * v17;
  -[ATXWidgetModeEntityModelWeights modePopularity](self->_widgetModeEntityModelWeights, "modePopularity");
  v20 = v19;
  objc_msgSend(v5, "modePopularity");
  v22 = v20 * v21;
  v23 = objc_msgSend(v5, "entityOccurredInModeOverLastNDays:", -[ATXWidgetModeEntityModelWeights numOfDays](self->_widgetModeEntityModelWeights, "numOfDays"));
  v24 = v14 + v9 + v18 + v22;
  v25 = (float)(1.0 / (float)(expf(-v24) + 1.0));
  if (v10)
    v26 = v25;
  else
    v26 = 0.0;
  if ((unint64_t)objc_msgSend(v5, "uniqueOccurrencesInMode") < 3)
    v26 = v26 * (double)v23 * 0.5;
  objc_msgSend(v5, "entitySpecificFeatures");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "parentAppScore");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "doubleValue");
  -[ATXWidgetModeModel combineWidgetModeProbability:withAppModeProbabiilty:](self, "combineWidgetModeProbability:withAppModeProbabiilty:", v26, v29);
  v31 = v30;

  return v31;
}

- (double)combineWidgetModeProbability:(double)a3 withAppModeProbabiilty:(double)a4
{
  double v6;

  -[ATXWidgetModeEntityModelWeights weightForWidgetProbability](self->_widgetModeEntityModelWeights, "weightForWidgetProbability");
  return (1.0 - v6) * a4 + a3 * v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widgetPopularityModel, 0);
  objc_storeStrong((id *)&self->_widgetModeEntityModelWeights, 0);
}

- (void)scoredEntitiesWithScoredAppEntities:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "ATXWidgetModeModel: nil mode event provider; unable to generate mode afffinity scores for widgets.",
    v1,
    2u);
}

void __43__ATXWidgetModeModel_fetchAvailableWidgets__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "extensionIdentity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "extensionIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "kind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v5;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXWidgetModeModel: duplicate descriptor for containerBundleIdentifier:%@, extensionBundleIdentifier: %@, kind:%@", (uint8_t *)&v9, 0x20u);

}

@end
