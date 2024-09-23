@implementation ATXHeuristicRideshare

- (void)setupCellularNetworkMonitoring
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *accessQueue;
  NSObject *v6;
  _QWORD block[5];

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (OS_dispatch_queue *)dispatch_queue_create("ATXHeuristicsRideshareRefresh", v3);
  accessQueue = self->_accessQueue;
  self->_accessQueue = v4;

  v6 = self->_accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__ATXHeuristicRideshare_setupCellularNetworkMonitoring__block_invoke;
  block[3] = &unk_1E82C4D98;
  block[4] = self;
  dispatch_async(v6, block);
}

void __55__ATXHeuristicRideshare_setupCellularNetworkMonitoring__block_invoke(uint64_t a1)
{
  nw_path_monitor_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *evaluator_for_endpoint;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v2 = nw_path_monitor_create_with_type(nw_interface_type_cellular);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = v2;

  v5 = nw_parameters_create();
  nw_parameters_set_required_interface_type(v5, nw_interface_type_cellular);
  evaluator_for_endpoint = (void *)nw_path_create_evaluator_for_endpoint();
  if (evaluator_for_endpoint)
  {
    v7 = nw_path_evaluator_copy_path();
    if (nw_path_uses_interface_type(v7, nw_interface_type_cellular))
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 32) = nw_path_get_status(v7);

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __55__ATXHeuristicRideshare_setupCellularNetworkMonitoring__block_invoke_2;
  v9[3] = &unk_1E82C4D70;
  objc_copyWeak(&v10, &location);
  nw_path_monitor_set_update_handler(v8, v9);
  nw_path_monitor_set_queue(*(nw_path_monitor_t *)(*(_QWORD *)(a1 + 32) + 8), *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 24));
  nw_path_monitor_start(*(nw_path_monitor_t *)(*(_QWORD *)(a1 + 32) + 8));
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __55__ATXHeuristicRideshare_setupCellularNetworkMonitoring__block_invoke_2(uint64_t a1, void *a2)
{
  id WeakRetained;
  NSObject *v4;

  v4 = a2;
  if (nw_path_uses_interface_type(v4, nw_interface_type_cellular))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "sendRefreshNotificationIfRequired:", v4);

  }
}

- (void)sendRefreshNotificationIfRequired:(id)a3
{
  nw_path_status_t status;
  nw_path_status_t v5;
  int *p_currentStatus;
  int currentStatus;
  NSObject *v9;
  void *v10;

  status = nw_path_get_status((nw_path_t)a3);
  v5 = status;
  currentStatus = self->_currentStatus;
  p_currentStatus = &self->_currentStatus;
  if (currentStatus != 1 && status == nw_path_status_satisfied)
  {
    __atxlog_handle_context_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[ATXHeuristicRideshare sendRefreshNotificationIfRequired:].cold.1(p_currentStatus, v9);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("ATXCellularEnabledNotification"), 0);

  }
  *p_currentStatus = v5;
}

+ (void)subscribeNotification
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", objc_opt_class(), sel__appRegistrationChange_, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", objc_opt_class(), sel__appRegistrationChange_, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

}

- (ATXHeuristicRideshare)init
{
  ATXHeuristicRideshare *v2;
  ATXHeuristicRideshare *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicRideshare;
  v2 = -[ATXHeuristicRideshare init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[ATXHeuristicRideshare setupCellularNetworkMonitoring](v2, "setupCellularNetworkMonitoring");
    objc_msgSend((id)objc_opt_class(), "subscribeNotification");
  }
  return v3;
}

- (void)dealloc
{
  void *v3;
  NSObject *pathMonitor;
  objc_super v5;

  v3 = (void *)MEMORY[0x1CAA46CBC](self, a2);
  pathMonitor = self->_pathMonitor;
  if (pathMonitor)
    nw_path_monitor_cancel(pathMonitor);
  objc_autoreleasePoolPop(v3);
  v5.receiver = self;
  v5.super_class = (Class)ATXHeuristicRideshare;
  -[ATXHeuristicRideshare dealloc](&v5, sel_dealloc);
}

