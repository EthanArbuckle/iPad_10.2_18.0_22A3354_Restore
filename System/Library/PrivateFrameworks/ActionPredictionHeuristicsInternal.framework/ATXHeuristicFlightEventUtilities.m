@implementation ATXHeuristicFlightEventUtilities

+ (void)logSuggestion:(id)a3 description:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "atxActionCriteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "startDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = v6;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v10;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_DEFAULT, "%@: start: %@, end: %@, %@", (uint8_t *)&v11, 0x2Au);

  }
}

+ (id)flightSchemaForEvent:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)flightInformationSchemaForEvent:(id)a3
{
  void *v3;
  void *DeepCopy;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, v3, 1uLL);
  objc_msgSend(DeepCopy, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("address"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("addressLocality"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("iataCode"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    v13 = v11 == 0;
  else
    v13 = 0;
  if (v13)
  {
    v25 = DeepCopy;
    v26 = v3;
    objc_msgSend(MEMORY[0x1E0D19E78], "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cityForIataCode:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "capitalizedString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("address"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("address"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        v20 = CFSTR("addressLocality");
        v21 = v16;
      }
      else
      {
        v27 = CFSTR("addressLocality");
        v28[0] = v16;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = CFSTR("address");
        v18 = v9;
        v21 = v19;
      }
      objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, v20);

    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("arrivalAirport"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("reservationFor"));

    DeepCopy = v25;
    v3 = v26;
  }
  if (v6)
    v22 = v6;
  else
    v22 = (id)objc_opt_new();
  v23 = v22;

  return v23;
}

+ (id)updatedFlightInformationSchemaForEvent:(id)a3 schemaForFlight:(id)a4 heuristicDevice:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  id DeepCopy;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10
    && (objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("SGEventMetadataCategoryDescriptionKey")),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("Flight")),
        v12,
        (v13 & 1) != 0))
  {
    DeepCopy = (id)CFPropertyListCreateDeepCopy(0, v8, 1uLL);
    +[ATXHeuristicFlightEventUtilities fetchDestinationPlacemarkForFlightEvent:heuristicDevice:](ATXHeuristicFlightEventUtilities, "fetchDestinationPlacemarkForFlightEvent:heuristicDevice:", v7, v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "locality");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "country");
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = (void *)v18;
      if (v17 && v18)
      {
        objc_msgSend(DeepCopy, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(DeepCopy, "objectForKeyedSubscript:", CFSTR("reservationFor"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v26 = v21;
        objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("address"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("addressLocality"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("addressCountry"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v19;
        if (!v23
          || !v29
          || !objc_msgSend(v17, "isEqualToString:", v23)
          || (objc_msgSend(v19, "isEqualToString:", v29) & 1) == 0)
        {
          if (v22)
          {
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, CFSTR("addressLocality"));
            objc_msgSend(v22, "setObject:forKeyedSubscript:", v19, CFSTR("addressCountry"));
          }
          else
          {
            v30[0] = CFSTR("addressLocality");
            v30[1] = CFSTR("addressCountry");
            v31[0] = v17;
            v31[1] = v19;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (void *)objc_msgSend(v24, "mutableCopy");

          }
        }
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v22, CFSTR("address"));
        objc_msgSend(v28, "setObject:forKeyedSubscript:", v26, CFSTR("arrivalAirport"));
        objc_msgSend(DeepCopy, "setObject:forKeyedSubscript:", v28, CFSTR("reservationFor"));

        v19 = v27;
      }

    }
  }
  else
  {
    DeepCopy = v8;
  }

  return DeepCopy;
}

+ (id)lastFlightLegEndTimeForEvent:(id)a3 heuristicDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  ATXCalendarEventsDataSource *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  _QWORD v26[4];
  id v27;
  uint8_t buf[16];

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dateByAddingTimeInterval:", 43200.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_context_heuristic();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "lastFlightLedEnd Event search", buf, 2u);
  }

  v12 = -[ATXCalendarEventsDataSource initWithDevice:]([ATXCalendarEventsDataSource alloc], "initWithDevice:", v6);
  -[ATXCalendarEventsDataSource flightEventsFromStartDate:endDate:reason:](v12, "flightEventsFromStartDate:endDate:reason:", v8, v10, CFSTR("last flight leg computation"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0CB3880];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __81__ATXHeuristicFlightEventUtilities_lastFlightLegEndTimeForEvent_heuristicDevice___block_invoke;
  v26[3] = &unk_1E82C4870;
  v27 = v14;
  v16 = v14;
  objc_msgSend(v15, "predicateWithBlock:", v26);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filteredArrayUsingPredicate:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXCalendarEventsDataSource sortEkEvents:](v12, "sortEkEvents:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    v25 = v10;
    v20 = v8;
    objc_msgSend(v19, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "lastFlightLegEndTimeForEvent:heuristicDevice:", v21, v6);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
      objc_msgSend(a1, "lastFlightLegEndTimeForEvent:heuristicDevice:", v21, v6);
    else
      objc_msgSend(v21, "endDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = v20;
    v10 = v25;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

BOOL __81__ATXHeuristicFlightEventUtilities_lastFlightLegEndTimeForEvent_heuristicDevice___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

+ (id)fetchDestinationPlacemarkForFlightEvent:(id)a3 heuristicDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  ATXCalendarEventsDataSource *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  id v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  void *v87;
  ATXCalendarEventsDataSource *v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  _QWORD v97[4];
  id v98;
  uint8_t buf[16];
  _QWORD v100[4];
  id v101;
  id v102;
  id v103[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_opt_new();
  v9 = (void *)MEMORY[0x1CAA46CBC]();
  objc_msgSend(a1, "lastFlightLegEndTimeForEvent:heuristicDevice:", v6, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v9);
  if (!v10)
  {
    objc_msgSend(v6, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateByAddingTimeInterval:", 43200.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v12 = (void *)objc_opt_new();
  objc_msgSend(v6, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFromDate:", v13);

  v14 = (void *)MEMORY[0x1CAA46CBC](objc_msgSend(v12, "setToDate:", v10));
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", &unk_1E82D5650, 0);
  objc_autoreleasePoolPop(v14);
  objc_msgSend(v12, "setMatchingCategories:", v15);

  v16 = (void *)objc_opt_new();
  v103[0] = 0;
  v100[0] = MEMORY[0x1E0C809B0];
  v100[1] = 3221225472;
  v100[2] = __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke;
  v100[3] = &unk_1E82C4898;
  v101 = 0;
  v17 = v16;
  v102 = v17;
  v18 = v8;
  objc_msgSend(v8, "iterScoredEventsWithQuery:error:block:", v12, v103, v100);
  v90 = v103[0];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(v6, "startDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dateByAddingTimeInterval:", -3600.0);
  v22 = objc_claimAutoreleasedReturnValue();

  __atxlog_handle_context_heuristic();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v23, OS_LOG_TYPE_DEFAULT, "fetchDestinationPlacemark Event search", buf, 2u);
  }

  v91 = v7;
  v24 = -[ATXCalendarEventsDataSource initWithDevice:]([ATXCalendarEventsDataSource alloc], "initWithDevice:", v7);
  v89 = (void *)v22;
  -[ATXCalendarEventsDataSource flightEventsFromStartDate:endDate:reason:](v24, "flightEventsFromStartDate:endDate:reason:", v22, v10, CFSTR("destination placemark event search"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CB3880];
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke_139;
  v97[3] = &unk_1E82C4870;
  v86 = v19;
  v98 = v86;
  objc_msgSend(v26, "predicateWithBlock:", v97);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = v25;
  objc_msgSend(v25, "filteredArrayUsingPredicate:", v27);
  v28 = objc_claimAutoreleasedReturnValue();

  v88 = v24;
  v85 = (void *)v28;
  -[ATXCalendarEventsDataSource sortEkEvents:](v24, "sortEkEvents:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v95 = (void *)objc_opt_new();
  v94 = (void *)objc_opt_new();
  v30 = (void *)objc_opt_new();
  v31 = v20;
  v96 = v29;
  v32 = v18;
  if ((unint64_t)objc_msgSend(v29, "count") < 2)
    goto LABEL_22;
  v92 = v30;
  v79 = v12;
  v83 = v18;
  objc_msgSend(v29, "firstObject");
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHeuristicFlightEventUtilities flightSchemaForEvent:](ATXHeuristicFlightEventUtilities, "flightSchemaForEvent:");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("iataCode"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("departureAirport"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("iataCode"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
    objc_msgSend(v95, "addObject:", v36);
  if (v39)
    objc_msgSend(v94, "addObject:", v39);
  v81 = v10;
  v75 = v31;
  objc_msgSend(v30, "addObject:", v76);
  v40 = v96;
  if ((unint64_t)objc_msgSend(v96, "count") < 2)
    goto LABEL_21;
  v41 = 1;
  while (1)
  {
    v42 = v39;
    v43 = v36;
    v44 = v33;
    objc_msgSend(v40, "objectAtIndexedSubscript:", v41);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    +[ATXHeuristicFlightEventUtilities flightSchemaForEvent:](ATXHeuristicFlightEventUtilities, "flightSchemaForEvent:", v45);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKeyedSubscript:", CFSTR("iataCode"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("departureAirport"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("iataCode"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v36 || !v39)
      goto LABEL_17;
    objc_msgSend(v95, "lastObject");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v50, "isEqualToString:", v39))
      break;
    v51 = objc_msgSend(v94, "containsObject:", v36);

    if ((v51 & 1) != 0)
      goto LABEL_20;
    objc_msgSend(v94, "addObject:", v39);
    objc_msgSend(v95, "addObject:", v36);
    objc_msgSend(v92, "addObject:", v45);
LABEL_17:

    ++v41;
    v40 = v96;
    if (v41 >= objc_msgSend(v96, "count"))
      goto LABEL_21;
  }

LABEL_20:
LABEL_21:

  v31 = v75;
  v10 = v81;
  v32 = v83;
  v12 = v79;
  v30 = v92;
LABEL_22:
  if (objc_msgSend(v30, "count"))
  {
    objc_msgSend(v30, "lastObject");
    v52 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v52 = v31;
  }
  v53 = v52;
  objc_msgSend(v52, "endLocation");
  v54 = objc_claimAutoreleasedReturnValue();
  if (!v54)
    goto LABEL_32;
  v55 = (void *)v54;
  objc_msgSend(v53, "endLocation");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "geoLocation");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v57)
    goto LABEL_32;
  v93 = v30;
  v78 = v17;
  v80 = v12;
  v82 = v10;
  v84 = v32;
  +[ATXHeuristicFlightEventUtilities flightInformationSchemaForEvent:](ATXHeuristicFlightEventUtilities, "flightInformationSchemaForEvent:", v53);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "objectForKeyedSubscript:", CFSTR("address"));
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("addressLocality"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v58, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("address"));
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "objectForKeyedSubscript:", CFSTR("addressCountry"));
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = objc_alloc_init(MEMORY[0x1E0C97378]);
  v68 = v67;
  if (v62)
  {
    v77 = v58;
    objc_msgSend(v67, "setCity:", v62);
    if (v66)
      objc_msgSend(v68, "setCountry:", v66);
    v69 = (void *)MEMORY[0x1E0C9E3F0];
    objc_msgSend(v53, "endLocation");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "geoLocation");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "endLocation");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "title");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "placemarkWithLocation:name:postalAddress:", v71, v73, v68);
    v63 = (void *)objc_claimAutoreleasedReturnValue();

    v58 = v77;
  }

  v10 = v82;
  v32 = v84;
  v17 = v78;
  v12 = v80;
  v30 = v93;
  if (!v62)
