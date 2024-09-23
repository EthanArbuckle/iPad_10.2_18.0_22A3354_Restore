@implementation ATXProactiveSuggestionBuilder

+ (id)proactiveSuggestionsForAppsWithMagicalMomentsMap:(id)a3 clientModelSpec:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)objc_opt_new();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v20 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKeyedSubscript:", v15, (_QWORD)v19);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_proactiveSuggestionFromMagicalMomentsPredictionBundleId:mmSignals:clientModelSpec:reasons:", v15, v16, v7, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v9, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v12);
  }

  return v9;
}

+ (id)proactiveSuggestionsForAppsWithHeroAppPredictions:(id)a3 clientModelSpec:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__ATXProactiveSuggestionBuilder_proactiveSuggestionsForAppsWithHeroAppPredictions_clientModelSpec___block_invoke;
  v12[3] = &unk_1E82DCA18;
  v13 = v5;
  v14 = v7;
  v8 = v7;
  v9 = v5;
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions:(id)a3 clientModelSpec:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __107__ATXProactiveSuggestionBuilder_proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions_clientModelSpec___block_invoke;
  v9[3] = &unk_1E82DCA40;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)proactiveSuggestionsForAnchorModelFromScoredActionWithReason:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 allowedOnHomescreen:(BOOL)a7 predictionReasons:(unint64_t)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v9 = a7;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "scoredAction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reason");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "proactiveSuggestionsFromScoredAction:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:predictionReasons:", v16, v14, v17, v9, a8, a5, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)proactiveSuggestionForAppWithAnchorModelPrediction:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 allowedOnHomescreen:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;

  v7 = a7;
  v12 = a4;
  v13 = a3;
  objc_msgSend(a1, "predictionReasonForAnchorModelPrediction:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = &stru_1E82FDC98;
  if (v14)
    v16 = (__CFString *)v14;
  v17 = v16;

  objc_msgSend(v13, "candidateId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "score");
  v20 = v19;

  objc_msgSend(a1, "proactiveSuggestionForAppWithBundleId:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:", v18, v12, v17, v7, v20, a5, a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (id)predictionReasonForAnchorModelPrediction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "anchorType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[ATXAnchor anchorClassFromAnchorTypeString:](ATXAnchor, "anchorClassFromAnchorTypeString:", v5);

  if (!v6)
  {
    __atxlog_handle_anchor();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      +[ATXProactiveSuggestionBuilder predictionReasonForAnchorModelPrediction:].cold.1(v3, v7);

  }
  objc_msgSend(v3, "anchorEvent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class anchorOccurenceDateFromDuetEvent:](v6, "anchorOccurenceDateFromDuetEvent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "actionAnchorReasonForAnchorType:", CFSTR("Generic"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "candidateType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("app"));

  if (v12)
  {
    v13 = (void *)objc_opt_new();
    objc_msgSend(v13, "timeIntervalSince1970");
    v15 = v14;
    objc_msgSend(v9, "timeIntervalSince1970");
    v17 = v15 - v16;

    if (v17 < 480.0)
    {
      objc_msgSend(v3, "anchorType");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appAnchorReasonForAnchorType:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
LABEL_14:
      v29 = (void *)v19;

      v10 = (void *)v18;
LABEL_17:

      v10 = v29;
      goto LABEL_18;
    }
    objc_msgSend(v4, "appAnchorReasonForAnchorType:", CFSTR("Generic"));
    v21 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  objc_msgSend(v3, "candidateType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", CFSTR("action")))
  {

LABEL_12:
    v24 = (void *)objc_opt_new();
    objc_msgSend(v24, "timeIntervalSince1970");
    v26 = v25;
    objc_msgSend(v9, "timeIntervalSince1970");
    v28 = v26 - v27;

    if (v28 < 480.0)
    {
      objc_msgSend(v3, "anchorType");
      v18 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "actionAnchorReasonForAnchorType:", v18);
      v19 = objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    objc_msgSend(v4, "actionAnchorReasonForAnchorType:", CFSTR("Generic"));
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v29 = (void *)v21;
    goto LABEL_17;
  }
  objc_msgSend(v3, "candidateType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("linkaction"));

  if (v23)
    goto LABEL_12;
LABEL_18:

  return v10;
}

+ (unint64_t)predictionReasonsForAnchorModelPrediction:(id)a3
{
  void *v3;
  int64_t v4;

  objc_msgSend(a3, "anchorType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[ATXAnchor stringToAnchorType:](ATXAnchor, "stringToAnchorType:", v3);

  if (v4 == 20)
    return 0x1000000000;
  else
    return (unint64_t)(v4 == 21) << 37;
}

+ (id)proactiveSuggestionForLinkActionPrediction:(id)a3 score:(double)a4 clientModelSpec:(id)a5 mediumThreshold:(double)a6 highThreshold:(double)a7 predictionReason:(id)a8 allowedOnHomescreen:(BOOL)a9
{
  _BOOL4 v9;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  _BOOL4 v51;
  uint64_t v52;
  void *v53;
  id v54;
  id v55;

  v9 = a9;
  v16 = a3;
  v17 = a5;
  v54 = a8;
  objc_msgSend(a1, "_scoreSpecForScore:highThreshold:mediumThreshold:", a4, a7, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v16, "bundleId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "action");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v19, "initWithFormat:", CFSTR("%@:%@"), v20, v22);

  v23 = (void *)objc_opt_new();
  objc_msgSend(v16, "bundleId");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "action");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "identifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = 0;
  v53 = v23;
  objc_msgSend(v23, "actionForBundleIdentifier:andActionIdentifier:error:", v24, v26, &v55);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v55;

  v29 = v28;
  if (v28)
  {
    v30 = v27;
    v31 = v18;
    __atxlog_handle_anchor();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      v35 = (void *)v52;
      +[ATXProactiveSuggestionBuilder proactiveSuggestionForLinkActionPrediction:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:].cold.1();
      v33 = 0;
      v34 = v54;
    }
    else
    {
      v33 = 0;
      v34 = v54;
      v35 = (void *)v52;
    }
  }
  else
  {
    v51 = v9;
    objc_msgSend(v27, "title");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "key");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = v37;
    v30 = v27;
    if (v37)
    {
      v32 = v37;
    }
    else
    {
      objc_msgSend(v16, "action");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "identifier");
      v32 = objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v27, "descriptionMetadata");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "descriptionText");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "key");
    v42 = objc_claimAutoreleasedReturnValue();

    v49 = (void *)v42;
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ | %@"), v32, v42);
    v35 = (void *)v52;
    v43 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A8]), "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v16, v50, v52, 10);
    if (objc_msgSend(v18, "suggestedConfidenceCategory") <= 2)
      v44 = 44;
    else
      v44 = 40;
    objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", v44);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v47) = 256;
    v31 = v18;
    v34 = v54;
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811D0]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v32, v42, v54, v48, 0, v51, v47);
    v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v17, v43, v45, v31);

    v29 = 0;
  }

  return v33;
}

