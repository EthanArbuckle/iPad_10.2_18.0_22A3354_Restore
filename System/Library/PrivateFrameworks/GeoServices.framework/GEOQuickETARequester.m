@implementation GEOQuickETARequester

- (GEOQuickETARequester)initWithRequest:(id)a3
{
  id v5;
  GEOQuickETARequester *v6;
  GEOQuickETARequester *v7;
  GEOQuickETARequester *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEOQuickETARequester;
  v6 = -[GEOQuickETARequester init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_request, a3);
    v8 = v7;
  }

  return v7;
}

- (void)_calculateSimpleETAFromAPI:(BOOL)a3 WithHandler:(id)a4
{
  -[GEOQuickETARequester _calculateSimpleETAFromAPI:includeSummary:WithHandler:](self, "_calculateSimpleETAFromAPI:includeSummary:WithHandler:", a3, 0, a4);
}

- (void)_calculateSimpleETAFromAPI:(BOOL)a3 includeSummary:(BOOL)a4 WithHandler:(id)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  GEOETARequest *v9;
  GEOETARequest *simpleETARequest;
  void *v11;
  GEOCommonOptions *v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  _QWORD v21[5];
  id v22;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = -[GEOETARequest initWithQuickETARequest:]([GEOETARequest alloc], "initWithQuickETARequest:", self->_request);
  simpleETARequest = self->_simpleETARequest;
  self->_simpleETARequest = v9;

  -[GEOETARequest setIsFromAPI:](self->_simpleETARequest, "setIsFromAPI:", v6);
  -[GEOQuickETARequest requestingAppIdentifier](self->_request, "requestingAppIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOETARequest setRequestingAppId:](self->_simpleETARequest, "setRequestingAppId:", v11);

  if (v5)
  {
    v12 = objc_alloc_init(GEOCommonOptions);
    -[GEOCommonOptions setIncludeSummaryForPredictedDestination:](v12, "setIncludeSummaryForPredictedDestination:", 1);
    -[GEOETARequest setCommonOptions:](self->_simpleETARequest, "setCommonOptions:", v12);

  }
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __78__GEOQuickETARequester__calculateSimpleETAFromAPI_includeSummary_WithHandler___block_invoke;
  v21[3] = &unk_1E1C15E00;
  v21[4] = self;
  v14 = v8;
  v22 = v14;
  v15 = (void *)MEMORY[0x18D765024](v21);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __78__GEOQuickETARequester__calculateSimpleETAFromAPI_includeSummary_WithHandler___block_invoke_2;
  v19[3] = &unk_1E1C00A28;
  v19[4] = self;
  v20 = v14;
  v16 = v14;
  v17 = (void *)MEMORY[0x18D765024](v19);
  +[GEOETARequester sharedRequester](GEOETARequester, "sharedRequester");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "startSimpleETARequest:auditToken:throttleToken:callbackQueue:finished:networkActivity:error:", self->_simpleETARequest, 0, 0, MEMORY[0x1E0C80D38], v15, 0, v17);

}

