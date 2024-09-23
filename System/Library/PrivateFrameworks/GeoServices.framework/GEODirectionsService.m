@implementation GEODirectionsService

- (GEODirectionsService)init
{
  GEODirectionsService *v2;
  GEODirectionsRequester *v3;
  GEODirectionsRequester *directionsRequester;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GEODirectionsService;
  v2 = -[GEODirectionsService init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(GEODirectionsRequester);
    directionsRequester = v2->_directionsRequester;
    v2->_directionsRequester = v3;

  }
  return v2;
}

+ (GEODirectionsService)sharedService
{
  if (qword_1ECDBC698 != -1)
    dispatch_once(&qword_1ECDBC698, &__block_literal_global_157);
  return (GEODirectionsService *)(id)_MergedGlobals_294;
}

void __37__GEODirectionsService_sharedService__block_invoke()
{
  GEODirectionsService *v0;
  void *v1;

  v0 = objc_alloc_init(GEODirectionsService);
  v1 = (void *)_MergedGlobals_294;
  _MergedGlobals_294 = (uint64_t)v0;

}

+ (BOOL)canSpeakWrittenAddresses
{
  int BOOL;

  BOOL = GEOConfigGetBOOL(GeoServicesConfig_ShouldSpeakWrittenAddresses, (uint64_t)off_1EDF4D618);
  if (BOOL)
    LOBYTE(BOOL) = objc_msgSend(a1, "_canCurrentVoiceLanguageHandleWrittenText");
  return BOOL;
}

+ (BOOL)canSpeakWrittenPlaceNames
{
  int BOOL;

  BOOL = GEOConfigGetBOOL(GeoServicesConfig_ShouldSpeakWrittenPlaceNames, (uint64_t)off_1EDF4D628);
  if (BOOL)
    LOBYTE(BOOL) = objc_msgSend(a1, "_canCurrentVoiceLanguageHandleWrittenText");
  return BOOL;
}

+ (void)customRouteCreationSupportedForLocation:(id)a3 queue:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v7 = a3;
  v8 = a5;
  if (v8)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __78__GEODirectionsService_customRouteCreationSupportedForLocation_queue_handler___block_invoke;
    v9[3] = &unk_1E1C129E8;
    v10 = v7;
    v11 = v8;
    +[GEOGeographicMetadataRequester fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:](GEOGeographicMetadataRequester, "fetchPossibleTerritoriesForLocation:responseQueue:responseBlock:", v10, a4, v9);

  }
}

void __78__GEODirectionsService_customRouteCreationSupportedForLocation_queue_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint8_t v46[128];
  uint8_t buf[4];
  _BYTE v48[34];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  GEOGetDirectionsServiceLog_0();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 32), "latLng");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lat");
      v11 = v10;
      objc_msgSend(*(id *)(a1 + 32), "latLng");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lng");
      *(_DWORD *)buf = 134284035;
      *(_QWORD *)v48 = v11;
      *(_WORD *)&v48[8] = 2049;
      *(_QWORD *)&v48[10] = v13;
      *(_WORD *)&v48[18] = 2112;
      *(_QWORD *)&v48[20] = v6;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Error fetching territories for location %{private}f, %{private}f: %@", buf, 0x20u);

    }