+ (id)_proactiveSuggestionFromMagicalMomentsPredictionBundleId:(id)a3 mmSignals:(id)a4 clientModelSpec:(id)a5 reasons:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if ((unint64_t)objc_msgSend(v11, "predictionIndex") <= 2)
  {
    objc_msgSend(a1, "_executableSpecForAppWithBundleId:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_scoreSpecForMagicalMomentsPredictionWithMmSignals:", v11);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appMagicalMomentReasonForAnchorType:", objc_msgSend(v11, "anchorType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_uiSpecForMMAppWithBundleId:scoreSpec:predictionReasonString:anchor:predictionReasons:", v10, v16, v17, objc_msgSend(v11, "anchorType"), objc_msgSend(v11, "atxReason"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v12, v15, v18, v16);
    }
    else
    {
      __atxlog_handle_default();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        +[ATXProactiveSuggestionBuilder _proactiveSuggestionFromMagicalMomentsPredictionBundleId:mmSignals:clientModelSpec:reasons:].cold.1();

      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

+ (id)_uiSpecForMMAppWithBundleId:(id)a3 scoreSpec:(id)a4 predictionReasonString:(id)a5 anchor:(int64_t)a6 predictionReasons:(unint64_t)a7
{
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v18;

  v12 = a5;
  v13 = a3;
  if (objc_msgSend(a4, "suggestedConfidenceCategory") <= 2)
    v14 = 2;
  else
    v14 = 42;
  objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v18) = 1;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811D0]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v13, 0, v12, v15, 0, objc_msgSend(a1, "isMMAnchorWhitelistedForHomeScreen:", a6), v18, a7);

  return v16;
}

+ (id)_scoreSpecForMagicalMomentsPredictionWithMmSignals:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  id v6;
  void *v7;

  v3 = a3;
  if (objc_msgSend(v3, "predictionIndex"))
  {
    v4 = 2;
  }
  else
  {
    objc_msgSend(v3, "confidence");
    if (v5 > 0.25)
      v4 = 4;
    else
      v4 = 2;
  }
  v6 = objc_alloc(MEMORY[0x1E0D811C0]);
  objc_msgSend(v3, "confidence");
  v7 = (void *)objc_msgSend(v6, "initWithRawScore:suggestedConfidenceCategory:", v4);

  return v7;
}

+ (BOOL)isMMAnchorWhitelistedForHomeScreen:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "whitelistedAnchorsForMagicalMomentsOnHomeScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);

  return (char)v4;
}

+ (id)proactiveSuggestionsForLockscreenActions:(id)a3 clientModelSpec:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__ATXProactiveSuggestionBuilder_proactiveSuggestionsForLockscreenActions_clientModelSpec___block_invoke;
  v10[3] = &unk_1E82DC9F0;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a3, "_pas_mappedArrayWithTransform:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __90__ATXProactiveSuggestionBuilder_proactiveSuggestionsForLockscreenActions_clientModelSpec___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_blending();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v3;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "lockscreen: converting action to proactive suggestion: %@", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "proactiveSuggestionForLockscreenAction:clientModelSpec:", v3, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __90__ATXProactiveSuggestionBuilder_proactiveSuggestionsForLockscreenActions_clientModelSpec___block_invoke_cold_1();

  return v5;
}