void __78__GEOQuickETARequester__calculateSimpleETAFromAPI_includeSummary_WithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  GEOQuickETAResponse *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  objc_msgSend(v8, "etaResultAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "status") || !v5)
  {
    v7 = *(_QWORD *)(a1 + 40);
    _errorForResponse(v8);
    v6 = (GEOQuickETAResponse *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, GEOQuickETAResponse *))(v7 + 16))(v7, 0, v6);
  }
  else
  {
    v6 = -[GEOQuickETAResponse initWithETAResult:fromRequest:]([GEOQuickETAResponse alloc], "initWithETAResult:fromRequest:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
    (*(void (**)(_QWORD, GEOQuickETAResponse *, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v6, 0);
  }

}

void __78__GEOQuickETARequester__calculateSimpleETAFromAPI_includeSummary_WithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = 0;

  if (objc_msgSend(v8, "code") != -2
    || (objc_msgSend(v8, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        GEOErrorDomain(),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)_calculateRoutingETAWithHandler:(id)a3
{
  -[GEOQuickETARequester _calculateRoutingETAWithSummary:handler:](self, "_calculateRoutingETAWithSummary:handler:", 0, a3);
}

- (void)_calculateRoutingETAWithSummary:(BOOL)a3 handler:(id)a4
{
  _BOOL4 v4;
  id v6;
  GEODirectionsRequestFeedback *v7;
  void *v8;
  GEODirectionsRequest *v9;
  GEODirectionsRequest *directionsETARequest;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  GEOCommonOptions *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *);
  void *v21;
  GEOQuickETARequester *v22;
  id v23;
  _QWORD v24[5];
  id v25;

  v4 = a3;
  v6 = a4;
  v7 = -[GEODirectionsRequestFeedback initWithPurpose:]([GEODirectionsRequestFeedback alloc], "initWithPurpose:", 3);
  -[GEOQuickETARequest requestingAppIdentifier](self->_request, "requestingAppIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEODirectionsRequestFeedback setRequestingAppId:](v7, "setRequestingAppId:", v8);

  v9 = -[GEODirectionsRequest initWithQuickETARequest:withFeedback:]([GEODirectionsRequest alloc], "initWithQuickETARequest:withFeedback:", self->_request, v7);
  directionsETARequest = self->_directionsETARequest;
  self->_directionsETARequest = v9;

  v11 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __64__GEOQuickETARequester__calculateRoutingETAWithSummary_handler___block_invoke;
  v24[3] = &unk_1E1C15DB0;
  v24[4] = self;
  v12 = v6;
  v25 = v12;
  v13 = (void *)MEMORY[0x18D765024](v24);
  v18 = v11;
  v19 = 3221225472;
  v20 = __64__GEOQuickETARequester__calculateRoutingETAWithSummary_handler___block_invoke_2;
  v21 = &unk_1E1C15DD8;
  v22 = self;
  v14 = v12;
  v23 = v14;
  v15 = (void *)MEMORY[0x18D765024](&v18);
  if (v4)
  {
    v16 = objc_alloc_init(GEOCommonOptions);
    -[GEOCommonOptions setIncludeSummaryForPredictedDestination:](v16, "setIncludeSummaryForPredictedDestination:", 1, v18, v19, v20, v21, v22);
    -[GEODirectionsRequest setCommonOptions:](self->_directionsETARequest, "setCommonOptions:", v16);

  }
  +[GEODirectionsRequester sharedRequester](GEODirectionsRequester, "sharedRequester", v18, v19, v20, v21, v22);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startRequest:callbackQueue:finished:networkActivity:error:", self->_directionsETARequest, MEMORY[0x1E0C80D38], v13, 0, v15);

}

void __64__GEOQuickETARequester__calculateRoutingETAWithSummary_handler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  GEOQuickETAResponse *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  if (v8)
  {
    v5 = -[GEOQuickETAResponse initWithDirectionsResponse:fromRequest:]([GEOQuickETAResponse alloc], "initWithDirectionsResponse:fromRequest:", v8, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
    GEOErrorDomain();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (GEOQuickETAResponse *)objc_msgSend(v6, "initWithDomain:code:userInfo:", v7, -8, 0);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __64__GEOQuickETARequester__calculateRoutingETAWithSummary_handler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  v8 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = 0;

  if (objc_msgSend(v8, "code") != -2
    || (objc_msgSend(v8, "domain"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        GEOErrorDomain(),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)calculateETAWithResponseHandler:(id)a3
{
  -[GEOQuickETARequester calculateETAFromAPI:includeSummary:WithResponseHandler:](self, "calculateETAFromAPI:includeSummary:WithResponseHandler:", 0, 1, a3);
}

- (void)calculateETAFromAPI:(BOOL)a3 WithResponseHandler:(id)a4
{
  -[GEOQuickETARequester calculateETAFromAPI:includeSummary:WithResponseHandler:](self, "calculateETAFromAPI:includeSummary:WithResponseHandler:", a3, 0, a4);
}

- (void)calculateETAFromAPI:(BOOL)a3 includeSummary:(BOOL)a4 WithResponseHandler:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if (v8)
  {
    v10 = v8;
    GEOGetURLWithSource(18, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && GEOConfigGetBOOL(GeoServicesConfig_ShouldUseSimpleETAService, (uint64_t)off_1EDF4CDD8))
      -[GEOQuickETARequester _calculateSimpleETAFromAPI:includeSummary:WithHandler:](self, "_calculateSimpleETAFromAPI:includeSummary:WithHandler:", v6, v5, v10);
    else
      -[GEOQuickETARequester _calculateRoutingETAWithSummary:handler:](self, "_calculateRoutingETAWithSummary:handler:", v5, v10);
    v8 = v10;
  }

}

- (void)cancel
{
  id v3;

  if (self->_simpleETARequest)
  {
    +[GEOETARequester sharedRequester](GEOETARequester, "sharedRequester");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelSimpleETARequest:", self->_simpleETARequest);
  }
  else
  {
    if (!self->_directionsETARequest)
      return;
    +[GEODirectionsRequester sharedRequester](GEODirectionsRequester, "sharedRequester");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", self->_directionsETARequest);
  }

}

+ (BOOL)requestTrafficAndETAFromWaypoint:(id)a3 toWaypoints:(id)a4 transportType:(int)a5 automobileOptions:(id)a6 handler:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  GEOCommonOptions *v16;
  __int128 v18;
  uint64_t v19;

  v8 = *(_QWORD *)&a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(GEOCommonOptions);
  -[GEOCommonOptions setIncludeSummaryForPredictedDestination:](v16, "setIncludeSummaryForPredictedDestination:", 1);
  v19 = 0;
  v18 = 0u;
  LOBYTE(v8) = objc_msgSend(a1, "requestETAFromOrigin:toDestinations:transportType:timepoint:includeDistance:commonOptions:automobileOptions:walkingOptions:transitOptions:cyclingOptions:auditToken:handler:callbackQueue:", v15, v14, v8, &v18, 0, v16, v13, 0, 0, 0, 0, v12, MEMORY[0x1E0C80D38]);

  return v8;
}

+ (BOOL)requestETAFromOrigin:(id)a3 toDestinations:(id)a4 transportType:(int)a5 timepoint:(GEOTimepoint *)a6 includeDistance:(BOOL)a7 commonOptions:(id)a8 automobileOptions:(id)a9 walkingOptions:(id)a10 transitOptions:(id)a11 cyclingOptions:(id)a12 auditToken:(id)a13 handler:(id)a14 callbackQueue:(id)a15
{
  uint64_t v16;
  id v18;
  char *v19;
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
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  GEOQuickETARequest *v37;
  void *v38;
  GEOQuickETARequest *v39;
  GEOETARequest *v40;
  NSObject *v41;
  id v42;
  void *v43;
  BOOL v44;
  NSObject *v45;
  id v46;
  void *v47;
  void *v48;
  const __CFString *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  void *v58;
  uint64_t v59;
  id v60;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  id v70;
  id v71;
  _BOOL4 v72;
  GEOQuickETARequest *v73;
  char *aSelectora;
  void *v77;
  id v78;
  id v79;
  _QWORD v80[4];
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  uint64_t v90;
  uint8_t v91[128];
  uint8_t buf[4];
  void *v93;
  uint64_t v94;

  v72 = a7;
  v16 = *(_QWORD *)&a5;
  v94 = *MEMORY[0x1E0C80C00];
  v79 = a3;
  v18 = a4;
  v19 = (char *)a8;
  v20 = a9;
  v21 = a10;
  v22 = a11;
  v78 = a12;
  v23 = a13;
  v24 = a14;
  v25 = a15;
  v26 = v25;
  v77 = v21;
  if (v24)
  {
    if (v25)
    {
      v27 = v79;
      if (v79)
      {
        if (objc_msgSend(v18, "count"))
        {
          v62 = v24;
          v64 = v26;
          aSelectora = v19;
          v71 = v20;
          if ((_DWORD)v16)
            v28 = 0;
          else
            v28 = v20;
          v29 = v18;
          v30 = v28;
          if ((_DWORD)v16 == 2)
            v31 = v21;
          else
            v31 = 0;
          v32 = v31;
          if ((_DWORD)v16 == 1)
            v33 = v22;
          else
            v33 = 0;
          v34 = v33;
          v35 = v78;
          if ((_DWORD)v16 != 3)
            v35 = 0;
          v36 = v35;
          v37 = [GEOQuickETARequest alloc];
          v67 = v29;
          objc_msgSend(v29, "firstObject");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = v36;
          v65 = v34;
          v66 = v32;
          v68 = v30;
          v39 = -[GEOQuickETARequest initWithSource:toDestination:departureDate:transportType:currentLocation:includeDistance:additionalTransportTypesRequested:automobileOptions:transitOptions:walkingOptions:cyclingOptions:](v37, "initWithSource:toDestination:departureDate:transportType:currentLocation:includeDistance:additionalTransportTypesRequested:automobileOptions:transitOptions:walkingOptions:cyclingOptions:", v79, v38, 0, v16, 0, v72, 0, v30, v34, v32, v36);

          v40 = -[GEOETARequest initWithQuickETARequest:]([GEOETARequest alloc], "initWithQuickETARequest:", v39);
          v69 = v23;
          v70 = v22;
          v73 = v39;
          if (v23)
            objc_msgSend(v23, "bundleId");
          else
            -[GEOQuickETARequest requestingAppIdentifier](v39, "requestingAppIdentifier");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v64;
          -[GEOETARequest setRequestingAppId:](v40, "setRequestingAppId:", v50);

          v89 = *(_OWORD *)&a6->_currentUserTime;
          v90 = *(_QWORD *)&a6->_type;
          -[GEOETARequest setTimepoint:](v40, "setTimepoint:", &v89);
          -[GEOETARequest setCommonOptions:](v40, "setCommonOptions:", aSelectora);
          -[GEOETARequest setIncludeRouteTrafficDetail:](v40, "setIncludeRouteTrafficDetail:", objc_msgSend(aSelectora, "includeSummaryForPredictedDestination"));
          v18 = v67;
          v51 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v67, "count"));
          v85 = 0u;
          v86 = 0u;
          v87 = 0u;
          v88 = 0u;
          v52 = v67;
          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
          v24 = v62;
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v86;
            do
            {
              for (i = 0; i != v54; ++i)
              {
                if (*(_QWORD *)v86 != v55)
                  objc_enumerationMutation(v52);
                objc_msgSend(*(id *)(*((_QWORD *)&v85 + 1) + 8 * i), "geoWaypointTyped");
                v57 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v51, "addObject:", v57);

              }
              v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v85, v91, 16);
            }
            while (v54);
          }

          -[GEOETARequest setDestinationWaypointTypeds:](v40, "setDestinationWaypointTypeds:", v51);
          +[GEOETARequester sharedRequester](GEOETARequester, "sharedRequester");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = MEMORY[0x1E0C809B0];
          v82[0] = MEMORY[0x1E0C809B0];
          v82[1] = 3221225472;
          v82[2] = __210__GEOQuickETARequester_requestETAFromOrigin_toDestinations_transportType_timepoint_includeDistance_commonOptions_automobileOptions_walkingOptions_transitOptions_cyclingOptions_auditToken_handler_callbackQueue___block_invoke;
          v82[3] = &unk_1E1C15E00;
          v83 = v51;
          v84 = v62;
          v80[0] = v59;
          v80[1] = 3221225472;
          v80[2] = __210__GEOQuickETARequester_requestETAFromOrigin_toDestinations_transportType_timepoint_includeDistance_commonOptions_automobileOptions_walkingOptions_transitOptions_cyclingOptions_auditToken_handler_callbackQueue___block_invoke_85;
          v80[3] = &unk_1E1C03638;
          v81 = v84;
          v60 = v51;
          v23 = v69;
          objc_msgSend(v58, "startSimpleETARequest:auditToken:throttleToken:callbackQueue:finished:networkActivity:error:", v40, v69, 0, v64, v82, 0, v80);

          v44 = 1;
          v27 = v79;
          v19 = aSelectora;
          v22 = v70;
          v20 = v71;
          goto LABEL_36;
        }
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v49 = CFSTR("Requires at least one destination");
      }
      else
      {
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v49 = CFSTR("Requires origin's waypoint");
      }
      objc_msgSend(v48, "GEOErrorWithCode:reason:", -12, v49);
      v45 = objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, NSObject *))v24 + 2))(v24, 0, v45);
    }
    else
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
      v45 = objc_claimAutoreleasedReturnValue();
      v27 = v79;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v46 = v22;
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v93 = v47;
        _os_log_impl(&dword_1885A9000, v45, OS_LOG_TYPE_ERROR, "%{public}@ requires a callbackQueue", buf, 0xCu);

        v22 = v46;
      }
    }

    v44 = 0;
    goto LABEL_36;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v42 = v22;
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v93 = v43;
    _os_log_impl(&dword_1885A9000, v41, OS_LOG_TYPE_ERROR, "%{public}@ requires a handler", buf, 0xCu);

    v22 = v42;
  }

  v44 = 0;
  v27 = v79;
