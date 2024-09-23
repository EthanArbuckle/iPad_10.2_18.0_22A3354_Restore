@implementation _GEOBatchReverseGeocodeRequestTicket

- (_GEOBatchReverseGeocodeRequestTicket)initWithRequest:(id)a3 locationShifter:(id)a4 traits:(id)a5
{
  id v8;
  _GEOBatchReverseGeocodeRequestTicket *v9;
  uint64_t v10;
  id locationShifter;
  _GEOBatchReverseGeocodeRequestTicket *v12;
  objc_super v14;

  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_GEOBatchReverseGeocodeRequestTicket;
  v9 = -[_GEOPlaceRequestTicket initWithRequest:traits:](&v14, sel_initWithRequest_traits_, a3, a5);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    locationShifter = v9->_locationShifter;
    v9->_locationShifter = (id)v10;

    v12 = v9;
  }

  return v9;
}

- (void)_processRequest:(id)a3 auditToken:(id)a4 timeout:(double)a5 withHandler:(id)a6 refinedHandler:(id)a7 networkActivity:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id *v19;
  id *v20;
  void *v21;
  unint64_t v22;
  unint64_t i;
  void *v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  GEOLocationShifter *v30;
  GEOLocationShifter *v31;
  geo_isolater *v32;
  geo_isolater *shiftIsolation;
  dispatch_group_t v34;
  uint64_t v35;
  NSObject *v36;
  GEOLocationShifter *v37;
  id v38;
  NSObject *global_queue;
  id v40;
  void *v41;
  void *v42;
  _QWORD block[5];
  id v44;
  id v45;
  id v46;
  _QWORD *v47;
  _QWORD v48[4];
  id *v49;
  NSObject *v50;
  GEOLocationShifter *v51;
  id v52;
  _GEOBatchReverseGeocodeRequestTicket *v53;
  _QWORD *v54;
  _QWORD v55[5];
  id v56;

  v13 = a3;
  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = v17;
  if (v15)
  {
    if (self->_locationShifter)
    {
      v41 = v17;
      v42 = v15;
      v40 = v13;
      -[GEOPDPlaceRequest placeRequestParameters](self->super._request, "placeRequestParameters");
      v19 = (id *)objc_claimAutoreleasedReturnValue();
      -[GEOPDPlaceRequestParameters batchReverseGeocodingParameters](v19);
      v20 = (id *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 0;
      if (!v20)
        goto LABEL_10;
LABEL_4:
      -[GEOPDBatchReverseGeocodingParameters _readAssetLocations]((uint64_t)v20);
      for (i = objc_msgSend(v20[6], "count"); v22 < i; i = 0)
      {
        -[GEOPDBatchReverseGeocodingParameters assetLocations](v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "objectAtIndexedSubscript:", v22);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v25, "referenceFrame") == 2)
        {

          v18 = v41;
          goto LABEL_18;
        }
        objc_msgSend(v25, "latLng");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "coordinate");
        v27 = +[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:");

        if (v27)
          objc_msgSend(v21, "addIndex:", v22);

        ++v22;
        if (v20)
          goto LABEL_4;
LABEL_10:
        ;
      }
      if (!objc_msgSend(v21, "count"))
      {

        v13 = v40;
        v18 = v41;
        goto LABEL_15;
      }
      (*((void (**)(void))self->_locationShifter + 2))();
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      if (v28)
        v30 = v28;
      else
        v30 = objc_alloc_init(GEOLocationShifter);
      v31 = v30;

      v32 = (geo_isolater *)geo_isolater_create();
      shiftIsolation = self->_shiftIsolation;
      self->_shiftIsolation = v32;

      v34 = dispatch_group_create();
      v55[0] = 0;
      v55[1] = v55;
      v55[2] = 0x3032000000;
      v55[3] = __Block_byref_object_copy__18;
      v55[4] = __Block_byref_object_dispose__18;
      v56 = 0;
      v35 = MEMORY[0x1E0C809B0];
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke;
      v48[3] = &unk_1E1C06990;
      v49 = v20;
      v36 = v34;
      v50 = v36;
      v37 = v31;
      v51 = v37;
      v38 = v14;
      v52 = v38;
      v53 = self;
      v54 = v55;
      objc_msgSend(v21, "enumerateIndexesUsingBlock:", v48);
      global_queue = geo_get_global_queue();
      block[0] = v35;
      block[1] = 3221225472;
      block[2] = __118___GEOBatchReverseGeocodeRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke_6;
      block[3] = &unk_1E1C068F0;
      v47 = v55;
      v15 = v42;
      v45 = v42;
      block[4] = self;
      v44 = v38;
      v18 = v41;
      v46 = v41;
      dispatch_group_notify(v36, global_queue, block);

      _Block_object_dispose(v55, 8);
LABEL_18:

      v13 = v40;
    }
    else
    {
LABEL_15:
      -[_GEOBatchReverseGeocodeRequestTicket _submitRequest:auditToken:timeout:withHandler:networkActivity:](self, "_submitRequest:auditToken:timeout:withHandler:networkActivity:", self->super._request, v14, v15, v18, 0.0);
    }
  }

}

- (void)_submitRequest:(id)a3 auditToken:(id)a4 timeout:(double)a5 withHandler:(id)a6 networkActivity:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  GEOMapServiceTraits *traits;
  GEODataRequestThrottlerToken *throttlerToken;
  id v17;
  _QWORD v18[5];
  id v19;

  v11 = a6;
  v12 = a4;
  v13 = a3;
  +[GEOPlaceDataRequester sharedInstance](GEOPlaceDataRequester, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  traits = self->super.super.super._traits;
  throttlerToken = self->super.super.super._throttlerToken;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __102___GEOBatchReverseGeocodeRequestTicket__submitRequest_auditToken_timeout_withHandler_networkActivity___block_invoke;
  v18[3] = &unk_1E1C069B8;
  v18[4] = self;
  v19 = v11;
  v17 = v11;
  objc_msgSend(v14, "startWithRequest:traits:timeout:auditToken:throttleToken:completionHandler:", v13, traits, v12, throttlerToken, v18, a5);

}

- (void)_handleResponse:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  v8 = (void (**)(id, void *, _QWORD))a4;
  objc_msgSend(a3, "resultsWithResultType:", 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_geo_compactMap:", &__block_literal_global_626);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v8[2](v8, v6, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:reason:", -8, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v8)[2](v8, 0, v7);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftIsolation, 0);
  objc_storeStrong(&self->_locationShifter, 0);
}

@end
