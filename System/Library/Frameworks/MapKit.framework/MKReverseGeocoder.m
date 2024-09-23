@implementation MKReverseGeocoder

- (MKReverseGeocoder)initWithCoordinate:(CLLocationCoordinate2D)coordinate
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  MKReverseGeocoder *v5;
  MKReverseGeocoderInternal *v6;
  MKReverseGeocoderInternal *internal;
  MKReverseGeocoderInternal *v8;
  objc_super v10;

  longitude = coordinate.longitude;
  latitude = coordinate.latitude;
  v10.receiver = self;
  v10.super_class = (Class)MKReverseGeocoder;
  v5 = -[MKReverseGeocoder init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(MKReverseGeocoderInternal);
    internal = v5->_internal;
    v5->_internal = v6;

    v8 = v5->_internal;
    v8->coordinate.latitude = latitude;
    v8->coordinate.longitude = longitude;
  }
  return v5;
}

- (id)delegate
{
  return self->_internal->delegate;
}

- (void)setDelegate:(id)delegate
{
  objc_storeStrong((id *)&self->_internal->delegate, delegate);
}

- (void)setCoordinate:(CLLocationCoordinate2D)a3
{
  self->_internal->coordinate = a3;
}

- (CLLocationCoordinate2D)coordinate
{
  MKReverseGeocoderInternal *internal;
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  internal = self->_internal;
  latitude = internal->coordinate.latitude;
  longitude = internal->coordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (MKPlacemark)placemark
{
  return -[MKMapItem placemark](self->_internal->mapItem, "placemark");
}

- (BOOL)isQuerying
{
  return self->_internal->querying;
}

- (void)_notifyError:(id)a3
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[MKReverseGeocoderDelegate reverseGeocoder:didFailWithError:](self->_internal->delegate, "reverseGeocoder:didFailWithError:", self, v4);

}

- (void)_notifyNoResults
{
  id v3;
  id v4;

  v3 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v4 = (id)objc_msgSend(v3, "initWithDomain:code:userInfo:", MKErrorDomain, 4, 0);
  -[MKReverseGeocoder _notifyError:](self, "_notifyError:", v4);

}

- (void)_notifyResult:(id)a3
{
  MKReverseGeocoderDelegate *delegate;
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    delegate = self->_internal->delegate;
    objc_msgSend(v6, "placemark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKReverseGeocoderDelegate reverseGeocoder:didFindPlacemark:](delegate, "reverseGeocoder:didFindPlacemark:", self, v5);

  }
}

- (void)start
{
  void *v3;
  uint64_t v4;
  MKReverseGeocoderInternal *internal;
  MKMapServiceTicket *ticket;
  MKMapServiceTicket *v7;
  _QWORD v8[5];

  if (!-[MKReverseGeocoder isQuerying](self, "isQuerying"))
  {
    +[MKMapService sharedService](MKMapService, "sharedService");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ticketForReverseGeocodeCoordinate:traits:", 0, self->_internal->coordinate.latitude, self->_internal->coordinate.longitude);
    v4 = objc_claimAutoreleasedReturnValue();
    internal = self->_internal;
    ticket = internal->ticket;
    internal->ticket = (MKMapServiceTicket *)v4;

    v7 = self->_internal->ticket;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __26__MKReverseGeocoder_start__block_invoke;
    v8[3] = &unk_1E20D8D68;
    v8[4] = self;
    -[MKMapServiceTicket submitWithHandler:networkActivity:](v7, "submitWithHandler:networkActivity:", v8, 0);
    self->_internal->querying = 1;
  }
}

void __26__MKReverseGeocoder_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a2;
  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = 0;
  if (v5
    || !objc_msgSend(v12, "count")
    && (objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", MKErrorDomain, 4, 0),
        (v5 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (objc_msgSend(v5, "code") != -2
      || (objc_msgSend(v5, "domain"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          GEOErrorDomain(),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v6, "isEqualToString:", v7),
          v7,
          v6,
          (v8 & 1) == 0))
    {
      objc_msgSend(*(id *)(a1 + 32), "_notifyError:", v5);
    }
  }
  else
  {
    objc_msgSend(v12, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v11 = *(void **)(v10 + 32);
    *(_QWORD *)(v10 + 32) = v9;

    objc_msgSend(*(id *)(a1 + 32), "_notifyResult:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32));
    v5 = 0;
  }

}

- (void)cancel
{
  -[MKMapServiceTicket cancel](self->_internal->ticket, "cancel");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

@end
