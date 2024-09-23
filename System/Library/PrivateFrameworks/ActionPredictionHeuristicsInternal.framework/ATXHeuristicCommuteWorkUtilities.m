@implementation ATXHeuristicCommuteWorkUtilities

+ (id)heuristicResultToWorkWithLocation:(id)a3 validStartDate:(id)a4 validEndDate:(id)a5 heuristicDevice:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  ATXContextHeuristicResult *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ATXInformationHeuristicRefreshLocationTrigger *v24;
  ATXInformationHeuristicRefreshLocationTrigger *v25;
  uint64_t v27;
  void *v28;
  id v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  if (objc_msgSend(v10, "compare:", v11) == 1)
  {
    __atxlog_handle_context_heuristic();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      +[ATXHeuristicCommuteWorkUtilities heuristicResultToWorkWithLocation:validStartDate:validEndDate:heuristicDevice:].cold.1();

    v16 = (ATXContextHeuristicResult *)objc_opt_new();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DESTINATION_NAME_WORK"), &stru_1E82C5A18, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C9E3F0], "placemarkWithLocation:name:postalAddress:", v9, v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = 0;
    +[ATXHeuristicNavigationUtilities navigationSuggestionActionForDestination:event:transportType:schemaForEvent:predictionReasons:heuristicDevice:score:shouldClearOnEngagement:validStartDate:validEndDate:](ATXHeuristicNavigationUtilities, "navigationSuggestionActionForDestination:event:transportType:schemaForEvent:predictionReasons:heuristicDevice:score:shouldClearOnEngagement:validStartDate:validEndDate:", v19, 0, CFSTR("AUTOMOBILE"), 0, 0x1000000000, v12, 50.0, v27, v10, v11);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      v28 = v18;
      v29 = v9;
      objc_msgSend(v13, "addObject:", v20);
      objc_msgSend(v20, "atxShortcutsActionExecutableObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "contextualActionGetDirections");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "destination");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        v24 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
        objc_msgSend(v23, "coordinate");
        v25 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v24, "initWithEnteringLocation:radiusInMeters:");
        objc_msgSend(v14, "addObject:", v25);

      }
      v18 = v28;
      v9 = v29;
    }
    v16 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v13, v14);

  }
  return v16;
}

+ (id)heuristicResultToWorkWithValidStartDate:(id)a3 validEndDate:(id)a4 heuristicDevice:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  ATXContextHeuristicResult *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  ATXInformationHeuristicRefreshLocationTrigger *v20;
  ATXInformationHeuristicRefreshLocationTrigger *v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  if (objc_msgSend(v7, "compare:", v8) == 1)
  {
    __atxlog_handle_context_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      +[ATXHeuristicCommuteWorkUtilities heuristicResultToWorkWithLocation:validStartDate:validEndDate:heuristicDevice:].cold.1();

    v13 = (ATXContextHeuristicResult *)objc_opt_new();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("DESTINATION_NAME_WORK"), &stru_1E82C5A18, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    +[ATXHeuristicNavigationUtilities navigationSuggestionActionForLOI:destinationName:schemaForEvent:withScore:transportType:predictionReason:validStartDate:validEndDate:heuristicDevice:](ATXHeuristicNavigationUtilities, "navigationSuggestionActionForLOI:destinationName:schemaForEvent:withScore:transportType:predictionReason:validStartDate:validEndDate:heuristicDevice:", 1, v15, 0, CFSTR("AUTOMOBILE"), 0x1000000000, v7, 50.0, v8, v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      objc_msgSend(v10, "addObject:", v16);
      objc_msgSend(v16, "atxShortcutsActionExecutableObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "contextualActionGetDirections");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "destination");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = [ATXInformationHeuristicRefreshLocationTrigger alloc];
        objc_msgSend(v19, "coordinate");
        v21 = -[ATXInformationHeuristicRefreshLocationTrigger initWithEnteringLocation:radiusInMeters:](v20, "initWithEnteringLocation:radiusInMeters:");
        objc_msgSend(v11, "addObject:", v21);

      }
    }
    v13 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v10, v11);

  }
  return v13;
}

+ (void)heuristicResultToWorkWithLocation:validStartDate:validEndDate:heuristicDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_3(&dword_1C99DF000, v0, v1, "ATXHeuristicCommuteWorkUtilities: validStartDate %@ is after validEndDate %@. Skipping suggestion");
  OUTLINED_FUNCTION_2();
}

@end
