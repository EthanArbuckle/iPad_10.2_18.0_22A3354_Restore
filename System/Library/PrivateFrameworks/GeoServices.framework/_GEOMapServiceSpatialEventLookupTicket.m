@implementation _GEOMapServiceSpatialEventLookupTicket

+ (unint64_t)maxParametersCount
{
  return GEOConfigGetUInteger(GeoServicesConfig_BatchSpatialEventLookupMaxParametersCount, (uint64_t)off_1EDF4CFB8);
}

- (_GEOMapServiceSpatialEventLookupTicket)initWithRequest:(id)a3 parameters:(id)a4 traits:(id)a5
{
  id v9;
  _GEOMapServiceSpatialEventLookupTicket *v10;
  _GEOMapServiceSpatialEventLookupTicket *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_GEOMapServiceSpatialEventLookupTicket;
  v10 = -[_GEOPlaceRequestTicket initWithRequest:traits:](&v13, sel_initWithRequest_traits_, a3, a5);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_parameters, a4);

  return v11;
}

- (void)submitWithHandler:(id)a3 queue:(id)a4
{
  -[_GEOMapServiceSpatialEventLookupTicket submitWithHandler:auditToken:queue:](self, "submitWithHandler:auditToken:queue:", a3, 0, a4);
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  void *v16;
  GEOPDPlaceRequest *request;
  GEOMapServiceTraits *traits;
  unint64_t cachePolicy;
  GEODataRequestThrottlerToken *throttlerToken;
  id v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  id v25;
  id v26;
  uint8_t buf[4];
  NSUInteger v28;
  __int16 v29;
  unint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = +[_GEOMapServiceSpatialEventLookupTicket maxParametersCount](_GEOMapServiceSpatialEventLookupTicket, "maxParametersCount");
    if (v11 >= -[NSArray count](self->_parameters, "count"))
    {
      +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      request = self->super._request;
      traits = self->super.super.super._traits;
      cachePolicy = self->super.super.super._cachePolicy;
      throttlerToken = self->super.super.super._throttlerToken;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __77___GEOMapServiceSpatialEventLookupTicket_submitWithHandler_auditToken_queue___block_invoke;
      v24[3] = &unk_1E1C06BB8;
      v24[4] = self;
      v26 = v8;
      v25 = v10;
      v21 = (id)objc_msgSend(v16, "performPlaceDataRequest:traits:cachePolicy:timeout:auditToken:throttleToken:networkActivity:requesterHandler:", request, traits, cachePolicy, v9, throttlerToken, 0, 0.0, v24);

      +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(request) = objc_msgSend(v22, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequestTicket_PlaceDataRequest"));

      if ((_DWORD)request)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequestTicket_PlaceDataRequestBEGIN"), self->super._request);

      }
    }
    else
    {
      GEOGetGEOBatchSpatialLookupLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = -[NSArray count](self->_parameters, "count");
        *(_DWORD *)buf = 134218240;
        v28 = v13;
        v29 = 2048;
        v30 = v11;
        _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "SpatialEventLookup ticket submission failed. Too many parameters: %lu max allowed: %lu", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Lookup parameters count exceeds maximum allowed count %lu."), v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -10, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[_GEOMapServiceSpatialEventLookupTicket callCompletion:onQueue:withResult:error:](self, "callCompletion:onQueue:withResult:error:", v8, v10, 0, v15);

    }
  }

}

- (void)handleResponse:(id)a3 completion:(id)a4 queue:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  NSUInteger v25;
  void *v26;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  NSUInteger v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_storeStrong((id *)&self->super._response, a3);
  if (objc_msgSend(v9, "hasStatus") && !objc_msgSend(v9, "status"))
  {
    -[_GEOMapServiceSpatialEventLookupTicket spatialEventLookupResultsFromResponse:](self, "spatialEventLookupResultsFromResponse:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13 && (v15 = objc_msgSend(v13, "count"), v15 == -[NSArray count](self->_parameters, "count")))
    {
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v16 = v14;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v30;
        v28 = v14;
        while (2)
        {
          v20 = 0;
          do
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20);
            if (!v21
              || (*(_BYTE *)(v21 + 56) & 1) == 0
              || -[GEOPDSpatialEventLookupResult statusCode](*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * v20))
              && -[GEOPDSpatialEventLookupResult statusCode](v21) != 20)
            {
              objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Received unexpected response"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              -[_GEOMapServiceSpatialEventLookupTicket callCompletion:onQueue:withResult:error:](self, "callCompletion:onQueue:withResult:error:", v10, v11, 0, v26);

              v14 = v28;
              goto LABEL_26;
            }
            ++v20;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
          v14 = v28;
          if (v18)
            continue;
          break;
        }
      }

      objc_msgSend(v9, "resultsWithResultType:", 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count"))
      {
        -[_GEOMapServiceSpatialEventLookupTicket createSpatialEventLookupResultForLookupResults:usingPlaces:completion:queue:](self, "createSpatialEventLookupResultForLookupResults:usingPlaces:completion:queue:", v16, v22, v10, v11);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, 0);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[_GEOMapServiceSpatialEventLookupTicket callCompletion:onQueue:withResult:error:](self, "callCompletion:onQueue:withResult:error:", v10, v11, 0, v27);

      }
      v16 = v22;
    }
    else
    {
      GEOGetGEOBatchSpatialLookupLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v14, "count");
        v25 = -[NSArray count](self->_parameters, "count");
        *(_DWORD *)buf = 134218240;
        v35 = v24;
        v36 = 2048;
        v37 = v25;
        _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_ERROR, "SpatialEventLookup received unexpected lookup result count: %lu expected: %lu", buf, 0x16u);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Received unexpected response"));
      v16 = (id)objc_claimAutoreleasedReturnValue();
      -[_GEOMapServiceSpatialEventLookupTicket callCompletion:onQueue:withResult:error:](self, "callCompletion:onQueue:withResult:error:", v10, v11, 0, v16);
    }
