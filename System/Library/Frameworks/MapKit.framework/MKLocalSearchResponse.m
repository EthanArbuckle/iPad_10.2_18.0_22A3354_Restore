@implementation MKLocalSearchResponse

- (id)_initWithMapItems:(id)a3 boundingRegion:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  char *v11;
  objc_super v13;
  MKMapRect v14;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MKLocalSearchResponse;
  v8 = -[MKLocalSearchResponse init](&v13, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    v10 = (void *)*((_QWORD *)v8 + 1);
    *((_QWORD *)v8 + 1) = v9;

    if (v7)
    {
      GEOMapRectForMapRegion();
      *(MKCoordinateRegion *)(v8 + 16) = MKCoordinateRegionForMapRect(v14);
    }
    v11 = v8;
  }

  return v8;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  CLLocationDegrees latitude;
  CLLocationDegrees longitude;
  double latitudeDelta;
  double longitudeDelta;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", self->_mapItems, CFSTR("mapItems"));
  latitude = self->_boundingRegion.center.latitude;
  longitude = self->_boundingRegion.center.longitude;
  latitudeDelta = self->_boundingRegion.span.latitudeDelta;
  longitudeDelta = self->_boundingRegion.span.longitudeDelta;
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%+.8f, %+.8f"), *(_QWORD *)&latitude, *(_QWORD *)&longitude);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("<center:%@ span:%+.8f, %+.8f>"), v9, *(_QWORD *)&latitudeDelta, *(_QWORD *)&longitudeDelta);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("boundingRegion"));
  return v3;
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
  v8.super_class = (Class)MKLocalSearchResponse;
  -[MKLocalSearchResponse description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLocalSearchResponse _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSArray)mapItems
{
  return self->_mapItems;
}

- (MKCoordinateRegion)boundingRegion
{
  double latitude;
  double longitude;
  double latitudeDelta;
  double longitudeDelta;
  MKCoordinateRegion result;

  latitude = self->_boundingRegion.center.latitude;
  longitude = self->_boundingRegion.center.longitude;
  latitudeDelta = self->_boundingRegion.span.latitudeDelta;
  longitudeDelta = self->_boundingRegion.span.longitudeDelta;
  result.span.longitudeDelta = longitudeDelta;
  result.span.latitudeDelta = latitudeDelta;
  result.center.longitude = longitude;
  result.center.latitude = latitude;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItems, 0);
}

@end