+ (id)proactiveSuggestionForLockscreenAction:(id)a3 clientModelSpec:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  float v9;
  float v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "predictedItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D811C0]);
  objc_msgSend(v6, "score");
  v10 = v9;

  v11 = (void *)objc_msgSend(v8, "initWithRawScore:suggestedConfidenceCategory:", 4, v10);
  v12 = objc_alloc(MEMORY[0x1E0D811A8]);
  objc_msgSend(v7, "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v7, v13, v15, 2);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811B8]), "initWithApplicableSuggestionLayout:", 5);
  v18 = objc_alloc(MEMORY[0x1E0D811D0]);
  objc_msgSend(v7, "actionTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "actionSubtitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithTitle:subtitle:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:", v19, v20, v21, 1, 0, 0);

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v5, v16, v22, v11);
  return v23;
}

id __99__ATXProactiveSuggestionBuilder_proactiveSuggestionsForAppsWithHeroAppPredictions_clientModelSpec___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ATXProactiveSuggestionBuilder _proactiveSuggestionFromHeroAppPrediction:clientModelSpec:reasons:](ATXProactiveSuggestionBuilder, "_proactiveSuggestionFromHeroAppPrediction:clientModelSpec:reasons:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

+ (id)_proactiveSuggestionFromHeroAppPrediction:(id)a3 clientModelSpec:(id)a4 reasons:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "bundleId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_executableSpecForAppWithBundleId:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_scoreSpecForHeroAppPrediction:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appHeroAppReason");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_uiSpecForHeroAppPrediction:scoreSpec:predictionReason:", v8, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v9, v12, v15, v13);
  }
  else
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[ATXProactiveSuggestionBuilder _proactiveSuggestionFromHeroAppPrediction:clientModelSpec:reasons:].cold.1();

    v16 = 0;
  }

  return v16;
}

+ (id)_scoreSpecForHeroAppPrediction:(id)a3
{
  uint64_t v3;

  if (objc_msgSend(a3, "rank") == 1)
    v3 = 4;
  else
    v3 = 3;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", v3, 1.0);
}

+ (id)_uiSpecForHeroAppPrediction:(id)a3 scoreSpec:(id)a4 predictionReason:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _BOOL8 v15;
  unint64_t v16;
  void *v17;
  uint64_t v19;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "bundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "suggestedConfidenceCategory");

  if (v11 <= 2)
    v12 = 2;
  else
    v12 = 42;
  objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0D811D0]);
  v15 = (unint64_t)objc_msgSend(v9, "rank") < 3;
  v16 = objc_msgSend(v9, "rank");

  BYTE1(v19) = 0;
  LOBYTE(v19) = v16 > 2;
  v17 = (void *)objc_msgSend(v14, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v10, 0, v7, v13, 0, v15, v19);

  return v17;
}

id __107__ATXProactiveSuggestionBuilder_proactiveSuggestionsForSpotlightPOIWithHeroAppPredictions_clientModelSpec___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[ATXProactiveSuggestionBuilder _proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:clientModelSpec:](ATXProactiveSuggestionBuilder, "_proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:clientModelSpec:", a2, *(_QWORD *)(a1 + 32));
}

+ (id)_proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:(id)a3 clientModelSpec:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v6, "rank") < 3)
  {
    objc_msgSend(v6, "bundleId");
    v8 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "poiMuid");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    if (v8 && v11)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithPOIName:muid:criteria:", v8, v11, 0);
      objc_msgSend(a1, "_executableSpecForSpotlightAction:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_scoreSpecForHeroAppPrediction:", v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_uiSpecForSpotlightPOIPrediction:predictionReasons:", v8, 0x800000);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v7, v14, v16, v15);

    }
    else
    {
      __atxlog_handle_default();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[ATXProactiveSuggestionBuilder _proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:clientModelSpec:].cold.1();

      v10 = 0;
    }

  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromClass((Class)a1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412546;
      v20 = v9;
      v21 = 2112;
      v22 = v6;
      _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "%@ - _proactiveSuggestionForSpotlightPOIFromHeroAppPrediction: %@ not included on Spotlight, returning nil", (uint8_t *)&v19, 0x16u);

    }
    v10 = 0;
  }

  return v10;
}

+ (id)_executableSpecForSpotlightAction:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0D811A8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "actionDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v4, v6, v7, 8);

  return v8;
}

+ (id)_uiSpecForSpotlightPOIPrediction:(id)a3 predictionReasons:(unint64_t)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0D811B8];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initWithApplicableSuggestionLayout:", 5);
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOWORD(v11) = 1;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811D0]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v6, 0, 0, v8, 0, 0, v11, a4);

  return v9;
}

+ (id)proactiveSuggestionForAppClipsFromHeroAppPredictions:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;

  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_opt_new();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __132__ATXProactiveSuggestionBuilder_proactiveSuggestionForAppClipsFromHeroAppPredictions_clientModelSpec_mediumThreshold_highThreshold___block_invoke;
  v17[3] = &unk_1E82DCA68;
  v19 = v12;
  v20 = a1;
  v21 = a5;
  v22 = a6;
  v18 = v10;
  v13 = v12;
  v14 = v10;
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __132__ATXProactiveSuggestionBuilder_proactiveSuggestionForAppClipsFromHeroAppPredictions_clientModelSpec_mediumThreshold_highThreshold___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;

  objc_msgSend(*(id *)(a1 + 48), "proactiveSuggestionForAppClipFromHeroAppPrediction:clientModelSpec:mediumThreshold:highThreshold:reasons:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_blending();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __132__ATXProactiveSuggestionBuilder_proactiveSuggestionForAppClipsFromHeroAppPredictions_clientModelSpec_mediumThreshold_highThreshold___block_invoke_cold_1();

  return v2;
}

