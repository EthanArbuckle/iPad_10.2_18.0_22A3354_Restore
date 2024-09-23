@implementation ATXHeuristicNavigationUtilities

+ (id)getCurrentLocation
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getCurrentLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (BOOL)isDestinationTooCloseToNavigate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  double v7;
  double v8;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  int v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[ATXHeuristicNavigationUtilities getCurrentLocation](ATXHeuristicNavigationUtilities, "getCurrentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = v4 != 0;
  if (v4)
  {
    objc_msgSend(v4, "distanceFromLocation:", v3);
    v8 = v7;
    if (v7 > 500.0)
    {
      v6 = 0;
      goto LABEL_10;
    }
    __atxlog_handle_context_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 134217984;
      v15 = v8 / 1000.0;
      v10 = "Navigation Suggestion: Close to event (distance to: %f). Skipping...";
      v11 = v9;
      v12 = 12;
LABEL_7:
      _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
    }
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      v10 = "Navigation Suggestion: Current location missing";
      v11 = v9;
      v12 = 2;
      goto LABEL_7;
    }
  }

LABEL_10:
  return v6;
}

+ (id)fetchLocationForLOI:(int64_t)a3
{
  void *v4;
  dispatch_semaphore_t v5;
  NSObject *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *, void *);
  void *v12;
  NSObject *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__17;
  v19 = __Block_byref_object_dispose__17;
  v20 = 0;
  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = dispatch_semaphore_create(0);
  v9 = MEMORY[0x1E0C809B0];
  v10 = 3221225472;
  v11 = __55__ATXHeuristicNavigationUtilities_fetchLocationForLOI___block_invoke;
  v12 = &unk_1E82C56D0;
  v14 = &v15;
  v6 = v5;
  v13 = v6;
  objc_msgSend(v4, "fetchLOILocationOfType:reply:", a3, &v9);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v6, 2.0, v9, v10, v11, v12);
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __55__ATXHeuristicNavigationUtilities_fetchLocationForLOI___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    __atxlog_handle_modes();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __55__ATXHeuristicNavigationUtilities_fetchLocationForLOI___block_invoke_cold_1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);

    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = 0;

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

+ (id)destinationPlacemarkForLocation:(id)a3 withDestinationName:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "coordinate");
  v8 = v7;
  objc_msgSend(v6, "coordinate");
  v10 = v9;

  __atxlog_handle_context_heuristic();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 134283777;
    v16 = v8;
    v17 = 2049;
    v18 = v10;
    _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Geolocation from Structured location: (%{private}f), (%{private}f)", (uint8_t *)&v15, 0x16u);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v8, v10);
  objc_msgSend(MEMORY[0x1E0C9E3F0], "placemarkWithLocation:name:postalAddress:", v12, v5, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)schemaTypeToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("Unknown");
  else
    return off_1E82C56F0[a3];
}

