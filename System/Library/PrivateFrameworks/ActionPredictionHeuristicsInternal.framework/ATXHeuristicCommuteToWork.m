@implementation ATXHeuristicCommuteToWork

- (id)permanentRefreshTriggers
{
  void *v2;
  id v3;
  ATXInformationHeuristicRefreshContextChangeTrigger *v4;
  void *v5;
  void *v6;
  ATXInformationHeuristicRefreshContextChangeTrigger *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v2 = (void *)getATXUpcomingCommuteToWorkAnchorClass_softClass;
  v15 = getATXUpcomingCommuteToWorkAnchorClass_softClass;
  if (!getATXUpcomingCommuteToWorkAnchorClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getATXUpcomingCommuteToWorkAnchorClass_block_invoke;
    v11[3] = &unk_1E82C46C8;
    v11[4] = &v12;
    __getATXUpcomingCommuteToWorkAnchorClass_block_invoke((uint64_t)v11);
    v2 = (void *)v13[3];
  }
  v3 = objc_retainAutorelease(v2);
  _Block_object_dispose(&v12, 8);
  if (v3)
  {
    v4 = [ATXInformationHeuristicRefreshContextChangeTrigger alloc];
    objc_msgSend(v3, "keyPathForContextStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "predicateForContextStoreRegistration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ATXInformationHeuristicRefreshContextChangeTrigger initWithCDContextualKeyPath:predicate:registrationIdentifier:](v4, "initWithCDContextualKeyPath:predicate:registrationIdentifier:", v5, v6, CFSTR("commuteWork"));

    v8 = (void *)MEMORY[0x1CAA46CBC]();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v7, 0);
    objc_autoreleasePoolPop(v8);

    return v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)heuristicResultWithEnvironment:(id)a3
{
  id v3;
  objc_class *ATXTripDuetEventClass;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  NSObject *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  NSObject *v33;
  uint32_t v34;
  void *v36;
  uint8_t buf[4];
  double v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  ATXTripDuetEventClass = (objc_class *)getATXTripDuetEventClass();
  v5 = (void *)objc_opt_new();
  v6 = v5;
  if (ATXTripDuetEventClass)
  {
    objc_msgSend(v3, "heuristicDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "locationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "getCurrentLocation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      __atxlog_handle_context_heuristic();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicCommuteToWork heuristicResultWithEnvironment:].cold.1();

      v13 = v6;
      goto LABEL_33;
    }
    objc_msgSend(v8, "locationOfInterestAtCurrentLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      __atxlog_handle_context_heuristic();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicCommuteToWork heuristicResultWithEnvironment:].cold.2();
      goto LABEL_13;
    }
    if (objc_msgSend(v10, "type"))
    {
      __atxlog_handle_context_heuristic();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToWork: Current loi is not type Home", buf, 2u);
      }
LABEL_13:

      v13 = v6;
LABEL_32:

LABEL_33:
      goto LABEL_34;
    }
    v15 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    objc_msgSend(v11, "coordinate");
    v17 = v16;
    objc_msgSend(v11, "coordinate");
    v18 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:", v17);
    objc_msgSend(v9, "distanceFromLocation:", v18);
    v20 = v19;
    if (v19 >= 500.0)
    {
      __atxlog_handle_context_heuristic();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v38 = v20 / 1000.0;
        _os_log_impl(&dword_1C99DF000, v30, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToWork: No longer at cached loi. Distance is %.2f km", buf, 0xCu);
      }

      v13 = v6;
      goto LABEL_31;
    }
    v21 = (void *)objc_msgSend([ATXTripDuetEventClass alloc], "initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:", v11, 0);
    v22 = v21;
    if (v21)
    {
      if (objc_msgSend(v21, "origin") == 1 || objc_msgSend(v22, "destination") == 2)
      {
        v36 = v18;
        __atxlog_handle_context_heuristic();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v22, "startDate");
          v24 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412290;
          v38 = v24;
          _os_log_impl(&dword_1C99DF000, v23, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToWork: Creating suggestion for expected trip at %@", buf, 0xCu);

        }
        objc_msgSend(v22, "startDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "dateByAddingTimeInterval:", -3600.0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v22, "startDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "dateByAddingTimeInterval:", 1800.0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "heuristicDevice");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        +[ATXHeuristicCommuteWorkUtilities heuristicResultToWorkWithValidStartDate:validEndDate:heuristicDevice:](ATXHeuristicCommuteWorkUtilities, "heuristicResultToWorkWithValidStartDate:validEndDate:heuristicDevice:", v26, v28, v29);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        v18 = v36;
        goto LABEL_30;
      }
      __atxlog_handle_context_heuristic();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        *(_QWORD *)&v38 = (int)objc_msgSend(v22, "origin");
        v39 = 2048;
        v40 = (int)objc_msgSend(v22, "destination");
        v32 = "ATXHeuristicCommuteToWork: Trip not from home to work, %lu -> %lu";
        v33 = v31;
        v34 = 22;
        goto LABEL_28;
      }
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v32 = "ATXHeuristicCommuteToWork: No upcoming trip";
        v33 = v31;
        v34 = 2;
LABEL_28:
        _os_log_impl(&dword_1C99DF000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
      }
    }

    v13 = v6;
LABEL_30:

LABEL_31:
    goto LABEL_32;
  }
  v13 = v5;
LABEL_34:

  return v13;
}

- (void)heuristicResultWithEnvironment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "ATXHeuristicCommuteToWork: No current location", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)heuristicResultWithEnvironment:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "ATXHeuristicCommuteToWork: No current loi", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