+ (id)proactiveSuggestionForAppClipFromHeroAppPrediction:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 reasons:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v14, "bundleId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "clipMetadata");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "clipName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "clipMetadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clipCaption");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "score");
  v21 = v20;
  objc_msgSend(a1, "_executableSpecForAppClipWithHeroAppPrediction:", v14);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "appLocationBasedAppClipReason");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_uiSpecForAppClipWithBundleId:title:subtitle:predictionReason:", v15, v17, v19, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_scoreSpecForAppClipWithScore:mediumThreshold:highThreshold:", v21, a5, a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v13, v22, v24, v25);

  return v26;
}

+ (id)_executableSpecForAppClipWithHeroAppPrediction:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(v3, "bundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D811A8]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:CLIP"), v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@:CLIP"), v4);
  v8 = (void *)objc_msgSend(v5, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v3, v6, v7, 5);

  return v8;
}

+ (id)_uiSpecForAppClipWithBundleId:(id)a3 title:(id)a4 subtitle:(id)a5 predictionReason:(id)a6
{
  objc_class *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v8 = (objc_class *)MEMORY[0x1E0D811D0];
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = [v8 alloc];
  objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", 40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOWORD(v16) = 1;
  v14 = (void *)objc_msgSend(v12, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v11, v10, v9, v13, 0, 1, v16, 0x800000);

  return v14;
}

+ (id)_scoreSpecForAppClipWithScore:(double)a3 mediumThreshold:(double)a4 highThreshold:(double)a5
{
  uint64_t v6;

  v6 = objc_msgSend(a1, "_confidenceCategoryForScore:highThreshold:mediumThreshold:", a3, a5, a4);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", v6, a3);
}

+ (id)executableIdForAction:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB3940];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "actionKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v4, "paramHash");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@:%lld"), v6, objc_msgSend(v9, "longLongValue"));

  return v10;
}

+ (id)proactiveSuggestionsFromScoredAction:(id)a3 clientModelSpec:(id)a4 mediumThreshold:(double)a5 highThreshold:(double)a6 predictionReason:(id)a7 allowedOnHomescreen:(BOOL)a8 predictionReasons:(unint64_t)a9
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  float v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;

  v10 = a8;
  v16 = a3;
  v17 = a4;
  v18 = a7;
  if (v16)
  {
    objc_msgSend(v16, "score");
    objc_msgSend(a1, "_scoreSpecForScore:highThreshold:mediumThreshold:", v19, a6, a5);
    v20 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_executableSpecForScoredAction:", v16);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(a1, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:allowedOnLockscreen:allowedOnHomescreen:predictionReasons:", v16, v20, v17, v18, 1, v10, a9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v17, v21, v22, v20);

    }
    else
    {
      __atxlog_handle_default();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromScoredAction:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:predictionReasons:].cold.2();

      v23 = 0;
    }

  }
  else
  {
    __atxlog_handle_default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[ATXProactiveSuggestionBuilder proactiveSuggestionsFromScoredAction:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:predictionReasons:].cold.1((objc_class *)a1);
    v23 = 0;
  }

  return v23;
}

+ (id)cachedTitleAndSubtitleForAction:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a3;
  objc_msgSend(v3, "intent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "intent"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v6,
        v5,
        (isKindOfClass & 1) == 0))
  {
    +[ATXIntentMetadataCache sharedInstance](ATXIntentMetadataCache, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "intent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "titleForIntent:localeIdentifier:", v13, v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "intent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "subtitleForIntent:localeIdentifier:", v14, v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "actionTitle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "actionSubtitle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v8, v9);

  return v15;
}