+ (id)destinationPlacemarkForEvent:(id)a3 name:(id)a4 schemaType:(unint64_t)a5
{
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
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  dispatch_semaphore_t v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  uint64_t (*v42)(uint64_t, uint64_t);
  void *v43;
  void *v44;
  id v47;
  void *v48;
  _QWORD v49[4];
  NSObject *v50;
  _BYTE *v51;
  _BYTE buf[24];
  uint64_t (*v53)(uint64_t, uint64_t);
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v47 = a4;
  objc_msgSend(v7, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredLocationWithoutPrediction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (!v10)
    goto LABEL_4;
  objc_msgSend(v10, "geoLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12
    || (objc_msgSend(v11, "geoLocation"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(a1, "destinationPlacemarkForLocation:withDestinationName:", v13, v47),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v13,
        !v14))
  {
LABEL_4:
    if (a5 == 1)
    {
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("address"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      objc_opt_isKindOfClass();

      v29 = (void *)objc_opt_new();
      if (v29)
      {
        v30 = dispatch_semaphore_create(0);
        v31 = (void *)objc_opt_new();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v53 = __Block_byref_object_copy__17;
        *(_QWORD *)&v54 = __Block_byref_object_dispose__17;
        *((_QWORD *)&v54 + 1) = 0;
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __80__ATXHeuristicNavigationUtilities_destinationPlacemarkForEvent_name_schemaType___block_invoke;
        v49[3] = &unk_1E82C4BE8;
        v51 = buf;
        v32 = v30;
        v50 = v32;
        objc_msgSend(v31, "geocodeAddressString:completionHandler:", v29, v49);
        objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v32, 1.0);
        v33 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (v33)
        {
          objc_msgSend(v33, "location");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "destinationPlacemarkForLocation:withDestinationName:", v34, v47);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v14 = 0;
        }

        _Block_object_dispose(buf, 8);
      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      if (a5)
      {
LABEL_22:
        __atxlog_handle_context_heuristic();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(a1, "schemaTypeToString:", a5);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v44;
          _os_log_impl(&dword_1C99DF000, v18, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Destination placemark for %@ is empty. Cannot create suggestion", buf, 0xCu);

        }
LABEL_24:
        v14 = 0;
        goto LABEL_25;
      }
      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("departureAirport"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("geo"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("latitude"));
      v18 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v48, "objectForKeyedSubscript:", CFSTR("reservationFor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("departureAirport"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("geo"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("longitude"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18 || !v22)
      {
        __atxlog_handle_context_heuristic();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138478083;
          *(_QWORD *)&buf[4] = v18;
          *(_WORD *)&buf[12] = 2113;
          *(_QWORD *)&buf[14] = v22;
          _os_log_impl(&dword_1C99DF000, v35, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Missing latitude/longitude/destination information: %{private}@, %{private}@", buf, 0x16u);
        }

        goto LABEL_24;
      }
      -[NSObject doubleValue](v18, "doubleValue");
      v24 = v23;
      objc_msgSend(v22, "doubleValue");
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v24, v25);
      objc_msgSend(a1, "destinationPlacemarkForLocation:withDestinationName:", v26, v47);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (v14)
      goto LABEL_20;
    goto LABEL_22;
  }
LABEL_20:
  __atxlog_handle_context_heuristic();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(a1, "schemaTypeToString:", a5);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "location");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "coordinate");
    v39 = v38;
    objc_msgSend(v14, "location");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "coordinate");
    v42 = v41;
    objc_msgSend(v14, "name");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413059;
    *(_QWORD *)&buf[4] = v36;
    *(_WORD *)&buf[12] = 2049;
    *(_QWORD *)&buf[14] = v39;
    *(_WORD *)&buf[22] = 2049;
    v53 = v42;
    LOWORD(v54) = 2113;
    *(_QWORD *)((char *)&v54 + 2) = v43;
    _os_log_impl(&dword_1C99DF000, v18, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: For %@, geolocation information: (%{private}f), (%{private}f), (%{private}@)", buf, 0x2Au);

  }
LABEL_25:

  return v14;
}

void __80__ATXHeuristicNavigationUtilities_destinationPlacemarkForEvent_name_schemaType___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_context_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __80__ATXHeuristicNavigationUtilities_destinationPlacemarkForEvent_name_schemaType___block_invoke_cold_1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

  }
  objc_msgSend(v5, "firstObject");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (unint64_t)navigationTypeForString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("CYCLING")))
  {
    v4 = 2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)navigationSubtitleForType:(unint64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("DRIVING_NAVIGATION_DESTINATION_SUBTITLE");
      goto LABEL_7;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("WALKING_NAVIGATION_DESTINATION_SUBTITLE");
      goto LABEL_7;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("CYCLING_NAVIGATION_DESTINATION_SUBTITLE");
      goto LABEL_7;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("TRANSIT_NAVIGATION_DESTINATION_SUBTITLE");
LABEL_7:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E82C5A18, 0);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = CFSTR("Unknown");
      break;
  }
  return v6;
}

+ (id)locationFromEvent:(id)a3 schemaType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "destinationPlacemarkForEvent:name:schemaType:", v6, CFSTR("destination"), a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __atxlog_handle_context_heuristic();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v6, "eventIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138477827;
      v14 = v11;
      _os_log_impl(&dword_1C99DF000, v10, OS_LOG_TYPE_INFO, "Empty placemark for event %{private}@", (uint8_t *)&v13, 0xCu);

    }
    v9 = 0;
  }

  return v9;
}