LABEL_4:

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_29;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(v5, "count");
    objc_msgSend(*(id *)(a1 + 32), "latLng");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lat");
    v17 = v16;
    objc_msgSend(*(id *)(a1 + 32), "latLng");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "lng");
    v20 = v19;
    objc_msgSend(v5, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n\t"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109891;
    *(_DWORD *)v48 = v14;
    *(_WORD *)&v48[4] = 2049;
    *(_QWORD *)&v48[6] = v17;
    *(_WORD *)&v48[14] = 2049;
    *(_QWORD *)&v48[16] = v20;
    *(_WORD *)&v48[24] = 2112;
    *(_QWORD *)&v48[26] = v22;
    _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_DEFAULT, "Got %d territories for %{private}f, %{private}f:\n\t%@", buf, 0x26u);

  }
  if (!objc_msgSend(v5, "count"))
  {
    GEOGetDirectionsServiceLog_0();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "No territories found!", buf, 2u);
    }
    goto LABEL_4;
  }
  +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v24 = v5;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v42;
    while (2)
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v24);
        objc_msgSend(*(id *)(*((_QWORD *)&v41 + 1) + 8 * v28), "iso3166CountryCode2");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29 && (objc_msgSend(v23, "countryCode:supportsFeature:", v29, 8) & 1) != 0)
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

          goto LABEL_28;
        }

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      if (v26)
        continue;
      break;
    }
  }
  v30 = v24;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", objc_msgSend(v24, "count"));
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v31 = v30;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v38;
    do
    {
      v35 = 0;
      do
      {
        if (*(_QWORD *)v38 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v35), "iso3166CountryCode2", (_QWORD)v37);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
          objc_msgSend(v24, "addObject:", v36);

        ++v35;
      }
      while (v33 != v35);
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v33);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_28:

LABEL_29:
}

- (NSURL)directionsURL
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  GEOGetURLWithSource(2, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithURL:resolvingAgainstBaseURL:", v2, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    _getValue(GeoServicesConfig_ExperimentalDirectionsService, (uint64_t)off_1EDF4CDE8, 1, 0, 0, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
    {
      objc_msgSend(v2, "absoluteString");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copy");

      if (objc_msgSend(v4, "hasPrefix:", CFSTR("?")))
        v7 = CFSTR("%@");
      else
        v7 = CFSTR("?%@");
      objc_msgSend(v6, "stringByAppendingFormat:", v7, v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3998], "componentsWithString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "queryItems");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v11);

      objc_msgSend(v9, "queryItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v12);

      objc_msgSend(v3, "setQueryItems:", v10);
      objc_msgSend(v3, "URL");
      v13 = objc_claimAutoreleasedReturnValue();

      v2 = (id)v13;
    }
    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "experimentURLForURL:requestKind:", v2, 512);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v2 = v15;
  }
  return (NSURL *)v2;
}

- (id)requestDirections:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  GEODirectionsServiceRequest *v18;
  NSObject *v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *global_queue;
  GEODirectionsRequester *directionsRequester;
  id v28;
  GEODirectionsRequester *v29;
  GEODirectionsService *v30;
  id obj;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  GEODirectionsService *v37;
  id v38;
  id v39;
  objc_super buf;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  GEOGetDirectionsServiceLog_0();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    GEODirectionsServiceRequestTypeAsString(objc_msgSend(v6, "requestType"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf.receiver) = 138412290;
    *(id *)((char *)&buf.receiver + 4) = v9;

  }
  if (v6)
  {
    +[GEODirectionsServiceRequestBuilder builderForRequestType:](GEODirectionsServiceRequestBuilder, "builderForRequestType:", objc_msgSend(v6, "requestType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        LOWORD(buf.receiver) = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: builder != nil", (uint8_t *)&buf, 2u);
      }
      __break(1u);
    }
    v11 = v10;
    objc_msgSend(v10, "buildDirectionsRequestWithParameters:", v6);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = *(void **)(v12 + 24);
    else
      v14 = 0;
    v15 = v14;

    if (v15)
    {
      if (!v7)
      {
        v18 = 0;
LABEL_28:

        goto LABEL_29;
      }
      if (v13)
        v16 = *(void **)(v13 + 24);
      else
        v16 = 0;
      v17 = v16;
      (*((void (**)(id, _QWORD, _QWORD, _QWORD, id, _QWORD))v7 + 2))(v7, 0, 0, 0, v17, 0);
      v18 = 0;
    }
    else
    {
      if (v13)
      {
        v20 = *(id *)(v13 + 8);
        v21 = *(void **)(v13 + 16);
      }
      else
      {
        v20 = 0;
        v21 = 0;
      }
      v22 = v21;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __50__GEODirectionsService_requestDirections_handler___block_invoke;
      v34[3] = &unk_1E1C12A10;
      v23 = v22;
      v35 = v23;
      v36 = v6;
      v37 = self;
      v17 = v20;
      v38 = v17;
      v39 = v7;
      v24 = MEMORY[0x18D765024](v34);
      objc_msgSend(v23, "routeAttributes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v21;
      v33 = (void *)v24;
      if (v25)
      {
        global_queue = (void *)geo_get_global_queue();
        objc_msgSend(v25, "buildRouteAttributes:queue:result:", v17, global_queue, v24);

      }
      else
      {
        (*(void (**)(uint64_t, _QWORD, _QWORD))(v24 + 16))(v24, 0, 0);
      }
      v18 = [GEODirectionsServiceRequest alloc];
      directionsRequester = self->_directionsRequester;
      v28 = v23;
      v29 = directionsRequester;
      if (v18)
      {
        buf.receiver = v18;
        buf.super_class = (Class)GEODirectionsServiceRequest;
        v30 = -[GEODirectionsService init](&buf, sel_init);
        v18 = (GEODirectionsServiceRequest *)v30;
        if (v30)
        {
          objc_storeStrong((id *)&v30->_directionsRequester, obj);
          objc_storeStrong((id *)&v18->_directionsRequester, directionsRequester);
          v18->_isCancelled = 0;
        }
      }

    }
    goto LABEL_28;
  }
  GEOGetDirectionsServiceLog_0();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(buf.receiver) = 0;
    _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Error: GEODirectionsServiceRequestParameters is nil.", (uint8_t *)&buf, 2u);
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("GEODirectionsServiceRequestParameters is nil"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, _QWORD, void *, _QWORD))v7 + 2))(v7, 0, 0, 0, v11, 0);
    v18 = 0;