+ (id)_executableSpecForScoredAction:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a3, "predictedItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cachedTitleAndSubtitleForAction:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "first");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "second");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ | %@"), v6, v7);
  objc_msgSend(a1, "executableIdForAction:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A8]), "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v4, v8, v9, 2);

  return v10;
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 shouldClearOnEngagement:(BOOL)a7 allowedOnLockscreen:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = 1;
  return (id)objc_msgSend(a1, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:shouldClearOnEngagement:allowedOnLockscreen:allowedOnHomescreen:predictionReasons:", a3, a4, a5, a6, a7, a8, v9, 0);
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 shouldClearOnEngagement:(BOOL)a7 allowedOnLockscreen:(BOOL)a8 allowedOnHomescreen:(BOOL)a9 predictionReasons:(unint64_t)a10
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  _BOOL4 v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v39;

  v10 = a8;
  v14 = a6;
  v15 = a5;
  v16 = a3;
  if (objc_msgSend(a4, "suggestedConfidenceCategory") <= 2)
    v17 = 44;
  else
    v17 = 40;
  objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "clientModelId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v19, "isEqualToString:", v20);

  if (v21)
  {
    objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", 40);
    v22 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v22;
  }
  objc_msgSend(v16, "predictedItem");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "actionType");

  v25 = (void *)MEMORY[0x1E0CF9098];
  objc_msgSend(v16, "predictedItem");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v25, "isActionEligibleForSettingsSuggestions:", v26);

  v28 = v27 ^ 1;
  if (v24 == 5)
    v29 = 0;
  else
    v29 = v27 ^ 1;
  if (v10)
    v30 = v29;
  else
    v30 = 0;
  v31 = v24 != 5 && a9;
  v32 = v31 & v28;
  objc_msgSend(v16, "predictedItem");
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "cachedTitleAndSubtitleForAction:", v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "first");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "second");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  BYTE1(v39) = a7;
  LOBYTE(v39) = v28;
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811D0]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v35, v36, v14, v18, v30, v32, v39, a10);

  return v37;
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomescreen:(BOOL)a8
{
  return (id)objc_msgSend(a1, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:allowedOnLockscreen:allowedOnHomescreen:predictionReasons:", a3, a4, a5, a6, a7, a8, 0);
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 allowedOnLockscreen:(BOOL)a7 predictionReasons:(unint64_t)a8
{
  return (id)objc_msgSend(a1, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:allowedOnLockscreen:allowedOnHomescreen:predictionReasons:", a3, a4, a5, a6, a7, 1, a8);
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6 allowedOnLockscreen:(BOOL)a7 allowedOnHomescreen:(BOOL)a8 predictionReasons:(unint64_t)a9
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v26;
  _BOOL4 v29;

  v29 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v15, "predictedItem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "intent");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    +[ATXIntentMetadataCache sharedInstance](ATXIntentMetadataCache, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "supportsBackgroundExecutionForIntent:", v17);

  }
  else
  {
    v19 = 0;
  }
  objc_msgSend(v16, "userActivityWebpageURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "atx_isOpenableFaceTimeURL");

  objc_msgSend(v17, "_className");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("MTCreateAlarmIntent"));

  LOBYTE(v26) = a8;
  objc_msgSend(a1, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:shouldClearOnEngagement:allowedOnLockscreen:allowedOnHomescreen:predictionReasons:", v15, v14, v13, v12, v23 | v21 | v19, v29, v26, a9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

+ (id)_uiSpecForScoredAction:(id)a3 scoreSpec:(id)a4 clientModelSpec:(id)a5 predictionReason:(id)a6
{
  return (id)objc_msgSend(a1, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:allowedOnLockscreen:allowedOnHomescreen:", a3, a4, a5, a6, 1, 1);
}

+ (id)_scoreSpecForScore:(double)a3 highThreshold:(double)a4 mediumThreshold:(double)a5
{
  uint64_t v6;

  v6 = objc_msgSend(a1, "_confidenceCategoryForScore:highThreshold:mediumThreshold:", a3, a4, a5);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", v6, a3);
}

+ (id)proactiveSuggestionForAppWithBundleId:(id)a3 score:(double)a4 clientModelSpec:(id)a5 mediumThreshold:(double)a6 highThreshold:(double)a7 predictionReason:(id)a8 allowedOnHomescreen:(BOOL)a9
{
  _BOOL8 v9;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;

  v9 = a9;
  v16 = a3;
  v17 = a5;
  v18 = a8;
  objc_msgSend(a1, "_executableSpecForAppWithBundleId:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_scoreSpecForScore:highThreshold:mediumThreshold:", a4, a7, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_uiSpecForAppWithBundleId:scoreSpec:predictionReason:allowedOnHomescreen:", v16, v20, v18, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v17, v19, v21, v20);
  }
  else
  {
    __atxlog_handle_default();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      +[ATXProactiveSuggestionBuilder proactiveSuggestionForAppWithBundleId:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:].cold.1();

    v22 = 0;
  }

  return v22;
}

+ (id)_uiSpecForAppWithBundleId:(id)a3 scoreSpec:(id)a4 predictionReason:(id)a5
{
  return (id)objc_msgSend(a1, "_uiSpecForAppWithBundleId:scoreSpec:predictionReason:allowedOnHomescreen:", a3, a4, a5, 1);
}

+ (id)_uiSpecForAppWithBundleId:(id)a3 scoreSpec:(id)a4 predictionReason:(id)a5 allowedOnHomescreen:(BOOL)a6
{
  _BOOL8 v6;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;

  v6 = a6;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(a4, "suggestedConfidenceCategory") < 3)
  {
    objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D811D0]);
    LOWORD(v19) = 1;
    v13 = v10;
    v14 = v9;
    v15 = v11;
    v16 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D811B8], "layoutConfigurationsForLayoutOptions:", 42);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D811D0]);
    LOWORD(v19) = 1;
    v13 = v10;
    v14 = v9;
    v15 = v11;
    v16 = v6;
  }
  v17 = (void *)objc_msgSend(v12, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:", v13, 0, v14, v15, 0, v16, v19);

  return v17;
}

+ (id)_executableSpecForAppWithBundleId:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0D811A8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v4, v4, v4, 1);

  return v5;
}

+ (id)_scoreSpecForAppWithScore:(double)a3 isHighConfidence:(BOOL)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a1, "_confidenceCategoryGivenIsHighConfidence:", a4);
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", v5, a3);
}

+ (int64_t)_confidenceCategoryGivenIsHighConfidence:(BOOL)a3
{
  if (a3)
    return 4;
  else
    return 2;
}

+ (int64_t)_confidenceCategoryForScore:(double)a3 highThreshold:(double)a4 mediumThreshold:(double)a5
{
  int64_t v5;

  v5 = 3;
  if (a3 < a5)
    v5 = 2;
  if (a3 >= a4)
    return 4;
  else
    return v5;
}