- (id)permanentRefreshTriggers
{
  ATXInformationHeuristicRefreshNotitifcationTrigger *v2;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v3;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v4;
  ATXInformationHeuristicRefreshNotitifcationTrigger *v5;
  void *v6;
  void *v7;

  v2 = [ATXInformationHeuristicRefreshNotitifcationTrigger alloc];
  v3 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:](v2, "initWithNotification:type:", *MEMORY[0x1E0CA9F88], 0);
  v4 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:]([ATXInformationHeuristicRefreshNotitifcationTrigger alloc], "initWithNotification:type:", CFSTR("ATXRideshareAppChangeNotification"), 0);
  v5 = -[ATXInformationHeuristicRefreshNotitifcationTrigger initWithNotification:type:]([ATXInformationHeuristicRefreshNotitifcationTrigger alloc], "initWithNotification:type:", CFSTR("ATXCellularEnabledNotification"), 0);
  v6 = (void *)MEMORY[0x1CAA46CBC]();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v3, v4, v5, 0);
  objc_autoreleasePoolPop(v6);

  return v7;
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  ATXContextHeuristicResult *v10;
  void *v11;
  ATXContextHeuristicResult *v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v4, "heuristicDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicRideshare suggestionForUpcomingFlightWithHeuristicDevice:](self, "suggestionForUpcomingFlightWithHeuristicDevice:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v5, "addObject:", v7);
  objc_msgSend(v4, "heuristicDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXHeuristicRideshare suggestionForConcludedFlightWithHeuristicDevice:](self, "suggestionForConcludedFlightWithHeuristicDevice:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    objc_msgSend(v5, "addObject:", v9);
  v10 = [ATXContextHeuristicResult alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[ATXContextHeuristicResult initWithSuggestions:additionalRefreshTriggers:](v10, "initWithSuggestions:additionalRefreshTriggers:", v5, v11);

  return v12;
}

+ (void)_appRegistrationChange:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  objc_msgSend(v3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    +[ATXHeuristicRideshare _appRegistrationChange:].cold.3();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundleIDs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.LaunchServices.applicationRegistered"));
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "postNotificationName:object:", CFSTR("ATXRideshareAppChangeNotification"), 0);

  __atxlog_handle_context_heuristic();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v13)
      +[ATXHeuristicRideshare _appRegistrationChange:].cold.1((uint64_t)v8, v12, v14, v15, v16, v17, v18, v19);
  }
  else if (v13)
  {
    +[ATXHeuristicRideshare _appRegistrationChange:].cold.2((uint64_t)v8, v12, v14, v15, v16, v17, v18, v19);
  }

}

- (id)rideShareAppWithHeuristicDevice:(id)a3
{
  id v3;
  ATXUserAppPreferenceDataSource *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  _QWORD v10[6];
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__10;
  v18 = __Block_byref_object_dispose__10;
  v19 = 0;
  v11 = 0;
  v12[0] = &v11;
  v12[1] = 0x3032000000;
  v12[2] = __Block_byref_object_copy__10;
  v12[3] = __Block_byref_object_dispose__10;
  v13 = 0;
  v4 = -[ATXUserAppPreferenceDataSource initWithDevice:]([ATXUserAppPreferenceDataSource alloc], "initWithDevice:", v3);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__ATXHeuristicRideshare_rideShareAppWithHeuristicDevice___block_invoke;
  v10[3] = &unk_1E82C4DC0;
  v10[4] = &v14;
  v10[5] = &v11;
  -[ATXUserAppPreferenceDataSource preferredAppForIntentName:andParameterCombination:skipAppSchemaCheck:callback:](v4, "preferredAppForIntentName:andParameterCombination:skipAppSchemaCheck:callback:", CFSTR("INRequestRideIntent"), &unk_1E82D54E8, 1, v10);
  if (*(_QWORD *)(v12[0] + 40))
  {
    __atxlog_handle_context_heuristic();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[ATXHeuristicRideshare rideShareAppWithHeuristicDevice:].cold.2((uint64_t)v12, v5);

    v6 = 0;
  }
  else
  {
    if (v15[5])
    {
      __atxlog_handle_context_heuristic();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = v15[5];
        *(_DWORD *)buf = 138412290;
        v21 = v8;
        _os_log_impl(&dword_1C99DF000, v7, OS_LOG_TYPE_DEFAULT, "Using \"%@\" app for rideshare", buf, 0xCu);
      }
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicRideshare rideShareAppWithHeuristicDevice:].cold.1();
    }

    v6 = (id)v15[5];
  }

  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __57__ATXHeuristicRideshare_rideShareAppWithHeuristicDevice___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v11 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;

}

