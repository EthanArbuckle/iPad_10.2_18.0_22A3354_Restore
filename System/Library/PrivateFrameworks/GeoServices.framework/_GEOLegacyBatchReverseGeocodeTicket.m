@implementation _GEOLegacyBatchReverseGeocodeTicket

- (_GEOLegacyBatchReverseGeocodeTicket)initWithBatchReverseGeocodeRequest:(id)a3 locationShifter:(id)a4 traits:(id)a5
{
  id v9;
  id v10;
  _GEOLegacyBatchReverseGeocodeTicket *v11;
  _GEOLegacyBatchReverseGeocodeTicket *v12;
  uint64_t v13;
  id locationShifter;
  _GEOLegacyBatchReverseGeocodeTicket *v15;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_GEOLegacyBatchReverseGeocodeTicket;
  v11 = -[GEOAbstractTicket initWithTraits:](&v17, sel_initWithTraits_, a5);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_batchReverseGeocodeRequest, a3);
    v13 = objc_msgSend(v10, "copy");
    locationShifter = v12->_locationShifter;
    v12->_locationShifter = (id)v13;

    v15 = v12;
  }

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_GEOLegacyBatchReverseGeocodeTicket;
  -[GEOAbstractTicket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOBatchRevGeocodeRequest formattedText](self->_batchReverseGeocodeRequest, "formattedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ Request: %@ "), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GEOLegacyBatchReverseGeocodeTicket;
  -[GEOAbstractTicket cancel](&v4, sel_cancel);
  +[GEOGeocodeRequester sharedGeocodeRequester](GEOGeocodeRequester, "sharedGeocodeRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelBatchReverseGeocode:", self->_batchReverseGeocodeRequest);

}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *global_queue;
  NSObject *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  id obj;
  _GEOLegacyBatchReverseGeocodeTicket *v37;
  _QWORD block[5];
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  _QWORD v44[4];
  NSObject *v45;
  _QWORD *v46;
  _QWORD v47[5];
  NSObject *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _QWORD v53[5];
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v35 = a4;
  v10 = a6;
  v11 = v10;
  v34 = v9;
  if (!v9)
    goto LABEL_24;
  if (!self->_locationShifter)
  {
LABEL_23:
    v31 = v11;
    -[_GEOLegacyBatchReverseGeocodeTicket _batchReverseGeocodeWithRequest:auditToken:handler:networkActivity:](self, "_batchReverseGeocodeWithRequest:auditToken:handler:networkActivity:", self->_batchReverseGeocodeRequest, v35, v34, v11);
    v11 = v31;
    goto LABEL_24;
  }
  v32 = v10;
  v37 = self;
  v33 = (void *)-[GEOBatchRevGeocodeRequest copy](self->_batchReverseGeocodeRequest, "copy");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  objc_msgSend(v33, "locations");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v56 != v15)
          objc_enumerationMutation(v13);
        v17 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        if (objc_msgSend(v17, "referenceFrame") != 2)
        {
          objc_msgSend(v17, "coordinate");
          if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
          {
            objc_msgSend(v12, "addObject:", v17);
          }
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    }
    while (v14);
  }

  if (!objc_msgSend(v12, "count"))
  {

    v11 = v32;
    self = v37;
    goto LABEL_23;
  }
  v18 = dispatch_group_create();
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x3032000000;
  v53[3] = __Block_byref_object_copy__30;
  v53[4] = __Block_byref_object_dispose__30;
  v54 = 0;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  obj = v12;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  v20 = MEMORY[0x1E0C809B0];
  if (v19)
  {
    v21 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v50 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * j);
        dispatch_group_enter(v18);
        (*((void (**)(void))v37->_locationShifter + 2))();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "latLng");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "horizontalAccuracy");
        v27 = v26;
        v47[0] = v20;
        v47[1] = 3221225472;
        v47[2] = __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
        v47[3] = &unk_1E1C05F08;
        v47[4] = v23;
        v48 = v18;
        v44[0] = v20;
        v44[1] = 3221225472;
        v44[2] = __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2;
        v44[3] = &unk_1E1C07E58;
        v46 = v53;
        v45 = v48;
        global_queue = (void *)geo_get_global_queue();
        objc_msgSend(v24, "shiftLatLng:accuracy:withCompletionHandler:mustGoToNetworkCallback:errorHandler:callbackQueue:", v25, v47, 0, v44, global_queue, v27);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v19);
  }

  v29 = geo_get_global_queue();
  block[0] = v20;
  block[1] = 3221225472;
  block[2] = __92___GEOLegacyBatchReverseGeocodeTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_3;
  block[3] = &unk_1E1C07E80;
  v43 = v53;
  v41 = v34;
  block[4] = v37;
  v39 = v33;
  v40 = v35;
  v42 = v32;
  v30 = v33;
  dispatch_group_notify(v18, v29, block);

  _Block_object_dispose(v53, 8);
  v11 = v32;
LABEL_24:

}

- (void)_batchReverseGeocodeWithRequest:(id)a3 auditToken:(id)a4 handler:(id)a5 networkActivity:(id)a6
{
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;

  v10 = a5;
  v11 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __106___GEOLegacyBatchReverseGeocodeTicket__batchReverseGeocodeWithRequest_auditToken_handler_networkActivity___block_invoke;
  v21[3] = &unk_1E1C07EA8;
  v21[4] = self;
  v12 = v10;
  v22 = v12;
  v13 = a6;
  v14 = a4;
  v15 = a3;
  v16 = (void *)MEMORY[0x18D765024](v21);
  +[GEOGeocodeRequester sharedGeocodeRequester](GEOGeocodeRequester, "sharedGeocodeRequester");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v11;
  v19[1] = 3221225472;
  v19[2] = __106___GEOLegacyBatchReverseGeocodeTicket__batchReverseGeocodeWithRequest_auditToken_handler_networkActivity___block_invoke_2;
  v19[3] = &unk_1E1C03638;
  v20 = v12;
  v18 = v12;
  objc_msgSend(v17, "batchReverseGeocode:auditToken:success:networkActivity:error:", v15, v14, v16, v13, v19);

}

- (BOOL)isEqualForHistoryToTicket:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_locationShifter, 0);
  objc_storeStrong((id *)&self->_batchReverseGeocodeRequest, 0);
}

@end