+ (id)proactiveSuggestionsFromHeuristicActionResults:(id)a3 clientModelSpec:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "atx_actionsFromActionResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXDisplayCacheLockscreenFilter indicesOfLockScreenActionsForActionPredictions:criteria:](ATXDisplayCacheLockscreenFilter, "indicesOfLockScreenActionsForActionPredictions:criteria:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_new();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __112__ATXProactiveSuggestionBuilder_PredictionItem__proactiveSuggestionsFromHeuristicActionResults_clientModelSpec___block_invoke;
  v16[3] = &unk_1E82EB3B0;
  v20 = a1;
  v11 = v7;
  v17 = v11;
  v18 = v10;
  v12 = v9;
  v19 = v12;
  v13 = v10;
  objc_msgSend(v6, "_pas_mappedArrayWithIndexedTransform:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id __112__ATXProactiveSuggestionBuilder_PredictionItem__proactiveSuggestionsFromHeuristicActionResults_clientModelSpec___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 56), "_proactiveSuggestionsFromHeuristicActionResult:clientModelSpec:reasons:allowedOnLockscreen:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "containsIndex:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_proactiveSuggestionsFromHeuristicActionResult:(id)a3 clientModelSpec:(id)a4 reasons:(id)a5 allowedOnLockscreen:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  void *v13;
  id *v14;
  const void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  _BYTE v27[3282];
  uint64_t v28;

  v6 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v10, "scoredAction");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (id *)objc_msgSend(v10, "predictionItem");
    v15 = v14 + 1;
    v16 = *v14;
    v26 = v16;
    memcpy(v27, v15, sizeof(v27));
    if (a1)
    {
      objc_msgSend(a1, "_scoreSpecForPredictionItem:", &v26);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {

      v17 = 0;
    }
    objc_msgSend(v10, "scoredAction", v26);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_executableSpecForScoredAction:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      objc_msgSend(a1, "_actionPredictionReasonForActionResult:reasons:", v10, v12);
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(a1, "_actionPredictionReasonsForActionResult:reasons:", v10, v12);
      objc_msgSend(v10, "scoredAction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:allowedOnLockscreen:predictionReasons:", v23, v17, v11, v21, v6, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v11, v20, v24, v17);
    }
    else
    {
      __atxlog_handle_default();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass((Class)a1);
        objc_claimAutoreleasedReturnValue();
        +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionsFromHeuristicActionResult:clientModelSpec:reasons:allowedOnLockscreen:].cold.2();
      }
      v18 = 0;
    }

  }
  else
  {
    __atxlog_handle_default();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass((Class)a1);
      objc_claimAutoreleasedReturnValue();
      +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionsFromHeuristicActionResult:clientModelSpec:reasons:allowedOnLockscreen:].cold.1();
    }
    v18 = 0;
  }

  return v18;
}

+ (id)proactiveSuggestionsFromActionResults:(id)a3 clientModelSpec:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __103__ATXProactiveSuggestionBuilder_PredictionItem__proactiveSuggestionsFromActionResults_clientModelSpec___block_invoke;
  v13[3] = &unk_1E82EB3D8;
  v16 = a1;
  v9 = v7;
  v14 = v9;
  v15 = v8;
  v10 = v8;
  objc_msgSend(v6, "_pas_mappedArrayWithTransform:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __103__ATXProactiveSuggestionBuilder_PredictionItem__proactiveSuggestionsFromActionResults_clientModelSpec___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 48), "_proactiveSuggestionsFromActionResult:clientModelSpec:reasons:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_proactiveSuggestionsFromActionResult:(id)a3 clientModelSpec:(id)a4 reasons:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id *v12;
  const void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v23;
  _BYTE v24[3282];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "scoredAction");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (id *)objc_msgSend(v8, "predictionItem");
    v13 = v12 + 1;
    v14 = *v12;
    v23 = v14;
    memcpy(v24, v13, sizeof(v24));
    if (a1)
    {
      objc_msgSend(a1, "_scoreSpecForPredictionItem:", &v23);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {

      v15 = 0;
    }
    objc_msgSend(v8, "scoredAction", v23);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_executableSpecForScoredAction:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(a1, "_actionPredictionReasonForActionResult:reasons:", v8, v10);
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scoredAction");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_uiSpecForScoredAction:scoreSpec:clientModelSpec:predictionReason:", v20, v15, v9, v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v9, v18, v21, v15);
    }
    else
    {
      __atxlog_handle_default();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        NSStringFromClass((Class)a1);
        objc_claimAutoreleasedReturnValue();
        +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionsFromHeuristicActionResult:clientModelSpec:reasons:allowedOnLockscreen:].cold.2();
      }
      v16 = 0;
    }

  }
  else
  {
    __atxlog_handle_default();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass((Class)a1);
      objc_claimAutoreleasedReturnValue();
      +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionsFromActionResult:clientModelSpec:reasons:].cold.1();
    }
    v16 = 0;
  }

  return v16;
}