- (id)_rideShareSuggestionActionForDestination:(id)a3 heuristicDevice:(id)a4 flightInformationSchema:(id)a5 predictionReasons:(unint64_t)a6 score:(double)a7 validFromStartDate:(id)a8 validToEndDate:(id)a9 dateInterval:(id)a10
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
  NSObject *v27;
  void *v28;
  void *v29;
  ATXContextFlightEventSuggestionProducer *v30;
  void *v31;
  unint64_t v33;
  id v34;
  id v35;
  uint8_t buf[15];
  Boolean keyExistsAndHasValidFormat;

  v17 = a3;
  v35 = a4;
  v18 = a5;
  v19 = a8;
  v20 = a9;
  v21 = a10;
  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("zkwShowRequestRide"), (CFStringRef)*MEMORY[0x1E0CF9510], &keyExistsAndHasValidFormat))
  {
    v33 = a6;
    v34 = v19;
    v22 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("REQUEST_RIDE_TO_NEXT_EVENT_TITLE"), &stru_1E82C5A18, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringWithFormat:", v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    if (!v18)
    {
      objc_msgSend(v17, "name");
      v27 = objc_claimAutoreleasedReturnValue();
    }
    v28 = v35;
    -[ATXHeuristicRideshare rideShareAppWithHeuristicDevice:](self, "rideShareAppWithHeuristicDevice:", v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v34;
    if (v29)
    {
      v30 = -[ATXContextFlightEventSuggestionProducer initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:]([ATXContextFlightEventSuggestionProducer alloc], "initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:", v26, v18, 0, 0, v34, v20, v27, v21);
      -[ATXContextFlightEventSuggestionProducer suggestionForRideShareAppForDestination:source:rideOptionName:preferredBundleId:predictionReasons:score:](v30, "suggestionForRideShareAppForDestination:source:rideOptionName:preferredBundleId:predictionReasons:score:", v17, 0, 0, v29, v33, a7);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v31, CFSTR("ATXHeuristicRideshare: Rideshare app for flight suggestion"));

      v19 = v34;
    }
    else
    {
      v31 = 0;
    }

  }
  else
  {
    __atxlog_handle_ui();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v35;
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v27, OS_LOG_TYPE_DEFAULT, "Debug: Skip suggestion for request ride", buf, 2u);
    }
    v31 = 0;
  }

  return v31;
}

