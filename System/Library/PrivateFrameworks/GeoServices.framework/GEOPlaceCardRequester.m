@implementation GEOPlaceCardRequester

+ (id)sharedRequester
{
  if (qword_1ECDBBA28 != -1)
    dispatch_once(&qword_1ECDBBA28, &__block_literal_global_24);
  return (id)_MergedGlobals_190;
}

- (id)performPlaceDataRequest:(id)a3 traits:(id)a4 cachePolicy:(unint64_t)a5 timeout:(double)a6 auditToken:(id)a7 throttleToken:(id)a8 networkActivity:(id)a9 requesterHandler:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  id *v23;
  id *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  GEOPlaceRequestMessage *v33;
  id v34;
  void *v35;
  void *v36;
  id *v37;
  id *v38;
  void *v39;
  __CFString *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  int v44;
  __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  GEOPlaceRequestMessage *v50;
  NSObject *v51;
  void *v52;
  int v53;
  void *v54;
  OS_dispatch_queue *requestQ;
  GEOPlaceRequestMessage *v56;
  id v58;
  void (**v60)(_QWORD, _QWORD, _QWORD);
  void *v61;
  _QWORD v62[4];
  __CFString *v63;
  GEOPlaceCardRequester *v64;
  GEOPlaceRequestMessage *v65;
  void (**v66)(_QWORD, _QWORD, _QWORD);
  uint64_t v67;
  uint64_t v68;
  void (*v69)(uint64_t);
  void *v70;
  GEOPlaceCardRequester *v71;
  GEOPlaceRequestMessage *v72;
  id v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  _BYTE v79[10];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a8;
  v19 = a10;
  objc_msgSend(v15, "clearSensitiveFields:", 0);
  v60 = (void (**)(_QWORD, _QWORD, _QWORD))v19;
  v61 = v18;
  if (!objc_msgSend(v15, "hasPlaceRequestParameters"))
    goto LABEL_16;
  objc_msgSend(v15, "placeRequestParameters");
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
    goto LABEL_16;
  v21 = (_QWORD *)v20;
  -[GEOPDPlaceRequestParameters _readMapsIdentifierPlaceLookupParameters](v20);
  v22 = v21[29];

  if (!v22)
    goto LABEL_16;
  objc_msgSend(v15, "placeRequestParameters");
  v23 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters mapsIdentifierPlaceLookupParameters](v23);
  v24 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDMapsIdentifierPlaceLookupParameters mapsIds](v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v75 = 0u;
  v74 = 0u;
  v26 = v25;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
  if (v27)
  {
    v28 = v27;
    v29 = 0;
    v30 = *(_QWORD *)v75;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v75 != v30)
          objc_enumerationMutation(v26);
        v29 += objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "isValidMapsIdentifier");
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v80, 16);
    }
    while (v28);
  }
  else
  {
    v29 = 0;
  }

  if (objc_msgSend(v26, "count") && v29 == objc_msgSend(v26, "count"))
  {

LABEL_16:
    if (!v16)
    {
      +[GEOMapService sharedService](GEOMapService, "sharedService");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "defaultTraits");
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    v58 = v17;
    v33 = -[GEOPlaceRequestMessage initWithTraits:auditToken:throttleToken:]([GEOPlaceRequestMessage alloc], "initWithTraits:auditToken:throttleToken:", v16, v17, v18);
    v34 = v15;
    v35 = v34;
    if (v34)
    {
      if (objc_msgSend(v34, "requestType") == 1)
      {
        v36 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v35, "placeRequestParameters");
        v37 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDPlaceRequestParameters searchParameters](v37);
        v38 = (id *)objc_claimAutoreleasedReturnValue();
        -[GEOPDSearchParameters searchString](v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "stringWithFormat:", CFSTR("REQUEST_TYPE_SEARCH:'%@'"), v39);
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v41 = objc_msgSend(v35, "requestType");
        if (v41 >= 0x3F)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v41);
          v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v40 = off_1E1C02E18[(int)v41];
        }
      }
    }
    else
    {
      v40 = CFSTR("nil");
    }

    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceRequestMessage setRequestUUID:](v33, "setRequestUUID:", v47);

    -[GEOPlaceRequestMessage setRequest:](v33, "setRequest:", v35);
    -[GEOPlaceRequestMessage setCachePolicy:](v33, "setCachePolicy:", a5);
    -[GEOPlaceRequestMessage setTimeout:](v33, "setTimeout:", a6);
    -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", v16);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = MEMORY[0x1E0C809B0];
    v67 = MEMORY[0x1E0C809B0];
    v68 = 3221225472;
    v69 = __134__GEOPlaceCardRequester_performPlaceDataRequest_traits_cachePolicy_timeout_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke;
    v70 = &unk_1E1C01790;
    v71 = self;
    v50 = v33;
    v72 = v50;
    v26 = v48;
    v73 = v26;
    geo_isolate_sync_data();
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v79 = v35;
      _os_log_impl(&dword_1885A9000, v51, OS_LOG_TYPE_DEBUG, "Performing place data request: %p", buf, 0xCu);
    }

    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v52, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceDataRequest_GEOD"));

    if (v53)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceDataRequest_GEODBEGIN"), v40);

    }
    requestQ = self->_requestQ;
    v62[0] = v49;
    v62[1] = 3221225472;
    v62[2] = __134__GEOPlaceCardRequester_performPlaceDataRequest_traits_cachePolicy_timeout_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_38;
    v62[3] = &unk_1E1C02DA8;
    v63 = v40;
    v64 = self;
    v65 = v50;
    v43 = v60;
    v66 = v60;
    v56 = v50;
    v45 = v40;
    -[GEOXPCRequest send:withReply:handler:](v56, "send:withReply:handler:", v26, requestQ, v62);
    -[GEOPlaceRequestMessage requestUUID](v56, "requestUUID");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = v58;
    goto LABEL_33;
  }
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
  v42 = objc_claimAutoreleasedReturnValue();
  v43 = v60;
  if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
  {
    v44 = objc_msgSend(v26, "count");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v79 = v29;
    *(_WORD *)&v79[4] = 1024;
    *(_DWORD *)&v79[6] = v44;
    _os_log_impl(&dword_1885A9000, v42, OS_LOG_TYPE_FAULT, "%d of %d requested identifiers were valid.", buf, 0xEu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("Invalid MapItemIdentifier(s)"));
  v45 = (__CFString *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, _QWORD, __CFString *))v60)[2](v60, 0, v45);
  v46 = 0;