+ (BOOL)isAtLocation:(id)a3 maxDistance:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  NSObject *v11;
  int v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[ATXHeuristicNavigationUtilities getCurrentLocation](ATXHeuristicNavigationUtilities, "getCurrentLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v6, "distanceFromLocation:", v5);
    v10 = v9;
    if (v9 <= (double)a4)
    {
      __atxlog_handle_context_heuristic();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134217984;
        v14 = v10 / 1000.0;
        _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: At location. Distance is %.2fkm", (uint8_t *)&v13, 0xCu);
      }

      v8 = 1;
    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

+ (BOOL)allowNavigationSuggestionForLocation:(id)a3 maxDistance:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;
  double v9;
  double v10;
  NSObject *v11;
  _BOOL4 v12;
  const char *v13;
  int v15;
  double v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[ATXHeuristicNavigationUtilities getCurrentLocation](ATXHeuristicNavigationUtilities, "getCurrentLocation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_msgSend(v6, "distanceFromLocation:", v5);
    v10 = v9;
    if (v9 <= 500.0)
    {
      __atxlog_handle_context_heuristic();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 134218240;
        v16 = v10;
        v17 = 2048;
        *(_QWORD *)&v18 = 500;
        v13 = "ATXHeuristicNavigationUtilities: Too close to the event (%.2fkm < %.2lukm)";
        goto LABEL_9;
      }
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10 <= (double)a4)
      {
        if (v12)
        {
          v15 = 134217984;
          v16 = v10 / 1000.0;
          _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Distance to destination is %.2fkm", (uint8_t *)&v15, 0xCu);
        }
        v8 = 1;
        goto LABEL_14;
      }
      if (v12)
      {
        v15 = 134218240;
        v16 = v10 / 1000.0;
        v17 = 2048;
        v18 = (double)(a4 / 0x3E8);
        v13 = "ATXHeuristicNavigationUtilities: Will not create navigation to destination since distance %fKM is beyond %fKM";
LABEL_9:
        _os_log_impl(&dword_1C99DF000, v11, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0x16u);
      }
    }
    v8 = 0;
LABEL_14:

  }
  return v8;
}

+ (id)placemarkForLOI:(int64_t)a3 name:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "fetchLocationForLOI:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_context_heuristic();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      v17 = 138477827;
      v18 = v6;
      _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Resolved (%{private}@) to destination", (uint8_t *)&v17, 0xCu);
    }

    objc_msgSend(v7, "coordinate");
    v11 = v10;
    objc_msgSend(v7, "coordinate");
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C9E3B8]), "initWithLatitude:longitude:", v11, v12);
    objc_msgSend(MEMORY[0x1E0C9E3F0], "placemarkWithLocation:name:postalAddress:", v8, v6, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __atxlog_handle_context_heuristic();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v13, "name");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138477827;
      v18 = v15;
      _os_log_impl(&dword_1C99DF000, v14, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Location Resolved for (%{private}@)", (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    if (v9)
    {
      v17 = 138412290;
      v18 = v6;
      _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Unable to resolve %@ to destination", (uint8_t *)&v17, 0xCu);
    }
    v13 = 0;
  }

  return v13;
}

+ (id)navigationSuggestionActionForLOI:(int64_t)a3 destinationName:(id)a4 schemaForEvent:(id)a5 withScore:(double)a6 transportType:(id)a7 predictionReason:(unint64_t)a8 validStartDate:(id)a9 validEndDate:(id)a10 heuristicDevice:(id)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v18 = a5;
  v19 = a7;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  objc_msgSend(a1, "placemarkForLOI:name:", a3, a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    LOBYTE(v26) = 0;
    +[ATXHeuristicNavigationUtilities navigationSuggestionActionForDestination:event:transportType:schemaForEvent:predictionReasons:heuristicDevice:score:shouldClearOnEngagement:validStartDate:validEndDate:](ATXHeuristicNavigationUtilities, "navigationSuggestionActionForDestination:event:transportType:schemaForEvent:predictionReasons:heuristicDevice:score:shouldClearOnEngagement:validStartDate:validEndDate:", v23, 0, v19, v18, a8, v22, a6, v26, v20, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }

  return v24;
}

