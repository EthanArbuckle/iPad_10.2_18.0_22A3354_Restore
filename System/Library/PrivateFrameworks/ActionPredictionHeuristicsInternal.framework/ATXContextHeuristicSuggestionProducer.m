@implementation ATXContextHeuristicSuggestionProducer

+ (id)createSuggestionFromShortcutsAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 title:(id)a6 subtitle:(id)a7 score:(double)a8 shouldClearOnEngagement:(BOOL)a9 dateInterval:(id)a10
{
  objc_class *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;

  v15 = (objc_class *)MEMORY[0x1E0D811A8];
  v16 = a10;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  v20 = a3;
  v21 = [v15 alloc];
  objc_msgSend(v20, "contextualAction");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "displayString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contextualAction");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v21, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v20, v23, v25, 9);

  objc_msgSend(a1, "_uiSpecWithTitle:subtitle:predictionReason:shouldClearOnEngagement:predictionReasons:dateInterval:", v18, v17, v19, 0, a4, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 4, a8);
  v29 = objc_alloc(MEMORY[0x1E0D81190]);
  objc_msgSend(a1, "_clientModelSpectForContextHeuristics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v30, v26, v27, v28);

  return v31;
}

+ (id)suggestionWithExecutableSpecification:(id)a3 title:(id)a4 subtitle:(id)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  unint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  __atxlog_handle_context_heuristic();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = a6;
    _os_log_impl(&dword_1C99DF000, v17, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: suggestionWithExecutableSpecification predictionReasons:%llu", buf, 0xCu);
  }

  v18 = objc_alloc(MEMORY[0x1E0D811A8]);
  objc_msgSend(v16, "executableObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "executableDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "executableIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v16, "executableType");

  v23 = (void *)objc_msgSend(v18, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v19, v20, v21, v22);
  objc_msgSend(a1, "_uiSpecWithTitle:subtitle:predictionReason:shouldClearOnEngagement:predictionReasons:dateInterval:", v15, v14, v13, 0, a6, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 4, a8);
  v26 = objc_alloc(MEMORY[0x1E0D81190]);
  objc_msgSend(a1, "_clientModelSpectForContextHeuristics");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v27, v23, v24, v25);

  return v28;
}

+ (id)suggestionWithSpotlightAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6 dateInterval:(id)a7
{
  return (id)objc_msgSend(a1, "_suggestionWithSpotlightAction:predictionReasons:localizedReason:score:uiSpec:dateInterval:", a3, a4, a5, 0, a7, a6);
}

+ (id)dummySuggestionWithSpotlightAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v10 = a5;
  v11 = a3;
  objc_msgSend(v11, "actionDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_dummyUiSpecWithTitle:subtitle:predictionReason:shouldClearOnEngagement:predictionReasons:", v12, 0, v10, 0, a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_suggestionWithSpotlightAction:predictionReasons:localizedReason:score:uiSpec:dateInterval:", v11, a4, v10, v13, 0, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)_suggestionWithSpotlightAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6 uiSpec:(id)a7 dateInterval:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  int v28;
  uint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  __atxlog_handle_context_heuristic();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(v15, "hash");
    objc_msgSend(v14, "actionDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 134218242;
    v29 = v19;
    v30 = 2112;
    v31 = v20;
    _os_log_impl(&dword_1C99DF000, v18, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: suggestionWithSpotlightAction reason.hash:%lu description:%@", (uint8_t *)&v28, 0x16u);

  }
  objc_msgSend(a1, "_executableSpecForSpotlightAction:", v14);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(v14, "actionDescription");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_uiSpecWithTitle:subtitle:predictionReason:shouldClearOnEngagement:predictionReasons:dateInterval:", v22, 0, v15, 0, a4, v17);
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 4, a6);
  v24 = objc_alloc(MEMORY[0x1E0D81190]);
  objc_msgSend(a1, "_clientModelSpectForContextHeuristics");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)objc_msgSend(v24, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v25, v21, v16, v23);

  return v26;
}

