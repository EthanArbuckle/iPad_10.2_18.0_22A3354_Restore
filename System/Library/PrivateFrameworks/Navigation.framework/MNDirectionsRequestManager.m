@implementation MNDirectionsRequestManager

- (MNDirectionsRequestManager)init
{
  MNDirectionsRequestManager *v2;
  GEODirectionsService *v3;
  GEODirectionsService *directionsService;
  NSMutableDictionary *v5;
  NSMutableDictionary *pendingRequests;
  uint64_t v7;
  geo_isolater *pendingRequestsIsolater;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MNDirectionsRequestManager;
  v2 = -[MNDirectionsRequestManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (GEODirectionsService *)objc_alloc_init(MEMORY[0x1E0D27048]);
    directionsService = v2->_directionsService;
    v2->_directionsService = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingRequests = v2->_pendingRequests;
    v2->_pendingRequests = v5;

    v7 = geo_isolater_create();
    pendingRequestsIsolater = v2->_pendingRequestsIsolater;
    v2->_pendingRequestsIsolater = (geo_isolater *)v7;

  }
  return v2;
}

- (void)requestDirections:(id)a3 withIdentifier:(id)a4 auditToken:(id)a5 finishedHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject **v21;
  id *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  _QWORD v26[4];
  NSObject *v27;
  _QWORD v28[2];
  _QWORD v29[4];
  NSObject *v30;
  _QWORD v31[2];
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  NSObject *v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    MNGetMNDirectionsRequestLog();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_generate(v14);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RequestDirections", ", buf, 2u);
    }

    objc_msgSend(v10, "tracePath");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v10, "tracePath");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "directionsRequestFeedback");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __90__MNDirectionsRequestManager_requestDirections_withIdentifier_auditToken_finishedHandler___block_invoke;
      v29[3] = &unk_1E61D3710;
      v21 = &v30;
      v30 = v17;
      v31[1] = v15;
      v22 = (id *)v31;
      v31[0] = v13;
      v23 = v17;
      -[MNDirectionsRequestManager _requestDirectionsFromTraceWithPath:feedback:auditToken:finishedHandler:](self, "_requestDirectionsFromTraceWithPath:feedback:auditToken:finishedHandler:", v19, v20, v12, v29);

    }
    else
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __90__MNDirectionsRequestManager_requestDirections_withIdentifier_auditToken_finishedHandler___block_invoke_19;
      v26[3] = &unk_1E61D3710;
      v21 = &v27;
      v27 = v17;
      v28[1] = v15;
      v22 = (id *)v28;
      v28[0] = v13;
      v25 = v17;
      -[MNDirectionsRequestManager _requestServerDirections:preferredRoute:withIdentifier:auditToken:finishedHandler:](self, "_requestServerDirections:preferredRoute:withIdentifier:auditToken:finishedHandler:", v10, 0, v11, v12, v26);
    }

    v24 = *v21;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("finishedHandler must be passed to requestDirections otherwise response will be unavailable."));
    v17 = objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v33 = "-[MNDirectionsRequestManager requestDirections:withIdentifier:auditToken:finishedHandler:]";
      v34 = 2080;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
      v36 = 1024;
      v37 = 62;
      v38 = 2080;
      v39 = "NO";
      v40 = 2112;
      v41 = v17;
      _os_log_impl(&dword_1B0AD7000, v24, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }
  }

}

void __90__MNDirectionsRequestManager_requestDirections_withIdentifier_auditToken_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "RequestDirections", ", v8, 2u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

void __90__MNDirectionsRequestManager_requestDirections_withIdentifier_auditToken_finishedHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  os_signpost_id_t v6;
  uint64_t v7;
  uint8_t v8[16];

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v5, OS_SIGNPOST_INTERVAL_END, v6, "RequestDirections", ", v8, 2u);
  }

  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, id))(v7 + 16))(v7, v3);

}

- (void)cancelDirectionsRequestWithIdentifier:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__8;
  v8 = __Block_byref_object_dispose__8;
  v9 = 0;
  v3 = a3;
  geo_isolate_sync();
  objc_msgSend((id)v5[5], "cancel");

  _Block_object_dispose(&v4, 8);
}

uint64_t __68__MNDirectionsRequestManager_cancelDirectionsRequestWithIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 8), "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1[4] + 8), "removeObjectForKey:", a1[5]);
}