LABEL_33:

  return v46;
}

- (id)_createServerConnection:(id)a3
{
  uint8_t v4[16];

  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod", a3))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: !GEOPlatform.isRunningInGeod", v4, 2u);
    }
    return 0;
  }
  else
  {
    +[GEOXPCConnection createServerConnectionFor:debugIdentifier:eventHandler:](GEOXPCConnection, "createServerConnectionFor:debugIdentifier:eventHandler:", 9, CFSTR("PlaceDataLookup"), 0);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_takeConnectionForRequestUUID:(id)a3
{
  id v4;
  void *v5;
  geo_isolater *v7;

  v4 = a3;
  v7 = self->_isolater;
  _geo_isolate_lock_data();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingRequestConnections, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingRequestConnections, "setObject:forKeyedSubscript:", 0, v4);
  _geo_isolate_unlock();

  return v5;
}

void __134__GEOPlaceCardRequester_performPlaceDataRequest_traits_cachePolicy_timeout_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "requestUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

- (id)requestPhoneNumbers:(id)a3 allowCellularDataForLookup:(BOOL)a4 traits:(id)a5 auditToken:(id)a6 throttleToken:(id)a7 networkActivity:(id)a8 requesterHandler:(id)a9
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  GEOPlaceByPhoneNumberRequest *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  OS_dispatch_queue *requestQ;
  id v32;
  GEOPlaceByPhoneNumberRequest *v33;
  void *v34;
  _BOOL4 v36;
  id v37;
  id v38;
  _QWORD v39[5];
  GEOPlaceByPhoneNumberRequest *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  GEOPlaceCardRequester *v46;
  GEOPlaceByPhoneNumberRequest *v47;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v36 = a4;
  v54 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v38 = a6;
  v37 = a7;
  v15 = a9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v50 != v20)
          objc_enumerationMutation(v17);
        GEOStringForPhoneNumber(*(void **)(*((_QWORD *)&v49 + 1) + 8 * i));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        if (v22)
          v24 = (const __CFString *)v22;
        else
          v24 = &stru_1E1C241D0;
        objc_msgSend(v16, "addObject:", v24);

      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v19);
  }

  if (!v14)
  {
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "defaultTraits");
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  v26 = -[GEOPlaceByPhoneNumberRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceByPhoneNumberRequest alloc], "initWithTraits:auditToken:throttleToken:", v14, v38, v37);
  -[GEOPlaceByPhoneNumberRequest setPhoneNumbers:](v26, "setPhoneNumbers:", v16);
  -[GEOPlaceByPhoneNumberRequest setAllowCellular:](v26, "setAllowCellular:", v36);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPlaceByPhoneNumberRequest setRequestUUID:](v26, "setRequestUUID:", v27);

  -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", v14);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = MEMORY[0x1E0C809B0];
  v42 = MEMORY[0x1E0C809B0];
  v43 = 3221225472;
  v44 = __137__GEOPlaceCardRequester_requestPhoneNumbers_allowCellularDataForLookup_traits_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke;
  v45 = &unk_1E1C01790;
  v46 = self;
  v47 = v26;
  v48 = v28;
  v30 = v28;
  geo_isolate_sync_data();
  requestQ = self->_requestQ;
  v39[0] = v29;
  v39[1] = 3221225472;
  v39[2] = __137__GEOPlaceCardRequester_requestPhoneNumbers_allowCellularDataForLookup_traits_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_2;
  v39[3] = &unk_1E1C02D58;
  v39[4] = self;
  v40 = v47;
  v41 = v15;
  v32 = v15;
  v33 = v47;
  -[GEOXPCRequest send:withReply:handler:](v33, "send:withReply:handler:", v30, requestQ, v39);
  -[GEOPlaceByPhoneNumberRequest requestUUID](v33, "requestUUID");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  return v34;
}

