@implementation GEOOfflinePlacesServiceRequesterOperation

- (GEOOfflinePlacesServiceRequesterOperation)initWithRequest:(id)a3 traits:(id)a4 auditToken:(id)a5 config:(id)a6 throttleToken:(id)a7 options:(unint64_t)a8 willSendRequestHandler:(id)a9 validationHandler:(id)a10 completionHandler:(id)a11
{
  id v17;
  GEOOfflinePlacesServiceRequesterOperation *v18;
  void *v19;
  uint64_t v20;
  NSString *offlineCohortId;
  objc_super v23;

  v17 = a5;
  v23.receiver = self;
  v23.super_class = (Class)GEOOfflinePlacesServiceRequesterOperation;
  v18 = -[GEOOfflineServiceRequesterOperation initWithRequest:traits:auditToken:config:throttleToken:options:willSendRequestHandler:validationHandler:completionHandler:](&v23, sel_initWithRequest_traits_auditToken_config_throttleToken_options_willSendRequestHandler_validationHandler_completionHandler_, a3, a4, v17, a6, a7, a8, a9, a10, a11);
  if (v18)
  {
    objc_msgSend(v17, "offlineCohortId");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    offlineCohortId = v18->_offlineCohortId;
    v18->_offlineCohortId = (NSString *)v20;

  }
  return v18;
}

- (void)_recordAnalyticsDataForResponse:(id)a3
{
  char isKindOfClass;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v8;
  if ((isKindOfClass & 1) != 0)
  {
    v6 = v8;
    if (objc_msgSend(v6, "hasAnalyticData"))
    {
      objc_msgSend(v6, "analyticData");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEORequestResponseMetadataRecorder recordPlacesRequestResponseAnalyticsData:forCohortId:](GEORequestResponseMetadataRecorder, "recordPlacesRequestResponseAnalyticsData:forCohortId:", v7, self->_offlineCohortId);

    }
    v5 = v8;
  }

}

- (id)validateRequest:(id)a3 withAvailableRegions:(id)a4 returningResponseOrError:(id *)a5
{
  id v6;
  id v7;
  id v8;
  id *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  GEOPDPlaceResponse *v19;
  uint8_t v21[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v19 = 0;
    goto LABEL_23;
  }
  v8 = v6;
  if (objc_msgSend(v8, "requestType") == 7)
  {
    objc_msgSend(v8, "placeRequestParameters");
    v9 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceRequestParameters placeRefinementParameters](v9);
    v10 = objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[GEOPDPlaceRefinementParameters _readLocationHint](v10);
      if (*(_QWORD *)(v10 + 48))
      {
        -[GEOPDPlaceRefinementParameters locationHint]((id *)v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v12 = v7;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v23;
          while (2)
          {
            for (i = 0; i != v14; ++i)
            {
              if (*(_QWORD *)v23 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
              objc_msgSend(v11, "coordinate");
              if ((objc_msgSend(v17, "containsCoordinate:") & 1) != 0)
              {

                v19 = 0;
                goto LABEL_19;
              }
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
            if (v14)
              continue;
            break;
          }
        }

        if (qword_1ECDBCD58 != -1)
          dispatch_once(&qword_1ECDBCD58, &__block_literal_global_216);
        v18 = _MergedGlobals_348;
        if (os_log_type_enabled((os_log_t)_MergedGlobals_348, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v21 = 0;
          _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, "PLACE_REFINEMENT request's location hint is not contained by any loaded offline regions. Failing request", v21, 2u);
        }
        v19 = objc_alloc_init(GEOPDPlaceResponse);
        -[GEOPDPlaceResponse setRequestType:](v19, "setRequestType:", objc_msgSend(v8, "requestType"));
        -[GEOPDPlaceResponse setStatus:](v19, "setStatus:", 1);
LABEL_19:

        goto LABEL_22;
      }
    }

  }
  v19 = 0;
LABEL_22:

LABEL_23:
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineCohortId, 0);
}

@end