- (void)_requestServerDirections:(id)a3 preferredRoute:(id)a4 withIdentifier:(id)a5 auditToken:(id)a6 finishedHandler:(id)a7
{
  id v12;
  id v13;
  void (**v14)(id, _QWORD);
  MNRouteAttributes *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  _BOOL4 IsNilOrZero;
  void *v21;
  uint64_t v22;
  MNRouteAttributes *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  NSObject *v29;
  MNRouteAttributes *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  GEODirectionsService *directionsService;
  id v47;
  void *v48;
  NSObject *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  MNDirectionsRequestManager *v56;
  id v57;
  id v58;
  void (**v59)(id, _QWORD);
  _BYTE *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  id v67;
  __int16 v68;
  __CFString *v69;
  const __CFString *v70;
  id v71;
  _QWORD v72[2];
  _QWORD v73[2];
  uint8_t v74[128];
  _BYTE v75[24];
  __int128 v76;
  MNDirectionsResponseInfo *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v51 = a5;
  v50 = a6;
  v14 = (void (**)(id, _QWORD))a7;
  if (!v14)
  {
    GEOFindOrCreateLog();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v75 = 136315906;
      *(_QWORD *)&v75[4] = "-[MNDirectionsRequestManager _requestServerDirections:preferredRoute:withIdentifier:auditToke"
                           "n:finishedHandler:]";
      *(_WORD *)&v75[12] = 2080;
      *(_QWORD *)&v75[14] = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
      *(_WORD *)&v75[22] = 1024;
      LODWORD(v76) = 103;
      WORD2(v76) = 2080;
      *(_QWORD *)((char *)&v76 + 6) = "finishedHandler != nil";
      _os_log_impl(&dword_1B0AD7000, v49, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", v75, 0x26u);
    }

  }
  *(_QWORD *)v75 = 0;
  *(_QWORD *)&v75[8] = v75;
  *(_QWORD *)&v75[16] = 0x3032000000;
  *(_QWORD *)&v76 = __Block_byref_object_copy__8;
  *((_QWORD *)&v76 + 1) = __Block_byref_object_dispose__8;
  v77 = objc_alloc_init(MNDirectionsResponseInfo);
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  objc_msgSend(v12, "waypoints");
  v15 = (MNRouteAttributes *)objc_claimAutoreleasedReturnValue();
  v16 = -[MNRouteAttributes countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v63;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v63 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * i), "latLng");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        IsNilOrZero = _navigation_GEOLatLngIsNilOrZero(v19);

        if (IsNilOrZero)
        {
          v72[0] = CFSTR("MNDirectionsRequestDetails");
          v26 = v12;
          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v72[1] = *MEMORY[0x1E0CB2D68];
          v73[0] = v26;
          v73[1] = CFSTR("Waypoint in request is nil or invalid");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v73, v72, 2);
          v27 = (id)objc_claimAutoreleasedReturnValue();
          if (!v12)

          objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:userInfo:", 3, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          GEOFindOrCreateLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v67 = v28;
            _os_log_impl(&dword_1B0AD7000, v29, OS_LOG_TYPE_ERROR, "Error in fetching directions %@", buf, 0xCu);
          }

          objc_msgSend(*(id *)(*(_QWORD *)&v75[8] + 40), "setError:", v28);
          v14[2](v14, *(_QWORD *)(*(_QWORD *)&v75[8] + 40));
          goto LABEL_36;
        }
      }
      v16 = -[MNRouteAttributes countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
      if (v16)
        continue;
      break;
    }
  }

  objc_msgSend(v12, "routeAttributes");
  v15 = (MNRouteAttributes *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "routeAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "mainTransportType");

  if ((v22 - 1) >= 3)
  {
    if ((_DWORD)v22)
    {
      v70 = CFSTR("MNDirectionsRequestDetails");
      v71 = v12;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1);
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:userInfo:", 4, v27);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)&v75[8] + 40), "setError:", v28);
      v14[2](v14, *(_QWORD *)(*(_QWORD *)&v75[8] + 40));
      goto LABEL_36;
    }
    v30 = [MNRouteAttributes alloc];
    objc_msgSend(v12, "waypoints");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = -[MNRouteAttributes initWithAttributes:waypoints:](v30, "initWithAttributes:waypoints:", v15, v31);

    if (GEOConfigGetBOOL())
      -[MNRouteAttributes addInitialPromptType:](v23, "addInitialPromptType:", 1);
  }
  else
  {
    v23 = v15;
  }
  v24 = objc_alloc_init(MEMORY[0x1E0D27050]);
  v25 = v24;
  if (v13)
  {
    objc_msgSend(v24, "setRequestType:", 14);
    objc_msgSend(v25, "setCurrentRoute:", v13);
  }
  else
  {
    objc_msgSend(v12, "resumeRouteHandle");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32 && (v33 = objc_msgSend(v12, "isResumingMultipointRoute"), v32, (v33 & 1) != 0))
    {
      objc_msgSend(v25, "setRequestType:", 12);
      objc_msgSend(v12, "resumeRouteHandle");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setHasVisitedFirstStop:", objc_msgSend(v34, "hasVisitedFirstStop"));

    }
    else
    {
      objc_msgSend(v25, "setRequestType:", 1);
    }
    objc_msgSend(v12, "waypoints");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setWaypoints:", v35);

  }
  objc_msgSend(v12, "resumeRouteHandle");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setResumeRouteHandle:", v36);

  objc_msgSend(v25, "setTransportType:", v22);
  objc_msgSend(v25, "setRouteAttributes:", v23);
  objc_msgSend(v12, "traits");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTraits:", v37);

  objc_msgSend(v12, "commonOptions");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCommonOptions:", v38);

  objc_msgSend(v25, "setMaxRouteCount:", objc_msgSend(v12, "maxRouteCount"));
  objc_msgSend(v12, "currentUserLocation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCurrentLocation:", v39);

  objc_msgSend(v12, "currentMapRegion");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setVisibleRegion:", v40);

  objc_msgSend(v12, "directionsRequestFeedback");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setFeedback:", v41);

  objc_msgSend(v25, "setAuditToken:", v50);
  GEOFindOrCreateLog();
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    if (v22 >= 4)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v22);
      v43 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v43 = off_1E61D37A8[(int)v22];
    }
    *(_DWORD *)buf = 138412547;
    v67 = v51;
    v68 = 2113;
    v69 = v43;
    _os_log_impl(&dword_1B0AD7000, v42, OS_LOG_TYPE_INFO, "Requesting directions from server. identifier: %@ | transportType: %{private}@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v45 = v44;
  directionsService = self->_directionsService;
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __112__MNDirectionsRequestManager__requestServerDirections_preferredRoute_withIdentifier_auditToken_finishedHandler___block_invoke;
  v54[3] = &unk_1E61D3760;
  v47 = v51;
  v55 = v47;
  v56 = self;
  v57 = v12;
  v61 = v45;
  v27 = v25;
  v58 = v27;
  v60 = v75;
  v59 = v14;
  -[GEODirectionsService requestDirections:handler:](directionsService, "requestDirections:handler:", v27, v54);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v47;
  v53 = v48;
  geo_isolate_sync();

  v28 = v55;
  v15 = v23;
LABEL_36:

  _Block_object_dispose(v75, 8);
}