- (id)rideShareSuggestionActionForEvent:(id)a3 heuristicDevice:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6 validFromStartDate:(id)a7 validToEndDate:(id)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  ATXHeuristicRideshare *v40;
  id v42;
  id v43;

  v14 = a3;
  v15 = a4;
  v42 = a7;
  v43 = a8;
  +[ATXHeuristicFlightEventUtilities flightInformationSchemaForEvent:](ATXHeuristicFlightEventUtilities, "flightInformationSchemaForEvent:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHeuristicFlightEventUtilities updatedFlightInformationSchemaForEvent:schemaForFlight:heuristicDevice:](ATXHeuristicFlightEventUtilities, "updatedFlightInformationSchemaForEvent:schemaForFlight:heuristicDevice:", v14, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("SGEventMetadataCategoryDescriptionKey"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Lodging"));

  if ((a5 & 0x80000000) != 0)
  {
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("departureAirport"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("iataCode"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend(v14, "structuredLocation");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "title");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v31 = v14;
    v32 = v26;
    v33 = 0;
  }
  else
  {
    if (((a5 >> 33) & v20) == 1)
    {
      objc_msgSend(v14, "structuredLocation");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21)
        goto LABEL_6;
      v22 = (void *)v21;
      objc_msgSend(v14, "structuredLocation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "geoLocation");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v24
        || (objc_msgSend(v14, "structuredLocation"),
            v25 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v25, "title"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            v25,
            !v26))
      {
LABEL_6:
        objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("name"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if ((a5 & 0x100000) == 0)
      {
        __atxlog_handle_context_heuristic();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          -[ATXHeuristicRideshare rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:].cold.1();
        v26 = 0;
        v35 = 0;
        v36 = v42;
        goto LABEL_19;
      }
      objc_msgSend(v14, "title");
      v37 = objc_claimAutoreleasedReturnValue();
      if (!v37)
      {
        __atxlog_handle_context_heuristic();
        v34 = objc_claimAutoreleasedReturnValue();
        v36 = v42;
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
          -[ATXHeuristicRideshare rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:].cold.2();
        v26 = 0;
        v35 = 0;
        goto LABEL_19;
      }
      v26 = (void *)v37;
    }
    v31 = v14;
    v32 = v26;
    v33 = 1;
  }
  +[ATXHeuristicNavigationUtilities destinationPlacemarkForEvent:name:schemaType:](ATXHeuristicNavigationUtilities, "destinationPlacemarkForEvent:name:schemaType:", v31, v32, v33);
  v38 = objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    v35 = 0;
    v36 = v42;
    goto LABEL_21;
  }
  v34 = v38;
  -[ATXHeuristicRideshare _dateIntervalWithEvent:](self, "_dateIntervalWithEvent:", v14);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = self;
  v36 = v42;
  -[ATXHeuristicRideshare _rideShareSuggestionActionForDestination:heuristicDevice:flightInformationSchema:predictionReasons:score:validFromStartDate:validToEndDate:dateInterval:](v40, "_rideShareSuggestionActionForDestination:heuristicDevice:flightInformationSchema:predictionReasons:score:validFromStartDate:validToEndDate:dateInterval:", v34, v15, v17, a5, v42, v43, a6, v39);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
LABEL_21:

  return v35;
}