+ (double)_travelTimeInSecondsWithEvent:(id)a3 destination:(id)a4 transportType:(id)a5 heuristicDevice:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  int v28;
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = a5;
  __atxlog_handle_context_heuristic();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "eventIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "name");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138412546;
    v29 = v14;
    v30 = 2112;
    v31 = v15;
    _os_log_impl(&dword_1C99DF000, v13, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Compute travel time for event Id %@ (or destination %@)", (uint8_t *)&v28, 0x16u);

  }
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "travelTimeToEvent:destination:transportType:heuristicDevice:", v9, v10, v12, v11);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v16, "resolvedTimeInformation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("estimatedTravelTime"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    __atxlog_handle_context_heuristic();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v19, "doubleValue");
      v28 = 134217984;
      v29 = v21;
      _os_log_impl(&dword_1C99DF000, v20, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Travel to destination time: %fs", (uint8_t *)&v28, 0xCu);
    }

    objc_msgSend(v19, "doubleValue");
    if (v22 == 0.0)
    {
      objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("estimatedTravelTime"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "doubleValue");
      if (v25 == 0.0)
      {
        v24 = -1.0;
        goto LABEL_12;
      }
      v19 = v23;
    }
    else
    {
      v23 = v19;
    }
    objc_msgSend(v19, "doubleValue");
    v24 = v26;
LABEL_12:

    goto LABEL_13;
  }
  v24 = -1.0;
LABEL_13:

  return v24;
}