void __137__GEOPlaceCardRequester_requestPhoneNumbers_allowCellularDataForLookup_traits_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_takeConnectionForRequestUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v5)
    {
      v9 = v5;
    }
    else
    {
      objc_msgSend(v16, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v16;
      if (v10)
        goto LABEL_7;
      objc_msgSend(v16, "response");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "resultsCountWithResultType:", 1);

      if (v15)
      {
        v10 = 0;
        goto LABEL_5;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("No Results"));
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
LABEL_5:
    v11 = v16;
LABEL_7:
    v12 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v11, "response");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v12 + 16))(v12, v13, v10);

  }
}

void __137__GEOPlaceCardRequester_requestPhoneNumbers_allowCellularDataForLookup_traits_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "requestUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

void __40__GEOPlaceCardRequester_sharedRequester__block_invoke()
{
  GEOPlaceCardRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEOPlaceCardRequester);
  v1 = (void *)_MergedGlobals_190;
  _MergedGlobals_190 = (uint64_t)v0;

}

- (GEOPlaceCardRequester)init
{
  GEOPlaceCardRequester *v2;
  uint64_t global_queue;
  OS_dispatch_queue *requestQ;
  uint64_t v5;
  geo_isolater *isolater;
  uint64_t v7;
  NSMutableDictionary *pendingRequestConnections;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEOPlaceCardRequester;
  v2 = -[GEOPlaceCardRequester init](&v10, sel_init);
  if (v2)
  {
    global_queue = geo_get_global_queue();
    requestQ = v2->_requestQ;
    v2->_requestQ = (OS_dispatch_queue *)global_queue;

    v5 = geo_isolater_create();
    isolater = v2->_isolater;
    v2->_isolater = (geo_isolater *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 10);
    v7 = objc_claimAutoreleasedReturnValue();
    pendingRequestConnections = v2->_pendingRequestConnections;
    v2->_pendingRequestConnections = (NSMutableDictionary *)v7;

  }
  return v2;
}

