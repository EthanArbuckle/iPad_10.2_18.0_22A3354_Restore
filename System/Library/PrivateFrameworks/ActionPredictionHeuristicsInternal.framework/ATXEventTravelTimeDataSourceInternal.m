@implementation ATXEventTravelTimeDataSourceInternal

- (ATXEventTravelTimeDataSourceInternal)init
{
  ATXEventTravelTimeDataSourceInternal *v2;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _PASLock *hypothesizerCacheLock;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ATXEventTravelTimeDataSourceInternal;
  v2 = -[ATXEventTravelTimeDataSourceInternal init](&v9, sel_init);
  if (v2)
  {
    v3 = (_QWORD *)objc_opt_new();
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815C8]), "initWithCountLimit:", 5);
    v5 = (void *)v3[1];
    v3[1] = v4;

    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v3);
    hypothesizerCacheLock = v2->_hypothesizerCacheLock;
    v2->_hypothesizerCacheLock = (_PASLock *)v6;

  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken4 != -1)
    dispatch_once(&sharedInstance__pasOnceToken4, &__block_literal_global_3);
  return (id)sharedInstance__pasExprOnceResult_1;
}

void __54__ATXEventTravelTimeDataSourceInternal_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA46CBC]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_1;
  sharedInstance__pasExprOnceResult_1 = v1;

  objc_autoreleasePoolPop(v0);
}

- (void)travelTimeInfoForEventID:(id)a3 location:(id)a4 expectedArrivalDate:(id)a5 transportType:(id)a6 localOnlyAfterFirstUpdate:(BOOL)a7 heuristicDevice:(id)a8 callback:(id)a9
{
  id v15;
  id v16;
  id v17;
  void (**v18)(id, void *, _QWORD);
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  _PASLock *hypothesizerCacheLock;
  id v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  NSObject *v44;
  unint64_t v45;
  __CFString *v46;
  NSObject *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  _PASLock *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  _QWORD v62[4];
  NSObject *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  ATXEventTravelTimeDataSourceInternal *v70;
  uint64_t *v71;
  uint64_t *v72;
  BOOL v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  char v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v58 = a6;
  v60 = a8;
  v18 = (void (**)(id, void *, _QWORD))a9;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__7;
  v82 = __Block_byref_object_dispose__7;
  v83 = 0;
  objc_msgSend(v17, "dateByAddingTimeInterval:", 1200.0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v15;
  if (v15)
  {
    objc_msgSend(v60, "eventStore");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "eventWithIdentifier:", v59);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "structuredLocation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21
      && (objc_msgSend(v20, "structuredLocation"),
          v22 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v22, "geoLocation"),
          v23 = (void *)objc_claimAutoreleasedReturnValue(),
          v23,
          v22,
          v21,
          v23))
    {
      objc_msgSend(v20, "endDate");
      v24 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "structuredLocation");
      v25 = objc_claimAutoreleasedReturnValue();
      -[NSObject geoLocation](v25, "geoLocation");
      v26 = objc_claimAutoreleasedReturnValue();

      v61 = (void *)v24;
      v16 = (id)v26;
    }
    else
    {
      __atxlog_handle_heuristic();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:].cold.5();
    }

  }
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  if (v16)
  {
    v27 = objc_opt_new();
    v28 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v16, "coordinate");
    v30 = v29;
    objc_msgSend(v16, "coordinate");
    objc_msgSend(v28, "stringWithFormat:", CFSTR("%f,%f"), v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = *(void **)(v27 + 8);
    *(_QWORD *)(v27 + 8) = v32;

    objc_storeStrong((id *)(v27 + 16), a6);
    *(_BYTE *)(v27 + 24) = a7;
    hypothesizerCacheLock = self->_hypothesizerCacheLock;
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke;
    v64[3] = &unk_1E82C4B68;
    v71 = &v78;
    v35 = (id)v27;
    v65 = v35;
    v66 = v16;
    v67 = v17;
    v68 = v61;
    v73 = a7;
    v72 = &v74;
    v69 = v58;
    v70 = self;
    -[_PASLock runWithLockAcquired:](hypothesizerCacheLock, "runWithLockAcquired:", v64);

  }
  v36 = (void *)v79[5];
  if (!v36
    || (objc_msgSend(v36, "currentHypothesis"),
        v37 = (void *)objc_claimAutoreleasedReturnValue(),
        v37,
        !v37))
  {
    if (*((_BYTE *)v75 + 24))
    {
      __atxlog_handle_heuristic();
      v47 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
        -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:].cold.3();

      if (v16)
      {
        v48 = objc_opt_new();
        v49 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v16, "coordinate");
        v51 = v50;
        objc_msgSend(v16, "coordinate");
        objc_msgSend(v49, "stringWithFormat:", CFSTR("%f,%f"), v51, v52);
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = *(void **)(v48 + 8);
        *(_QWORD *)(v48 + 8) = v53;

        objc_storeStrong((id *)(v48 + 16), a6);
        *(_BYTE *)(v48 + 24) = a7;
        v55 = self->_hypothesizerCacheLock;
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_28;
        v62[3] = &unk_1E82C4B90;
        v44 = (id)v48;
        v63 = v44;
        -[_PASLock runWithLockAcquired:](v55, "runWithLockAcquired:", v62);

        v46 = 0;
        v40 = 0;
        v43 = 0.0;
        goto LABEL_27;
      }
      __atxlog_handle_heuristic();
      v44 = objc_claimAutoreleasedReturnValue();
      v43 = 0.0;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:].cold.2();
    }
    else
    {
      __atxlog_handle_heuristic();
      v44 = objc_claimAutoreleasedReturnValue();
      v43 = 0.0;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
        -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:].cold.1();
    }
    v46 = 0;
    v40 = 0;
    goto LABEL_27;
  }
  __atxlog_handle_heuristic();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    -[ATXEventTravelTimeDataSourceInternal travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:].cold.4();

  objc_msgSend((id)v79[5], "currentHypothesis");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "generationDate");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v79[5], "currentHypothesis");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "estimatedTravelTime");
  v43 = v42;

  objc_msgSend((id)v79[5], "currentHypothesis");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = -[NSObject travelState](v44, "travelState");
  if (v45 >= 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %lu)"), v45);
    v46 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v46 = off_1E82C4BB0[v45];
  }
