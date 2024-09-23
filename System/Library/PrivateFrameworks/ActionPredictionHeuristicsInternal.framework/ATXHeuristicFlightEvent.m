@implementation ATXHeuristicFlightEvent

- (id)permanentRefreshTriggers
{
  ATXInformationHeuristicRefreshNotitifcationTrigger *v2;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v3;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v4;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v5;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v6;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v7;
  void *v8;
  void *v9;

  v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v3 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v2, "initWithNotification:type:", *MEMORY[0x1E0CA9F88], 0);
  v4 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:]([ATXInformationHeuristicRefreshNotitifcationTrigger alloc], "initWithNotification:type:", CFSTR("ATXTravelTimeUpdated"), 0);
  v5 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:]([ATXInformationHeuristicRefreshNotitifcationTrigger alloc], "initWithNotification:type:", CFSTR("ATXCellularEnabledNotification"), 0);
  v6 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v7 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v6, "initWithNotification:type:", *MEMORY[0x1E0C998A0], 0);
  v8 = (void *)MEMORY[0x1CAA46CBC]();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v3, v4, v5, v7, 0);
  objc_autoreleasePoolPop(v8);

  return v9;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  ATXInformationHeuristicRefreshTimeTrigger *v21;
  void *v22;
  void *v23;
  void *v24;
  ATXInformationHeuristicRefreshTimeTrigger *v25;
  ATXContextHeuristicResult *v26;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v6 = (void *)MEMORY[0x1CAA46CBC]();
  objc_msgSend(v3, "heuristicDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHeuristicUpcomingFlightEventUtilities suggestionsForFlightsWithHeuristicDevice:](ATXHeuristicUpcomingFlightEventUtilities, "suggestionsForFlightsWithHeuristicDevice:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  objc_msgSend(v8, "suggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v9);

  objc_msgSend(v8, "additionalRefreshTriggers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v10);

  v11 = (void *)MEMORY[0x1CAA46CBC]();
  objc_msgSend(v3, "heuristicDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHeuristicOngoingFlightEventUtilities suggestionsForFlightsWithHeuristicDevice:](ATXHeuristicOngoingFlightEventUtilities, "suggestionsForFlightsWithHeuristicDevice:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v11);
  objc_msgSend(v13, "suggestions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v14);

  objc_msgSend(v13, "additionalRefreshTriggers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v15);

  v16 = (void *)MEMORY[0x1CAA46CBC]();
  objc_msgSend(v3, "heuristicDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHeuristicConcludedFlightEventUtilities suggestionsForFlightsWithHeuristicDevice:](ATXHeuristicConcludedFlightEventUtilities, "suggestionsForFlightsWithHeuristicDevice:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v16);
  objc_msgSend(v18, "suggestions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v19);

  objc_msgSend(v18, "additionalRefreshTriggers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unionSet:", v20);

  v21 = [ATXInformationHeuristicRefreshTimeTrigger alloc];
  objc_msgSend(v3, "heuristicDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "now");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "dateByAddingTimeInterval:", 7200.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[ATXInformationHeuristicRefreshTimeTrigger initWithFireDate:](v21, "initWithFireDate:", v24);

  objc_msgSend(v5, "addObject:", v25);
  v26 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:]([ATXContextHeuristicResult alloc], "initWithSuggestions:additionalRefreshTriggers:", v4, v5);

  return v26;
}

@end
