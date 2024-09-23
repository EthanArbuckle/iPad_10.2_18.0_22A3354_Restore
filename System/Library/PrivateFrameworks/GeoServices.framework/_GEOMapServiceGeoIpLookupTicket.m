@implementation _GEOMapServiceGeoIpLookupTicket

- (_GEOMapServiceGeoIpLookupTicket)initWithIpAddress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _GEOMapServiceGeoIpLookupTicket *v7;
  GEOPDPlaceRequest *v8;
  GEOPDPlaceRequest *placeRequest;
  objc_super v11;

  v4 = a3;
  +[GEOMapService sharedService](GEOMapService, "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultTraits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v11.receiver = self;
  v11.super_class = (Class)_GEOMapServiceGeoIpLookupTicket;
  v7 = -[GEOAbstractTicket initWithTraits:](&v11, sel_initWithTraits_, v6);
  if (v7)
  {
    v8 = -[GEOPDPlaceRequest initForGeoIpLookupWithIpAddress:traits:]([GEOPDPlaceRequest alloc], "initForGeoIpLookupWithIpAddress:traits:", v4, v6);
    placeRequest = v7->_placeRequest;
    v7->_placeRequest = v8;

  }
  return v7;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 networkActivity:(id)a5 handlerQueue:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  GEOPDPlaceRequest *placeRequest;
  GEOMapServiceTraits *traits;
  GEODataRequestThrottlerToken *throttlerToken;
  id v18;
  id v19;
  void *v20;
  id requestToken;
  _QWORD v22[5];
  id v23;
  id v24;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  placeRequest = self->_placeRequest;
  traits = self->super._traits;
  throttlerToken = self->super._throttlerToken;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __93___GEOMapServiceGeoIpLookupTicket_submitWithHandler_auditToken_networkActivity_handlerQueue___block_invoke;
  v22[3] = &unk_1E1C06BB8;
  v22[4] = self;
  v23 = v11;
  v24 = v10;
  v18 = v10;
  v19 = v11;
  objc_msgSend(v14, "performPlaceDataRequest:traits:cachePolicy:timeout:auditToken:throttleToken:networkActivity:requesterHandler:", placeRequest, traits, 1, v13, throttlerToken, v12, 0.0, v22);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  requestToken = self->_requestToken;
  self->_requestToken = v20;

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GEOMapServiceGeoIpLookupTicket;
  -[GEOAbstractTicket cancel](&v4, sel_cancel);
  +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_requestToken);

}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v3 = -[GEOMapServiceTraits requestPriority](self->super._traits, "requestPriority");
  v4 = 768;
  if (v3 == 1)
    v4 = 1280;
  if (v3 == 2)
    v5 = 1792;
  else
    v5 = v4;
  return ($C4D369C9F02205611300857CFD58F739)(v5 | (-[GEOPDPlaceRequest requestType](self->_placeRequest, "requestType") << 32));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_placeRequest, 0);
}

@end