void __134__GEOPlaceCardRequester_requestIdentifiers_resultProviderID_traits_options_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a2;
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "requestUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_takeConnectionForRequestUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v5)
    {
      v9 = v5;
    }
    else
    {
      objc_msgSend(v16, "error");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    objc_msgSend(v16, "response");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "resultsCountWithResultType:", 1);

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, CFSTR("No Results"));
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v13;
    }
    v14 = *(_QWORD *)(a1 + 48);
    objc_msgSend(v16, "response");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v10);

  }
}

void __134__GEOPlaceCardRequester_requestIdentifiers_resultProviderID_traits_options_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  objc_msgSend(*(id *)(a1 + 40), "requestUUID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

- (id)requestIdentifiers:(id)a3 resultProviderID:(int)a4 traits:(id)a5 options:(unint64_t)a6 auditToken:(id)a7 throttleToken:(id)a8 networkActivity:(id)a9 requesterHandler:(id)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  GEOPlaceByIdentifiersRequest *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  OS_dispatch_queue *requestQ;
  GEOPlaceByIdentifiersRequest *v33;
  void *v34;
  NSObject *v35;
  int v36;
  _QWORD v40[5];
  GEOPlaceByIdentifiersRequest *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t);
  void *v46;
  GEOPlaceCardRequester *v47;
  GEOPlaceByIdentifiersRequest *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  int v55;
  __int16 v56;
  int v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  v18 = a10;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v19 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
  if (v19)
  {
    v20 = v19;
    v21 = 0;
    v22 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v51 != v22)
          objc_enumerationMutation(v14);
        v21 += objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "isValid");
      }
      v20 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
    }
    while (v20);
  }
  else
  {
    v21 = 0;
  }
  if (objc_msgSend(v14, "count") && v21 == objc_msgSend(v14, "count"))
  {
    v24 = v16;
    if (!v15)
    {
      +[GEOMapService sharedService](GEOMapService, "sharedService");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "defaultTraits");
      v15 = (id)objc_claimAutoreleasedReturnValue();

    }
    v26 = v17;
    v27 = -[GEOPlaceByIdentifiersRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceByIdentifiersRequest alloc], "initWithTraits:auditToken:throttleToken:", v15, v16, v17);
    -[GEOPlaceByIdentifiersRequest setIdentifiers:](v27, "setIdentifiers:", v14);
    -[GEOPlaceByIdentifiersRequest setResultProvider:](v27, "setResultProvider:", a4);
    -[GEOPlaceByIdentifiersRequest setOptions:](v27, "setOptions:", a6);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOPlaceByIdentifiersRequest setRequestUUID:](v27, "setRequestUUID:", v28);

    -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", v15);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = MEMORY[0x1E0C809B0];
    v43 = MEMORY[0x1E0C809B0];
    v44 = 3221225472;
    v45 = __134__GEOPlaceCardRequester_requestIdentifiers_resultProviderID_traits_options_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke;
    v46 = &unk_1E1C01790;
    v47 = self;
    v48 = v27;
    v49 = v29;
    v31 = v29;
    geo_isolate_sync_data();
    requestQ = self->_requestQ;
    v40[0] = v30;
    v40[1] = 3221225472;
    v40[2] = __134__GEOPlaceCardRequester_requestIdentifiers_resultProviderID_traits_options_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_2;
    v40[3] = &unk_1E1C02D08;
    v40[4] = self;
    v41 = v48;
    v42 = v18;
    v33 = v48;
    -[GEOXPCRequest send:withReply:handler:](v33, "send:withReply:handler:", v31, requestQ, v40);
    -[GEOPlaceByIdentifiersRequest requestUUID](v33, "requestUUID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
    v35 = objc_claimAutoreleasedReturnValue();
    v24 = v16;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      v36 = objc_msgSend(v14, "count");
      *(_DWORD *)buf = 67109376;
      v55 = v21;
      v56 = 1024;
      v57 = v36;
      _os_log_impl(&dword_1885A9000, v35, OS_LOG_TYPE_FAULT, "%d of %d requested identifiers were valid.", buf, 0xEu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, CFSTR("Invalid MapItemIdentifier(s)"));
    v31 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, id))v18 + 2))(v18, 0, v31);
    v34 = 0;
    v26 = v17;
  }

  return v34;
}