+ (id)suggestionWithShortcutAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 title:(id)a6 subtitle:(id)a7 score:(double)a8 dateInterval:(id)a9
{
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v33;
  id v35;
  id v36;
  uint8_t buf[4];
  unint64_t v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v36 = a5;
  v16 = a6;
  v17 = a7;
  v35 = a9;
  __atxlog_handle_context_heuristic();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v15, "contextualAction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v38 = a4;
    v39 = 2112;
    v40 = v19;
    _os_log_impl(&dword_1C99DF000, v18, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: suggestionWithShortcutAction predictionReasons:%llu shortcutsAction.contextualAction:%@", buf, 0x16u);

  }
  v20 = objc_alloc(MEMORY[0x1E0D811A8]);
  objc_msgSend(v15, "contextualAction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "contextualAction");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "uniqueIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v20, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v15, v22, v24, 9);

  if (!v16)
  {
    objc_msgSend(v15, "contextualAction");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "displayString");
    v16 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_uiSpecWithTitle:subtitle:predictionReason:shouldClearOnEngagement:predictionReasons:dateInterval:", v16, v17, v36, 0, a4, v35, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 4, a8);
  v29 = objc_alloc(MEMORY[0x1E0D81190]);
  objc_msgSend(a1, "_clientModelSpectForContextHeuristics");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v30, v25, v27, v28);

  return v31;
}

+ (id)suggestionWithAction:(id)a3 predictionReasons:(unint64_t)a4 localizedReason:(id)a5 score:(double)a6 dateInterval:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
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
  uint8_t buf[4];
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v12 = a7;
  v13 = a5;
  v14 = a3;
  __atxlog_handle_context_heuristic();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v33 = a4;
    _os_log_impl(&dword_1C99DF000, v15, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: _suggestionWithAction predictionReasons:%llu", buf, 0xCu);
  }

  v16 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v14, "actionTitle");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionSubtitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v16, "initWithFormat:", CFSTR("%@ | %@"), v17, v18);

  v20 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v14, "actionKey");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithFormat:", CFSTR("%@:%tu"), v21, objc_msgSend(v14, "paramHash"));

  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A8]), "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v14, v19, v22, 2);
  objc_msgSend(v14, "actionTitle");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "actionSubtitle");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_uiSpecWithTitle:subtitle:predictionReason:shouldClearOnEngagement:predictionReasons:dateInterval:", v24, v25, v13, 0, a4, v12);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 4, a6);
  v28 = objc_alloc(MEMORY[0x1E0D81190]);
  objc_msgSend(a1, "_clientModelSpectForContextHeuristics");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v29, v23, v26, v27);

  return v30;
}

+ (id)_executableSpecForShortcutsAction:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0D811A8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "contextualAction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contextualAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v5, "initWithExecutableObject:executableDescription:executableIdentifier:suggestionExecutableType:", v4, v7, v9, 9);

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

+ (id)_suggestionWithSpotlightRecentAction:(id)a3 score:(double)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "_executableSpecForSpotlightAction:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_uiSpecWithTitle:subtitle:predictionReason:shouldClearOnEngagement:predictionReasons:dateInterval:", 0, 0, 0, 0, 0x1000000, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811C0]), "initWithRawScore:suggestedConfidenceCategory:", 4, a4);
  v9 = objc_alloc(MEMORY[0x1E0D81190]);
  objc_msgSend(a1, "_clientModelSpecForSpotlightRecents");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithClientModelSpecification:executableSpecification:uiSpecification:scoreSpecification:", v10, v6, v7, v8);

  return v11;
}

+ (id)suggestionForDNDWithTitle:(id)a3 eventUniqueID:(id)a4 identifier:(id)a5 until:(id)a6 score:(double)a7 predictionReasons:(unint64_t)a8 localizedReason:(id)a9 validFromStartDate:(id)a10 validToEndDate:(id)a11 dateInterval:(id)a12
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a12;
  v20 = a11;
  v21 = a10;
  v22 = a9;
  __atxlog_handle_context_heuristic();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v40 = "+[ATXContextHeuristicSuggestionProducer suggestionForDNDWithTitle:eventUniqueID:identifier:until:score:predict"
          "ionReasons:localizedReason:validFromStartDate:validToEndDate:dateInterval:]";
    v41 = 2048;
    v42 = objc_msgSend(v16, "hash");
    v43 = 2112;
    v44 = v17;
    v45 = 2112;
    v46 = v18;
    _os_log_impl(&dword_1C99DF000, v23, OS_LOG_TYPE_DEFAULT, "%{public}s title.hash:%lu eventUniqueID:%@, until:%@", buf, 0x2Au);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v35 = v17;
  v36 = v16;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v18;
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_DND_TITLE"), &stru_1E82C5A18, 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_alloc(MEMORY[0x1E0DC7DE0]);
  v27 = (void *)objc_msgSend(v26, "initWithIdentifier:name:symbolName:colorName:", *MEMORY[0x1E0DC83C0], v25, CFSTR("moon.fill"), CFSTR("systemIndigoColor"));
  objc_msgSend(MEMORY[0x1E0DC7DD8], "toggle:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_DND_TITLE"), &stru_1E82C5A18, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", v21, v20, 0, 0);

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C0]), "initWithContextualAction:criteria:", v28, v30);
  objc_msgSend(a1, "suggestionWithShortcutAction:predictionReasons:localizedReason:title:subtitle:score:dateInterval:", v31, a8, v22, v29, 0, v19, a7);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

