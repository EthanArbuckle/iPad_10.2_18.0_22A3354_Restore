@implementation _GEOPlaceComingledPhotoLookupTicket

- (_GEOPlaceComingledPhotoLookupTicket)initWithPhotoCategoryIdentifier:(id)a3 mapItemIdentifier:(id)a4 range:(_NSRange)a5 traits:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  void *v15;
  _GEOPlaceComingledPhotoLookupTicket *v16;
  _GEOPlaceComingledPhotoLookupTicket *v17;
  objc_super v19;

  length = a5.length;
  location = a5.location;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[GEOPDPlaceRequest comingledPhotoLookupRequestWithCategoryIdentifier:mapItemIdentifier:range:traits:](GEOPDPlaceRequest, "comingledPhotoLookupRequestWithCategoryIdentifier:mapItemIdentifier:range:traits:", v12, v13, location, length, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19.receiver = self;
  v19.super_class = (Class)_GEOPlaceComingledPhotoLookupTicket;
  v16 = -[GEOAbstractRequestResponseTicket initWithRequest:traits:](&v19, sel_initWithRequest_traits_, v15, v14);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->super._request, v15);
    objc_storeStrong((id *)&v17->_categoryIdentifier, a3);
    objc_storeStrong((id *)&v17->_mapItemIdentifier, a4);
    v17->_range.location = location;
    v17->_range.length = length;
    objc_storeStrong((id *)&v17->_traits, a6);
  }

  return v17;
}

- (void)submitWithHandler:(id)a3 networkActivity:(id)a4
{
  id v6;
  GEOMapItemIdentifier *v7;
  id v8;
  void *v9;
  GEOPDPlaceRequest *request;
  GEOMapServiceTraits *traits;
  double UInteger;
  GEOMapItemIdentifier *v13;
  id v14;
  void *v15;
  id requestToken;
  _QWORD v17[4];
  GEOMapItemIdentifier *v18;
  id v19;
  _NSRange range;

  v6 = a3;
  range = self->_range;
  v7 = self->_mapItemIdentifier;
  v8 = a4;
  +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  request = self->super._request;
  traits = self->_traits;
  UInteger = (double)(unint64_t)GEOConfigGetUInteger(GeoServicesConfig_PhotoLookupBatchRequestTimeout, (uint64_t)off_1EDF4E0B8);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __73___GEOPlaceComingledPhotoLookupTicket_submitWithHandler_networkActivity___block_invoke;
  v17[3] = &unk_1E1C06A88;
  v18 = v7;
  v19 = v6;
  v13 = v7;
  v14 = v6;
  objc_msgSend(v9, "performPlaceDataRequest:traits:cachePolicy:timeout:auditToken:throttleToken:networkActivity:requesterHandler:", request, traits, 4, 0, 0, v8, UInteger, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  requestToken = self->super._requestToken;
  self->super._requestToken = v15;

}

- (void)cancel
{
  void *v3;
  GEOPDPlaceRequest *request;

  if (self->super._request)
  {
    +[GEOPlaceCardRequester sharedRequester](GEOPlaceCardRequester, "sharedRequester");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelRequest:", self->super._requestToken);

    request = self->super._request;
    self->super._request = 0;

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_mapItemIdentifier, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end