- (id)suggestionForUpcomingFlightWithHeuristicDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ATXCalendarEventsDataSource *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v19;
  ATXHeuristicRideshare *v20;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", 86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ATXCalendarEventsDataSource initWithDevice:]([ATXCalendarEventsDataSource alloc], "initWithDevice:", v4);
  -[ATXCalendarEventsDataSource flightEventsFromStartDate:endDate:reason:](v7, "flightEventsFromStartDate:endDate:reason:", v5, v6, CFSTR("ride share for upcoming flight heuristic"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCalendarEventsDataSource sortEkEvents:](v7, "sortEkEvents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v20 = self;
    +[ATXHeuristicNavigationUtilities locationFromEvent:schemaType:](ATXHeuristicNavigationUtilities, "locationFromEvent:schemaType:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    if (+[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:maxDistance:](ATXHeuristicNavigationUtilities, "allowNavigationSuggestionForLocation:maxDistance:", v11, 250000))
    {
      v19 = v11;
      objc_msgSend(v10, "startDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dateByAddingTimeInterval:", -14400.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "dateByAddingTimeInterval:", -2400.0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v14, "compare:", v16) == 1)
      {
        __atxlog_handle_context_heuristic();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          -[ATXHeuristicRideshare suggestionForUpcomingFlightWithHeuristicDevice:].cold.1();

        v12 = 0;
      }
      else
      {
        -[ATXHeuristicRideshare rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:](v20, "rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:", v10, v4, 0x80000000, v14, v16, 60.0);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v12, CFSTR("ATXHeuristicRideshare: Upcoming flight suggestion"));

      }
      v11 = v19;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)suggestionForConcludedFlightWithHeuristicDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  ATXCalendarEventsDataSource *v6;
  id v7;
  void *v8;
  ATXCalendarEventsDataSource *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  NSObject *v38;
  ATXCalendarEventsDataSource *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  NSObject *v45;
  void *v47;
  void *v48;
  void *v49;
  ATXCalendarEventsDataSource *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v63;
  void *v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint8_t buf[4];
  _BOOL4 v75;
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateByAddingTimeInterval:", -64800.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = [ATXCalendarEventsDataSource alloc];
  v63 = v3;
  v7 = v3;
  v8 = v4;
  v9 = -[ATXCalendarEventsDataSource initWithDevice:](v6, "initWithDevice:", v7);
  -[ATXCalendarEventsDataSource flightEventsFromStartDate:endDate:reason:](v9, "flightEventsFromStartDate:endDate:reason:", v5, v8, CFSTR("ride share for concluded flight heuristic"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXCalendarEventsDataSource sortEkEvents:](v9, "sortEkEvents:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v11, "count"))
  {
    v36 = 0;
    goto LABEL_44;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v12 = v11;
  v56 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (!v56)
  {
    v36 = 0;
    goto LABEL_43;
  }
  v57 = *(_QWORD *)v71;
  v54 = v11;
  v55 = v10;
  v53 = v12;
  v50 = v9;
  v51 = v5;
  while (2)
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v71 != v57)
        objc_enumerationMutation(v12);
      v59 = v13;
      v64 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v13);
      +[ATXHeuristicFlightEventUtilities flightInformationSchemaForEvent:](ATXHeuristicFlightEventUtilities, "flightInformationSchemaForEvent:");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateByAddingTimeInterval:", -43200.0);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      -[ATXCalendarEventsDataSource hotelEventsFromStartDate:endDate:reason:](v9, "hotelEventsFromStartDate:endDate:reason:");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v14, "count"))
      {
        objc_msgSend(v8, "dateByAddingTimeInterval:", 43200.0);
        v15 = v5;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXCalendarEventsDataSource hotelEventsFromStartDate:endDate:reason:](v9, "hotelEventsFromStartDate:endDate:reason:", v8, v16, CFSTR("hotel search for concluded flight"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v14;
        v14 = (void *)v17;

        v5 = v15;
      }
      -[ATXCalendarEventsDataSource sortEkEvents:](v9, "sortEkEvents:", v14);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "count"))
      {
        v58 = v14;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        obj = v19;
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
        if (v20)
        {
          v21 = v20;
          v52 = v19;
          v22 = *(_QWORD *)v67;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v67 != v22)
                objc_enumerationMutation(obj);
              v24 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
              +[ATXHeuristicNavigationUtilities locationFromEvent:schemaType:](ATXHeuristicNavigationUtilities, "locationFromEvent:schemaType:", v24, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              if (+[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:maxDistance:](ATXHeuristicNavigationUtilities, "allowNavigationSuggestionForLocation:maxDistance:", v25, 250000))
              {
                objc_msgSend(v64, "endDate");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "timeIntervalSinceDate:", v8);
                v28 = v27;

                objc_msgSend(v24, "startDate");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = objc_msgSend(v8, "compare:", v29);

                if (v30 == -1 && v28 <= 14400.0)
                {
                  v32 = v8;
                  objc_msgSend(v24, "endDate");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "endDate");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "dateByAddingTimeInterval:", 14400.0);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v33, "compare:", v35) == 1)
                  {
                    __atxlog_handle_context_heuristic();
                    v45 = objc_claimAutoreleasedReturnValue();
                    v9 = v50;
                    v5 = v51;
                    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
                      -[ATXHeuristicRideshare suggestionForUpcomingFlightWithHeuristicDevice:].cold.1();

                    v36 = 0;
                    v8 = v32;
                    goto LABEL_42;
                  }
                  -[ATXHeuristicRideshare rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:](self, "rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:", v24, v63, 0x200000000, v33, v35, 60.0);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v36)
                  {
                    +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v36, CFSTR("ATXHeuristicRideshare: Concluded flight suggestion"));
                    v8 = v32;
                    v9 = v50;
                    v5 = v51;
                    goto LABEL_42;
                  }

                  v8 = v32;
                }
              }

            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v76, 16);
            if (v21)
              continue;
            break;
          }
          v9 = v50;
          v5 = v51;
          v11 = v54;
          v10 = v55;
          v19 = v52;
          v12 = v53;
        }
      }
      else
      {
        if (!+[ATXHeuristicFlightEventUtilities currentLocationIsWithinAirportForEvent:](ATXHeuristicFlightEventUtilities, "currentLocationIsWithinAirportForEvent:", v64))goto LABEL_33;
        v58 = v14;
        +[ATXHeuristicNavigationUtilities fetchLocationForLOI:](ATXHeuristicNavigationUtilities, "fetchLocationForLOI:", 0);
        obj = (id)objc_claimAutoreleasedReturnValue();
        v37 = +[ATXHeuristicNavigationUtilities allowNavigationSuggestionForLocation:maxDistance:](ATXHeuristicNavigationUtilities, "allowNavigationSuggestionForLocation:maxDistance:");
        __atxlog_handle_context_heuristic();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          v75 = v37;
          _os_log_impl(&dword_1C99DF000, v38, OS_LOG_TYPE_DEFAULT, "ATXHeursiticRideshare: Can we go home (%{BOOL}d)", buf, 8u);
        }

        if (v37)
        {
          v39 = v9;
          v40 = v8;
          v41 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("HOME_NAVIGATION_TITLE"), &stru_1E82C5A18, 0);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "localizedStringWithFormat:", v43);
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          +[ATXHeuristicNavigationUtilities placemarkForLOI:name:](ATXHeuristicNavigationUtilities, "placemarkForLOI:name:", 0, v25);
          v44 = objc_claimAutoreleasedReturnValue();
          if (v44)
          {
            v33 = (void *)v44;
            v52 = v19;
            objc_msgSend(v64, "endDate");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "endDate");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "dateByAddingTimeInterval:", 14400.0);
            v48 = (void *)objc_claimAutoreleasedReturnValue();

            -[ATXHeuristicRideshare _dateIntervalWithEvent:](self, "_dateIntervalWithEvent:", v64);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            -[ATXHeuristicRideshare _rideShareSuggestionActionForDestination:heuristicDevice:flightInformationSchema:predictionReasons:score:validFromStartDate:validToEndDate:dateInterval:](self, "_rideShareSuggestionActionForDestination:heuristicDevice:flightInformationSchema:predictionReasons:score:validFromStartDate:validToEndDate:dateInterval:", v33, v63, v61, 0x200000000, v35, v48, 60.0, v49);
            v36 = (void *)objc_claimAutoreleasedReturnValue();

            v8 = v40;
            v9 = v39;