LABEL_36:

  return v44;
}

void __210__GEOQuickETARequester_requestETAFromOrigin_toDestinations_transportType_timepoint_includeDistance_commonOptions_automobileOptions_walkingOptions_transitOptions_cyclingOptions_auditToken_handler_callbackQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __objc2_class **v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  __CFString *v37;
  __CFString *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  void *v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _errorForResponse(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v44 = a1;
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v5);
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v45 = v3;
    objc_msgSend(v3, "etaResults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
    if (!v8)
      goto LABEL_42;
    v9 = v8;
    v10 = *(_QWORD *)v53;
    v11 = off_1E1BEE000;
    v47 = v7;
    v48 = v6;
    v46 = *(_QWORD *)v53;
    while (1)
    {
      v12 = 0;
      v49 = v9;
      do
      {
        if (*(_QWORD *)v53 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v12);
        v14 = objc_alloc_init(v11[328]);
        if (v13 && (*(_WORD *)(v13 + 76) & 8) != 0 && -[GEOETAResult status](v13))
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v16 = v15;
            v17 = "A sub-result failed!";
            goto LABEL_21;
          }
          goto LABEL_22;
        }
        -[GEOETAResult sortedETAs]((id *)v13);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        if (v19 != 1)
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            v16 = v15;
            v17 = "There should be only one ETA";
LABEL_21:
            _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, v17, buf, 2u);
          }