+ (id)suggestionForConferenceWithURL:(id)a3 score:(double)a4 predictionReasons:(unint64_t)a5 localizedReason:(id)a6 criteria:(id)a7 dateInterval:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  unint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v30 = a6;
  v15 = a7;
  v16 = a8;
  __atxlog_handle_context_heuristic();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = v14;
    _os_log_impl(&dword_1C99DF000, v17, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: ***** suggestionForConferenceWithURL:%@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SUGGESTION_JOIN_TITLE"), &stru_1E82C5A18, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_bundleIDWithURL:", v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "isEqualToString:", CFSTR("com.apple.mobilephone"))
    && objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
  {
    __atxlog_handle_context_heuristic();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v21, OS_LOG_TYPE_DEFAULT, "suggestionForConferenceWithURL: no Phone application on iPad. Skipping suggestion", buf, 2u);
    }
    v22 = 0;
    v23 = v30;
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "absoluteString");
      v25 = a5;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v32 = v26;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v19;
      _os_log_impl(&dword_1C99DF000, v24, OS_LOG_TYPE_DEFAULT, "[[WFOpenURLContextualAction alloc] initWithURL:%@ bundleIdentifier:%@ actionTitle:%@", buf, 0x20u);

      a5 = v25;
    }

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC7C10]), "initWithURL:bundleIdentifier:actionTitle:", v14, v20, v19);
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C0]), "initWithContextualAction:criteria:", v21, v15);
    v28 = a1;
    v23 = v30;
    objc_msgSend(v28, "suggestionWithShortcutAction:predictionReasons:localizedReason:title:subtitle:score:dateInterval:", v27, a5, v30, 0, 0, v16, a4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

+ (id)suggestionWithURL:(id)a3 actionTitle:(id)a4 subtitle:(id)a5 bundleID:(id)a6 score:(double)a7 predictionReasons:(unint64_t)a8 criteria:(id)a9 dateInterval:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v20 = a10;
  v21 = a9;
  v22 = a5;
  __atxlog_handle_context_heuristic();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v17, "absoluteString");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138412802;
    v30 = v24;
    v31 = 2112;
    v32 = v19;
    v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_1C99DF000, v23, OS_LOG_TYPE_DEFAULT, "[[WFOpenURLContextualAction alloc] initWithURL:%@ bundleIdentifier:%@ actionTitle:%@", (uint8_t *)&v29, 0x20u);

  }
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC7C10]), "initWithURL:bundleIdentifier:actionTitle:", v17, v19, v18);
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C0]), "initWithContextualAction:criteria:", v25, v21);

  objc_msgSend(a1, "suggestionWithShortcutAction:predictionReasons:localizedReason:title:subtitle:score:dateInterval:", v26, a8, 0, 0, v22, v20, a7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)_bundleIDWithURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1CAA46CBC]();
  if (v3)
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CA5838], "appLinksWithURL:limit:error:", v3, 1, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    __atxlog_handle_context_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v5;
      _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: appLinksWithURL links:%@", buf, 0xCu);
    }

    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v8 = objc_claimAutoreleasedReturnValue();
      -[NSObject targetApplicationRecord](v8, "targetApplicationRecord");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __atxlog_handle_context_heuristic();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v9;
        _os_log_impl(&dword_1C99DF000, v10, OS_LOG_TYPE_DEFAULT, "ATXProactiveSuggestion: appLinksWithURL record:%@", buf, 0xCu);
      }

      objc_msgSend(v9, "bundleIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        objc_msgSend(v9, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      __atxlog_handle_context_heuristic();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        +[ATXContextHeuristicSuggestionProducer _bundleIDWithURL:].cold.1((uint64_t)v6, v8);
      v11 = 0;
    }

    INDisplayableOrLaunchableBundleIdForBundleIdFromUserActivity();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ATXBundleIdReplacementForBundleIdWithWebpageURLHint();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
    v6 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v12;
}