+ (id)_titleWithTravelTimeInSeconds:(double)a3 destinationName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a4;
  v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setUnitsStyle:", 2);
  objc_msgSend(v6, "setAllowedUnits:", 96);
  objc_msgSend(v6, "stringFromTimeInterval:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("NAVIGATION_DESTINATION_TITLE"), &stru_1E82C5A18, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10, v7, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)navigationSuggestionActionForDestination:(id)a3 event:(id)a4 transportType:(id)a5 schemaForEvent:(id)a6 predictionReasons:(unint64_t)a7 heuristicDevice:(id)a8 score:(double)a9 shouldClearOnEngagement:(BOOL)a10 validStartDate:(id)a11 validEndDate:(id)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  unint64_t v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  double v35;
  double v36;
  NSObject *v37;
  _BOOL4 v38;
  uint64_t v39;
  ATXContextNavigationSuggestionProducer *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  uint8_t buf[4];
  double v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v54 = a6;
  v21 = a8;
  v22 = a11;
  v23 = a12;
  v52 = v20;
  v24 = +[ATXHeuristicNavigationUtilities navigationTypeForString:](ATXHeuristicNavigationUtilities, "navigationTypeForString:", v20);
  objc_msgSend(v18, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[ATXHeuristicNavigationUtilities navigationSubtitleForType:](ATXHeuristicNavigationUtilities, "navigationSubtitleForType:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v23;
  if (objc_msgSend(v25, "length"))
  {
    v50 = v19;
    v51 = v21;
    v27 = objc_alloc(MEMORY[0x1E0CB3588]);
    v28 = v22;
    if (!v22)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v49 = v26;
    v29 = a7;
    if (v23)
    {
      v30 = objc_msgSend(v27, "initWithStartDate:endDate:", v28, v23);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v27, "initWithStartDate:endDate:", v28, v32);

    }
    if (!v22)

    objc_msgSend(v51, "now");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = -[NSObject containsDate:](v30, "containsDate:", v33);

    v35 = 0.0;
    if (v34)
    {
      v19 = v50;
      objc_msgSend(a1, "_travelTimeInSecondsWithEvent:destination:transportType:heuristicDevice:", v50, v18, v52, v51);
      v35 = v36;
      if (v36 >= 180.0)
      {
        objc_msgSend(a1, "_titleWithTravelTimeInSeconds:destinationName:", v25, v36);
        v39 = objc_claimAutoreleasedReturnValue();

        v25 = (void *)v39;
      }
      else
      {
        v21 = v51;
        __atxlog_handle_context_heuristic();
        v37 = objc_claimAutoreleasedReturnValue();
        v38 = os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
        if (v35 != -1.0)
        {
          if (v38)
          {
            *(_DWORD *)buf = 134217984;
            v56 = v35;
            _os_log_impl(&dword_1C99DF000, v37, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Travel to destination time is below minimum [%f]. Navigation suggestion is skipped", buf, 0xCu);
          }
          v31 = 0;
          goto LABEL_29;
        }
        if (v38)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C99DF000, v37, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Travel to destination time returned -1. Navigation suggestion is included without ETA", buf, 2u);
        }

        v35 = -1.0;
      }
    }
    else
    {
      v19 = v50;
    }
    v40 = [ATXContextNavigationSuggestionProducer alloc];
    objc_msgSend(v18, "name");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[ATXContextNavigationSuggestionProducer initWithTitle:event:schemaForEvent:alternateDestinationTitle:](v40, "initWithTitle:event:schemaForEvent:alternateDestinationTitle:", v25, v19, v54, v41);

    v42 = v53;
    if ((v29 & 0x3000000000) != 0 && v35 > 1800.0)
    {
      objc_msgSend(v22, "dateByAddingTimeInterval:", v35);
      v43 = objc_claimAutoreleasedReturnValue();

      v42 = (id)v43;
    }
    v21 = v51;
    objc_msgSend(v18, "name");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject suggestionForNavigationToDestination:transportType:destinationName:subtitle:predictionReasons:score:shouldClearOnEngagement:validStartDate:validEndDate:](v37, "suggestionForNavigationToDestination:transportType:destinationName:subtitle:predictionReasons:score:shouldClearOnEngagement:validStartDate:validEndDate:", v18, v24, v44, v49, v29, a10, a9, v22, v42);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
    {
      +[ATXHeuristicFlightEventUtilities logSuggestion:description:](ATXHeuristicFlightEventUtilities, "logSuggestion:description:", v31, CFSTR("ATXHeuristicNavigationUtilities: Navigation to destination suggestion"));
      v45 = v31;
    }
    else
    {
      __atxlog_handle_context_heuristic();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v56 = *(double *)&v29;
        _os_log_impl(&dword_1C99DF000, v46, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Could not create navigation suggestion for prediction reason: %llu", buf, 0xCu);
      }

      v21 = v51;
    }

    v19 = v50;
LABEL_29:

    v26 = v49;
    goto LABEL_30;
  }
  __atxlog_handle_context_heuristic();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C99DF000, v30, OS_LOG_TYPE_DEFAULT, "ATXHeuristicNavigationUtilities: Travel to destination name is nil or empty. Navigation suggestion is skipped", buf, 2u);
  }
  v31 = 0;
LABEL_30:

  return v31;
}