LABEL_22:

          objc_msgSend(v14, "setIsSuccess:", 0);
          objc_msgSend(v14, "setSeconds:", 2.22507386e-308);
          objc_msgSend(v14, "setShortTrafficString:", 0);
          objc_msgSend(v14, "setLongTrafficString:", 0);
          objc_msgSend(v6, "addObject:", v14);
          goto LABEL_40;
        }
        -[GEOETAResult sortedETAs]((id *)v13);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "firstObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v21, "hasStatus") && objc_msgSend(v21, "status"))
        {
          GEOFindOrCreateLog("com.apple.GeoServices", "GEOQuickETARequester");
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v57 = v21;
            _os_log_impl(&dword_1885A9000, v22, OS_LOG_TYPE_ERROR, "An etaResultByType failed %@!", buf, 0xCu);
          }

          objc_msgSend(v14, "setIsSuccess:", 0);
          objc_msgSend(v14, "setSeconds:", 2.22507386e-308);
          objc_msgSend(v14, "setShortTrafficString:", 0);
          objc_msgSend(v14, "setLongTrafficString:", 0);
          objc_msgSend(v14, "setSeconds:", 0.0);
          objc_msgSend(v6, "addObject:", v14);
        }
        else
        {
          v51 = v21;
          -[GEOETAResult sortedETAs]((id *)v13);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "routeTrafficDetail");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "summaryForPredictedDestinations");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "formatStrings");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "lastObject");
          v29 = objc_claimAutoreleasedReturnValue();
          v30 = (void *)v29;
          if (v29)
            v31 = (__CFString *)v29;
          else
            v31 = &stru_1E1C241D0;
          v32 = v31;

          v50 = v26;
          objc_msgSend(v26, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "formatStrings");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "firstObject");
          v35 = objc_claimAutoreleasedReturnValue();
          v36 = (void *)v35;
          if (v35)
            v37 = (__CFString *)v35;
          else
            v37 = &stru_1E1C241D0;
          v38 = v37;

          objc_msgSend(v14, "setIsSuccess:", 1);
          objc_msgSend(v14, "setSeconds:", (double)objc_msgSend(v24, "travelTimeBestEstimate"));
          objc_msgSend(v14, "setAggressiveTravelTime:", (double)objc_msgSend(v24, "travelTimeAggressiveEstimate"));
          objc_msgSend(v14, "setConservativeTravelTime:", (double)objc_msgSend(v24, "travelTimeConservativeEstimate"));
          objc_msgSend(v14, "setShortTrafficString:", v32);
          objc_msgSend(v14, "setLongTrafficString:", v38);

          objc_msgSend(v25, "writtenRouteName");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          if (v39)
          {
            objc_msgSend(v14, "setWrittenRouteName:", v39);
          }
          else
          {
            objc_msgSend(v25, "unabbreviatedRouteName");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setWrittenRouteName:", v40);

          }
          objc_msgSend(v25, "spokenRouteName");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v46;
          if (v41)
          {
            objc_msgSend(v14, "setSpokenRouteName:", v41);
          }
          else
          {
            objc_msgSend(v25, "unabbreviatedRouteName");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            if (v42)
            {
              objc_msgSend(v14, "setSpokenRouteName:", v42);
            }
            else
            {
              objc_msgSend(v25, "writtenRouteName");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "setSpokenRouteName:", v43);

            }
          }

          v6 = v48;
          objc_msgSend(v48, "addObject:", v14);

          v7 = v47;
          v11 = off_1E1BEE000;
          v21 = v51;
        }

        v9 = v49;
LABEL_40:

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
      if (!v9)
      {
LABEL_42:

        (*(void (**)(void))(*(_QWORD *)(v44 + 40) + 16))();
        v4 = 0;
        v3 = v45;
        goto LABEL_43;
      }
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
LABEL_43:

}

uint64_t __210__GEOQuickETARequester_requestETAFromOrigin_toDestinations_transportType_timepoint_includeDistance_commonOptions_automobileOptions_walkingOptions_transitOptions_cyclingOptions_auditToken_handler_callbackQueue___block_invoke_85(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingFacility, 0);
  objc_storeStrong((id *)&self->_directionsETARequest, 0);
  objc_storeStrong((id *)&self->_simpleETARequest, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
