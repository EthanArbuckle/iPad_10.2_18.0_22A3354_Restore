@implementation GEOSpatialLookupRequester

+ (id)sharedInstance
{
  if (_MergedGlobals_209 != -1)
    dispatch_once(&_MergedGlobals_209, &__block_literal_global_51);
  return (id)qword_1ECDBBC38;
}

void __43__GEOSpatialLookupRequester_sharedInstance__block_invoke()
{
  GEOSpatialLookupRequester *v0;
  void *v1;

  v0 = objc_alloc_init(GEOSpatialLookupRequester);
  v1 = (void *)qword_1ECDBBC38;
  qword_1ECDBBC38 = (uint64_t)v0;

}

- (void)startWithRequest:(id)a3 traits:(id)a4 timeout:(double)a5 auditToken:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  GEOSpatialLookupRequestConfig *v18;
  GEOSpatialLookupRequester *v19;
  GEOSpatialLookupRequester *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  objc_super v24;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  GEOFindOrCreateLog("com.apple.greentea", "GEO");
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO) && objc_msgSend(v12, "hasGreenTeaWithValue:", 1))
    GEOGreenTeaLog(v16, (uint64_t)"SpatialLookup", v14);

  if (!v13)
  {
    +[GEOMapService sharedService](GEOMapService, "sharedService");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "defaultTraits");
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  v18 = [GEOSpatialLookupRequestConfig alloc];
  if (v18)
  {
    v24.receiver = v18;
    v24.super_class = (Class)GEOSpatialLookupRequestConfig;
    v19 = -[GEOServiceRequester init](&v24, sel_init);
    v20 = v19;
    if (v19)
      *(double *)&v19->super._pendingRequests = a5;
  }
  else
  {
    v20 = 0;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __90__GEOSpatialLookupRequester_startWithRequest_traits_timeout_auditToken_completionHandler___block_invoke;
  v22[3] = &unk_1E1BFFB70;
  v23 = v15;
  v21 = v15;
  -[GEOServiceRequester _startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:](self, "_startWithRequest:traits:auditToken:config:throttleToken:options:completionHandler:", v12, v13, v14, v20, 0, 0, v22);

}

void __90__GEOSpatialLookupRequester_startWithRequest_traits_timeout_auditToken_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  uint64_t v17;
  uint64_t v18;
  id v20;
  id v21;
  id obj;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v21 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v20 = v4;
  objc_msgSend(v20, "responses");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v24)
  {
    v23 = *(_QWORD *)v31;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v25 = v5;
        v6 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v5);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        objc_msgSend(v6, "places");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v27;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v27 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
              +[GEOPDSpatialLookupResult spatialLookupResultForPlaceData:](GEOPDSpatialLookupResult, "spatialLookupResultForPlaceData:", v12);
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v13)
              {
                -[GEOPDSpatialLookupResult _readCenter](v13);
                if (*(_QWORD *)(v14 + 56))
                {
                  -[GEOPDSpatialLookupResult center]((id *)v14);
                  v15 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v15, "coordinate");
                  v16 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

                  if (v16)
                    v17 = 2;
                  else
                    v17 = 1;
                  objc_msgSend(v12, "setReferenceFrame:", v17);
                }
              }

            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
          }
          while (v9);
        }

        v5 = v25 + 1;
      }
      while (v25 + 1 != v24);
      v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v24);
  }

  v18 = *(_QWORD *)(a1 + 32);
  if (v18)
    (*(void (**)(uint64_t, id, id))(v18 + 16))(v18, v20, v21);

}

- (id)_validateResponse:(id)a3
{
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;

  v3 = objc_msgSend(a3, "statusCode");
  v4 = 0;
  if (v3 > 19)
  {
    if (v3 == 20)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Received no results status from server");
      v7 = -8;
      goto LABEL_9;
    }
    if (v3 != 30)
      goto LABEL_7;
  }
  else if (v3)
  {
    if (v3 == 5)
    {
      v5 = (void *)MEMORY[0x1E0CB35C8];
      v6 = CFSTR("Received invalid request status from server");
      v7 = -10;
LABEL_9:
      objc_msgSend(v5, "GEOErrorWithCode:reason:", v7, v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
LABEL_7:
    v5 = (void *)MEMORY[0x1E0CB35C8];
    v6 = CFSTR("Received failure status from server");
    v7 = -7;
    goto LABEL_9;
  }
  return v4;
}

@end