LABEL_26:

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -11, CFSTR("Received unexpected response"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_GEOMapServiceSpatialEventLookupTicket callCompletion:onQueue:withResult:error:](self, "callCompletion:onQueue:withResult:error:", v10, v11, 0, v12);

  }
}

- (void)createSpatialEventLookupResultForLookupResults:(id)a3 usingPlaces:(id)a4 completion:(id)a5 queue:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  GEOSpatialEventLookupResult *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  -[_GEOMapServiceSpatialEventLookupTicket mapItemIdentifiersToPOIEventsMapForPlaces:](self, "mapItemIdentifiersToPOIEventsMapForPlaces:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __118___GEOMapServiceSpatialEventLookupTicket_createSpatialEventLookupResultForLookupResults_usingPlaces_completion_queue___block_invoke;
  v18[3] = &unk_1E1C06788;
  v18[4] = self;
  v19 = v13;
  v20 = (id)MEMORY[0x1E0C9AA60];
  v21 = v14;
  v15 = v14;
  v17 = v13;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v18);

  v16 = -[GEOSpatialEventLookupResult initWithMapTable:]([GEOSpatialEventLookupResult alloc], "initWithMapTable:", v15);
  -[_GEOMapServiceSpatialEventLookupTicket callCompletion:onQueue:withResult:error:](self, "callCompletion:onQueue:withResult:error:", v11, v10, v16, 0);

}

- (id)mapItemIdentifiersToPOIEventsMapForPlaces:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOPOIEvent *v11;
  GEOPOIEvent *v12;
  GEOPOIEvent *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v11 = [GEOPOIEvent alloc];
        v12 = -[GEOPOIEvent initWithPlace:](v11, "initWithPlace:", v10, (_QWORD)v16);
        v13 = v12;
        if (v12)
        {
          -[GEOPOIEvent identifier](v12, "identifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKey:", v13, v14);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)spatialEventLookupResultsFromResponse:(id)a3
{
  id *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a3, "globalResult");
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceGlobalResult batchSpatialLookupResult](v3);
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4 && (*(_BYTE *)(v4 + 56) & 1) != 0 && !-[GEOPDBatchSpatialLookupResult statusCode](v4))
  {
    -[GEOPDBatchSpatialLookupResult spatialEventLookupResults]((id *)v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)eventsForEventLookupResponses:(id)a3 usingIdentifierToEventMap:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __objc2_class **v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  __objc2_class **v23;
  NSObject *v24;
  void *v25;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
  if (v7)
  {
    v9 = v7;
    v10 = 0;
    v11 = *(_QWORD *)v30;
    v12 = off_1E1BEC000;
    *(_QWORD *)&v8 = 138477827;
    v27 = v8;
    do
    {
      v13 = 0;
      v28 = v9;
      do
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v13);
        if (objc_msgSend(v14, "hasEventId", v27))
        {
          v15 = objc_alloc(v12[462]);
          objc_msgSend(v14, "eventId");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)objc_msgSend(v15, "initWithMapsIdentifier:", v16);

          objc_msgSend(v6, "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            if (!v10)
              v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
            objc_msgSend(v10, "addObject:", v18);
          }
          else
          {
            v19 = v11;
            v20 = v10;
            v21 = v5;
            v22 = v6;
            v23 = v12;
            GEOGetGEOBatchSpatialLookupLog();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v14, "eventId");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v27;
              v34 = v25;
              _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_ERROR, "SpatialEventLookup place data missing for event identifier: %{private}@", buf, 0xCu);

            }
            v12 = v23;
            v6 = v22;
            v5 = v21;
            v10 = v20;
            v11 = v19;
            v9 = v28;
          }

        }
        ++v13;
      }
      while (v9 != v13);
      v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)callCompletion:(id)a3 onQueue:(id)a4 withResult:(id)a5 error:(id)a6
{
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v11)
  {
    v11 = MEMORY[0x1E0C80D38];
    v14 = MEMORY[0x1E0C80D38];
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82___GEOMapServiceSpatialEventLookupTicket_callCompletion_onQueue_withResult_error___block_invoke;
  v18[3] = &unk_1E1C064B8;
  v18[4] = self;
  v19 = v12;
  v20 = v13;
  v21 = v10;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  dispatch_async(v11, v18);

}

- (NSArray)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