void __112__MNDirectionsRequestManager__requestServerDirections_preferredRoute_withIdentifier_auditToken_finishedHandler___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11;
  id v12;
  char *v13;
  const char *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  NSObject *v19;
  const char *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  MNTraceRecordingData *v27;
  void *v28;
  MNLocation *v29;
  void *v30;
  MNLocation *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v36;
  uint64_t Integer;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  uint64_t v42;
  void *v43;
  void *v44;
  char *v45;
  MNNavigationTraceManager *v46;
  const char *v47;
  id v48;
  id v49;
  _QWORD v50[2];
  _QWORD v51[2];
  uint8_t buf[4];
  const char *v53;
  __int16 v54;
  const char *v55;
  __int16 v56;
  int v57;
  __int16 v58;
  const char *v59;
  __int16 v60;
  void *v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void *)MEMORY[0x1E0C99D68];
  v16 = a2;
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v18 = v17;
  GEOFindOrCreateLog();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = *(const char **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v53 = v20;
    _os_log_impl(&dword_1B0AD7000, v19, OS_LOG_TYPE_INFO, "Received directions response from server. identifier: %@", buf, 0xCu);
  }

  if (v13)
  {
    GEOFindOrCreateLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v13;
      _os_log_impl(&dword_1B0AD7000, v21, OS_LOG_TYPE_ERROR, "Received error from directions request: %@", buf, 0xCu);
    }

  }
  if (v14)
  {
    GEOFindOrCreateLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v53 = v14;
      _os_log_impl(&dword_1B0AD7000, v22, OS_LOG_TYPE_ERROR, "Received directionsError from directions request: %@", buf, 0xCu);
    }

  }
  v49 = *(id *)(a1 + 32);
  geo_isolate_sync();
  v23 = objc_alloc(MEMORY[0x1E0D274D8]);
  objc_msgSend(*(id *)(a1 + 48), "routeAttributes");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:", v16, v24, v12, v11);

  objc_msgSend(v25, "allRouteInfos");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_logRoutes:error:", v26, v13);
  if (GEOConfigGetBOOL())
  {
    v27 = objc_alloc_init(MNTraceRecordingData);
    objc_msgSend(*(id *)(a1 + 48), "waypoints");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNTraceRecordingData setWaypoints:](v27, "setWaypoints:", v28);

    -[MNTraceRecordingData setInitialDirectionsRequest:](v27, "setInitialDirectionsRequest:", v11);
    -[MNTraceRecordingData setInitialDirectionsResponse:](v27, "setInitialDirectionsResponse:", v12);
    -[MNTraceRecordingData setInitialDirectionsRequestError:](v27, "setInitialDirectionsRequestError:", v13);
    -[MNTraceRecordingData setInitialDirectionsRequestTimestamp:](v27, "setInitialDirectionsRequestTimestamp:", *(double *)(a1 + 80));
    -[MNTraceRecordingData setInitialDirectionsResponseTimestamp:](v27, "setInitialDirectionsResponseTimestamp:", v18);
    v29 = [MNLocation alloc];
    objc_msgSend(*(id *)(a1 + 48), "currentUserLocation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[CLLocation initWithGeoLocation:](v29, "initWithGeoLocation:", v30);

    -[MNTraceRecordingData setInitialUserLocation:](v27, "setInitialUserLocation:", v31);
  }
  else
  {
    v27 = 0;
  }
  v32 = objc_msgSend(v26, "count");
  if (!v13 && !v32)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Server response returned no response and no errors."));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    GEOFindOrCreateLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v53 = "-[MNDirectionsRequestManager _requestServerDirections:preferredRoute:withIdentifier:auditToken:finishedHandl"
            "er:]_block_invoke_2";
      v54 = 2080;
      v55 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
      v56 = 1024;
      v57 = 206;
      v58 = 2080;
      v59 = "NO";
      v60 = 2112;
      v61 = v33;
      _os_log_impl(&dword_1B0AD7000, v34, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
    }

    v35 = *(_QWORD *)(a1 + 48);
    v50[0] = CFSTR("MNDirectionsRequestDetails");
    v50[1] = CFSTR("GEODirectionsResponse");
    v51[0] = v35;
    v51[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:userInfo:", 5, v36);
    v13 = (char *)objc_claimAutoreleasedReturnValue();

  }
  Integer = GEOConfigGetInteger();
  if (Integer)
  {
    v38 = Integer;
    if (objc_msgSend(*(id *)(a1 + 56), "requestType") == 1)
    {
      v47 = v14;
      v48 = v11;
      objc_msgSend(v26, "firstObject");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "route");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "distance");
      v42 = v41;

      objc_msgSend(v26, "firstObject");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v26, "count") <= 1)
      {
        objc_msgSend(v12, "addFakeTrafficIncidentAlert:targetLegIndex:mainRouteInfo:alternateRouteInfo:currentDistance:", v38, 0, v43, 0, v42);
      }
      else
      {
        objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addFakeTrafficIncidentAlert:targetLegIndex:mainRouteInfo:alternateRouteInfo:currentDistance:", v38, 0, v43, v44, v42);

      }
      v14 = v47;
      v11 = v48;
    }
  }
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setRouteInfos:", v26);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setRequest:", v11);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setResponse:", v12);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setError:", v13);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setDirectionsError:", v14);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "setTraceRecordingData:", v27);
  v45 = (char *)v14;
  v46 = objc_alloc_init(MNNavigationTraceManager);
  -[MNNavigationTraceManager saveRoutePlanningTrace:](v46, "saveRoutePlanningTrace:", v27);
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