- (void)fetchAllCacheEntriesWithRequesterHandler:(id)a3
{
  id v4;
  GEOPlaceFetchCacheRequest *v5;
  void *v6;
  OS_dispatch_queue *requestQ;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = -[GEOPlaceFetchCacheRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceFetchCacheRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  requestQ = self->_requestQ;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__GEOPlaceCardRequester_fetchAllCacheEntriesWithRequesterHandler___block_invoke;
  v9[3] = &unk_1E1C02D30;
  v10 = v4;
  v8 = v4;
  -[GEOXPCRequest send:withReply:handler:](v5, "send:withReply:handler:", v6, requestQ, v9);

}

void __66__GEOPlaceCardRequester_fetchAllCacheEntriesWithRequesterHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v9, "allCacheEntries");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    (*(void (**)(uint64_t, void *, id))(v6 + 16))(v6, v7, v5);
  }
  else
  {
    objc_msgSend(v9, "error");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v6 + 16))(v6, v7, v8);

  }
}

- (void)trackPlaceData:(id)a3
{
  id v4;
  GEOPlaceCachePlaceRequest *v5;
  NSObject *v6;
  void *v7;
  OS_dispatch_queue *requestQ;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[GEOPlaceCachePlaceRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceCachePlaceRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134283777;
    v13 = objc_msgSend(v4, "muid");
    v14 = 2049;
    v15 = objc_msgSend(v4, "hash");
    _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_DEBUG, "Attempting to track place with muid: (%{private}llu) and hash: (%{private}lu)", buf, 0x16u);
  }

  -[GEOPlaceCachePlaceRequest setPlace:](v5, "setPlace:", v4);
  -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  requestQ = self->_requestQ;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __40__GEOPlaceCardRequester_trackPlaceData___block_invoke;
  v10[3] = &unk_1E1C02D80;
  v11 = v4;
  v9 = v4;
  -[GEOXPCRequest send:withReply:handler:](v5, "send:withReply:handler:", v7, requestQ, v10);

}

void __40__GEOPlaceCardRequester_trackPlaceData___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  void *v10;
  GEOMapItemIdentifier *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543362;
      v16 = (uint64_t)v6;
      v8 = "XPC error tracking place: %{public}@";
LABEL_7:
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v5, "error");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v15 = 138543362;
        v16 = 0;
        v8 = "geod error tracking place: %{public}@";
        goto LABEL_7;
      }
    }
    else
    {
      objc_msgSend(v5, "identifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v7 = objc_claimAutoreleasedReturnValue();

      v11 = -[GEOMapItemIdentifier initWithPlace:]([GEOMapItemIdentifier alloc], "initWithPlace:", *(_QWORD *)(a1 + 32));
      if ((-[NSObject isEqual:](v7, "isEqual:", v11) & 1) == 0)
      {
        GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = -[NSObject muid](v7, "muid");
          v14 = objc_msgSend(*(id *)(a1 + 32), "muid");
          v15 = 134283777;
          v16 = v13;
          v17 = 2049;
          v18 = v14;
          _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Tracked place had a different muid (%{private}llu) from the one submitted: %{private}llu", (uint8_t *)&v15, 0x16u);
        }

      }
    }
  }

}