LABEL_29:

    goto LABEL_30;
  }
  v18 = 0;
LABEL_30:

  return v18;
}

void __50__GEODirectionsService_requestDirections_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  _BOOL8 v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "setRouteAttributes:", a2);
  objc_msgSend(*(id *)(a1 + 40), "requestCallback");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "requestCallback");
    v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v4[2](v4, *(_QWORD *)(a1 + 32));

  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "requestType") == 13;
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "traits");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "auditToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = 1;
  objc_msgSend(v6, "_submitDirectionsRequest:waypoints:traits:auditToken:useBackgroundURL:requestPriority:allowRetry:handler:", v8, v7, v11, v9, v5, objc_msgSend(*(id *)(a1 + 40), "requestPriority"), v10, *(_QWORD *)(a1 + 64));

}

- (id)requestRoutes:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __46__GEODirectionsService_requestRoutes_handler___block_invoke;
    v10[3] = &unk_1E1C12A38;
    v11 = v6;
    v12 = v7;
    -[GEODirectionsService requestDirections:handler:](self, "requestDirections:handler:", v11, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __46__GEODirectionsService_requestRoutes_handler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void **v23;
  void *v24;
  GEORouteInitializerData *v25;
  void *v26;
  GEORouteInitializerData *v27;
  void *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_msgSend(v11, "count");
  v17 = 0;
  if (v13 && v12 && v16 >= 2)
  {
    v18 = objc_msgSend(*(id *)(a1 + 32), "requestType");
    if (v18 == 3)
    {
      v19 = (void *)objc_opt_new();
      objc_msgSend(v19, "setWaypoints:", v11);
      objc_msgSend(v19, "setDirectionsRequest:", v12);
      objc_msgSend(v19, "setDirectionsResponse:", v13);
      objc_msgSend(*(id *)(a1 + 32), "currentRoute");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setSourceRoute:", v24);

      objc_msgSend(v19, "buildRoute");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v21;
      v22 = (void *)MEMORY[0x1E0C99D20];
      v23 = &v28;
    }
    else
    {
      if (v18 != 2)
      {
        v25 = [GEORouteInitializerData alloc];
        objc_msgSend(v12, "routeAttributes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = -[GEORouteInitializerData initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:](v25, "initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:", v11, v26, v13, v12);

        -[GEORouteInitializerData allRoutes](v27, "allRoutes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_10;
      }
      v19 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "anchorPoints");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setAnchorPoints:", v20);

      objc_msgSend(v19, "setWaypoints:", v11);
      objc_msgSend(v19, "setDirectionsRequest:", v12);
      objc_msgSend(v19, "setDirectionsResponse:", v13);
      objc_msgSend(v19, "buildRoute");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = v21;
      v22 = (void *)MEMORY[0x1E0C99D20];
      v23 = (void **)v29;
    }
    objc_msgSend(v22, "arrayWithObjects:count:", v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_submitDirectionsRequest:(id)a3 waypoints:(id)a4 traits:(id)a5 auditToken:(id)a6 useBackgroundURL:(BOOL)a7 requestPriority:(int64_t)a8 allowRetry:(BOOL)a9 handler:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  GEODirectionsRequester *directionsRequester;
  void *v32;
  _BOOL4 v33;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  int64_t v41;
  BOOL v42;
  BOOL v43;
  _QWORD v44[4];
  id v45;
  id v46;
  id v47;
  uint64_t v48;

  v33 = a7;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a10;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v19 = MEMORY[0x1E0C809B0];
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke;
  v44[3] = &unk_1E1C12A60;
  v48 = v20;
  v21 = v14;
  v45 = v21;
  v22 = v18;
  v47 = v22;
  v23 = v15;
  v46 = v23;
  v24 = (void *)MEMORY[0x18D765024](v44);
  v35[0] = v19;
  v35[1] = 3221225472;
  v35[2] = __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke_219;
  v35[3] = &unk_1E1C12AB0;
  v42 = a9;
  v35[4] = self;
  v36 = v21;
  v37 = v23;
  v38 = v16;
  v43 = v33;
  v40 = v22;
  v41 = a8;
  v39 = v17;
  v25 = v22;
  v26 = v17;
  v27 = v16;
  v28 = v23;
  v29 = v21;
  v30 = (void *)MEMORY[0x18D765024](v35);
  directionsRequester = self->_directionsRequester;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a8);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODirectionsRequester startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:](directionsRequester, "startRequest:traits:auditToken:skipFinalize:useBackgroundURL:requestPriority:callbackQueue:finished:networkActivity:error:", v29, v27, v26, 0, v33, v32, MEMORY[0x1E0C80D38], v24, 0, v30);

}

void __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v5 = v4;
  v6 = *(double *)(a1 + 56);
  GEOGetDirectionsServiceLog_0();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v10 = 134218496;
    v11 = v3;
    v12 = 2048;
    v13 = v8;
    v14 = 2048;
    v15 = v5 - v6;
    _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_DEFAULT, "Received directions response %p for directions request %p. Response time: %f seconds", (uint8_t *)&v10, 0x20u);
  }

  v9 = *(_QWORD *)(a1 + 48);
  if (v9)
    (*(void (**)(uint64_t, _QWORD, _QWORD, id, _QWORD, _QWORD))(v9 + 16))(v9, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), v3, 0, 0);

}