LABEL_32:
    v63 = 0;

  return v63;
}

void __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  id *v2;
  NSObject *v3;

  v2 = (id *)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    __atxlog_handle_context_heuristic();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke_cold_1(v2, v3);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", a2);
  }
}

BOOL __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke_139(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "compare:", v3) == -1;

  return v4;
}

+ (CLLocationCoordinate2D)locationAtArrivalAirport:(id)a3 event:(id)a4 heuristicDevice:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  CLLocationDegrees latitude;
  double v14;
  CLLocationDegrees longitude;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CLLocationDegrees v20;
  double v21;
  CLLocationDegrees v22;
  NSObject *v23;
  CLLocationCoordinate2D v24;
  NSObject *v25;
  double v26;
  double v27;
  int v28;
  CLLocationDegrees v29;
  __int16 v30;
  CLLocationDegrees v31;
  uint64_t v32;
  CLLocationCoordinate2D result;

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_msgSend(a1, "fetchDestinationPlacemarkForFlightEvent:heuristicDevice:", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "coordinate");
    latitude = v12;
    longitude = v14;
  }
  else
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("geo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("latitude"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("geo"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("longitude"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11 && v18)
    {
      objc_msgSend(v11, "doubleValue");
      v20 = v19;
      objc_msgSend(v18, "doubleValue");
      v22 = v21;
      __atxlog_handle_context_heuristic();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 134218240;
        v29 = v20;
        v30 = 2048;
        v31 = v22;
        _os_log_impl(&dword_1C99DF000, v23, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Geolocation from Schema metadata: %f, %f", (uint8_t *)&v28, 0x16u);
      }

      v24 = CLLocationCoordinate2DMake(v20, v22);
      latitude = v24.latitude;
      longitude = v24.longitude;
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v28 = 138412546;
        v29 = *(double *)&v11;
        v30 = 2112;
        v31 = *(double *)&v18;
        _os_log_impl(&dword_1C99DF000, v25, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Missing latitude/longitude information: %@, %@", (uint8_t *)&v28, 0x16u);
      }

      latitude = *MEMORY[0x1E0C9E500];
      longitude = *(double *)(MEMORY[0x1E0C9E500] + 8);
    }

  }
  v26 = latitude;
  v27 = longitude;
  result.longitude = v27;
  result.latitude = v26;
  return result;
}

