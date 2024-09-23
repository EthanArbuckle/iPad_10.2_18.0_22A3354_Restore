@implementation _GEOReverseGeocodeRequestTicket

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v9;
  id v10;
  id v11;
  id *v12;
  id *v13;
  void *v14;
  void *v15;
  void *v16;
  GEOLocationShifter *v17;
  void *v18;
  uint64_t v19;
  void *global_queue;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v9)
  {
    if (self->_shiftLocationsIfNeeded)
    {
      -[GEOPDPlaceRequest placeRequestParameters](self->super._request, "placeRequestParameters");
      v12 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRequestParameters reverseGeocodingParameters](v12);
      v13 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDReverseGeocodingParameters extendedLocations](v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "latLng");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "coordinate");
      LODWORD(v12) = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

      if ((_DWORD)v12)
      {
        v17 = objc_alloc_init(GEOLocationShifter);
        objc_msgSend(v15, "latLng");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = MEMORY[0x1E0C809B0];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __88___GEOReverseGeocodeRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
        v23[3] = &unk_1E1C067B0;
        v23[4] = self;
        v24 = v10;
        v25 = v9;
        v26 = v11;
        v21[0] = v19;
        v21[1] = 3221225472;
        v21[2] = __88___GEOReverseGeocodeRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2;
        v21[3] = &unk_1E1C03638;
        v22 = v25;
        global_queue = (void *)geo_get_global_queue();
        -[GEOLocationShifter shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:](v17, "shiftLatLng:accuracy:auditToken:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v18, v24, v23, 0, v21, global_queue, 0.0);

        goto LABEL_7;
      }

    }
    -[_GEOPlaceRequestTicket _processRequest:auditToken:timeout:withHandler:refinedHandler:networkActivity:](self, "_processRequest:auditToken:timeout:withHandler:refinedHandler:networkActivity:", self->super._request, v10, v9, 0, v11, 0.0);
  }
LABEL_7:

}

- (_GEOReverseGeocodeRequestTicket)initWithRequest:(id)a3 shiftLocationsIfNeeded:(BOOL)a4 traits:(id)a5
{
  _GEOReverseGeocodeRequestTicket *v6;
  _GEOReverseGeocodeRequestTicket *v7;
  _GEOReverseGeocodeRequestTicket *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_GEOReverseGeocodeRequestTicket;
  v6 = -[_GEOPlaceRequestTicket initWithRequest:traits:](&v10, sel_initWithRequest_traits_, a3, a5);
  v7 = v6;
  if (v6)
  {
    v6->_shiftLocationsIfNeeded = a4;
    v8 = v6;
  }

  return v7;
}

- (NSString)searchQuery
{
  id *v2;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  -[GEOPDPlaceRequest placeRequestParameters](self->super._request, "placeRequestParameters");
  v2 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequestParameters reverseGeocodingParameters](v2);
  v3 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEOPDReverseGeocodingParameters extendedLocations](v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "latLng");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "coordinate");
    v8 = v7;
    v10 = v9;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%lf, %lf)"), v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return (NSString *)v11;
}

@end