+ (id)_actionPredictionReasonForActionResult:(id)a3 reasons:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_isHeuristicActionForActionResult:", v6))
  {
    objc_msgSend(v6, "scoredAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predictedItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heuristic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "actionHeuristicReasonForHeuristicName:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "actionBehavioralReason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

+ (unint64_t)_actionPredictionReasonsForActionResult:(id)a3 reasons:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((objc_msgSend(a1, "_isHeuristicActionForActionResult:", v5) & 1) != 0)
  {
    objc_msgSend(v5, "scoredAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predictedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heuristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v8, "hasPrefix:", CFSTR("changeAlarmBeforeHoliday")) & 1) != 0)
    {
      v9 = 0x800000000;
    }
    else
    {
      __atxlog_handle_default();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromClass((Class)a1);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "scoredAction");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "predictedItem");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "heuristic");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412546;
        v17 = v11;
        v18 = 2112;
        v19 = v14;
        _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%@ - _actionPredictionReasonsForActionResult: heuristic %@ reason bit set to Unknown", (uint8_t *)&v16, 0x16u);

      }
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)_isHeuristicActionForActionResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(v3, "scoredAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predictedItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isHeuristic"))
  {
    objc_msgSend(v3, "scoredAction");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "predictedItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heuristic");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)proactiveSuggestionsFromAppPredictionItems:(const void *)a3 clientModelSpec:(id)a4 maxSuggestionsToSendToBlendingLayer:(int)a5
{
  void *v7;
  uint64_t v8;
  unint64_t i;
  void *v10;
  __objc2_class *v11;
  id *v12;
  id v13;
  void *v15;
  id v16;
  id v17;
  _BYTE v18[3282];

  v16 = a4;
  v15 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v8 = 0;
  for (i = 0;
        objc_msgSend(v7, "count") <= (unint64_t)a5
     && 0xDAB7EC1DD3431B57 * ((uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 5) > i;
        ++i)
  {
    v10 = (void *)MEMORY[0x1CAA48B6C]();
    v11 = ATXProactiveSuggestionBuilder;
    v12 = (id *)(*(_QWORD *)a3 + v8);
    v13 = *v12;
    v17 = v13;
    memcpy(v18, v12 + 1, sizeof(v18));
    if (ATXProactiveSuggestionBuilder)
    {
      +[ATXProactiveSuggestionBuilder _proactiveSuggestionFromAppPredictionItem:clientModelSpec:reasons:](ATXProactiveSuggestionBuilder, "_proactiveSuggestionFromAppPredictionItem:clientModelSpec:reasons:", &v17, v16, v15);
      v11 = (__objc2_class *)objc_claimAutoreleasedReturnValue();
      if (v11)
        objc_msgSend(v7, "addObject:", v11);
    }
    else
    {

    }
    objc_autoreleasePoolPop(v10);
    v8 += 3296;
  }

  return v7;
}

+ (id)_proactiveSuggestionFromAppPredictionItem:(ATXPredictionItem *)a3 clientModelSpec:(id)a4 reasons:(id)a5
{
  void *v5;
  void *v6;
  id *v7;
  id *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v22;
  _BYTE v23[3282];
  id v24;
  _BYTE v25[3282];
  uint64_t v26;

  MEMORY[0x1E0C80A78](a1, a2);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v26 = *MEMORY[0x1E0C80C00];
  v12 = v11;
  v13 = v6;
  objc_msgSend(v10, "_executableSpecForAppWithBundleId:", *v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *v8;
  v24 = v15;
  memcpy(v25, v8 + 1, sizeof(v25));
  if (v10)
  {
    objc_msgSend(v10, "_scoreSpecForPredictionItem:", &v24);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = *v8;
    memcpy(v23, v8 + 1, sizeof(v23));
    objc_msgSend(v10, "_appPredictionReasonForPredictionItem:reasons:", &v22, v13);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {

    v22 = *v8;
    memcpy(v23, v8 + 1, sizeof(v23));

    v16 = 0;
    v17 = 0;
  }
  objc_msgSend(v10, "_uiSpecForAppWithBundleId:scoreSpec:predictionReason:", *v8, v16, v17, v22);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81190]), "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v12, v14, v18, v16);
  }
  else
  {
    __atxlog_handle_default();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      NSStringFromClass((Class)v10);
      objc_claimAutoreleasedReturnValue();
      +[ATXProactiveSuggestionBuilder(PredictionItem) _proactiveSuggestionFromAppPredictionItem:clientModelSpec:reasons:].cold.1();
    }

    v19 = 0;
  }

  return v19;
}

