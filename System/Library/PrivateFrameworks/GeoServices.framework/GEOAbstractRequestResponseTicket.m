@implementation GEOAbstractRequestResponseTicket

- (GEOAbstractRequestResponseTicket)initWithTraits:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEOAbstractRequestResponseTicket;
  return -[GEOAbstractTicket initWithTraits:](&v4, sel_initWithTraits_, a3);
}

- (GEOAbstractRequestResponseTicket)initWithRequest:(id)a3 traits:(id)a4
{
  id v7;
  GEOAbstractRequestResponseTicket *v8;
  GEOAbstractRequestResponseTicket *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOAbstractRequestResponseTicket;
  v8 = -[GEOAbstractTicket initWithTraits:](&v11, sel_initWithTraits_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_request, a3);

  return v9;
}

- (void)performSubmitWithHandler:(id)a3 timeout:(double)a4 networkActivity:(id)a5
{
  -[GEOAbstractRequestResponseTicket performSubmitWithHandler:auditToken:timeout:networkActivity:](self, "performSubmitWithHandler:auditToken:timeout:networkActivity:", a3, 0, a5, a4);
}

- (void)performSubmitWithHandler:(id)a3 auditToken:(id)a4 timeout:(double)a5 networkActivity:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  GEOPDPlaceRequest *request;
  GEOMapServiceTraits *traits;
  unint64_t cachePolicy;
  GEODataRequestThrottlerToken *throttlerToken;
  void *v18;
  id requestToken;
  _QWORD v20[5];
  id v21;

  v10 = a3;
  if (v10)
  {
    v11 = a6;
    v12 = a4;
    +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    request = self->_request;
    traits = self->super._traits;
    cachePolicy = self->super._cachePolicy;
    throttlerToken = self->super._throttlerToken;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __96__GEOAbstractRequestResponseTicket_performSubmitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v20[3] = &unk_1E1C069B8;
    v20[4] = self;
    v21 = v10;
    objc_msgSend(v13, "performPlaceDataRequest:traits:cachePolicy:timeout:auditToken:throttleToken:networkActivity:requesterHandler:", request, traits, cachePolicy, v12, throttlerToken, v11, a5, v20);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    requestToken = self->_requestToken;
    self->_requestToken = v18;

  }
}

void __96__GEOAbstractRequestResponseTicket_performSubmitWithHandler_auditToken_timeout_networkActivity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;

  v7 = a2;
  v6 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isCancelled") & 1) == 0)
  {
    if (!v6)
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 56), a2);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GEOAbstractRequestResponseTicket;
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
  return ($C4D369C9F02205611300857CFD58F739)(v5 | (-[GEOPDPlaceRequest requestType](self->_request, "requestType") << 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong(&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end
