@implementation ATXHeuristicCommuteFromWork

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
  v2 = (void *)getATXUpcomingCommuteFromWorkAnchorClass_softClass;
  v15 = getATXUpcomingCommuteFromWorkAnchorClass_softClass;
  if (!getATXUpcomingCommuteFromWorkAnchorClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getATXUpcomingCommuteFromWorkAnchorClass_block_invoke;
    v11[3] = &unk_1E82C46C8;
    v11[4] = &v12;
    __getATXUpcomingCommuteFromWorkAnchorClass_block_invoke((uint64_t)v11);
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
    v7 = -[ATXInformationHeuristicRefreshContextChangeTrigger initWithCDContextualKeyPath:predicate:registrationIdentifier:](v4, "initWithCDContextualKeyPath:predicate:registrationIdentifier:", v5, v6, CFSTR("commuteHome"));

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
  id v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  NSObject *v29;
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
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicCommuteFromWork heuristicResultWithEnvironment:].cold.1();

      v27 = v6;
      goto LABEL_33;
    }
    objc_msgSend(v8, "locationOfInterestAtCurrentLocation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "type") == 1)
      {
        v12 = objc_alloc(MEMORY[0x1E0C9E3B8]);
        objc_msgSend(v11, "coordinate");
        v14 = v13;
        objc_msgSend(v11, "coordinate");
        v15 = (void *)objc_msgSend(v12, "initWithLatitude:longitude:", v14);
        objc_msgSend(v9, "distanceFromLocation:", v15);
        v17 = v16;
        if (v16 >= 500.0)
        {
          __atxlog_handle_context_heuristic();
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v38 = v17 / 1000.0;
            _os_log_impl(&dword_1C99DF000, v30, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToHome: No longer at cached loi. Distance is %.2f km", buf, 0xCu);
          }

          v27 = v6;
          goto LABEL_31;
        }
        v18 = (void *)objc_msgSend([ATXTripDuetEventClass alloc], "initWithCurrentContextStoreValuesWithOriginLOI:ignoreBeforeDate:", v11, 0);
        v19 = v18;
        if (v18)
        {
          if (objc_msgSend(v18, "origin") == 2 || objc_msgSend(v19, "destination") == 1)
          {
            v36 = v15;
            __atxlog_handle_context_heuristic();
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v19, "startDate");
              v21 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
              *(_DWORD *)buf = 138412290;
              v38 = v21;
              _os_log_impl(&dword_1C99DF000, v20, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToHome: Creating suggestion for expected trip at %@", buf, 0xCu);

            }
            objc_msgSend(v19, "startDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "dateByAddingTimeInterval:", -3600.0);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v19, "startDate");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "dateByAddingTimeInterval:", 1800.0);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v3, "heuristicDevice");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            +[ATXHeuristicCommuteHomeUtilities heuristicResultToHomeWithValidStartDate:validEndDate:heuristicDevice:](ATXHeuristicCommuteHomeUtilities, "heuristicResultToHomeWithValidStartDate:validEndDate:heuristicDevice:", v23, v25, v26);
            v27 = (id)objc_claimAutoreleasedReturnValue();

            v15 = v36;
            goto LABEL_30;
          }
          __atxlog_handle_context_heuristic();
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134218240;
            *(_QWORD *)&v38 = (int)objc_msgSend(v19, "origin");
            v39 = 2048;
            v40 = (int)objc_msgSend(v19, "destination");
            v32 = "ATXHeuristicCommuteToHome: Trip not from work to home, %lu -> %lu";
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
            v32 = "ATXHeuristicCommuteToHome: No upcoming trip";
            v33 = v31;
            v34 = 2;
LABEL_28:
            _os_log_impl(&dword_1C99DF000, v33, OS_LOG_TYPE_DEFAULT, v32, buf, v34);
          }
        }

        v27 = v6;
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      __atxlog_handle_context_heuristic();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C99DF000, v29, OS_LOG_TYPE_DEFAULT, "ATXHeuristicCommuteToHome: Current loi is not type Work", buf, 2u);
      }
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[ATXHeuristicCommuteFromWork heuristicResultWithEnvironment:].cold.2();
    }

    v27 = v6;
LABEL_32:

LABEL_33:
    goto LABEL_34;
  }
  v27 = v5;
LABEL_34:

  return v27;
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
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "ATXHeuristicCommuteToHome: No current location", v2, v3, v4, v5, v6);
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
  OUTLINED_FUNCTION_1_0(&dword_1C99DF000, v0, v1, "ATXHeuristicCommuteToHome: No current loi", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