void __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke_219(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *global_queue;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  char v29;

  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 88)
    && (objc_msgSend(*(id *)(a1 + 32), "_retryFailedDirectionsRequest:error:directionsError:", *(_QWORD *)(a1 + 40), v5, v6), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke_2;
    v20[3] = &unk_1E1C12A88;
    v9 = *(id *)(a1 + 40);
    v10 = *(_QWORD *)(a1 + 32);
    v21 = v9;
    v22 = v10;
    v23 = v8;
    v24 = *(id *)(a1 + 48);
    v25 = *(id *)(a1 + 56);
    v11 = *(id *)(a1 + 64);
    v29 = *(_BYTE *)(a1 + 89);
    v13 = *(void **)(a1 + 72);
    v12 = *(_QWORD *)(a1 + 80);
    v26 = v11;
    v28 = v12;
    v27 = v13;
    v14 = v8;
    v15 = (void *)MEMORY[0x18D765024](v20);
    objc_msgSend(*(id *)(a1 + 40), "routeAttributes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1 + 48);
    global_queue = (void *)geo_get_global_queue();
    objc_msgSend(v16, "buildRouteAttributes:queue:result:", v17, global_queue, v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_logDirectionsErrorForRequest:error:directionsError:", *(_QWORD *)(a1 + 40), v5, v6);
    v19 = *(_QWORD *)(a1 + 72);
    if (v19)
      (*(void (**)(uint64_t, _QWORD, _QWORD, _QWORD, id, id))(v19 + 16))(v19, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40), 0, v5, v6);
  }

}