LABEL_42:

            v11 = v54;
            v10 = v55;
            v12 = v53;
            goto LABEL_43;
          }

          v8 = v40;
          v9 = v39;
          v11 = v54;
          v10 = v55;
          v12 = v53;
        }
      }

      v14 = v58;
LABEL_33:

      v13 = v59 + 1;
    }
    while (v59 + 1 != v56);
    v36 = 0;
    v56 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    if (v56)
      continue;
    break;
  }
LABEL_43:

LABEL_44:
  return v36;
}

- (id)_dateIntervalWithEvent:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0CB3588];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:", v6, v7);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_networkPath, 0);
  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

- (void)sendRefreshNotificationIfRequired:(int *)a1 .cold.1(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  v4 = 1024;
  v5 = 1;
  _os_log_debug_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_DEBUG, "ATXHeuristicRideshare: Network Connectivity restored (%d -> %d). Refreshing Rideshare suggestions", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_2();
}

+ (void)_appRegistrationChange:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1C99DF000, a2, a3, "ATXHeuristicRideshare: App \"%@\" installed. Refreshing suggestions...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_appRegistrationChange:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_3(&dword_1C99DF000, a2, a3, "ATXHeuristicRideshare: App \"%@\" uninstalled. Refreshing suggestions...", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)_appRegistrationChange:.cold.3()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_3();
  _os_log_debug_impl(&dword_1C99DF000, v0, OS_LOG_TYPE_DEBUG, "ATXHeuristicRideshare: App install/uninstall notification handler", v1, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)rideShareAppWithHeuristicDevice:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_1C99DF000, v0, OS_LOG_TYPE_ERROR, "ATXHeuristicRideshare: Did not find any ride share app. Cant create rideshare suggestion", v1, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)rideShareAppWithHeuristicDevice:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "Error while resolving ride share apps: %@", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0(&dword_1C99DF000, v0, v1, "ATXHeuristicFlightEventUtilities: Rideshare called for an unsupported prediction reason", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)rideShareSuggestionActionForEvent:heuristicDevice:predictionReasons:score:validFromStartDate:validToEndDate:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0(&dword_1C99DF000, v0, v1, "ATXHeuristicFlightEventUtilities: For Upcoming flight, destination is empty", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)suggestionForUpcomingFlightWithHeuristicDevice:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_3(&dword_1C99DF000, v0, v1, "ATXHeuristicRideshare: Start %@ is after End %@");
  OUTLINED_FUNCTION_2();
}

@end