+ (BOOL)currentLocationIsWithinAirportForEvent:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  int v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  NSObject *v32;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "endLocation");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_20;
  v5 = (void *)v4;
  objc_msgSend(v3, "endLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "geoLocation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_20;
  v8 = 0x1E82C3000uLL;
  objc_msgSend(v3, "endLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "geoLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHeuristicNavigationUtilities destinationPlacemarkForLocation:withDestinationName:](ATXHeuristicNavigationUtilities, "destinationPlacemarkForLocation:withDestinationName:", v10, 0);
  v11 = objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(v3, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("geo"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("latitude"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("arrivalAirport"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("geo"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("longitude"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
      v26 = v25 == 0;
    else
      v26 = 1;
    v27 = !v26;
    if (v26)
    {
      __atxlog_handle_context_heuristic();
      v32 = objc_claimAutoreleasedReturnValue();
      v8 = 0x1E82C3000;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138478083;
        v36 = v21;
        v37 = 2113;
        v38 = v25;
        _os_log_impl(&dword_1C99DF000, v32, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Missing latitude/longitude/destination information: %{private}@, %{private}@", buf, 0x16u);
      }

      v11 = 0;
    }
    else
    {
      objc_msgSend(v21, "doubleValue");
      v29 = v28;
      objc_msgSend(v25, "doubleValue");
      v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v29, v30);
      v8 = 0x1E82C3000uLL;
      +[ATXHeuristicNavigationUtilities destinationPlacemarkForLocation:withDestinationName:](ATXHeuristicNavigationUtilities, "destinationPlacemarkForLocation:withDestinationName:", v31, 0);
      v11 = objc_claimAutoreleasedReturnValue();

    }
    if (!v27)
      goto LABEL_22;
    if (v11)
      goto LABEL_4;
LABEL_20:
    __atxlog_handle_context_heuristic();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Unable to determine if we are at airport. Missing location", buf, 2u);
    }
LABEL_22:
    LOBYTE(v14) = 0;
    goto LABEL_23;
  }
LABEL_4:
  v12 = *(void **)(v8 + 2664);
  -[NSObject location](v11, "location");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isAtLocation:maxDistance:", v13, 5000);

  __atxlog_handle_context_heuristic();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v36) = v14;
    _os_log_impl(&dword_1C99DF000, v15, OS_LOG_TYPE_DEFAULT, "ATXHeursiticFlightEventUtilities: Are we at the airport: (%{BOOL}d)", buf, 8u);
  }

LABEL_23:
  return v14;
}

+ (id)_dateIntervalWithEvent:(id)a3
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

+ (id)flightInformationSpotlightSuggestionForEvent:(id)a3 schemaForFlight:(id)a4 predictionReasons:(unint64_t)a5 score:(double)a6 validStartDate:(id)a7 validEndDate:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ATXContextFlightEventSuggestionProducer *v24;
  void *v25;
  ATXContextFlightEventSuggestionProducer *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a7;
  v17 = a8;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("reservationFor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("flightNumber"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "length"))
  {
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("FLIGHT_CATEGORY"), &stru_1E82C5A18, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringWithFormat:", v22, v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = [ATXContextFlightEventSuggestionProducer alloc];
    objc_msgSend(a1, "_dateIntervalWithEvent:", v14);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = -[ATXContextFlightEventSuggestionProducer initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:](v24, "initWithTitle:flightInformationSchema:urlString:teamIdentifier:validFromStartDate:validToEndDate:alternateDestinationTitle:dateInterval:", v23, v15, 0, 0, v16, v17, 0, v25);

    objc_msgSend(v14, "startDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXContextFlightEventSuggestionProducer suggestionForFlightInformationWithReason:score:date:](v26, "suggestionForFlightInformationWithReason:score:date:", a5, v27, a6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v28, CFSTR("ATXHeuristicFlightEventUtilities: Flight info suggestion"));
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = v19;
      _os_log_impl(&dword_1C99DF000, v29, OS_LOG_TYPE_DEFAULT, "ATXHeuristicFlightEventUtilities: Flight Information: Missing information: Flight Info : %@", buf, 0xCu);
    }

    v28 = 0;
  }

  return v28;
}

void __92__ATXHeuristicFlightEventUtilities_fetchDestinationPlacemarkForFlightEvent_heuristicDevice___block_invoke_cold_1(id *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_ERROR, "ATXHeuristicFlightEventUtilities: Error while resolving events: %@", (uint8_t *)&v4, 0xCu);

}

@end
