@implementation _GEOPlaceRequestTicket

- (void)submitWithRefinedHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  void (**v20)(_QWORD);
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  int64_t v25;
  _QWORD v26[5];
  id v27;
  id v28;
  id v29;
  int64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (v10)
  {
    v13 = MEMORY[0x1E0C809B0];
    if (self->_retryRequestForErrorBlock)
    {
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke;
      v26[3] = &unk_1E1C06698;
      v26[4] = self;
      v28 = (id)MEMORY[0x18D765024](v10);
      v27 = v11;
      v30 = a5;
      v29 = v12;
      v14 = v28;
      v15 = (void *)MEMORY[0x18D765024](v26);
      v16 = MEMORY[0x18D765024]();

      v10 = (id)v16;
    }
    v21[0] = v13;
    v21[1] = 3221225472;
    v21[2] = __86___GEOPlaceRequestTicket_submitWithRefinedHandler_auditToken_timeout_networkActivity___block_invoke_2;
    v21[3] = &unk_1E1C06670;
    v21[4] = self;
    v22 = v11;
    v25 = a5;
    v17 = v10;
    v23 = v17;
    v24 = v12;
    v18 = (void (**)(_QWORD))MEMORY[0x18D765024](v21);
    v19 = v18;
    if (self->_preSubmitUpdateRequestBlock)
    {
      v20 = v18;
      geo_dispatch_async_qos();

    }
    else
    {
      v18[2](v18);
    }

  }
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void (**v20)(_QWORD);
  void *v21;
  int v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void (**v27)(_QWORD);
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  int64_t v32;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  int64_t v37;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = MEMORY[0x1E0C809B0];
  if (self->_retryRequestForErrorBlock)
  {
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v33[3] = &unk_1E1C06648;
    v33[4] = self;
    v35 = (id)MEMORY[0x18D765024](v10);
    v34 = v11;
    v37 = a5;
    v36 = v12;
    v14 = v35;
    v15 = (void *)MEMORY[0x18D765024](v33);
    v16 = MEMORY[0x18D765024]();

    v10 = (id)v16;
  }
  v28[0] = v13;
  v28[1] = 3221225472;
  v28[2] = __79___GEOPlaceRequestTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke_2;
  v28[3] = &unk_1E1C06670;
  v28[4] = self;
  v17 = v11;
  v29 = v17;
  v32 = a5;
  v18 = v10;
  v30 = v18;
  v19 = v12;
  v31 = v19;
  v20 = (void (**)(_QWORD))MEMORY[0x18D765024](v28);
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest"));

  if (v22)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequestBEGIN"), 0);

  }
  +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparing"));

  if (v25)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequest_RequestPreparingBEGIN"), 0);

  }
  if (self->_preSubmitUpdateRequestBlock)
  {
    v27 = v20;
    geo_dispatch_async_qos();

  }
  else
  {
    v20[2](v20);
  }

}

- (void)_processRequest:(id)a3 auditToken:(id)a4 timeout:(double)a5 withHandler:(id)a6 refinedHandler:(id)a7 networkActivity:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  GEOMapItemInitialRequestData *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  unint64_t cachePolicy;
  GEOMapServiceTraits *traits;
  GEODataRequestThrottlerToken *throttlerToken;
  GEOMapItemInitialRequestData *v31;
  id v32;
  GEOMapServiceTraits *v33;
  void *v34;
  id requestToken;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  _QWORD v40[5];
  GEOMapItemInitialRequestData *v41;
  id v42;
  id v43;
  id v44;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  if (v16)
  {
    v19 = objc_msgSend(v14, "requestType");
    v20 = 6;
    v21 = 5;
    if (v19 != 32)
      v21 = 0;
    if (v19 != 49)
      v20 = v21;
    if (v19 == 6)
      v22 = 4;
    else
      v22 = v20;
    if ((_dispatcherSupportsService(v22) & 1) != 0)
    {
      v38 = v15;
      v39 = v17;
      if (((objc_msgSend(v14, "requestType") - 2) & 0xFFFFFFFD) != 0)
      {
        v23 = 0;
      }
      else
      {
        v23 = objc_alloc_init(GEOMapItemInitialRequestData);
        -[GEOMapItemInitialRequestData setRequestType:](v23, "setRequestType:", objc_msgSend(v14, "requestType"));
        objc_msgSend(v14, "placeRequestParameters");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)objc_msgSend(v25, "copy");
        -[GEOMapItemInitialRequestData setPlaceRequestParameters:](v23, "setPlaceRequestParameters:", v26);

      }
      +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      traits = self->super.super._traits;
      cachePolicy = self->super.super._cachePolicy;
      throttlerToken = self->super.super._throttlerToken;
      v40[0] = MEMORY[0x1E0C809B0];
      v40[1] = 3221225472;
      v40[2] = __104___GEOPlaceRequestTicket__processRequest_auditToken_timeout_withHandler_refinedHandler_networkActivity___block_invoke;
      v40[3] = &unk_1E1C06620;
      v40[4] = self;
      v43 = v16;
      v31 = v23;
      v41 = v31;
      v32 = v14;
      v42 = v32;
      v44 = v39;
      v33 = traits;
      v15 = v38;
      objc_msgSend(v27, "performPlaceDataRequest:traits:cachePolicy:timeout:auditToken:throttleToken:networkActivity:requesterHandler:", v32, v33, cachePolicy, v38, throttlerToken, v18, a5, v40);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      requestToken = self->_requestToken;
      self->_requestToken = v34;

      +[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(throttlerToken) = objc_msgSend(v36, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_PlaceRequestTicket_PlaceDataRequest"));

      if ((_DWORD)throttlerToken)
      {
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "postNotificationName:object:", CFSTR("GEOPPTTest_PlaceRequestTicket_PlaceDataRequestBEGIN"), v32);

      }
      v17 = v39;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "GEOErrorWithCode:", -6);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v24);

    }
  }

}

- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4 mapItemToRefine:(id)a5 preSubmitUpdateRequestBlock:(id)a6 retryForErrorBlock:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _GEOPlaceRequestTicket *v17;
  _GEOPlaceRequestTicket *v18;
  uint64_t v19;
  id preSubmitUpdateRequestBlock;
  uint64_t v21;
  id retryRequestForErrorBlock;
  _GEOPlaceRequestTicket *v23;
  objc_super v25;

  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)_GEOPlaceRequestTicket;
  v17 = -[GEOAbstractTicket initWithTraits:](&v25, sel_initWithTraits_, a4);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_request, a3);
    objc_storeStrong((id *)&v18->_mapItemToRefine, a5);
    v19 = MEMORY[0x18D765024](v15);
    preSubmitUpdateRequestBlock = v18->_preSubmitUpdateRequestBlock;
    v18->_preSubmitUpdateRequestBlock = (id)v19;

    v21 = MEMORY[0x18D765024](v16);
    retryRequestForErrorBlock = v18->_retryRequestForErrorBlock;
    v18->_retryRequestForErrorBlock = (id)v21;

    v23 = v18;
  }

  return v18;
}

- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4
{
  return -[_GEOPlaceRequestTicket initWithRequest:traits:mapItemToRefine:preSubmitUpdateRequestBlock:retryForErrorBlock:](self, "initWithRequest:traits:mapItemToRefine:preSubmitUpdateRequestBlock:retryForErrorBlock:", a3, a4, 0, 0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryRequestForErrorBlock, 0);
  objc_storeStrong(&self->_preSubmitUpdateRequestBlock, 0);
  objc_storeStrong((id *)&self->_mapItemToRefine, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (_GEOPlaceRequestTicket)initWithTraits:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GEOPlaceRequestTicket;
  return -[GEOAbstractTicket initWithTraits:](&v4, sel_initWithTraits_, a3);
}

- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4 preSubmitUpdateRequestBlock:(id)a5 retryForErrorBlock:(id)a6
{
  return -[_GEOPlaceRequestTicket initWithRequest:traits:mapItemToRefine:preSubmitUpdateRequestBlock:retryForErrorBlock:](self, "initWithRequest:traits:mapItemToRefine:preSubmitUpdateRequestBlock:retryForErrorBlock:", a3, a4, 0, a5, a6);
}

- (_GEOPlaceRequestTicket)initWithRequest:(id)a3 traits:(id)a4 mapItemToRefine:(id)a5
{
  return -[_GEOPlaceRequestTicket initWithRequest:traits:mapItemToRefine:preSubmitUpdateRequestBlock:retryForErrorBlock:](self, "initWithRequest:traits:mapItemToRefine:preSubmitUpdateRequestBlock:retryForErrorBlock:", a3, a4, a5, 0, 0);
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
  v8.super_class = (Class)_GEOPlaceRequestTicket;
  -[GEOAbstractTicket description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDPlaceRequest formattedText](self->_request, "formattedText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ request: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GEOPlaceRequestTicket;
  -[GEOAbstractTicket cancel](&v4, sel_cancel);
  +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_requestToken);

}

- (void)applyToCorrectedSearch:(id)a3
{
  GEOPDPlaceRequest *request;
  id v5;

  request = self->_request;
  v5 = a3;
  objc_msgSend(v5, "setPlaceRequest:", request);
  objc_msgSend(v5, "setPlaceResponse:", self->_response);

}

- (void)applyToPlaceInfo:(id)a3
{
  GEOPDPlaceRequest *request;
  id v5;

  request = self->_request;
  v5 = a3;
  objc_msgSend(v5, "setPlaceRequest:", request);
  objc_msgSend(v5, "setPlaceResponse:", self->_response);

}

- (id)resultSectionHeader
{
  id *v3;
  id *v4;
  void *v5;

  if (-[GEOPDPlaceResponse requestType](self->_response, "requestType") == 13)
  {
    -[GEOPDPlaceResponse globalResult](self->_response, "globalResult");
    v3 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult popularNearbySearchResult](v3);
    v4 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPopularNearbySearchResult sectionHeader](v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v3;
  GEOPDPlaceRequest **p_request;
  uint64_t v5;

  v3 = -[GEOMapServiceTraits requestPriority](self->super.super._traits, "requestPriority");
  if (v3 == 2)
  {
    p_request = &self->_request;
    v5 = 1792;
  }
  else
  {
    if (v3 == 1)
    {
      p_request = &self->_request;
LABEL_8:
      v5 = 1280;
      return ($C4D369C9F02205611300857CFD58F739)(v5 | (-[GEOPDPlaceRequest requestType](*p_request, "requestType") << 32));
    }
    p_request = &self->_request;
    if (-[GEOPDPlaceRequest requestType](self->_request, "requestType") == 32
      && !-[GEOMapServiceTraits hasRequestPriority](self->super.super._traits, "hasRequestPriority"))
    {
      goto LABEL_8;
    }
    v5 = 768;
  }
  return ($C4D369C9F02205611300857CFD58F739)(v5 | (-[GEOPDPlaceRequest requestType](*p_request, "requestType") << 32));
}

- (id)geoMapItemIdentifier:(id)a3
{
  id v3;
  GEOMapItemIdentifier *v4;

  v3 = a3;
  v4 = -[GEOMapItemIdentifier initWithMapsIdentifier:]([GEOMapItemIdentifier alloc], "initWithMapsIdentifier:", v3);

  return v4;
}

@end