+ (id)_clientModelSpectForContextHeuristics
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 44);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v2, CFSTR("1.0"), 1);

  return v3;
}

+ (id)_clientModelSpecForSpotlightRecents
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 46);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811A0]), "initWithClientModelId:clientModelVersion:engagementResetPolicy:", v2, CFSTR("1.0"), 1);

  return v3;
}

+ (id)_uiSpecWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 shouldClearOnEngagement:(BOOL)a6 predictionReasons:(unint64_t)a7 dateInterval:(id)a8
{
  objc_class *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v13 = (objc_class *)MEMORY[0x1E0D811B8];
  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_msgSend([v13 alloc], "initWithApplicableSuggestionLayout:", 5);
  v26[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_alloc(MEMORY[0x1E0D811D0]);
  objc_msgSend(v14, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endDate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v25) = a6;
  LOBYTE(v25) = 1;
  v23 = (void *)objc_msgSend(v20, "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:contextStartDate:contextEndDate:", v17, v16, v15, v19, 0, 0, v25, a7, v21, v22);

  return v23;
}

+ (id)_dummyUiSpecWithTitle:(id)a3 subtitle:(id)a4 predictionReason:(id)a5 shouldClearOnEngagement:(BOOL)a6 predictionReasons:(unint64_t)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v11 = (objc_class *)MEMORY[0x1E0D811B8];
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend([v11 alloc], "initWithApplicableSuggestionLayout:", 5);
  v20[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  BYTE1(v19) = a6;
  LOBYTE(v19) = 0;
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D811D0]), "initWithTitle:subtitle:predictionReason:preferredLayoutConfigs:allowedOnLockscreen:allowedOnHomeScreen:allowedOnSpotlight:shouldClearOnEngagement:predictionReasons:", v14, v13, v12, v16, 0, 0, v19, a7);

  return v17;
}

+ (id)toggleAirplaneModeWithPredictionReasons:(unint64_t)a3 localizedReason:(id)a4 score:(double)a5 validFromStartDate:(id)a6 validToEndDate:(id)a7 dateInterval:(id)a8
{
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v14 = (objc_class *)MEMORY[0x1E0DC7DE8];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a4;
  v19 = (void *)objc_msgSend([v14 alloc], "initWithSetting:operation:", 0, 2);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", v17, v16, 0, 0);

  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C0]), "initWithContextualAction:criteria:", v19, v20);
  objc_msgSend(a1, "suggestionWithShortcutAction:predictionReasons:localizedReason:title:subtitle:score:dateInterval:", v21, a3, v18, 0, 0, v15, a5);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