uint64_t __129__GEODirectionsService__submitDirectionsRequest_waypoints_traits_auditToken_useBackgroundURL_requestPriority_allowRetry_handler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "setRouteAttributes:", a2);
  LOBYTE(v4) = 0;
  return objc_msgSend(*(id *)(a1 + 40), "_submitDirectionsRequest:waypoints:traits:auditToken:useBackgroundURL:requestPriority:allowRetry:handler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(unsigned __int8 *)(a1 + 96), *(_QWORD *)(a1 + 88), v4, *(_QWORD *)(a1 + 80));
}

- (id)_retryFailedDirectionsRequest:(id)a3 error:(id)a4 directionsError:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "originalWaypointRoute");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "purpose");

  if (v11 == 9)
  {
    GEOGetDirectionsServiceLog_0();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412290;
      v20 = v8;
      _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Offline to online upgrade failed with 'OFFLINE_TO_ONLINE_NAV_TRANSITION'. Retrying with 'OFFLINE_TO_ONLINE_NEW_ROUTE'. Error: %@", (uint8_t *)&v19, 0xCu);
    }

    v13 = (id)objc_msgSend(v7, "copy");
    objc_msgSend(v13, "originalWaypointRoute");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPurpose:", 10);

  }
  else if (v8
         && (objc_msgSend(v7, "routeAttributes"),
             v15 = (void *)objc_claimAutoreleasedReturnValue(),
             v16 = objc_msgSend(v15, "shouldRetryForError:", v8),
             v15,
             v16))
  {
    GEOGetDirectionsServiceLog_0();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = 138412546;
      v20 = v8;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Directions request failed with error and retrying: %@ | %@", (uint8_t *)&v19, 0x16u);
    }

    v13 = v7;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)_logDirectionsErrorForRequest:(id)a3 error:(id)a4 directionsError:(id)a5
{
  id v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  NSObject *v26;
  __int16 v27;
  id v28;
  __int16 v29;
  NSObject *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  -[NSObject domain](v8, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  GEOErrorDomain();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if (!v12)
    goto LABEL_10;
  objc_msgSend(v7, "originalWaypointRoute");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v7, "originalWaypointRoute");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "purpose");

    if (v16 == 12)
    {
      objc_msgSend(v7, "data");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "base64EncodedStringWithOptions:", 0);
      v18 = objc_claimAutoreleasedReturnValue();

      GEOGetDirectionsServiceLog_0();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        GEOStringForError(-[NSObject code](v8, "code"));
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = 138413314;
        v22 = v20;
        v23 = 1024;
        v24 = -[NSObject code](v8, "code");
        v25 = 2112;
        v26 = v8;
        v27 = 2112;
        v28 = v9;
        v29 = 2112;
        v30 = v18;
        _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Directions request failed with error (%@: %d) and not retrying:\n%@\n\n%@\n\nBase64:\n%@", (uint8_t *)&v21, 0x30u);

      }
      goto LABEL_9;
    }
  }
  if (v9)
  {
    GEOGetDirectionsServiceLog_0();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      GEOStringForError(-[NSObject code](v8, "code"));
      v19 = objc_claimAutoreleasedReturnValue();
      v21 = 138413058;
      v22 = v19;
      v23 = 1024;
      v24 = -[NSObject code](v8, "code");
      v25 = 2112;
      v26 = v8;
      v27 = 2112;
      v28 = v9;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "Directions request failed with error (%@: %d) and not retrying:\n%@\n\n%@", (uint8_t *)&v21, 0x26u);
LABEL_9:

    }
  }
  else
  {
LABEL_10:
    GEOGetDirectionsServiceLog_0();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v21 = 138412290;
      v22 = v8;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, "Directions request failed with error and not retrying: %@", (uint8_t *)&v21, 0xCu);
    }
  }

}

+ (BOOL)_canCurrentVoiceLanguageHandleWrittenText
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsRequester, 0);
}

@end