+ (id)_appPredictionReasonForPredictionItem:(ATXPredictionItem *)a3 reasons:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v14;
  _BYTE v15[3282];
  id v16;
  _BYTE v17[3282];
  id v18;
  _BYTE v19[3282];

  MEMORY[0x1E0C80A78](a1, a2);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = *(id *)v5;
  v18 = v10;
  memcpy(v19, (const void *)(v5 + 8), sizeof(v19));
  if (!v7)
  {

    v16 = *(id *)v5;
    memcpy(v17, (const void *)(v5 + 8), sizeof(v17));

    v14 = *(id *)v5;
    memcpy(v15, (const void *)(v5 + 8), sizeof(v15));

LABEL_5:
    objc_msgSend(v9, "appBehavioralReason", v14);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (!objc_msgSend(v7, "_isInstalledAppClipForPredictionItem:", &v18))
  {
    v16 = *(id *)v5;
    memcpy(v17, (const void *)(v5 + 8), sizeof(v17));
    if (objc_msgSend(v7, "_isHeroAppForPredictionItem:", &v16))
    {
      objc_msgSend(v9, "appHeroAppReason");
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v14 = *(id *)v5;
    memcpy(v15, (const void *)(v5 + 8), sizeof(v15));
    if (objc_msgSend(v7, "_isMagicalMomentForPredictionItem:", &v14))
    {
      objc_msgSend(v9, "appMagicalMomentReasonForAnchorType:", (uint64_t)*(float *)(v5 + 304), v14);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    goto LABEL_5;
  }
  objc_msgSend(v9, "appInstalledAppClipReason");
  v11 = objc_claimAutoreleasedReturnValue();
LABEL_10:
  v12 = (void *)v11;

  return v12;
}

+ (BOOL)_isHeroAppForPredictionItem:(ATXPredictionItem *)a3
{
  BOOL v3;

  v3 = a3->inputSignals[75] == 0.0 && a3->inputSignals[73] > 0.0;

  return v3;
}

+ (BOOL)_isInstalledAppClipForPredictionItem:(ATXPredictionItem *)a3
{
  BOOL v3;

  v3 = a3->inputSignals[769] == 1.0;

  return v3;
}

+ (BOOL)_isMagicalMomentForPredictionItem:(ATXPredictionItem *)a3
{
  BOOL v3;

  v3 = a3->inputSignals[75] == 0.0 && a3->inputSignals[73] <= 0.0;

  return v3;
}

+ (id)_scoreSpecForPredictionItem:(ATXPredictionItem *)a3
{
  unint64_t *p_actionHash;
  NSString *v6;
  id v7;
  void *v8;
  NSString *v10;
  _BYTE v11[3282];

  p_actionHash = &a3->actionHash;
  v6 = a3->key;
  v10 = v6;
  memcpy(v11, p_actionHash, sizeof(v11));
  if (a1)
    a1 = (id)objc_msgSend(a1, "_confidenceCategoryForPredictionItem:", &v10);
  else

  v7 = objc_alloc(MEMORY[0x1E0D811C0]);
  v8 = (void *)objc_msgSend(v7, "initWithRawScore:suggestedConfidenceCategory:", a1, a3->score, v10);

  return v8;
}

+ (int64_t)_confidenceCategoryForPredictionItem:(ATXPredictionItem *)a3
{
  int64_t v3;

  if (a3->isHighConfidenceForBlendingLayer)
  {
    v3 = 4;
  }
  else if (a3->isMediumConfidenceForBlendingLayer)
  {
    v3 = 3;
  }
  else
  {
    v3 = 2;
  }

  return v3;
}

+ (void)predictionReasonForAnchorModelPrediction:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "anchorType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "Failed to retrieve Anchor Class Name from Anchor Type: %@", (uint8_t *)&v4, 0xCu);

  OUTLINED_FUNCTION_1();
}

+ (void)proactiveSuggestionForLinkActionPrediction:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_4();
  v3 = v0;
  _os_log_error_impl(&dword_1C9A3B000, v1, OS_LOG_TYPE_ERROR, "Suggestion Builder: Unable to retrieve Link metadata for action %@. Error: %@", v2, 0x16u);
}

+ (void)_proactiveSuggestionFromMagicalMomentsPredictionBundleId:mmSignals:clientModelSpec:reasons:.cold.1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - _proactiveSuggestionFromMagicalMomentsPredictionBundleId: %@ could not generate uiSpec, returning nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __90__ATXProactiveSuggestionBuilder_proactiveSuggestionsForLockscreenActions_clientModelSpec___block_invoke_cold_1()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(*v0, "clientModelId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "<<%@>> produced an Action Proactive Suggestion: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_proactiveSuggestionFromHeroAppPrediction:clientModelSpec:reasons:.cold.1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - _proactiveSuggestionFromHeroAppPrediction: %@ could not generate uiSpec, returning nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

+ (void)_proactiveSuggestionForSpotlightPOIFromHeroAppPrediction:clientModelSpec:.cold.1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - _proactiveSuggestionForSpotlightPOIFromHeroAppPrediction: %@ no poiMuid found, returning nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __132__ATXProactiveSuggestionBuilder_proactiveSuggestionForAppClipsFromHeroAppPredictions_clientModelSpec_mediumThreshold_highThreshold___block_invoke_cold_1()
{
  id *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  objc_msgSend(*v0, "clientModelId");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "<<%@>> produced an App Clip Prediction Proactive Suggestion: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

+ (void)proactiveSuggestionsFromScoredAction:(objc_class *)a1 clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:predictionReasons:.cold.1(objc_class *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromClass(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - proactiveSuggestionsFromScoredAction: %@ had no scoredAction, returning nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

+ (void)proactiveSuggestionsFromScoredAction:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:predictionReasons:.cold.2()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - proactiveSuggestionsFromScoredAction: %@ could not generate executableSpec, returning nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

+ (void)proactiveSuggestionForAppWithBundleId:score:clientModelSpec:mediumThreshold:highThreshold:predictionReason:allowedOnHomescreen:.cold.1()
{
  Class v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_4_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_2(&dword_1C9A3B000, v2, v3, "%@ - proactiveSuggestionForAppWithBundleId: %@ could not generate uiSpec, returning nil", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