uint64_t __112__MNDirectionsRequestManager__requestServerDirections_preferredRoute_withIdentifier_auditToken_finishedHandler___block_invoke_33(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

uint64_t __112__MNDirectionsRequestManager__requestServerDirections_preferredRoute_withIdentifier_auditToken_finishedHandler___block_invoke_43(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", a1[6], a1[5]);
}

- (void)_requestDirectionsFromTraceWithPath:(id)a3 feedback:(id)a4 auditToken:(id)a5 finishedHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, MNDirectionsResponseInfo *);
  MNTraceLoader *v14;
  MNDirectionsResponseInfo *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t Integer;
  uint64_t v26;
  MNDirectionsRequestDetails *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  MNDirectionsRequestDetails *v32;
  uint64_t v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  unint64_t v47;
  void *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  void *v52;
  MNDirectionsRequestManager *v53;
  MNTraceLoader *v54;
  id v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  _QWORD v61[4];
  void (**v62)(id, MNDirectionsResponseInfo *);
  id v63;
  _QWORD v64[2];
  _QWORD v65[2];
  uint8_t buf[4];
  const char *v67;
  __int16 v68;
  const char *v69;
  __int16 v70;
  int v71;
  __int16 v72;
  const char *v73;
  __int16 v74;
  void *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, MNDirectionsResponseInfo *))a6;
  if (!v13)
  {
    GEOFindOrCreateLog();
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v67 = "-[MNDirectionsRequestManager _requestDirectionsFromTraceWithPath:feedback:auditToken:finishedHandler:]";
      v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
      v70 = 1024;
      v71 = 244;
      v72 = 2080;
      v73 = "finishedHandler != nil";
      _os_log_impl(&dword_1B0AD7000, v50, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
    }

  }
  v14 = objc_alloc_init(MNTraceLoader);
  v15 = objc_alloc_init(MNDirectionsResponseInfo);
  v63 = 0;
  -[MNTraceLoader loadTraceWithPath:outError:](v14, "loadTraceWithPath:outError:", v10, &v63);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v63;
  if (v17)
  {
    v18 = v17;
    -[MNDirectionsResponseInfo setError:](v15, "setError:", v17);
    v13[2](v13, v15);
  }
  else
  {
    v53 = self;
    v54 = v14;
    v56 = v16;
    v57 = v11;
    v55 = v10;
    objc_msgSend(v16, "directions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "request");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "copy");

    objc_msgSend(v20, "response");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "routeAttributes");
    v24 = objc_claimAutoreleasedReturnValue();
    Integer = GEOConfigGetInteger();
    v59 = v22;
    v60 = v12;
    v58 = (void *)v24;
    if (Integer)
    {
      v26 = Integer;
      v51 = v23;
      v27 = [MNDirectionsRequestDetails alloc];
      objc_msgSend(v20, "waypoints");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = (void *)MEMORY[0x1E0D274A8];
      objc_msgSend(v22, "routeAttributes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "defaultRouteAttributesForTransportType:", objc_msgSend(v30, "mainTransportType"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = -[MNDirectionsRequestDetails initWithWaypoints:routeAttributes:](v27, "initWithWaypoints:routeAttributes:", v28, v31);

      if (objc_msgSend(v22, "mainTransportTypeMaxRouteCount"))
        v33 = objc_msgSend(v22, "mainTransportTypeMaxRouteCount");
      else
        v33 = 3;
      v12 = v60;
      v14 = v54;
      -[MNDirectionsRequestDetails setMaxRouteCount:](v32, "setMaxRouteCount:", v33, v51);
      v41 = (void *)objc_opt_new();
      -[MNDirectionsRequestDetails setDirectionsRequestFeedback:](v32, "setDirectionsRequestFeedback:", v41);

      -[MNDirectionsRequestDetails directionsRequestFeedback](v32, "directionsRequestFeedback");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setPurpose:", 1);

      v10 = v55;
      if (v26 == 2)
      {
        v43 = objc_alloc(MEMORY[0x1E0D274D8]);
        objc_msgSend(v20, "waypoints");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = (void *)objc_msgSend(v43, "initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:", v44, v58, v52, v59);

        objc_msgSend(v45, "allRouteInfos");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = objc_msgSend(v20, "selectedRouteIndex");
        if (v47 >= objc_msgSend(v46, "count"))
        {
          v36 = 0;
        }
        else
        {
          objc_msgSend(v46, "objectAtIndexedSubscript:", objc_msgSend(v20, "selectedRouteIndex"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "route");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v12 = v60;
      }
      else
      {
        v36 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __102__MNDirectionsRequestManager__requestDirectionsFromTraceWithPath_feedback_auditToken_finishedHandler___block_invoke;
      v61[3] = &unk_1E61D3788;
      v62 = v13;
      -[MNDirectionsRequestManager _requestServerDirections:preferredRoute:withIdentifier:auditToken:finishedHandler:](v53, "_requestServerDirections:preferredRoute:withIdentifier:auditToken:finishedHandler:", v32, v36, v49, v12, v61);

      v18 = 0;
      v23 = v52;
    }
    else
    {
      v34 = objc_alloc(MEMORY[0x1E0D274D8]);
      objc_msgSend(v20, "waypoints");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (MNDirectionsRequestDetails *)objc_msgSend(v34, "initWithWaypoints:routeAttributes:directionsResponse:directionsRequest:", v35, v24, v23, v22);

      -[MNDirectionsRequestDetails allRouteInfos](v32, "allRouteInfos");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNDirectionsRequestManager _logRoutes:error:](v53, "_logRoutes:error:", v36, 0);
      v18 = 0;
      v14 = v54;
      v10 = v55;
      if (!objc_msgSend(v36, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Recorded trace response has no routes and no errors."));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        GEOFindOrCreateLog();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          v67 = "-[MNDirectionsRequestManager _requestDirectionsFromTraceWithPath:feedback:auditToken:finishedHandler:]";
          v68 = 2080;
          v69 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Session/MNDirectionsRequestManager.m";
          v70 = 1024;
          v71 = 271;
          v72 = 2080;
          v73 = "NO";
          v74 = 2112;
          v75 = v37;
          _os_log_impl(&dword_1B0AD7000, v38, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
        }

        v64[0] = CFSTR("TracePath");
        v64[1] = CFSTR("GEODirectionsResponse");
        v65[0] = v55;
        v65[1] = v23;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB35C8], "_navigation_errorWithCode:userInfo:", 5, v39);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[MNDirectionsResponseInfo setRouteInfos:](v15, "setRouteInfos:", v36);
      objc_msgSend(v20, "request");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[MNDirectionsResponseInfo setRequest:](v15, "setRequest:", v40);

      -[MNDirectionsResponseInfo setResponse:](v15, "setResponse:", v23);
      -[MNDirectionsResponseInfo setError:](v15, "setError:", v18);
      v13[2](v13, v15);
      v12 = v60;
    }

    v16 = v56;
    v11 = v57;
  }

}

void __102__MNDirectionsRequestManager__requestDirectionsFromTraceWithPath_feedback_auditToken_finishedHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTraceRecordingData:", 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)_logRoutes:(id)a3 error:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int BOOL;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  _DWORD v23[7];

  *(_QWORD *)&v23[5] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    BOOL = GEOConfigGetBOOL();
    MNGetMNRouteLoggingLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject route](v7, "route");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (BOOL)
        objc_msgSend(v10, "debugDescription");
      else
        objc_msgSend(v10, "description");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v23 = v12;
      _os_log_impl(&dword_1B0AD7000, v9, OS_LOG_TYPE_DEFAULT, "Route 0: %@\n", buf, 0xCu);

    }
    v13 = GEOConfigGetBOOL();
    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v20 = v7;
      v21 = v6;
      v14 = 1;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v14, v20, v21);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        MNGetMNRouteLoggingLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "route");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (v13)
            objc_msgSend(v17, "debugDescription");
          else
            objc_msgSend(v17, "description");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109378;
          v23[0] = v14;
          LOWORD(v23[1]) = 2112;
          *(_QWORD *)((char *)&v23[1] + 2) = v19;
          _os_log_impl(&dword_1B0AD7000, v16, OS_LOG_TYPE_DEFAULT, "Route %d: %@\n", buf, 0x12u);

        }
        ++v14;
      }
      while (v14 < objc_msgSend(v5, "count"));
      v7 = v20;
      v6 = v21;
    }
  }
  else
  {
    MNGetMNRouteLoggingLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v23 = v6;
      _os_log_impl(&dword_1B0AD7000, v7, OS_LOG_TYPE_ERROR, "Error loading routes: %@", buf, 0xCu);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directionsService, 0);
  objc_storeStrong((id *)&self->_pendingRequestsIsolater, 0);
  objc_storeStrong((id *)&self->_pendingRequests, 0);
}

@end