void __134__GEOPlaceCardRequester_performPlaceDataRequest_traits_cachePolicy_timeout_auditToken_throttleToken_networkActivity_requesterHandler___block_invoke_38(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  int v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceDataRequest_GEOD"));

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceDataRequest_GEODEND"), *(_QWORD *)(a1 + 32));

  }
  v10 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "requestUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_takeConnectionForRequestUUID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest_ResponseHandling"));

    if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequest_ResponseHandlingBEGIN"), *(_QWORD *)(a1 + 32));

    }
    if (v6)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOPlaceCardRequester");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        v23 = 138477827;
        v24 = v6;
        _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_DEBUG, "Received error: %{private}@", (uint8_t *)&v23, 0xCu);
      }

    }
    v17 = *(_QWORD *)(a1 + 56);
    objc_msgSend(v5, "response");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v18, v6);
    }
    else
    {
      objc_msgSend(v5, "error");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v19);

    }
    +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest_ResponseHandling"));

    if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequest_ResponseHandlingEND"), *(_QWORD *)(a1 + 32));

    }
  }

}

- (void)cancelRequest:(id)a3
{
  id v4;
  char isKindOfClass;
  void *v6;
  GEOPlaceCancelRequest *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v8 = v4;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v4 = v8;
    if ((isKindOfClass & 1) != 0)
    {
      -[GEOPlaceCardRequester _takeConnectionForRequestUUID:](self, "_takeConnectionForRequestUUID:", v8);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = -[GEOPlaceCancelRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceCancelRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
        -[GEOPlaceCancelRequest setRequestUUID:](v7, "setRequestUUID:", v8);
        -[GEOXPCRequest send:](v7, "send:", v6);

      }
      v4 = v8;
    }
  }

}

- (void)calculateFreeableSpaceWithHandler:(id)a3
{
  id v4;
  GEOPlaceCalculateFreeableSpaceRequest *v5;
  void *v6;
  OS_dispatch_queue *requestQ;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = -[GEOPlaceCalculateFreeableSpaceRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceCalculateFreeableSpaceRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  requestQ = self->_requestQ;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __59__GEOPlaceCardRequester_calculateFreeableSpaceWithHandler___block_invoke;
  v9[3] = &unk_1E1C02DD0;
  v10 = v4;
  v8 = v4;
  -[GEOXPCRequest send:withReply:handler:](v5, "send:withReply:handler:", v6, requestQ, v9);

}

uint64_t __59__GEOPlaceCardRequester_calculateFreeableSpaceWithHandler___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "freeableBytes"));
}

- (unint64_t)calculateFreeableSpaceSync
{
  GEOPlaceCalculateFreeableSpaceRequest *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = -[GEOPlaceCalculateFreeableSpaceRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceCalculateFreeableSpaceRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCRequest sendSync:error:](v3, "sendSync:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "freeableBytes");

  return v6;
}

- (void)shrinkBySize:(unint64_t)a3 finished:(id)a4
{
  id v5;
  GEOPlaceFreeSpaceRequest *v6;
  void *v7;
  OS_dispatch_queue *requestQ;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = -[GEOPlaceFreeSpaceRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceFreeSpaceRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  requestQ = self->_requestQ;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__GEOPlaceCardRequester_shrinkBySize_finished___block_invoke;
  v10[3] = &unk_1E1C02DF8;
  v11 = v5;
  v9 = v5;
  -[GEOXPCRequest send:withReply:handler:](v6, "send:withReply:handler:", v7, requestQ, v10);

}

uint64_t __47__GEOPlaceCardRequester_shrinkBySize_finished___block_invoke(uint64_t a1, void *a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "freedBytes"));
}

- (unint64_t)shrinkBySizeSync:(unint64_t)a3
{
  GEOPlaceFreeSpaceRequest *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = -[GEOPlaceFreeSpaceRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceFreeSpaceRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCRequest sendSync:error:](v4, "sendSync:error:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "freedBytes");

  return v7;
}

- (void)clearCache
{
  void *v3;
  GEOPlaceClearCacheRequest *v4;

  v4 = -[GEOPlaceClearCacheRequest initWithTraits:auditToken:throttleToken:]([GEOPlaceClearCacheRequest alloc], "initWithTraits:auditToken:throttleToken:", 0, 0, 0);
  -[GEOPlaceCardRequester _createServerConnection:](self, "_createServerConnection:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOXPCRequest send:](v4, "send:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingRequestConnections, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_requestQ, 0);
}

@end
