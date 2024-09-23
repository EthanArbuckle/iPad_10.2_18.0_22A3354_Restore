@implementation _GEOComponentsTicket

- (_GEOComponentsTicket)initWithTraits:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GEOComponentsTicket;
  return -[GEOAbstractTicket initWithTraits:](&v4, sel_initWithTraits_, a3);
}

- (_GEOComponentsTicket)initWithComponents:(id)a3 identifier:(id)a4 resultProviderID:(int)a5 contentProvider:(id)a6 traits:(id)a7
{
  id v12;
  id v13;
  id v14;
  _GEOComponentsTicket *v15;
  uint64_t v16;
  NSDictionary *components;
  uint64_t v18;
  NSString *contentProvider;
  _GEOComponentsTicket *v20;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_GEOComponentsTicket;
  v15 = -[GEOAbstractTicket initWithTraits:](&v22, sel_initWithTraits_, a7);
  if (v15)
  {
    v16 = objc_msgSend(v12, "copy");
    components = v15->_components;
    v15->_components = (NSDictionary *)v16;

    objc_storeStrong((id *)&v15->_identifier, a4);
    v15->_resultProviderID = a5;
    v18 = objc_msgSend(v14, "copy");
    contentProvider = v15->_contentProvider;
    v15->_contentProvider = (NSString *)v18;

    v20 = v15;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)_GEOComponentsTicket;
  -[GEOAbstractTicket description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ identifier: %@ result provider id: %d components: %@ "), v4, self->_identifier, self->_resultProviderID, self->_components);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)submitWithHandler:(id)a3 auditToken:(id)a4 timeout:(int64_t)a5 networkActivity:(id)a6
{
  id v8;
  id v9;
  GEOPDPlaceRequest *v10;
  void *v11;
  GEOMapServiceTraits *traits;
  GEODataRequestThrottlerToken *throttlerToken;
  void *v14;
  id requestToken;
  _QWORD v16[5];
  id v17;

  v8 = a3;
  if (v8)
  {
    v9 = a4;
    v10 = -[GEOPDPlaceRequest initWithComponents:identifier:resultProviderID:traits:]([GEOPDPlaceRequest alloc], "initWithComponents:identifier:resultProviderID:traits:", self->_components, self->_identifier, self->_resultProviderID, self->super.super._traits);
    +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    traits = self->super.super._traits;
    throttlerToken = self->super.super._throttlerToken;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __77___GEOComponentsTicket_submitWithHandler_auditToken_timeout_networkActivity___block_invoke;
    v16[3] = &unk_1E1C069B8;
    v16[4] = self;
    v17 = v8;
    objc_msgSend(v11, "performPlaceDataRequest:traits:cachePolicy:timeout:auditToken:throttleToken:networkActivity:requesterHandler:", v10, traits, 4, v9, throttlerToken, 0, 0.0, v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    requestToken = self->_requestToken;
    self->_requestToken = v14;

  }
}

- ($C4D369C9F02205611300857CFD58F739)dataRequestKind
{
  int v2;
  $C4D369C9F02205611300857CFD58F739 v3;

  v2 = -[GEOMapServiceTraits requestPriority](self->super.super._traits, "requestPriority");
  v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000500;
  if (v2 != 1)
    v3 = ($C4D369C9F02205611300857CFD58F739)0x1700000300;
  if (v2 == 2)
    return ($C4D369C9F02205611300857CFD58F739)0x1700000700;
  else
    return v3;
}

- (void)cancel
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_GEOComponentsTicket;
  -[GEOAbstractTicket cancel](&v4, sel_cancel);
  +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", self->_requestToken);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_contentProvider, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_components, 0);
}

@end
