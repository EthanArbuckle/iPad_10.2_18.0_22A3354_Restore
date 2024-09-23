@implementation GEOURLBackedMapItem

+ (BOOL)urlContainsExtraStorage:(id)a3
{
  id v3;
  GEOMapURLParser *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = -[GEOMapURLParser initWithURL:]([GEOMapURLParser alloc], "initWithURL:", v3);

  if (-[GEOMapURLParser parseIncludingCustomParameters:](v4, "parseIncludingCustomParameters:", 1))
  {
    -[GEOMapURLParser extraStorage](v4, "extraStorage");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (GEOURLBackedMapItem)init
{
  GEOURLBackedMapItem *result;

  result = (GEOURLBackedMapItem *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOURLBackedMapItem)initWithURL:(id)a3
{
  id v5;
  GEOMapURLParser *v6;
  GEOURLBackedMapItem *v7;
  GEOURLBackedMapItem *v8;
  uint64_t v9;
  GEOURLExtraStorage *extraStorage;
  uint64_t v11;
  GEOMuninViewState *muninViewState;
  double v13;
  double v14;
  uint64_t v15;
  NSString *name;
  uint64_t v17;
  GEOMapItemIdentifier *v18;
  GEOMapItemIdentifier *identifier;
  GEOFeatureStyleAttributes *v20;
  void *v21;
  uint64_t v22;
  GEOFeatureStyleAttributes *styleAttributes;
  void *v24;
  GEOAddress *v25;
  GEOAddress *geoAddress;
  uint64_t v27;
  GEOEnrichmentInfo *enrichmentInfo;
  GEOURLBackedMapItem *v29;
  objc_super v31;

  v5 = a3;
  if (v5 && +[GEOMapURLParser isValidMapURL:](GEOMapURLParser, "isValidMapURL:", v5))
  {
    v6 = -[GEOMapURLParser initWithURL:]([GEOMapURLParser alloc], "initWithURL:", v5);
    if (-[GEOMapURLParser parseIncludingCustomParameters:](v6, "parseIncludingCustomParameters:", 1))
    {
      v31.receiver = self;
      v31.super_class = (Class)GEOURLBackedMapItem;
      v7 = -[GEOURLBackedMapItem init](&v31, sel_init);
      v8 = v7;
      if (v7)
      {
        objc_storeStrong((id *)&v7->_url, a3);
        -[GEOMapURLParser extraStorage](v6, "extraStorage");
        v9 = objc_claimAutoreleasedReturnValue();
        extraStorage = v8->_extraStorage;
        v8->_extraStorage = (GEOURLExtraStorage *)v9;

        -[GEOMapURLParser muninViewState](v6, "muninViewState");
        v11 = objc_claimAutoreleasedReturnValue();
        muninViewState = v8->_muninViewState;
        v8->_muninViewState = (GEOMuninViewState *)v11;

        -[GEOMapURLParser centerCoordinate](v6, "centerCoordinate");
        if (v14 < -180.0 || v14 > 180.0 || v13 < -90.0 || v13 > 90.0)
          -[GEOMapURLParser searchCoordinate](v6, "searchCoordinate");
        v8->_coordinate.latitude = v13;
        v8->_coordinate.longitude = v14;
        -[GEOMapURLParser searchQuery](v6, "searchQuery");
        v15 = objc_claimAutoreleasedReturnValue();
        name = v8->_name;
        v8->_name = (NSString *)v15;

        v17 = -[GEOMapURLParser searchUID](v6, "searchUID");
        v8->_muid = v17;
        v8->_hasMUID = v17 != 0;
        v18 = -[GEOMapItemIdentifier initWithMUID:resultProviderID:coordinate:]([GEOMapItemIdentifier alloc], "initWithMUID:resultProviderID:coordinate:", v8->_muid, -[GEOMapURLParser searchProviderID](v6, "searchProviderID"), v8->_coordinate.latitude, v8->_coordinate.longitude);
        identifier = v8->_identifier;
        v8->_identifier = v18;

        if (-[GEOURLExtraStorage hasStyleAttributes](v8->_extraStorage, "hasStyleAttributes"))
        {
          v20 = [GEOFeatureStyleAttributes alloc];
          -[GEOURLExtraStorage styleAttributes](v8->_extraStorage, "styleAttributes");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = -[GEOFeatureStyleAttributes initWithGEOStyleAttributes:](v20, "initWithGEOStyleAttributes:", v21);
          styleAttributes = v8->_styleAttributes;
          v8->_styleAttributes = (GEOFeatureStyleAttributes *)v22;

        }
        -[GEOMapURLParser addressString](v6, "addressString");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v25 = objc_alloc_init(GEOAddress);
          -[GEOAddress addFormattedAddressLine:](v25, "addFormattedAddressLine:", v24);
          geoAddress = v8->_geoAddress;
          v8->_geoAddress = v25;

        }
        -[GEOMapURLParser enrichmentInfo](v6, "enrichmentInfo");
        v27 = objc_claimAutoreleasedReturnValue();
        enrichmentInfo = v8->_enrichmentInfo;
        v8->_enrichmentInfo = (GEOEnrichmentInfo *)v27;

      }
      self = v8;
      v29 = self;
    }
    else
    {
      v29 = 0;
    }

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (BOOL)isValid
{
  BOOL result;
  double longitude;
  double latitude;

  result = 0;
  longitude = self->_coordinate.longitude;
  if (longitude >= -180.0 && longitude <= 180.0)
  {
    latitude = self->_coordinate.latitude;
    if (latitude >= -90.0 && latitude <= 90.0)
      return -[NSString length](self->_name, "length") != 0;
  }
  return result;
}

- (int)referenceFrame
{
  -[GEOURLBackedMapItem coordinate](self, "coordinate");
  if (+[GEOLocationShifter isLocationShiftRequiredForCoordinate:](GEOLocationShifter, "isLocationShiftRequiredForCoordinate:"))
  {
    return 2;
  }
  else
  {
    return 1;
  }
}

- (BOOL)_hasResolvablePartialInformation
{
  return self->_muid != 0;
}

- (BOOL)_responseStatusIsIncomplete
{
  return 0;
}

- (id)mapItemStorageForGEOMapItem
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  -[NSURL absoluteString](self->_url, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setMapsURL:", v4);

  return v3;
}

- (BOOL)_hasTelephone
{
  return -[GEOURLExtraStorage hasPhoneNumber](self->_extraStorage, "hasPhoneNumber");
}

- (NSString)_telephone
{
  return -[GEOURLExtraStorage phoneNumber](self->_extraStorage, "phoneNumber");
}

- (NSString)_businessURL
{
  return -[GEOURLExtraStorage url](self->_extraStorage, "url");
}

- (GEOMapRegion)displayMapRegion
{
  return -[GEOURLExtraStorage mapRegion](self->_extraStorage, "mapRegion");
}

- (GEOFeatureStyleAttributes)_styleAttributes
{
  return self->_styleAttributes;
}

- (GEOMapItemIdentifier)_identifier
{
  return self->_identifier;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  double latitude;
  double longitude;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  latitude = self->_coordinate.latitude;
  longitude = self->_coordinate.longitude;
  result.var1 = longitude;
  result.var0 = latitude;
  return result;
}

- (unint64_t)_muid
{
  return self->_muid;
}

- (BOOL)_hasMUID
{
  return self->_hasMUID;
}

- (GEOAddress)geoAddress
{
  return self->_geoAddress;
}

- (NSString)name
{
  return self->_name;
}

- (GEOMuninViewState)_muninViewState
{
  return self->_muninViewState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrichmentInfo, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_geoAddress, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_styleAttributes, 0);
  objc_storeStrong((id *)&self->_muninViewState, 0);
  objc_storeStrong((id *)&self->_extraStorage, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end