+ (id)navigationSuggestionActionForEvent:(id)a3 schemaForEvent:(id)a4 transportType:(id)a5 predictionReasons:(unint64_t)a6 heuristicDevice:(id)a7 score:(double)a8 validStartDate:(id)a9 validEndDate:(id)a10
{
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  NSObject *v47;
  const char *v48;
  uint8_t *v49;
  void *v50;
  void *v51;
  uint64_t v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  __int16 v58;
  uint8_t buf[2];
  __int16 v60;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v55 = a7;
  v57 = a9;
  v56 = a10;
  objc_msgSend(v17, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (!v18)
  {
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("SGEventMetadataSchemaOrgKey"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v18 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("SGEventMetadataCategoryDescriptionKey"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("Lodging"));

  objc_msgSend(v17, "preferredLocationWithoutPrediction");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if ((a6 & 0x80000000) != 0)
  {
    v37 = v19;
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("departureAirport"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "objectForKeyedSubscript:", CFSTR("iataCode"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28 && v26)
    {
      objc_msgSend(v26, "title");
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v37;
      if (!v40)
        goto LABEL_23;
      objc_msgSend(v26, "title");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "componentsSeparatedByString:", CFSTR("\n"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v19 = v37;
    if (v28)
    {
      v33 = a1;
      v34 = v17;
      v35 = v28;
      v36 = 0;
      goto LABEL_30;
    }
LABEL_23:
    __atxlog_handle_context_heuristic();
    v47 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      goto LABEL_35;
    v60 = 0;
    v48 = "ATXHeuristicNavigationUtilities: For Upcoming flight, destination is empty";
    v49 = (uint8_t *)&v60;
    goto LABEL_27;
  }
  if (((a6 >> 33) & v24) == 1)
  {
    objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("reservationFor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("name"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v28 && v26)
    {
      objc_msgSend(v26, "title");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
        goto LABEL_25;
      objc_msgSend(v26, "title");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "componentsSeparatedByString:", CFSTR("\n"));
      v31 = v19;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "firstObject");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v31;
    }
    if (v28)
    {
      v33 = a1;
      v34 = v17;
      v35 = v28;
      v36 = 1;
      goto LABEL_30;
    }
LABEL_25:
    __atxlog_handle_context_heuristic();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v48 = "ATXHeuristicNavigationUtilities: For concluded flight, destination is empty";
      v49 = buf;
      goto LABEL_27;
    }
LABEL_35:
    v28 = 0;
    v51 = 0;
    v50 = v55;
    goto LABEL_36;
  }
  if ((a6 & 0x300000) == 0)
  {
    __atxlog_handle_context_heuristic();
    v47 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_FAULT))
      +[ATXHeuristicNavigationUtilities navigationSuggestionActionForEvent:schemaForEvent:transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:].cold.1(a6, v47);
    goto LABEL_35;
  }
  if (v25 && (objc_msgSend(v25, "title"), v43 = (void *)objc_claimAutoreleasedReturnValue(), v43, v43))
  {
    objc_msgSend(v26, "title");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR(",\n"));
    v44 = v19;
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "componentsSeparatedByCharactersInSet:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "firstObject");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v44;
    if (!v28)
    {
LABEL_21:
      __atxlog_handle_context_heuristic();
      v47 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
        goto LABEL_35;
      v58 = 0;
      v48 = "ATXHeuristicNavigationUtilities: For upcoming event, destination is empty";
      v49 = (uint8_t *)&v58;
LABEL_27:
      _os_log_impl(&dword_1C99DF000, v47, OS_LOG_TYPE_DEFAULT, v48, v49, 2u);
      goto LABEL_35;
    }
  }
  else
  {
    objc_msgSend(v17, "title");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v28)
      goto LABEL_21;
  }
  v33 = a1;
  v34 = v17;
  v35 = v28;
  v36 = 2;
LABEL_30:
  objc_msgSend(v33, "destinationPlacemarkForEvent:name:schemaType:", v34, v35, v36);
  v47 = objc_claimAutoreleasedReturnValue();
  if (v47)
  {
    v50 = v55;
    LOBYTE(v53) = 0;
    objc_msgSend(a1, "navigationSuggestionActionForDestination:event:transportType:schemaForEvent:predictionReasons:heuristicDevice:score:shouldClearOnEngagement:validStartDate:validEndDate:", v47, v17, v19, v18, a6, v55, a8, v53, v57, v56);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_36:

    goto LABEL_37;
  }
  v51 = 0;
  v50 = v55;
LABEL_37:

  return v51;
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

void __55__ATXHeuristicNavigationUtilities_fetchLocationForLOI___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a2, a3, "ATXHeuristicNavigationUtilities: Error encountered: No Routine Home LOIs: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __80__ATXHeuristicNavigationUtilities_destinationPlacemarkForEvent_name_schemaType___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_1C99DF000, a2, a3, "ATXHeuristicNavigationUtilities: Error while resolving location from schema. Error:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)navigationSuggestionActionForEvent:(uint64_t)a1 schemaForEvent:(NSObject *)a2 transportType:predictionReasons:heuristicDevice:score:validStartDate:validEndDate:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1C99DF000, a2, OS_LOG_TYPE_FAULT, "ATXHeuristicNavigationUtilities: Navigation called for an unsupported prediction %llu reason", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
