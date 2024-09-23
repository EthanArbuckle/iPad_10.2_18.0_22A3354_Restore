@implementation GeoIpLookupResult

- (GeoIpLookupResult)initWithGEOPDPlaceResponse:(id)a3
{
  id v4;
  GeoIpLookupResult *v5;
  id *v6;
  id *v7;
  uint64_t v8;
  NSString *ipAddress;
  uint64_t v10;
  NSString *timeZone;
  uint64_t v12;
  NSString *countryCode;
  void *v14;
  double v15;
  void *v16;
  double v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GeoIpLookupResult;
  v5 = -[GeoIpLookupResult init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "globalResult");
    v6 = (id *)objc_claimAutoreleasedReturnValue();
    -[GEOPDPlaceGlobalResult ipGeoLookupResult](v6);
    v7 = (id *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[GEOPDIpGeoLookupResult ipAddress](v7);
      v8 = objc_claimAutoreleasedReturnValue();
      ipAddress = v5->_ipAddress;
      v5->_ipAddress = (NSString *)v8;

      -[GEOPDIpGeoLookupResult timeZome](v7);
      v10 = objc_claimAutoreleasedReturnValue();
      timeZone = v5->_timeZone;
      v5->_timeZone = (NSString *)v10;

      -[GEOPDIpGeoLookupResult countryCode](v7);
      v12 = objc_claimAutoreleasedReturnValue();
      countryCode = v5->_countryCode;
      v5->_countryCode = (NSString *)v12;

      -[GEOPDIpGeoLookupResult location](v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lat");
      v5->_latLong.latitude = v15;

      -[GEOPDIpGeoLookupResult location](v7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lng");
      v5->_latLong.longitude = v17;

    }
  }

  return v5;
}

- (NSString)ipAddress
{
  return self->_ipAddress;
}

- (NSString)countryCode
{
  return self->_countryCode;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)latLong
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_latLong.latitude;
  longitude = self->_latLong.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (NSString)timeZone
{
  return self->_timeZone;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);
  objc_storeStrong((id *)&self->_ipAddress, 0);
}

@end