+ (id)rideshareAppActionForDestination:(id)a3 preferredBundleId:(id)a4 predictionReasons:(unint64_t)a5 title:(id)a6 localizedReason:(id)a7 score:(double)a8 validFromStartDate:(id)a9 validToEndDate:(id)a10 dateInterval:(id)a11
{
  objc_class *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;

  v17 = (objc_class *)MEMORY[0x1E0DC7C50];
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a7;
  v22 = a6;
  v23 = a4;
  v24 = a3;
  v25 = [v17 alloc];
  objc_msgSend(v24, "location");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)objc_msgSend(v25, "initWithApplicationBundleIdentifier:destination:name:", v23, v26, v27);
  v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", v20, v19, 0, 0);

  v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C0]), "initWithContextualAction:criteria:", v28, v29);
  objc_msgSend(a1, "createSuggestionFromShortcutsAction:predictionReasons:localizedReason:title:subtitle:score:shouldClearOnEngagement:dateInterval:", v30, a5, v21, v22, 0, 0, a8, v18);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)flightCheckInActivityWithSubtitle:(id)a3 url:(id)a4 teamIdentifier:(id)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8 validStartDate:(id)a9 validEndDate:(id)a10
{
  objc_class *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;

  v18 = (objc_class *)MEMORY[0x1E0CF8C28];
  v19 = a10;
  v20 = a9;
  v21 = a7;
  v22 = a5;
  v23 = a4;
  v24 = a3;
  v25 = (void *)objc_msgSend([v18 alloc], "initWithStartDate:endDate:lockScreenEligible:predicate:", v20, v19, 0, 0);

  objc_msgSend(MEMORY[0x1E0CF8C20], "atx_showCheckInActionWithTeamId:userActivityString:subtitle:overrideBundleId:suggestedEventUniqueKey:heuristicName:criteria:", v22, v23, v24, 0, 0, v21, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "suggestionWithAction:predictionReasons:localizedReason:score:dateInterval:", v26, a6, v21, 0, a8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)_mediaWithName:(id)a3 type:(int64_t)a4 adamIdentifier:(int64_t)a5 umcIdentifier:(id)a6 predictionReasons:(unint64_t)a7 localizedReason:(id)a8 score:(double)a9 expirationDate:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v17 = a3;
  v18 = a6;
  v19 = a8;
  v20 = a10;
  if ((a5 == 0) != (v18 != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ATXContextHeuristicSuggestionProducer.m"), 568, CFSTR("Expected either adamIdentifier (%lld) or umcIdentifier (%@) but not both"), a5, v18);

    if (v18)
      goto LABEL_3;
LABEL_5:
    v21 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%lld"), a5);
    goto LABEL_6;
  }
  if (!v18)
    goto LABEL_5;
LABEL_3:
  v21 = v18;
LABEL_6:
  v23 = v21;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", 0, v20, 0, 0);
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF9108]), "initWithMediaName:identifier:criteria:", v17, v23, v24);

  objc_msgSend(a1, "suggestionWithSpotlightAction:predictionReasons:localizedReason:score:dateInterval:", v25, a7, v19, 0, a9);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

+ (id)mediaWithName:(id)a3 type:(int64_t)a4 adamIdentifier:(int64_t)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8 expirationDate:(id)a9
{
  return (id)objc_msgSend(a1, "_mediaWithName:type:adamIdentifier:umcIdentifier:predictionReasons:localizedReason:score:expirationDate:", a3, a4, a5, 0, a6, a7, a8, a9);
}

+ (id)mediaWithName:(id)a3 type:(int64_t)a4 umcIdentifier:(id)a5 predictionReasons:(unint64_t)a6 localizedReason:(id)a7 score:(double)a8 expirationDate:(id)a9
{
  return (id)objc_msgSend(a1, "_mediaWithName:type:adamIdentifier:umcIdentifier:predictionReasons:localizedReason:score:expirationDate:", a3, a4, 0, a5, a6, a7, a8, a9);
}

+ (id)navigationToDestination:(id)a3 title:(id)a4 subtitle:(id)a5 transportType:(unint64_t)a6 destinationName:(id)a7 predictionReasons:(unint64_t)a8 localizedReason:(id)a9 score:(double)a10 shouldClearOnEngagement:(BOOL)a11 validStartDate:(id)a12 validEndDate:(id)a13 dateInterval:(id)a14
{
  objc_class *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v35;

  v20 = (objc_class *)MEMORY[0x1E0DC7B40];
  v35 = a14;
  v21 = a13;
  v22 = a12;
  v23 = a9;
  v24 = a7;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  v28 = [v20 alloc];
  objc_msgSend(v27, "location");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = (void *)objc_msgSend(v28, "initWithDestination:name:type:", v29, v24, a6);
  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C28]), "initWithStartDate:endDate:lockScreenEligible:predicate:", v22, v21, 0, 0);

  v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF90C0]), "initWithContextualAction:criteria:", v30, v31);
  objc_msgSend(a1, "createSuggestionFromShortcutsAction:predictionReasons:localizedReason:title:subtitle:score:shouldClearOnEngagement:dateInterval:", v32, a8, v23, v26, v25, 0, a10, v35);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  return v33;
}

+ (void)_bundleIDWithURL:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "ATXProactiveSuggestion: LSAppLink error:%@", (uint8_t *)&v2, 0xCu);
}

@end