LABEL_27:

  v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v40, CFSTR("generationDate"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setObject:forKeyedSubscript:", v57, CFSTR("estimatedTravelTime"));

  objc_msgSend(v56, "setObject:forKeyedSubscript:", v46, CFSTR("travelState"));
  v18[2](v18, v56, 0);

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  double v8;
  double v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[4];
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint8_t buf[4];
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3[1], "objectForKey:", *(_QWORD *)(a1 + 32));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40))
  {
    __atxlog_handle_heuristic();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_cold_2();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "coordinate");
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0D27360]), "initWithCoordinate:", v8, v9);
    -[NSObject setArrivalDate:](v7, "setArrivalDate:", *(_QWORD *)(a1 + 48));
    -[NSObject setExpirationDate:](v7, "setExpirationDate:", *(_QWORD *)(a1 + 56));
    v10 = *(id *)(a1 + 64);
    if ((objc_msgSend(v10, "isEqualToString:", CFSTR("AUTOMOBILE")) & 1) != 0)
    {
      v11 = 0;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("TRANSIT")) & 1) != 0)
    {
      v11 = 1;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("WALKING")) & 1) != 0)
    {
      v11 = 2;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("BICYCLE")) & 1) != 0)
    {
      v11 = 3;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("UNKNOWN_TRANSPORT_TYPE")) & 1) != 0)
    {
      v11 = 4;
    }
    else if ((objc_msgSend(v10, "isEqualToString:", CFSTR("FERRY")) & 1) != 0)
    {
      v11 = 5;
    }
    else if (objc_msgSend(v10, "isEqualToString:", CFSTR("RIDESHARE")))
    {
      v11 = 6;
    }
    else
    {
      v11 = 0;
    }

    -[NSObject setTransportType:](v7, "setTransportType:", v11);
    __atxlog_handle_heuristic();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 40), "coordinate");
      v14 = v13;
      objc_msgSend(*(id *)(a1 + 40), "coordinate");
      *(_DWORD *)buf = 134218240;
      v31 = v14;
      v32 = 2048;
      v33 = v15;
      _os_log_impl(&dword_1C99DF000, v12, OS_LOG_TYPE_INFO, "Begin Route Hypothesis to destination: (%f, %f)", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0D274C8], "hypothesizerForPlannedDestination:", v7);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v19 = *(_QWORD *)(a1 + 80);
    v20 = *(void **)(*(_QWORD *)(v19 + 8) + 40);
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_23;
    v24[3] = &unk_1E82C4B40;
    v29 = *(_BYTE *)(a1 + 96);
    v27 = v19;
    v21 = *(id *)(a1 + 40);
    v28 = *(_QWORD *)(a1 + 88);
    v22 = *(_QWORD *)(a1 + 72);
    v25 = v21;
    v26 = v22;
    objc_msgSend(v20, "startHypothesizingWithUpdateHandler:", v24);
    objc_msgSend(v3[1], "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(_QWORD *)(a1 + 32));
    __atxlog_handle_heuristic();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_cold_1();

  }
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_23(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "onlyPerformLocalUpdates");
  __atxlog_handle_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "coordinate");
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "coordinate");
    v12 = 134218240;
    v13 = v4;
    v14 = 2048;
    v15 = v5;
    _os_log_impl(&dword_1C99DF000, v2, OS_LOG_TYPE_INFO, "Route hypothesizer received update (%f, %f). Checking for validity.", (uint8_t *)&v12, 0x16u);
  }

  if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "state") == 2
    || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "state") == 3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    __atxlog_handle_heuristic();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "state");
      v12 = 134217984;
      v13 = v7;
      _os_log_impl(&dword_1C99DF000, v6, OS_LOG_TYPE_INFO, "Route hypothesizer has failed. Status: %lu. Note: This could be because user is too far from the desired destination.", (uint8_t *)&v12, 0xCu);
    }
  }
  else
  {
    __atxlog_handle_heuristic();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "coordinate");
      v10 = v9;
      objc_msgSend(*(id *)(a1 + 32), "coordinate");
      v12 = 134218240;
      v13 = v10;
      v14 = 2048;
      v15 = v11;
      _os_log_impl(&dword_1C99DF000, v8, OS_LOG_TYPE_INFO, "Hypothesis is valid (%f, %f). Posting ATXEventTravelTimeUpdated notification.", (uint8_t *)&v12, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = objc_claimAutoreleasedReturnValue();
    -[NSObject postNotificationName:object:](v6, "postNotificationName:object:", CFSTR("ATXTravelTimeUpdated"), *(_QWORD *)(a1 + 40));
  }

}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_28(uint64_t a1, uint64_t a2)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a2 + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 32));
  __atxlog_handle_heuristic();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_28_cold_1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hypothesizerCacheLock, 0);
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Event does not have a route hypothesis. Returning 0 for travel time, nil generationDate, and nil travel state.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.2()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_3();
  _os_log_error_impl(&dword_1C99DF000, v0, OS_LOG_TYPE_ERROR, "Failed to remove the failed RouteHypothesizer from the cache because location was nil.", v1, 2u);
  OUTLINED_FUNCTION_3_0();
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Route hypothesizer failed. Need to re-register it...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Event has a route hypothesis. Returning travel time information.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

- (void)travelTimeInfoForEventID:location:expectedArrivalDate:transportType:localOnlyAfterFirstUpdate:heuristicDevice:callback:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Attempted to create a new GEORouteHypothesizer for event with unspecified structured location or geolocation. Cannot provide travel time updates.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Created and started new GEORouteHypothesizer for event, and added GEORouteHypothesizer to the cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Pre-existing route hypothesizer found for event.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

void __159__ATXEventTravelTimeDataSourceInternal_travelTimeInfoForEventID_location_expectedArrivalDate_transportType_localOnlyAfterFirstUpdate_heuristicDevice_callback___block_invoke_28_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_0_6(&dword_1C99DF000, v0, v1, "Removed the failed RouteHypothesizer from the cache.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_0();
}

@end
